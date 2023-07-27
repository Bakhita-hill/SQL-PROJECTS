select *
from wallmart..features

select *
from wallmart..stores

select *
from wallmart..test

select *
from wallmart..sales

--SALES PER YEAR
select sum(Weekly_Sales) as total_sales, year(Date) as year
from wallmart..sales
group by year(Date)
order by total_sales desc


-- WHAT WAS THE TEMPRATURE DURING THE WEEK WITH THE HIGHEST SALES 
select max(Weekly_Sales) as highest_sales,a.Store,max(temperature)as temprature,A.Date
from wallmart..sales a
join wallmart..features b
on a.store=b.Store
--where year(Date)=2011 
group by a.Store,A.Date
order by highest_sales desc

--WHAT WAS THE AVERAGE TEMPERATURE DURING THE YEAR WITH MOST SALES
select year(a.Date) as year,sum(Weekly_Sales) as total_sales,avg(Temperature) as average_temperature
from wallmart..sales a
JOIN  wallmart..features b
on a.store=b.Store
group by year(a.Date)
order by total_sales desc

-- AVERAGE  UNEMPLOYMENT PER YEAR
select AVG(unemployment) as average_unemployment, year(Date) as year
from wallmart..features
group by  year(Date)
order by average_unemployment desc


-- WHAT IS THE UNEMPLOYMENT RATE IN THE AREA WHERE THE STORE WITH MOST SALES IS LOCATED
-- you can specify the year to see how unemployment changes per year around a certain store
select sum(b.Weekly_Sales) as total_sales, year(a.Date) as year,a.Store, AVG(unemployment) as average_unemployment
from wallmart..features a
join  wallmart..sales b
on a.store=b.store
where year(a.Date)=2011 
group by year(a.Date),a.Store
order by total_sales desc

-- WHAT ARE THE SALES IN THE STORE WHERE THERE IS HIGHEST UNEMPLOYMENT
select sum(b.Weekly_Sales) as total_sales, year(a.Date) as year,a.Store, AVG(unemployment) as average_unemployment
from wallmart..features a
join  wallmart..sales b
on a.store=b.store
--where year(a.Date)=2011 
group by year(a.Date),a.Store
order by average_unemployment desc


-- STORE WITH MOST DEPARTMENTS
select store,sum(Dept)as total_departments
from wallmart..test
group by store
order by total_departments desc 



-- WHICH STORE HAS THE MOST SALES PER YEAR
--you can change the year in the where clause to find the exact year you want
select sum(Weekly_Sales) as total_sales, year(Date) as year,Store
from wallmart..sales
where year(Date)=2011 
group by year(Date),Store
order by total_sales desc

--WHICH STORE HAS THE MOST TOTAL SALES
select sum(Weekly_Sales) as total_sales,Store
from wallmart..sales
group by Store
order by total_sales desc

 --WHICH DEPARTMENT PER STORE HAS THE MOST SALES
 -- YOU CAN SPECIFY THE YEAR TO SEE THE SALES OF DIFERENT DEPARTMENTS IN THAT YEAR
select sum(Weekly_Sales) as total_sales, year(Date) as year,Store,Dept
from wallmart..sales
where year(Date)=2012 
group by year(Date),Store,DEPT
order by total_sales desc



-- IS THERE A DIFFRENCE IN SALES DURING THE HOLIDAYS AND WHEN THERE IS NO HOLIDAY

select sum(Weekly_Sales) as total_sales,a.IsHoliday,year(a.Date)as year
from wallmart..sales a
join wallmart..features b
on a.store=b.Store
where a.IsHoliday=1 or a.IsHoliday=0
group by a.IsHoliday,year(a.Date)
order by total_sales desc



-- IS THERE A RELATIONSHIP BETWEEN THE FUEL PRICE AND THE SALES
select max(Weekly_Sales) as highest_sales,max(Fuel_Price)as fuel_price,a.Store
from wallmart..sales a
join wallmart..features b
on a.store=b.Store
group by a.Store
order by highest_sales desc
 

 --WHAT WAS THE AVERAGE FUEL PRICE IN THE YEAR WITH THE MOST SALES
select SUM(Weekly_Sales) as highest_sales,AVG(Fuel_Price)as average_fuel_price,year(a.Date) as year
from wallmart..sales a
join wallmart..features b
on a.store=b.Store
group by year(a.Date) 
order by highest_sales desc

-- WHAT WAS THE AVERAGE CPI DURING THE YEAR WITH MOST SALES
select SUM(Weekly_Sales) as total_sales,AVG(CPI)as average_cpi,year(a.Date) as year
from wallmart..sales a
join wallmart..features b
on a.store=b.Store
group by year(a.Date) 
order by total_sales desc