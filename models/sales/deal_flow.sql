{{ config(
    materialized = 'view',
) }}

SELECT
    deal_id,
    created_at,
    {{deal_stage_grouping('pipeline_stage_label')}} AS stage_group
FROM
    {{ ref('deal_current_stage') }}
WHERE
    pipeline_stage_label is NOT NULL
    AND pipeline_stage_label != 'Closed Lost'
