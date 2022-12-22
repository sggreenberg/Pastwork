--1. List all columns and all rows from the StockData table.
SELECT * 
FROM StockData;
--2. List the TickerSymbol, Industry, TradeDate and the Volume columns from the StockData table.  List all rows.
SELECT TickerSymbol, Industry, TradeDate, Volume
	FROM StockData;
--3. List all company information attributes for companies incorporated in Texas. 
SELECT *
	FROM CompanyInformation
	WHERE State = 'TX';
--4. List the TickerSymbol, Industry, TradeDate and the Volume columns from the StockData table.  List only the rows that have a volume of more than thirty million shares traded.
SELECT TickerSymbol, Industry, TradeDate, Volume
	FROM StockData
	WHERE Volume >30000000;
--5. List the TickerSymbol, Industry, TradeDate and the Volume columns from the StockData table.  List only the rows that have a volume of more than thirty million shares traded.  Arrange the answer in TickerSymbol order.  This means for example that British Petroleum should appear before Sunoco.
SELECT TickerSymbol, Industry, TradeDate, Volume
	FROM StockData
	WHERE Volume > 30000000
ORDER BY TickerSymbol;
--6. List the TickerSymbol, Industry, TradeDate and the Volume columns from the StockData table.  List only the rows that have a volume of more than thirty million shares traded.  Arrange the answer in TickerSymbol order and then in TradeDate order.  This means that for a given stock, trading days should appear in chronological order.
SELECT TickerSymbol, Industry, TradeDate, Volume 
	FROM StockData
	WHERE Volume > 30000000
ORDER BY TickerSymbol, TradeDate;
--7. List the price ID, opening price, and closing price of all stocks who have an opening price smaller than 120 dollars and a closing price greater than 120 dollars.  List the opening and closing prices in ascending order.
SELECT PriceID, ST_OPEN, ST_Close
	FROM StockData
	WHERE ST_Open < 120 AND ST_Close > 120
ORDER BY ST_Open, ST_Close;
--8. List the Price ID's in ascending order and the open prices of all the stocks that have an open price between 20 and 21 dollars.
SELECT PriceID, ST_Open
	FROM StockData
	WHERE ST_Open BETWEEN 20 AND 21
ORDER BY PriceID;
--9. List the price ID, stock high and stock low of all stocks that have a stock high above 130. Also list the same information for all stocks that have a stock low below 5.  List the high and low stocks by ascending order.
SELECT PriceID, ST_High, ST_Low
	FROM StockData
	WHERE ST_High > 130 OR ST_Low < 5
ORDER BY ST_High, ST_Low;
--10. List the TickerSymbol, Industry, TradeDate, the opening stock price and the closing stock price.  List only those trading days that occurred in the year 2018.  Arrange the answer in order of the trade dates which means that for a given stock, trading days should appear in chronological order.
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE YEAR(TradeDate) = 2018
ORDER BY TradeDate;
--11. List the TickerSymbol, Industry, TradeDate, the opening stock price and the closing stock price.  List only those trading days that occurred in the year 2018.  Arrange the answer in order of the industry, the ticker symbol, and then by the trade dates.  Please use the "greater than" and "less than" operators for this answer. 
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE YEAR(TradeDate) > 2017 AND YEAR(TradeDate) < 2019
ORDER BY Industry, TickerSymbol, TradeDate;
--12. List the TickerSymbol, Industry, TradeDate, the opening stock price and the closing stock price.  List only those trading days that occurred in the year 2018.  Arrange the answer in order of the industry, the ticker symbol, and then by the trade dates.  Please use "between" for this answer.
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE TradeDate BETWEEN '1/1/2018' AND '1/1/2019'
ORDER BY Industry, TickerSymbol, TradeDate;
--13. List the trade dates and low stock prices of all stocks that were traded in 2018.  List the trade dates in ascending order.
SELECT TradeDate, ST_Low
	FROM StockData
	WHERE YEAR(TradeDate) = 2018
ORDER BY TradeDate;
--14. List the TickerSymbol, TradeDate and the closing stock price.  List only Microsoft tuples that occurred between January 1, 2005 and June 1, 2018.  Arrange the answer in order of the ticker symbol, trade dates and then the closing price.
SELECT TickerSymbol, TradeDate, ST_Close
	FROM StockData
	WHERE TickerSymbol = 'MSFT' AND TradeDate BETWEEN '1/1/2005' AND '6/1/2018'
