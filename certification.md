# dbt Analytics Engineering Certification Exam Guide

## What's covered in the exam?

### Developing dbt models
- Identifying and verifying any raw object dependencies
- Understanding core dbt materializations
- Conceptualizing modularity and how to incorporate DRY principles
- Converting business logic into performant SQL queries
- Using commands such as `run`, `test`, `docs` and `seed`
- Creating a logical flow of models and building clean DAGs
- Defining configurations in `dbt_project.yml`
- Configuring sources in dbt
- Using dbt Packages
- Utilizing git functionality within the development lifecycle
- Creating Python Models
- Providing access to users to models with the `grants` config

### Understanding dbt models governance
- Adding contracts to models to ensure the shape of models
- Creating different versions of our models and deprecating the old ones
- Configuring Model Access

### Debugging data modeling errors
- Understanding logged error messages
- Troubleshooting using compiled code
- Troubleshooting `.yml` compilation errors
- Distinguishing between dbt core or data platform error responses
- Developing and implementing a fix and testing it prior to merging

### Managing data pipelines
- Troubleshooting and managing failure points in the DAG
- Using `dbt clone`
- Troubleshooting errors from integrated tools

### Implementing dbt tests
- Using generic, singular, custom, and custom generic tests on a wide variety of models and sources
- Testing assumptions for dbt models and sources
- Implementing various testing steps in the workflow

### Creating and Maintaining dbt documentation
- Updating dbt docs
- Implementing source, table, and column descriptions in `.yml` files
- Using macros to show model and data lineage on the DAG

### Implementing and Maintaining External Dependencies
- Implementing dbt exposures
- Implementing source freshness

### Leveraging the dbt state
- Understanding state
- Using `dbt retry`
- Combining state and result selectors
