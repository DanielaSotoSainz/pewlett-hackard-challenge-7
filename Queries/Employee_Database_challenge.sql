--Create a table with employees and titles 
SELECT e.emp_no,
     e.first_name,
	 e.last_name,
	 ti.title,
     ti.from_date,
     ti.to_date
INTO emp_titles 
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO emp_ret_titles
FROM emp_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Use OrderBy and Groupby to count the number of retiret employees by title
SELECT COUNT(emp_no) as ce, 
	title
INTO emp_titles_info
FROM emp_ret_titles
GROUP BY title
ORDER BY ce DESC;

-- Create a Mentorship Eligibility table for current employees who were born in 1965 
SELECT DISTINCT ON(e.emp_no) e.emp_no,
     e.first_name,
	 e.last_name,
	 e.birth_date,
	 de.from_date,
	 de.to_date,
	 ti.title
INTO mentor_program
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;