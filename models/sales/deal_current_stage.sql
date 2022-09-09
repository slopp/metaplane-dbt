{{ config(
    materialized = 'view',
) }}

SELECT
    deal_id,
    pipeline_stage_label,
    created_at
FROM
    {{ ref('hubspot__deal_stages') }}
    qualify ROW_NUMBER() over (
        PARTITION BY deal_id
        ORDER BY
            date_stage_entered
    ) = 1
