{% macro to_boolean_event_types(column_name) %}
    {% for event_type in ["checkout", "package_shipped", "add_to_cart","page_view"] %}

    , case when event_type = '{{event_type}}' then 1 else 0 end as {{event_type}}

    {% endfor %}
{% endmacro %}