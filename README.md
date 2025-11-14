# Azure Data Engineering Pipeline (ADF + Databricks + Synapse + Power BI)

This end-to-end project demonstrates a complete **Modern Data Engineering Architecture** on Azure, starting from ingestion to analytics & visualization.

---

## 🚀 Architecture Overview

**1️⃣ Ingestion – Azure Data Factory**  
- Ingested multiple datasets from GitHub (public HTTP URLs).  
- Used **dynamic ADF pipelines** to loop over a file list.  
- Loaded raw data into **Azure Data Lake – Bronze Layer**.

**2️⃣ Transformation – Azure Databricks (PySpark)**  
- Cleaned & transformed raw data into the **Silver Layer**.  
- Used Databricks notebooks for:  
  - Data cleaning  
  - Schema alignment  
  - Joins, deduplication  
  - Writing to ADLS Silver

**3️⃣ SQL Layer – Azure Synapse Analytics**  
- Created **views** on Silver data.  
- Created **external tables** and pushed to Gold Layer using serverless SQL pool with:  
  - OPENROWSET  
  - External Data Sources  
  - Parquet File Formats  

**4️⃣ Reporting – Power BI**  
- Connected Synapse serverless SQL pool to Power BI.  
- Built sample dashboards:
  - Product Insights
  - Customer count Analysis
  - orders per year insights

---

## 📁 Repository Structure
Azure_data_pipeline/
│
├── Azure_data_factory/ # Screenshots of ADF pipelines
├── Azure_databricks_notebook_code/ # code screenshots
├── Azure_synapse_analytics_scripts/ # SQL views, external tables, OPENROWSET scripts
├── power_bi_sample_reports/ # Consolidated Dashboard screenshots (PNG/JPG)
└── README.md # Project documentation

