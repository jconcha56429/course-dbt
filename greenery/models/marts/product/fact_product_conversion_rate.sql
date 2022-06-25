{{
    config(
        MATERIALIZED='view'
    )
}}

WITH unique_sessions AS(
SELECT 
n.name,
o.product_id,
COUNT(o.product_id) as unique_session_id_count
FROM {{ref('greenery_events')}} e
INNER JOIN {{ref('greenery_order_items')}} o
ON o.order_id = e.order_id 
LEFT JOIN {{ref('greenery_products')}} n
ON n.product_id = o.product_id
WHERE e.event_type = 'checkout'
GROUP BY o.product_id, n.name)

,total_views AS(
SELECT 
product_id,
COUNT(session_id) as view_count
FROM {{ref('greenery_events')}}
WHERE event_type = 'page_view'
GROUP BY product_id)


SELECT 
u.name,
u.product_id,
ROUND(u.unique_session_id_count/t.view_count::float * 100) AS product_conversion_rate
FROM unique_sessions u
INNER JOIN total_views t
ON u.product_id = t.product_id
ORDER BY product_conversion_rate DESC