{{
    config(
        MATERIALIZED='view'
    )
}}

SELECT
DISTINCT(session_id),
SUM(page_view) AS session_page_view_count,
SUM(add_to_cart) AS session_add_cart_count,
SUM(checkout) AS session_checkout_count
FROM {{ref('int_product')}}
GROUP BY session_id 