# Data Management Framework: Progress Notes

This document tracks my progress as I build the Data Management Framework in PostgreSQL.

---

## Project Overview
**Objective**: Build a scalable, compliant data management framework for PostgreSQL.

**Key Goals**:
1. Create a schema to manage raw, processed, and audit data.
2. Ensure compliance with GDPR (e.g., Subject Access Requests).
3. Track incidents and risks using PostgreSQL.
4. Generate reports and dashboards for insights.

---

## Daily Progress

### Day 1: Initial Setup
- Installed PostgreSQL and pgAdmin 4.
- Created a new database: `data_management_framework`. Right click and open Query Tool.
- Verified connection and ran a basic SQL query: `SELECT version();`.

- Created the `project_schema` schema:
  ```sql
  CREATE SCHEMA project_schema; -- Refresh for Schema to show up. 
  
