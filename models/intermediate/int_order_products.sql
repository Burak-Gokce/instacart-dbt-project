select
    order_id,
    product_id,
    add_to_cart_order,
    reordered,
    'prior' as order_source
from {{ ref('stg_order_products_prior') }}

union all

select
    order_id,
    product_id,
    add_to_cart_order,
    reordered,
    'train' as order_source
from {{ ref('stg_order_products_train') }}