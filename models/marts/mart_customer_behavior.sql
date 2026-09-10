select
    user_id,

    count(distinct order_id) as total_orders,

    count(*) as total_products_purchased,

    count(distinct product_id) as unique_products_purchased,

    sum(reordered) as total_reorders,

    round(
        100 * safe_divide(sum(reordered), count(*)),
        2
    ) as reorder_rate,

    round(
        avg(days_since_prior_order),
        2
    ) as avg_days_between_orders

from {{ ref('int_order_product_details') }}

group by
    user_id