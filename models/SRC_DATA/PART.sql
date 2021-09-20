{{ config(
    materialized='view',
    schema='SDG_DV_TEST_INGEST',
    pre_hook=[
      "call SDG_DV_TEST.SDG_DV_UTILS.PROC_WAIT_FOR_TAB('PART')"
    ]
    ) }}

SELECT * FROM SDG_DV_TEST_INGEST.PART