ORDER BY TickerSymbol, TradeDate, ST_Close;
--15. List the TickerSymbol, TradeDate and the closing stock price.  List only Microsoft tuples that occurred in on dates other than the range January 1, 2005 to June 1, 2018.  Arrange the answer in order of the ticker symbol, trade dates and then the closing price.
SELECT TickerSymbol, TradeDate, ST_Close
	FROM StockData
	WHERE TickerSymbol = 'MSFT' AND (YEAR(TradeDate) < 2005 OR YEAR(TradeDate) > 2018-06-01)
ORDER BY TickerSymbol, TradeDate, ST_Close;
--16. List the TickerSymbol, Industry,TradeDate, the opening price and the closing stock price.  List only the ‘WFM’ and ‘XOM’ ticker symbols.  Arrange the answer in order of the ticker symbol, Industry and the trade dates.
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close 
	FROM StockData
	WHERE TickerSymbol = 'WFM' OR TickerSymbol = 'XOM'
ORDER BY TickerSymbol, Industry, TradeDate;
--17. List the trade dates, stock highs and stock lows of all stocks that either had a stock high over 130 dollars and were traded before December 31st, 2014, or stocks that were traded after December 31st 2018 and had a stock low below 5 dollars.  List the stock highs and lows in descending order.
SELECT TradeDate, ST_High, ST_Low
	FROM StockData
	WHERE (ST_High > 130 AND TradeDate < '12/31/2014')
	OR
	(ST_Low < 5 AND TradeDate > '12/31/2018')
ORDER BY ST_High DESC, ST_Low DESC;
--18. Return all attributes for stocks that have the MSFT ticker symbol and have a high stock price below 20 dollars or a low stock price above 50 dollars.  List the high and low stock prices in ascending order.
SELECT *
	FROM StockData
	WHERE (TickerSymbol = 'MSFT') AND (ST_High < 20 OR ST_Low > 50) 
ORDER BY ST_High, ST_Low;
--19. List the Price ID of all stocks that have a volume of 0.  List the Price IDs in descending order.
SELECT PriceID
	FROM StockData
	WHERE Volume = 0
ORDER BY PriceID DESC;
--20. Return all attributes for stocks that have a closing price between 24 and 25 dollars.  List the closing prices in descending order.
SELECT *
	FROM StockData
	WHERE ST_Close BETWEEN 24 AND 25
ORDER BY ST_Close DESC;
--21. List the Price ID's in descending order of all the stocks that close with a price greater than 90 dollars and less than 100 dollars.
SELECT PriceID
	FROM StockData
	WHERE ST_Close > 90 AND ST_Close < 100
ORDER BY PriceID DESC;
--22. List the volumes in descending order of all the stocks that have an opening price greater than or equal to 100 but with a closing price not equal to 120 dollars.
SELECT Volume, ST_Open, ST_Close
	FROM StockData
	WHERE (ST_Open >= 100) AND (ST_Close != 120)
ORDER BY Volume DESC;
--23.  Return all attributes for stocks that have been traded in the month of June in 2018.  List the trade date in descending order.
SELECT *
	FROM  StockData
	WHERE MONTH(TradeDate) = 6 AND YEAR(TradeDate) = 2018
ORDER BY TradeDate DESC;
--24. List the Price ID and TradeDate and stock high of all stocks that were traded before October 3rd, 2018 and had a stock high over 125 dollars. List the stock highs in descending order.
SELECT PriceID, TradeDate, ST_High
	FROM StockData
	WHERE (TradeDate < '10/3/2018') AND (ST_High > 125)
ORDER BY ST_High DESC;
--25. List the closing prices in descending order of all the closing stock prices that were below 10 dollars and were traded before January 1st, 2017.
SELECT ST_Close, TradeDate
	FROM StockData
	WHERE ST_Close < 10 AND YEAR(TradeDate)<2017
