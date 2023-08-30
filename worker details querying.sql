use workers;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');        
    
 
 select * from worker;
 select * from title; 
 Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 
  select first_name as work_name;
  
 Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
   
   select upper(first_name) from worker;
   
 Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
   
   select distinct(department) from worker;


Q-4. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length

select distinct lenght(department) from worker;


Q-5. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from worker
order by first_name asc;

Q-6. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from worker
order by first_name asc,
         department desc;
         
Q-7. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from worker
where first_name in ("vipul", "satish");

Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”

select * from worker
where department = "Admin"; 

Q-9. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from worker
where first_name like "a%";

Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from worker
where first_name like "%a";


Q-12 Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from worker
where salary between 100000 and 500000;

Q-13. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from worker
where year(joining_date) = 2014 and
     month(joining_date) = 02;
     
Q-14. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select count(*) from worker
where department = "Admin";

Q-15. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

select concat(first_name, ' ', Last_name) as worker_names,salary
from worker
where salary >= 50000 and
     salary <= 100000; 
     
select concat(first_name, ' ', Last_name) as worker_names,salary
from worker
where worker_id in 
(select worker_id from worker
where salary between 50000 and 100000);


Q-16. Write an SQL query to print details of the Workers who are also Managers.

select distinct W.first_name, T.WORKER_TITLE
FROM WORKER W
INNER JOIN
TITLE T ON 
W.WORKER_ID = T.WORKER_REF_ID
AND 
T.WORKER_TITLE IN ("Manager");

Q-17. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

select worker_title, affected_from
from title
group by worker_title,affected_from
having count(*) >1;



Q-18. Write an SQL query to show the current date and time.

select curdate();
select now();

Q-19. Write an SQL query to show the top n (say 10) records of a table.

select * from worker
order by salary desc limit 10;

select * from worker
order by salary limit 10;


Q-20. Write an SQL query to show the second highest salary from a table.

select max(salary) from worker
where salary not in (select max(salary) from worker); 


Q-21. Write an SQL query to fetch departments along with the total salaries paid for each of them.

select department, sum(salary) as Total_Salaries
from worker
group by department;

Q-22. Write an SQL query to fetch the names of workers who earn the highest salary.

select first_name,salary 
from worker
where salary = (
select max(salary) from worker);