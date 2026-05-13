with orders_with_items as (
    select * from {{ ref('int_orders_with_items') }}
),

shipping_status as (
    select * from {{ ref('int_order_shipping_status') }}
),

payments_by_order as (
    select * from {{ ref('int_payments_by_order') }}
),

enriched as (
    select
        orders_with_items.order_id,
        orders_with_items.customer_id,
        orders_with_items.order_date,
        orders_with_items.status,
        orders_with_items.subtotal,
        orders_with_items.tax_amount,
        orders_with_items.total_amount,
        orders_with_items.currency,
        orders_with_items.coupon_code,
        orders_with_items.has_order_items,
        orders_with_items.order_item_count,
        orders_with_items.total_quantity,
        orders_with_items.gross_item_revenue,
        orders_with_items.net_item_revenue,
        shipping_status.carrier,
        shipping_status.shipping_method,
        shipping_status.shipping_cost,
        shipping_status.ship_date,
        shipping_status.estimated_delivery,
        shipping_status.actual_delivery,
        shipping_status.shipping_status,
        shipping_status.days_to_ship,
        shipping_status.days_late,
        shipping_status.is_late,
        shipping_status.shipping_performance_bucket,
        payments_by_order.payment_count,
        payments_by_order.total_paid_amount,
        payments_by_order.primary_payment_method,
        payments_by_order.has_successful_payment,
        payments_by_order.payment_status_summary,
        orders_with_items.status = 'completed' as is_completed_order,
        orders_with_items.status = 'cancelled' as is_cancelled_order,
        orders_with_items.status = 'refunded' as is_refunded_order,
        payments_by_order.has_successful_payment as is_paid
    from orders_with_items
    left join shipping_status using (order_id)
    left join payments_by_order using (order_id)
)

select * from enriched
