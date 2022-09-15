{{ config(
    materialized = 'view',
) }}

SELECT
    df.deal_id,
    df.created_at,
    df.stage_group,
    hd.deal_name,
    hd.amount,
    hd.owner_full_name,
    pipeline_label
FROM
    {{ ref('deal_flow') }}
    df
    JOIN {{ ref('hubspot__deals') }}
    hd
    ON df.deal_id = hd.deal_id --need to test this join
