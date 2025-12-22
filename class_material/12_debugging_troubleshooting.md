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
# Session 12: Debugging & Troubleshooting

---

## Agenda

- Reading Error Messages
- The `dbt.log` File
- Debugging with Compiled SQL
- Common Errors (YAML vs SQL)
- Q&A

---

## Reading Error Messages

dbt errors usually tell you:
1.  **What** failed (Compilation or Execution).
2.  **Where** it failed (Model name, Line number).
3.  **Why** it failed (Database error, Jinja error).

*Tip: Read from the bottom up.*

---

## The `dbt.log` File

Located in `logs/dbt.log`.

- Contains the full history of your command.
- Shows the exact SQL sent to the database.
- Essential for debugging "silent" failures or performance issues.

---

## Debugging with Compiled SQL

When a model fails to run:
1.  Go to `target/compiled/my_project/models/.../my_model.sql`.
2.  Copy the SQL.
3.  Run it directly in your database (DuckDB CLI or DBeaver).

This isolates whether the error is dbt logic or valid SQL syntax.

---

## Common Errors

- **YAML**: Indentation errors (Python is strict!).
- **Jinja**: Missing `{% endif %}` or `}}`.
- **SQL**: Trailing commas, mismatched parentheses.
- **Platform**: "Table not found" (check your `ref()` or `source()`).

---

## What have we achieved in this session

- Debug intentional errors in SQL and YAML
- Analyze `dbt.log`
- Fix a broken model using compiled SQL

**Next Session:** State & Pipeline Management.
