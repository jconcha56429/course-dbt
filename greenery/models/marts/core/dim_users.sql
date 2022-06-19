{{
    config(
        MATERIALIZED='view'
    )
}}

SELECT 
    user_id,
    CONCAT(first_name, ' ', last_name) AS first_last_name,
    email,
    phone_number,
    address_id,
    created_at AS created_at_utc,
    updated_at AS updated_at_utc
    -- order_count
FROM {{ref('greenery_users')}} 
