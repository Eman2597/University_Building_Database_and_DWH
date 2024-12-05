# Introduction

This project focuses on building a comprehensive database and data warehouse for a university. The primary objectives are:

To design and set up a SQL database for managing student data efficiently.

To import data from a source file (Excel sheet) into the database using SQL Server.

To analyze and extract insights from the data through SQL queries.

To implement a data warehouse using a star schema for advanced analytics and reporting.

# Project Stages

## 1. Data Collection and SQL Database Setup

Data Import: Import historical student information from an Excel sheet into the database.

SQL Database Design: Structure data into organized tables with defined relationships. This approach ensures efficient storage, retrieval, and management while maintaining data integrity and minimizing redundancy.

SQL Queries: Develop queries for interacting with the database to retrieve, update, and analyze data. Example use cases include extracting student grades or summarizing course enrollments.

## 2. Database Design

Structured Tables: Create tables to efficiently manage student-related data:

Program Table: Stores information about student programs.

Student Table: Holds detailed student information.

Instructor Table: Captures instructor-related data.

Department Table: Stores department-specific information.

Subject Table: Manages data related to courses.

Feedback Questions Table: Categorizes various feedback questions.

## 3. Building the Data Warehouse

Modeling with Star Schema: Design a star schema with dimensions and fact tables for optimal data organization and querying.

ETL Process: Transform data and load it into the dimensions and fact tables using SQL Server Integration Services (SSIS).

Data Loading: Implement full, incremental, and slow-changing dimension (SCD) loading strategies to keep the data warehouse up-to-date.

# Tools and Technologies
Visual Studio

SQL Server Integration Services (SSIS)

SQL Server Management Studio (SSMS)

Slowly Changing Dimension (SCD) 

SQL Server: For database design, management, and querying.

SSIS: For efficient ETL processes and data warehouse population.

Excel: As the initial data source.

# Project Workflow
## Step 1: Data Preparation

Collect historical data from Excel sheets.

Clean and preprocess the data to ensure consistency and accuracy.

![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Buildind_Database/Output_Image/DataSet.png)

## Step 2: Database Development

Design the schema for the SQL database.

Create tables and relationships based on university data requirements.

Import preprocessed data into the SQL database.

![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Buildind_Database/Output_Image/1.4%20ERD.jpg)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Buildind_Database/Output_Image/ERD.png)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Buildind_Database/Output_Image/Schemas_Tables.png)

# Step 3: Query Development

Write and optimize SQL queries for data extraction and analysis.

Test queries to ensure they meet reporting and analysis needs.
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Buildind_Database/Output_Image/output_Load_Student_feedback.png)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Buildind_Database/Output_Image/output_Load_Students_Program.png)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Buildind_Database/Output_Image/output_Load_Student_Grade.png)

## Step 4: Data Warehouse Design

Model a star schema with dimension and fact tables tailored to university operations.

Develop ETL workflows using SSIS to populate the data warehouse.

![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/Star_Schema.png)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/SSIS_Packages.png)

## Step 5: Data Loading

Perform full data load and clean.
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/Load_Facttable_ETL.png)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/Load_Dim_Student_ETL.png)

Implement slow-changing dimension (SCD) strategies where necessary.
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/SCD.png)

Deliver data warehouse system
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/DWH_FactTable.png)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/Load_Dim_Student_ETL.png)
![](https://github.com/Eman2597/University_Building_Database_and_DWH/blob/main/Building_DWH/Image/DWH_DimInstructor.png)

# Outcome

The project will deliver a robust database and data warehouse system that:

Supports efficient data management and reporting.

Enables advanced analytics for improved decision-making.

Provides scalability for future data integration and growth.
