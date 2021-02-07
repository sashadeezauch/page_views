INSERT INTO analytics_db.pageviews_postcode_snapshot
(
date,   
hour,
postcode,
pageviews_count
)                      
SELECT
pageview_datetim::date,
hour(pageview_datetime),
postcode,
count(*) 
FROM analytics_db.pageviews_history
WHERE pageview_datetime::date >= current_date
AND hour(pageview_datetime) >= date_trunc('hour', current_timestamp)
GROUP BY 1, 2, 3
