-- Queries used to prepare actual dashboard

-- 1

Select  SUM(new_cases) as TotalCases, SUM(cast (new_deaths as int)) as TotalDeaths,  (SUM(cast (new_deaths as int))/SUM(new_cases))*100 as DeathPercentage
from Covid..CovidDeaths
where continent is not null
--group by date 
order by 1, 2

-- 2


SELECT location as Continent, SUM(CAST(new_deaths as int)) as TotalDeathCount
from Covid..CovidDeaths
where continent is null and location not like '%income%' and location not in ('World', 'European Union', 'International')
group by location
order by TotalDeathCount desc


-- 3

SELECT location,population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population)*100) as PercentPopulationInfected
from Covid..CovidDeaths
where continent is not null
--where location like '%India%'
group by location, population 
order by PercentPopulationInfected desc

-- 4 

SELECT location,population, date,  MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population)*100) as PercentPopulationInfected
from Covid..CovidDeaths
where continent is not null
--where location like '%India%'
group by location, population, date 
order by PercentPopulationInfected desc