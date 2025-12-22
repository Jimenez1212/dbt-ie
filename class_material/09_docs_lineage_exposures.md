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
# Session 9: Documentation, Lineage & Exposures

---

## Agenda

- Documenting Models
- Generating the Docs Site
- Lineage Graph
- Exposures
- Q&A

---

## Documenting Models

- **Descriptions**: Add `description: "..."` to YAML.
- **Doc Blocks**: Use `{% docs %}` in markdown files for long descriptions.
- **Coverage**: Aim for 100% documentation on Marts.

---

## Generating the Docs Site

1.  `dbt docs generate`: Compiles metadata into `target/manifest.json` and `target/catalog.json`.
2.  `dbt docs serve`: Hosts a local website to browse docs.

---

## Lineage Graph

Interactive visualization of your project.

- **Impact Analysis**: See what breaks if you change a model.
- **Onboarding**: Helps new joiners understand data flow.
- **Selectors**: Filter the graph (e.g., `+my_model+`).

---

## Exposures

Define downstream consumers (Dashboards, ML Models) in YAML.

```yaml
exposures:
  - name: weekly_revenue_dashboard
    type: dashboard
    owner:
      name: Data Team
    depends_on:
      - ref('fct_orders')
```

- **Why?**: Tells dbt that `fct_orders` is critical because a dashboard depends on it.
- **Status**: Can integrate with dbt Cloud to show dashboard status.

---

## What have we achieved in this session

- Document models in YAML
- Generate docs site (`dbt docs generate`)
- Define an exposure for a dashboard

**Next Session:** Model Governance: Contracts & Versions.
