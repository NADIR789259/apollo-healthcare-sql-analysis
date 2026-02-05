CREATE TABLE apollo_healthcare(
Patient_id INT ,
Admit_Date DATE,
Discharge_Date DATE,
Diagnosis VARCHAR(100),
Bed_Occupancy VARCHAR(70),
Test VARCHAR(50),
Doctor VARCHAR(80),
Followup_Date DATE,
Feedback NUMERIC(3,1),
Billing_Amount INT,
Health_Insurance_Amount INT

);

SELECT*FROM apollo_healthcare;
DROP TABLE IF EXISTS apollo_healthcare;

----------------------- BEGINNER LEVEL ------------------------------------

--1. Show all patient recordes.
     SELECT *FROM apollo_healthcare; 

--2. Display only patient_id,Diagnosis,Doctor.
     SELECT Patient_id,Diagnosis,Doctor FROM apollo_healthcare;
	 
--3. Find all patient admitted after "2023-01-05".
     SELECT*FROM apollo_healthcare
	 WHERE admit_date > '2023-01-05';
	
--4. Get "Distinct" Diagnosis Types.
     SELECT DISTINCT  Diagnosis FROM apollo_healthcare;

--5. Show patient Where Bed_occupancy ='ICU'.
     SELECT *FROM apollo_healthcare
     WHERE Bed_occupancy ='ICU';

    
--6 Find patient whose feedback is greater than 4.5
    SELECT*FROM apollo_healthcare
	WHERE Feedback >=4.5;

--7. list patient who took 'MRI Test'.
     SELECT *FROM apollo_healthcare
     WHERE Test = 'MRI';
	 
---------------------- INTERMEDIATE LEVEL -----------------------------------
--8. Count total number of patients. 
     SELECT COUNT(*) AS Total_patients from apollo_healthcare;

--9. Count patient per Diagnosis.
     SELECT diagnosis,COUNT(*) As patient_id
	 FROM apollo_healthcare
	 GROUP BY diagnosis;

--10. Find Average Feedback.
      SELECT ROUND(AVG(feedback),2) AS avg_feedback 
	  FROM apollo_healthcare;

--11. Find total billing Amount Collected.
      SELECT SUM(Billing_amount) AS total_billing_amount
	  FROM apollo_healthcare;

--12. Show average billing Amount per Bed_occupancy.
      SELECT Bed_occupancy, ROUND(AVG(billing_amount),2) AS avg_billing
	  FROM apollo_healthcare
	  GROUP BY Bed_occupancy;

--13. Find Doctors who treated more than 5 patients.
      SELECT Doctor,COUNT(*) AS patient_count
	  FROM apollo_healthcare
	  GROUP BY Doctor
	  HAVING COUNT(*)>5;

--14. Find patients whose Billing Amount > Insurance Amount.
      SELECT*FROM apollo_healthcare
	  WHERE Billing_Amount > health_insurance_amount;

--15. Show length of Stay (Discharge-Admit) for each patient
       SELECT patient_id, Discharge_date-Admit_date AS Stays_days
	   FROM apollo_healthcare;

--16. Short patient by Billing Amount ( Highest First ).
      SELECT*FROM apollo_healthcare
	  ORDER BY Billing_amount DESC
	  LIMIT 1;

-------------------- ADVANCED LEVEL --------------------------------------

--17. Top 3 Diagnoses by total billing.
      SELECT*FROM apollo_healthcare;
	  
	  SELECT Diagnosis , SUM(billing_amount) AS total_billing
	  FROM apollo_healthcare
	  GROUP BY diagnosis
	  ORDER BY  total_billing DESC LIMIT 3;
	  
--18. Docor-wise average feedback.
      SELECT*FROM apollo_healthcare;

	  SELECT Doctor,ROUND (AVG(Feedback),2) AS avg_doctor_feedback
	  FROM apollo_healthcare
	  GROUP BY Doctor;
	  
--19. Month-wise paient admissions.
	  SELECT MONTH (Admit_Date) AS month
	  COUNT(*) AS total_admission
	  FROM apollo_healthcare
	  GROUP BY Month(Admit_Date)
	  ORDER BY month;
	  
--20. Patients stayed more than 7 days.
      SELECT FROM apollo_healthcare 
	  WHERE (Discharge_Date - Admit_Date)>7;

--21. Insurance coverage percentage.
      SELECT Patient_id, ROUND((Health_Insurance_Amount/Billing_Amount)*100,2) 
	  AS insurance_percentage FROM apollo_healthcare;
	  
--22. Bed occupancy generating highest revenue.
      SELECT Bed_Occupancy,SUM(Billing_Amount) AS Highest_Revenue
	  FROM apollo_healthcare
	  GROUP BY Bed_Occupancy
	  ORDER BY Highest_Revenue DESC;
	  
--23. Same diagnosis treated by same doctor multiple times.
      SELECT Doctor,Diagnosis,COUNT(*) AS Cases
	  FROM apollo_healthcare
	  GROUP BY Doctor,Diagnosis
	  HAVING COUNT(*)>1;
	  
--24. Rank patients by billing Amount. 
     SELECT Patient_id, Billing_Amount,RANK()OVER(ORDER BY Billing_Amount DESC)
     AS billing_rank FROM apollo_healthcare;

--25. View for High Billing Patients (>1000)
      CREATE VIEW hight_billing_amount AS 
	  SELECT*FROM apollo_healthcare
	  WHERE Billing_Amount >1000; 
	  SELECT*FROM hight_billing_amount;
	  select*from apollo_healthcare;
--26. Check NULL Values.
      SELECT*FROM apollo_healthcare
	  WHERE Feedback IS NULL OR Doctor IS NULL;
--27. Index on Patient_ID.
      CREATE INDEX idx_patient_id ON apollo_healthcare(Patient_id);
    