--Which region has the lowest cost of medical care?
select region,avg(charges) as average_charges
from medical_data
group by region
order by average_charges

--Which gender has the highest average medical charges?

select sex,avg(charges) as highest_charges
from medical_data
group by sex
order by highest_charges desc

--Is there correlation between the number of dependents a patient has and medical charges?
select children,avg(charges) as avg_charges
from medical_data
group by children
order by avg_charges desc

--Is there correlation between age and medical charges?

select age,avg(charges) as avg_charges
from medical_data
group by age
order by avg_charges desc

--Do individuals with higher BMI have higher medical charges?

select bmi,avg(charges) as avg_charges
from medical_data
group by bmi
order by avg_charges desc

--What is the relationship between smoking and medical charges?

select smoker,avg(charges) as avg_charges
from medical_data
group by smoker
order by avg_charges desc

-- which age has the most smokers

select age,count (case when smoker= 1 then 'is smoker' else null end ) as smokers
from medical_data
group by age
order by smokers desc

-- which gender has the most smokers
select sex,count (case when smoker= 1 then 'is smoker' else null end ) as smokers
from medical_data
group by sex
order by smokers desc
 
 -- is there a relation between :
-- a) bmi and age 
select avg(bmi) as avg_bmi,age
from medical_data
group by age
order by avg_bmi desc

--b) bmi and smoking
select avg(bmi) as avg_bmi, smoker
from medical_data
group by smoker
order by avg_bmi desc
 
--c)bmi and gender
select avg(bmi) as avg_bmi, sex
from medical_data
group by sex
order by avg_bmi desc