
--1. Basic Overview:
   -- What are the unique products/items being sold?
select Product
from sales
group by Product

--2. Sales Trends:
   -- i. What is the total revenue generated from sales?
select sum(turnover) as total_turnover
from sales

   -- ii. How does the revenue vary over time ( monthly, quarterly)?
		--a.monthly
select month([Order Date]) as month,SUM(turnover) as total_turnover
from sales
group by month([Order Date])
order by total_turnover desc

		--b. quarterly
select datepart(Quarter,([Order Date])) as quarter,SUM(turnover) as total_turnover
from sales
group by datepart(quarter,([Order Date]))
order by total_turnover desc


   -- iii. is there a relationship between quantity ordered and turnover?
select Product,sum([Quantity Ordered]) as total_quantity,sum(turnover) as total_turnover
from sales
group by Product 
order by total_turnover desc

   --iv.  What is the correlation between average product price and  quantity ordered ?
select Product,avg([Price Each])as avg_price,sum([Quantity Ordered]) as total_quantity
from sales
group by Product
order by avg_price desc

--3. Time Analysis:
   --i. How does the quantity ordered vary across different days of the week?
select datename(weekday,[Order Date]) as day,sum([Quantity Ordered]) as total_quantity
from sales
group by datename(weekday,[Order Date]) 
order by total_quantity desc
   -- ii. What is the busiest month of the year in terms of quantity ordered?
select month([Order Date]) as month,SUM([Quantity Ordered]) as total_quantity
from sales
group by month([Order Date])
order by total_quantity desc

--4. .Profit Analysis:
    -- i. What is the overall profit margin for the business?
select SUM(margin) as total_margin
from sales
    -- ii. Which products have the highest and lowest profit margins?
select Product,sum(margin) as total_margin
from sales 
group by Product
order by total_margin desc
