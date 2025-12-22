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

<!-- _color: "rgba(21, 51, 96, 1)" -->

# Analytics Engineering 
# Session 2: First Steps in dbt

---

## Agenda

- Environment Check
- VSCode dbt Power User Extension
- Executing Staging Models
- Inspecting Compiled SQL
- Visualizing Lineage
- Q&A

---

## Environment Check

Before we begin, ensure you have completed the setup:

1.  **Forked & Cloned**: You are working on *your* fork of the repo.
2.  **Python Environment**: `uv` virtual environment is active (`source dbt_mbads/bin/activate`).
3.  **Dependencies**: `uv pip install -r requirements.txt` ran successfully.
4.  **Database**: `python create_db.py` created `my_database.duckdb`.
5.  **dbt Check**: `dbt debug` returns "All checks passed!".

---

## VSCode dbt Power User Extension

We will use this extension to bridge the gap between code and execution.

**Installation**:
1.  Go to the Extensions view in VS Code (Cmd+Shift+X).
2.  Search for "dbt Power User" (by Innoverio).
3.  Install it.

**Configuration**:
- Ensure it detects your `dbt_project.yml`.
- It might ask to install `dbt-osmosis` or other dependencies (allow it).

---

## Executing Staging Models

Let's interact with our data. Open `models/staging/stg_customers.sql`.

1.  **Run Model**: Click the "Run" button (or Cmd+Enter).
2.  **Inspect Results**:
    - View the result grid at the bottom.
    - Check row counts and data values.
    - Verify that column renaming and casting worked as expected.

---

## Inspecting Compiled SQL

Understand what dbt sends to the database.

1.  **Compile**: Click the "Compile" button.
2.  **View SQL**: A new tab opens with the raw SQL.
    - Notice how `{{ source(...) }}` is replaced by `"my_database"."main"."customers"`.
    - Notice how Jinja variables are substituted.

*This is critical for debugging logic errors!*

---

## Visualizing Lineage

See how data flows through your project.

1.  **Lineage Tab**: Click the "Lineage" button in the extension bar.
2.  **Graph**:
    - **Left**: `source.raw.customers` (The Parquet file/Table).
    - **Right**: `stg_customers` (Your View).
3.  **Impact**: If you change the source, you see immediately what breaks.

---

## What have we achieved in this session

- Verify everyone's environment is ready (Fork, uv, DB).
- Install and configure VSCode dbt Power User.
- Run `stg_customers` and `stg_orders` to inspect the data.
- Check the compiled SQL to understand Jinja resolution.
- Explore the lineage graph to see dependencies.

**Next Session:** Sources, Seeds & Dependencies.
