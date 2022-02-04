-- Retirement titles table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

--Unique titles table
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--Retiring titles table
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count desc;

--Mentorship Eligibility table
SELECT DISTINCT ON (emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e 
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (de.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

--Mentorship eligibility with department name table 
SELECT me.emp_no, 
	me.title,
	d.dept_name
INTO mentorship_department
FROM mentorship_eligibility as me
INNER JOIN dept_emp as de 
ON (me.emp_no = de.emp_no)
INNER JOIN departments as d 
ON (de.dept_no = d.dept_no)

--Drop mentorship department table
DROP TABLE mentorship_department CASCADE;

-- Recreate mentorship eligibility with department name table 
SELECT DISTINCT ON (emp_no) me.emp_no, 
	me.title,
	d.dept_name
INTO mentorship_department
FROM mentorship_eligibility as me
INNER JOIN dept_emp as de 
ON (me.emp_no = de.emp_no)
INNER JOIN departments as d 
ON (de.dept_no = d.dept_no);

--Group mentorship eligible employees by department
SELECT COUNT(emp_no), dept_name
INTO mentorship_by_department
FROM mentorship_department
GROUP BY dept_name;


