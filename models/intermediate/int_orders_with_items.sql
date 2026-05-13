with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items_summary as (
    select * from {{ ref('int_order_items_summary') }}
),

joined as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        orders.subtotal,
        orders.tax_amount,
        orders.total_amount,
        orders.currency,
        orders.payment_method,
        orders.shipping_address_id,
        orders.billing_address_id,
        orders.coupon_code,
        order_items_summary.order_id is not null as has_order_items,
        order_items_summary.order_item_count,
        order_items_summary.total_quantity,
        order_items_summary.gross_item_revenue,
        order_items_summary.total_item_discount_amount,
        order_items_summary.net_item_revenue
    from orders
    left join order_items_summary using (order_id)
)

select * from joined
