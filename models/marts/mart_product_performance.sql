select
    product_id,
    product_name,
    aisle,
    department,

    count(*) as total_purchases,

    count(distinct user_id) as unique_customers,

    sum(reordered) as total_reorders,

    round(
        100 * safe_divide(sum(reordered), count(*)),
        2
    ) as reorder_rate,

    round(
        avg(add_to_cart_order),
        2
    ) as avg_add_to_cart_order

from {{ ref('int_order_product_details') }}

group by
    product_id,
    product_name,
    aisle,
    department