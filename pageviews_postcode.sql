  
INSERT INTO analytics_db.pageviews_postcode
(
date,
hour,
postcode,
number_of_pageviews
)
SELECT
pageview_datetime::date,
hour(pageview_datetime),
postcode,
count(*)
FROM analytics_db.pageviews_history 
JOIN master_db.users_extract 
ON pageviews_history.user_id = users_extract.id
GROUP BY 1, 2, 3
