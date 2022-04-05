-- Creating contingencies for re-play
DROP TABLE IF EXISTS titles cascade ;
DROP TABLE IF EXISTS employees cascade;
DROP TABLE IF EXISTS departments cascade;
DROP TABLE IF EXISTS dept_manager cascade;
DROP TABLE IF EXISTS dept_emp cascade;
DROP TABLE IF EXISTS salaries cascade;


-- Creating "titles" table
CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);

-- Creating "employees" table
CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);
SET datestyle TO "ISO, MDY";
select CAST('12/20/2016' as Date);
COPY employees(emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date)
FROM 'C:\Users\Public\employees.csv'
DELIMITER ','
CSV HEADER;

-- Creating "departments" table
CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

-- Creating "dep_manager" table
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

-- Creating "dept_emp" table
CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Creating "salaries" table
CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);
