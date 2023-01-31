CREATE TABLE IF NOT EXISTS `events` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`visit_id` integer(255) NOT NULL,
`cookie_id` varchar(255) NOT NULL,
`page_id` integer(33) NOT NULL,
`event_type` varchar(255) NOT NULL,
`sequence_number` integer(255) NOT NULL,
`event_time` varchar(255) NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` integer(255) NOT NULL,
`cookie_id` varchar(255) NOT NULL,
`start_date` integer(33) NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `event_identifier` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`event_type` integer(255) NOT NULL,
`event_name` varchar(255) NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `campaign_identifier` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`campaign_id` integer(255) NOT NULL,
`products` varchar(255) NOT NULL,
`campaign_name` integer(33) NOT NULL,
`start_date` integer(33) NOT NULL,
`end_date` integer(33) NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


CREATE TABLE IF NOT EXISTS `page_hierarchy` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`page_id` integer(255) NOT NULL,
`page_name varchar(255) NOT NULL,
`product_category` integer(33) NOT NULL,
`product_id` integer(33) NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


INSERT INTO `users`(`id`, `user_id`, `cookie_id`, `start_date`) VALUES
(null, "397", "3759ff", "2020-03-30 00:00:00"),
(null, "215", "863329", "2020-01-26 00:00:00"),
(null, "191", "eefca", "2020-03-15 00:00:00"),
(null, "89", "764796", "2020-01-07 00:00:00"),
(null, "127", "17ccc5", "2020-01-22 00:00:00"),
(null, "81", "b0b666", "2020-03-01 00:00:00"),
(null, "260", "a4f236", "2020-01-08 00:00:00"),
(null, "203", "d1182f", "2020-04-18 00:00:00"),
(null, "23", "12dbc8", "2020-01-18 00:00:00"),
(null, "375", "f61d69", "2020-01-03 00:00:00");

INSERT INTO `event_identifier`(`id`, `event_type`, `event_name`) VALUES
(null, "1", "Page View"),
(null, "2", "Add to Cart"),
(null, "3", "Purchase"),
(null, "4", "Ad Impression"),
(null, "5", "Ad Click");

INSERT INTO `events` (`id`, `visit_id`, `cookie_id`, `page_id`, `event_type`, `sequence_number`, `event_time`) VALUES
(null, "719fd3", "3d83d3", "5", "1", "4", "2020-03-02 00:29:09.975502"),
(null, "fb1eb1", "c5ff25", "5", "2", "8", "2020-01-22 07:59:16.76191"),
(null, "23fe81", "1e8c2d", "10", "1", "9", "2020-03-21 13:14:11.745667"),
(null, "ad911aa", "648115", "6", "1", "3", "2020-04-27 16:28:09.824606"),
(null, "5576d7", "ac418c", "6", "1", "4", "2020-01-18 04:55:10.149236"),
(null, "48308b", "c686c1", "8", "1", "5", "2020-01-29 06:10:38.702163"),
(null, "46b17d", "78f9b3", "7", "1", "12", "2020-02-16 09:45:31.926407"),
(null, "9fd196", "ccf057", "4", "1", "5", "2020-02-14 08:29:12.922164"),
(null, "edf853", "f85454", "1", "1", "1", "2020-02-22 12:59:07.652207"),
(null, "3c6716", "02e74f", "3", "2", "5", "2020-01-31 17:56:20.777383");

INSERT INTO `campaign_identifier` (`id`, `campaign_id`, `products`, `campaign_name`, `start_date`, `end_date`) VALUES
(null, "1", "1-3", "BOGOF-Fishing For Compliments", "2020-01-01 00:00:00", "2020-01-14 00:00:00"),
(null, "2", "4-5", "25% Off-Living The Lux Life", "2020-01-15 00:00:00", "2020-01-28 00:00:00"),
(null, "3", "6-8", "Half Off-Treat Your Shelf(ish)", "2020-02-01 00:00:00", "2020-03-31 00:00:00");

