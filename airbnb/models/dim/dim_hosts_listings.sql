{{ config(
    materialized = 'table'
)}}

WITH src_hosts AS (
    SELECT * from {{ ref('src_hosts') }}
),
src_listings AS (
    SELECT * from {{ ref('src_listings') }}
)
SELECT 
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price_str as price,
    l.host_id,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM src_hosts h
JOIN src_listings l 
    ON h.host_id = l.host_id
