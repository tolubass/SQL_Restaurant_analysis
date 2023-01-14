DROP TABLE IF EXISTS runners;
CREATE TABLE IF NOT EXISTS `runners` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`runner_id` varchar(255) NOT NULL,
`registration_date` varchar(255) NOT NULL,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `runners`(`id`, `runner_id`, `registration_date`) VALUES
(null, "1", "2021-01-01"),
(null, "2", "2021-01-03"),
(null, "3", "2021-01-08"),
(null, "4", "2021-01-15");

Drop TABLE if EXISTS customer_orders;
CREATE TABLE IF NOT EXISTS `customer_orders` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`order_id` varchar(255) NOT NULL,
`customer_id` varchar(255) NOT NULL,
`pizza_id` varchar(255) NOT NULL,
`exclusions` varchar(255) NOT NULL,
`extras` varchar(255) NOT NULL,
`order_time` TIMESTAMP,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `customer_orders`(`id`, `order_id`, `customer_id`, `pizza_id`, `exclusions`, `extras`, `order_time`) VALUES
(null, "1", "101", "1", " ", " ", "2020-01-01 18:05:02"),
(null, "2", "101", "1", " ", " ", "2020-01-01 19:00:52"),
(null, "3", "102", "1", " ", " ", "2020-01-02 23:51:23"),
(null, "3", "102", "2", " ", "NULL", "2020-01-02 23:51:23"),
(null, "4", "103", "1", "4", " ", "2020-01-04 13:23:46"),
(null, "4", "103", "1", "4", " ", "2020-01-04 13:23:46"),
(null, "4", "103", "2", "4", " ", "2020-01-04 13:23:46"),
(null, "5", "104", "1", "null", "1", "2020-01-08 21:00:09"),
(null, "6", "101", "2", "null", "null", "2020-01-08 21:03:13"),
(null, "7", "105", "2", "null", "1", "2020-01-08 21:20:29"),
(null, "8", "102", "1", "null", "null", "2020-01-09 23:54:33"),
(null, "9", "103", "1", "4", "1,5", "2020-01-10 11:22:59"),
(null, "10", "104", "1", "null", "null", "2020-01-11 18:34:49"),
(null, "10", "104", "1", "2, 6", "1, 4", "2020-01-11 13:34:49");


DROP TABLE IF EXISTS runner_orders;
CREATE TABLE IF NOT EXISTS `runner_orders` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`order_id` varchar(255) NOT NULL,
`runner_id` varchar(255) NOT NULL,
`pickup_time` varchar(255) NOT NULL,
`distance` varchar(255) NOT NULL,
`duration` varchar(255) NOT NULL,
`cancellation` varchar(255) NOT NULL,   
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `runner_orders`(`id`, `order_id`, `runner_id`, `pickup_time`, `distance`, `duration`, `cancellation`) VALUES
(null, "1", "1", "2020-01-01 18:15:34", "20km", "32 minutes", " "),
(null, "2", "1", "2020-01-01 19:1:54", "20km", "27 minutes", " "),
(null, "3", "1", "2020-01-03 00:12:37", "13.4km", "20 minutes", "NULL"),
(null, "4", "2", "2020-01-04 13:53:03", "23.4km", "40 minutes", "NULL"),
(null, "5", "3", "2020-01-08 21:10:57", "20km", "15", "NULL"),
(null, "6", "3", "null", "null", "null", "Restaurant Cancellation"),
(null, "7", "2", "2020-01-08 21:30:45", "25km", "25 mins", "null"),
(null, "8", "2", "2020-01-10 00:15:02", "23.4km", "15 minute", "null"),
(null, "9", "2", "null", "null", "null", "Customer Cancellation"),
(null, "10", "1", "2020-01-11 18:50:20", "10km", "10 minutes", "null");

