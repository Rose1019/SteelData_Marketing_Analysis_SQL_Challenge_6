/*Creating Tables and Rows*/

create table sus_clothing
(p_id int primary key,
 p_name varchar(50),
 category varchar(50),
 size varchar(20),
 price float);
 
 insert into sus_clothing
 values
(1, 'Organic Cotton T-Shirt', 'Tops', 'S', 29.99),
(2, 'Recycled Denim Jeans', 'Bottoms', 'M', 79.99),
(3, 'Hemp Crop Top', 'Tops', 'L', 24.99),
(4, 'Bamboo Lounge Pants', 'Bottoms', 'XS', 49.99),
(5, 'Eco-Friendly Hoodie', 'Outerwear', 'XL', 59.99),
(6, 'Linen Button-Down Shirt', 'Tops', 'M', 39.99),
(7, 'Organic Cotton Dress', 'Dresses', 'S', 69.99),
(8, 'Sustainable Swim Shorts', 'Swimwear', 'L', 34.99),
(9, 'Recycled Polyester Jacket', 'Outerwear', 'XL', 89.99),
(10, 'Bamboo Yoga Leggings', 'Activewear', 'XS', 54.99),
(11, 'Hemp Overalls', 'Bottoms', 'M', 74.99),
(12, 'Organic Cotton Sweater', 'Tops', 'L', 49.99),
(13, 'Cork Sandals', 'Footwear', 'S', 39.99),
(14, 'Recycled Nylon Backpack', 'Accessories', 'One Size', 59.99),
(15, 'Organic Cotton Skirt', 'Bottoms', 'XS', 34.99),
(16, 'Hemp Baseball Cap', 'Accessories', 'One Size', 24.99),
(17, 'Upcycled Denim Jacket', 'Outerwear', 'M', 79.99),
(18, 'Linen Jumpsuit', 'Dresses', 'L', 69.99),
(19, 'Organic Cotton Socks', 'Accessories', 'M', 9.99),
(20, 'Bamboo Bathrobe', 'Loungewear', 'XL', 69.99);


create table marketing_camp
(camp_id int primary key,
 camp_name varchar(50),
 p_id int,
 start_date date,
 end_date date,
 foreign key(p_id) references sus_clothing(p_id));
 
insert into marketing_camp
values
(1, 'Summer Sale', 2, '2023-06-01', '2023-06-30'),
(2, 'New Collection Launch', 10, '2023-07-15', '2023-08-15'),
(3, 'Super Save', 7, '2023-08-20', '2023-09-15');


create table transactions
(t_id int primary key,
 p_id int,
 Qty int,
 purchase_date date,
 foreign key(p_id) references sus_clothing(p_id));
 
 insert into transactions
 values
(1, 2, 2, '2023-06-02'),
(2, 14, 1, '2023-06-02'),
(3, 5, 2, '2023-06-05'),
(4, 2, 1, '2023-06-07'),
(5, 19, 2, '2023-06-10'),
(6, 2, 1, '2023-06-13'),
(7, 16, 1, '2023-06-13'),
(8, 10, 2, '2023-06-15'),
(9, 2, 1, '2023-06-18'),
(10, 4, 1, '2023-06-22'),
(11, 18, 2, '2023-06-26'),
(12, 2, 1, '2023-06-30'),
(13, 13, 1, '2023-06-30'),
(14, 4, 1, '2023-07-04'),
(15, 6, 2, '2023-07-08'),
(16, 15, 1, '2023-07-08'),
(17, 9, 2, '2023-07-12'),
(18, 20, 1, '2023-07-12'),
(19, 11, 1, '2023-07-16'),
(20, 10, 1, '2023-07-20'),
(21, 12, 2, '2023-07-24'),
(22, 5, 1, '2023-07-29'),
(23, 10, 1, '2023-07-29'),
(24, 10, 1, '2023-08-03'),
(25, 19, 2, '2023-08-08'),
(26, 3, 1, '2023-08-14'),
(27, 10, 1, '2023-08-14'),
(28, 16, 2, '2023-08-20'),
(29, 18, 1, '2023-08-27'),
(30, 12, 2, '2023-09-01'),
(31, 13, 1, '2023-09-05'),
(32, 7, 1, '2023-09-05'),
(33, 6, 1, '2023-09-10'),
(34, 15, 2, '2023-09-14'),
(35, 9, 1, '2023-09-14'),
(36, 11, 2, '2023-09-19'),
(37, 17, 1, '2023-09-23'),
(38, 2, 1, '2023-09-28'),
(39, 14, 1, '2023-09-28'),
(40, 5, 2, '2023-09-30'),
(41, 16, 1, '2023-10-01'),
(42, 12, 2, '2023-10-01'),
(43, 1, 1, '2023-10-01'),
(44, 7, 1, '2023-10-02'),
(45, 18, 2, '2023-10-03'),
(46, 12, 1, '2023-10-03'),
(47, 13, 1, '2023-10-04'),
(48, 4, 1, '2023-10-05'),
(49, 12, 2, '2023-10-05'),
(50, 7, 1, '2023-10-06'),
(51, 4, 2, '2023-10-08'),
(52, 8, 2, '2023-10-08'),
(53, 16, 1, '2023-10-09'),
(54, 19, 1, '2023-10-09'),
(55, 1, 1, '2023-10-10'),
(56, 18, 2, '2023-10-10'),
(57, 2, 1, '2023-10-10'),
(58, 15, 2, '2023-10-11'),
(59, 17, 2, '2023-10-13'),
(60, 13, 1, '2023-10-13'),
(61, 10, 2, '2023-10-13'),
(62, 9, 1, '2023-10-13'),
(63, 19, 2, '2023-10-13'),
(64, 20, 1, '2023-10-14');

