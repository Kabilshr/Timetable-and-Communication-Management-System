-- Timetable Management System Database Schema (Realigned)
-- Run this in phpMyAdmin or your MySQL client

CREATE DATABASE IF NOT EXISTS timetable_db;
USE timetable_db;

-- 1. Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Teacher', 'Student') NOT NULL
);

-- 2. Modules Table (Renamed from subjects)
CREATE TABLE IF NOT EXISTS modules (
    module_code VARCHAR(20) PRIMARY KEY,
    module_title VARCHAR(100) NOT NULL
);

-- 3. Teachers Table (Linked to users and modules)
CREATE TABLE IF NOT EXISTS teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    module_code VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (module_code) REFERENCES modules(module_code) ON DELETE SET NULL
);

-- 4. Timetable Table (Linked to modules and teachers)
CREATE TABLE IF NOT EXISTS timetable (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    module_code VARCHAR(20) NOT NULL,
    lecturer_id INT NOT NULL,
    year VARCHAR(20) NOT NULL,
    section VARCHAR(100) NOT NULL,
    class_type VARCHAR(50) NOT NULL,
    day VARCHAR(20) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    block VARCHAR(100),
    room VARCHAR(100),
    FOREIGN KEY (module_code) REFERENCES modules(module_code) ON DELETE CASCADE,
    FOREIGN KEY (lecturer_id) REFERENCES teachers(teacher_id) ON DELETE CASCADE
);

-- 5. Announcements Table
CREATE TABLE IF NOT EXISTS announcements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Initial Admin Account
INSERT IGNORE INTO users (name, email, password, role) VALUES ('Admin', 'admin@school.com', 'admin123', 'Admin');
