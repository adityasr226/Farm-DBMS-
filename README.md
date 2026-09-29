# 🌾 Farm Database Management System

<p align="center">
  <b>A relational database system for managing and analyzing farm operations using Microsoft SQL Server.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-T--SQL-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white">
  <img src="https://img.shields.io/badge/Database-Relational-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge">
</p>

---

## 📌 Overview

The **Farm Database Management System** is a SQL Server-based relational database designed to organize, manage, and analyze key farm operations.

The system provides a structured way to manage:

- 🌾 Farm fields
- 🌱 Crops and harvest schedules
- 🌦️ Weather records
- 🚜 Agricultural machinery
- 👨‍🌾 Farm workers
- 🔧 Worker-machine assignments
- 📊 Operational analytics
- ⚙️ Data validation and automation

The project demonstrates practical **SQL development, relational data modelling, database design, data analysis, triggers, stored procedures, and cursors**.

---

## 🎯 Objectives

- Centralize farm operational data in a structured relational database.
- Establish relationships between fields, crops, workers, weather, and machinery.
- Enable efficient SQL-based reporting and analysis.
- Maintain data accuracy using constraints and validation rules.
- Automate selected database operations using triggers.
- Create reusable reporting logic using stored procedures.
- Demonstrate procedural SQL using cursors.

---

## 🏗️ Database Architecture

```mermaid
erDiagram

    FIELD ||--o{ CROP : contains
    FIELD ||--o{ WEATHER : records
    WORKER ||--o{ WORKER_MACHINERY : operates
    MACHINERY ||--o{ WORKER_MACHINERY : assigned
    MACHINERY ||--|| MACHINE_STATUS : has

    FIELD {
        INT field_id PK
        VARCHAR name
        VARCHAR location
        DECIMAL area
        VARCHAR soil_type
    }

    CROP {
        INT crop_id PK
        INT field_id FK
        VARCHAR crop_type
        DATE planting_date
        DATE harvest_date
        VARCHAR status
    }

    WEATHER {
        INT weather_id PK
        INT field_id FK
        DATE weather_date
        DECIMAL temperature
        DECIMAL humidity
    }

    MACHINERY {
        INT machine_id PK
        VARCHAR name
        VARCHAR model
        DATE purchase_date
    }

    WORKER {
        INT worker_id PK
        VARCHAR name
        VARCHAR contact_number
        VARCHAR position
        DATE hire_date
    }

    WORKER_MACHINERY {
        INT worker_id PK
        INT machine_id PK
        DATE task_date PK
        DECIMAL hours_used
    }

    MACHINE_STATUS {
        INT machine_id PK
        VARCHAR status
        DATE last_service_date
    }
