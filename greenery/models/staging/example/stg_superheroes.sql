{{
  config(
    materialized='table'
  )
}}

SELECT 
    superhero_id,
    name,
    gender,
    eye_color,
    race,
    hair_color,
    nullif(height,-99) as height,
    publisher,
    skin_color,
    alignment,
    nullif(weight,-99) as weight,
    {{ lbs_to_kgs('weight') }} AS weight_kg

FROM {{ source('tutorial', 'stg_superheroes') }}