{% snapshot T_C1_SAT_CUSTOMER %}
    {{
        config(
        target_database='SDG_DV_TEST',
        target_schema='SDG_DV_STG',
        unique_key='ID_CUSTOMER',

        strategy='timestamp',
        updated_at='TS_LOADED_AT',
        )
    }}

   SELECT 
    HASH(C_CUSTKEY) AS ID_CUSTOMER,
    C_NAME AS ST_CUST_NAME,
    C_ADDRESS AS ST_CUST_ADDRESS,
    C_PHONE AS ST_CUST_PHONE,
    C_ACCTBAL AS AM_CUST_ACCTBAL,
    C_MKTSEGMENT AS ST_CUST_MKT_SEGMENT,
    C_COMMENT AS LT_CUST_COMMENT,
    'SDG_DV_TEST_INGEST.CUSTOMER' AS ST_SOURCE_FROM,
    CURRENT_TIMESTAMP AS TS_LOADED_AT
    FROM SDG_DV_TEST_INGEST.CUSTOMER
{% endsnapshot %}