INSERT INTO `page_hierarchy` (`id`, `page_id`, `page_name`, `product_category`, `product_id`) VALUES
(null, "1", "Home Page", "null", "null"),
(null, "2", "All products", "null", "null"),
(null, "3", "Salmon", "Fish", "1"),
(null, "4", "Kingfish", "Fish", "2"),
(null, "5", "Tuna", "Fish", "3"),
(null, "6", "Russian Caviar", "Luxury", "4"),
(null, "7", "Black Truffle", "Luxury", "5"),
(null, "8", "Abalone", "Shelfish", "6"),
(null, "9", "Lobster", "Shelfish", "7"),
(null, "10", "Crab", "Shelfish", "8"),
(null, "11", "Oyster", "Shelfish", "9"),
(null, "12", "Checkout", "null", "null"),
(null, "13", "Confirmation", "null", "null");


/*Data Exploration*/
select * from campaign_identifier;
select * from events;
select * from event_identifier;
select * from users;
/*cleaning the nulls*/
UPDATE page_hierarchy
set product_category =
	(CASE 
 		WHEN product_category = '' OR product_category like '%null%'
 			then null
 		ELSE product_category END)
	, product_id =
	(CASE
 		WHEN product_id = '' OR product_id like '%null%' OR product_id is NULL
 			THEN NULL
 		ELSE product_id END)



/*checking the null/empty spaces*/
SELECT * from page_hierarchy
WHERE product_category is null OR product_category = '';


/*1. how many users are there*/
select count(DISTINCT user_id) as user_count
from users;



/*2.How many cookies does each user have on average*/
SELECT user_id,
count(cookie_id) as cookie_id_count
from users
group by user_id;

SELECT round(COUNT(cookie_id), 0) as avg_cookie_id
from users;



/*USERS*/
SELECT * from users;
/*page hierachy*/
select * from page_hierarchy;
/*event_identifier*/
select * from event_identifier;
/*events*/
select * from events;
/*campaign identifier*/
select * from campaign_identifier;
/*1. How many users are there?*/
select COUNT(user_id) 
from users;



/*3. what is the unique number of visits by all users per months*/
SELECT
YEAR(event_time) AS year,
MONTHNAME(event_time) AS month,
DAYNAME(event_time) AS day
FROM events;

SELECT 
MONTHNAME(event_time) AS month,
COUNT(DISTINCT visit_id)
as number_of_visits
from events
group by EXTRACT(MONTH FROM event_time);


/*4. what is the number of event for each event type*/
select event_type,
COUNT(sequence_number)
as number_of_each_event_type
from events
group by sequence_number;

/*getting position of purchase*/
select event_type from event_identifier
where event_identifier.event_name = 'Purchase';


/*5. what is the percentage of visits which have a purchase event?*/
select 3 / SUM(visit_id) * 100
AS Percentage_of_visit
from event_identifier
join events
on events.event_type = event_identifier.event_type
where event_identifier.event_type = 1;

/*#################################################*/

/*6. what is the percentage of visits which view 
the checkout page but do not have a purchase event? */

/*TO KNOW THE COUNT OF THE VISIT OF PAGE VIEW */
select COUNT(event_type) as count_of_page_view,
COUNT(event_type) / SUM(visit_id) * 100 as percentage
from events
where event_type = 1;

/*TO KNOW THE COUNT OF PURCHASE VISIT*/
select COUNT(event_type) as count_of_purchase
from events
where event_type = 3;

/*knowing the count of both*/
select visit_id, 
MAX(case 
    when event_type = 1 and events.page_id= 12 then 1 else 0 END) as checkout,
MAX(case when event_type = 3 then 1 ELSE 0 END) as purchase
from events
group by visit_id;

/*7. what is the top 3 pages by number of views*/
select page_hierarchy.page_name as page_name,
COUNT(*) page_views
from events
join page_hierarchy
on events.page_id = page_hierarchy.page_id
where event_type = 1
GROUP by page_hierarchy.page_name
order by page_views DESC
limit 3;

/*8. what are the top 3 products by purchases*/
SELECT page_hierarchy.product_category as products,
COUNT(*) product_category
from page_hierarchy
GROUP by products
order by product_id DESC
LIMIT 3;

/*9. what is the number of views and cart adds for each product category*/
SELECT DISTINCT page_hierarchy.product_category as products,
	SUM(case WHEN events.event_type = 1 THEN 1 ELSE 0 END) as page_views,
    SUM(CASE WHEN events.event_type = 2 THEN 1 ELSE 0 END) as cart_adds
from events
join page_hierarchy
on events.page_id = page_hierarchy.page_id
where product_category!= ''
group by page_hierarchy.product_category
order by page_views DESC;
        






   


