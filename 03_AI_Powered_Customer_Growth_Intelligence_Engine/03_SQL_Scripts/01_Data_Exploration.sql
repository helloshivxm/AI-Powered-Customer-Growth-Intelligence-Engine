USE customer_growth_engine;

-- Total Customers
SELECT COUNT(*) AS Total_Customers
FROM customer_clv_ml_v2;

-- Sample Data
SELECT *
FROM customer_clv_ml_v2
LIMIT 10;

-- Customer Segments
SELECT
    Segment,
    COUNT(*) AS Customer_Count
FROM customer_clv_ml_v2
GROUP BY Segment
ORDER BY Customer_Count DESC;

-- CLV Segments
SELECT
    CLV_Segment,
    COUNT(*) AS Customer_Count
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Customer_Count DESC;

-- Revenue Statistics
SELECT
    ROUND(SUM(Monetary_Value),2) AS Total_Revenue,
    ROUND(AVG(Monetary_Value),2) AS Average_Revenue,
    ROUND(MAX(Monetary_Value),2) AS Highest_Revenue,
    ROUND(MIN(Monetary_Value),2) AS Lowest_Revenue
FROM customer_clv_ml_v2;

-- Purchase Frequency Statistics
SELECT
    ROUND(AVG(Purchase_Frequency),2) AS Avg_Purchase_Frequency,
    MAX(Purchase_Frequency) AS Max_Purchase_Frequency,
    MIN(Purchase_Frequency) AS Min_Purchase_Frequency
FROM customer_clv_ml_v2;