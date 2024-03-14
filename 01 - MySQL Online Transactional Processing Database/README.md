# MySQL Online Transactional Processing Database 

> The company needs to design a data platform with MySQL serving as the OLTP database for storing transactional data.

## Objectives

In this assignment you will:

- design the schema for OLTP database.
- load data into OLTP database.
- automate admin tasks.

## Database Schema 

![Data schema](sampledata.png)

Based on the sample data given, the schema will contain the following columns: 
- `product_id`
- `customer_id`
- `price`
- `quantity`
- `timestamp`

## 1. Create the Database 

We Will create a database called `sales` using the following SQL statement:

```sql
CREATE DATABASE sales;
```

Next, we will create a table called `sales_data` using the following SQL statement: 

```sql 
CREATE TABLE sales_data(
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    price INT NOT NULL, 
    quantity INT NOT NULL,
    timestamp timestamp NOT NULL
)
```
- We chose the data types based on the sample of the data

## 2. Load the Data

First we will download the data and import it into `sales_data` using phpMyAdmin. 

`wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0321EN-SkillsNetwork/oltp/oltpdata.csv`

>  Import has been successfully finished, 2605 queries executed. (oltpdata.csv)

Next, We will use MySQL CLI to list the tables in the database

```sql 
USE sales;
```
```sql
SHOW tables;
```

> ```
> +-----------------+
> | Tables_in_sales |
> +-----------------+
> | sales_data      |
> +-----------------+
> 1 row in set (0.01 sec)
> ```

Next, We will write a query to count the number of the records in the `sales_data` table.

```sql
SELECT COUNT(*) AS number_of_records
FROM sales_data
```
> ```
> +-------------------+
> | number_of_records |
> +-------------------+
> |        2605       |
> +-------------------+
> 1 row in set (0.00 sec)
> ```

## 3. Set up Admin tasks

First we need to create an index named `ts` on the timestamp field.

```sql
CREATE INDEX ts on sales_data(timestamp);
```
> ```
> Query OK, 0 rows affected (0.06 sec)
> Records: 0  Duplicates: 0  Warnings: 0
> ```

Next, we will list the indexes from `sales_data` to confirm the creation of the `ts` index.

```sql
SHOW INDEX FROM sales_data;
```
> ```
> +------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
> | Table      | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
> +------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
> | sales_data |          1 | ts       |            1 | timestamp   | A         |        2605 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
> +------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
> 1 row in set (0.01 sec)
> ```

We can see that the timestamp index has been created successfully.

Next, we need to create a bash script named `datadump.sh` that exports all the rows in the `sales_data` table to a file named `sales_data.sql`

```console
touch datadump.sh | nano datadump.sh
```

```bash 
#!/bin/bash

DB_USER="root"
DB_PASSWORD="root"
DB_NAME="sales"
DB_TABLE="sales_data"

mysqldump -u"$DB_USER" -p"DB_PASSWORD" "$DB_NAME" "$DB_TABLE" > sales_data.sql 
```

Next, Update the permissions so the script can be executed.

```console 
sudo chmod u+x datadump.sql
```

To run the script
```console
sudo ./datadump.sh
```

