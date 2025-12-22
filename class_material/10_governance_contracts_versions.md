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
# Session 10: Model Governance: Contracts & Versions

---

## Agenda

- Model Contracts
- Model Versions
- Deprecation
- Model Access (Review)
- Q&A

---

## Model Contracts

Enforce the shape of your data (schema) at build time.

```yaml
models:
  - name: dim_customers
    config:
      contract: {enforced: true}
    columns:
      - name: id
        data_type: int
        constraints:
          - type: not_null
```

If the SQL returns a string for `id`, the build **fails**.

---

## Model Versions

Manage changes to your models over time without breaking downstream consumers.

- **v1**: The current stable version.
- **v2**: The new version with breaking changes.

```yaml
models:
  - name: dim_customers
    latest_version: 1
    versions:
      - v: 1
      - v: 2
```

---

## Deprecation

Signal that a model version is going away.

```yaml
versions:
  - v: 1
    deprecation_date: 2025-12-31
```

dbt will warn users referencing v1.

---

## Model Access (Review)

- **Public**: Open to all.
- **Protected**: Open to specific projects.
- **Private**: Internal use only.

Combine Contracts + Versions + Access = **Data Mesh Ready**.

---

## What have we achieved in this session

- Add a contract to a model
- Version a model and define a deprecation date
- Restrict access to a model

**Next Session:** Advanced Materializations: Incremental & Snapshots.
