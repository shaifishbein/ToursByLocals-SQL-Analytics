# ToursByLocals – SQL & Power BI Analytics

A SQL and Power BI analytics project based on a tourism platform connecting travelers with local guides.

The project combines relational database design, SQL-based analysis, advanced T-SQL functionality, and interactive Power BI visualization.

## Project Overview

The database represents the activity of a tourism platform and includes data related to:

- Tours
- Bookings
- Guides
- Travelers
- Reviews
- Customer search activity

The project demonstrates the full process from database creation and data modeling to analytical SQL queries and Power BI reporting.

## Database Design

The relational database was designed using Microsoft SQL Server.

The project includes:

- Tables and relationships
- Primary and foreign keys
- Data integrity constraints
- Sample data for testing and analysis
- Relationships between tours, bookings, guides, travelers, reviews, and search activity

## SQL Analysis

SQL queries are used to analyze different aspects of the platform, including:

- Tour and booking activity
- Guide performance
- Revenue-related analysis
- Customer search behavior
- Popular destinations
- Tour categories
- Customer reviews and ratings

## Advanced SQL

The project demonstrates several advanced SQL and T-SQL concepts, including:

- Multi-table JOINs
- GROUP BY and HAVING
- Aggregate functions
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- Views
- User-defined functions
- Stored procedures
- Triggers
- TRY/CATCH error handling

Window functions used in the project include:

- `RANK`
- `DENSE_RANK`
- `LAG`
- `LEAD`

## Power BI Dashboard

A Power BI dashboard was created to analyze customer search activity.

The dashboard includes:

- Total search KPI
- Searches by country
- Search share by tour type
- Country filtering
- Tour type filtering

## Dashboard Preview

![Power BI Search Analysis Dashboard](search_analysis_dashboard.png)

## Technologies

- SQL
- Microsoft SQL Server
- T-SQL
- Power BI
- Relational Database Design
- Data Analysis

## Repository Structure

```text
ToursByLocals-SQL-Analytics/
│
├── sql/
│   ├── database_creation.sql
│   ├── sample_data.sql
│   ├── analysis_queries.sql
│   └── advanced_sql.sql
│
├── search_analysis_dashboard.png
└── README.md
```

## Project Files

### `database_creation.sql`

Creates the relational database structure, including tables, relationships, keys, and constraints.

### `sample_data.sql`

Contains sample records used to populate and test the database.

### `analysis_queries.sql`

Contains analytical SQL queries used to explore tours, bookings, guides, customer activity, and other business-related information.

### `advanced_sql.sql`

Demonstrates more advanced SQL functionality, including CTEs, window functions, views, functions, stored procedures, triggers, and error handling.

## Skills Demonstrated

- SQL querying
- Relational database design
- Data analysis
- T-SQL
- Advanced SQL
- Data aggregation
- Window functions
- Database programming
- Power BI visualization
- Dashboard development

## About

This project was developed as part of my Industrial Engineering and Management studies and demonstrates practical experience in database design, SQL-based data analysis, and business intelligence reporting.
