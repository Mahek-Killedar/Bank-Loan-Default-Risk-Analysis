
-- PROJECT: Bank Loan Default Risk Analysis
-- FILE: 03_data_cleaning.sql

USE bank_loan_analysis;

-- 1. Create the cleaned table if it does not exist
CREATE TABLE IF NOT EXISTS loan_clean AS
SELECT
    id AS loan_id,
    loan_amnt,
    funded_amnt,
    term,

    CAST(
        NULLIF(REPLACE(TRIM(int_rate), '%', ''), '')
        AS DECIMAL(5,2)
    ) AS interest_rate,

    installment,
    grade,
    sub_grade,
    emp_length,
    home_ownership,
    annual_inc,
    verification_status,

    STR_TO_DATE(
        CONCAT('01-', TRIM(issue_d)),
        '%d-%b-%y'
    ) AS issue_date,

    loan_status,
    purpose,
    addr_state,
    dti,
    delinq_2yrs,
    inq_last_6mths,
    open_acc,
    pub_rec,
    revol_bal,

    CAST(
        NULLIF(REPLACE(TRIM(revol_util), '%', ''), '')
        AS DECIMAL(5,2)
    ) AS revol_util_pct,

    total_acc,
    total_pymnt,
    total_rec_prncp,
    total_rec_int,
    recoveries

FROM loan_raw;

-- 2. Count cleaned records
SELECT COUNT(*) AS cleaned_records
FROM loan_clean;

-- 3. Preview cleaned records
SELECT *
FROM loan_clean
LIMIT 10;

-- 4. Check missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT loan_id) AS unique_loans,
    SUM(loan_id IS NULL) AS missing_loan_ids,
    SUM(interest_rate IS NULL) AS missing_interest_rates,
    SUM(annual_inc IS NULL) AS missing_income,
    SUM(issue_date IS NULL) AS missing_issue_dates,
    SUM(revol_util_pct IS NULL) AS missing_revol_util
FROM loan_clean;

-- 5. Check date conversion
SELECT
    issue_date,
    COUNT(*) AS loan_count
FROM loan_clean
GROUP BY issue_date
ORDER BY issue_date;
