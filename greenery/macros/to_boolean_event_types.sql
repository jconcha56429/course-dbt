{% macro to_boolean_event_types() %}
    
    {% set column_array = dbt_utils.get_column_values(table=ref('greenery_events'), column='event_type') %}
    {{ log(column_array) }}
   
    {% for event_type in column_array %}

    , case when event_type = '{{event_type}}' then 1 else 0 end as {{event_type}}

    {% endfor %}
{% endmacro %}