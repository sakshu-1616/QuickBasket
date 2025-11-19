// Simple alert when page loads
window.onload = function () {
    console.log("QuickBasket loaded");
};

// Confirm before placing order
function confirmOrder() {
    return confirm("Do you want to place this order?");
}

// Example: show added to cart alert
function addedToCart() {
    alert("Item added to cart!");
}

/* DROP DATABASE IF EXISTS quickbasket;
CREATE DATABASE quickbasket;
USE quickbasket;

-- USERS TABLE
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

-- ADMINS TABLE (SEPARATE)
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

-- FOOD ITEMS
CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    price DOUBLE
);

-- ORDERS
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(100),
    food_id INT,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- SAMPLE USERS
INSERT INTO users(name,email,password) VALUES
('Test User','user@quick.com','user123'),
('Demo User','demo@quick.com','demo123');

-- SAMPLE ADMINS
INSERT INTO admins(name,email,password) VALUES
('Admin','admin@quick.com','admin123');

-- SAMPLE FOOD
INSERT INTO food_items(name,price) VALUES
('Burger',120),
('Pizza',250),
('Pasta',150),
('Fries',60),
('Sandwich',90);

     */