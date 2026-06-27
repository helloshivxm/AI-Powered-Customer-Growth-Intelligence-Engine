USE customer_growth_engine;

-- Customer Segment Distribution

SELECT
    Segment,
    COUNT(*) AS Customer_Count
FROM customer_segments
GROUP BY Segment
ORDER BY Customer_Count DESC;

-- Segment Percentage

SELECT
    Segment,
    COUNT(*) AS Customer_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_segments),
        2
    ) AS Percentage
FROM customer_segments
GROUP BY Segment
ORDER BY Customer_Count DESC;

-- Average Customer Metrics By Segment

SELECT
    Segment,
    ROUND(AVG(Recency),2) AS Avg_Recency,
    ROUND(AVG(Purchase_Frequency),2) AS Avg_Frequency,
    ROUND(AVG(Monetary_Value),2) AS Avg_Monetary_Value
FROM customer_segments
GROUP BY Segment
ORDER BY Avg_Monetary_Value DESC;

-- Revenue Contribution By Segment

SELECT
    Segment,
    ROUND(SUM(Monetary_Value),2) AS Total_Revenue
FROM customer_segments
GROUP BY Segment
ORDER BY Total_Revenue DESC;

-- Top 10 Highest Value Customers

SELECT
    `Customer ID`,
    Segment,
    Monetary_Value
FROM customer_segments
ORDER BY Monetary_Value DESC
LIMIT 10;