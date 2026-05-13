with orders as (
    select * from {{ ref('stg_orders') }}
),

sequenced as (
    select
        order_id,
        customer_id,
        order_date,
        status,
        row_number() over (
            partition by customer_id
            order by order_date, order_id
        ) as customer_order_number,
        lag(order_date) over (
            partition by customer_id
            order by order_date, order_id
        ) as previous_order_date
    from orders
),

final as (
    select
        order_id,
        customer_id,
        order_date,
        status,
        customer_order_number,
        customer_order_number = 1 as is_first_order,
        previous_order_date,
        datediff('day', previous_order_date, order_date) as days_since_previous_order
    from sequenced
)

select * from final
