DROP DATABASE IF EXISTS quickbasket;
CREATE DATABASE quickbasket;
USE quickbasket;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);
INSERT INTO users (name, email, password) VALUES
('Tushar', 'tushar@mail', '123'),
('Sakshi', 'sakshi@mail', '123'),
('Demo User', 'demo@quick.com', 'demo123');

DROP TABLE IF EXISTS admins;
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);
INSERT INTO admins (name, email, password) VALUES
('Admin', 'admin@quick.com', 'admin123');

DROP TABLE IF EXISTS food_items;
CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    price DOUBLE
);
INSERT INTO food_items (name, price) VALUES
('Burger', 120),
('Cheese Pizza', 250),
('French Fries', 60),
('Pasta', 150),
('Sandwich', 90),
('Cold Coffee', 80),
('Chicken Roll', 140),
('Veg Thali', 180);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(100),
    food_id INT,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
