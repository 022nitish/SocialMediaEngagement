SELECT * FROM social_media.`social media engagement dataset (1)`;
 -- Platform-wise total posts:
SELECT platform, COUNT(*) AS total_posts
FROM `social media engagement dataset (1)`
GROUP BY platform;

-- Sentiment distribution
select sentiment_label, count(*)as sentiment_count
from `social media engagement dataset (1)`
group by  sentiment_label;
--  Top 5 campaigns by impressions
select campaign_name , sum(impressions) as total_impressions
from `social media engagement dataset (1)`
group by campaign_name
order by total_impressions desc
limit 5;

--  Campaign performance: Engagement vs Sentiment
SELECT 
    campaign_name,
    AVG(sentiment_score) AS avg_sentiment,
    AVG(engagement_rate) AS avg_engagement
from `social media engagement dataset (1)`

GROUP BY campaign_name;
-- High-toxicity posts (Toxic > 0.7)
SELECT post_id, platform, text_content, toxicity_score
from `social media engagement dataset (1)`
WHERE toxicity_score > 0.7
ORDER BY toxicity_score DESC;

--  Most engaging posts
SELECT post_id, platform, engagement_rate, text_content
from `social media engagement dataset (1)`
ORDER BY engagement_rate DESC
LIMIT 10;

--  Virality score = likes + shares + comments / impressions
SELECT 
    post_id,
    platform,
    (likes_count + shares_count + comments_count) / impressions AS virality_score
FROM `social media engagement dataset (1)`
ORDER BY virality_score DESC
LIMIT 10;

-- Emotion Analysis per Brand
SELECT 
    brand_name,
    emotion_type,
    COUNT(*) AS emotion_count
FROM `social media engagement dataset (1)`
GROUP BY brand_name, emotion_type
ORDER BY brand_name, emotion_count DESC;

-- Extract sentiment score average per day for time-series analysis
SELECT 
    DATE(timestamp) AS post_date,
    AVG(sentiment_score) AS avg_sentiment
FROM `social media engagement dataset (1)`
GROUP BY DATE(timestamp)
ORDER BY post_date;
 


