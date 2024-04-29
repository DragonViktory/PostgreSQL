CREATE TABLE IF NOT EXISTS company_chart
AS
SELECT
	first_name || ' ' || last_name AS "Full Name",
	job_title AS "Job Title",
	department_id AS "Department ID",
	manager_ID AS "Manager ID"
FROM employees;