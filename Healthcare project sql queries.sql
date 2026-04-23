-- ================================================
-- HEALTHCARE PATIENT ANALYTICS
-- Author: MishraX04
-- Database: healthcare_db
-- ================================================

--CREATE TABLE

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    gender VARCHAR(10),
    blood_type VARCHAR(5),
    medical_condition VARCHAR(100),
    date_of_admission DATE,
    doctor VARCHAR(100),
    hospital VARCHAR(100),
    insurance_provider VARCHAR(100),
    billing_amount DECIMAL(10,2),
    room_number INTEGER,
    admission_type VARCHAR(50),
    discharge_date DATE,
    medication VARCHAR(100),
    test_results VARCHAR(50)
);


--IMPORT DATA

COPY patients(name, age, gender, blood_type, 
medical_condition, date_of_admission, doctor, 
hospital, insurance_provider, billing_amount, 
room_number, admission_type, discharge_date, 
medication, test_results)
FROM 'C:/healthcare_dataset.csv'
DELIMITER ','
CSV HEADER;


-- QUERY 1: OVERALL HOSPITAL PERFORMANCE
SELECT 
    COUNT(*) as total_patients,
    ROUND(SUM(billing_amount)::numeric, 2) as total_revenue,
    ROUND(AVG(billing_amount)::numeric, 2) as avg_billing
FROM patients;

-- QUERY 2: REVENUE BY MEDICAL CONDITION
SELECT 
    medical_condition,
    COUNT(*) as total_patients,
    ROUND(AVG(billing_amount)::numeric, 2) as avg_billing,
    ROUND(SUM(billing_amount)::numeric, 2) as total_revenue
FROM patients
GROUP BY medical_condition
ORDER BY total_revenue DESC;

-- QUERY 3: INSURANCE PROVIDER ANALYSIS
SELECT 
    insurance_provider,
    COUNT(*) as total_patients,
    ROUND(SUM(billing_amount)::numeric, 2) as total_billed,
    ROUND(AVG(billing_amount)::numeric, 2) as avg_bill
FROM patients
GROUP BY insurance_provider
ORDER BY total_billed DESC;

-- QUERY 4: ADMISSION TYPE ANALYSIS (WINDOW FUNCTION)
SELECT 
    medical_condition,
    admission_type,
    COUNT(*) as total_patients,
    ROUND(AVG(billing_amount)::numeric, 2) as avg_billing,
    ROUND(SUM(COUNT(*)) OVER 
    (PARTITION BY medical_condition)::numeric, 2) 
    as condition_total_patients
FROM patients
GROUP BY medical_condition, admission_type
ORDER BY medical_condition, total_patients DESC;

-- QUERY 5: HIGH BILLING CONDITIONS (CTE + RANK)
WITH avg_billing_cte AS (
    SELECT 
        medical_condition,
        ROUND(AVG(billing_amount)::numeric, 2) 
        as avg_billing
    FROM patients
    GROUP BY medical_condition
),
high_billing AS (
    SELECT *
    FROM avg_billing_cte
    WHERE avg_billing > 25500
)
SELECT 
    h.medical_condition,
    h.avg_billing,
    RANK() OVER (ORDER BY h.avg_billing DESC) 
    as billing_rank
FROM high_billing h;

-- QUERY 6: LENGTH OF STAY ANALYSIS
SELECT 
    medical_condition,
    ROUND(AVG(discharge_date - date_of_admission)
    ::numeric, 1) as avg_stay_days,
    ROUND(AVG(billing_amount)::numeric, 2) as avg_billing,
    COUNT(*) as total_patients
FROM patients
GROUP BY medical_condition
ORDER BY avg_stay_days DESC;

-- QUERY 7: TEST RESULTS ANALYSIS
SELECT 
    test_results,
    COUNT(*) as total_patients,
    ROUND(AVG(billing_amount)::numeric, 2) as avg_billing
FROM patients
GROUP BY test_results
ORDER BY total_patients DESC;

-- QUERY 8: YEARLY ADMISSION TREND
SELECT 
    EXTRACT(YEAR FROM date_of_admission) as year,
    COUNT(*) as total_admissions,
    ROUND(SUM(billing_amount)::numeric, 2) as total_revenue
FROM patients
GROUP BY year
ORDER BY year;