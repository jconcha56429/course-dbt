{{
  config(
    materialized='table'
  )
}}

SELECT 
  address_id ,
  address ,
  zipcode,
  state ,
  country 
FROM {{ source('greenery_source', 'addresses') }}
--  greenery_source directory -> navigate to the addresses table 