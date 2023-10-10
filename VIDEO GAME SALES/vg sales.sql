
--1. What is the total global sales revenue for all the games in the dataset?
select sum([Global_Sales]) as total_global_sales
from vgsales
--2. What are the top 10 best-selling games in terms of global sales?
select top 10 [Name], sum([Global_Sales]) as total_global_sales
from vgsales
group by [Name]
order by total_global_sales desc
--3. Which gaming platform has the most games released?
select Platform, count(Name) as total_games_released
from vgsales
group by Platform
order by  total_games_released desc
--4. What are the top 5 most popular game genres in terms of the number of games released?
select top 5 Genre, count(Name) as total_games_released
from vgsales
group by Genre
order by  total_games_released desc
--5. How have global game sales evolved over the years?
select year,sum([Global_Sales]) as total_global_sales
from vgsales
group by Year
order by total_global_sales desc

--6. Which  gaming platform has most sales?
select Platform,sum([Global_Sales]) as total_global_sales
from vgsales
group by Platform
order by total_global_sales desc

--7. What are the top 5 games in North America, Europe, and Japan in terms of sales?
--			a. north america
select top 5 name, sum(NA_Sales) as total_sales
from vgsales
group by Name
order by total_sales desc

--		b. europe
select top 5 name, sum(EU_Sales) as total_sales
from vgsales
group by Name
order by total_sales desc

--		c. japan 
select top 5 name, sum(JP_Sales) as total_sales
from vgsales
group by Name
order by total_sales desc

-- 8. which publisher has most games released
select Publisher, count(Name) as total_games_released
from vgsales
group by Publisher
order by  total_games_released desc
--9. Which platform-genre combination has the highest average sales?
select Platform, Genre, avg([Global_Sales]) as avg_sales
from vgsales
group by Platform,Genre
order by avg_sales desc
--10. What is the game with the longest title character-wise in the dataset?
select name,len(name) as total_characters
from vgsales
group by Name
order by total_characters desc