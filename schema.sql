-- Database Schema for CampusTrack
CREATE DATABASE IF NOT EXISTS campustrack_db;
USE campustrack_db;

-- 1. Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Items Table
CREATE TABLE IF NOT EXISTS items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('lost', 'found', 'claimed') NOT NULL,
    title VARCHAR(150) NOT NULL,
    location VARCHAR(150) NOT NULL,
    contact VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    image_base64 LONGTEXT,
    reported_by VARCHAR(100) NOT NULL,
    reporter_email VARCHAR(120) NOT NULL,
    status_date VARCHAR(50) DEFAULT 'Just now',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Messages Table (Campus Community Chat)
CREATE TABLE IF NOT EXISTS messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender VARCHAR(100) NOT NULL,
    text TEXT NOT NULL,
    time_sent VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Starter Data
INSERT INTO users (name, email, password) VALUES 
('Faizal Hamid', 'faizal@mhssce.ac.in', 'password123'),
('Aayush Patil', 'aayush@mhssce.ac.in', 'password123');

INSERT INTO items (type, title, location, contact, description, reported_by, reporter_email, status_date) VALUES 
('lost', 'Casio Scientific Calculator fx-991EX', '4th Floor Computer Lab 3', '+91 9820012345', 'Black body with transparent cover left on desk beside PC-14.', 'Faizal Hamid', 'faizal@mhssce.ac.in', 'Today, 10:30 AM'),
('found', 'Titan Classic Leather Watch', 'Central Library 2nd Floor', '+91 9833012345', 'Brown leather strap, silver bezel found on reading table #4.', 'Admin Staff', 'admin@mhssce.ac.in', 'Yesterday');

INSERT INTO messages (sender, text, time_sent) VALUES
('Notice Board', 'System initialized on Apache Tomcat with MySQL JDBC.', '09:00 AM'),
('Faizal Hamid', 'Did anyone find a Casio calculator in Lab 3?', '10:35 AM');
