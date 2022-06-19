{{
    config(
        MATERIALIZED='view'
    )
}}



SELECT 
    user_id,
    order_id,
    full_address,
    promo_id,
    discount,
    order_created_at,
    order_cost,
    tracking_id,
    estimated_delivery_at,
    delivered_at,
    status
FROM {{ ref ('int_user_order_info')}}
