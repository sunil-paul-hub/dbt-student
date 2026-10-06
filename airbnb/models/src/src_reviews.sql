WITH raw_reviews AS(
    SELECT 
        listing_id,
        date AS review_date,
        reviewer_name,
        comments AS review_text,
        sentiment AS review_sentiment
    FROM   
         AIRBNB.RAW.RAW_REVIEWS
)
SELECT
    *
FROM raw_reviews