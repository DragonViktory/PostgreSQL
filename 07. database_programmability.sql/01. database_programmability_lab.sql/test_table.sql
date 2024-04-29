CREATE TABLE IF NOT EXISTS items;

CREATE TABLE items(
   ID SERIAL PRIMARY KEY
   , status int
   , create_date DATE
);

CREATE TABLE items_log(
   ID SERIAL PRIMARY KEY
   , status int
   , create_date DATE
);

SELECT * FROM items
SELECT * FROM items_log

CREATE OR REPLACE FUNCTION log_items()
RETURNS TRIGGER
$$
    BEGIN
        INSERT INTO items_log(status, create_date)
        VALUES (new.status, new.create_date);
        RETURN new;
    END;
$$
LANGUAGE pgplsql;

CREATE OR REPLACE TRIGGER log_items_trigger
AFTER INSERT ON items
FOR EACH ROW
EXECUTE TRIGGER fn_log_items();

INSERT INTO items(status,create_date)
VALUES
    (1,NOW())
    , (1,NOW())
    , (2,NOW())
    , (3,NOW());

SELECT * FROM items;
SELECT * FROM items_log;

2.

