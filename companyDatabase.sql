--1. creating complex company data base

CREATE TABLE Employee(
   emp_id INT ,
    first_name VARCHAR(20) ,
    last_name   VARCHAR(20),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id  INT,
    branch_id  INT ,
    PRIMARY KEY(emp_id)
);

CREATE TABLE branch(
   branch_id INT PRIMARY KEY,
   branch_name VARCHAR(20),
   mgr_id INT,
   mgr_start_data DATE,
   FOREIGN KEY(mgr_id) REFERENCES Employee(emp_id)  ON DELETE SET NULL

);

CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(20),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with(
     emp_id INT,
     client_id INT,
     total_sales INT,
     PRIMARY KEY(emp_id,client_id),
     FOREIGN KEY(emp_id)REFERENCES Employee(emp_id) ON DELETE CASCADE,
     FOREIGN KEY(client_id)REFERENCES client(client_id)ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
    branch_id INT,
    client_name VARCHAR(20),
    supply_type VARCHAR(20),
    PRIMARY KEY(branch_id,client_name),
    FOREIGN KEY(branch_id)REFERENCES branch(branch_id)ON DELETE CASCADE
);


DROP table branch;
DROP table Employee;
DROP table client;

SELECT *
FROM employee;

SELECT *
FROM branch;

SELECT *
FROM works_with;

SELECT *
FROM branch_supplier;

SELECT *
FROM client;

ALTER table Employee
ADD FOREIGN KEY(branch_id)REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER table Employee
ADD FOREIGN KEY(super_id)
REFERENCES Employee(emp_id)
ON DELETE SET NULL;

--corporate branch
INSERT INTO employee VALUES(100,'David','Wallace','2002-04-02','M',25000,NULL,NULL);
INSERT INTO branch VALUES(1,'corporate',100,'2006-06-09');
INSERT INTO employee VALUES(101,'Jan','Levison','2000-02-04','M',20000,100,1);

UPDATE employee
set branch_id=1
where emp_id=100;

--scranton branch
INSERT INTO employee VALUES(102,'Micheal','Scott','1964-06-05','M',75000,100,NULL);
INSERT INTO branch VALUES(2,'scranton',102,'1992-04-06');

UPDATE  employee
set branch_id=2
WHERE emp_id=102;

INSERT INTO employee VALUES(103,'Angela','Martin','1971-05-03','F',63000,102,2);
INSERT INTO employee VALUES(104,'kelly','kapoor','1980-02-05','M',55000,102,2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--stamford
INSERT INTO employee VALUES(106,'JOSH','Porter','1969-09-05','M',78000,100,NULL);
INSERT INTO branch VALUES(3,'stamford',106,'1998-02-13');

UPDATE employee
SET branch_id=3
WHERE emp_id=106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER;
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);