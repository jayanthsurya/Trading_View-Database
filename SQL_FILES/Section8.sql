--trigger query

CREATE TRIGGER user_delete 
BEFORE DELETE
ON userdetails FOR EACH ROW
BEGIN
  DELETE FROM orders WHERE user_id = :old.user_id;
  DELETE FROM portfolio_details WHERE user_id = :old.user_id; 
END;