DROP TABLE IF EXISTS pizza_names;
CREATE TABLE IF NOT EXISTS `pizza_names` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pizza_id` varchar(255) NOT NULL,
`pizza_name` varchar(255) NOT NULL,  
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


INSERT INTO `pizza_names`(`id`, `pizza_id`, `pizza_name`) VALUES
(null, "1", "Meatlovers"),
(null, "2", "Vegetarian");


DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE IF NOT EXISTS `pizza_recipes` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pizza_id` varchar(255) NOT NULL,
`toppings` varchar(255) NOT NULL,  
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `pizza_recipes`(`id`, `pizza_id`, `toppings`) VALUES
(null, "1", "1, 2, 3, 4, 5, 6, 8, 10"),
(null, "2", "4, 6, 7, 9, 11, 12");


DROP TABLE IF EXISTS pizza_toppings;
CREATE TABLE IF NOT EXISTS `pizza_toppings` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`topping_id` varchar(255) NOT NULL,
`topping_name` varchar(255) NOT NULL,  
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;


INSERT INTO `pizza_toppings`(`id`, `topping_id`, `topping_name`) VALUES
(null, "1", "Bacon"),
(null, "2", "BBQ Sauce"),
(null, "3", "Beef"),
(null, "4", "Cheese"),
(null, "5", "Chicken"),
(null, "6", "Mushrooms"),
(null, "7", "Onions"),
(null, "8", "Pepperoni"),
(null, "9", "Peppers"),
(null, "10", "Salami"),
(null, "11", "Tomatoes"),
(null, "12", "Tomato Sauce");



Drop TABLE if EXISTS customer_orders1;
CREATE TABLE IF NOT EXISTS `customer_orders1` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`order_id` varchar(255) NOT NULL,
`customer_id` varchar(255) NOT NULL,
`pizza_id` varchar(255) NOT NULL,
`exclusions` varchar(255) NOT NULL,
`extras` varchar(255) NOT NULL,
`order_time` TIMESTAMP,
PRIMARY KEY(`id`)
) ENGINE=innoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

/*cleaning data for customer_orders*/
UPDATE customer_orders
SET
exclusions = case exclusions
WHEN 'null' then null ELSE
exclusions end,
extras = case extras when 'null' then null ELSE extras
end;


/*cleaning for runner_orders*/
UPDATE runner_orders
SET
pickup_time = case pickup_time
WHEN 'null' then null ELSE
pickup_time end,
duration = case duration when 'null' 
then null ELSE duration
end;

UPDATE runner_orders
SET
cancellation = case cancellation
WHEN 'null' then null ELSE
pickup_time end,
runner_orders.distance= case runner_orders.distance when 'null' 
then null ELSE runner_orders.distance
end;

/*cleaning data fro customer_orders*/
UPDATE customer_orders
SET
exclusions = case exclusions
WHEN 'null' then null ELSE
exclusions end,
extras = case extras when 'null' 
then null ELSE extras
end;

/*cleaning for runner_orders*/
update runner_orders1
SET
pickup_time = case
pickup_time when 'null' then 
null ELSE pickup_time end,
duration = case duration WHEN
'null' then null ELSE
duration end,
cancellation = CASE
cancellation when 'null' then 
null ELSE cancellation end;


/*answers to problems*/

/*1. How many pizzas were ordered*/
select COUNT(pizza_id) 
as totalnumberofpizza
from customer_orders;

/*2. how many unique customers were made*/
SELECT count(DISTINCT order_id)
as number_of_unique_customers
from customer_orders;

/*3. how many succesful orders were delivered by each runner*/
SELECT runner_id, sum(order_id) 
as Num_Of_Successful_orders
from runner_orders
group by runner_id;

/*4. How many of each type of pizza was deleivered*/
SELECT pizza_name,
COUNT(customer_orders.pizza_id)
as total_delivered
from customer_orders
join runner_orders
on customer_orders.order_id = runner_orders.order_id
INNER JOIN pizza_names
on pizza_names.pizza_id = customer_orders.pizza_id
where runner_orders.distance 
is not null
group by customer_orders.pizza_id;


/*5. How many vegetarians and meatlovers were ordered by each customers*/
SELECT pizza_name, customer_id, 
COUNT(customer_orders.pizza_id)
as total_pizza_ordered 
from customer_orders
INNER join pizza_names
on pizza_names.pizza_id = customer_orders.pizza_id
GROUP BY customer_id , pizza_name
ORDER BY customer_orders.customer_id;
