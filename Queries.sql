--Query employee salaries
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no=salaries.emp_no;

--Query employees hired in 1986 
SELECT emp_no, last_name, first_name
FROM employees
WHERE date_part('year', hire_date) = 1986;

--Query managers
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager. to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no=dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no=employees.emp_no;

--Query employee departments
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no;

--Query employees named Hercules B
SELECT emp_no, last_name, first_name
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

--Query employees in Sales
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales';

--Query employees in Sales OR Development 
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--Query how many times employee's last names are used
SELECT COUNT(employees.last_name), employees.last_name
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name) DESC;

