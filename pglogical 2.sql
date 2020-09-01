//publisher cluster1 on port 8888

create database test1;
CREATE DATABASE

create extension pglogical;
CREATE EXTENSION

create table emp(id serial primary key,name text,location text);
CREATE TABLE

SELECT pglogical.create_node( node_name := 'provider1',dsn := 'host=localhost port=8888 dbname=test1');
create_node

SELECT pglogical.replication_set_add_table(set_name := 'default', relation :='emp', synchronize_data := true, co
lumns :='{id,name}', row_filter := 'id<5');
replication_set_add_table

INSERT INTO emp VALUES(1,'Arun','trichy');
INSERT 0 1

INSERT INTO emp VALUES(2,'manoj','thiruverambur');
INSERT 0 1

INSERT INTO emp VALUES(3,'sathiya','madurai');
INSERT 0 1

INSERT INTO emp VALUES(4,'inigo','chennai');
INSERT 0 1

INSERT INTO emp VALUES(5,'deepika','selam');
INSERT 0 1

INSERT INTO emp VALUES(6,'salmon','lalgudi');
INSERT 0 1

SELECT * FROM emp;

 id |  name   |   location
----+---------+---------------
  1 | Arun    | trichy
  2 | manoj   | thiruverambur
  3 | sathiya | madurai
  4 | inigo   | chennai
  5 | deepika | selam
  6 | salmon  | lalgudi







//Subscriber cluster2 on port 9999
 
create database test1;
CREATE DATABASE

create extension pglogical;
CREATE EXTENSION

create table emp(id serial primary key,name text,location text);
CREATE TABLE

SELECT pglogical.create_node(node_name := 'subscriber1',dsn := 'host=localhost port=9999 dbname=test1');
create_node

SELECT pglogical.create_subscription( subscription_name := 'sub1',provider_dsn := 'host=localhost port=8888 dbna
me=test1');
create_subscription

SELECT * FROM emp;

 id |  name   | location
----+---------+----------
  1 | Arun    |
  2 | manoj   |
  3 | sathiya |
  4 | inigo   |



