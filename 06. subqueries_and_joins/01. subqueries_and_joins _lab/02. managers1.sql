SELECT e.employee_id
    , CONCAT(first_name, ' ', last_name) AS full_name
    , d.department_id
    , d.name AS department_name
FROM employees AS e
RIGHT JOIN departments AS d
ON d.manager_id = e.employee_id
ORDER BY e.employee_id LIMIT 5;