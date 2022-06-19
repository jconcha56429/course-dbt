{{
    config(
        MATERIALIZED='view'
    )
}}

SELECT 
    user_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS first_last_name,
    email,
    phone_number,
    address_id,
    created_at AS created_at_utc,
    updated_at AS updated_at_utc
FROM {{ref('greenery_users')}} 
