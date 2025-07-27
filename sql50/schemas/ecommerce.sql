-- E-commerce Database Schema for SQL Practice
-- Compatible with MySQL, PostgreSQL, SQL Server, SQLite

-- Users/Customers Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE,
    country VARCHAR(30)
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Order Items Table
CREATE TABLE OrderItems (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample Data for Users
INSERT INTO Users VALUES
(1, 'Alice Johnson', 'alice@email.com', '2023-01-15', 'USA'),
(2, 'Bob Smith', 'bob@email.com', '2023-02-20', 'Canada'),
(3, 'Charlie Brown', 'charlie@email.com', '2023-03-10', 'USA'),
(4, 'Diana Wilson', 'diana@email.com', '2023-04-05', 'UK'),
(5, 'Eve Davis', 'eve@email.com', '2023-05-12', 'Australia'),
(6, 'Frank Miller', 'frank@email.com', '2023-06-18', 'Germany'),
(7, 'Grace Lee', 'grace@email.com', '2023-07-22', 'South Korea'),
(8, 'Henry Taylor', 'henry@email.com', '2023-08-14', 'USA'),
(9, 'Ivy Chen', 'ivy@email.com', '2023-09-30', 'China'),
(10, 'Jack Wilson', 'jack@email.com', '2023-10-25', 'Canada');

-- Sample Data for Products
INSERT INTO Products VALUES
(1, 'Wireless Headphones', 'Electronics', 99.99, 150),
(2, 'Coffee Maker', 'Home & Kitchen', 79.99, 75),
(3, 'Running Shoes', 'Sports', 129.99, 200),
(4, 'Laptop Stand', 'Electronics', 49.99, 120),
(5, 'Yoga Mat', 'Sports', 29.99, 300),
(6, 'Bluetooth Speaker', 'Electronics', 59.99, 180),
(7, 'Water Bottle', 'Sports', 19.99, 400),
(8, 'Desk Lamp', 'Home & Kitchen', 39.99, 90),
(9, 'Phone Case', 'Electronics', 24.99, 500),
(10, 'Cookbook', 'Books', 34.99, 60);

-- Sample Data for Orders
INSERT INTO Orders VALUES
(1, 1, '2023-11-01', 179.98, 'completed'),
(2, 2, '2023-11-02', 79.99, 'completed'),
(3, 3, '2023-11-03', 159.98, 'completed'),
(4, 1, '2023-11-04', 49.99, 'completed'),
(5, 4, '2023-11-05', 89.98, 'pending'),
(6, 5, '2023-11-06', 199.97, 'completed'),
(7, 2, '2023-11-07', 129.99, 'completed'),
(8, 6, '2023-11-08', 134.98, 'completed'),
(9, 3, '2023-11-09', 24.99, 'cancelled'),
(10, 7, '2023-11-10', 149.98, 'completed');

-- Sample Data for Order Items
INSERT INTO OrderItems VALUES
(1, 1, 1, 99.99),
(1, 3, 1, 79.99),
(2, 2, 1, 79.99),
(3, 3, 1, 129.99),
(3, 5, 1, 29.99),
(4, 4, 1, 49.99),
(5, 6, 1, 59.99),
(5, 5, 1, 29.99),
(6, 1, 1, 99.99),
(6, 3, 1, 129.99),
(6, 7, 1, 19.99),
(7, 3, 1, 129.99),
(8, 6, 1, 59.99),
(8, 8, 1, 39.99),
(8, 9, 1, 24.99),
(9, 9, 1, 24.99),
(10, 1, 1, 99.99),
(10, 4, 1, 49.99);

-- Practice Queries for SQL 50 Problems:

-- Basic Queries:
-- 1. Find all users from USA
-- 2. List products with price > $50
-- 3. Show unique product categories

-- Joins:
-- 4. Get order details with customer names
-- 5. Show products never ordered
-- 6. Find customers with no orders

-- Aggregation:
-- 7. Calculate total sales per country
-- 8. Find average order value by month
-- 9. Count orders per status

-- Window Functions:
-- 10. Rank customers by total spent
-- 11. Calculate running total of daily sales
-- 12. Find top 3 products by sales

-- Advanced:
-- 13. Calculate customer lifetime value
-- 14. Find customers who bought in consecutive months
-- 15. Identify top-selling product combinations