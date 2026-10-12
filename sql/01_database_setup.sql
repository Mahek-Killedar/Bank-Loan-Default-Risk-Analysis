
-- PROJECT: Bank Loan Default Risk Analysis
-- FILE: 01_database_setup.sql

-- Create the database only if it does not already exist
CREATE DATABASE IF NOT EXISTS bank_loan_analysis;

-- Select the project database
USE bank_loan_analysis;

-- Verify the selected database
SELECT DATABASE() AS current_database;
