WITH total AS (
SELECT
     date_date
     ,COUNT(DISTINCT(orders_id)) AS total_nb_of_transactions
     ,ROUND(SUM(operational_margin), 0) AS operational_margin
     ,ROUND(SUM(revenue), 0) AS total_revenue
     ,ROUND(SUM(purchase_cost), 0) AS total_purchase_cost
     ,ROUND(SUM(shipping_fee), 0) AS total_shipping_fee
     ,ROUND(SUM(log_cost), 0) AS total_log_cost
     ,ROUND(SUM(quantity), 0) AS total_quantity
 FROM {{ref("int_orders_operational")}} 
GROUP BY date_date
)
SELECT 
date_date
,total_nb_of_transactions
,operational_margin
,total_revenue
,total_purchase_cost
,total_shipping_fee
,total_log_cost
,total_quantity
,ROUND(total_revenue/NULLIF(total_nb_of_transactions, 0), 2) AS average_basket
FROM total
ORDER BY  date_date DESC