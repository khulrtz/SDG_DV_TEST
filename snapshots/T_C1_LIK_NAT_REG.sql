{% snapshot T_C1_LIK_NAT_REG%}
{{
config(
target_database='SDG_DV_TEST',
target_schema='SDG_DV_STG',
unique_key='ID_NAT_REG',

strategy='timestamp',
updated_at='',
)
}}

SELECT HASH(N_NATIONKEY || N_REGIONKEY) AS ID_NAT_REG,
HASH(N_NATIONKEY) AS ID_NATION,
HASH(N_REGIONKEY) AS ID_REGION
FROM SDG_DV_TEST_INGEST.NATION
{% endsnapshot %}
