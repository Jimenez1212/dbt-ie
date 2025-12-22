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
# Session 6: Modeling II: DAGs & Python Models

---

## Agenda

- The DAG (Directed Acyclic Graph)
- Designing Clean Lineage
- Python Models in dbt
- Handling Complex Dependencies
- Q&A

---

## The DAG (Directed Acyclic Graph)

Visualizes the flow of data through your project.

- **Directed**: Data flows one way (Source -> Mart).
- **Acyclic**: No loops allowed (Model A cannot depend on Model B if B depends on A).
- **Graph**: Nodes (models) and Edges (dependencies).

Use `dbt docs generate` + `dbt docs serve` to see it.

---

## Designing Clean Lineage

Avoid "Spaghetti DAGs".

- **Left-to-Right Flow**: Sources -> Staging -> Intermediate -> Marts.
- **Fan-In**: Many staging models join into fewer marts.
- **Avoid Cross-Layer Dependencies**: Marts shouldn't select from other Marts (usually).

---

## Python Models in dbt

dbt supports Python models for transformations hard to do in SQL (e.g., complex parsing, ML, API calls).

```python
def model(dbt, session):
    dbt.config(materialized="table")
    
    df = dbt.ref("my_sql_model")
    # Use Polars or Pandas logic
    df = df.filter(df["amount"] > 100)
    
    return df
```

*Note: Requires a data platform that supports Python (DuckDB, Snowflake, BigQuery).*

---

## Handling Complex Dependencies

- **Upstream Dependencies**: Use `ref()`.
- **External Dependencies**: Use `source()`.
- **Late Binding**: Handling circular logic (rare, usually a design flaw).

---

## What have we achieved in this session

- Visualize the DAG
- Create a dbt Python model for non-SQL transformations
- Refactor a messy DAG into a clean lineage

**Next Session:** Jinja, Macros & Packages.
