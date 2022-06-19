{{
    config(
        MATERIALIZED='view'
    )
}}

SELECT 
    e.user_id,
    a.address,
    a.zipcode,
    a.state,
    a.country,
    e.event_id,
    e.page_url,
    e.session_id,
    e.created_at AS event_created_at,
    e.event_type,
    e.order_id,
    e.product_id
FROM {{ ref('greenery_events')}} e
LEFT JOIN {{ref('greenery_orders')}} o
ON o.order_id = e.order_id 
LEFT JOIN {{ref('greenery_addresses')}} a
ON a.address_id = o.address_id