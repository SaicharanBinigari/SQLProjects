**Unlocking Olympic Data: SQL Insights into Decades of Games**

This project focuses on analyzing the 120 years of Olympics history dataset using SQL queries. The dataset consists of two tables: "dataset_olympics.csv" and "noc_region.csv". The "dataset_olympics" table contains information about athletes, their teams, the Olympic Games they participated in, and the medals they won. The "noc_region" table provides the mapping between the National Olympic Committee codes (NOC) and the corresponding regions. By cleaning the dataset using Python and Pandas, the project aims to ensure data quality. Finally data insights are extracted using SQL.

Data Preprocessing:
The initial stage of the project involves preprocessing two distinct datasets that will be used('dataset_olympics' and 'noc_region'). The data cleaning process is crucial before we can proceed to upload these datasets into the database. By doing so, we will be able to perform SQL tasks and conduct further analysis as part of the project.

Data Cleaning for dataset_olympics.csv:
The data_cleaning() function reads data from a 'dataset_olympics'.csv file and performs cleaning operations on the dataset. It creates a copy of the data and drops specific columns, such as 'Height' and 'Weight'. Duplicate rows are also removed. Additionally, missing values in the 'Medal' column are replaced with 'Medal-less', and missing values in the 'Age' column are filled with the median age('24') from the dataset. Finally, the cleaned dataset is saved to a new CSV file named 'olympics_history_cleaned.csv'.

This olympics_history_cleaned table consists following columns :
COLUMN_NAMES :-
ID
Name
Sex
Age
Team
NOC
Games
Year
Season
City
Sport
Event
Medal

Data Preprocessing:
Data Cleaning for noc_region.csv:
The data_cleaning() function reads data from a noc_region.csv file and performs cleaning operations on the dataset. It creates a copy of the data and drops the 'notes' column. The function then renames specific columns, such as 'noc_region' to 'NOC' and 'reg' to 'region'. The cleaned dataset is saved to a new CSV file named 'olympics_history_noc_regions_cleaned.csv'. Finally, the function returns the cleaned dataset for further analysis or processing.

This olympics_history_noc_regions_cleaned table consists following columns :

COLUMN_NAMES:-
NOC
region



Below are the insights that have been addressed as part of this project:-

1.How many olympics games have been held

2.List down all Olympics games held so far. Order the result by year

3.Mention the total number of nations who participated in each olympics game?. Order the results by games

4. Which nation has participated in all of the olympic games? and order the output by first column which is fetched

5. How many unique athletes have won a gold medal in the Olympics

6. Which Sports were just played only once in the olympics? and Order the output by Sports. output should include number of games

7. Fetch the total number of sports played in each olympic games. Order by no of sports by descending

8. Fetch oldest athlete to win a gold medal

9. Top 5 athletes who have won the most gold medals. Order the results by gold medals in descending

10. Top 5 athletes who have won the most medals (gold/silver/bronze). Order the results by medals in descending

11. Top 5 most successful countries in olympics. Success is defined by no of medals won

12. In which Sport/event, India has won highest medals

13. Break down all olympic games where india won medal for Hockey and how many medals in each olympic games and order the result by no of medals in descending

 

