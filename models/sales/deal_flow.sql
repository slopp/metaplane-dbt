{{ config(
    materialized = 'view',
) }}

SELECT
    deal_id,
    created_at,
    CASE
        WHEN pipeline_stage_label IN (
            'Closed won',
            'Closed Won'
        ) THEN 'Purchase'
        WHEN pipeline_stage_label IN (
            'In trial',
            'Deployment to customer',
            'Security',
            'Decision Maker Bought-In'
        ) THEN 'Evaluation'
        WHEN pipeline_stage_label IN (
            'Appointment scheduled',
            'Technical demo schedued',
            'Deep Dive Demo (Team)',
            'Workshop scheduled',
            'First appointment scheduled'
        ) THEN 'Consideration'
        WHEN pipeline_stage_label IN (
            'Qualified - Follow-up Scheduled',
            'Qualified - Partner/Reseller',
            'Qualified - No Follow-up Scheduled',
            'Qualified - Sent Outreach'
        ) THEN 'Awareness'
    END AS stage_group
FROM
    {{ ref('deal_current_stage') }}
WHERE
    pipeline_stage_label is NOT NULL
    AND pipeline_stage_label != 'Closed Lost'
