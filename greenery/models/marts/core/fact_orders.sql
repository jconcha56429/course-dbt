{{
    config(
        MATERIALIZED='view'
    )
}}

WITH quantity_sum AS(
    SELECT 
        order_id,
        SUM(quantity) AS order_quantity_total
    FROM {{ref('greenery_order_items')}}
    GROUP BY order_id
)

SELECT 
    o.order_id,
    o.user_id,
    o.address_id,
    o.created_at,
    o.delivered_at,
    EXTRACT (DAY FROM o.delivered_at - o.created_at) AS delivery_time_days,
    o.order_cost,
    o.tracking_id,
    o.status,
    o.promo_id,
    p.discount,
    qs.order_quantity_total
FROM {{ref('greenery_orders')}} o
LEFT JOIN quantity_sum qs
ON o.order_id = qs.order_id
LEFT JOIN {{ ref('greenery_promos')}} p
ON p.promo_id = o.promo_id