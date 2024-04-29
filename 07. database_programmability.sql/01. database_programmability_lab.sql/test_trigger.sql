CREATE OR REPLACE FUNCTION delete_last_item_log()
RETURNS TRIGGER AS
$$
    BEGIN
        WHILE (SELECT COUNT(*) FROM items_log) > 10 LOOP
            DELETE FROM items_log WHERE id = (SELECT MIN(id) FROM items_log);
        END LOOP;
        RETURN new;
    END;
$$
LANGUAGE plpgsql;

--SELECT COUNT(*) FROM items_log;

CREATE OR REPLACE TRIGGER clear_item_log
AFTER INSERT ON items_log
FOR EACH STATEMENT
EXECUTE PROCEDURE delete_last_item_log();

SELECT * FROM items_log;

INSERT INTO items(status,create_date)
VALUES
         (1, NOW())
       , (2, NOW())
       , (3, NOW())
       , (4, NOW())
       , (5, NOW())
       , (6, NOW())
       , (7, NOW())
       , (8, NOW())
       , (9, NOW())
       , (10, NOW());
