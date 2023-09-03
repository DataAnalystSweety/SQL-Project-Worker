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
 
 # Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 
select first_name as work_name;
  
 # Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
   
select upper(first_name) from worker;
   
 # Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
   
select distinct(department) from worker;

# Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table
 
select substring(first_name,1,3) from worker;
 
 # Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

select instr(First_name, Binary 'a') from worker
where first_name = "Amitash";

# Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

select Rtrim(first_name) from worker;

# Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

select Ltrim(department) from worker;

# Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length

select distinct lenght(department) from worker;

# Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.

select replace (first_name, "a", "A") from worker;

# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

select concat(first_name, ' ', last_name) as complete_name from worker;

# Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from worker
order by first_name desc;

# Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT 
    *
FROM
    worker
ORDER BY first_name DESC , department DESC;
         
# Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

SELECT 
    *
FROM
    worker
WHERE
    first_name IN ('vipul' , 'satish');

# Q-14. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”

SELECT 
    *
FROM
    worker
WHERE
    department = 'Admin'; 

# Q-15. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT 
    *
FROM
    worker
WHERE
    first_name LIKE '%a%';

# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

SELECT 
    *
FROM
    worker
WHERE
    first_name LIKE '%a';

# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets

SELECT 
    *
FROM
    worker
WHERE
    first_name LIKE '_____h';

# Q-18. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

SELECT 
    *
FROM
    worker
WHERE
    salary BETWEEN 100000 AND 500000;

# Q-19. Write an SQL query to print details of the Workers who have joined in Feb’2014.

SELECT 
    *
FROM
    worker
WHERE
    YEAR(joining_date) = 2014
        AND MONTH(joining_date) = 02;
     
# Q-20. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT 
    COUNT(*)
FROM
    worker
WHERE
    department = 'Admin';

# Q-21. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT 
    CONCAT(first_name, ' ', Last_name) AS worker_names, salary
FROM
    worker
WHERE
    salary >= 50000 AND salary <= 100000; 
     
SELECT 
    CONCAT(first_name, ' ', Last_name) AS worker_names, salary
FROM
    worker
WHERE
    worker_id IN (SELECT 
            worker_id
        FROM
            worker
        WHERE
            salary BETWEEN 50000 AND 100000);

# Q-22. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT 
    department, COUNT(worker_id) no_of_workers
FROM
    worker
GROUP BY department
ORDER BY no_of_workers DESC;

SELECT 
    department, COUNT(worker_id) no_of_workers
FROM
    worker
GROUP BY department
ORDER BY no_of_workers;

# Q-23. Write an SQL query to print details of the Workers who are also Managers.

SELECT DISTINCT
    W.first_name, T.WORKER_TITLE
FROM
    WORKER W
        INNER JOIN
    TITLE T ON W.WORKER_ID = T.WORKER_REF_ID
        AND T.WORKER_TITLE IN ('Manager');

# Q-24. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT 
    worker_title, affected_from
FROM
    title
GROUP BY worker_title , affected_from
HAVING COUNT(*) > 1;

# Q-25. Write an SQL query to show only odd rows from a table.

SELECT 
    *
FROM
    worker
WHERE
    MOD(worker_id, 2) <> 0;

# Q-26. Write an SQL query to show only even rows from a table.

SELECT 
    *
FROM
    worker
WHERE
    MOD(worker_id, 2) = 0;

# Q-27. Write an SQL query to show the current date and time.

SELECT CURDATE();
SELECT NOW();

# Q-28. Write an SQL query to show the top n (say 10) records of a table.

SELECT 
    *
FROM
    worker
ORDER BY salary DESC
LIMIT 10;

SELECT 
    *
FROM
    worker
ORDER BY salary
LIMIT 10;


# Q-29. Write an SQL query to show the second highest salary from a table.

SELECT 
    MAX(salary)
FROM
    worker
WHERE
    salary NOT IN (SELECT 
            MAX(salary)
        FROM
            worker); 
            

# Q-30. Write an SQL query to fetch the first 50% records from a table.

SELECT 
    *
FROM
    worker
WHERE
    worker_id <= (SELECT 
            COUNT(worker_id) / 2
        FROM
            worker);

# Q-31. Write an SQL query to fetch the departments that have less than five people in it.

SELECT 
    department, COUNT(worker_id) AS 'Number of Worker'
FROM
    worker
GROUP BY department
HAVING COUNT(worker_id) < 5;

SELECT 
    department, COUNT(worker_id) AS 'Number of Worker'
FROM
    worker
GROUP BY department
HAVING COUNT(worker_id) < 7;

# Q-32. Write an SQL query to show all departments along with the number of people in there.

SELECT 
    department, COUNT(worker_id) AS 'Number of Worker'
FROM
    worker
GROUP BY department;

# Q-33. Write an SQL query to show the last record from a table.

SELECT 
    *
FROM
    worker
WHERE
    worker_id = (SELECT 
            MAX(worker_id)
        FROM
            worker);

# Q-34. Write an SQL query to fetch the first row of a table.

SELECT 
    *
FROM
    worker
WHERE
    worker_id = (SELECT 
            MIN(worker_id)
        FROM
            worker);

# Q-35. Write an SQL query to fetch departments along with the total salaries paid for each of them.

SELECT 
    department, SUM(salary) AS Total_Salaries
FROM
    worker
GROUP BY department;

# Q-36. Write an SQL query to fetch the names of workers who earn the highest salary.

select first_name,salary 
from worker
where salary = (
select max(salary) from worker);
