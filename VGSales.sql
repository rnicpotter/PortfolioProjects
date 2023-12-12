--Looking into North American and Global Sales of Video Games 

--CONSTRAINTS WITH THE DATASET
--At this point, the Dataset has not been updated in 7 years, so the reliability of any information past 2016 is questionable
--Link to the Data set: https://www.kaggle.com/datasets/gregorut/videogamesales
--This is a great data set for practice and has some great real-world applications for general understanding of the Video Game market.

-- Ordering the video games by Genre and summing the North American and Global Sales to compare

SELECT Genre, ROUND(SUM(NA_Sales),2) NA_SUM, ROUND(SUM(Global_sales),2) GLOBAL_SUM
FROM VGSales
GROUP BY Genre
ORDER BY 2 DESC,3 DESC

--Showing what percent of the sales can be attributed to North American Sales, by Genre

SELECT Genre, ROUND(SUM(NA_Sales)/SUM(Global_sales),2)*100 PercentGlobalSum
FROM VGSales
GROUP BY Genre
Order by 2 DESC
--North Americans really enjoy Shooter, Platform, and Misc. Games and enjoy Role-Playing games the least, overall

--What percentage of sales can be attributed to North Americans, by year?

SELECT Year, ROUND(SUM(NA_Sales)/SUM(Global_sales),2)*100 PercentGlobalSum
FROM VGSales
GROUP BY Year
Order by 1

--Showing what percent of the sales can be attributed to North American Sales, by Platform


SELECT Platform, ROUND(SUM(NA_Sales)/SUM(Global_sales),2)*100 PercentGlobalSum
FROM VGSales
GROUP BY Platform
Order by 2 DESC

-- Same, but by Publisher

SELECT Publisher, ROUND(SUM(NA_Sales)/SUM(Global_sales),2)*100 PercentGlobalSum
FROM VGSales
GROUP BY Publisher
Order by 2 DESC
-- It's interesting to see the North American and Non-North American companies that have either only NA-sales or no NA-sales

--The most popular selling game in North America. Not a coincidence that this is also Globally True.
SELECT *
FROM VGSales V1
WHERE V1.NA_Sales = (SELECT MAX(VG2.NA_Sales) FROM VGSales as VG2)

SELECT *
FROM VGSales V1
WHERE V1.JP_Sales = (SELECT MAX(VG2.JP_Sales) FROM VGSales as VG2)

--However, not true in Japan!

SELECT *
FROM VGSales V1
WHERE V1.EU_Sales = (SELECT MAX(VG2.EU_Sales) FROM VGSales as VG2)

--Though, still true in the EU.

SELECT *
FROM VGSales V1
WHERE V1.Other_Sales = (SELECT MAX(VG2.Other_Sales) FROM VGSales as VG2)

--Grand Theft Auto: San Andreas is the most sold game in the rest of the world, suprisingly. This is a great game, but I expected a different title!



