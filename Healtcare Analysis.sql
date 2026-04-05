create database HealthCare1;
use HealthCare1;
show tables;

##total Patient
SELECT COUNT(*) AS TotalPatient
FROM Patient;

##Total Doctor
SELECT COUNT(*) AS TotalDoctor
FROM Doctor;

##total Visit
SELECT COUNT(*) AS TotalVisit
FROM Visit;

## Avg age of patient
SELECT COUNT(*) 
FROM Patient
WHERE DateOfBirth IS NOT NULL;

desc Patient;

SELECT AVG(Age) AS Average_Age
FROM Patient
WHERE Age IS NOT NULL;

##total top 5 diagonsed

SELECT Diagnosis, COUNT(*) AS Total_Cases
FROM visit
GROUP BY Diagnosis
ORDER BY Total_Cases DESC
LIMIT 5;

##follow-up rate
desc visit;

SELECT 
   (SUM(CASE WHEN `Follow Up Required` = 'Yes' THEN 1 ELSE 0 END) * 100.0 
   / COUNT(*)) AS FollowUp_Rate
FROM Visit;

#Treatement cost per Visit
desc treatment;
SELECT AVG(`Treatment Cost`) AS Avg_Treatment_Cost
FROM Treatment;

##total lab test conducted
show tables;

SELECT COUNT(*) AS Total_Lab_Tests
FROM `lab result`;

## percentage of abnormal result
show tables;
DESC `lab result`;

SELECT 
 (SUM(CASE WHEN `Test Result` = 'Abnormal' THEN 1 ELSE 0 END) * 100.0
 / COUNT(*)) AS Abnormal_Report_Percentage
FROM `lab result`;

##doctor workload
DESC Doctor;
DESC Visit;

SELECT d.`Doctor Name`,
       COUNT(v.`Visit ID`) AS Doctor_Workload
FROM Doctor d
JOIN Visit v
ON d.`Doctor ID` = v.`Doctor ID`
GROUP BY d.`Doctor Name`
ORDER BY Doctor_Workload DESC;