ORDER BY ST_Close DESC;
--26. List the TickerSymbol, Industry, TradeDate, the opening stock price and the closing stock price.  List only stocks that include the word "oil" in the industry description.  Arrange the answer in order of the industry, the ticker symbol, and then by the trade dates.
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE Industry LIKE '%OIL%'
ORDER BY Industry, TickerSymbol, TradeDate;
--27. List the TickerSymbol, Industry, TradeDate, the opening stock price and the closing stock price.  List only stocks that do not include the word "oil" in the industry description.  Arrange the answer in order of the industry, ticker symbol, and then by the trade dates.
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE Industry NOT LIKE '%OIL%'
ORDER BY Industry, TickerSymbol, TradeDate;
--28. List all of the ticker symbols containing the letter S.
SELECT TickerSymbol	
	FROM StockData
	WHERE TickerSymbol LIKE '%S%';
--29. Please list the first three characters of the TickerSymbol attribute for the CompanyInformation table.
SELECT LEFT(TickerSymbol, 3) AS FirstThree
	FROM CompanyInformation;
--30. List the Price IDs and stock highs over 130 dollars rounded to the nearest penny.
SELECT PriceID, ROUND(ST_High,2) AS RoundedStockHighsToNearestPenny
	FROM StockData
	WHERE ST_High > 130;
--31. List the price ID and the high stock price of the two stocks with the most expensive high prices that are still less than $ 100.
SELECT TOP 2 (ST_High), PriceID
	FROM StockData 
	WHERE ST_High < 100
ORDER BY ST_High DESC;	
--32. List the ten largest differences (from greatest to least) between a daily high and low stock price along with the accompanying TickerSymbol, Industry, and TradeDate.
SELECT TOP 10 (ST_High - ST_Low) AS DailyHighLowDifference, TickerSymbol, Industry, TradeDate
	FROM StockData
ORDER BY (ST_High - ST_Low) DESC;
--33. List the sum of all the low stock prices that are above 60 dollars.  Call it TotalLowStockPriceOfStocksUnder60.
SELECT SUM(ST_Low) AS TotalLowStockPriceOfStocksUnder60
	FROM StockData
	WHERE ST_Low > 60;
--34. List the highest Price ID with a low stock price under 80 dollars.
SELECT TOP 1 PriceID
	FROM StockData
	WHERE ST_Low < 80
ORDER BY PriceID DESC;
--35. List the most recent trade date of a stock that ended up having a low under 5 dollars.  Call it MostRecentTradeDateWithLowUnder5.
SELECT TradeDate AS MostRecentTradeDateWithLowUnder5
	FROM StockData
	WHERE ST_Low < 5
ORDER BY MostRecentTradeDateWithLowUnder5 DESC;
--36. List the earliest trade date of the stock that ended up having a high over 100 dollars.  Call it EarliestTradeDateWithHighOver100.
SELECT MIN(TradeDate) AS EarliestTradeDateWithHighOver100
	FROM StockData
	WHERE ST_High > 100;
--37. List each ticker symbol and the average daily trade volume for that stock. Order the list from highest to least daily trade volume.
SELECT TickerSymbol, AVG(Volume) OVER (PARTITION BY TickerSymbol, TradeDate ORDER BY Volume) AS DailyAvgVol, TradeDate
	FROM StockData;
--38. List the highest high price of all the stocks that have been traded in 2018 and have a low price less than 100 dollars.
SELECT MAX(ST_High)
	FROM StockData
	WHERE YEAR(TradeDate) = 2018 AND ST_Low < 100;
--39. List the number of trade dates of stocks that were traded in the month of August in 2018.
SELECT COUNT(DISTINCT TradeDate)
	FROM StockData
	WHERE YEAR(TradeDate)=2018 AND MONTH(TradeDate) = 8 AND VOLUME > 0;
--40. List the number of stocks that have an opening price of 70 dollars and were traded in 2018.  Call it NumberOfOpeningPricesOf70In2018.
SELECT COUNT(TickerSymbol)
	FROM StockData
	WHERE ST_Open = 70 AND YEAR(TradeDate) = 2018;
--41. List the industry and the number of different companies in each industry. 
SELECT Industry, TickerSymbol, COUNT(TickerSymbol) OVER (PARTITION BY Industry ORDER BY COUNT(TickerSymbol)) AS CompPerInd
	FROM StockData
