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
# Session 13: State & Pipeline Management

---

## Agenda

- Understanding dbt State
- The `state:modified` Selector
- `dbt retry`
- `dbt clone`
- Q&A

---

## Understanding dbt State

"State" refers to the artifacts (`manifest.json`) from a previous run.

- **Comparison**: dbt compares your current code to the "state" code.
- **Use Case**: "Only run models I changed."

---

## The `state:modified` Selector

The most powerful selector for CI/CD.

```bash
dbt build --select state:modified+ --state path/to/prod/artifacts
```

- **modified**: The model logic changed.
- **+**: Run everything downstream of the change.
- **Result**: Saves time and money by skipping unchanged models.

---

## `dbt retry`

If a job fails halfway through:

```bash
dbt retry
```

- dbt remembers what failed in the last run.
- It restarts execution *only* for the failed models and their dependencies.
- No need to manually type `dbt run --select ...`.

---

## `dbt clone`

Creates a lightweight copy of your project in the warehouse.

- **Zero-Copy Clone**: (On Snowflake/BigQuery) Instant copy of tables.
- **Use Case**: Create a staging environment that looks exactly like production for testing.

---

## What have we achieved in this session

- Run dbt with `--state` and `state:modified`
- Use `dbt retry` after a failure
- Clone a project subset

**Next Session:** Deployment & CI/CD.
