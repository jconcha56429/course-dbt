{{
    config(
        MATERIALIZED='view'
    )
}}



SELECT 
    o.order_id,
    o.user_id,
    u.created_at as user_created_date,
    u.updated_at as user_updated_date,
    CONCAT(ad.address, ' ', ad.zipcode, ' ', ad.state, ' ', ad.country) full_address,
    o.address_id,
    o.promo_id,
    o.created_at as order_created_at,
    o.order_cost,
    o.tracking_id,
    o.estimated_delivery_at,
    o.delivered_at,
    o.status,
    p.discount

    FROM {{ref('greenery_orders')}} o
    LEFT JOIN {{ref ('greenery_users')}} u
    ON o.user_id = u.user_id
    LEFT JOIN {{ref ('greenery_promos')}} p
    ON p.promo_id = o.promo_id
    LEFT JOIN {{ ref ('greenery_addresses')}} ad
    ON ad.address_id = u.address_id