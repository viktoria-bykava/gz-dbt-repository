WITH total AS (
SELECT
     o.date_date
     ,COUNT(DISTINCT(o.orders_id)) AS total_nb_of_transactions
     ,ROUND(SUM(s.operational_margin), 0) AS operational_margin
     ,ROUND(SUM(o.revenue), 0) AS total_revenue
     ,ROUND(SUM(o.purchase_cost), 0) AS total_purchase_cost
     ,ROUND(SUM(s.shipping_fee), 0) AS total_shipping_fee
     ,ROUND(SUM(s.log_cost), 0) AS total_log_cost
     ,ROUND(SUM(o.quantity), 0) AS total_quantity
 FROM {{ref("int_orders_margin")}} o
 INNER JOIN {{ref("int_orders_operational")}} s
     USING(date_date)
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