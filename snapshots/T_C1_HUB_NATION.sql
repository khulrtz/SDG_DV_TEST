{% snapshot T_C1_HUB_NATION%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_NATION',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT HASH(C_NATIONKEY) AS ID_NATION,
C_NATIONKEY AS CO_NATION,
'SDG_DV_TEST_INGEST.NATION' AS ST_SOURCE_FROM,
CURRENT_TIMESTAMP AS TS_LOADED_AT
FROM SDG_DV_TEST_INGEST.NATION
{% endsnapshot %}
