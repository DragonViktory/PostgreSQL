SELECT
	v.driver_id
	, v.vehicle_type
	, CONCAT(c.first_name, ' ', c.last_name)
FROM campers AS c JOIN
	vehicles as v
		ON v.driver_id = c.id
;
