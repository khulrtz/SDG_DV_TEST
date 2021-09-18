{% snapshot T1_C1_LIK_LINEITEM%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_LINEITEM',

strategy='timestamp',
updated_at='',
)
}}

SELECT HASH(L_ORDERKEY || L_PARTKEY || L_SUPPKEY) AS ID_LINEITEM,
HASH(L_ORDERKEY) AS ID_ORDER,
HASH(L_PARTKEY) AS ID_PART,
HASH(L_SUPPKEY) AS ID_SUPPLIER
FROM SDG_DV_TEST_INGEST.LINEITEM
{% endsnapshot %}
