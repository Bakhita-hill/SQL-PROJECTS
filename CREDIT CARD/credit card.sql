select *
from [credit card]

--  CLEAN DATA 
delete from [credit card] where Income_Category = 'Unknown'

delete from [credit card] where Marital_Status = 'Unknown'

delete from [credit card] where [education level] = 'Unknown'

-- WHAT IS THE TOTAL NUMBER OF CUSTOMERS
select count(CLIENTNUM) as total_customers
from [credit card]

-- HOW MANY EXISTING CUSTOMERS ARE THERE 
select count(CLIENTNUM) as total_customers
from [credit card]
where Attrition_Flag = 'existing customer'

-- WHAT IS THE DISTRIBUTION OF CUSTOMERS BY ATTRITION FLAG
select count(CLIENTNUM) as total_customers, Attrition_Flag
from [credit card]
group by Attrition_Flag

-- WHAT IS THE AVERAGE AGE OF THE  CUSTOMERS
select avg(Customer_Age) as avg_age
from [credit card]

-- HOW MANY CUSTOMERS ARE ABOVE THE AGE OF 50
select count(CLIENTNUM) as total_customers 
from [credit card]
where Customer_Age  > = 50

-- WHO IS OUR YOUNGEST CUSTOMER
select min(Customer_Age) as youngest
from [credit card]

-- Divide customers into age groups (e.g., 18-25, 26-35, 36-45, etc.) and count the number of customers in each group.
select count(CLIENTNUM) as total_customers , case when Customer_Age < '18' then 'minor'
												when Customer_Age between '18' and '25' then 'young adult'
												when Customer_Age between '26'and '35' then 'middle aged adults'
												when Customer_Age between '36' and '50' then 'old adults'
												when Customer_Age > '50' then ' senior adults'
												else null end
from [credit card]
group by case when Customer_Age < '18' then 'minor'
												when Customer_Age between '18' and '25' then 'young adult'
												when Customer_Age between '26'and '35' then 'middle aged adults'
												when Customer_Age between '36' and '50' then 'old adults'
												when Customer_Age > '50' then ' senior adults'
												else null end

-- CREATE NEW COLUMN 
alter table  [credit card]
add  [age category] nvarchar (255)

update [credit card]
set [age category] = case when Customer_Age < '18' then 'minor'
												when Customer_Age between '18' and '25' then 'young adult'
												when Customer_Age between '26'and '35' then 'middle aged adults'
												when Customer_Age between '36' and '50' then 'old adults'
												when Customer_Age > '50' then ' senior adults'
												else null end

-- CUSTOMER DISTRIBUTION BY GENDER?
select count(CLIENTNUM) as total_customers, gender
from [credit card]
group by gender

-- WHAT IS THE average number of dependents for customers
select avg(Dependent_count) as avg_dependants
from [credit card]

-- CUSTOMER DISTRIBUTION BY EDUCATION LEVEL
select count(CLIENTNUM) as total_customers, [education level]
from [credit card]
group by [education level]
order by total_customers

-- Count the number of customers in each marital status category.
select count(CLIENTNUM) as total_customers, Marital_Status
from [credit card]
group by Marital_Status
order by total_customers desc

-- Calculate the average income of customers grouped by education 
select [education level], avg([AVERAGE INCOME]) as avg_income
from [credit card]
group by [education level]
order by avg_income desc

--WHICH IS THE MOST COMMON CARD CATEGORY
select count(CLIENTNUM) as total_customers, Card_Category
from [credit card]
group by Card_Category 

-- WHAT IS THE AVERAGE NUMBER OF MONTHS A CUSTOMER STAYS WITH THE BANK
select avg(Months_on_book) as avg_duration
from [credit card]

-- WHO IS THE CUSTOMER WHO HAS STAYED WITH THE BANK LONGEST
select max(Months_on_book) as longest_duration
from [credit card]

-- WHO IS THE CUSTOMER WHO HAS STAYED WITH THE BANK SHORTEST
select min(Months_on_book) as shortest_duration
from [credit card]

-- Find the maximum number of relationships/accounts a customer has with the bank.
select max(Total_Relationship_Count) as relationships
from [credit card]

-- Find the minimum number of relationships/accounts a customer has with the bank.
select min(Total_Relationship_Count) as relationships
from [credit card]

-- Determine the average number of months inactive in the last 12 months.
select avg(Months_Inactive_12_mon) as avg_inactive_months
from [credit card]

-- Identify customers with more than 6 months of inactivity in the last 12 months
select count(CLIENTNUM) as total_customers
from [credit card]
where Months_Inactive_12_mon > 6

-- WHAT IS THE LONGEST A CUSTOMER HAS BEEN INACTIVE
select max(Months_Inactive_12_mon) as inactive_months
from [credit card]

-- Calculate the average total transaction count.
select avg(Total_Trans_Ct) as avg_transaction_count
from [credit card]

-- Retrieve the top 5 customers with the highest total transaction count
select top 5  CLIENTNUM, Total_Trans_Ct
from [credit card]
order by Total_Trans_Ct desc

-- WHAT IS THE AVERAGE NUMBER OF TIMES A CUSTOMER CONTACTS THE BANK
select avg(Contacts_Count_12_mon) as avg_contact_times
from [credit card]

-- WHICH CUSTOMER CONTACTS THE BANK MOST
select max(Contacts_Count_12_mon) as max_contact_times
from [credit card]


-- WHAT IS THE AVERAGE CREDIT CARD LIMIT
select avg(Credit_Limit) as avg_limit
from [credit card]

-- WHICH CUSTOMER HAS THE HIGHEST LIMIT
select max(Credit_Limit) as max_limit
from [credit card]

-- IS THERE A RELATIONSHIP BETWEEN THE CREDIT CARD LIMIT AND THE AVERAGE INCOME
select [AVERAGE INCOME], avg(Credit_Limit) as avg_limit
from [credit card]
group by [AVERAGE INCOME]
order by avg_limit desc

-- Find the average card utilization ratio.
select avg(Avg_Utilization_Ratio) as avg_utilization_ratio
from [credit card]

-- Investigate how the average card utilization ratio varies across different income categories.
select Income_Category, avg(Avg_Utilization_Ratio) as avg_utilization_ratio
from [credit card]
group by Income_Category
order by avg_utilization_ratio desc

-- Examine the total number of relationships with the bank for customers based on marital status.
select Marital_Status, avg(Total_Relationship_Count) as avg_relationships
from [credit card]
group by Marital_Status
order by avg_relationships desc

