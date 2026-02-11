select
        date_date,
        orders_id,
        products_id,
        revenue,
        quantity,
        (s.quantity * p.purchase_price) AS purchase_cost,
        ROUND((s.revenue - (s.quantity * p.purchase_price)), 2) AS margin
from {{ref("stg_raw__sales")}} AS s
INNER JOIN {{ref("stg_raw__product")}} AS p
USING(products_id)