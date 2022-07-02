{{
    config(
        MATERIALIZED='view'
    )
}}


WITH checkout_funnel_count AS (SELECT 
COUNT(session_add_cart_count) AS checkout_count 
FROM {{ref('fact_session_funnel')}}
WHERE session_checkout_count > 0)
,
add_cart_funnel_count AS (
SELECT 
COUNT(session_add_cart_count) AS add_to_cart_count
FROM {{ref('fact_session_funnel')}}
WHERE session_add_cart_count > 0)


SELECT (SELECT COUNT(session_id) AS total_unique_sessions FROM {{ref('fact_session_funnel')}}),
(SELECT add_to_cart_count FROM add_cart_funnel_count),
(SELECT checkout_count FROM checkout_funnel_count),
((SELECT add_to_cart_count::numeric FROM add_cart_funnel_count)/(SELECT COUNT(session_id)::numeric FROM dbt.dbt_jacob_c.fact_session_funnel)*100) AS checkout_funnel_rate,
((SELECT checkout_count::numeric FROM checkout_funnel_count)/(SELECT add_to_cart_count::numeric FROM add_cart_funnel_count)*100) AS add_to_cart_funnel_rate

