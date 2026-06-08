 Sales Trend Analysis Using Aggregations

CREATE DATABASE sales_analysis;

USE sales_analysis;

CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-05', 500.00, 101),
(2, '2024-01-12', 700.00, 102),
(3, '2024-02-03', 400.00, 103),
(4, '2024-02-18', 900.00, 104),
(5, '2024-03-07', 1200.00, 101),
(6, '2024-03-15', 600.00, 105),
(7, '2024-04-02', 750.00, 106),
(8, '2024-04-20', 1100.00, 107),
(9, '2024-05-10', 850.00, 108),
(10, '2024-05-25', 950.00, 109);

i) Total Revenue

SELECT SUM(amount) AS total_revenue FROM online_sales;

ii) Total Orders

SELECT COUNT(DISTINCT order_id) AS total_ordersFROM online_sales;

iii) Monthly Revenue Analysis

    SELECT YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS monthly_revenue
    FROM online_sales
    GROUP BY YEAR(order_date), MONTH(order_date)
    ORDER BY year, month;

iV) Monthly Revenue and Order Volume Analysis (Final Query)
    
    SELECT YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
    FROM online_sales
    GROUP BY YEAR(order_date), MONTH(order_date)
    ORDER BY year, month;