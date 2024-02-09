-- if required for resetting
DROP TABLE covid;

-- create table
CREATE TABLE IF NOT EXISTS covid(
	id SERIAL PRIMARY KEY,
	date DATE,
	change_cases INT,
	change_fatalities INT,
	change_tests INT,
	change_hospitalizations INT,
	change_criticals INT,
	change_recoveries INT,
	change_vaccinations INT,
	change_vaccinated INT,
	change_boosters_1 INT,
	change_boosters_2 INT,
	change_vaccines_distributed INT,
	total_cases INT,
	total_fatalities INT,
	total_tests INT,
	total_hospitalizations INT,
	total_criticals INT,
	total_recoveries INT,
	total_vaccinations INT,
	total_vaccinated INT,
	total_boosters_1 INT,
	total_boosters_2 INT,
	total_vaccines_distributed INT
);