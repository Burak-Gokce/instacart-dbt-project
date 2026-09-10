select
    order_dow,
    order_hour_of_day,

    count(distinct order_id) as total_orders,

    count(*) as total_products_purchased,

    count(distinct user_id) as unique_customers,

    round(
        avg(add_to_cart_order),
        2
    ) as avg_basket_position,

    round(
        100 * safe_divide(sum(reordered), count(*)),
        2
    ) as reorder_rate

from {{ ref('int_order_product_details') }}

group by
    order_dow,
    order_hour_of_day