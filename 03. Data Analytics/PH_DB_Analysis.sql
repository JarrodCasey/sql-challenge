---- DATA ANALYSIS ----
--- List the following details of each employee: employee number, last name, first name, sex, and salary.
--Create view
CREATE VIEW employee_salary AS
SELECT employees.emp_no, employees.emp_title_id,employees.birth_date,employees.first_name,employees.last_name,employees.sex,employees.hire_date,salaries.salary
FROM employees
INNER JOIN salaries on
employees.emp_no = salaries.emp_no;

--Using view created, show the information requested
SELECT emp_no, last_name,first_name,sex,salary FROM employee_salary;

--- List first name, last name, and hire date for employees who were hired in 1986.
--Leveraging the view employee_salary, create a query based on hire_date
SELECT first_name,last_name,hire_date FROM employee_salary
WHERE hire_date between '1986-01-01' and '1986-12-31';

--- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--Create a view for employees that are managers
CREATE VIEW employee_manager AS
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no,employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments on departments.dept_no = dept_manager.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no;

--Using view created, show requested information
SELECT * FROM employee_manager;

--- List the department of each employee with the following information: employee number, last name, first name, and department name.
--Create a view for employees Vs departments
CREATE VIEW employee_departments AS
SELECT employees.emp_no,employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
FROM employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no;

--Using view created, show requested information
SELECT emp_no,last_name,first_name,dept_name
FROM employee_departments;

--- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM employee_departments
WHERE dept_name = 'Sales';

--- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM employee_departments
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT COUNT(last_name), last_name FROM employees
GROUP BY last_name
ORDER by count DESC;