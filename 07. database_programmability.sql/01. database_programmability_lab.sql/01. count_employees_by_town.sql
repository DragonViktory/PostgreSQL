CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR)
RETURNS INT AS
$$
	DECLARE
		town_count INT;
	BEGIN
		SELECT
			COUNT(*)
		FROM
			employees AS e
			JOIN addresses AS a
				USING(address_id)
					JOIN towns AS t
						USING (town_id)
		WHERE t."name" = town_name
		INTO town_count;
		RETURN town_count;
	END
$$
LANGUAGE plpgsql;
