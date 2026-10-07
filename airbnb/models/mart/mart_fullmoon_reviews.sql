{{
    config(
        materialized = 'view'
    )
}}
WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
full_moon_dates As (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT
    r.listing_id,
   TO_DATE(r.review_date) AS review_date,
    r.reviewer_name,
    r.review_text,
    r.review_sentiment,
    CASE 
        WHEN f.full_moon_date IS NOT NULL THEN 1 ELSE 0
    END AS is_full_moon
FROM fct_reviews r
LEFT JOIN full_moon_dates f
    ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, f.full_moon_date))