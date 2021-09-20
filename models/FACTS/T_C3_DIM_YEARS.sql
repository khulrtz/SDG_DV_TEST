{{ config(materialized='table',schema='SDG_DV_C2') }}
SELECT YEAR FROM {{ref('T_C2_SAT_TOTAL_PRODUCTS')}} 
UNION
SELECT YEAR FROM {{ref('T_C2_SAT_TOTAL_ORDERS')}} 
UNION
SELECT YEAR FROM {{ref('T_C2_SAT_TOTAL_AMOUNT')}} 
