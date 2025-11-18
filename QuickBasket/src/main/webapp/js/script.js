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

/*   CREATE DATABASE IF NOT EXISTS quickbasket;
USE quickbasket;

-- users table with role (user/admin)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    role VARCHAR(20) DEFAULT 'user'
);

-- food items
CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    price DOUBLE
);

-- orders (one row per food item ordered)
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    food_id INT,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- sample user
INSERT IGNORE INTO users(name,email,password,role) VALUES
('Test User','user@quick.com','user123','user'),
('Admin','admin@quick.com','admin123','admin');

-- sample foods
INSERT IGNORE INTO food_items(name,price) VALUES
('Burger',120),
('Pizza',250),
('Pasta',150),
('French Fries',60),
('Sandwich',80);
     */