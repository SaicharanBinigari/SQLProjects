
-- 1. Display the states, gender affected and the confirmed cases in their respective states where confirmed cases are more than 100.
-- (Hint: Retrieve states, genders, and confirmed cases from the "death_and_recovery" and "statewisedata" datasets, where confirmed cases exceed 100.)

SELECT DISTINCT STATE, Gender, swd.Confirmed AS Confirmed_Cases
FROM death_and_recovery dr
JOIN
statewisedata swd
ON dr.State = swd.State_UT
WHERE swd.Confirmed >100
ORDER BY Confirmed_Cases DESC;

-- 2. Display the patient status in each state from the death_and_recovery table
-- (Hint: Retrieve the 'Patient_status', 'City', and 'Age' columns from the 'death_and_recovery' table, self-joining the table based on the 'State' column to display the patient status in each state. Also order by state column for the first table.)

SELECT dr1.Patient_status, dr1.City, dr2.Age
FROM death_and_recovery dr1
JOIN death_and_recovery dr2
ON dr1.State = dr2.State
ORDER BY dr1.State;

-- 3. Display the hospital beds along with their location where patients have recovered from covid-19 and those beds are made available to the needy patients waiting in the queue to get admitted.
-- (Hint: Display the "Patient Status," "State," "City," and "Beds_Available" from the "death_and_recovery" and "hospitalbeds" datasets. Filter the results to show hospital beds available in the location where patients have recovered from COVID-19 and are waiting in the queue for admission.)

SELECT dr.Patient_status AS Patient_status, dr.State AS State, dr.City AS City, hb.Beds_Available AS Beds_Available
FROM  death_and_recovery dr
JOIN
hospitalbeds hb
ON dr.State = hb.State_UT
WHERE dr.Patient_status = 'Recovered'
ORDER BY Beds_Available DESC;

-- 4. Display the total number of people in assam who have recovered
-- (Hint: Count the total number of people who have recovered in Assam from the "death_and_recovery" dataset by applying filters)

SELECT COUNT(Patient_status) AS Count_Recovered_People_Assam 
FROM death_and_recovery
WHERE State = "Assam";

-- 5. Show the state, hospitals and beds available where population beds and hospitals available are more than 1000.
-- (Hint: Display the "State_UT," "Hospitals_Available," and "Beds_Available" from the "hospitalbeds" dataset. Filter the results to show states, hospitals, and beds where both hospitals available and population beds available are more than 1000.)

SELECT State_UT, Hospitals_Available, Beds_Available
from hospitalbeds
WHERE Hospitals_Available >1000 AND Population_beds > 1000;

-- 6. Show states where active cases are less than 50

SELECT State_UT, Active AS Active_Cases 
FROM statewisedata
WHERE Active < 50;

-- 7. Show the details of the number of samples tested across each timestamp
-- (Hint: Retrieve the 'UpdatedTimeStamp' and 'TotalSamplesTested' columns from the 'icmrtestingdata' table to show the details of the number of samples tested across each timestamp.)

SELECT UpdatedTimeStamp, TotalSamplesTested
FROM icmrtestingdata;

-- 8. Display the number of males and females who have recovered

SELECT Gender, Count(Patient_status) AS Number_of_patients_recovered
FROM death_and_recovery
GROUP BY Gender;

-- 9. List the states where the population is greater than the number of beds available in descending order of serial number
-- (Hint: Retrieve the 'State_UT' and 'Beds_Available' columns from the 'hospitalbeds' table, where the number of available beds is less than the population. Sort the results in descending order based on the 'sno' column.)

SELECT State_UT, Beds_Available
FROM hospitalbeds
WHERE Beds_Available < Population_beds
ORDER BY sno DESC;

-- 10. What is the total number of samples tested, total number of positive cases, and the difference between the total samples tested and total positive cases in the 'icmrtestingdata' table?
-- (Hint: Retrieve the 'TotalSamplesTested', 'TotalPositiveCases', and the difference between 'TotalSamplesTested' and 'TotalPositiveCases' columns from the 'icmrtestingdata' table.)

SELECT TotalSamplesTested, TotalPositiveCases, (TotalSamplesTested - TotalPositiveCases) AS Remaining_cases
FROM icmrtestingdata
ORDER BY Remaining_cases DESC;

