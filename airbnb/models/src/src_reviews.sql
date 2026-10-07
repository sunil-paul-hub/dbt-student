WITH raw_reviews AS(
    SELECT 
        listing_id,
        date AS review_date,
        reviewer_name,
        comments AS review_text,
        sentiment AS review_sentiment
    FROM   
        {{ source('airbnb', 'reviews') }}
)
SELECT
    listing_id,
    review_date,
    reviewer_name,
    review_text,
    review_sentiment     
FROM raw_reviews