GROUP BY Industry, TickerSymbol;
--42. List the industry and the number of different companies in each industry. Put the answer in order of most stocks to least stocks.
SELECT Industry, TickerSymbol, COUNT(TickerSymbol) OVER(PARTITION BY Industry ORDER BY COUNT(TickerSymbol) DESC) AS CompPerInd 
	FROM StockData
GROUP BY Industry, TickerSymbol
ORDER BY Industry;
--43. List the industry and the number of different companies in each industry for only those industries that have more than three companies.. 
SELECT Industry, COUNT(TickerSymbol) AS CompPerInd
	FROM CompanyInformation
GROUP BY Industry
HAVING COUNT(TickerSymbol)>3;
--44. List the ten most common closing prices along with the number of times each occurs.
SELECT TOP 10 COUNT(ST_Close) AS [Count], ST_Close
	FROM StockData
GROUP BY ST_Close
ORDER BY [Count] DESC;
--45. What is today’s date?
SELECT CAST(GETDATE() AS DATE);
--46. How many minutes difference is there between the oldest and youngest members of your group?
SELECT DATEDIFF(MINUTE, '10/03/1992','3/1/1996');
--47. How much older is Rasputin (‘1/01/1869’) than Tommy Lee, '10/03/1962') in seconds?
SELECT DATEDIFF_BIG(ss, '1/1/1869', '10/03/1962');  
--48. Add a new row to the Stock Data table.  This stock should have the Microsoft ticker symbol (MSFT) in the Tech Industry.  The stock was traded on May 5, 2017.  It had an opening price of 68.90, a high price of 69.03, a low price of 68.48, a closing price of 69, and a volume of 19,128,782.
INSERT INTO StockData 
VALUES(410322, 'MSFT', 'Tech', '5/5/2017', 68.90, 69.03, 68.48, 69, 19128782); 
--49. It’s January 30, 2017 and you need to add information to the Stock Data table for Microsoft on that date.  You have to wait until the end of the day before you can put any of the prices because you don't know the closing price yet.  For now just add Microsoft's trade date, Industry, and ticker symbol to the table.
INSERT INTO StockData (TickerSymbol, Industry, TradeDate)
VALUES ('MSFT', 'Tech', '1/30/2017');
--50. Remove all the rows of stocks that were traded before January 1st, 2001 for Microsoft.
DELETE
	FROM StockData
	WHERE (TradeDate < '1/1/2001') AND (TickerSymbol = 'MSFT');
--51. Make a change for the Microsoft row for April 1st, 2018.  Change the opening stock price to 55.1, the high price to 56.26, the low price to 55.55, and the closing stock price to 55.95, and the volume to 24,298,620. 
MERGE INTO StockData
USING (VALUES (NULL, 'MSFT', NULL, '2018-04-01 00:00:00', 55.1, 56.26, 55.55, 55.95, 24298620))
       AS Source (NewPID, NewTS, NewI, NewTD, NewO, NewH, NewL, NewC, NewV)  
ON StockData.TickerSymbol = Source.NewTS AND StockData.TradeDate = Source.NewTD  
WHEN MATCHED THEN  
UPDATE SET ST_Open = Source.NewO, ST_High = Source.NewH, ST_Low = Source.NewL, ST_Close = Source.NewC, Volume = Source.NewV; 
--52. Remove all the rows of stocks of Microsoft that were traded during the month of October in the year 2018.
Delete
	FROM StockData
	WHERE YEAR(TradeDate) = 2018 AND MONTH(TradeDate) = 10;
--53. From the stock data table please list the ticker symbol, date, opening and closing stock prices, and day type of all stocks that were traded on a Holiday in 2018.  
SELECT StockData.TickerSymbol, StockData.TradeDate, StockData.ST_Open, StockData.ST_Close, Calendar.DayType
	FROM StockData, Calendar
	WHERE Calendar.DayType = 'Holiday' AND Calendar.ActualDate = StockData.TradeDate;
--54. List every date that falls on a Friday from the Calendar table regardless of whether there are matching rows from the Stock Data table.
SELECT ActualDate
	FROM Calendar
	WHERE [DayOfWeek] = 'Friday';
--55. List the day of week and every date that falls on a weekend from the Calendar table and all rows from the Stock Data table.
SELECT StockData.*, Calendar.DayOfWeek, Calendar.ActualDate, Calendar.DayType
	FROM StockData, Calendar
	WHERE Calendar.DayType = 'Weekend';
