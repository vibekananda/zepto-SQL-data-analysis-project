# Zepto SQL Data Analytics Project

## Project Overview

This project focuses on analyzing Zepto product and inventory data using **MySQL**. The goal is to explore product categories, clean data, evaluate discounts, identify out-of-stock products, and analyze inventory value and product weight.

The project demonstrates practical SQL skills used in data analytics, including filtering, aggregation, sorting, duplicate detection, data cleaning, and conditional logic.

## Project Objectives

- Explore the dataset and understand its structure.
- Identify missing values and duplicate product names.
- Clean invalid price records and convert prices from paise to rupees.
- Analyze product discounts and pricing.
- Identify high-priced products that are out of stock.
- Estimate inventory value by product category.
- Compare products using price per gram.
- Categorize products based on their weight.
- Calculate total inventory weight by category.

## Dataset

The dataset contains product and inventory information, including the following columns:

| Column | Description |
|---|---|
| `id` | Unique product record identifier |
| `category` | Product category |
| `name` | Product name |
| `mrp` | Maximum Retail Price |
| `discountPercent` | Discount percentage |
| `discountedSellingPrice` | Price after discount |
| `availableQuantity` | Available inventory quantity |
| `outOfStock` | Indicates whether a product is out of stock |
| `weightInGms` | Product weight in grams |
| `quantity` | Product quantity field |

*Note: The `id` column is added during the SQL workflow. The original dataset's exact definitions and units should be verified against its source.*

## Tools and Technologies

- **MySQL** – SQL queries, data cleaning, and analysis
- **MySQL Workbench** – Query execution and database management
- **GitHub** – Project version control and portfolio presentation

## Project Workflow

### 1. Data Exploration

- Count the total number of records.
- Preview sample records.
- Add a unique ID column.
- Check for missing values.
- Identify distinct product categories.
- Compare in-stock and out-of-stock products.
- Identify product names appearing multiple times.

### 2. Data Cleaning

- Identify products with zero MRP or discounted selling price.
- Remove records where MRP equals zero.
- Convert MRP and discounted selling prices from paise to rupees.

**Important:** The SQL script modifies the table directly. Run the price conversion only once on the original paise-denominated values to avoid dividing prices repeatedly. Back up the table before running data-modification queries.

### 3. SQL Data Analysis

The project answers eight business questions:

| No. | Business Question | SQL Concepts Used |
|---|---|---|
| 1 | What are the top 10 products by discount percentage? | `DISTINCT`, `ORDER BY`, `LIMIT` |
| 2 | Which high-MRP products are out of stock? | `WHERE`, `AND`, sorting |
| 3 | What is the estimated inventory value for each category? | `SUM()`, `GROUP BY` |
| 4 | Which products have MRP above ₹500 and discounts below 10%? | Multiple `WHERE` conditions |
| 5 | Which five categories have the highest average discount? | `AVG()`, `GROUP BY`, `LIMIT` |
| 6 | What is the price per gram for products weighing at least 100 grams? | Arithmetic, `ROUND()`, `ORDER BY` |
| 7 | How can products be classified as Low, Medium, or Bulk by weight? | `CASE WHEN` |
| 8 | What is the total inventory weight for each category? | Multiplication, `SUM()`, `GROUP BY` |

## Key Analysis Areas

### Discount Analysis

Identifies products offering the highest discounts and compares average discount percentages across categories.

### Inventory Analysis

Examines stock availability, highlights expensive products that are out of stock, and estimates the value of available inventory.

### Price and Value Analysis

Calculates price per gram to help compare product value across different package sizes.

### Weight Categorization

Uses conditional logic to classify products into three groups:

- **Low:** Weight below 1,000 grams
- **Medium:** Weight from 1,000 grams to below 5,000 grams
- **Bulk:** Weight of 5,000 grams or more

### Inventory Weight Analysis

Calculates the total inventory weight for each category by multiplying product weight by available quantity and aggregating the results.

## Business Value

This project demonstrates how SQL can support retail analytics by helping analysts:

- Compare product discounts and pricing.
- Identify potential inventory availability issues.
- Estimate the value and physical weight of inventory.
- Compare product value based on price per gram.
- Summarize product-level information into category-level metrics.

**Metric clarification:** Estimated inventory value is calculated as discounted selling price multiplied by available quantity. It represents an estimate of the value of available stock, not confirmed sales revenue.

## SQL Concepts Demonstrated

- `SELECT` and `DISTINCT`
- `WHERE`, `AND`, and `OR`
- `ORDER BY` and `LIMIT`
- `GROUP BY` and `HAVING`
- Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
- `CASE WHEN` conditional statements
- Arithmetic operations
- `ROUND()`
- `ALTER TABLE`, `UPDATE`, and `DELETE`
- Null-value and duplicate checks

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download the dataset from its original source.
3. Create a database and import the dataset into a table named `zepto`.
4. Verify the table structure and confirm that the column names match the SQL script.
5. Open `Zepto_SQL_data_analysis.sql` in MySQL Workbench.
6. Execute the exploration queries first.
7. Review the data-cleaning queries and back up the table before modifying data.
8. Run the analysis queries and examine the results.

**Note:** The SQL script assumes the `zepto` table already exists. Database creation and dataset import instructions may need to be adapted to your local setup.

## Repository Structure

```text
Zepto-SQL-Data-Analytics/
│
├── Zepto_SQL_data_analysis.sql
└── README.md
```

## Conclusion

The Zepto SQL Data Analytics Project demonstrates practical SQL techniques for exploring, cleaning, and analyzing retail product and inventory data. It showcases the ability to translate business questions into SQL queries and calculate meaningful inventory and pricing metrics.

This project is part of my Data Analytics portfolio and demonstrates my hands-on experience with MySQL and data-driven problem-solving.
