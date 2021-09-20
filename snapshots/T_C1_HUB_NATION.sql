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

SELECT HASH(N_NATIONKEY) AS ID_NATION,
N_NATIONKEY AS CO_NATION,
'SDG_DV_TEST_INGEST.NATION' AS ST_SOURCE_FROM,
(SELECT TS_RUN FROM SDG_DV_TEST.SDG_DV_UTILS.T_UTILS_BATCH_TIMESTAMP) AS TS_LOADED_AT
FROM {{ref('DS.NATION')}}
{% endsnapshot %}