--56. List the ticker symbol and the percentage of each ticker symbol's total number of trading days to the total number of days for all stocks.
SELECT TickerSymbol, CAST(COUNT(*) AS DECIMAL(21,13))/
	(SELECT CAST(COUNT(*) AS DECIMAL(21,13))
		FROM StockData) AS PercentOfTotal
	FROM StockData
GROUP BY TickerSymbol
ORDER BY PercentOfTotal DESC;
--57. List the trade dates in descending order and open price in ascending order of all the stocks that open with a price greater than the average open price.
SELECT TradeDate, ST_Open
FROM StockData
WHERE ST_Open >
(SELECT AVG(ST_Open)
FROM StockData)
ORDER BY TradeDate DESC, ST_Open;
--58. List the number of stocks that have a greater than average high price that were traded on March 9th, 2018.  Call it NumberOfStocksAboveAverageHighIn2018.
SELECT COUNT(ST_High) AS NumberOfStocksAboveAverageHighIn2018
      FROM StockData
      WHERE ST_High >
      (SELECT AVG(ST_High)
            FROM StockData
            WHERE TradeDate = '03/09/2018');
--59. List the ticker symbol and the average closing for a stock that has the largest average closing price. 
SELECT TickerSymbol, AVG(ST_Close) AS LargestAvgClose
	FROM StockData
GROUP BY TickerSymbol
HAVING AVG(ST_Close) >= ALL
	(SELECT AVG(ST_Close)
		FROM StockData
	GROUP BY TickerSymbol);
--60. List the ticker symbol, the industry (only for the tech industry) , the row number and the closing stock price such that the highest prices are listed first and the lowest prices are listed last.
SELECT TickerSymbol, Industry, ROW_NUMBER() OVER(ORDER BY ST_Close DESC) AS 'Row Number', ST_Close
	FROM StockData
	WHERE Industry = 'Tech';
--61. List each ticker symbol and the average daily trade volume for that stock on Fridays. Order the list from highest to least daily trade volume.
SELECT StockData.TickerSymbol, Calendar.DayOfWeek, AVG(StockData.Volume)
	FROM StockData, Calendar
	WHERE Calendar.DayOfWeek = 'Friday'
GROUP BY StockData.TickerSymbol, Calendar.DayOfWeek;
--62. List each ticker symbol, day of the week, and the average daily trade volume for that stock on each day of the week. Order the list by ticker symbol and then by highest to least daily trade volume.
SELECT TickerSymbol, [DayOfWeek], AVG(Volume)
	FROM StockData AS sd JOIN Calendar AS cal
	ON (sd.TradeDate = cal.ActualDate) 
GROUP BY TickerSymbol, [DayOfWeek], Volume
ORDER BY TickerSymbol,  Volume DESC;
--Cleaning, Exploring, and Validating Data
--When you are given a new data set, or when you load one into a database, it can be extremely helpful to verify that the data make sense before running any analytical queries. If you had just imported StockData, the following steps would be useful to explore the data.
--63. List 1000 rows of the table to see what the data look like. (On a production server, you would not select the entire table, but a limited number of rows. Otherwise you risk slowing down the server, particularly if the table is very large.)
--Note:  this can also be done by right-clicking on the table name in SSMS and selecting “Select Top 1000 Rows”
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [PriceID]
      ,[TickerSymbol]
      ,[Industry]
      ,[TradeDate]
      ,[ST_Open]
      ,[ST_High]
      ,[ST_Low]
      ,[ST_Close]
      ,[Volume]
  FROM [scottgreenberg].[dbo].[StockData];
--64. Look for missing data by listing any rows in StockData that contain nulls.
SELECT * 
	FROM StockData
		WHERE PriceID IS NULL OR TickerSymbol IS NULL OR Industry IS NULL OR ST_Open IS NULL OR ST_High IS NULL	OR ST_Low IS NULL OR ST_Close IS NULL OR Volume IS NULL;
--65. List all rows where the high stock price for the day is not at least as high as the low for that day. There should not be any rows where this is the case.
SELECT *, RANK() OVER (PARTITION BY TradeDate ORDER BY TickerSymbol)
	FROM StockData
	WHERE ST_High < ST_Low;
