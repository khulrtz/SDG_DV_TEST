{% snapshot T_C1_SAT_ORDERS%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_ORDER',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT HASH(O_ORDERKEY) AS ID_ORDER,
O_ORDERSTATUS AS ST_ORD_STATUS,
O_TOTALPRICE AS AM_ORD_TOTALPRICE,
O_ORDERDATE AS DT_ORD_DATE,
O_ORDERPRIORITY AS ST_ORD_PRIORITY,
O_CLERK AS ST_ORD_CLERK,
O_SHIPPRIORITY AS NU_ORD_SHIPPRIORITY,
O_COMMENT AS LT_ORD_COMMENT,
'SDG_DV_TEST_INGEST.ORDERS' AS ST_SOURCE_FROM,
(SELECT TS_RUN FROM SDG_DV_TEST.SDG_DV_UTILS.T_UTILS_BATCH_TIMESTAMP) AS TS_LOADED_AT
FROM {{ref('ORDERS')}}
{% endsnapshot %}
