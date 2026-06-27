USE customer_growth_engine;

-- Top Revenue Generating Customers

SELECT
    `Customer ID`,
    Monetary_Value,
    Purchase_Frequency,
    CLV_Segment
FROM customer_clv_ml_v2
ORDER BY Monetary_Value DESC
LIMIT 20;

-- High Value Customers

SELECT
    CLV_Segment,
    COUNT(*) AS Customer_Count,
    ROUND(SUM(Monetary_Value),2) AS Total_Revenue
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Total_Revenue DESC;

-- Customer Engagement Analysis

SELECT
    CLV_Segment,
    ROUND(AVG(Engagement_Score),2) AS Avg_Engagement,
    ROUND(AVG(Purchase_Velocity),2) AS Avg_Purchase_Velocity
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Avg_Engagement DESC;

-- Customer Value Analysis

SELECT
    CLV_Segment,
    ROUND(AVG(Average_Order_Value),2) AS Avg_Order_Value,
    ROUND(AVG(Daily_Value),2) AS Avg_Daily_Value
FROM customer_clv_ml_v2
GROUP BY CLV_Segment
ORDER BY Avg_Order_Value DESC;

-- Business Summary Metrics

SELECT
    COUNT(*) AS Total_Customers,
    ROUND(SUM(Monetary_Value),2) AS Total_Revenue,
    ROUND(AVG(Monetary_Value),2) AS Avg_Customer_Value,
    ROUND(AVG(Purchase_Frequency),2) AS Avg_Purchase_Frequency
FROM customer_clv_ml_v2;