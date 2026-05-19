-- ============================================================
-- Employee Attrition Analysis — SQL Queries
-- Dataset: IBM HR Analytics Employee Attrition
-- Author: Jhanavi R R
-- GitHub: github.com/jhanavirr-126/employee-attrition-analysis
-- ============================================================


-- ─────────────────────────────────────────────
-- QUERY 1: Overall Attrition Rate
-- ─────────────────────────────────────────────
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_Stayed,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees;

-- Result: 1470 total | 237 left | 16.1% attrition rate


-- ─────────────────────────────────────────────
-- QUERY 2: Attrition Rate by Department
-- ─────────────────────────────────────────────
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

-- Result: Sales 20.6% | HR 19.0% | R&D 13.8%


-- ─────────────────────────────────────────────
-- QUERY 3: Attrition Rate by Job Role
-- ─────────────────────────────────────────────
SELECT 
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC;

-- Result: Sales Representative 39.8% highest attrition


-- ─────────────────────────────────────────────
-- QUERY 4: Overtime Impact on Attrition
-- ─────────────────────────────────────────────
SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;

-- Result: Overtime Yes = 30.5% | Overtime No = 10.4% (3x higher risk)


-- ─────────────────────────────────────────────
-- QUERY 5: Average Monthly Income — Left vs Stayed
-- ─────────────────────────────────────────────
SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income,
    ROUND(MIN(MonthlyIncome), 2) AS Min_Income,
    ROUND(MAX(MonthlyIncome), 2) AS Max_Income
FROM employees
GROUP BY Attrition;

-- Result: Employees who left earned significantly less on average


-- ─────────────────────────────────────────────
-- QUERY 6: Attrition by Age Group
-- ─────────────────────────────────────────────
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees
GROUP BY Age_Group
ORDER BY Attrition_Rate_Percent DESC;

-- Result: 18-25 age group has 34.8% attrition — highest risk group


-- ─────────────────────────────────────────────
-- QUERY 7: Job Satisfaction vs Attrition
-- ─────────────────────────────────────────────
SELECT 
    JobSatisfaction,
    CASE JobSatisfaction 
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END AS Satisfaction_Level,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Result: Low satisfaction = 22.8% | Very High satisfaction = 11.3%


-- ─────────────────────────────────────────────
-- QUERY 8: Top 5 High Risk Employees Profile
-- (Single, Overtime, Low Income, Low Satisfaction)
-- ─────────────────────────────────────────────
SELECT 
    Age,
    Department,
    JobRole,
    MonthlyIncome,
    OverTime,
    JobSatisfaction,
    YearsAtCompany,
    Attrition
FROM employees
WHERE 
    OverTime = 'Yes'
    AND JobSatisfaction = 1
    AND MonthlyIncome < 3000
    AND Attrition = 'Yes'
ORDER BY MonthlyIncome ASC
LIMIT 5;

-- Identifies highest risk employee profiles


-- ─────────────────────────────────────────────
-- QUERY 9: Years at Company vs Attrition
-- ─────────────────────────────────────────────
SELECT 
    YearsAtCompany,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees
GROUP BY YearsAtCompany
ORDER BY Attrition_Rate_Percent DESC
LIMIT 10;

-- Result: Employees in first 1-2 years are most at risk


-- ─────────────────────────────────────────────
-- QUERY 10: Department + Overtime Combined Risk Analysis
-- ─────────────────────────────────────────────
SELECT 
    Department,
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_Percent
FROM employees
GROUP BY Department, OverTime
ORDER BY Attrition_Rate_Percent DESC;

-- Result: Sales + Overtime = highest combined risk
