with product_behavior as (

    select
        user_id,

        count(*) as total_products_purchased,

        count(distinct product_id) as unique_products_purchased,

        sum(reordered) as total_reorders,

        round(
            100 * safe_divide(sum(reordered), count(*)),
            2
        ) as reorder_rate

    from {{ ref('int_order_product_details') }}

    group by user_id
),

order_behavior as (

    select
        user_id,

        count(*) as total_orders,

        round(
            avg(days_since_prior_order),
            2
        ) as avg_days_between_orders

    from (
        select distinct
            user_id,
            order_id,
            days_since_prior_order
        from {{ ref('int_order_product_details') }}
    )

    group by user_id
)

select
    o.user_id,
    o.total_orders,
    p.total_products_purchased,
    p.unique_products_purchased,
    p.total_reorders,
    p.reorder_rate,
    o.avg_days_between_orders

from order_behavior as o

left join product_behavior as p
    on o.user_id = p.user_id