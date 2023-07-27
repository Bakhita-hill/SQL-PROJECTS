select *
from supermarket..supermarket_sales

--1. Which branch has the best results in the loyalty program?
select count (case when [Customer type] = 'Member' then 'status' else null end )as loyalty_program_member,
count (case when [Customer type] = 'normal' then 'status' else null end )as loyalty_program_nonmember,
branch
from supermarket..supermarket_sales
group by Branch
order by Branch DESC


-- 2. RATING PER CUSTOMER TYPE
select avg(Rating) as average_rating,[Customer type]
from supermarket..supermarket_sales
group by [Customer type]
order by average_rating desc


-- 3a. GROSS INCOME PER PAYMENT METHOD
select Payment,sum([gross income]) as total_gross_income
from supermarket..supermarket_sales
group by Payment
order by total_gross_income desc

-- 3b. GROSS INCOME PER CUSTOMER TYPE 
select [Customer type],sum([gross income]) as total_gross_income
from supermarket..supermarket_sales
group by [Customer type]
order by total_gross_income desc


--4. Are there any differences in indicators between men and women?
--a.customer type

select count (case when [Customer type] = 'Member' then 'status' else null end )as loyalty_program_member,
count (case when [Customer type] = 'normal' then 'status' else null end )as loyalty_program_nonmember,
gender
from supermarket..supermarket_sales
group by gender

--b.gross income
select sum([gross income]) as total_gross_income,Gender
from supermarket..supermarket_sales
group by gender 
order by total_gross_income desc


--c. product line
select [Product line],Gender, sum([gross income]) as total_gross_income
from supermarket..supermarket_sales
group by gender,[Product line]
order by total_gross_income desc


--d.branch
select count (case when Gender= 'female' then 'sex' else null end )as female,
count (case when gender = 'male' then 'sex' else null end )as male,branch
from supermarket..supermarket_sales
group by branch 
order by branch desc

--e. ratings
select avg(Rating) as average_rating,Gender
from supermarket..supermarket_sales
group by gender
order by average_rating desc


--5. Which product category generates the highest income?
select [Product line],sum([gross income])as total_gross_income
from supermarket..supermarket_sales
group by [Product line]
order by sum([gross income])desc


-- 6. WHICH BRANCH HAD THE MOST COGS
select branch,sum(cogs) as total_cogs
from supermarket..supermarket_sales
group by branch
order by total_cogs desc

-- 7. WHICH BRANCH HAD MOST RATINGS 
select avg(Rating) as average_rating,BRANCH
from supermarket..supermarket_sales
group by branch
order by average_rating desc
