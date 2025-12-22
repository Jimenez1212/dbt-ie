# Analytics Engineering with dbt - Course Syllabus

## Course Overview

This is a comprehensive 15-session course designed to take students from SQL basics to advanced analytics engineering with dbt. The course covers end-to-end data pipeline development, from raw data ingestion to interactive dashboards, specifically tailored to cover all domains of the dbt Analytics Engineering Certification.

## Learning Objectives

- Master dbt fundamentals and project structure
- Build robust data transformation pipelines
- Implement testing and documentation best practices
- Work with modern data stack tools (DuckDB)
- Apply analytics engineering principles to real-world scenarios
- Prepare for the dbt Analytics Engineering Certification

---

## Session 1: Intro to Analytics Engineering, Setup & Project Structure

### Learning Objectives

- What is Analytics Engineering?
- Introduction to DuckDB: What it is and why we use it (Serverless OLAP)
- Git Workflow: How to fork and manage the course repository
- Setting up the development environment
- Defining configurations in `dbt_project.yml`
- Project folder structure (models, seeds, tests, analyses, macros)
- Understanding the compilation process

### Activities

- Fork the course repository and clone to local machine
- Install dependencies and configure the dbt profile
- Connect to the DuckDB database
- Run the first `dbt run` to validate the setup
- Explore the dbt project configuration
- Configure model materializations at directory and file levels
- Inspect `target/compiled` and `target/run`

---

## Session 2: VSCode dbt Power User & Staging Models

### Learning Objectives

- Introduction to VSCode dbt Power User extension
- Key Features: Autocomplete, Navigation, Lineage, Query Preview
- Exploring Staging Models

### Activities

- Install and configure the VSCode dbt Power User extension
- Navigate the project using "Go to Definition"
- Visualize the lineage of our staging models
- Run `stg_customers` and `stg_orders` interactively to inspect the data

---

## Session 3: Sources, Seeds & Dependencies

### Learning Objectives

- Configuring sources in dbt
- Identifying and verifying raw object dependencies
- Working with Seeds (`dbt seed`)
- Implementing source freshness

### Activities

- Define sources in `sources.yml`
- Load static data with seeds
- Run `dbt source freshness` and debug failures

---

## Session 4: Materializations & Grants

### Learning Objectives

- Understanding core dbt materializations (view, table, ephemeral)
- Providing access to users with the `grants` config
- Trade-offs between materialization types

### Activities

- Configure different materializations for models
- Implement grants for specific roles
- Analyze build logs for different materializations

---

## Session 5: Modeling I: Dimensional Modeling & Project Structure

### Learning Objectives

- Understanding Dimensional Modeling (Star Schema: Facts & Dimensions)
- The dbt Layered Architecture: Staging, Intermediate, Marts
- Conceptualizing modularity and incorporating DRY principles
- Refactoring legacy SQL into structured dbt models

### Activities

- Design a Star Schema for the ecommerce dataset
- Build Intermediate models to join Staging models
- Create Final Marts (Fact Orders, Dim Customers)
- Visualize the clean lineage from Source to Mart

---

## Session 6: Modeling II: DAGs & Python Models

### Learning Objectives

- Creating a logical flow of models and building clean DAGs
- Creating Python Models in dbt
- Handling complex dependencies

### Activities

- Visualize the DAG
- Create a dbt Python model for non-SQL transformations
- Refactor a messy DAG into a clean lineage

---

## Session 7: Jinja, Macros & Packages

### Learning Objectives

- Using dbt Packages (dbt-utils, codegen)
- Jinja templating fundamentals
- Creating reusable Macros

### Activities

- Install `dbt-utils` package
- Create a custom macro
- Use package macros for surrogate keys and date spines

---

## Session 8: Testing in dbt

### Learning Objectives

- Implementing dbt tests (generic, singular)
- Testing assumptions for dbt models and sources
- Implementing various testing steps in the workflow
- Custom generic tests

### Activities

- Apply generic tests (unique, not_null)
- Write singular SQL tests
- Create a custom generic test

---

## Session 9: Documentation, Lineage & Exposures

### Learning Objectives

- Creating and maintaining dbt documentation
- Implementing source, table, and column descriptions
- Using macros to show lineage
- Implementing dbt exposures

### Activities

- Document models in YAML
- Generate docs site (`dbt docs generate`)
- Define an exposure for a dashboard

---

## Session 10: Model Governance: Contracts & Versions

### Learning Objectives

- Understanding dbt models governance
- Adding contracts to models to ensure shape
- Creating different versions of models and deprecating old ones
- Configuring Model Access (Public/Private/Protected)

### Activities

- Add a contract to a model
- Version a model and define a deprecation date
- Restrict access to a model

---

## Session 11: Advanced Materializations: Incremental & Snapshots

### Learning Objectives

- Deep dive into Incremental models
- Leveraging Snapshots for SCD Type 2
- Configuring incremental strategies

### Activities

- Convert a large table model to incremental
- Create a snapshot for a mutable source
- Test incremental logic

---

## Session 12: Debugging & Troubleshooting

### Learning Objectives

- Debugging data modeling errors
- Understanding logged error messages
- Troubleshooting using compiled code
- Troubleshooting `.yml` compilation errors
- Distinguishing between dbt core and platform errors

### Activities

- Debug intentional errors in SQL and YAML
- Analyze `dbt.log`
- Fix a broken model using compiled SQL

---

## Session 13: State & Pipeline Management

### Learning Objectives

- Leveraging the dbt state (state, retry, selectors)
- Managing data pipelines
- Using `dbt clone`
- Troubleshooting and managing failure points in the DAG

### Activities

- Run dbt with `--state` and `state:modified`
- Use `dbt retry` after a failure
- Clone a project subset

---

## Session 14: Deployment & CI/CD

### Learning Objectives

- Deployment environments (Dev vs Prod)
- Troubleshooting errors from integrated tools
- CI/CD workflows for dbt
- Job scheduling

### Activities

- Simulate a CI/CD pipeline run
- Configure a deployment job
- Discuss production failure scenarios

---

## Session 15: Certification Review & Best Practices

### Learning Objectives

- Comprehensive review of all certification domains
- Developing and implementing a fix and testing it prior to merging
- Final Q&A and Exam Strategy

### Activities

- Mock exam questions
- Review key concepts: Materializations, Tests, Governance, State
- Final project walkthrough

---

## Prerequisites

- Basic SQL knowledge
- Python programming fundamentals
- Understanding of data concepts
- Git version control familiarity

## Tools & Technologies

- dbt Core/Cloud - Data transformation tool
- DuckDB - Analytical database
- Git/GitHub - Version control
- VS Code - Development environment

## Assessment Methods

- Hands-on coding exercises
- Code reviews and feedback
- Practical implementation validation