-- 11. Find the number of hospital beds available in each state
-- (Hint:Retrieve the 'Beds_Available' and 'State_UT' columns from the 'hospitalbeds' table, self-joining the table based on the 'State_UT' column to find the number of hospital beds available in each state.)

SELECT State_UT, Beds_Available 
FROM hospitalbeds
ORDER BY Beds_Available DESC;

-- 12.  Display the total number of beds available in Tamil Nadu

SELECT State_UT, Beds_Available 
FROM hospitalbeds
WHERE State_UT = 'Tamil Nadu';

-- 13. Display the total number of beds available in India.

SELECT SUM(Beds_Available) AS Total_Beds_Available_India
FROM hospitalbeds;

-- 14. Display the total number of hospitals available in India.

SELECT SUM(Hospitals_Available) AS Total_no_of_hospitals_available
FROM hospitalbeds;

-- 15. Display the total confirmed cases till 31-March in Maharashtra

SELECT SUM(Maharasthra) as Confirmed_Cases_in_Maharasthra
FROM datewisepatients
WHERE Date <= '31-Mar-20' AND Status = 'Confirmed' ;

-- 16. Display the total percentage of male and female being affected by covid-19 ranging between ‘0-50’

WITH CTE1 AS (
    SELECT COUNT(Gender) AS FemaleCount
    FROM death_and_recovery
    WHERE (Age BETWEEN 0 AND 50) AND Gender = 'F'
),
CTE2 AS (
    SELECT COUNT(Gender) AS MaleCount
    FROM death_and_recovery
    WHERE (Age BETWEEN 0 AND 50) AND Gender = 'M'
)

SELECT (CTE1.FemaleCount * 100.0 / (CTE1.FemaleCount + CTE2.MaleCount)) AS female_percent,
       (CTE2.MaleCount * 100.0 / (CTE1.FemaleCount + CTE2.MaleCount)) AS male_percent
FROM CTE1, CTE2;

-- 17. Find out the recovery rate among the states and display it along with the names of the states and the number of recovered & active cases.

SELECT State_UT, ((Recovered/Confirmed)*100) AS Recovery_rate, Recovered, Active
FROM statewisedata
WHERE State_UT NOT LIKE 'Total'
ORDER BY Recovery_rate DESC;

-- 18. Display the states along with the ratio of Beds available against the total population beds
-- (Hint: Retrieve the 'State_UT', 'Beds_Available', 'Population_beds' columns, and calculate the ratio of 'Beds_Available' against 'Population_beds' from the 'hospitalbeds' table.)

SELECT State_UT, Beds_Available, Population_beds,
(Beds_Available/Population_beds) AS Ratio
FROM hospitalbeds ;

-- 19. Display the status of the patients in all the cities
-- (Hint: Retrieve the distinct 'Patient_status' and 'City' columns from the 'death_and_recovery' table.)

SELECT DISTINCT Patient_Status, City
FROM death_and_recovery;

-- 20. What are the distinct values of 'TotalSamplesTested', 'TotalPositiveCases', and 'UpdatedTimeStamp' in the 'icmrtestingdata' table?

SELECT DISTINCT TotalSamplesTested, TotalPositiveCases, UpdatedTimeStamp
FROM icmrtestingdata;

-- 21. Calculate the summing distribution of males and females aged 0 to 49 who have been impacted by COVID-19.
-- (Hint: Use the SQL aggregate function  to calculate the sum of the "Female" and "Male" columns from the agedistribution_2016_estimates table.. Use the  filter to select the rows based on the desired age groups.)

SELECT 
    SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS FemaleCount,
    SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS MaleCount
FROM death_and_recovery
WHERE Age >= 0 AND Age <= 49;

-- 22. What are the different patient statuses and the corresponding cities recorded in the 'death_and_recovery' table, after joining it with the 'statewisedata' table based on the matching State_UT values?
-- (Hint: Retrieve unique patient statuses and cities from the "death_and_recovery" and "statewisedata" tables by joining them on the state abbreviation. Filter the results by selecting only those with an age that exists in the "death_and_recovery" table.)

SELECT DISTINCT Patient_status, City
FROM death_and_recovery dr JOIN
statewisedata sd ON  dr.State = sd.State_UT
WHERE dr.Age BETWEEN 0 AND 85;