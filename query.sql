SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;


-- 1.merge and display employees and salary
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, employees.hired_date, salaries.salary FROM salaries INNER JOIN employees ON employees.emp_no=salaries.emp_no; 
-- 2.List employees who were hired in 1986
SELECT * FROM employees WHERE hired_date BETWEEN '1986-01-01' AND '1986-01-31';
-- 3.List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT * FROM dept_manager INNER JOIN employees ON employees.emp_no=dept_manager.emp_no INNER JOIN departments ON departments.dept_no=dept_manager.dept_no;
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM dept_manager LEFT JOIN employees ON employees.emp_no=dept_manager.emp_no LEFT JOIN departments ON departments.dept_no=dept_manager.dept_no;
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name SIMILAR TO 'B%';
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM dept_manager WHERE dept_name = 'Sales' INNER JOIN employees ON employees.emp_no=dept_manager.emp_no INNER JOIN departments ON departments.dept_no=dept_manager.dept_no;
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM dept_manager WHERE dept_name = 'Sales' OR dept_name = 'Development' FULL JOIN employees ON employees.emp_no=dept_manager.emp_no FULL JOIN departments ON departments.dept_no=dept_manager.dept_no;
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT (DISTINCT last_name) FROM employees;