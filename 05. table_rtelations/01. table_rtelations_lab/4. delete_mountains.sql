CREATE TABLE mountains(
	ID SERIAL PRIMARY KEY
	, name VARCHAR (50)
);

CREATE TABLE peaks(
	ID SERIAL PRIMARY KEY
	, name VARCHAR(50)
	, mountain_id int
	, CONSTRAINT fk_mountain_id
		FOREIGN KEY (mountain_id)
			REFERENCES mountains(id)
				ON DELETE CASCADE
);