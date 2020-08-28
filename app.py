from flask import Flask, render_template, url_for, redirect, request
from cassandra.cluster import Cluster
from flask import flash
app = Flask(__name__)


@app.route('/about')
def about():
    return render_template("AboutUs.html")


@app.route('/contacts')
def contacts():
    return render_template("Contacts.html")


@app.route('/')
def home():
    return render_template("home.html")


@app.route('/search_result')
def search_result():
    return render_template("search_result.html")


@app.route('/shopping')
def shopping():
    return render_template("Shopping.html")


@app.route('/watches', methods=['GET', 'POST'])
def watches():
    cluster = Cluster(['172.16.116.135', '172.16.116.136'])
    session = cluster.connect('ecommercedb')
    query = 'Select * from available_products_w'
    products = session.execute(query)
    product_list = list(products)
    # print(product_list)

    if request.method == "POST":
        id_remove = request.form["id_remove"]
        # id_remove = int(id_remove)
        query2='Update AVAILABLE_PRODUCTS_W set quantity = 0 where product_id=' + id_remove
        session.execute(query2)
        # print(query)
        return render_template("watches_result.html")

    return render_template("watches.html", product_list=product_list)


@app.route('/bags', methods=['GET', 'POST'])
def bags():
    cluster = Cluster(['172.16.116.135', '172.16.116.136'])
    session = cluster.connect('ecommercedb')
    query = 'Select * from available_products_b'
    products = session.execute(query)
    product_list = list(products)
    #print(product_list)

    if request.method == "POST":
        id_remove = request.form["id_remove"]
        #id_remove = int(id_remove)
        query2='Update AVAILABLE_PRODUCTS_B set quantity = 0 where product_id=' + id_remove
        session.execute(query2)
        # print(query)
        return render_template("watches_result.html")

    return render_template("bags.html", product_list=product_list)


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    error=None
    if request.method == "POST":
        username = request.form["username"]
        User_id = request.form["user_id"]
        inputPassword = request.form["password"]
        if username != " " and User_id != " " and inputPassword != " ":
            cluster = Cluster(['172.16.116.135', '172.16.116.136'])
            session=cluster.connect('ecommercedb')
            session.execute("INSERT INTO USERS (user_id, user_name, password) VALUES(102, 'admin', 'admin')")
            query="INSERT INTO USERS (user_id, user_name, password) VALUES("+User_id+",'"+username+"'"+",'"+inputPassword+"')"
            print(query)
            session.execute(query)
            print("finished")
            return redirect(url_for('logout'))
        else:
            error = 'Invalid Credentials. Please try again.'
    return render_template('Signup.html', error=error)


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != 'admin' or request.form['password'] != 'admin':
            error = 'Invalid Credentials. Please try again.'
        else:
            return redirect(url_for('logout'))
    return render_template('login.html', error=error)


@app.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == "POST":
        bsearch = request.form["brand_search"]
        cluster = Cluster(['172.16.116.135', '172.16.116.136'])
        session = cluster.connect('ecommercedb')
        if bsearch != "":
            query='select * from PRODUCT_CAT_BY_BRAND where brand_name ='+"'"+bsearch+"'"
           # print(query)
            rows= session.execute(query)
            row_list = list(rows)
            return render_template("search_result.html", row_list=row_list)
        else:
            query = 'select * from PRODUCT_CAT_BY_BRAND'
            # print(query)
            rows = session.execute(query)
            row_list = list(rows)
            return render_template("search_result.html", row_list=row_list)
    return render_template("search.html")


@app.route('/logout')
def logout():
    return render_template("logout.html")


def purchase():
    flash("This is a flashed message.")
    print("Moving Forward...")


if __name__ == '__main__':
    app.run(debug=True)

