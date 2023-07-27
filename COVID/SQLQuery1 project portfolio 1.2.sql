select *
from projectportfolio..[COVID DEATHS]
where continent is not null
order by 3,4


--select *
--from projectportfolio..[COVID VACCINATIONS]
--order by 3,4
--select the data we want to use
select location,date,total_cases,new_cases,total_deaths,population
from projectportfolio..[COVID DEATHS]
where continent is not null
order by 1,2

-- looking at total cases vs total deaths

select location,date,total_cases,total_deaths, (total_deaths/total_cases) as death_percentage
from projectportfolio..[COVID DEATHS]
where continent is not null
order by 1,2

--select *
--from projectportfolio..[COVID DEATHS]

--exec sp_help '[covid deaths]';
--alter table [COVID DEATHS]
--alter column total_cases float

--select *
--from projectportfolio..[COVID DEATHS]


--exec sp_help '[covid deaths]';
--alter table [COVID DEATHS]
--alter column total_deaths float


-- likelyhood of dying if you contract covid in your country

select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as death_percentage
from projectportfolio..[COVID DEATHS]
where location like 'kenya'
--where continent is not null
order by 1,2

--looking at the total cases vs total population
--shows what % of the population has covid 

select location,date,total_cases,population, (total_cases/population)*100 as percent_population_infected
from projectportfolio..[COVID DEATHS]
--where location like 'kenya'
where continent is not null
order by 1,2
-- creating  view 
create view  percent_population_with_covid as 
select location,date,total_cases,population, (total_cases/population)*100 as percent_population_infected
from projectportfolio..[COVID DEATHS]
--where location like 'kenya'
where continent is not null
--order by 1,2



--looking at countries with highest infection count compared to population

select location,population,max(total_cases) as highest_infection_count, max((total_cases/population))*100 as percent_population_infected
from projectportfolio..[COVID DEATHS]
--where location like 'kenya'
where continent is not null
group by location,population
order by percent_population_infected desc


--showing countries with highest death count per population

select location,max(cast(total_deaths as int))as total_death_count
from projectportfolio..[COVID DEATHS]
--where location like 'kenya'
where continent is not null
group by location
order by total_death_count  desc

-- create view 
create view highest_death_count_per_population as
select location,max(cast(total_deaths as int))as total_death_count
from projectportfolio..[COVID DEATHS]
--where location like 'kenya'
where continent is not null
group by location
--order by total_death_count  desc

-- LETS BREAK THINGS DOWN PER CONTINENT
--continent with highest death count per population
select continent,max(cast(total_deaths as int))as total_death_count
from projectportfolio..[COVID DEATHS]
--where location like 'kenya'
where continent is not null
group by continent
order by total_death_count  desc

--create view 
create view continent_with_highest_death_count_per_population as
select continent,max(cast(total_deaths as int))as total_death_count
from projectportfolio..[COVID DEATHS]
--where location like 'kenya'
where continent is not null
group by continent
--order by total_death_count  desc


-- GLOBAL
--looking at total deaths vs total cases 

select date,total_cases,total_deaths ,total_deaths/nullif(total_cases,0) *100 as death_percentage
from projectportfolio..[COVID DEATHS]
--where continent is not null
group by date,total_deaths,total_cases
order by 1,2

--looking at total population vs total vaccinations

select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location,dea.date)as rolling_people_vaccinatted
--(rolling_people_vaccinatted/population)*100 
from projectportfolio..[COVID DEATHS]dea
join projectportfolio..[COVID VACCINATIONS]vac
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
order by 2,3


--Use cte
create view tb5 as
with popvsvac (continent,location,date,population,new_vaccinations,rolling_people_vaccinatted)
as
(
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location,dea.date)as rolling_people_vaccinatted
--,(rolling_people_vaccinatted/population)*100 
from projectportfolio..[COVID DEATHS]dea
join projectportfolio..[COVID VACCINATIONS]vac
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
--order by 2,3
)
select *,(rolling_people_vaccinatted/population)*100 as percentpopulationvaccinated
from popvsvac

--or temp table

drop table if exists #percent_population_vaccinated
create table #percent_population_vaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
rolling_people_vaccinated numeric
)

insert into #percent_population_vaccinated
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location,dea.date)as rolling_people_vaccinatted
--,(rolling_people_vaccinatted/population)*100 
from projectportfolio..[COVID DEATHS]dea
join projectportfolio..[COVID VACCINATIONS]vac
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
--order by 2,3
select *,(rolling_people_vaccinated)*100
from #percent_population_vaccinated


--creating for later data visualization 
create view percent_population_vaccinated as
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,sum(cast(vac.new_vaccinations as bigint)) over (partition by dea.location order by dea.location,dea.date)as rolling_people_vaccinatted
,--(rolling_people_vaccinatted/population)*100 
from projectportfolio..[COVID DEATHS]dea
join projectportfolio..[COVID VACCINATIONS]vac
on dea.location=vac.location
and dea.date=vac.date
where dea.continent is not null
--order by 2,3

select *
from percent_population_vaccinated