--66. List all rows where any of the stock prices are zero.
--•	Delete all rows with impossible (zero) values.
--•	Try to find the correct values and correct the records.
--•	Set the offending values to null, meaning you don’t know the correct value.
SELECT *
	FROM StockData
	WHERE ST_Close = 0 OR ST_High = 0 OR ST_Low = 0 OR ST_Open = 0;
--67. Set any opening stock prices that are zero to null.
UPDATE StockData
	SET ST_Open = NULL
		WHERE ST_Open = 0;
--68. List the largest single-day stock price increase for Ford (between the market opening and closing).
SELECT MAX(ST_Open - ST_Close)
	FROM StockData
	WHERE TickerSymbol = 'F';
--69. List the lowest opening price for Ford stock in 2015.
SELECT MIN(ST_Low)
	FROM StockData
	WHERE TickerSymbol = 'F' AND YEAR(TradeDate)=2015;
--70. List the highest closing price for Ford in 2018.
SELECT MAX(ST_Close)
	FROM StockData
	WHERE YEAR(TradeDate)= 2018 AND TickerSymbol = 'F';
--71. List the number of days in the table when a trade occurred (when the trade volume for any stock wasn’t zero).
SELECT COUNT(DISTINCT TradeDate)
	FROM StockData
	WHERE Volume > 0;
--72. List the industries in alphabetical order and the number of companies in each industry in the table.
SELECT DISTINCT Industry, COUNT(TickerSymbol) OVER (PARTITION BY Industry ORDER BY Industry DESC) AS CompPerInd 
	FROM CompanyInformation;
--73. Suppose we have a theory that stocks dropped in value after September 11, 2001. List the minimum closing price of Ford stock in September 2001 before September 11.
SELECT MIN(ST_Low) AS MinSTB4NineEleven
	FROM StockData
	WHERE TradeDate < '20010911' AND TradeDate > '20010831' AND TickerSymbol = 'F';
--74. Now list the minimum closing price of Ford stock in September 2001 after September 11.
SELECT MIN(ST_Close) AS Minimum, TradeDate
	FROM StockData
	WHERE TradeDate BETWEEN '9/11/2001' AND '9/30/2001' AND TickerSymbol = 'F'
GROUP BY TradeDate;
--75. List the ticker symbols and the average price multiplied by volume for each ticker symbol in 2018. Use the closing price of as the price for the entire day. List the ticker symbol with the highest average price times volume first.
SELECT TickerSymbol, AVG(ST_Close*Volume)AS AvgPSpentTwentyEighteenPer
	FROM StockData
	WHERE YEAR(TradeDate) = 2018
GROUP BY TickerSymbol, ST_Close, Volume
ORDER BY AVG(ST_Close*Volume) DESC;
--76. List the months of the year and their corresponding average closing prices of Ford stock. List the months with the lowest average closing prices first.
SELECT AVG(ST_CLose) AS AvgClose, MONTH(TradeDate) AS [Month]
	FROM  StockData
	WHERE TickerSymbol = 'F'
GROUP BY MONTH(TradeDate)
ORDER BY AvgClose;
--77. List the number of trade days in each month of 2018. Sort the list from least to greatest number of trade days.
SELECT DATENAME(mm, TradeDate) AS MonthOfYear, COUNT(DISTINCT(TradeDate)) AS
TradeDays
	FROM StockData
	WHERE Volume > 0 AND TradeDate > '20171231' AND TradeDate < '20190101'
GROUP BY DATENAME(MONTH, TradeDate)
ORDER BY COUNT(DISTINCT(TradeDate));
--78. List the number of trade days in each month of 2018. Also include the average trade volume for each month. Sort the list from least to greatest number of trade days.
SELECT COUNT(DISTINCT TradeDate) AS [Count], AVG(Volume) AS Vol
	FROM  StockData
	WHERE YEAR(TradeDate) = 2018
GROUP BY MONTH(TradeDate) 
ORDER BY [Count];
--79. List the ticker symbol, year, and the average price multiplied by volume for each year for Apple stock. Use the closing price of as the price for the entire day. 
SELECT DISTINCT YEAR(TradeDate) AS YearTD, TickerSymbol, AVG(ST_Close*Volume) OVER (PARTITION BY YEAR(TradeDate) ORDER BY YEAR(TradeDate)) AS AvgPYearAAPL
	FROM StockData
	WHERE TickerSymbol = 'AAPL'
