select
    order_id,
    customer_id,
    cast(order_date as date) as order_date,
    status,
    subtotal,
    tax_amount,
    total_amount,
    currency,
    payment_method,
    shipping_address_id,
    billing_address_id,
    coupon_code
from {{ source('raw', 'orders') }}