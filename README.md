# 📡 Telecom Real-Time ETL Pipeline (WE Case Study)

## 📝 Overview
End-to-end ETL pipeline for telecom transaction logs (inspired by "WE") with real-time validation, transformation, and error handling.

## 🚀 Key Features
- **Dynamic File Processing** – Foreach Loop Container for multiple CSVs  
- **Data Quality** – Null checks (IMSI) + Lookup validation against reference DB  
- **Transformations** – Extract TAC/SNR from IMEI, standardize timestamps  
- **Error Handling** – Rejected path logs invalid records with reason & file name  
- **Archiving** – Auto-move processed files via File System Task  

## 🛠️ Tech Stack
**ETL:** SSIS | **DB:** SQL Server (T-SQL) | **Format:** CSV

## 📊 Pipeline Architecture
- **Control Flow** – File loop & archiving  
- **Data Flow** – Cleaning, lookup, error redirection  

## 🗄️ Database Schema
| Table | Purpose |
|-------|---------|
| `fact_transactions` | Cleaned transaction data |
| `IMSI_reference` | Active subscribers lookup |
| `rejected_transactions` | Audit log (reject_reason, file_name) |

## 📖 How to Run
1. Run SQL scripts in `/SQL` folder to create tables  
2. Set SSIS variables: `SourceFolder` & `ArchiveFolder`  
3. Place sample CSVs in source folder  
4. Execute SSIS package  

## 📁 Structure
/SSIS_Package # .dtsx file
/SQL # Table creation scripts
/Sample_Data # Input CSVs
/Archive # Processed files


## ✅ Validation Rules
| Check | Field | Failure Action |
|-------|-------|----------------|
| Not null | IMSI | Reject to audit table |
| Lookup match | IMSI | Reject if not in reference |
| Parse | IMEI | Extract TAC (8 chars) + SNR (6 chars) |
