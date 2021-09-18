{% snapshot T_C1_LIK_LINEITEM%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_LINEITEM',

strategy='timestamp',
updated_at='TS_LOADED_AT',
)
}}

SELECT HASH(L_ORDERKEY || '-' || L_PARTKEY || '-' || L_SUPPKEY || '-' || L_LINENUMBER) AS ID_LINEITEM,
HASH(L_ORDERKEY) AS ID_ORDER,
HASH(L_PARTKEY) AS ID_PART,
HASH(L_SUPPKEY) AS ID_SUPPLIER,
L_LINENUMBER AS NU_L_LINENUMBER,
'SDG_DV_TEST_INGEST.LINEITEM' AS ST_SOURCE_FROM,
CURRENT_TIMESTAMP AS TS_LOADED_AT
FROM SDG_DV_TEST_INGEST.LINEITEM
{% endsnapshot %}
