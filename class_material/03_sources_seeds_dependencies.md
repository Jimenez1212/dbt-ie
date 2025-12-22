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
# Session 3: Sources, Seeds & Dependencies

---

## Agenda

- Configuring Sources
- Source Freshness
- Working with Seeds
- Managing Dependencies
- Q&A

---

## Configuring Sources

Sources represent raw data loaded into your warehouse by an EL tool (or `create_db.py` in our case).

Define them in a `.yml` file under `models/`:

```yaml
version: 2

sources:
  - name: raw
    tables:
      - name: customers
      - name: orders
```

Reference them in SQL: `{{ source('raw', 'customers') }}`

---

## Source Freshness

Ensure your raw data is up-to-date.

```yaml
sources:
  - name: raw
    freshness:
      warn_after: {count: 12, period: hour}
      error_after: {count: 24, period: hour}
    loaded_at_field: _etl_loaded_at
```

Command: `dbt source freshness`

---

## Working with Seeds

Seeds are CSV files in your `seeds/` directory. Best for static data that changes infrequently.

1.  Add `country_codes.csv` to `seeds/`.
2.  Run `dbt seed`.
3.  Reference in SQL: `{{ ref('country_codes') }}`.

**Do not use seeds for large raw data!**

---

## Managing Dependencies

dbt automatically builds a dependency graph (DAG) based on your `ref()` calls.

- **Upstream**: Models you select *from*.
- **Downstream**: Models that select *from you*.

You don't need to manually order execution. `dbt run` handles it.

---

## What have we achieved in this session

- Define sources in `sources.yml`
- Load static data with seeds
- Run `dbt source freshness` and debug failures

**Next Session:** Materializations & Grants.
