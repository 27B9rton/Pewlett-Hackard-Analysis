-- Challenge begins
SELECT e.emp_no, e.first_name, e.last_name,
ti.title, ti.from_date, ti.to_date
into retirement_titles
FROM Employees as e
INNER JOIN Titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY (e.emp_no) ASC;

SELECt * from retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY (emp_no) ASC, (to_date) DESC;

SELECT * FROM unique_titles;
DROP TABLE retiring_titles;

SELECT count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY (count) DESC;
SELECT * FROM retiring_titles;

SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name,
e.birth_date, de.from_date, de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (ti.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY (e.emp_no) ASC;

SELECT * FROM mentorship_eligibility;


SELECT * FROM retirement_titles;

SELECT ri.emp_no, s.salary
into replaceable_salary
FROM retirement_info as ri
inner join salaries as s
ON (ri.emp_no = s.emp_no);
SELECT * FROM replaceable_salary;

SELECT sum(salary) FROM replaceable_salary;