GROUP BY TradeDate, TickerSymbol, ST_Close, Volume;
--80. List the industries in alphabetical order and the number of companies in each industry in the table. Also include the range of dates and the number of unique dates for each industry.
SELECT COUNT(DISTINCT(TradeDate)) AS UniqueDates, MIN(TradeDate) AS StartDate, MAX(TradeDate) AS RecentDate, Industry, COUNT(DISTINCT(TickerSymbol)) AS [Count]
	FROM StockData
GROUP BY Industry
ORDER BY Industry;
--81. List the industries in alphabetical order and the number of companies in each industry in the table. Also include the ratio of unique dates to the range of dates for each industry.
SELECT CompanyInformation.Industry, COUNT(CompanyInformation.CompanyName) AS NumCompanyPerIndustry,
	(COUNT(DISTINCT(StockData.TradeDate))/COUNT(StockData.TradeDate)) AS DateRatio
	FROM CompanyInformation
	JOIN StockData ON CompanyInformation.TickerSymbol = StockData.TickerSymbol
GROUP BY CompanyInformation.Industry;
--82. List the five rows with the highest ratio of daily high stock price to daily low stock price.
SELECT TOP 5 *
	FROM StockData
ORDER BY (ST_High - ST_Low) DESC;
--83. List the total selling price of the shares above if you sold them at the daily high price on the same day.
SELECT TOP 1 (2000/ST_Low * ST_High) AS SharesPurchased
	FROM StockData
ORDER BY (ST_High/ST_Low) DESC;
--84. On October 9, 2012, you think the stock market is healthy and you decide to purchase your 200 shares of each stock back. How much will this cost?
SELECT SUM(ST_Open*200) AS StockSum
	FROM StockData
	WHERE TradeDate = '10/9/2012';
--85. List the all of the ticker symbols containing the letter S and their average closing price in 2018.
SELECT DISTINCT TickerSymbol, AVG(ST_Close) AS AvgClwS
	FROM StockData
	WHERE TickerSymbol LIKE '%S%' AND YEAR(TradeDate) = 2018
GROUP BY TickerSymbol;		  
--86. List the number of times you could have made at least a 10% profit by purchasing stocks at its lowest price for the day and selling the stock at its highest price for the day.
SELECT COUNT(*)
	FROM StockData
	WHERE ST_High >= ST_Low*1.1;
--87. List the records on which you could have made at least a 10% profit by purchasing stocks at its lowest price for the day and selling the stock at its highest price for the day.
SELECT *
	FROM StockData
	WHERE ST_High >= 1.1*ST_Low; 
--88. List the relevant ticker symbols and the number of times you could have made at least a 10% profit on that stock by purchasing the stock at its lowest price for the day and selling the stock at its highest price for the day. List the ticker symbol for which this occurs most frequently first.
SELECT COUNT(*) AS cnt, TickerSymbol
	FROM StockData
	WHERE ST_High >= ST_Low*1.1
GROUP BY TickerSymbol
ORDER BY cnt DESC;
--89. List the relevant ticker symbols and the number of times you could have had at least a 10% loss on that stock by purchasing the stock at its highest price for the day and selling the stock at its lowest price for the day. List the ticker symbol for which this occurs most frequently first.
SELECT DISTINCT TickerSymbol, COUNT(TradeDate) OVER (ORDER BY TickerSymbol DESC) AS NumPossLossDays
	FROM StockData
	WHERE 0.9*ST_High >= ST_Low;
--90. List the five rows with the highest price multiplied by volume. Use the closing price of as the price for the entire day.
SELECT TOP 5 (ST_Close * Volume) AS High, * 
	FROM StockData
ORDER BY HIGH DESC;
--91. List the number of shares (including fractions of shares) you could have purchased with $2000 at the low price on the day when the high to low price ratio was highest.
SELECT TOP (1) (2000 / ST_Low) AS MaxNumShareRatioGain 
	FROM StockData
ORDER BY (ST_High / ST_Low) DESC;
--92. Create a Toys table (ToyID, ToyName) and a Colors Table (ColorID, ColorName) and put six tuples in each table. Use CREATE statements to make the tables.  
CREATE TABLE Toys (
	ToyID int,
	ToyName char(25));
