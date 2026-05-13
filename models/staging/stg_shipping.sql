-- models/staging/stg_shipping.sql
select
    order_id,
    carrier,
    tracking_number,
    shipping_method,
    shipping_cost,
    cast(ship_date as date) as ship_date,
    cast(estimated_delivery as date) as estimated_delivery,
    cast(actual_delivery as date) as actual_delivery,
    shipping_status,
    weight_kg
from {{ source('raw', 'shipping') }}
