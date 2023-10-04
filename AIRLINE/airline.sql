
   -- What is the total number of passengers 
select count([passenger id]) as total_passengers
from Airline

-- what is the distribution of passengers by gender
select gender,count([passenger id]) as total_passengers
from Airline
group by gender

   -- what is the average age of passengers?
select avg(age) as avg_age
from Airline

--what is the distribution of passengers by nationality
select nationality,count([passenger id]) as total_passengers
from Airline
group by nationality
order by total_passengers desc

   -- How many  airports are there?
select count(distinct[airport name]) as total_airports
from Airline

   -- Which airport has the best on-time performance based on the lowest number of departure delay?
select [airport name], count([flight status]) as total_delayed
from Airline
where [Flight Status] = 'Delayed'
group by [Airport Name]
order by total_delayed

   -- Identify the airport with the highest and lowest cancellation rate.
select [airport name], count([flight status]) as total_cancelled
from Airline
where [Flight Status] = 'Cancelled'
group by [Airport Name]
order by total_cancelled desc

     -- How many passengers flew with each airport?
select [airport name],count([passenger id]) as total_passengers
from Airline
group by [airport name]

   --Find the top 5 airlines with the most passengers.
select top 5 [airport name],count([passenger id]) as total_passengers
from Airline
group by [airport name]
order by total_passengers desc
   
	-- how many pilots are there?
select count(distinct[pilot name]) as number_of_pilots
from Airline
	-- what is the distribution of pilots  per airport
select [airport name],count(distinct[pilot name]) as number_of_pilots
from Airline
group by [Airport Name]
order by number_of_pilots desc

	--which country has the most airports
select [country name],count(distinct[airport name]) as number_of_airports
from airline
group by [Country Name]
order by number_of_airports desc
   