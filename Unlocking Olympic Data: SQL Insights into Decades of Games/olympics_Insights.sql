#1. How many olympics games have been held?

SELECT COUNT(DISTINCT(Games)) AS Olympic_games 
FROM `olympics_history`;

#2. List down all Olympics games held so far. Order the result by year.

SELECT DISTINCT Games
FROM olympics_history
ORDER BY Year;

#3. Mention the total number of nations who participated in each olympics game?. Order the results by games.

SELECT Games AS games, COUNT(DISTINCT NOC) AS total_countries
FROM (
    SELECT DISTINCT Games, NOC
    FROM olympics_history
) AS distinct_data
GROUP BY Games
ORDER BY Games;
 

#4. Which nation has participated in all of the olympic games? and order the output by first column which is fetched

SELECT NOC, COUNT(DISTINCT Games) AS ParticipatedGames
FROM olympics_history
GROUP BY NOC
HAVING ParticipatedGames = (SELECT COUNT(DISTINCT Games) FROM olympics_history)
ORDER BY NOC;

#5. How many unique athletes have won a gold medal in the Olympics?

SELECT COUNT(DISTINCT Name) AS Unique_Gold_Medal_Athletes
FROM olympics_history
WHERE Medal = 'Gold';

#6. Which Sports were just played only once in the olympics? and Order the output by Sports. output should include number of games.

SELECT Sport, COUNT(DISTINCT Games) AS NumberOfGames
FROM olympics_history
GROUP BY Sport
HAVING COUNT(DISTINCT Games) = 1
ORDER BY Sport;

#7. Fetch the total number of sports played in each olympic games. Order by no of sports by descending.

SELECT Games, COUNT(DISTINCT Sport) AS Total_Sports_Played
FROM olympics_history
GROUP BY Games
ORDER BY COUNT(DISTINCT Sport) DESC;

#8. Fetch oldest athlete to win a gold medal

SELECT NAME, Age 
FROM olympics_history 
WHERE Medal= 'Gold'
ORDER BY Age DESC 
LIMIT 1;

#9. Top 5 athletes who have won the most gold medals. Order the results by gold medals in descending.

SELECT Name, COUNT(Medal) AS GoldMedals
FROM olympics_history
WHERE Medal = 'Gold'
GROUP BY Name
ORDER BY GoldMedals DESC
LIMIT 5;


#10. Top 5 athletes who have won the most medals (gold/silver/bronze). Order the results by medals in descending.

SELECT Name, COUNT(Medal) AS TotalMedals
FROM olympics_history
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Name
ORDER BY TotalMedals DESC
LIMIT 5;


#11. Top 5 most successful countries in olympics. Success is defined by no of medals won.

SELECT olnr.region AS Country, COUNT(olh.Medal) AS Count_of_Medals 
FROM olympics_history olh 
JOIN olympics_history_noc_regions olnr 
ON olh.NOC = olnr.NOC 
WHERE olh.Medal is NOT NULL
GROUP BY Country 
ORDER BY Count_of_Medals DESC
LIMIT 5;

#12. In which Sport/event, India has won highest medals.

SELECT Sport, Event, COUNT(Medal) AS TotalMedals
FROM olympics_history
WHERE NOC = 'IND' AND Medal IS NOT NULL
GROUP BY Sport, Event
ORDER BY TotalMedals DESC
LIMIT 1;

#13. Break down all olympic games where india won medal for Hockey and how many medals in each olympic games and order the result by no of medals in descending.

SELECT Games, COUNT(Medal) AS TotalMedals
FROM olympics_history
WHERE NOC = 'IND' AND Medal IS NOT NULL AND Event = 'Hockey'
GROUP BY Games
ORDER BY TotalMedals DESC;






