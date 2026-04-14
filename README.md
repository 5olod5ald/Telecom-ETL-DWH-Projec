📡 Telecom Real-Time ETL Pipeline (WE Case Study)
📝 Project Overview
This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline built for a telecommunications scenario (inspired by "WE"). The goal is to process transaction logs, validate subscriber data, and handle data quality issues in a simulated real-time environment.

🚀 Key Features
Dynamic File Processing: Automated processing of multiple CSV files using a Foreach Loop Container.

Data Quality & Validation:

Filters out records with missing or null critical fields (e.g., IMSI).

Cross-references subscribers against a reference database using Lookup Transformations.

Transformation Logic:

Extracts device technical details (TAC, SNR) from IMEI strings.

Standardizes timestamps and data types for data warehouse compatibility.

Error Handling: Implements a robust "Rejected Path" to log invalid records with specific error reasons and source file metadata.

Automated Archiving: Seamlessly moves processed files to an archive directory post-execution using File System Tasks.

🛠️ Tech Stack
ETL Tool: SQL Server Integration Services (SSIS)

Database: Microsoft SQL Server (T-SQL)

Data Format: Flat Files (CSV)

📊 Pipeline Architecture
The workflow is divided into:

Control Flow: Manages the loop and file orchestration.

Data Flow: Handles the internal logic of data movement, cleaning, and lookup.

🗄️ Database Schema
fact_transactions: The primary table holding cleaned and validated transaction data.

IMSI_reference: A dimension-style table used to verify active subscribers.

rejected_transactions: An audit table for tracking data quality failures, including reject_reason and file_name.

📖 How to Run
Execute the SQL scripts provided in the /SQL folder to set up the environment.

Configure the SSIS variables SourceFolder and ArchiveFolder to point to your local directories.

Place the sample CSV files in the source folder.

Run the SSIS package.
