
USE exercise_hr;

-- 1. Write a query to find the name (first_name, last_name), department id, name of the employees.
SELECT first_name,last_name,e.department_id, d.department_name
FROM employees AS e INNER JOIN departments AS d
ON e.department_id = d.department_id;


 SELECT job_title, first_name, salary-min_salary 'Salary - Min_Salary'
FROM employees
INNER JOIN jobs
ON employees.job_id = jobs.job_id;



-- 2.Write a query to display job_title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT job_title, first_name,last_name, salary-min_salary 'Salary - Min_Salary' 
FROM employees INNER JOIN jobs;


-- 3. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
SELECT employee_id, job_title, DATEDIFF(end_date, start_date) AS DAYS FROM jobs INNER JOIN job_history
ON jobs.job_id = job_history.job_id
WHERE department_id = 90;

SELECT employee_id, job_title, end_date-start_date Days FROM job_history 
NATURAL JOIN jobs 
WHERE department_id=90;

-- 4.Write a query to get the department name and average salary in the department.
SELECT department_name AS 'Department Name', AVG(salary) AS 'Average Salary'
FROM departments
JOIN employees USING (department_id)
GROUP BY department_name;


-- 5. Write a query to display department name, manager name and city.
SELECT d.department_name, e.first_name, l.city
FROM departments as d INNER JOIN employees as e
ON (d.manager_id = e.employee_id)
JOIN locations l USING (location_id);








