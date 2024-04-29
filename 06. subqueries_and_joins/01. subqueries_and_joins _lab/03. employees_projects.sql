SELECT
	e.employee_id
	, CONCAT(e.first_name, ' ', e.last_name) AS full_name
	, p.project_id
	, p.name
FROM
	employees AS e
	JOIN employees_projects as ep
		USING (employee_id)
			JOIN projects AS p
				USING (project_id)
WHERE project_id = 1;