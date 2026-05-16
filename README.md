# Timetable and Communication Management System

A robust, Jakarta EE-based web application designed to streamline academic scheduling and institutional communication. This system implements a strict **MVC (Model-View-Controller) architecture** and features responsive dashboards for Admins, Teachers, and Students.

---

## 🚀 Overview

The Timetable Management System is a centralized platform for academic institutions to manage class schedules efficiently. It eliminates the complexities of manual scheduling by providing real-time updates, conflict-free timetable generation, and role-based access control.

### Key Capabilities:
- **Admin:** Full CRUD control over users, modules, teachers, and schedules.
- **Teacher:** View personal timetables, collaborate with peers, and post announcements.
- **Student:** View personal schedules, compare timetables across sections, and check teacher availability.

---

## 🛠️ Technical Requirements

To run this project locally, ensure you have the following installed:

- **Java JDK:** 17 or higher (compatible with Jakarta EE 10).
- **Web Server:** Apache Tomcat 10.1.x.
- **Database:** MySQL 8.0+ or MariaDB.
- **IDE:** Eclipse IDE for Enterprise Java Developers (recommended) or VS Code.
- **Browser:** Chrome, Firefox, or Edge.

### Library Dependencies (Located in `src/main/webapp/WEB-INF/lib/`):
- `jakarta.servlet.jsp.jstl-3.0.1.jar`
- `jakarta.servlet.jsp.jstl-api-3.0.0.jar`
- `mysql-connector-j-8.x.x.jar`
- `gson-2.10.1.jar`

---

## ⚙️ Setup & Installation

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/timetable-management-system.git
cd timetable-management-system
```

### 2. Database Setup
1. Open your MySQL client (e.g., MySQL Workbench or phpMyAdmin).
2. Create the database:
   ```sql
   CREATE DATABASE timetable_db;
   USE timetable_db;
   ```
3. Import the schema and initial data:
   ```bash
   mysql -u your_user -p timetable_db < src/main/resources/database/schema.sql
   ```

### 3. Configure Database Connection
Modify `src/main/java/com/timetablemanagementsystem/config/DBConnection.java` to match your local MySQL credentials:
```java
private static final String URL = "jdbc:mysql://localhost:3306/timetable_db";
private static final String USER = "your_username";
private static final String PASSWORD = "your_password";
```

### 4. Deploy to Tomcat
1. Import the project into **Eclipse IDE**.
2. Add the project to your **Tomcat 10.1** server.
3. Ensure the **Deployment Assembly** includes all JARs from `WEB-INF/lib`.
4. Start the server.
5. Access the app at: `http://localhost:8080/Timetable-and-Communication-Management-System/`

---

## ✨ Features

### 🛡️ Security & Reliability
- **Account Lockout:** Temporary 30-second lockout after 3 failed login attempts with a live countdown UI (In-memory tracking).
- **Custom Error Pages:** Professional themed pages for 404 (Not Found), 500 (Server Error), and 401 (Unauthorized).
- **PreparedStatements:** Full protection against SQL Injection attacks across all DAOs.

### 📅 Advanced Timetabling
- **Visual Calendar:** Dynamic timetable rendering using a unified CSS-based design system.
- **Conflict Prevention:** Logic to ensure lecturers and rooms aren't double-booked.
- **Schedule Comparison:** Students can select multiple sections to compare schedules side-by-side.

### 📢 Communication Hub
- **Announcements:** 
  - **Admins:** Create, Edit, and Delete announcements.
  - **Teachers:** Create announcements for their classes.
  - **Students:** Real-time view of institutional updates.

---

## 📂 Project Structure

```text
src/main/java/com/timetablemanagementsystem/
├── config/       # Database & System Configuration
├── controllers/  # Jakarta Servlets (Logic Layer)
├── dao/          # Data Access Objects (JDBC)
├── model/        # POJOs (User, TimetableEntry, etc.)

src/main/webapp/
├── WEB-INF/
│   ├── web.xml   # Error mappings & configuration
│   └── pages/    # JSP Views (Hidden from direct URL access)
├── css/          # Centralized style.css
└── js/           # Client-side interactivity (Countdown, Modals)
```

---

## 📝 Credentials (Default)

| Role | Email | Password |
| :--- | :--- | :--- |
| **Admin** | `admin@school.com` | `admin123` |

---

## 📜 License
Distributed under the MIT License. See `LICENSE` for more information.
