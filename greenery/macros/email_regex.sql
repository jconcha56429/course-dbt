{% test email_regex(model,column_name) %}

SELECT * FROM {{ model }}
WHERE {{ column_name }} !~ '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'

{% endtest %}
