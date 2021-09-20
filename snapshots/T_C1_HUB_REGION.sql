{% snapshot T_C1_HUB_REGION%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_REGION',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT HASH(R_REGIONKEY) AS ID_REGION,
R_REGIONKEY AS CO_REGION,
'SDG_DV_TEST_INGEST.REGION' AS ST_SOURCE_FROM,
(SELECT TS_RUN FROM SDG_DV_TEST.SDG_DV_UTILS.T_UTILS_BATCH_TIMESTAMP) AS TS_LOADED_AT
FROM {{ref('REGION')}}
{% endsnapshot %}
