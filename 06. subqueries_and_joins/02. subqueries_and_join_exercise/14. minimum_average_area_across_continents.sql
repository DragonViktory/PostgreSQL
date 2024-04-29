SELECT
	MIN(average)
FROM (
	SELECT
		AVG(area_in_sq_km) AS average
	FROM
		countries
	GROUP BY
		continent_code
) as average_area;