
-- a. how many applicants are there?
select count(ID) as total_applicants
from bankloan

-- b. what is the average age of the applicants?
select avg(Age) as average_age
from bankloan

-- c. what is the average income of the applicants ?
select avg(Income) as average_income
from bankloan

-- d.Find the highest and lowest income applicants.
-- i.highest
select max(Income) as highest_income
from bankloan

-- ii. lowest
select min(Income) as lowest_income
from bankloan

-- e. what is the average work experience of the applicants?
select avg(Experience) as average_experience
from bankloan

-- f. what is the average number of family members the applicants have?
select avg(Family) as avg_family_members
from bankloan

-- g. how many applicants have online banking?
select count(ID) as total_applicants,Online
from bankloan
group by Online
order by total_applicants desc

-- h. how many applicants have a credit card?
select count(ID) as total_applicants,CreditCard
from bankloan
group by CreditCard
order by total_applicants desc

-- i. how many applicants have a securities account?
select count(ID) as total_applicants,Securities#Account
from bankloan
group by Securities#Account
order by total_applicants desc

-- j. what is the distribution of applicants by education level?
select count(ID) as total_applicants,Education
from bankloan
group by Education
order by total_applicants desc

--How many approved and rejected loans are there?
select count(ID) as total_applicants,Personal#Loan
from bankloan
group by Personal#Loan
order by total_applicants desc

