DROP TABLE IF EXISTS members;
CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `join_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `members` (`id`, `customer_id`, `join_date`) VALUES
(1, 'A', '2021-01-07'),
(2, 'B', '2021-01-09');


DROP TABLE IF EXISTS menu;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `menu` (`id`, `product_id`, `product_name`, `price`) VALUES
(1, '1', 'sushi', '10'),
(2, '2', 'curry', '15'),
(3, '3', 'ramen', '12');


DROP TABLE IF EXISTS sales;
CREATE TABLE `sales` (
  `customer_id` varchar(1) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sales` (`customer_id`, `order_date`, `product_id`) VALUES
('A', '2021-01-01', 1),
('A', '2021-01-01', 2),
('A', '2021-01-07', 2),
('A', '2021-01-10', 3),
('A', '2021-01-11', 3),
('A', '2021-01-11', 3),
('B', '2021-01-01', 2),
('B', '2021-01-02', 2),
('B', '2021-01-04', 1),
('B', '2021-01-11', 1),
('B', '2021-01-16', 3),
('B', '2021-02-01', 3),
('C', '2021-01-01', 3),
('C', '2021-01-01', 3),
('C', '2021-01-07', 3);



/*How many days has each customer visited the restaurant*/
SELECT count(order_date), customer_id
from sales
group by customer_id;

/*what is the total amount each customer spent at the restaurant*/
select customer_id, 
sum(price) as total_amount
from sales
join menu
on sales.product_id = menu.product_id
group by customer_id;


/*what item was the most popular from each customer*/
select product_name,
COUNT(product_name) as product_count
from menu
join sales
on sales.product_id = menu.product_id
group by customer_id;

/*what is the first item from the menu purchased by all customers */
select COUNT(product_name), customer_id, product_name 
as first_item
from menu
join sales
on sales.product_id = menu.product_id;

/*what is the most purchased item on the menu and how many times was it purchased by all customer*/
SELECT count(product_name)
as most_purchased, customer_id
from sales
join menu 
on sales.product_id = menu.product_id
GROUP by sales.product_id, product_name
order by most_purchased
DESC;

/*what item was the most popular for each customers*/
select DISTINCT COUNT(product_name) as most_pular_item, product_name, customer_id 
from sales
join menu
on sales.product_id = menu.product_id
group by customer_id, product_name
order by most_pular_item
DESC;

/*which item was purchased first by the customer after they became a member*/
SELECT members.join_date, sales.customer_id, sales.order_date
from sales
join members
on sales.customer_id = members.customer_id
join menu
on menu.product_id = members.customer_id
where sales.order_date >= members.join_date;

/*number 7. which item was purchased just before the customer became a member*/
SELECT sales.customer_id, menu.product_name, sales.order_date
from sales
join menu
on sales.product_id = menu.product_id
join members
on members.customer_id = sales.customer_id 
where order_date < join_date
GROUP by sales.order_date
LIMIT 3;

/*what is the total items and amount spent for each member before they became a member*/
SELECT sales.customer_id, COUNT(DISTINCT sales.product_id)
as unique_menu_item,
SUM(menu.price) as total_sales
from sales 
join members
on sales.customer_id = members.customer_id
join menu 
on sales.product_id = menu.product_id
where sales.order_date < members.join_date
group by sales.customer_id;









