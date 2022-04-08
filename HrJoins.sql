-- 1)Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments
SELECT d.department_name, l.location_id, l.street_address, l.city, l.state_province, c.country_name FROM locations l JOIN departments d using(LOCATION_ID)
 join countries c USING(country_id) group by d.department_name ORDER BY l.location_id;

-- 2)Write a query to find the name (first_name, last name), department ID, and department name of all the employees.
select CONCAT(first_name," ",last_name) as name,department_id,
department_name from employees inner join departments
using(DEPARTMENT_ID) ORDER BY name;

-- 3)Write a query to find the name (first_name, last_name), job, department ID, and name of the employees who work in London.
select CONCAT(first_name," ",last_name) as name,job_title ,department_id,
department_name from employees inner join departments
using(DEPARTMENT_ID) inner join jobs using(JOB_ID) where location_id in
(SELECT location_id FROM locations WHERE city="London");

-- 4)Write a query to find the  employee id, name (last_name) along with their manager_id, and name (last_name).
select e1.employee_id,e1.last_name,e1.manager_id,e2.last_name 
from employees e1 inner join employees e2
on e1.manager_id = e2.employee_id;

-- 5)Write a query to find the name (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
 select CONCAT(first_name, " ", last_name) as name,hire_date
from employees where hire_date > (select HIRE_DATE FROM employees
where last_name="Jones");

-- 6)Write a query to get the department name and number of employees in the department.
SELECT department_name , count(employee_id) as number_of_employees from departments join employees using(department_id) GROUP BY department_name;

--7) Write a query to find the employee ID, job title, number of days between the ending date and the starting date for all jobs in department 90.
select employee_id,job_title,day(end_date)-day(start_date) as diff
from job_history inner join jobs using(JOB_ID) where department_id=90;

 select e1.department_id,CONCAT(e1.first_name, " ",e1.last_name) as name,
e2.first_name from employees e1 inner join
employees e2 on e1.manager_id=e2.employee_id;

 select department_name,CONCAT(first_name, " ",last_name) as manager,city from employees
inner join departments d using(department_id) inner join locations
using(location_id) where employee_id=d.manager_id;

 select job_title,avg(salary) from jobs
inner join employees using(job_id)
group by job_id;

 select job_title,CONCAT(first_name, " ", last_name) as emp_name,
salary-min_salary as sal_diff from employees inner join jobs
using(job_id);
 select job_history.* from job_history INNER JOIN employees
using(employee_id) where salary>10000;

 select department_name,CONCAT(first_name, " ",last_name) as name,hire_date,
salary from employees inner join departments d using(DEPARTMENT_ID)
inner join job_history using(EMPLOYEE_ID) where employee_id=d.manager_id and
end_date-start_date>15;

