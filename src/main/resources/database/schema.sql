-- Timetable Management System Database Schema
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

-- 2. Subjects Table
CREATE TABLE IF NOT EXISTS subjects (
    subject_code VARCHAR(20) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL
);

-- 3. Teachers Table
CREATE TABLE IF NOT EXISTS teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL,
    teacher_email VARCHAR(100) NOT NULL,
    subject_id VARCHAR(20),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_code) ON DELETE SET NULL
);

-- 4. Timetable Table
CREATE TABLE IF NOT EXISTS timetable (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id VARCHAR(20) NOT NULL,
    teacher_id INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    class_day VARCHAR(20) NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    section VARCHAR(100),
    block VARCHAR(100),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_code) ON DELETE CASCADE,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id) ON DELETE CASCADE
);

-- 5. Announcements Table
CREATE TABLE IF NOT EXISTS announcements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Initial Admin Account (optional)
-- INSERT INTO users (name, email, password, role) VALUES ('Admin', 'admin@school.com', 'admin123', 'Admin');
