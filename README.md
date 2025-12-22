# dbt-ie Repository

## Overview

This repository contains the necessary files and configurations for working with dbt (Data Build Tool) projects using Polars, dbt-core, and DuckDB. The following instructions will guide you on how to set up and use this repository locally using `uv` as the package manager.

---

## Prerequisites

- Python 3.10 or higher
- `uv` package manager (install via `pip install uv`)

---

## Setup Instructions

### 1. Fork and Clone the Repository

To work on this project and save your changes, you must create your own copy (fork) of the repository.

1.  **Navigate to GitHub**: Go to the repository page at `https://github.com/dgarhdez/dbt-ie`.
2.  **Fork**: Click the **Fork** button in the top-right corner of the page.
    *   If prompted, select your personal account as the destination.
    *   This creates a copy of the code under your own GitHub username (e.g., `https://github.com/YOUR_USERNAME/dbt-ie`).
3.  **Clone Your Fork**: Clone **your** forked repository to your local machine. Do not clone the original `dgarhdez` repository directly.

    ```bash
    # Replace YOUR_USERNAME with your actual GitHub username
    git clone https://github.com/YOUR_USERNAME/dbt-ie.git
    cd dbt-ie
    ```

### 2. Create a Virtual Environment with `uv`

Use `uv` to create a virtual environment named `dbt_mbads`:

```bash
uv venv dbt_mbads
```

Activate the environment:

```bash
source dbt_mbads/bin/activate
```

### 3. Install Dependencies with `uv`

Let's install from the `requirements.txt` file to ensure all dependencies are met:

```bash
uv pip install -r requirements.txt
```

This will install, among others:

- **Polars**: A fast DataFrame library for data manipulation.
- **dbt-core**: The core dbt library for data transformation.
- **DuckDB**: An in-process SQL OLAP database for analytics.

### 4. Configure dbt

Ensure you have a `profiles.yml` file in the `.dbt` directory. This file should contain your dbt configurations for DuckDB. Example:

```yaml
default:
  outputs:
    dev:
      type: duckdb
      path: my_database.duckdb
      schema: analytics
  target: dev
```

### 5. Load Data into DuckDB

The `data` folder contains sample Parquet files and a Python script to create and populate the DuckDB database.

Run the script to create the database:

```bash
python create_db.py
```

This will create `my_database.duckdb` in the project root and load the data from the Parquet files into tables.

### 6. Run dbt Commands

You can now use dbt commands to build and test your project. For example:

```bash
dbt run
dbt test
dbt debug  # To check connection
```

### 7. VSCode dbt Power User Extension

To enhance your dbt development experience, consider installing the [VSCode dbt Power User](https://marketplace.visualstudio.com/items?itemName=calogica.vscode-dbt-power-user) extension. This extension provides features like syntax highlighting, autocompletion, and snippets for dbt projects.

---

## Notes

- Always ensure your virtual environment is activated before running any commands.
- If you encounter issues with `uv`, refer to its documentation or run `uv --help` for more information.
- For more advanced usage, consider using `uv` with `pyproject.toml` for project management.

---

## Contributing

Feel free to submit issues or pull requests to improve this repository.

---

## License

This project is licensed under the MIT License.
