{% snapshot T_C1_LIK_CUST_ORDERS%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_CUST_ORDERS',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT HASH(O_CUSTKEY || '-' || O_ORDERKEY) AS ID_CUST_ORDERS,
HASH(O_CUSTKEY) AS ID_CUSTOMER,
HASH(O_ORDERKEY) AS ID_ORDER,
'SDG_DV_TEST_INGEST.ORDERS' AS ST_SOURCE_FROM,
CURRENT_TIMESTAMP AS TS_LOADED_AT
FROM SDG_DV_TEST_INGEST.ORDERS
{% endsnapshot %}
