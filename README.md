# Pewlett-Hackard-Analysis
This analysis was done for Pewlett Hackard as they prepare to have a large exodus of employees leaving into retirement. Analysis was done in Postgres/pgadmin using SQL to find out how many retirements were expected by position title as well as by departments. In an effort to help address the large amount of employees leaving, PH is looking to implement a mentorship program for employees nearing retirement who would still like to participate and train younger employees. Analysis was done to find how many employees could go into this mentorship program so that outreach and planning can begin.

## Results
There are 33,118 employees preparing to retire. 

There are an additional 1549 who are eligible to begin the mentorship program.

The following is a screenshot of the total number of retirees by Department. Development and Production are the two most impacted sectors.

![1](https://user-images.githubusercontent.com/108035549/187093280-896ef86b-5526-4181-87e4-d846a24c6bbe.png)

When we break down the retirees by title, we see that Senior engineers and Senior Staff are the two largest groups of retirees.

![2](https://user-images.githubusercontent.com/108035549/187093302-d674e4d6-be67-430d-9363-9368d375a678.png)

## Summary
A Total of 33,118 roles will need to be filled.
Development and Production along with senior Engineers and Senior Staff are the most important areas of focus to replenish the mass exodus.


Luckily for PH, of the 1549 eligible mentors, the two largest groups are the 569 senior staff and 529 Senior Engineers, the two largest sectors of need.

![4](https://user-images.githubusercontent.com/108035549/187093809-cf187ae6-feb7-4de6-967e-ec0e2500a3b6.png)

By taking the emp_no from the list of retirees and matching it with the emp_no from the salaries table, I was able to sum up the total amount of money that will be back on the books once the retirees have left PH's payroll. The total came out to $2,191,972,577. I used the following code to get that: 



SELECT ri.emp_no, s.salary

into replaceable_salary

FROM retirement_info as ri

inner join salaries as s

ON (ri.emp_no = s.emp_no);

SELECT * FROM replaceable_salary;

SELECT sum(salary) FROM replaceable_salary;


