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
# Session 4: Materializations & Grants

---

## Agenda

- Core Materializations
- View vs. Table vs. Ephemeral
- Configuring Grants
- Trade-offs
- Q&A

---

## Core Materializations

How dbt persists your models in the database.

1.  **View**: `CREATE VIEW`. Virtual table. No data stored.
2.  **Table**: `CREATE TABLE AS SELECT`. Physical storage. Faster to query, slower to build.
3.  **Ephemeral**: CTE. Not created in DB. Interpolated into downstream models.
4.  **Incremental**: Updates existing table. (Covered in Session 11).

---

## View vs. Table vs. Ephemeral

| Type | Pros | Cons | Use Case |
| :--- | :--- | :--- | :--- |
| **View** | Fast build, always fresh | Slow query | Staging, lightweight models |
| **Table** | Fast query | Slow build, storage cost | BI Marts, heavy logic |
| **Ephemeral** | No clutter | Hard to debug | Reusable logic snippets |

---

## Configuring Grants

Manage database permissions directly in dbt.

```yaml
models:
  +grants:
    select: ['reporter', 'analyst']
    
  my_sensitive_model:
    +grants:
      select: ['admin']
```

dbt runs the necessary `GRANT` statements after creating the model.

---

## Trade-offs

- **Start with Views**: They are cheap and easy.
- **Move to Tables**: When query performance becomes an issue for downstream users.
- **Use Ephemeral**: Sparingly, to keep the warehouse clean of intermediate steps.

---

## What have we achieved in this session

- Configure different materializations for models
- Implement grants for specific roles
- Analyze build logs for different materializations

**Next Session:** Modeling I: SQL, Modularity & DRY.
