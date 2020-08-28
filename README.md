# Cassandra-NoSQL-project

This project consists of Ecommerce web application to explore core features of Cassandra NoSQL database
Cassandra is hosted on a multi-node cluster to achieve distributed and decentralized database functionality for fault tolerance.

### Distributed cluster setup ###
Update the cassandra.yaml (configuration file of Apache Cassandra) in the following manner for all the nodes present in the cluster.
- cluster_name : ’ECluster’
- seeds: [seed node ip address]
- listen_address : [local machine ip address]
- rpc_address : [local machine ip address]
- endpoint_snitch : GossipingPropertyFileSnitch
- auto_bootstrap:false //This is inserted into the cassandra.yaml configuration file of only the seed node.

After making the above changes, both the nodes should have ports 7000 and 9042 opened for each other’s ip address for Cassan- dra to communicate over tcp and form a ring of nodes.
  
The application is designed using Python's Flask and queries the database for search, lookup, update, delete, etc. using Cassandra Query Language(CQL). Running app.py directs to the homepage of the application through which other pages can be navigated.

### Screenshots of the application ###

![](https://github.com/aishwaryasontakke/1-D-classifier/blob/master/Mixed%20variance%20vs%20Age.png?raw=true)
