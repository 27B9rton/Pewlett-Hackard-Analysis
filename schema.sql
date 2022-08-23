Create Table Titles(
	emp_no INTEGER NOT NULL PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);
	
SELECT * FROM departments;