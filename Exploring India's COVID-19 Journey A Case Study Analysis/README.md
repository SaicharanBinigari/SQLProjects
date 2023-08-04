
**About the project:**

Decoding COVID-19: India's Case Study" is a comprehensive analysis project that utilizes multiple datasets. It explores age-wise distribution, confirmed cases, recoveries, and daily decreases. Additionally, it examines state-wise data on cases, death and recovery status, available hospital beds, testing data, and population distribution. By uncovering insights from these datasets, this study aims to provide a comprehensive understanding of the COVID-19 situation in India, enabling informed decision-making and effective strategies to combat the pandemic.

Dataset overview:
The agedistribution_2016_estimates that has age wise distribution.

The datewisepatients that has the number of cases date wise in each state.

The death_and_recovery that has death and recovery status.

The hospitalbeds that has number of beds available in state.

The icmrtestingdata that has data of number of sample tested.

The statewisedata that has state wise data of positive and recovered cases.

Module 1: Cleaning the dataset
Module 2: Run SQL queries 

Data Preprocessing:
To begin the project, the first step is to preprocess the available datasets. There are six datasets in total, out of which four datasets require cleaning, while the remaining two are already in suitable condition. Initially, we will focus on making the necessary changes and cleaning the four datasets using Python. Once the cleaning process is complete, we will upload all six datasets, including the four cleaned datasets, into the database. This will enable us to proceed with SQL tasks and further analysis for the project.

Data Cleaning for agedistribution_2016_estimates.csv:
Data Cleaning for 'agedistribution_2016_estimates' is a process of renaming the appropriate columns in a dataset containing data. This improves the quality and usability of the data for analysis and modeling purposes.

Data Cleaning for death_and_recovery.csv:
Removing Unwanted Columns :
Data cleaning for ""death_and_recovery"" involves removing unwanted columns from a dataset. For the purposes of analysis and modelling, this enhances the quality and usability of the data.

Data Cleaning for hospitalbeds.csv:
Data Cleaning for 'hospitalbeds' is a process of renaming the appropriate columns in a dataset containing data. This improves the quality and usability of the data for analysis and modeling purposes.

Data Cleaning for statewisedata.csv:
Removing Unwanted Columns :
Data cleaning for """statewisedata""" involves removing unwanted columns from a dataset. For the purposes of analysis and modelling, this enhances the quality and usability of the data.

Following are the final tables that are considered after cleaning the datasets:

agedistribution_2016_estimates
death_and_recovery
hospitalbeds
datewisepatients
icmrtestingdata
statewisedata

Below are the Insights that have need to be gathered as part of this project:

-- 1. Display the states, gender affected and the confirmed cases in their respective states where confirmed cases are more than 100.
-- (Hint: Retrieve states, genders, and confirmed cases from the "death_and_recovery" and "statewisedata" datasets, where confirmed cases exceed 100.)

-- 2. Display the patient status in each state from the death_and_recovery table
-- (Hint: Retrieve the 'Patient_status', 'City', and 'Age' columns from the 'death_and_recovery' table, self-joining the table based on the 'State' column to display the patient status in each state. Also order by state column for the first table.)

-- 3. Display the hospital beds along with their location where patients have recovered from covid-19 and those beds are made available to the needy patients waiting in the queue to get admitted.
-- (Hint: Display the "Patient Status," "State," "City," and "Beds_Available" from the "death_and_recovery" and "hospitalbeds" datasets. Filter the results to show hospital beds available in the location where patients have recovered from COVID-19 and are waiting in the queue for admission.)


-- 4. Display the total number of people in assam who have recovered
-- (Hint: Count the total number of people who have recovered in Assam from the "death_and_recovery" dataset by applying filters)


-- 5. Show the state, hospitals and beds available where population beds and hospitals available are more than 1000.
-- (Hint: Display the "State_UT," "Hospitals_Available," and "Beds_Available" from the "hospitalbeds" dataset. Filter the results to show states, hospitals, and beds where both hospitals available and population beds available are more than 1000.)

-- 6. Show states where active cases are less than 50

-- 7. Show the details of the number of samples tested across each timestamp
-- (Hint: Retrieve the 'UpdatedTimeStamp' and 'TotalSamplesTested' columns from the 'icmrtestingdata' table to show the details of the number of samples tested across each timestamp.)

-- 8. Display the number of males and females who have recovered

-- 9. List the states where the population is greater than the number of beds available in descending order of serial number
-- (Hint: Retrieve the 'State_UT' and 'Beds_Available' columns from the 'hospitalbeds' table, where the number of available beds is less than the population. Sort the results in descending order based on the 'sno' column.)

-- 10. What is the total number of samples tested, total number of positive cases, and the difference between the total samples tested and total positive cases in the 'icmrtestingdata' table?
-- (Hint: Retrieve the 'TotalSamplesTested', 'TotalPositiveCases', and the difference between 'TotalSamplesTested' and 'TotalPositiveCases' columns from the 'icmrtestingdata' table.)

-- 11. Find the number of hospital beds available in each state
-- (Hint:Retrieve the 'Beds_Available' and 'State_UT' columns from the 'hospitalbeds' table, self-joining the table based on the 'State_UT' column to find the number of hospital beds available in each state.)

-- 12.  Display the total number of beds available in Tamil Nadu

-- 13. Display the total number of beds available in India.

-- 14. Display the total number of hospitals available in India.

-- 15. Display the total confirmed cases till 31-March in Maharashtra

-- 16. Display the total percentage of male and female being affected by covid-19 ranging between ‘0-50’

-- 17. Find out the recovery rate among the states and display it along with the names of the states and the number of recovered & active cases.

-- 18. Display the states along with the ratio of Beds available against the total population beds
-- (Hint: Retrieve the 'State_UT', 'Beds_Available', 'Population_beds' columns, and calculate the ratio of 'Beds_Available' against 'Population_beds' from the 'hospitalbeds' table.)

-- 19. Display the status of the patients in all the cities
-- (Hint: Retrieve the distinct 'Patient_status' and 'City' columns from the 'death_and_recovery' table.)

-- 20. What are the distinct values of 'TotalSamplesTested', 'TotalPositiveCases', and 'UpdatedTimeStamp' in the 'icmrtestingdata' table?

-- 21. Calculate the summing distribution of males and females aged 0 to 49 who have been impacted by COVID-19.
-- (Hint: Use the SQL aggregate function  to calculate the sum of the "Female" and "Male" columns from the agedistribution_2016_estimates table.. Use the  filter to select the rows based on the desired age groups.)

-- 22. What are the different patient statuses and the corresponding cities recorded in the 'death_and_recovery' table, after joining it with the 'statewisedata' table based on the matching State_UT values?
-- (Hint: Retrieve unique patient statuses and cities from the "death_and_recovery" and "statewisedata" tables by joining them on the state abbreviation. Filter the results by selecting only those with an age that exists in the "death_and_recovery" table.)
