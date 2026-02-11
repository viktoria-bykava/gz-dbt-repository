with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        -- shipping_fee_1, skipping since it's same as shipping_fee
        logcost,
        SAFE_CAST(ship_cost AS int64) AS ship_cost

    from source

)

select * from renamed