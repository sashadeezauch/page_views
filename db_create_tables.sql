/* create schema whereby main tables will be stored */
create schema master_db;

/* create schema where data can be stored when once it has been transformed */
create schema analytics_db;

/* create tables */

CREATE TABLE master_db.pageviews_extract
(
user_id BIGINT,
url VARCHAR(255),
pageview_datetime TIMESTAMP
);

CREATE TABLE master_db.users_extract
( 
id BIGINT,
postcode VARCHAR(50) 
);

CREATE TABLE analytics_db.pageviews_history
(
historical_user_id SERIAL, --to auto increment 
pageview_datetime TIMESTAMP,
user_id BIGINT,
url VARCHAR(255) ,
postcode VARCHAR(50)
);

CREATE TABLE analytics_db.pageviews_postcode
(
date DATE, 
hour INTEGER,
postcode VARCHAR(50),
number_of_pageviews BIGINT
);

CREATE TABLE analytics_db.pageviews_postcode_snapshot
(
date DATE, 
hour INTEGER,
postcode VARCHAR(50),
number_of_pageviews BIGINT
);
