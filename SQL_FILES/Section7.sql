-- cursor query

DECLARE
  CURSOR c1 IS 
  SELECT * FROM orders 
  WHERE order_status = 'Open';
  
  order_record orders%rowtype;
BEGIN
  OPEN c1;
  
  LOOP
    FETCH c1 INTO order_record;
    EXIT WHEN c1%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || order_record.order_id); 
    DBMS_OUTPUT.PUT_LINE('User ID: ' || order_record.user_id);
    DBMS_OUTPUT.PUT_LINE('Asset ID: ' || order_record.asset_id); 
    DBMS_OUTPUT.PUT_LINE('Order Status: ' || order_record.order_status);
    
    -- process order
    
  END LOOP;
  
  CLOSE c1;
END;