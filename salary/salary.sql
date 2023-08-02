
-- what is the average salary per country?
select country,avg(salary) as average_salary
from salary_data
group by country
order by average_salary desc


--How does the average salary vary across different countries and races?
select country,race,avg(salary) as average_salary
from salary_data
group by country,race
order by average_salary desc

--What is the gender distribution within each country and race group, and how does it relate to salary differences?
select country,gender,race,avg(salary) as average_salary
from salary_data
group by country,race,gender
order by average_salary desc

-- is there a salary difference based on gender
select gender,avg(salary) as average_salary
from salary_data
group by gender
order by average_salary desc

--does the educaton level affect salary earned ?
select [Education Level],avg(salary) as average_salary
from salary_data
group by [Education Level]
order by average_salary desc


--Are there any differences in salary based on education level within each country and race group?
select [Education Level],Race,Country,avg(salary) as average_salary
from salary_data
group by [Education Level],race,Country
order by average_salary desc


--How does the years of experience affect salary within different countries and races?
select [Years of Experience],Race,Country,avg(salary) as average_salary
from salary_data
group by [Years of Experience],race,Country
order by average_salary desc

-- is there a relationship between salary earned and age?
select age,avg(salary) as average_salary
from salary_data
group by age
order by average_salary desc

