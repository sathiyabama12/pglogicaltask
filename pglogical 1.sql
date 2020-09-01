//Publiser cluster1 on port 8888

create database test2;
CREATE DATABASE

create extension pglogical;
CREATE EXTENSION

create table stud(id int primary key,name text,subject text,location text);
CREATE TABLE

select pglogical.create_node(node_name := 'provider2',dsn := 'host=localhost port=8888 dbname=test2');
create_node
                                                            ^
SELECT pglogical.replication_set_add_table(set_name := 'default', relation := 'stud', synchronize_data := true,
columns :='{id,name,location}', row_filter := 'id<7');
replication_set_add_table

INSERT INTO stud VALUES(1,'aswin','science','trichy');
INSERT 0 1

INSERT INTO stud VALUES(2,'balaji','biology','mannachanallur');
INSERT 0 1

INSERT INTO stud VALUES(3,'sathya','maths','aadhichanallur');
INSERT 0 1

INSERT INTO stud VALUES(4,'madhu','bio maths','kknagar');
INSERT 0 1

INSERT INTO stud VALUES(5,'vaishu','computer science','thillainagar');
INSERT 0 1

INSERT INTO stud VALUES(6,'praveen','english','madurai');
INSERT 0 1

INSERT INTO stud VALUES(7,'edwin','computer science','kudalur');
INSERT 0 1

INSERT INTO stud VALUES(8,'ashok','biology','thiruthani');
INSERT 0 1

INSERT INTO stud VALUES(9,'dhiya','science','neyveli');
INSERT 0 1

INSERT INTO stud VALUES(10,'salmon','english','ooty');
INSERT 0 1

test2=# select * from stud;

 id |  name   |     subject      |    location
----+---------+------------------+----------------
  1 | aswin   | science          | trichy
  2 | balaji  | biology          | mannachanallur
  3 | sathya  | maths            | aadhichanallur
  4 | madhu   | bio maths        | kknagar
  5 | vaishu  | computer science | thillainagar
  6 | praveen | english          | madurai
  7 | edwin   | computer science | kudalur
  8 | ashok   | biology          | thiruthani
  9 | dhiya   | science          | neyveli
 10 | salmon  | english          | ooty







//Subscriber cluster2 on port 9999

create database test2;
CREATE DATABASE

create extension pglogical;
CREATE EXTENSION

create table stud(id int primary key,name text,subject text,location text);
CREATE TABLE

select pglogical.create_node(node_name := 'subcriber2',dsn := 'host=localhost port=9999 dbname=test2');
create_node

SELECT pglogical.create_subscription( subscription_name := 'sub2',provider_dsn := 'host=localhost port=8888 dbname=test2');
create_subscription

select * from stud;

 id |  name   | subject |    location
----+---------+---------+----------------
  1 | aswin   |         | trichy
  2 | balaji  |         | mannachanallur
  3 | sathya  |         | aadhichanallur
  4 | madhu   |         | kknagar
  5 | vaishu  |         | thillainagar
  6 | praveen |         | madurai