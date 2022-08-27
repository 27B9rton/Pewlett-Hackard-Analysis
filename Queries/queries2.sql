-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no;

SELECT retirement_info.emp_no,
	retirement_info.first_name,
retirement_info.last_name,
	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp ON retirement_info.emp_no = dept_emp.emp_no;

SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de ON ri.emp_no = de.emp_no;

--Join Retirement info and dept_employees
SELECT r.emp_no, r.first_name, r.last_name,
de.to_date
INTO current_emp
FROM retirement_info as r
left join dept_emp as de ON r.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * from current_emp;

--Join current_emp and dept_emp
SELECT count(ce.emp_no), de.dept_no
INTO department_retirements
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY dept_no;