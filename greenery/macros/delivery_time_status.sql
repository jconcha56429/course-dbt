{% macro delivery_time_status(column_name) %}
CASE WHEN SIGN({{ column_name }}) = 1 THEN 'early'
WHEN SIGN({{column_name }}) = -1 THEN 'late'
WHEN SIGN({{column_name}}) IS NULL THEN NULL
ELSE 'on time'
END 
{% endmacro %}
