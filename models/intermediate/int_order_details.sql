select
    op.order_id,
    o.user_id,
    o.eval_set,
    o.order_number,
    o.order_dow,
    o.order_hour_of_day,
    o.days_since_prior_order,
    op.product_id,
    op.add_to_cart_order,
    op.reordered,
    op.order_source
from {{ ref('int_order_products') }} as op
left join {{ ref('stg_orders') }} as o
    on op.order_id = o.order_id