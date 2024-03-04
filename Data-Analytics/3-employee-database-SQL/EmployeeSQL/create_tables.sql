DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE IF NOT EXISTS departments(
	id SERIAL,
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS dept_emp(
	id SERIAL,
	emp_no int NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (id),
);
CREATE TABLE IF NOT EXISTS dept_manager(
	id SERIAL,
	dept_no VARCHAR(10),
	emp_no int NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL,
	emp_no int NOT NULL,
	emp_title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(2),
	hire_date DATE,
	PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS salaries(
	id SERIAL,
	emp_no int NOT NULL,
	salary int NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS titles(
	id SERIAL,
	title_id VARCHAR(10),
	title VARCHAR(255),
	PRIMARY KEY (id)
);