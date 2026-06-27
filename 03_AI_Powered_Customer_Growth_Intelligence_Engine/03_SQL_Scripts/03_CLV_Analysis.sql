USE customer_growth_engine;

-- CLV Segment Distribution

SELECT
    CLV_Segment,
    COUNT(*) AS Customer_Count
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Customer_Count DESC;

-- Revenue By CLV Segment

SELECT
    CLV_Segment,
    ROUND(SUM(Monetary_Value),2) AS Total_Revenue
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Total_Revenue DESC;

-- Average Purchase Frequency By CLV Segment

SELECT
    CLV_Segment,
    ROUND(AVG(Purchase_Frequency),2) AS Avg_Purchase_Frequency
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Avg_Purchase_Frequency DESC;

-- Average Revenue By CLV Segment

SELECT
    CLV_Segment,
    ROUND(AVG(Monetary_Value),2) AS Avg_Revenue
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Avg_Revenue DESC;

-- Top 10 High Value Customers

SELECT
    `Customer ID`,
    CLV_Segment,
    Monetary_Value,
    Purchase_Frequency
FROM customer_clv_ml_v2
ORDER BY Monetary_Value DESC
LIMIT 10;