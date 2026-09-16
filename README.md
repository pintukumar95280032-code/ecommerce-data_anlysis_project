# ecommerce-data_anlysis_project
Sample - Superstore_dataset
# 📊 E-Commerce Performance & Customer Insights Dashboard (Power BI)

An end-to-end Business Intelligence solution built using **Power BI**, **Data Modeling (Star Schema)**, and **DAX**. This interactive executive dashboard analyzes e-commerce transaction dynamics, category-level profitability, and behavioral customer segmentation via the **RFM Model**.

---

## 📌 Project Overview
E-commerce businesses generate vast amounts of transactional and demographic data, yet turning these records into executive-level strategic decisions is often challenging. 

This project solves this problem by:
- Monitoring primary top-line sales metrics dynamically.
- Uncovering hidden margin leakage and identifying unprofitable product sub-categories.
- Segmenting customer behavior using **Recency, Frequency, and Monetary (RFM)** scores to optimize marketing retention campaigns.
- Empowering business leaders with multi-dimensional filtering across geographical regions and multi-year timeframes.

---

## 🖼️ Dashboard Preview

![Dashboard Preview](assets/dashboard_screenshot.png)
*(Note: Upload your dashboard screenshot in an `assets` folder or attach it directly here)*

---

## 🛠️ Tech Stack & Skills Used
- **Business Intelligence Tool:** Microsoft Power BI Desktop
- **Data Modeling:** Star Schema (Fact & Dimension tables)
- **Analytical Calculations:** Custom DAX (Data Analysis Expressions)
- **Data Source / Warehouse:** Relational schema (`fact_orders`, `dim_customers`, `dim_products`, `dim_rfm_segments`)
- **Key Frameworks:** RFM Customer Segmentation, Cohort & Trend Analysis

---

## 🏗️ Data Architecture & Modeling
The data model connects normalized dimension tables to the core fact table using **1-to-Many (`1:*`)** relationships:

- `ecommerce_dw fact_orders` (Fact table containing order-level transactions, sales, profit, and quantities)
- `dim_customers` (Customer demographic information and geographic regions)
- `dim_products` (Product catalog, category, and sub-category metadata)
- `dim_rfm_segments` (Calculated Recency, Frequency, and Monetary scores and segment labels)

---

## 📐 Key DAX Measures Formulated

| Measure Name | DAX Expression | Business Purpose |
|---|---|---|
| **Total Sales** | `SUM('ecommerce_dw fact_orders'[sales])` | Tracks aggregate gross revenue |
| **Total Profit** | `SUM('ecommerce_dw fact_orders'[profit])` | Measures overall net business profitability |
| **Profit Margin %** | `DIVIDE([Total Profit], [Total Sales], 0)` | Calculates return margin per dollar earned |
| **Total Orders** | `DISTINCTCOUNT('ecommerce_dw fact_orders'[order_id])` | Monitors overall transaction and order volume |

---

## 📈 Visual Breakdown & Key Insights

1. **Executive KPI Cards:** Immediate visibility into four core metrics—Total Sales, Total Profit, Profit Margin %, and Order Volume.
2. **Monthly Sales Trend (Area Chart):** Identifies cyclical buying patterns, seasonal spikes, and year-over-year revenue trajectory.
3. **Sub-Category Profitability (Clustered Bar Chart):** Pinpoints high-margin drivers (e.g., Copiers, Technology) alongside loss-making lines (e.g., Tables, Supplies) to guide pricing and inventory choices.
4. **RFM Customer Segmentation (Donut Chart):** Segregates the customer base into actionable behavioral cohorts (e.g., *Champions, Loyal Customers, At-Risk, Hibernating*).
5. **Interactive Controls:** Dynamic **Tile-styled Slicers** for Region and Order Year allow fast cross-filtering across the entire report canvas.

---

## 🚀 How to Run the Project Locally

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/your-username/ecommerce-sales-powerbi-dashboard.git](https://github.com/your-username/ecommerce-sales-powerbi-dashboard.git)
