SELECT
    d.department_name
    , COUNT (d.id)

FROM employees AS e
JOIN
    departments AS d
ON
    d.id = e.department_id
GROUP BY
    d.id;