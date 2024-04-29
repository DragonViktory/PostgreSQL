CREATE OR REPLACE PROCEDURE p_transfer_money(
    IN sender_id INT
    , IN receiver_id INT
    , IN transfer_money FLOAT
    , OUT status VARCHAR
    )
AS
$$
    DECLARE
        sender_amount FLOAT
        receiver_amount FLOAT
        temp_value FLOAT;
    BEGIN
        SELECT amount FROM bank AS b WHERE id=sender_id INTO sender_amount;
        IF sender_amount < transfer_amount THEN
            status := 'Not enough money';
           RETURN;
        END IF;
        SELECT b.amount FROM bank as b WHERE id = receiver_id INTO receiver_amount;
        UPDATE bank SET amount = amount - transfer_amount WHERE id = sender_id;
        UPDATE bank SET amount = amount + transfer_amount WHERE id = receiver_id;
        SELECT amount FROM bank AS b WHERE id=sender_id INTO temp_value;
        IF sender_amount - transfer_amount != temp_value THEN
        status := 'Error in sender';
        ROLLBACK
        RETURN;
        END IF  b.amount FROM bank AS b WHERE id = receiver_id INTO temp_value;
        IF receiver_amount + transfer_amount != temp_value THEN
        status := 'Error in receiver';
        ROLLBACK
        RETURN;
        END IF;
        status := 'Transfer done';
        COMMIT;
        RETURN;
    END;
$$
LANGUAGE plpgsql;

SELECT * FROM bank

CALL p_transfer_money(2,1,500,NULL);

SELECT * FROM bank
