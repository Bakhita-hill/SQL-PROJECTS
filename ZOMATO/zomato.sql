
--1.Geographical Insights:
   -- a. What are the top 10 cities with the highest number of restaurants?
select top 10 city,count([Restaurant Name]) as total_restraunt_number
from zomato
group by city
order by total_restraunt_number desc

   -- b.  How many restaurants are there in each city?
select city,count([Restaurant Name]) as total_restraunt_number
from zomato
group by city
order by total_restraunt_number desc

  -- c.  Which areas within a city have the highest concentration of restaurants?
select city,Locality,count([Restaurant Name]) as total_restaurant
from zomato
group by city ,Locality
order by total_restaurant desc

   -- d. Which city has the highest average restaurant rating?
select city,avg([Aggregate rating]) as average_rating
from zomato
group by city
order by average_rating desc

--2.Cuisine and Restaurant Type:
   -- a.  What are the top 10 most common cuisines among listed restaurants?
select top 10  cuisines,count([Restaurant Name]) as total_restraunt_number
from zomato
group by Cuisines
order by total_restraunt_number desc

   -- b.  How many restaurants offer a specific cuisine type?
select Cuisines,count([Restaurant Name]) as total_restraunt_number
from zomato
group by Cuisines
order by total_restraunt_number desc

   -- c.  What is the average cost for two people for each cuisine?
select Cuisines,avg([Average Cost for two]) as average_cost_for_two_people,Currency
from zomato
group by Cuisines,Currency
order by average_cost_for_two_people desc

   -- d. Are there any cities with a higher concentration of specific cuisines?
select city,Cuisines,count(Cuisines) as total_cuisines
from zomato
group by city,Cuisines
order by total_cuisines desc

--3.Ratings and Reviews:
   -- a.  What is the distribution of restaurant ratings (average, minimum, maximum, median)?
		-- i.average rating
select avg([Aggregate rating]) as average_rating
from zomato
		-- ii. minimum rating 
select min([Aggregate rating]) as minimum_rating
from zomato
		-- iii. maximum rating
select max([Aggregate rating]) as maximum_rating
from zomato
		-- iv. mediam
select PERCENTILE_CONT(0.5) within group (order by [aggregate rating]) over() as median
from zomato

   -- b.  Is there a relationship between the number of votes and the overall aggregate rating of a restaurant?
select [Aggregate rating] ,votes 
from zomato
order by [aggregate rating] desc

   -- c. How many restaurants have a rating above a 4.0 threshold?  
select count([Restaurant Name]) as total_restraunts
from zomato
where [Aggregate rating] > 4.0


--4.Cost Analysis:
   -- a. What is the average cost for two people in each city?
select City,avg([Average Cost for two]) as average_cost_for_two_people,currency
from zomato
group by city,currency
order by average_cost_for_two_people desc


   --b.  How does the average cost for two people correlate with the restaurant's rating?
select [restaurant name],avg([Average Cost for two]) as average_cost_for_two_people,currency, avg([aggregate rating]) as average_rating
from zomato
group by [restaurant name],currency
order by average_cost_for_two_people desc


--5.Delivery and Online Orders:
   -- a.  How many restaurants offer table booking?
select count([restaurant name]) as total_restaurants
from zomato
where [Has Table booking] = 'yes'

   -- b.  What is the average rating of restaurants that offer online delivery?
select count([restaurant name]) as total_restaurants, avg([Aggregate rating]) as average_rating
from zomato
where [Has Online delivery] = 'yes'
   

