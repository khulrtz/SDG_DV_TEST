{% macro wait_for_tab(tab) %}
{% set sql %}
    call PROC_WAIT_FOR_TAB(tab)
{% endset %}

{% do run_query(sql) %}
{% do log("Tabla lista", info=True) %}
{% endmacro %}