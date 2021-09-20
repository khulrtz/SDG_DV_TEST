{% snapshot T_C1_SAT_REGION%}
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
R_NAME AS ST_REG_NAME,
R_COMMENT AS LT_REG_COMMENT,
'SDG_DV_TEST_INGEST.REGION' AS ST_SOURCE_FROM,
(SELECT TS_RUN FROM SDG_DV_TEST.SDG_DV_UTILS.T_UTILS_BATCH_TIMESTAMP) AS TS_LOADED_AT
FROM {{ref('REGION')}}
{% endsnapshot %}
