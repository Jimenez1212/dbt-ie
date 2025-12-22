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
# Session 14: Deployment & CI/CD

---

## Agenda

- Environments: Dev vs. Prod
- CI/CD Workflows
- Job Scheduling
- Production Failure Scenarios
- Q&A

---

## Environments: Dev vs. Prod

- **Dev**:
  - Schema: `dbt_dgarcia`
  - Data: Sample or Full (depending on size).
  - Trigger: Manual (`dbt run`).
- **Prod**:
  - Schema: `analytics`
  - Data: Full.
  - Trigger: Scheduled (Airflow, dbt Cloud, GitHub Actions).

---

## CI/CD Workflows

**Continuous Integration (CI)**:
- Trigger: Pull Request.
- Action: `dbt build --select state:modified+`.
- Goal: Verify changes don't break the build.

**Continuous Deployment (CD)**:
- Trigger: Merge to `main`.
- Action: Deploy to Production (or update artifacts).

---

## Job Scheduling

Automating the run.

- **Orchestrators**: Airflow, Dagster, Prefect.
- **dbt Cloud**: Built-in scheduler.
- **Cron**: Simple time-based trigger.

**Key Job**: "Daily Build" (Runs everything, tests everything).

---

## Production Failure Scenarios

- **Bad Data**: Source data is missing or malformed. (Catch with Source Freshness/Tests).
- **Bad Logic**: A change broke a downstream model. (Catch with CI).
- **Infrastructure**: Database is down. (Retry).

---

## What have we achieved in this session

- Simulate a CI/CD pipeline run
- Configure a deployment job
- Discuss production failure scenarios

**Next Session:** Certification Review & Best Practices.
