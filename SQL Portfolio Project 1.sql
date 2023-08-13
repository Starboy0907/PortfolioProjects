Select  *
From [SQL Portfolio Project]..CovidDeaths
Order By 3,4

Select *
From [SQL Portfolio Project]..CovidVaccination

--Select the Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
From [SQL Portfolio Project]..CovidDeaths
order by 1,2

--Looking at Total Cases vs. Total Deaths
--Likelihood of death after case
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases) *100 as fatality_percentage
From [SQL Portfolio Project]..CovidDeaths
WHere location like '%state%'
order by 3,4

--Looking at Total Cases vs Population

Select Location, MAX(total_cases), population, MAX(total_cases/population) *100 as fatality_percentage
From [SQL Portfolio Project]..CovidDeaths
GROUP BY location, population
Order By 3,4

--Looking at countries with the highest infection rate compared to population

Select Location, Population, MAX(total_cases) as HighestInfectionRate, MAX(total_cases/(population + 1)) *100 as PercentPopulationInfected
From [SQL Portfolio Project]..CovidDeaths
Group By Location, Population
Order By PercentPopulationInfected desc

--Showing Countries with Highest Death Count per population
Select location, MAX(population)/MAX(Total_deaths + 1) as TotalDeathCount
From [SQL Portfolio Project]..CovidDeaths
Where continent is not null
Group by location
Order By TotalDeathCount desc

--Showing continents with the highest death count per population

Select location, MAX(population)/MAX(Total_deaths + 1) as TotalDeathCount
From [SQL Portfolio Project]..CovidDeaths
Where continent is not null
Group by location
Order By TotalDeathCount desc

--Global Numbers

Select SUM(new_cases) as Total_Cases, SUM(New_deaths) as Total_Deaths, SUM(Total_Deaths +1)/SUM(Total_Cases +1)*100 as DeathPercentages 
From [SQL Portfolio Project]..CovidDeaths
--Where location like '%state%'
Where continent is not null
Group By total_deaths, total_cases
order by 1 desc

Select dea.continent, dea.location, dea.date, dea.population
From [SQL Portfolio Project]..CovidDeaths dea
Join [SQL Portfolio Project]..CovidVaccination vac
	On dea.location =vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3














