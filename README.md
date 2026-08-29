# Sales & Inventory Analytics Dashboard

## Project Overview

This project demonstrates an end-to-end business intelligence and data analytics solution built using Microsoft SQL Server and Power BI. The solution analyzes sales performance, profitability, customer order activity, product performance, geographic performance, and inventory levels.

The project combines relational database design, SQL data validation, business analysis, and interactive data visualization to transform operational supply chain data into actionable business insights.

## Business Objectives

The analysis was designed to answer several important business questions:

- Which products generate the most revenue?
- Which products generate the highest gross profit?
- How does revenue vary by product category?
- Which geographic markets generate the most orders and revenue?
- What is the current status of customer orders?
- Which products require inventory replenishment?
- How do current inventory levels compare with reorder points?
- What is the organization's overall gross profit margin?

## Technology Stack

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL
- Microsoft Power BI
- DAX
- Power Query
- Git
- GitHub

## Database Architecture

The SQL Server database was designed around five core operational tables:

- **Products** – product information, category, cost, selling price, supplier, and reorder point
- **Orders** – order transactions, quantities, dates, warehouse assignments, and order status
- **Inventory** – inventory quantities by product and warehouse
- **Suppliers** – supplier information
- **Warehouses** – warehouse and geographic information

Primary and foreign key relationships maintain referential integrity between the tables.

Key relationships include:

- Inventory → Products
- Inventory → Warehouses
- Orders → Products
- Orders → Warehouses
- Products → Suppliers

## Data Quality Validation

SQL validation queries were developed to evaluate database integrity before performing analysis.

Validation included:

- Primary key verification
- Foreign key verification
- Referential integrity testing
- Orphan-record detection
- Table and column structure inspection
- Data type validation

The referential integrity tests identified **zero orphan records** across the tested database relationships.

## SQL Product Performance Analysis

SQL aggregation queries were developed to calculate product-level performance metrics, including:

- Units Ordered
- Total Revenue
- Total Cost
- Gross Profit
- Gross Profit Margin

These queries demonstrate the use of:

- INNER JOIN
- LEFT JOIN
- GROUP BY
- ORDER BY
- SUM()
- CAST()
- NULLIF()
- Calculated business metrics

## Power BI Dashboard

The Power BI dashboard provides an executive-level view of sales, profitability, order activity, and inventory performance.

### Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Revenue | $68,676.44 |
| Total Orders | 15 |
| Total Units Ordered | 356 |
| Total Gross Profit | $27,666.44 |
| Gross Profit Margin | 40.29% |
| Products Requiring Reorder | 5 |

### Dashboard Visualizations

The dashboard includes:

- Revenue by Product
- Gross Profit by Product
- Orders by State
- Revenue by State
- Units Ordered by Product
- Revenue Trend Over Time
- Orders by Status
- Revenue by Category
- Gross Profit by Category
- Inventory Status
- Products Requiring Reorder

Interactive slicers allow users to filter the dashboard by:

- State
- Product Category
- Order Status

## Key Business Insights

### Product Performance

The **Hydraulic Pump** generated the highest revenue at approximately **$15,749.65** and the highest gross profit at approximately **$6,124.65**.

The **Industrial Sensor** recorded the highest sales volume with **85 units ordered**.

### Geographic Performance

**Georgia** was the strongest geographic market in the dataset, generating approximately **$41,000 in revenue** and accounting for **9 orders**.

Florida ranked second, followed by North Carolina.

### Category Performance

**Electronics** generated the highest category revenue at approximately **$34,000**, followed by Mechanical products at approximately **$28,000**.

Electronics also generated the highest category gross profit.

### Inventory Risk

Five products were identified as requiring replenishment based on inventory levels relative to their reorder points.

These products were:

- Pressure Valve
- Conveyor Belt
- Servo Motor
- Drive Assembly
- Hydraulic Pump

This information can support purchasing decisions and help reduce the risk of stockouts.

## Repository Structure

```text
Sales-Inventory-Analytics-Dashboard/
│
├── 01_Database_Schema_and_Relationships.sql
├── 02_Data_Quality_Validation.sql
├── 03_Product_Performance_Analysis.sql
├── README.md
└── dashboard/
    └── Sales_Inventory_Dashboard.png
