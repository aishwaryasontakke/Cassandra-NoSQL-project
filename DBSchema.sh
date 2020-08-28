CREATE KEYSPACE ecommercedb WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '3'}  AND durable_writes = true;

describe keyspaces;

use ecommercedb ;

Create table BRAND(brand_id int PRIMARY KEY, brand_name text);
Insert into BRAND(brand_id, brand_name) values (101, 'H&M');
Insert into BRAND(brand_id, brand_name) values (102, 'Aeropostale');
Insert into BRAND(brand_id, brand_name) values (103, 'Dell');
Insert into BRAND(brand_id, brand_name) values (104, 'Lenovo');
Insert into BRAND(brand_id, brand_name) values (105, 'Adidas');
Insert into BRAND(brand_id, brand_name) values (106, 'Nike');
Insert into BRAND(brand_id, brand_name) values (107, 'Guess');
Insert into BRAND(brand_id, brand_name) values (108, 'Michael Kors');
Insert into BRAND(brand_id, brand_name) values (109, 'Movado');
Insert into BRAND(brand_id, brand_name) values (110, 'Rolex');

Create columnfamily PRODUCT_CATEGORY(category_id int PRIMARY KEY, category_name text);
Insert into product_category (category_id, category_name) values (201, 'Clothing');
Insert into product_category (category_id, category_name) values (202, 'Shoes');
Insert into product_category (category_id, category_name) values (203, 'Electronics');
Insert into product_category (category_id, category_name) values (204, 'Watches');
Insert into product_category (category_id, category_name) values (205, 'Bags');

Create columnfamily PRODUCT_CAT_BY_BRAND(brand_name text, category_id int, product_category text, PRIMARY KEY(brand_name, category_id));
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('H&M', 201, 'Clothing');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Aeropostale', 201, 'Clothing');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Guess', 205, 'Bags');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Michael Kors', 205, 'Bags');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Movado', 204, 'Watches');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Rolex', 204, 'Watches');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Dell', 203, 'Electronics');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Lenovo', 203, 'Electronics');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Adidas', 204, 'Shoes');
Insert into product_cat_by_brand (brand_name, category_id, product_category) values ('Nike', 204, 'Shoes');

Create columnfamily AVAILABLE_PRODUCTS_W(category_id int, product_id int PRIMARY KEY, product_name text, quantity int);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 301, 'Watch1', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 302, 'Watch2', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 303, 'Watch3', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 304, 'Watch4', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 305, 'Watch5', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 306, 'Watch6', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 307, 'Watch7', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 308, 'Watch8', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 309, 'Watch9', 1);
Insert into AVAILABLE_PRODUCTS_W(category_id, product_id, product_name, quantity) values (204, 310, 'Watch10', 1);

Create columnfamily AVAILABLE_PRODUCTS_B(category_id int, product_id int PRIMARY KEY, product_name text, quantity int);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 311, 'Bag1', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 312, 'Bag2', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 313, 'Bag3', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 314, 'Bag4', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 315, 'Bag5', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 316, 'Bag6', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 317, 'Bag7', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 318, 'Bag8', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 319, 'Bag9', 1);
Insert into AVAILABLE_PRODUCTS_B(category_id, product_id, product_name, quantity) values (205, 320, 'Bag10', 1);

Create columnfamily USERS(user_id int PRIMARY KEY, user_name text, password text);
