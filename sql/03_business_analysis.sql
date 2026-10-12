
-- PROJECT: Bank Loan Default Risk Analysis
-- FILE: 04_business_analysis.sql

USE bank_loan_analysis;

-- 1. Overall portfolio KPIs
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_requested_amount,
    SUM(funded_amnt) AS total_funded_amount,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount,
    ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM loan_clean;

-- 2. Loans by grade
SELECT
    grade,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    ROUND(AVG(interest_rate), 2) AS average_interest_rate,
    ROUND(AVG(annual_inc), 2) AS average_annual_income
FROM loan_clean
GROUP BY grade
ORDER BY grade;

-- 3. Loans by purpose
SELECT
    purpose,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount
FROM loan_clean
GROUP BY purpose
ORDER BY total_loans DESC;

-- 4. Loans by term
SELECT
    term,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM loan_clean
GROUP BY term
ORDER BY term;

-- 5. Loan outcomes by purpose
SELECT
    purpose,
    loan_status,
    COUNT(*) AS loan_count,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount,
    ROUND(AVG(total_pymnt), 2) AS average_total_payment,
    ROUND(AVG(recoveries), 2) AS average_recoveries
FROM loan_clean
GROUP BY purpose, loan_status
ORDER BY purpose, loan_status;

-- 6. Loan outcomes by grade
SELECT
    grade,
    loan_status,
    COUNT(*) AS loan_count,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount,
    ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM loan_clean
GROUP BY grade, loan_status
ORDER BY grade, loan_status;

-- 7. Loan outcomes by term
SELECT
    term,
    loan_status,
    COUNT(*) AS loan_count,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount
FROM loan_clean
GROUP BY term, loan_status
ORDER BY term, loan_status;

-- 8. Loans by state
SELECT
    addr_state,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount
FROM loan_clean
GROUP BY addr_state
ORDER BY total_loans DESC;

-- 9. Average DTI by grade
SELECT
    grade,
    ROUND(AVG(dti), 2) AS average_dti,
    COUNT(*) AS total_loans
FROM loan_clean
GROUP BY grade
ORDER BY grade;

-- 10. Default-related rate, assuming status 1 means default
-- Confirm the dataset's status definition before using this result.
SELECT
    grade,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS status_1_loans,
    ROUND(
        100.0 * SUM(loan_status = 1) / COUNT(*),
        2
    ) AS status_1_rate_pct
FROM loan_clean
GROUP BY grade
ORDER BY grade;
