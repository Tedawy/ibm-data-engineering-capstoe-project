# IBM Data Engineering Capstone Project

In IBM Data Engineering Capstone Project, In this initiative, participants step into the shoes of a Junior Data Engineer at SoftCart, a fictional online e-Commerce company. This project offers a real-world scenario requiring the application of various data engineering techniques and technologies to solve business-related data challenges.

![Data Platform Architecture](data-platform-architecture.png)

## Project Goals

The aim of this project is to:

- Exhibit foundational data engineering skills appropriate for an entry-level role.
- Construct and deploy key components of the data engineering lifecycle, including data storage systems.
- Demonstrate practical knowledge of managing data across relational and NoSQL databases, data warehouses, and big data processing systems.
- Utilize Linux shell scripting, SQL, and Python to address data engineering tasks.

## Project Synopsis

- The project focuses on SoftCart's operations, primarily conducted through its website, accessible via multiple devices.
- Product information is stored within a MongoDB database, while transactional data, including sales and inventory details, resides in a MySQL database.
- These databases fuel SoftCart's web operations.
- Data from MongoDB and MySQL is periodically consolidated into a PostgreSQL-based staging data warehouse.
- The cloud-hosted IBM DB2 server functions as the production data warehouse.
- Operational dashboards are crafted using IBM Cognos Analytics, with the BI team drawing data from the IBM DB2 server.
- SoftCart leverages a Hadoop cluster for big data analytics, employing Spark for data analysis.
- Data movement across systems is facilitated by ETL pipelines, orchestrated via Apache Airflow.

## Tasks Overview

### Task 1: MySQL for Transactional Processing

Design and implement a MySQL database schema for storing sales data, ensuring efficient data retrieval by creating an index on the timestamp column. Additionally, develop a bash script for exporting this data into a SQL file.

### Task 2: MongoDB for Catalog Data

Establish a MongoDB database named `catalog` for product data storage, importing information from `catalog.json` into an `electronics` collection. Perform test queries and export specific fields to `electronics.csv`.

### Task 3: PostgreSQL as Staging Data Warehouse

Develop a staging data warehouse schema using PostgreSQL to aggregate sales and catalog data. Utilize pgAdmin for ERD design, focusing on a schema that supports comprehensive sales reporting.

### Task 4: IBM DB2 for Production Data Warehouse

Migrate the refined staging schema to IBM DB2, loading sample datasets for analysis. Craft aggregation queries to populate a Materialized Query Table, aiding in report generation.

### Task 5: Data Synchronization Scripts

Script the synchronization process between staging and production data warehouses, focusing on regular data updates to the DB2 instance.

### Task 6: Log File Analysis with Apache Airflow

Create an Airflow DAG to process web server logs, extracting, transforming, and loading pertinent information for analysis.

### Task 7: Big Data Analytics with Apache Spark

Analyze e-commerce platform search term data using PySpark and JupyterLab, applying a sales forecasting model to predict 2023 sales figures.

## Tools and Technologies:

- **Transactional Database**: MySQL
- **Document Store**: MongoDB
- **Staging Data Warehouse**: PostgreSQL
- **Production Data Warehouse**: IBM DB2 (Cloud)
- **Big Data Storage**: Hadoop
- **Data Analysis**: Spark
- **Business Intelligence**: IBM Cognos Analytics
- **Data Orchestration**: Apache Airflow

## About the Project

This capstone project is a component of the IBM Data Engineering Professional Certificate, delivered through the IBM Skills Network on Coursera.

For further information, visit: [IBM Data Engineering Capstone Project on Coursera](https://www.coursera.org/learn/data-enginering-capstone-project)
