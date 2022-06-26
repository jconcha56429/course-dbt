{{
  config(
    materialized='table'
  )
}}

SELECT 
  order_id,
  user_id,
  promo_id,
  address_id,
  created_at,
  order_cost,
  shipping_cost,
  order_total,
  tracking_id,
  shipping_service,
  estimated_delivery_at,
  delivered_at,
  status,
  {{dbt_utils.datediff('delivered_at','estimated_delivery_at', 'day')}} as estimated_vs_actual_delivery_date

  FROM {{ source('greenery_source', 'orders') }}

