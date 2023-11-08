# Marketing-Analysis-SQL - CHALLENGE 6

### Introduction
You are a Marketing Analyst.The 'Sustainable Clothing Co.' 
have been running several marketing campaigns and have asked you to provide your insight into whether they have been successful or not.   
Analyse the following data and answer the questions to form your answer.

Sharing the link to [SteelData-SQL Challenge 6](https://www.steeldata.org.uk/sql6.html)

-----------------------------------------------------------------------------------------------------------------------------------------
## Table Details 

| Table Name | Column Name |
| ---------- | ----------- |
| Sustainable_Clothing | Product_id,Category,Size,Price |
| Transactions | Transaction_id,product_id,quanitity,purchase_date |
| Marketing_campaigns | Campaign_id,campaign_name,product_id,start_date,end_date |

------------------------------------------------------------------------------------------------------------------------------------------

## Code

*1. How many transactions were completed during each marketing campaign?*/

``` js
select m.camp_id,m.camp_name,count(t.t_id) as Number_of_Transactions
from transactions t
join marketing_camp m 
using(p_id)
where t.purchase_date between m.start_date and m.end_date
group by m.camp_id,m.camp_name;
``` 

```
                                 Output
The summer sale campaign generated five transactions, the new collection campaign resulted in four transactions,
while the super save campaign only yielded a single transaction.

                              Concepts learned
1.JOIN
2.COUNT()
3.USING()
4.BETWEEN
5.GROUP BY
```
-----------------------------------------------------------------------------------------------------

*2. Which product had the highest sales quantity?*/

``` js
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
``` 

```
                                Output
The product identified as "Organic Cotton Sweater" with a product ID of 12
attained the highest sales quantity, reaching a total of 9 units sold.

                          Concepts learned
1.JOIN
2.SUBQUERY
3.USING()
4.SUM()
5.GROUP BY
6.ORDER BY
7.LIMIT
```
-----------------------------------------------------------------------------------------------------

*3. What is the total revenue generated from each marketing campaign?*/

``` js
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
``` 

```
                                Output
The Summer sale campaign contributed $639.92 in total revenue,
the New Collection Launch campaign generated $439.92 in revenue,
and the Super Save campaign added $209.97 to the overall earnings.

                            Concepts learned
1.JOIN
2.GROUP BY
3.USING()
4.SUM()
5.ROUND()
```
-----------------------------------------------------------------------------------------------------

*4. What is the top-selling product category based on the total revenue generated?*/

``` js
select  s.category,round(sum(s.price*t.Qty),0) as total_revenue
from sus_clothing s
join transactions t 
using(p_id)
group by s.category
order by total_revenue desc
limit 1;
``` 

```
                               Output

The product category "Bottoms" secured the top position in terms of total revenue, accumulating $1290 in sales.

                            Concepts learned
1.JOIN
2.GROUP BY
3.USING()
4.SUM()
5.ROUND()
6.ORDER BY
```
-----------------------------------------------------------------------------------------------------

*5. Which products had a higher quantity sold compared to the average quantity sold?*/

``` js
SELECT t.p_id, SUM(t.Qty) AS total_quantity_sold, AVG(t.Qty) AS average_quantity_sold
FROM Transactions t
GROUP BY t.p_id
HAVING SUM(t.Qty) > AVG(t.Qty);
``` 

```
                               Output

A total of 18 rows were obtained, representing products where the quantity sold exceeded the average quantity sold.

                            Concepts learned
1.GROUP BY
2.HAVING()
3.AVG()
```
-----------------------------------------------------------------------------------------------------

*6. What is the average revenue generated per day during the marketing campaigns?*/

``` js
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

``` 

```
                               Output
The Summer Sale campaign achieved an average daily revenue of $96,
the New Collection Launch campaign attained an average daily revenue of $55,
and the Super Save campaign recorded an average daily revenue of $70.

			Concepts learned
1.CTE
2.JOIN
3.GROUP BY
4.AVG()
```
-----------------------------------------------------------------------------------------------------

*7. What is the percentage contribution of each product to the total revenue?*/

``` js
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
``` 

```
				Output
Output consisting of 20 rows,each presenting the total revenue alongside
the corresponding percentage contribution to the overall revenue.

                            Concepts learned
1.WINDOWS FUNCTION- OVER()
2.CTE
2.JOIN
3.GROUP BY
```
-----------------------------------------------------------------------------------------------------

*8. Compare the average quantity sold during marketing campaigns to outside the marketing campaigns*/

``` js

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
``` 

```
				Output
The average quantity sold during marketing campaigns is 1.18,
while the average quantity sold outside of marketing campaigns is 1.43.

This indicates that, on average, products not associated with marketing campaigns tend
to have a slightly higher quantity sold compared to those included in marketing campaigns.

                            Concepts learned
1.CTE
2.JOIN
3.UNION ALL
```
-----------------------------------------------------------------------------------------------------

*9. Compare the revenue generated by products inside the marketing campaigns to outside the campaigns*/

``` js
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
``` 

```
				Output
The total revenue during marketing campaigns is $1,289.81,
whereas the total revenue outside of marketing campaigns is $3,379.31.

This indicates that products outside of marketing campaigns generated significantly
higher revenue compared to products within marketing campaigns.

                            Concepts learned
1.CTE
2.JOIN
3.UNION ALL
```
-----------------------------------------------------------------------------------------------------

*10. Rank the products by their average daily quantity sold*/

``` js
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
``` 

```
				Output
All 20 products have been ranked based on their respective average daily quantity values.

                            Concepts learned
1.CTE
2.JOIN
3.WINDOWS FUNCTION : RANK90 AND DENSE_RANK()
```
-----------------------------------------------------------------------------------------------------
