# data exploration

# count of rows
select count(*) from zepto;

# sample data
SELECT * FROM zepto
LIMIT 10;

# add a column
alter table zepto
add column id INT auto_increment primary key first;

# sample data
select * from zepto limit 5;

# null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

# different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

# products in stock vs out of stock
SELECT outOfStock, COUNT(id)
FROM zepto
GROUP BY outOfStock;

# product name present multiple time
select name,count(id) as number_of_duplicate
from zepto
group by name
having count(id) > 1
order by number_of_duplicate desc;

# DATA CLEANING

# products with price = 0
select * from zepto
where mrp = 0 or discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 0;

delete from zepto
where mrp = 0;

# convert paise to rupees
update zepto
set mrp = mrp/100.0,
   discountedSellingPrice = discountedSellingPrice/100.0;
   
select * from zepto;

# DATA ANALYSIS

# Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name, discountPercent
from zepto
order by discountPercent desc
limit 10;

# Q2.What are the Products with High MRP but Out of Stock
select distinct name, mrp, outOfStock
from zepto
where outOfStock = 'true' and mrp > 300
order by mrp desc;

# Q3.Calculate Estimated Revenue for each category
select Category,
sum(discountedSellingPrice * availableQuantity) as Estimated_Revenue
from zepto
group by Category
order by Estimated_Revenue desc;

# Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name,mrp,discountPercent
from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

# Q5. Identify the top 5 categories offering the highest average discount percentage.
select Category, avg(discountPercent)
from zepto
group by Category
order by avg(discountPercent) desc
limit 5;

# Q6. Find the price per gram for products above 100g and sort by best value.
select name,
round(discountedSellingPrice/weightInGms,2) as RS_of_per_gram
from zepto
where weightInGms >= 100
order by RS_of_per_gram;

# Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then 'Low'
	 when weightInGms < 5000 then 'Medium'
     else 'Bulk'
     end as weight_category
from zepto;

# Q8.What is the Total Inventory Weight Per Category 
select Category,
sum(weightInGms*availableQuantity) as Inventory_Weight
from zepto
group by Category
order by Inventory_Weight desc;