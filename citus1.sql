
// Coordinator running on port:8500

CREATE EXTENSION citus;

create table p_info(id INT,fname VARCHAR(50),lname VARCHAR(50),email VARCHAR(50),gender VARCHAR(50),);

create table emp(id INT,name VARCHAR(50),job VARCHAR(50),location VARCHAR(50));

ALTER TABLE p_info ADD PRIMARY KEY (id);

ALTER TABLE emp ADD PRIMARY KEY (id);

SET citus.replication_model = 'streaming';

SELECT create_distributed_table('p_info', 'id');

SELECT create_distributed_table('emp', 'name');



//queries

SELECT id,name,location

FROM emp

ORDER BY location DESC

LIMIT 10;

CREATE PROCEDURE inpro(INT,VARCHAR(50),VARCHAR(50),VARCHAR(50))

  LANGUAGE 'plpgsql'

  AS $$

  BEGIN

INSERT INTO emp(id,name,job,location) VALUES ($1,$2,$3,$4);

  COMMIT;

  END;

  $$

CALL inpro(121,'siva','app developer','chennai');
CALL inpro(143,'guru','manager','chennai');

update emp

  set location='trichy'

  where location='chennai'

select count(name) from emp as Total emp;



// Worker1 running on port:8600

CREATE EXTENSION citus;

select * from p_info1; 

select * from emp1;



// Worker2 running on port:8700

CREATE EXTENSION citus;

select * from emp_2;

select * from p_info2; 