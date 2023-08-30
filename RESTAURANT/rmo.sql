
--1.Customer Demographics:
		-- a. What is the distribution of customers by: 
   --i. gender 
select  count(case when sex ='m' then 'male' else null end ) as total_males,
		count(case when sex = 'f' then 'female' else null end) as total_females
from members

   --ii. city 
select count(sex)as total_members,city_id
from members
group by city_id
order by total_members desc
   
--2. Restaurant Performance:
-- a. Which restaurant has received the most orders?
select restaurant_id,count(id) as total_orders
from orders
group by restaurant_id
order by total_orders desc

-- how many restaurants are there in each city
select city_id,count(restaurant_name) as total_restaurants
from restaurants
group by city_id
order by total_restaurants desc
   -- which restaurant type has most restaurants
select b.restaurant_type,a.restaurant_type_id,count(a.restaurant_name) as total_restaurants
from restaurants a
join restaurant_types b
on a.restaurant_type_id = b.id
group by a.restaurant_type_id,b.restaurant_type
order by total_restaurants desc

-- what is the average income percentage per restaurant type
select b.restaurant_type,round(avg(a.income_persentage),3) as avg_income_percentage
from restaurants a
join restaurant_types b
on a.restaurant_type_id = b.id
group by b.restaurant_type
order by avg_income_percentage desc


--3. Member Engagement:
-- total member visits per month
select month([date])as month,member_id,count(member_id) as total_visits
from orders
group by month([date]),member_id
order by total_visits desc

-- which member placed the most orders per month
select member_id,sum(order_count) as total_orders,[month]
from monthly_member_totals
group by [month],member_id
order by total_orders desc

-- b. which restaurant did most members go to?
select month([date])as month,count(member_id) as total_visits,restaurant_id
from orders
group by month([date]),restaurant_id
order by total_visits desc

--4. meal Preferences:
   --a.what is the most prefferd meal type by customers
select b.meal_type,count(a.id) as total_orders
from meals a
join meal_types b
on a.meal_type_id = b.id
group by b.meal_type
order by total_orders desc
   -- what state do people most  preffer their food in
select hot_cold,count(id) as total_orders
from meals
group by hot_cold
   -- does the average price for a meal affect the number of orders
select b.meal_type,avg(a.price) as average_price,count(a.id) as total_orders
from meals a
join meal_types b
on a.meal_type_id = b.id
group by b.meal_type
order by average_price desc
   -- what is the frequently requested serve type
select serve_type_id,count(id) as total_orders
from meals 
group by serve_type_id
order by total_orders desc

-- which meal type has most income
select b.meal_type,sum(a.price) as total_income
from meals a
join meal_types b
on a.meal_type_id = b.id
group by b.meal_type
order by total_income desc


   
--5. Time-Based Analysis:
    --a.  Are there specific times of day when orders peak?
select DATEPART(hour,[hour])as hour,COUNT(id) as total_orders
from orders
group by DATEPART(hour,[hour])
order by total_orders desc

    -- b. Can you identify any temporal trends in customer behavior, such as:
		-- i. weekend vs. weekday ordering patterns?
select datename(weekday,[date])
from orders

alter table orders
add [day] nvarchar (255)

update orders
set [day] =datename(weekday,[date])

select [day],count(id)as total_orders
from orders
group by [day]
order by total_orders desc
		-- ii. which restraunt had most orders in a month 
select month([date])as month,count(id) as total_orders
from orders
group by month([date])
order by total_orders desc

--6. cost analysis
    -- What is the average monthly budget for the  customers?
select avg(monthly_budget) as average_budget
from members
-- what is the average price for each meal type
select b.meal_type,avg(a.price) as average_price
from meals a
join meal_types b
on a.meal_type_id = b.id
group by b.meal_type
order by average_price desc
-- what is the total monthly budget vs balance
select sum (monthly_budget) as total_budget, sum(balance) as total_balance,month
from monthly_member_totals
group by month
order  by total_budget desc
-- is there a relationship between expenditure and commission
select sum(total_expense) as total_expenditure,sum(commission)as total_com,month
from monthly_member_totals
group by month
order by total_com desc

-- which city has the highest total expenditure
select city,sum(total_expense) as total_expenditure
from monthly_member_totals
group by city
order by total_expenditure desc
-- which gender has the highest expenditure
select sex,sum(total_expense) as total_expenditure
from monthly_member_totals
group by sex
order by total_expenditure desc

--which gender has the highest budget
select sex,sum(monthly_budget) as total_budget
from monthly_member_totals
group by sex
order by total_budget desc
    

