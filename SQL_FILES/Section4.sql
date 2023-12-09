--Nested Queries(Sub queries)

SELECT user_id, 
       (SELECT Count(*) 
        FROM orders 
        WHERE user_id = o.user_id) AS order_count           
FROM orders o;
