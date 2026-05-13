with payments as (
    select * from {{ ref('stg_payments') }}
),

summary as (
    select
        order_id,
        count(*) as payment_count,
        sum(amount) as total_paid_amount,
        max(payment_method) as primary_payment_method,
        true as has_successful_payment,
        'paid' as payment_status_summary
    from payments
    group by order_id
)

select * from summary
