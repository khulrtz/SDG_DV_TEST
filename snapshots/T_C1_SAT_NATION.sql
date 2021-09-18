{% snapshot T_C1_SAT_NATION%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT ORIGEN AS ST_SOURCE_FROM,
CURRENT_TIMESTAMP AS TS_LOADED_AT
FROM CALCULADO.CALCULADO
{% endsnapshot %}
