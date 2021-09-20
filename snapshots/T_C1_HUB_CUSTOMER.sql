{% snapshot T_C1_HUB_CUSTOMER%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_CUSTOMER',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT HASH(C_CUSTKEY) AS ID_CUSTOMER,
C_CUSTKEY AS CO_CUSTOMER,
'SDG_DV_TEST_INGEST.CUSTOMER' AS ST_SOURCE_FROM,
(SELECT TS_RUN FROM SDG_DV_TEST.SDG_DV_UTILS.T_UTILS_BATCH_TIMESTAMP) AS TS_LOADED_AT
FROM {{ref('DS.CUSTOMER')}}
{% endsnapshot %}
