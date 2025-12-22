---
marp: true
author: 
  - name: Daniel Garcia
  - email: dgarciah@faculty.ie.edu
  - url: www.linkedin.com/in/dgarhdez
header: ![center width:100px](../img/ie_logo.png)
size: 16:9
footer: "Analytics Engineering, dgarciah@faculty.ie.edu"
theme: default
math: katex
style: |
    img[alt~="center"] {
      display: block;
      margin: 0 auto;
    }
---

<!-- _color: "rgb(31,56,94)" -->

# Analytics Engineering 
# Session 5: Dimensional Modeling & Project Structure

---

## Agenda

- Dimensional Modeling 101 (Star Schema)
- Facts vs Dimensions
- The dbt Layered Architecture
- Staging -> Intermediate -> Marts
- Hands-on: Building our Marts
- Q&A

---

## Dimensional Modeling 101

We organize data for **analytics**, not transaction processing.

- **OLTP (Online Transaction Processing)**: Normalized, optimized for writes (inserts/updates). Complex joins.
- **OLAP (Online Analytical Processing)**: Denormalized, optimized for reads (aggregations). Star Schema.

**The Goal**: Make it easy for business users to ask questions.

---

## The Star Schema

A central **Fact** table surrounded by **Dimension** tables.

- **Fact Table**: Measurements, metrics, events. (e.g., `orders`, `page_views`, `transactions`).
    - *High volume, numeric values, foreign keys.*
- **Dimension Table**: Context, attributes, "who, what, where". (e.g., `customers`, `products`, `dates`).
    - *Low volume, descriptive text, primary keys.*

---

## The dbt Layered Architecture

We don't just jump from Source to Star Schema. We build in layers.

1.  **Sources**: Raw data (Parquet, JSON, Postgres).
2.  **Staging**: Cleaned, renamed, casted 1:1 with sources.
3.  **Intermediate**: Complex logic, joins, aggregations (internal use).
4.  **Marts**: Final Facts and Dimensions (business facing).

---

## Layer 1: Staging

*Goal: Clean and Standardize.*

- **One-to-one** with source tables.
- **Renaming**: `cust_id` -> `customer_id`.
- **Casting**: `price` (string) -> `price` (decimal).
- **Materialization**: Usually `view`.

*Example*: `stg_customers`, `stg_orders`.

---

## Layer 2: Intermediate

*Goal: Handle Complexity.*

- Isolate complex joins or business logic.
- Not exposed to end users.
- **Materialization**: `ephemeral` or `view`.

*Example*: `int_order_payments_pivoted` (joining orders to payments and pivoting by payment method).

---

## Layer 3: Marts (The Star Schema)

*Goal: Business Consumption.*

- **Dim Models**: `dim_customers`, `dim_products`.
- **Fact Models**: `fct_orders`, `fct_monthly_revenue`.
- **Materialization**: `table` or `incremental`.

*This is what you connect to Tableau/PowerBI!*

---

## Hands-on: Building our Marts

Let's refactor our project to follow this structure.

1.  **Identify**: What are our facts? (Orders). What are our dims? (Customers, Products).
2.  **Create Intermediate**: Join `stg_orders` with `stg_order_items`?
3.  **Create Marts**:
    - `dim_customers`: `stg_customers` + `stg_addresses`.
    - `fct_orders`: `stg_orders` + aggregated metrics.

---

## What have we achieved in this session

- Design a Star Schema for the ecommerce dataset
- Build Intermediate models to join Staging models
- Create Final Marts (Fact Orders, Dim Customers)
- Visualize the clean lineage from Source to Mart

**Next Session:** Modeling II: DAGs & Python Models.
