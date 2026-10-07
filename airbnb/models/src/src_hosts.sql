WITH raw_hosts AS (
    SELECT
        id AS host_id,
        name AS host_name,
        is_superhost,
        created_at,
        updated_at
    FROM AIRBNB.RAW.RAW_HOSTS
)
SELECT * FROM raw_hosts