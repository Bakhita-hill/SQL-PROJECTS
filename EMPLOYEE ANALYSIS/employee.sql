
			-- EMPLOYEE ANALYSIS
 
   -- 1. How many  employees are there in the dataset?
Select count (distinct EmpID) as total_employees
from employee_data  

   -- 2. how many employees are there in a specific department?
Select  [departmenttype],count(empid) as number_of_employees
from employee_data
group by DepartmentType
order by number_of_employees desc

	-- 3. what is the gender distribution of the employees
Select GenderCode,count (distinct EmpID) as total_employees
from employee_data  
group by GenderCode

	-- 4. what is the race distribution of the employees
Select RaceDesc,count (distinct EmpID) as total_employees
from employee_data  
group by RaceDesc
   
 
   -- 5. How many employees were hired in each year?
Select year(StartDate) as year,count(empid) as number_of_employees
from employee_data
group by year(StartDate)
order by number_of_employees desc

   -- 6. how many employees report to a specific manager?
Select  Supervisor,count(empid) as number_of_employees
from employee_data
group by Supervisor
order by number_of_employees desc
   
   -- 7.  How many unique job titles are there in the dataset?
select Title
from employee_data
group by Title
   
   -- 8.  Who has been with the company the longest?
update employee_data
set ExitDate = GETDATE()
where ExitDate is null

select firstname,lastname ,datediff(day,StartDate , ExitDate) as days_in_the_company
from employee_data
order by days_in_the_company desc

   -- 9.  Find employees who have been with the company for more than 5 years.
select firstname,lastname ,datediff(year,StartDate , ExitDate) as years_in_the_company
from employee_data
where datediff(year,StartDate , ExitDate)  >= 5
order by years_in_the_company desc
  
  -- 10.  what is the average current employee rating
select avg([Current Employee Rating]) as avg_rating
from employee_data

  -- 11.  how many employees are there in each performance category
select [Performance Score], count(EmpID) as total_employees
from employee_data
group by [Performance Score]
order by total_employees desc

  -- 12. what is the distribution of employees per payzone
select PayZone,count(EmpID) as total_employees
from employee_data
group by  PayZone
order by total_employees desc

  --13. what is the majority employee calssification type
select EmployeeClassificationType,count(EmpID) as total_employees
from employee_data
group by EmployeeClassificationType
order by total_employees desc

					-- B. RECRUITMENT ANALYSIS


   -- 1. How many records (job applicants) are in the dataset?
Select count(distinct [Applicant ID]) as total_applicants
from recruitment_data

   -- 2. Can you retrieve a list of applicants who applied for a specific job position?
Select [Job Title] ,count(distinct [Applicant ID]) as total_applicants
from recruitment_data
group by [Job Title]
order by total_applicants desc

   --3.  Who are the applicants with the highest education level?
Select  [First Name],[Last Name], [Job Title], [Education Level] 
from recruitment_data
where [Education Level] = 'phd'


   -- 4. Whats the application distribution in terms of education level
Select [Education Level], count([Applicant ID] ) as total_applicants
from recruitment_data
group by [Education Level]
order by total_applicants desc

   -- 5. List the applicants who were interviewed in a specific location.
		-- i. city
Select City, count([Applicant ID] ) as total_applicants
from recruitment_data
group by City
order by total_applicants desc

	-- ii. country
Select Country, count([Applicant ID] ) as total_applicants
from recruitment_data
group by Country
order by total_applicants desc

	--6. Who is the  applicant who had the highest desired salary?
select [First Name],[Last Name],max([Desired Salary]) as salary
from recruitment_data
group by [First Name],[Last Name]
order by Salary desc


--  7. What is the average salary in the company?
select round(avg([Desired Salary]),2) as average_salary
from recruitment_data

-- 8.  Show me the employees with salaries greater than the average desired  salary.
select *
from recruitment_data
where [Desired Salary] >=  '65079.06'
  
   --  9. How many applicants are in each application status (e.g., applied, interviewed, hired)?
select  [Status],count( [Applicant ID]) as total_applicants
from recruitment_data  
group by Status
order by total_applicants

	-- 10.  how many unique jobs were applied for
select count(distinct[Job Title]) as jobs
from recruitment_data

   -- 11. List the average years of experience for applicants in each job position.
select [Job Title],avg([Years of Experience]) as avg_years_experience
from recruitment_data
group by [Job Title]
order by avg_years_experience desc

   --12.  How many applicants applied in each month of the year?
select MONTH([Application Date]) as month, count([Applicant ID]) as total_applicants
from recruitment_data
group by MONTH([Application Date]) 
order by total_applicants desc

   --  13. What is the distribution of applicants by gender?
