FMCG Sales Analytics SQL Project

Project Overview

This project simulates a real-world **FMCG (Fast-Moving Consumer Goods)** data analysis environment for "QuickMart", a retail company operating across multiple regions. The goal is to demonstrate proficiency in:

- **SQL querying** for business intelligence
- **Data analysis** for sales, inventory, and promotions
- **Problem-solving** with real business constraints
- **Communication** of actionable insights

**Business Context:** QuickMart wants to optimize sales performance, inventory management, and promotional effectiveness across its 8 stores and 20 product categories.



Database Schema

The database consists of 6 interconnected tables representing the core operations of an FMCG retailer:

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  products   │     │   stores    │     │ customers   │
├─────────────┤     ├─────────────┤     ├─────────────┤
│ product_id  │◄────│ store_id    │────►│ customer_id │
│ name        │     │ name        │     │ loyalty_tier│
│ category    │     │ region      │     │ signup_date │
│ price       │     │ city        │     │ birth_year  │
│ cost        │     │ type        │     │ gender      │
└──────┬──────┘     └──────┬──────┘     └──────┬──────┘
       │                   │                   │
       │    ┌──────────────┴──────────────┐    │
       │    │           sales             │    │
       │    ├─────────────────────────────┤    │
       └────┤ product_id                  │────┘
            │ store_id                    │
            │ customer_id                 │
            │ transaction_date            │
            │ quantity                    │
            │ discount_percent            │
            └──────────────┬──────────────┘
                           │
              ┌────────────┴────────────┐
              │       inventory         │
              ├─────────────────────────┤
              │ store_id                │
              │ product_id              │
              │ stock_on_hand           │
              │ reorder_level           │
              └─────────────────────────┘


**Key Relationships:**
- One `product` can appear in many `sales` and `inventory` records
- One `store` can have many `sales` and `inventory` entries
- One `customer` can have many `sales` transactions


Dataset Characteristics

| Table | Row Count (Sample) | Time Period | Key Metrics |
|-------|-------------------|-------------|--------------|
| products | 20 | N/A | Unit price, cost, category |
| stores | 8 | N/A | Region, type, size |
| customers | 50 | 2021-2023 | Loyalty tier, demographics |
| sales | 500+ | Q1 2024 | Revenue, quantity, discounts |
| inventory | 10+ | Jan 2024 | Stock levels, reorder points |
| promotions | 7 | Q1 2024 | Discount rates, durations |


----


fmcg-sql-portfolio/
│
├── README.md                 # This file
├── schema/
│   └── create_tables.sql     # Database schema definition
│
├── data/
│   └── seed_data.sql         # INSERT statements for all tables
│
├── queries/
│   ├── level1_basic/
│   │   ├── q1_top_5_products.sql
│   │   └── q2_top_store_revenue.sql
│   ├── level2_joins/
│   │   ├── q3_regional_metrics.sql
│   │   └── q4_unsold_west_products.sql
│   ├── level3_window/
│   │   ├── q5_running_total.sql
│   │   └── q6_store_ranking.sql
│   └── level4_advanced/
│       ├── q7_promo_effectiveness.sql
│       └── q8_inventory_risk.sql
│
├── insights/
│   └── business_recommendations.md
│
└── visualizations/           # (Optional: Tableau/Power BI exports)
    └── dashboard_screenshots/





