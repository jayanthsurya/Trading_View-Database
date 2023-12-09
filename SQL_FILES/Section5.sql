-- View Query

CREATE VIEW user_portfolio AS
SELECT user_id, asset_id, Sum(quantity) AS total_quantity
FROM portfolio_details
GROUP BY user_id, asset_id;

select * from user_portfolio;