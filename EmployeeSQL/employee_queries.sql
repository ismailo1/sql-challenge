--List the employee number, last name, first name, sex, and salary of each employee 

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM
employees as e
INNER JOIN salaries as s
ON
e.emp_no = s.emp_no
ORDER BY 
emp_no ASC;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date from employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

--List the manager of each department along with their department number, department name, employee number, last name, and first name 

SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name FROM
employees as e
INNER JOIN dept_manager as dm ON
e.emp_no = dm.emp_no
INNER JOIN departments as d ON
d.dept_no = dm.dept_no
ORDER BY dept_no ASC;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name FROM
employees as e
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
ORDER BY dept_no ASC;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex FROM
employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name FROM
employees as e 
INNER JOIN dept_emp as de ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
d.dept_no = de.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no ASC;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM
employees as e
INNER JOIN dept_emp as de ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Development' OR dept_name = 'Sales'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;