/*QUESTIONS*/

/*1. How many transactions were completed during each marketing campaign?*/

select m.camp_id,m.camp_name,count(t.t_id) as Number_of_Transactions
from transactions t
join marketing_camp m 
using(p_id)
where t.purchase_date between m.start_date and m.end_date
group by m.camp_id,m.camp_name;

/*2. Which product had the highest sales quantity?*/

select s.p_id,s.p_name,t.total_Qty
from sus_clothing s 
join (
		select p_id,sum(Qty) as total_Qty
        from transactions t
        group by p_id
        order by sum(Qty) desc
        limit 1
	) as t
using(p_id);    

/*3. What is the total revenue generated from each marketing campaign?*/

select m.camp_id,m.camp_name,m.p_id,
	   s.price,
       sum(t.Qty) as total_Qty,
       sum(s.price*t.Qty) as revenue
from marketing_camp m 
join sus_clothing s 
using (p_id)
join transactions t 
using(p_id)
group by m.camp_id,m.camp_name,m.p_id,s.price;

/*4. What is the top-selling product category based on the total revenue generated?*/

select  s.category,round(sum(s.price*t.Qty),0) as total_revenue
from sus_clothing s
join transactions t 
using(p_id)
group by s.category
order by total_revenue desc
limit 1;

/*5. Which products had a higher quantity sold compared to the average quantity sold?*/

SELECT t.p_id, SUM(t.Qty) AS total_quantity_sold, AVG(t.Qty) AS average_quantity_sold
FROM Transactions t
GROUP BY t.p_id
HAVING SUM(t.Qty) > AVG(t.Qty);

/*6. What is the average revenue generated per day during the marketing campaigns?*/

with daily_revenue As(
select t.purchase_date,m.camp_id,m.camp_name,round(sum(s.price*t.Qty),0) as daily_revenue
from marketing_camp m
join sus_clothing s
using(p_id)
join transactions t 
using(p_id)
where t.purchase_date between m.start_date AND m.end_date
group by m.camp_id,t.purchase_date
)

select camp_id,camp_name,
       AVG(daily_revenue) as average_daily_revenue
from  daily_revenue
GROUP BY
    camp_id, camp_name;      


/*7. What is the percentage contribution of each product to the total revenue?*/

 /*the percentage contribution of each product to the total revenue*/
with Revenue AS
		   (
			select  s.p_id,
					s.p_name,
					round(sum(s.price*t.Qty),0) as total_revenue_for_each_PDT
			from 
					sus_clothing s
					join transactions t 
					using(p_id)
			group by 
					s.p_name,s.p_id
            )
select *,
	   round((total_revenue_for_each_PDT *100)/sum(total_revenue_for_each_PDT) over (),2) as PCT
from 
		Revenue;       


/*8. Compare the average quantity sold during marketing campaigns to outside the marketing campaigns*/

WITH MarketingAvg AS (
    SELECT AVG(t.Qty) AS avg_quantity_sold
    FROM transactions t
    JOIN marketing_camp mc ON t.p_id = mc.p_id
)

, NonMarketingAvg AS (
    SELECT AVG(t.Qty) AS avg_quantity_sold
    FROM transactions t
    WHERE t.p_id NOT IN (SELECT p_id FROM marketing_camp)
)

SELECT 'Marketing-Campaigns' AS sales_type, avg_quantity_sold FROM MarketingAvg
UNION ALL
SELECT 'Non-Marketing-Campaigns' AS sales_type, avg_quantity_sold FROM NonMarketingAvg;

/*9. Compare the revenue generated by products inside the marketing campaigns to outside the campaigns*/

WITH MarketingRevenue AS (
    SELECT round(SUM(t.Qty * sc.price),2) AS total_revenue
    FROM Transactions t
    JOIN sus_clothing sc ON t.p_id = sc.p_id
    JOIN marketing_camp mc ON t.p_id = mc.p_id
)

, NonMarketingRevenue AS (
    SELECT round(SUM(t.Qty * sc.price),2) AS total_revenue
    FROM transactions t
    JOIN sus_clothing sc ON t.p_id = sc.p_id
    WHERE t.p_id NOT IN (SELECT p_id FROM marketing_camp)
)
	
SELECT 'Marketing-Campaign' AS campaign_type, total_revenue FROM MarketingRevenue
UNION ALL
SELECT 'Non-Marketing-Campaign' AS campaign_type, total_revenue FROM NonMarketingRevenue;
                          
/*10. Rank the products by their average daily quantity sold*/

WITH DailyQuantity AS (
    SELECT
        s.p_id,
        s.p_name,
        AVG(t.Qty) AS avg_daily_quantity
    FROM
        sus_clothing s
        JOIN transactions t ON s.p_id = t.p_id
    GROUP BY
        s.p_id, s.p_name
)
SELECT
    p_id,
    p_name,
    avg_daily_quantity,
    RANK() OVER (ORDER BY avg_daily_quantity DESC) AS rnk,
    dense_rank() over (ORDER BY avg_daily_quantity DESC) AS drnk
FROM
    DailyQuantity
ORDER BY
    avg_daily_quantity DESC;

								
				





























