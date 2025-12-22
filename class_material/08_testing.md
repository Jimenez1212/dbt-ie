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
# Session 8: Testing in dbt

---

## Agenda

- Why Test?
- Generic Tests
- Singular Tests
- Custom Generic Tests
- Q&A

---

## Why Test?

- **Trust**: Ensure data quality for stakeholders.
- **Regression**: Catch bugs before they hit production.
- **Documentation**: Tests describe expected behavior.

---

## Generic Tests

Built-in tests defined in YAML.

- `unique`: Column values are unique.
- `not_null`: Column has no nulls.
- `accepted_values`: Value is in a specific list.
- `relationships`: Foreign key integrity.

```yaml
columns:
  - name: user_id
    tests:
      - unique
      - not_null
```

---

## Singular Tests

Custom SQL queries in `tests/`. If the query returns rows, the test fails.

```sql
-- tests/assert_total_payment_positive.sql
select order_id, sum(amount) as total_amount
from {{ ref('orders') }}
group by 1
having total_amount < 0
```

---

## Custom Generic Tests

Write your own reusable tests using Jinja.

```sql
-- macros/test_is_even.sql
{% test is_even(model, column_name) %}
    select *
    from {{ model }}
    where {{ column_name }} % 2 != 0
{% endtest %}
```

Usage in YAML:
```yaml
- name: my_col
  tests:
    - is_even
```

---

## What have we achieved in this session

- Apply generic tests (unique, not_null)
- Write singular SQL tests
- Create a custom generic test

**Next Session:** Documentation, Lineage & Exposures.
