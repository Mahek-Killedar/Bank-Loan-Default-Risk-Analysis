# Bank Loan Default Risk Analysis

## Project Overview

The **Bank Loan Default Risk Analysis** project uses MySQL and Power BI to analyze historical loan records and explore patterns in loan performance and borrower risk segments.

The project focuses on understanding loan outcomes, comparing loan grades and purposes, examining loan terms and interest rates, and presenting key metrics through an interactive dashboard.

## Project Objectives

- Analyze historical loan records using SQL.
- Check data quality, missing values, and duplicate records.
- Clean and transform selected loan data fields.
- Compare loan outcomes across loan grades, purposes, and terms.
- Create an interactive Power BI dashboard.
- Summarize findings based on actual query results.

## Tools and Technologies

- **MySQL:** Data querying, cleaning, validation, and analysis.
- **Power BI:** Dashboard development and data visualization.
- **DAX:** Measures and KPI calculations in Power BI.
- **Git and GitHub:** Project version control and portfolio sharing.

## Dataset

The project uses a historical loan dataset containing loan and borrower-related fields.

Selected fields include:

- Loan amount and funded amount
- Loan grade and sub-grade
- Interest rate and installment
- Employment length and home ownership
- Annual income and verification status
- Loan issue date and loan status
- Loan purpose and state
- Debt-to-income ratio
- Total payments, principal received, interest received, and recoveries

The analysis uses the fields available in the cleaned dataset. Refer to the SQL scripts for the exact transformations and validation checks.

## Project Workflow

1. **Database setup:** Create and select the MySQL database.
2. **Data quality checks:** Examine records, column types, missing values, duplicate IDs, and loan-status categories.
3. **Data cleaning:** Create the cleaned analysis table and transform selected fields.
4. **SQL analysis:** Compare loan metrics and recorded outcomes across different segments.
5. **Power BI dashboard:** Visualize KPIs, loan outcomes, loan grades, purposes, and other relevant measures.
6. **Findings:** Document patterns supported by the actual SQL results and validated dashboard metrics.

## Dashboard

The Power BI dashboard is intended to present key portfolio metrics and comparisons, including:

- Total number of loans
- Total funded amount
- Average loan amount
- Average interest rate
- Loan outcomes by grade
- Loan outcomes by purpose
- Loan-term comparisons
- Interactive filters for relevant loan attributes

Dashboard measures and charts should be interpreted according to the definitions used in the project.

## Key Findings

Add three to five findings here after running and validating the SQL queries.

Examples of questions to investigate:

- Which loan grade has the highest observed charged-off or default-related rate?
- How do recorded loan outcomes vary by loan purpose?
- How do outcomes differ between 36-month and 60-month loans?
- How do average interest rates vary across loan grades?
- Which segments may deserve further review?

Do not add estimated or invented results. Report actual values from the completed analysis.

## Data Interpretation

The project examines historical associations in the dataset. These patterns do not prove that a particular borrower characteristic, loan grade, or loan term causes default.

The definition of a default-related outcome must be stated clearly and applied consistently. Unresolved loan statuses should be handled appropriately when calculating rates.

## Repository Structure

```text
Bank-Loan-Default-Risk-Analysis/
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_quality_checks.sql
│   ├── 03_data_cleaning.sql
│   ├── 04_business_analysis.sql
│   └── 05_validation_queries.sql
├── powerbi/
│   └── Bank_Loan_Risk_Dashboard.pbix
├── screenshots/
└── README.md
```

## How to Use This Project

1. Install MySQL and open MySQL Workbench.
2. Obtain the dataset from its original permitted source.
3. Review the SQL scripts in the `sql` folder.
4. Run the scripts in the documented order, checking the database and table names first.
5. Open the Power BI file in Power BI Desktop.
6. Configure your own MySQL connection if required and refresh the data.
7. Review the dashboard and compare its metrics with the SQL results.

The scripts may require adjustments to file paths, connection settings, or dataset column names depending on your local setup.

## Limitations

- The findings depend on the quality and coverage of the available historical data.
- Recorded loan outcomes may not represent the final outcome of every loan.
- The project explores patterns and does not establish causation.
- This is an analytical portfolio project, not a production credit-scoring system.

## Author

**Mahek Mehboob Killedar**

Aspiring Data Analyst | Business Intelligence & Data Visualization

Skills demonstrated: SQL, MySQL, Power BI, DAX, data cleaning, data validation, and dashboard development.
