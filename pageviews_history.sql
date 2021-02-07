INSERT INTO analytics_db.pageviews_history
(
pageview_datetime,
user_id,
url,
postcode
)
SELECT
pve.pageview_datetime ,
pve.user_id,
pve.url,
ue.postcode
FROM master_db.pageviews_extract pve
JOIN master_db.users_extract ue
ON pve.user_id = ue.id
