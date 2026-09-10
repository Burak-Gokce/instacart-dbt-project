select
    od.order_id,
    od.user_id,
    od.eval_set,
    od.order_number,
    od.order_dow,
    od.order_hour_of_day,
    od.days_since_prior_order,
    od.product_id,
    p.product_name,
    p.aisle_id,
    a.aisle,
    p.department_id,
    d.department,
    od.add_to_cart_order,
    od.reordered,
    od.order_source
from {{ ref('int_order_details') }} as od
left join {{ ref('stg_products') }} as p
    on od.product_id = p.product_id
left join {{ ref('stg_aisles') }} as a
    on p.aisle_id = a.aisle_id
left join {{ ref('stg_departments') }} as d
    on p.department_id = d.department_id