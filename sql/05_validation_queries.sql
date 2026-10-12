
-- PROJECT: Bank Loan Default Risk Analysis
-- FILE: 05_validation_queries.sql

USE bank_loan_analysis;

-- 1. Validate the raw dataset
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT id) AS unique_loans,
    SUM(funded_amnt) AS total_funded_amount,
    ROUND(
        AVG(
            CAST(
                REPLACE(int_rate, '%', '')
                AS DECIMAL(5,2)
            )
        ),
        2
    ) AS average_interest_rate
FROM loan_raw;

-- 2. Validate the cleaned table
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT loan_id) AS unique_loans,
    SUM(funded_amnt) AS total_funded_amount,
    ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM loan_clean;

-- 3. Compare raw and cleaned record counts
SELECT
    (SELECT COUNT(*) FROM loan_raw) AS raw_rows,
    (SELECT COUNT(*) FROM loan_clean) AS cleaned_rows;

-- 4. Check the cleaned loan IDs
SELECT
    COUNT(*) AS total_rows,
    SUM(loan_id IS NULL) AS missing_loan_ids,
    COUNT(DISTINCT loan_id) AS unique_loan_ids
FROM loan_clean;

-- 5. Check the status counts for dashboard validation
SELECT
    loan_status,
    COUNT(*) AS record_count
FROM loan_clean
GROUP BY loan_status
ORDER BY loan_status;
