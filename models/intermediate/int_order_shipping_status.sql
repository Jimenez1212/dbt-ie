with orders as (
    select * from {{ ref('stg_orders') }}
),

shipping as (
    select * from {{ ref('stg_shipping') }}
),

joined as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        shipping.carrier,
        shipping.tracking_number,
        shipping.shipping_method,
        shipping.shipping_cost,
        shipping.ship_date,
        shipping.estimated_delivery,
        shipping.actual_delivery,
        shipping.shipping_status,
        datediff('day', orders.order_date, shipping.ship_date) as days_to_ship,
        datediff('day', shipping.estimated_delivery, shipping.actual_delivery) as days_late,
        shipping.actual_delivery > shipping.estimated_delivery as is_late,
        case
            when shipping.ship_date is null then 'not_shipped'
            when shipping.actual_delivery is null then 'unknown'
            when shipping.actual_delivery < shipping.estimated_delivery then 'early'
            when shipping.actual_delivery = shipping.estimated_delivery then 'on_time'
            else 'late'
        end as shipping_performance_bucket
    from orders
    left join shipping using (order_id)
)

select * from joined
