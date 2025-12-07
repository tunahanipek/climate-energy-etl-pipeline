-- ==========================================
-- SQL ANALYSIS PORTFOLIO
-- Project: Climate & Energy Data Engineering
-- ==========================================

-- 1. WINDOW FUNCTIONS (Advanced Analysis)
-- Scenario: Detect daily changes in energy consumption.
-- We use LAG() to compare the current day with the previous day.
SELECT 
    country,
    date,
    energy_consumption AS current_consumption,
    LAG(energy_consumption) OVER (PARTITION BY country ORDER BY date) AS previous_day_consumption,
    energy_consumption - LAG(energy_consumption) OVER (PARTITION BY country ORDER BY date) AS consumption_diff
FROM climate_energy
WHERE country = 'Germany' 
ORDER BY date
LIMIT 20;

-- 2. AGGREGATION 
-- Scenario: Find the top 5 countries with the highest average energy consumption.
SELECT 
    country, 
    AVG(energy_consumption) AS avg_consumption
FROM climate_energy
GROUP BY country
ORDER BY avg_consumption DESC
LIMIT 5;

-- 3. FILTERING 
-- Scenario: Find "Clean Energy Days" (High renewable share, Low CO2).
SELECT 
    date, 
    country, 
    renewable_share, 
    co2_emission
FROM climate_energy
WHERE renewable_share > 20 
  AND co2_emission < 200
ORDER BY renewable_share DESC
LIMIT 20;

-- 4. DATA QUALITY CHECK 
-- Scenario: Ensure there are no missing values in critical columns.
SELECT 
    COUNT(*) AS total_rows,
    COUNT(avg_temperature) AS valid_temp_count,
    COUNT(*) - COUNT(avg_temperature) AS missing_temp_count
FROM climate_energy;

-- 5. COMPLEX FILTERING 
-- Scenario: Calculate average CO2 emission for Germany on hot days (>20 degrees).
SELECT 
    AVG(co2_emission) AS average_co2_emission
FROM climate_energy
WHERE country = 'Germany' 
  AND avg_temperature > 20;