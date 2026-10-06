WITH src_host AS ( 
    SELECT
        NVL(host_name, 'Anonymous') as host_name,
        is_superhost,
        created_at,
        updated_at
    FROM
        {{ ref ('src_hosts') }}
)
SELECT * FROM src_host
