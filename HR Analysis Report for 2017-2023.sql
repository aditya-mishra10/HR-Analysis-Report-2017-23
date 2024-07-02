/*
Determine the headcount for each job role.
*/

-- solution:

SELECT 
job_title,
count(*) AS headcount
FROM project.hr
GROUP BY job_title
ORDER BY headcount;



/*
Analyze the gender distribution among staff.
*/

-- solution:

SELECT
	gender,
	COUNT(*) as gender_count
FROM project.hr
GROUP BY gender
ORDER BY gender_count DESC;



/*
Assess salary discrepancies across various positions.
*/

-- solution:

SELECT 
	job_title,
	AVG(salary) AS avg_salary,
	MIN(salary) AS min_salary,
	MAX(salary) AS max_salary
FROM project.hr
GROUP BY job_title
ORDER BY avg_salary DESC;



/*
Identify the highest earners in each role.
*/

-- solution:

WITH ranked_employees AS (
	SELECT
		job_title,
		name,
		salary,
		ROW_NUMBER() OVER(PARTITION BY job_title ORDER BY salary DESC) AS position
	FROM project.hr
)
SELECT
	job_title,
	name,
	salary
FROM ranked_employees
WHERE position = 1
ORDER BY salary DESC;



/*
Examine the relationship between qualifications and salaries.
*/

-- solution

SELECT 
    education_qualification,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM
    project.hr
GROUP BY education_qualification
ORDER BY avg_salary DESC;



/*
Conduct an analysis of leave balances.
*/

-- solution

SELECT
	gender,
	AVG(leave_balance) AS avg_leave_balance
FROM project.hr
GROUP BY gender
ORDER BY avg_leave_balance DESC;


