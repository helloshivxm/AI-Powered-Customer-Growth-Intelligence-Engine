USE customer_growth_engine;

-- Monthly Customer Activity

SELECT
    YEAR(STR_TO_DATE(InvoiceDate,'%Y-%m-%d %H:%i:%s')) AS Order_Year,
    MONTH(STR_TO_DATE(InvoiceDate,'%Y-%m-%d %H:%i:%s')) AS Order_Month,
    COUNT(DISTINCT `Customer ID`) AS Active_Customers
FROM customer_segments
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;

-- Monthly Revenue Trend

SELECT
    YEAR(STR_TO_DATE(InvoiceDate,'%Y-%m-%d %H:%i:%s')) AS Order_Year,
    MONTH(STR_TO_DATE(InvoiceDate,'%Y-%m-%d %H:%i:%s')) AS Order_Month,
    ROUND(SUM(Monetary_Value),2) AS Revenue
FROM customer_segments
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;

-- Repeat Purchase Analysis

SELECT
    CASE
        WHEN Purchase_Frequency = 1 THEN 'One Time'
        WHEN Purchase_Frequency BETWEEN 2 AND 5 THEN 'Repeat Customer'
        ELSE 'Frequent Customer'
    END AS Customer_Type,
    COUNT(*) AS Customer_Count
FROM customer_segments
GROUP BY Customer_Type;

-- Retention Proxy Analysis

SELECT
    Segment,
    ROUND(AVG(Purchase_Frequency),2) AS Avg_Purchase_Frequency,
    ROUND(AVG(Recency),2) AS Avg_Recency
FROM customer_segments
GROUP BY Segment
ORDER BY Avg_Purchase_Frequency DESC;