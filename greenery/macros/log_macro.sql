
{% macro log_macro() %}

    {% set payment_methods = dbt_utils.get_column_values(table=ref('greenery_orders'), column='shipping_service') %}

    {{log(payment_methods)}}

{% endmacro %}


