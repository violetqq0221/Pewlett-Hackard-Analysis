# Analysis of employee database for upcoming "silver tsunami"


## Overview of the analysis
The purpose of this analysis to perform the employess retirment status is from six databases.  
By creating the new table called 'mentorship_eligibility' which is comibined from three tables (employee, dept_emp, title) with emp_no, we can easily tell who will reach retirment age. This information is powerful for the company, not only can the data help the company to prepare for large number of employees who are about to retire, but it can also help to prepare the budget for hiring new employee in the future to meet the demand. 


## Results
From the retiring_titles tabel, we are able to know the totoal number of employees who are going to retire based on titile.
* The most employee who are going to retire is with the title Senior Engineer. 
* The second most number of employees who are going to retire is with the title Senior Staff.
* 70.16 % of employees are going to retire are from senior engineer and seniot staff.
* Only two mangers are going to retire, which only 0.0027 % of employees who are going to retire.

    
## Summary

**How many roles will need to be filled as the "silver tsunami" begins to make an impact?**
* There are 72458 positions will impaced by this retirment wave.

**Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**
* There are 1549 employees are eligible be as mentor for next generation. 

**Two additional insight suggestions:**
  
  *comparsion of each title count of retiring employee and employees who are able to be the mentor, the percentage of mentor ratio are more easy to tell the distribution of employee and more easy to for company to mange the upcoming workforce transitions.* 
(--following are creating table by query from diifferent tables)
* From the result we can tell the highest of mentee rate is %7.16 of assistant Engineer
* the lowest mentee is 0.65 % of senior engineer \

![fig](https://github.com/violetqq0221/Pewlett-Hackard-Analysis/blob/main/Data/percentage_mentee.PNG)
* The suggestion for the company, we need to higher more senior engineer positions for upcoming transition. Senior engineers can bring more knowledge and exprience to the workplace. The company should consider it as factor of direction in the future. 


## Appendix Queries for Deliverable 3


**create the table which summary for count of menotor eligible**
SELECT count(title), title INTO mentorship_eligibilty_count
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(title) DESC;

**change the colum name count to mentor_count because want to combine retiting table**
ALTER TABLE mentorship_eligibilty_count
RENAME COLUMN count TO mentor_count;

**comparsion of retiring emplyoee and employee who are eligible to become mentor**
SELECT 
       rt.count,
	   rt.title,
	   mec.count,
	   mec.title
FROM mentorship_eligibilty_count as mec
INNER JOIN retiring_titles as rt
on (mec.title =rt.title);