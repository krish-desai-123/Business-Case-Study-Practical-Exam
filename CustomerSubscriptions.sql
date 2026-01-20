CREATE DATABASE rnw;

USE rnw;

CREATE TABLE customersub (CustomerID VARCHAR(15) PRIMARY KEY NOT NULL, Name VARCHAR(50), Age INT, Gender VARCHAR(10), SubscriptionType VARCHAR(15), SubscriptionDate DATE, LastLoginDate DATE, TotalSessions INT, FeedbackScore INT, IsChurned INT );

-- I HAVE IMPORTED THE DATA USING CMD
LOAD DATA LOCAL INFILE 'C:/Users/desai/Downloads/CustomerSubscriptions.csv' INTO TABLE customersub FIELDS TERMINATED BY ',' ENCLOSED BY '"' IGNORE 1 ROWS;

SELECT * FROM customersub;


-- 📊 Total number of active vs churned customers (by SubscriptionType).
SELECT SubscriptionType,
       COUNT(CASE WHEN IsChurned = 1 THEN 1 END) AS Churned,
       COUNT(CASE WHEN IsChurned = 0 THEN 1 END) AS Active,
       COUNT(*) AS Total_Customers
FROM customersub GROUP BY SubscriptionType;


-- 🧮 Average FeedbackScore by SubscriptionType and Gender.
SELECT SubscriptionType,
       Gender,
       AVG(FeedbackScore) AS Avg_Feedback_Score,
       COUNT(*) AS Number_of_Responses
FROM customersub
GROUP BY SubscriptionType, Gender
ORDER BY SubscriptionType, Avg_Feedback_Score DESC;


-- 📉 List customers who attended < 5 sessions AND gave feedback < 5.
SELECT CustomerID,
       Name,
       Age,
       Gender,
       SubscriptionType,
       IsChurned
FROM customersub
WHERE TotalSessions < 5 AND FeedbackScore < 5;

-- 📆 Identify customers who haven’t logged in for the past 60 days.
SELECT MAX(LastLoginDate) FROM customersub; -- 2024-12-22

SELECT CustomerID,
       Name,
       LastLoginDate
FROM customersub
WHERE LastLoginDate < (SELECT MAX(LastLoginDate) FROM customersub) - INTERVAL 60 DAY
ORDER BY LastLoginDate DESC;


-- 🏷️ Churn rate by SubscriptionType.
SELECT SubscriptionType,
       COUNT(*) AS Total_Customers,
       SUM(IsChurned) AS Churned_Customers,
       AVG(IsChurned * 100) AS Churn_Rate
FROM customersub
GROUP BY SubscriptionType
ORDER BY Churn_Rate DESC ;


-- 📋 List Top 10 customers with longest subscriptions (based on SubscriptionDate).
SELECT CustomerID,
       Name,
       SubscriptionDate,
       (SELECT MIN(SubscriptionDate)FROM customersub) AS Longest_Subscriped
FROM customersub
ORDER BY SubscriptionDate ASC
LIMIT 10;

-- 📍 Age group-wise churn analysis (e.g., 18–25, 26–35, etc.).
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
        END AS Age_Group,
        SUM(IsChurned) AS Churned_Customers
FROM customersub
GROUP BY Age_Group
ORDER BY Age_Group ASC;

