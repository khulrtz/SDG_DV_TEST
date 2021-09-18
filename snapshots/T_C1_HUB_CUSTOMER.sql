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
ORIGEN AS ST_SOURCE_FROM,
LOADED AS TS_LOADED_AT
FROM SDG_DV_TEST_INGEST.REGION
{% endsnapshot %}
