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
  {{ dbt_utils.date_trunc('hour','created_at') }} as created_at_hours,
  order_cost,
  shipping_cost,
  order_total,
  tracking_id,
  shipping_service,
  estimated_delivery_at,
  delivered_at,
  status
  FROM {{ source('greenery_source', 'orders') }}

