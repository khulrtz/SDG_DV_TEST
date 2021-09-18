{% snapshot T_C1_HUB_ORDERS%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_ORDERS',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT HASH(O_ORDERKEY) AS ID_ORDERS,
O_ORDERKEY AS CO_ORDERS,
'SDG_DV_TEST_INGEST.ORDERS' AS ST_SOURCE_FROM,
CURRENT_TIMESTAMP AS TS_LOADED_AT
FROM SDG_DV_TEST_INGEST.ORDERS
{% endsnapshot %}
