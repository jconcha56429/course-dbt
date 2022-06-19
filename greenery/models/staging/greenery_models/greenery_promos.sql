{{
  config(
    materialized='table'
  )
}}

SELECT 
  promo_id,
  CAST(discount AS INT),
  status 
FROM {{ source('greenery_source', 'promos') }}
