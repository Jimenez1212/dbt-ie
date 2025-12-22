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
# Session 7: Jinja, Macros & Packages

---

## Agenda

- dbt Packages
- The dbt Hub
- Jinja Templating
- Creating Macros
- Q&A

---

## dbt Packages

Libraries of dbt code you can import.

- **dbt-utils**: Essential SQL utilities (surrogate keys, date spines).
- **codegen**: Automates YAML and SQL generation.
- **Vendor Packages**: Stripe, Adwords, etc.

Install via `packages.yml` and `dbt deps`.

---

## Jinja Templating

The language that makes SQL dynamic.

- **Variables**: `{{ my_var }}`
- **Control Flow**: `{% if %}`, `{% for %}`
- **Functions**: `{{ ref() }}`, `{{ source() }}`

```sql
select
{% for col in ['a', 'b', 'c'] %}
    sum({{ col }}) as sum_{{ col }},
{% endfor %}
...
```

---

## Creating Macros

Reusable functions in SQL.

```sql
-- macros/cents_to_dollars.sql
{% macro cents_to_dollars(column_name) %}
    ({{ column_name }} / 100)::numeric(16, 2)
{% endmacro %}
```

Usage:
```sql
select {{ cents_to_dollars('amount_cents') }} from payments
```

---

## What have we achieved in this session

- Install `dbt-utils` package
- Create a custom macro
- Use package macros for surrogate keys and date spines

**Next Session:** Testing in dbt.
