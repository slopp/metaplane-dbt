{% macro deal_stage_grouping(deal_stage_label_field) -%}

    CASE
        WHEN {{deal_stage_label_field}} IN (
            'Closed won',
            'Closed Won'
        ) THEN 'Purchase'
        WHEN {{deal_stage_label_field}} IN (
            'In trial',
            'Deployment to customer',
            'Security',
            'Decision Maker Bought-In'
        ) THEN 'Evaluation'
        WHEN {{deal_stage_label_field}} IN (
            'Appointment scheduled',
            'Technical demo schedued',
            'Deep Dive Demo (Team)',
            'Workshop scheduled',
            'First appointment scheduled'
        ) THEN 'Consideration'
        WHEN {{deal_stage_label_field}} IN (
            'Qualified - Follow-up Scheduled',
            'Qualified - Partner/Reseller',
            'Qualified - No Follow-up Scheduled',
            'Qualified - Sent Outreach'
        ) THEN 'Awareness'
    END

{%- endmacro %}