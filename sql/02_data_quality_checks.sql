
-- PROJECT: Bank Loan Default Risk Analysis
-- FILE: 02_data_quality_checks.sql

USE bank_loan_analysis;

-- 1. Count the raw records
SELECT COUNT(*) AS total_records
FROM loan_raw;

-- 2. Inspect all columns and data types
DESCRIBE loan_raw;

-- 3. Check loan-status values
SELECT
    loan_status,
    COUNT(*) AS record_count
FROM loan_raw
GROUP BY loan_status
ORDER BY loan_status;

-- 4. Find duplicate loan IDs
SELECT
    id,
    COUNT(*) AS occurrences
FROM loan_raw
GROUP BY id
HAVING COUNT(*) > 1;

-- 5. Check missing values in important raw columns
SELECT
    COUNT(*) AS total_rows,
    SUM(id IS NULL) AS missing_ids,
    SUM(loan_amnt IS NULL) AS missing_loan_amounts,
    SUM(funded_amnt IS NULL) AS missing_funded_amounts,
    SUM(int_rate IS NULL OR TRIM(int_rate) = '')
        AS missing_interest_rates,
    SUM(annual_inc IS NULL) AS missing_income,
    SUM(issue_d IS NULL OR TRIM(issue_d) = '')
        AS missing_issue_dates,
    SUM(grade IS NULL OR TRIM(grade) = '')
        AS missing_grades
FROM loan_raw;

-- 6. Check the range of loan amounts
SELECT
    MIN(loan_amnt) AS minimum_loan_amount,
    MAX(loan_amnt) AS maximum_loan_amount,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount
FROM loan_raw;

-- 7. Check interest-rate values as stored in the CSV
SELECT DISTINCT int_rate
FROM loan_raw
ORDER BY int_rate
LIMIT 20;
