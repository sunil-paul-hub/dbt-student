WITH raw_hosts AS (
    SELECT 
        name,
        is_superhost,
        created_at,
        updated_at
    FROM AIRBNB.RAW.RAW_HOSTS
)
SELECT * FROM raw_hosts