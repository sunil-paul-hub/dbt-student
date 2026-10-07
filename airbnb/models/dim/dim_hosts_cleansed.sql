{{ config(
    materialized = 'view'
)}}
WITH src_host AS ( 
    SELECT
        host_id,
        NVL(host_name, 'Anonymous') as host_name,
        IFF(is_superhost = 't', TRUE, FALSE) as is_superhost,
        created_at,
        updated_at
    FROM
        {{ ref ('src_hosts') }}
)
SELECT * FROM src_host
