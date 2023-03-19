

USE exercise_hr;
--  1. Write a query to get the total salaries payable to employees.
SELECT SUM(salary) as total_salary_payable 
FROM employees;

-- 2.Write a query to get the maximum and minimum salary from employees table.
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employees;

-- 3.Write a query to get the average salary and number of employees in the employees table.
SELECT AVG(salary) AS average_salary,  COUNT(*) AS 'number of employees'
FROM employees;

-- 4.Write a query to get the number of employees working with the company.
SELECT COUNT(*) AS 'number of employees'
FROM employees;

-- 5.Write a query to get the number of distinct jobs available in the employees table.
SELECT COUNT(DISTINCT department_name) AS number_of_jobs 
FROM departments;

-- 6.Write a query get all first name from employees table in upper case.
SELECT UPPER(first_name) AS 'First Name'
FROM employees;

-- 7.Write a query to get the first 3 characters of first name from employees table.
SELECT SUBSTRING(first_name,1,3) 
FROM employees;

-- 8.Write a query to get the names ('<first name> <last name>') (for example Ellen Abel, Sundar Ande etc.) as a single column of all the employees from employees table
SELECT CONCAT(first_name, last_name) AS 'Employee_name'
FROM employees;

-- 9.Write a query to get the length of the employee names ('<first name> <last name>') from employees table. --
SELECT CHAR_LENGTH ("first_name, last_name") AS LengthOfNames
FROM employees;

-- 10.Write a query to get monthly salary (round 2 decimal places) of each and every employee
SELECT employee_id, first_name, last_name, ROUND(salary/12, 2) as monthly_salary
FROM employees;


-- 1. Write a query to find the name (first_name, last name), department ID and name of all the employees.
 
SELECT first_name,last_name,e.department_id
FROM employees AS e INNER JOIN departments AS d
ON e.department_id = d.department_id;
 
--  2. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
 
SELECT first_name,last_name,e.department_id,city,job_title
FROM employees AS e INNER JOIN departments AS d INNER JOIN locations AS n INNER JOIN jobs AS j
ON e.department_id = d.department_id
WHERE city = 'london';
 
--  3. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT e.employee_id AS 'Emp_Id', e.last_name AS 'Employee', m.employee_id AS 'Mgr_Id', m.last_name AS 'Manager' 
FROM employees AS e INNER join employees AS m 
ON (e.manager_id = m.employee_id);

 
--  4. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (
    SELECT hire_date
    FROM employees
    WHERE last_name = 'Jones'
)
ORDER BY hire_date;

-- 5.Write a query to get the department name and number of employees in the department. (Requires GROUP BY)

SELECT departments.department_name, COUNT(employees.employee_id) as num_employees
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
GROUP BY departments.department_name;

-- 6.Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.

SELECT e.employee_id, n.job_title, DATEDIFF(j.end_date, j.start_date)  AS days_worked,e.department_id
FROM employees AS e INNER JOIN job_history AS j INNER JOIN jobs AS n
ON e.job_id = n.job_id INNER JOIN departments as d
ON e.department_id = d.department_id
WHERE e.department_id = 90;

-- 7.Find the CEO from the employee table.
SELECT *
FROM employees AS e INNER JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE m.manager_id = null;