-- Query from the employees table and titles table and joining two tables
SELECT e.emp_no,
       e.first_name, 
       e.last_name,
       t.title,
	   t.from_date,
	   t.to_date
INTO retirment_titles	   
FROM employees as e
RIGHT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;
SELECT * FROM retirment_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirment_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;

-- the number of titles filled by employees who are retiring
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
       e.first_name,
       e.last_name,
       e.birth_date,
	   d.from_date,
	   d.to_date,
	   ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as d
    ON (e.emp_no = d.emp_no)
INNER JOIN titles as ti
    ON (e.emp_no= ti.emp_no) 
WHERE (d.to_date =('9999-01-01'))
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;



--Deliverable 3_ create the table which summary for count of menotor eligible
SELECT count(title), title 
INTO mentorship_eligibilty_count
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(title) DESC;

-- change the colum name count to mentor_count because want to combine retiting table 
ALTER TABLE mentorship_eligibilty_count
RENAME COLUMN count TO mentor_count;

-- comparsion of retiring emplyoee and employee who are eligible to become mentor
SELECT 
       rt.count,
	   rt.title,
	   mec.count,
	   mec.title
--INTO 
FROM mentorship_eligibilty_count as mec
INNER JOIN retiring_titles as rt
on (mec.title =rt.title);