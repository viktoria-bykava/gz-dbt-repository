select
    m.orders_id,
    m.date_date,
    round(sum(m.revenue), 2) as revenue,
    sum(m.quantity) as quantity,
    round(sum(m.purchase_cost), 2) as purchase_cost,
    round(sum(m.margin), 2) as margin
from {{ ref("int_sales_margin") }} as m
group by 
    m.orders_id, 
    m.date_date
