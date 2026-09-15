use ecommerce_dw;
SHOW TABLES;
SELECT 
    p.category,
    p.sub_category,
    ROUND(SUM(o.sales), 2) AS total_revenue,
    SUM(o.quantity) AS total_units_sold
FROM fact_orders o
JOIN dim_products p ON o.product_id = p.product_id
GROUP BY p.category, p.sub_category
ORDER BY total_revenue DESC
LIMIT 5;
SELECT 
    p.category,
    p.sub_category,
    ROUND(SUM(o.sales), 2) AS total_sales,
    ROUND(SUM(o.profit), 2) AS total_loss,
    ROUND(AVG(o.discount) * 100, 2) AS avg_discount_pct
FROM fact_orders o
JOIN dim_products p ON o.product_id = p.product_id
GROUP BY p.category, p.sub_category
HAVING ROUND(sum(o.profit),2)<0
ORDER BY total_loss ASC;
SELECT 
    p.category,
    p.sub_category,
    ROUND(SUM(o.sales), 2) AS total_revenue,
    SUM(o.quantity) AS total_units_sold
FROM fact_orders o
JOIN dim_products p ON o.product_id = p.product_id
GROUP BY p.category, p.sub_category
ORDER BY total_revenue DESC
LIMIT 5;
WITH monthly_metrics AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        ROUND(SUM(sales), 2) AS current_month_sales
    FROM fact_orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    sales_month,
    current_month_sales,
    LAG(current_month_sales, 1) OVER (ORDER BY sales_month) AS previous_month_sales,
    ROUND(
        ((current_month_sales - LAG(current_month_sales, 1) OVER (ORDER BY sales_month)) 
        / LAG(current_month_sales, 1) OVER (ORDER BY sales_month)) * 100, 2
    ) AS mom_growth_pct
FROM monthly_metrics
ORDER BY sales_month;
USE ecommerce_dw;

-- Check the newly pushed RFM table
SELECT customer_segment, COUNT(*) AS total_customers, ROUND(SUM(monetary), 2) AS segment_revenue
FROM dim_rfm_segments
GROUP BY customer_segment
ORDER BY segment_revenue DESC;
