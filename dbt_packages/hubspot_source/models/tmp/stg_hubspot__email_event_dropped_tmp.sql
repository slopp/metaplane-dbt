{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_dropped_enabled'])) }}

select *
from {{ var('email_event_dropped') }}