select Gender,count( [Applicant ID]) as total_applicants
from recruitment_data
group by Gender
order by total_applicants desc

  --14.  Who are the top 10 applicants with the most years of experience?
select top 10 max([Years of Experience]) as years,[First Name],[Last Name]
from recruitment_data
group by [First Name],[Last Name]
order by years desc

   --  15. Find applicants who have a bachelor's degree and more than 5 years of experience.
select [First Name],[Last Name],[Education Level],[Years of Experience]
from recruitment_data
where ([Education Level] like 'Bachelor%' and [Years of Experience] >= '5')

  --  16. Identify the busiest month in terms of job applications.
select month([Application Date]) as month,count([Applicant ID]) as total_applications
from recruitment_data
group by month([Application Date])
order by total_applications desc

    -- 17. How has the number of applications changed over the years?
select year([Application Date]) as year,count([Applicant ID]) as total_applications
from recruitment_data
group by year([Application Date])
order by total_applications desc

					-- EMPLOYEE SURVEY ANALYSIS

   -- 1. How many records (employee responses) are in the dataset?
select count([Employee ID])as total_responses
from employee_survey_data  

   --  2. What is the average engagement score in the company?
select round(avg([Engagement Score]),2) as avg_engagement
from employee_survey_data

   -- 3. How many employees fall into each engagement category (e.g., engaged, disengaged)?
select count([Employee ID])as total_employees,case when [Engagement Score] >= '5' then 'engaged' else 'disengaged' end  as category
from employee_survey_data
group by case when [Engagement Score] >= '5' then 'engaged' else 'disengaged' end   
 
   --4.  Who are the top 10 engaged employees based on their scores?
select top 10  [Employee ID],max([Engagement Score]) as score
from employee_survey_data
group by [Employee ID]
order by score desc


					-- TRAINING ANALYSIS
 -- 1. what is the total cost of training
select sum([Training Cost]) as total_cost
from training_data

   --2. What is the total cost associated with each training program?
select [Training Program Name],sum([Training Cost]) as total_cost
from training_data
group by [Training Program Name]
order by total_cost desc

-- 3. cost associated with each training program over the years
select year([Training Date]) as year ,[Training Program Name],sum([Training Cost]) as total_cost
from training_data
group by [Training Program Name], year([Training Date])
order by total_cost desc

   -- 4. What is the average duration of training programs?
select [Training Program Name],round(avg([Training Duration(Days)]),1) as avg_days
from training_data
group by [Training Program Name]
order by avg_days desc
  
   -- 5.  status per program.
select [Training Program Name],[Training Outcome], count([Training Outcome]) as status
from training_data
group by [Training Program Name],[Training Outcome]
order by status desc

--  6. Identify any training programs with exceptionally low completion rates
select [Training Program Name],[Training Outcome], count([Training Outcome]) as total_employees
from training_data
where [Training Outcome] = 'Incomplete'
group by [Training Program Name],[Training Outcome]
order by total_employees desc

			-- BIVARIATE ANALYSIS


--  1. Join the employee engagement survey data with employee information to find the names and details of employees with the highest engagement scores.
select b.FirstName,b.LastName,a.[Engagement Score] 
from employee_survey_data a
join employee_data b
on b.EmpID = a.[Employee ID]
order by [Engagement Score] desc

-- 2.  Determine the average training duration for different departments or job roles.
select b.DepartmentType , round(avg(a.[Training Duration(Days)]),0) as average_training_days
from training_data a
join employee_data b
on b.EmpID = a.[Employee ID]
group by b.DepartmentType
order by average_training_days desc

--  3. Do employees who engage in training and development have higher job satisfaction and engagement?
select a.[Employee ID],b.[Satisfaction Score]
from training_data a
join employee_survey_data b
on a.[Employee ID] = b.[Employee ID]
order by b.[Satisfaction Score] desc

   --4.  Retrieve responses from employees who have been with the company for more than a certain number of years.
select firstname,lastname ,datediff(day,StartDate , ExitDate) as days_in_the_company,[Engagement Score]
from employee_data a
join  employee_survey_data b
on b.[Employee ID] = a.EmpID
order by days_in_the_company desc
   
   -- 5.What is the distribution of engagement scores by gender?
Select GenderCode,round(avg(b.[Engagement Score]),2) as avg_engagement_score
from employee_data a
join employee_survey_data b
on a.EmpID = b.[Employee ID]
group by GenderCode

   -- 6.  Join the employee engagement survey data with department information to calculate average engagement scores for each department.
Select  [departmenttype],round(avg(b.[Engagement Score]),2) as avg_engagement_score
from employee_data a
join employee_survey_data b
on a.EmpID = b.[Employee ID]
group by DepartmentType
order by avg_engagement_score desc
   

