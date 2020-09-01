//publisher cluster1 on port 8888

create database test3;
CREATE DATABASE

create extension pglogical;
CREATE EXTENSION

create table produc(id int primary key,name text,price decimal);
CREATE TABLE

SELECT pglogical.create_node( node_name := 'provider3',dsn := 'host=localhost port=8888 dbname=test3');
create_node

SELECT pglogical.replication_set_add_table(set_name := 'default', relation :='produc', synchronize_data := true);
replication_set_add_table

INSERT INTO produc VALUES(1,'chokii',35.58);
INSERT 0 1

INSERT INTO produc VALUES(2,'blackforest',1650.75);
INSERT 0 1

INSERT INTO produc VALUES(3,'cake',578.32);
INSERT 0 1

INSERT INTO produc VALUES(4,'dairymilk',257.43);
INSERT 0 1

INSERT INTO produc VALUES(5,'icecream',136.67);
INSERT 0 1

SELECT * FROM produc;



//Subscriber cluster2 on port 9999
 
create database test3;
CREATE DATABASE

create extension pglogical;
CREATE EXTENSION

create table produc(id int primary key,name text,price decimal);
CREATE TABLE

SELECT pglogical.create_node(node_name := 'subscriber3',dsn := 'host=localhost port=9999 dbname=test3');
create_node

SELECT pglogical.create_subscription( subscription_name := 'sub3',provider_dsn := 'host=localhost port=8888 dbna
me=test3');
create_subscription

SELECT * FROM produc;


INSERT INTO prodoc VALUES(6,'milkshake',106.6);
INSERT 0 1


INSERT INTO prodoc VALUES(6,'milkshake',106.6);
INSERT 0 1

SELECT * FROM produc;