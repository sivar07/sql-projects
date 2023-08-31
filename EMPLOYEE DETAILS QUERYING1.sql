CREATE TABLE EMPLOYEE_INFO (
	EMP_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	EMP_FNAME CHAR(25),
	EMP_LNAME CHAR(25),
    DEPARTMENT CHAR(25),
    ADDRESS VARCHAR(25),
    GENDER VARCHAR(25)
);

INSERT INTO EMPLOYEE_INFO
(EMP_ID, EMP_FNAME, EMP_LNAME, DEPARTMENT, ADDRESS, GENDER)values

(1,'SANJAY','MEHRA','HR','HYDERABAD','M'),
(2,'ANANYA','MISHRA','ADMIN','DELHI','F'),
(3,'ROHAN','DIWAN','ACCOUNT','MUMBAI','M'),
(4,'SONIA','KULKARNI','HR','HYDERABAD','F'),
(5,'ANKIT','KAPOOR','ADMIN','DELHI','M');

SELECT*FROM employee_info;


CREATE TABLE EMPLOYEE_POSITION(
EMP_ID INT,
EMP_POSITION varchar(25),
SALARY int
);

INSERT INTO EMPLOYEE_POSITION
(EMP_ID,EMP_POSITION,SALARY)VALUES
(1,'MANAGER',500000),
(2,'EXECUTIVE',75000),
(3,'MANAGER',90000),
(2,'LEAD',85000),
(1,'EXECUTIVE',300000);




SELECT * FROM employee_info;

SELECT* FROM EMPLOYEE_POSITION;


-- Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.--
SELECT upper(EMP_FNAME) AS EMP_NAME FROM employee_info;

-- Write a query to fetch the number of employees working in the department ‘HR’.--
SELECT count(*) FROM EMPLOYEE_INFO
WHERE DEPARTMENT ='HR';

-- Write a query to get the current date.--
SELECT sysdate();

-- Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.--
SELECT substring( EMP_LNAME,1,4) FROM employee_info;


-- Write q query to find all the employees whose salary is between 50000 to 100000 --
SELECT SALARY FROM EMPLOYEE_POSITION
WHERE SALARY between '50000' AND '100000';

-- Write a query to find the names of employees that begin with ‘S’ --
SELECT EMP_FNAME FROM employee_info
WHERE EMP_FNAME LIKE 'S%';

-- Write a query to fetch top N records.--
SELECT * FROM EMPLOYEE_POSITION 
ORDER BY SALARY DESC
LIMIT 1;

-- Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.--
SELECT concat( EMP_FNAME, '' ,EMP_LNAME) AS 'FULLNAME' FROM employee_info;


--  Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending orde --
SELECT * FROM employee_info
ORDER BY EMP_LNAME DESC,
DEPARTMENT ASC;


--  Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets --
SELECT EMP_LNAME FROM employee_info
WHERE EMP_LNAME LIKE '_____A';


-- Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table. --
SELECT EMP_FNAME FROM employee_info
WHERE EMP_FNAME NOT IN ('SANJAY' ,'SONIA');

--  Write a query to fetch all employees who also hold the managerial position.--

SELECT E.EmpFname, E.EmpLname, P.EmpPosition 
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');


-- Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.--

SELECT Department, COUNT(*) AS EmployeeCount
FROM Employee_info
GROUP BY Department
ORDER BY EmployeeCount ASC;

--  Write a query to retrieve duplicate records from a table.

SELECT Emp_ID, Emp_Fname, COUNT(*)  
FROM Employee_Info GROUP BY EmpID, EmpFname, Department 
HAVING COUNT(*) > 1;

-- Write a query to retrieve EmpPostion along with total salaries paid for each of them.

SELECT Emp_Position, SUM(Salary) from Emp_Position GROUP BY Emp_Position;



