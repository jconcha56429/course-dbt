{% macro date_time(column_name) %}
    -- ROUND(
    --    (CASE WHEN {{ column_name }} = -99 THEN NULL ELSE {{ column_name }} END / 2.205)::NUMERIC, 
    --    {{ precision }}
    -- )
     DATEPART(hour, {{column_name}} )

{% endmacro %}
