--PLSQL Queries

DECLARE
  user_count INTEGER;
BEGIN
  SELECT Count(*) INTO user_count
  FROM userdetails;
  
  dbms_output.put_line('Total users: ' || user_count);  
END;

