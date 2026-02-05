# Apollo Healthcare SQL Project 🏥

## About the Project
This project is created to improve my SQL skills using a real healthcare dataset.
I performed data cleaning, handled NULL values, used aggregate functions,
worked with dates, and optimized queries using indexes.

---

## Dataset Used
Apollo Healthcare dataset containing:
- Patient ID
- Admit Date
- Discharge Date
- Feedback
- Doctor
- Billing Amount

---

## SQL Concepts Applied
 1.	Aggregate Functions
          Calculated average feedback using AVG() and rounded results:
     
          SELECT ROUND(AVG(feedback), 2) AS avg_feedback
           FROM apollo_healthcare;

2.	Date Difference Calculation
           Calculated patient stay duration:
          
          SELECT patient_id, discharge_date - admit_date AS stay_days
          FROM apollo_healthcare;

3.	Indexing for Performance Optimization
           Created index on frequently used column:

           CREATE INDEX idx_patient_id
           ON apollo_healthcare(patient_id);


📊 Business Insights
    
    •	Identified incomplete patient records
    •	Analyzed average patient feedback
    •	Calculated length of hospital stay
    •	Improved query performance using indexing



### 1. Handling NULL Values
```sql
SELECT *
FROM apollo_healthcare
WHERE feedback IS NULL OR doctor IS NULL;

🚀 Learning Outcomes
•	Practical SQL querying
•	Data cleaning concepts
•	Understanding NULL values
•	Performance optimization using INDEX

## Author
  Nadir   
Junior Data Analyst | SQL & PostgreSQL  



