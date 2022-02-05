# Pewlett-Hackard-Analysis
## Overview
This project builds an employee database using PostgreSQL (version 11.4) for Pewlett Hackard. They would like to determine the number of employees retiring. Furthermore, this database displays the retiring employee's titles and the employees who are eligible for the mentorship program. 

## Results
-According to the unique_titles table, there are 72,458 employees retiring as part of the silver tsunami expected by Pewlett Hackard.

-The title of Senior Engineer has the most amount of employees retiring, with Senior Staff as a close second so Pewlett Hackard should focus their hiring efforts there. 

-Besides Management, Assistant Engineer is the titles with the least amount of expected vacancies so hiring for this position is not as urgent.

-According to the mentorship_eligibility table, there are 1549 employees that are eligible for the mentorship program. 

## Summary
-As the silver tsunami begins to take impact, 72,458 roles will need to be filled. 

-It is difficult to determine if there are enough retirement-ready employees in the departments to mentor the next generation of employees. It depends on the ratio of retirement-ready employees to new employees that Pewlett Hackward is looking. However, after writing a query to create a table that shows the employees eligibile for the mentorship program and the name of the department that they belong to (mentorship_department) and then writing another query group those results by the department name (mentorship_by_department), it is evident that every department has employees for the mentorship program. The Finance, Quality Management, Customer Service, Human Resources, and Research departments all have less than 100 employees for the mentorship program, so depending on the requirement. This may not be enough for the number of new employees coming in to replace the retirees. 