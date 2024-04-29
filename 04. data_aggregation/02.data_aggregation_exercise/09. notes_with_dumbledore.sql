SELECT
	last_name,
	COUNT(notes) AS "Notes with dumbledore"
FROM
	wizard_deposits
WHERE
	notes LIKE '%Dumbledore%'
GROUP BY
	last_name;