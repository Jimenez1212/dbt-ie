import argparse
import os

import duckdb


def create_database(db_path="./data/my_database.duckdb"):
    """
    Creates and populates the DuckDB database with data from Parquet files.
    """
    # Connect to DuckDB (creates the file if it doesn't exist)
    conn = duckdb.connect(db_path)

    try:
        # Get all Parquet files in the data directory
        data_dir = "./data"
        if not os.path.exists(data_dir):
            print(f"Data directory '{data_dir}' not found.")
            return

        parquet_files = [f for f in os.listdir(data_dir) if f.endswith(".parquet")]

        if not parquet_files:
            print(f"No Parquet files found in {data_dir}.")
            return

        print(f"Found Parquet files: {parquet_files}")

        # Create tables for each Parquet file
        for parquet_file in parquet_files:
            table_name = os.path.splitext(parquet_file)[0]  # Remove .parquet extension
            parquet_path = os.path.join(data_dir, parquet_file)
            conn.execute(
                f"""
                CREATE TABLE IF NOT EXISTS {table_name} AS
                SELECT * FROM read_parquet('{parquet_path}')
            """
            )
            print(f"Created table: {table_name}")

        print("Database created and populated successfully!")

        # Optional: Show table info
        tables = conn.execute("SHOW TABLES").fetchall()
        print("Tables in database:", [table[0] for table in tables])

    except Exception as e:
        print(f"Error creating database: {e}")

    finally:
        conn.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Create and populate a DuckDB database from Parquet files."
    )
    parser.add_argument(
        "--database",
        "-d",
        default="my_database",
        help="Name of the database file (without .duckdb extension). Default: my_database",
    )

    args = parser.parse_args()
    db_path = f"{args.database}.duckdb"

    create_database(db_path)
