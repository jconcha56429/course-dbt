{{
    config(
        MATERIALIZED='view'
    )
}}

SELECT 
    user_id,
    event_id,
    session_id,
    event_created_at,
    event_type,
    order_id, 
    product_id,
    page_url
FROM {{ ref('int_product')}}