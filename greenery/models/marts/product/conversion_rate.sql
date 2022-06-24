{{
    config(
        MATERIALIZED='view'
    )
}}

WITH decimal_conversion AS (
SELECT(
SELECT CAST(COUNT(DISTINCT session_id) AS DECIMAL(7,2)) FROM {{ref('int_product')}} WHERE order_id IS NOT NULL)
/
(SELECT CAST(COUNT(DISTINCT session_id) AS DECIMAL(7,2)) FROM {{ref('int_product')}}) * 100 as percentage_conversion) 
  

SELECT CONCAT(ROUND(percentage_conversion,2),'%') AS percent_conversion FROM decimal_conversion 