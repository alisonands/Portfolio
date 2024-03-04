--1
--employee number, 
--last name, 
--first name, 
--sex, and 
--salary of each employee
SELECT employees.emp_no
, employees.last_name, 
employees.first_name, 
employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
on salaries.emp_no = employees.emp_no;

--2
SELECT employees.first_name
, employees.last_name
, EXTRACT (YEAR FROM employees.hire_date) as hire_year
FROM employees
WHERE EXTRACT (YEAR FROM employees.hire_date) = 1986;

--3
--manager
--dept_no
--dept_name
--emp_no
--last_name
--first_name
SELECT dept_manager.dept_no
	, departments.dept_name
	, dept_manager.emp_no
	, employees.last_name
	, employees.first_name
FROM dept_manager
INNER JOIN departments
on dept_manager.dept_no = departments.dept_no
INNER JOIN employees
on employees.emp_no = dept_manager.emp_no;

--4
--dept_no
--emp_no
--last_name
--first_name
--dept_name
SELECT departments.dept_no
	, dept_emp.emp_no
	, employees.last_name
	, employees.first_name
	, departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no;

--5
--first_name == 'Hercules'
--last_name begins with B
--sex
SELECT employees.first_name
	, employees.last_name
	, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND
	employees.last_name LIKE 'B%';
	
--6
--All employees in sales
--emp_no
--last_name
--first_name
SELECT employees.emp_no
	, employees.last_name
	, employees.first_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7 
--Sales and Development
--emp_no
--last_name
--first_name
SELECT dept_emp.emp_no
	, employees.last_name
	, employees.first_name
	, departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR 
	departments.dept_name = 'Development';
	
--8
--frequency counts last name
SELECT employees.last_name, COUNT(employees.last_name)
FROM employees
GROUP BY employees.last_name;