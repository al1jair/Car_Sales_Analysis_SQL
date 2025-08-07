CREATE TABLE car_sales (
	car_id varchar(100),
	date date,
	customer_name varchar(50),
	gender varchar(20),
	annual_income int,
	dealer_name varchar(100),
	company varchar(50),
	model varchar(50),
	engine varchar(100),
	transmission varchar(20),
	color varchar(20),
	price int,
	dealer_no varchar(50),
	body_style varchar(50),
	phone int,
	dealer_region varchar(50)
);


-- View everything

SELECT *
FROM car_sales;


-- Checks for duplicates (none)

SELECT car_id, date, customer_name, gender, annual_income, dealer_name, company, model, engine, transmission, color, price, dealer_no, body_style, phone, dealer_region, COUNT(*) 
FROM car_sales
GROUP BY car_id, date, customer_name, gender, annual_income, dealer_name, company, model, engine, transmission, color, price, dealer_no, body_style, phone, dealer_region
HAVING COUNT(*) > 1;


-- Checks for nulls (none)
 
SELECT car_id
FROM car_sales
WHERE car_id IS NULL; 

SELECT customer_name
FROM car_sales
WHERE customer_name IS NULL; 

SELECT gender
FROM car_sales
WHERE gender IS NULL; 

SELECT annual_income
FROM car_sales
WHERE annual_income IS NULL; 

SELECT dealer_name
FROM car_sales
WHERE dealer_name IS NULL; 

SELECT company
FROM car_sales
WHERE company IS NULL; 

SELECT model
FROM car_sales
WHERE model IS NULL; 

SELECT engine
FROM car_sales
WHERE engine IS NULL; 

SELECT transmission
FROM car_sales
WHERE transmission IS NULL; 

SELECT color
FROM car_sales
WHERE color IS NULL;

SELECT price
FROM car_sales
WHERE price IS NULL;

SELECT dealer_no
FROM car_sales
WHERE dealer_no IS NULL;

SELECT body_style
FROM car_sales
WHERE body_style IS NULL;

SELECT phone
FROM car_sales
WHERE phone IS NULL;

SELECT dealer_region
FROM car_sales
WHERE dealer_region IS NULL;


-- Begin data exploration

SELECT *
FROM car_sales;

-- How many cars were sold by each dealer?

SELECT dealer_name, COUNT(*) as cars_sold
FROM car_sales
GROUP BY dealer_name
ORDER BY cars_sold DESC;


-- Which car brand sold the most?

SELECT company, COUNT(*) as top_brands_sold
FROM car_sales
GROUP BY company
ORDER BY top_brands_sold DESC;


-- Which car sold the least? 

SELECT company, COUNT(*) as top_brands_sold
FROM car_sales
GROUP BY company
ORDER BY top_brands_sold ASC;

SELECT *
FROM car_sales;


-- How many cars were sold each month?

SELECT TO_CHAR(date, 'Month') AS month, COUNT(*) AS cars_sold
FROM car_sales
GROUP BY month, EXTRACT(MONTH FROM date)
ORDER BY EXTRACT(MONTH FROM date);


-- What is the total revenue per dealer region?

SELECT dealer_region, SUM(price) as total_revenue
FROM car_sales
GROUP BY dealer_region
ORDER BY total_revenue DESC;


-- Do customers with higher incomes prefer certain car companies?

SELECT company, annual_income 
FROM car_sales
WHERE annual_income > 150000
ORDER BY annual_income DESC
LIMIT 5;

SELECT company, annual_income 
FROM car_sales
WHERE annual_income < 50000
ORDER BY annual_income DESC
LIMIT 5;


-- Which gender spends more on average per car purchase?

SELECT gender, AVG(price) AS average_price
FROM car_sales
GROUP BY gender;


-- Which transmission type is more popular?

SELECT transmission, COUNT(*) AS transmission_count
FROM car_sales 
GROUP BY transmission
ORDER BY transmission_count DESC;


-- What’s the most popular car color?

SELECT *
FROM car_sales;

SELECT color, COUNT(*) AS color_count
FROM car_sales
GROUP BY color
ORDER BY color_count DESC;


-- What are the top 5 most sold car models?

SELECT *
FROM car_sales;

SELECT company, model, body_style, COUNT(*) AS most_sold_models
FROM car_sales
GROUP BY company, model, body_style
ORDER BY most_sold_models DESC
LIMIT 5;


-- Which month had the highest car sales?

SELECT *
FROM car_sales;

SELECT TO_CHAR(date, 'month') AS month, COUNT(*) AS total_sales
FROM car_sales
GROUP BY month
ORDER BY total_sales DESC;


-- Are certain regions selling more expensive cars?

SELECT dealer_region, price, COUNT(*) AS expensive_cars
FROM car_sales
WHERE price >= 50000
GROUP BY dealer_region, price
ORDER BY expensive_cars DESC;


