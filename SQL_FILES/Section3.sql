--Joins(inner, left, right, cross, full outer)

--inner join
SELECT u.user_name, a.asset_name, pd.quantity
FROM userdetails u
INNER JOIN portfolio_details pd ON u.user_id = pd.user_id
INNER JOIN assets a ON a.asset_id = pd.asset_id;

--left join
SELECT u.user_name, a.asset_name, pd.quantity
FROM userdetails u
LEFT JOIN portfolio_details pd ON u.user_id = pd.user_id 
LEFT JOIN assets a ON a.asset_id = pd.asset_id;

--right join
SELECT u.user_name, a.asset_name, pd.quantity 
FROM portfolio_details pd
RIGHT JOIN assets a ON a.asset_id = pd.asset_id
RIGHT JOIN userdetails u ON u.user_id = pd.user_id;

--cross join
SELECT u.user_name, a.asset_name
FROM userdetails u
CROSS JOIN assets a;

--full outter join
SELECT u.user_name, a.asset_name, pd.quantity
FROM userdetails u
FULL OUTER JOIN portfolio_details pd ON u.user_id = pd.user_id
FULL OUTER JOIN assets a ON a.asset_id = pd.asset_id;