CREATE TABLE Colors (
	ColorID int,
	ColorName char(25));
INSERT INTO Toys
	VALUES(11, 'Batman'),
	(12, 'Spiderman'),
	(13, 'Coolman'),
	(14, 'Aceaman'),
	(15, 'Scottman'),
	(16, 'Rimaman');
INSERT INTO Colors
	VALUES(10, 'Red'),
	(11, 'Orange'),
	(12, 'Yellow'),
	(13, 'Green'),
	(14, 'Blue'),
	(15, 'Purple');
--93. Please return all combinations of Toys and Colors.  
SELECT *
	FROM Toys CROSS JOIN Colors;
--94. Please return all combinations of Toys and Colors.  Include only those toys with and ID larger than 12 and please exclude colors that begin with the letter ‘B’.  
SELECT *
	FROM Toys CROSS JOIN Colors
	WHERE Toys.ToyID > 12 AND Colors.ColorName NOT LIKE 'B%';
--95. Write a stored procedure that returns all combinations of Toys and Colors.  Include only those toys with and ID larger than a value that will be supplied at run time.  
CREATE PROCEDURE Test(@ID INT)
AS
SELECT *
	FROM Toys CROSS JOIN Colors
	WHERE ToyID > @ID,
EXEC Test 13;
--96. Please create a stored procedure that returns toys that have the five largest Id's.  
CREATE PROCEDURE Test(@ID INT)
AS
SELECT TOP (5) ToyName
	FROM Toys
ORDER BY ToyID,
EXEC Test 13;
--97. Please list the TickerSymbol, TradeDate, the stock closing price and the volume for Apple on January 3, 2018.  Make the output appear as a JSON object.
SELECT TickerSymbol, TradeDate, ST_Close, Volume
	FROM StockData
	WHERE TickerSymbol = 'AAPL' AND TradeDate = '1/3/2018'
	FOR JSON AUTO;
--98. Please list the TickerSymbol, TradeDate, the stock closing price and the volume for Apple on January 3, 2018.  Make the output appear as a JSON object with a path and the root being Stockdata..
SELECT TickerSymbol, TradeDate, ST_Close, Volume
	FROM StockData
	WHERE TickerSymbol = 'AAPL' AND TradeDate = '1/3/2018'
	FOR JSON PATH, ROOT('StockData');
--99. Please produce the following JSON data with the attributes TickerSymbol, TradeDate, the stock closing price and the volume for Apple.  Use JSON_Query to produce the result.
{
"StockData":
  [ 
    {
"TickerSymbol":"AAPL  ",
"TradeDate":"2018-01-03T00:00:00",
"ST_Close":172.2299960000000,
"Volume":29517900.0
}
 ]
}
DECLARE @data NVARCHAR(4000)
SET @data = N'{
"StockData":
[
{
"TickerSymbol":"AAPL    ",
"TradeDate":"2018-01=03T00:00:00",
"ST_Close":172.2299960000000,
"Volume":29517900.0
}
]
}
'
SELECT JSON_QUERY(@data, '$.StockData[0]') AS 'Result';
--100. Please produce the following output with the attributes TickerSymbol for tech Industry in stockdata. Use JSON_Query and JSON_VALUE to produce the result.
Industry   TickerSymbol                                       FirstCompany
---------- -------------------------------------------------- ------------
Tech       ["AAPL", "AMAT", "CMCSA","CSCO","ETSY"]            AAPL 

(1 row affected)
DECLARE @data NVARCHAR(4000)
SET @data=N'{  
    "StockData": {    
       "Industry": "Tech",
       "TickerSymbol": ["AAPL", "AMAT", "CMCSA","CSCO","ETSY"]  
    }
 }'
 SELECT 
   CAST(JSON_VALUE(@data,'$.StockData.Industry') AS CHAR(10)) AS 'Industry',
   CAST(JSON_QUERY(@data,'$.StockData.TickerSymbol') AS CHAR(50)) AS 'TickerSymbol',
   CAST(JSON_VALUE(@data,'$.StockData.TickerSymbol[0]') AS CHAR(5)) AS 'FirstCompany';
