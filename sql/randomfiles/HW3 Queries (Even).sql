--2
SELECT TickerSymbol, Industry, TradeDate, Volume
	FROM StockData;
--4
SELECT TickerSymbol, Industry, TradeDate, Volume
	FROM StockData
	WHERE Volume >30000000;
--6
SELECT TickerSymbol, Industry, TradeDate, Volume
	FROM StockData
	WHERE Volume > 30000000
ORDER BY TickerSymbol, TradeDate;
--8
SELECT PriceID, ST_Open
	FROM StockData
	WHERE ST_Open BETWEEN 20 AND 21
ORDER BY PriceID;
--10
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE YEAR(TradeDate) = 2018
ORDER BY TradeDate;
--12
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE TradeDate BETWEEN '1/1/2018' AND '1/1/2019'
ORDER BY Industry, TickerSymbol, TradeDate;
--14
SELECT TickerSymbol, TradeDate, ST_Close
	FROM StockData
	WHERE TickerSymbol = 'MSFT' AND TradeDate BETWEEN '1/1/2005' AND '6/1/2018'
ORDER BY TickerSymbol, TradeDate, ST_Close;
--16 (Potential Error in Question - WFM may be WFC)
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE TickerSymbol = 'WFM' OR TickerSymbol = 'XOM'
ORDER BY TickerSymbol, Industry, TradeDate;
--18
SELECT *
	FROM StockData
	WHERE TickerSymbol = 'MSFT' AND ST_High < 20 OR ST_Low > 50
ORDER BY ST_High, ST_Low;
--20
SELECT *
	FROM StockData
	WHERE ST_Close BETWEEN 20 AND 21
ORDER BY ST_Close DESC;
--22
SELECT Volume, ST_Open, ST_Close
	FROM StockData
	WHERE (ST_Open >= 100) AND (ST_Close != 120)
ORDER BY Volume DESC;
--24
SELECT PriceID, TradeDate, ST_High
	FROM StockData
	WHERE (TradeDate < '10/3/2018') AND (ST_High > 125)
ORDER BY ST_High DESC;
--26
SELECT TickerSymbol, Industry, TradeDate, ST_Open, ST_Close
	FROM StockData
	WHERE Industry LIKE '%OIL%'
ORDER BY Industry, TickerSymbol, TradeDate;
--28
SELECT TickerSymbol	
	FROM StockData
	WHERE TickerSymbol LIKE '%S%';
--30
SELECT PriceID, ROUND(ST_High,2) AS RoundedStockHighsToNearestPenny
	FROM StockData
	WHERE ST_High > 130;
--31
SELECT TOP 2 (ST_High), PriceID
	FROM StockData
	WHERE ST_High < 100
ORDER BY ST_High DESC;
--32
SELECT TOP 10 (ST_High - ST_Low) AS DailyHighLowDifference, TickerSymbol,
Industry, TradeDate
	FROM StockData
ORDER BY (ST_High - ST_Low) DESC;
--33
SELECT SUM(ST_Low) AS TotalLowStockPriceOfStocksUnder60
	FROM StockData
	WHERE ST_Low > 60;
--34
SELECT MAX(PriceID)
	FROM StockData
	WHERE ST_Low < 80;
--36
SELECT MIN(TradeDate) AS EarliestTradeDateWithHighOver100
	FROM StockData
	WHERE ST_High > 100;
--38
SELECT MAX(ST_High)
	FROM StockData
	WHERE YEAR(TradeDate) = 2018 AND ST_Low < 100;
--40
SELECT COUNT(TickerSymbol)
	FROM StockData
	WHERE ST_Open = 70 AND YEAR(TradeDate) = 2018;
--41
SELECT Industry, TickerSymbol, COUNT(TickerSymbol) OVER(PARTITION BY Industry ORDER BY COUNT(TickerSymbol) DESC) AS CompPerInd
	FROM StockData
GROUP BY Industry, TickerSymbol
--42*
SELECT Industry, TickerSymbol, COUNT(TickerSymbol) OVER(PARTITION BY Industry ORDER BY COUNT(TickerSymbol) DESC) AS CompPerInd
	FROM StockData
GROUP BY Industry, TickerSymbol
ORDER BY Industry;
--44
SELECT TOP 10 COUNT(ST_Close) AS [Count], ST_Close
	FROM StockData
GROUP BY ST_Close
ORDER BY [Count] DESC;
--46
SELECT DATEDIFF(MINUTE, '10/03/1992','3/1/1996'); 
--48
INSERT INTO StockData
VALUES('MSFT', 'Tech', '5/5/2017', 68.90, 69.03, 68.48, 69, 19128782);
--50
DELETE
	FROM StockData
	WHERE (TradeDate < '1/1/2001') AND (TickerSymbol = 'MSFT');
--52
Delete
	FROM StockData
	WHERE YEAR(TradeDate) = 2018 AND MONTH(TradeDate) = 10;
--54
SELECT ActualDate
	FROM Calendar
	WHERE [DayOfWeek] = 'Friday';
--56
SELECT TickerSymbol, CAST(COUNT(*) AS DECIMAL(21,13))/
	(SELECT CAST(COUNT(*) AS DECIMAL(21,13))
		FROM StockData) AS PercentOfTotal
	FROM StockData
GROUP BY TickerSymbol
ORDER BY PercentOfTotal DESC;
--58
SELECT *
	FROM StockData
	WHERE ST_High > 
		(SELECT AVG(ST_High) AS NumberOfStocksAboveAverageHighIn2018
			FROM StockData
			WHERE TradeDate = '3/9/2018');
--60
SELECT TickerSymbol, Industry, ROW_NUMBER() OVER(ORDER BY ST_Close DESC) AS 'Row Number', ST_Close
	FROM StockData
	WHERE Industry = 'Tech';
--62!!!!!!!!!!!!!!!!!!!!!!!!
SELECT TickerSymbol, [DayOfWeek], AVG(Volume)
	FROM StockData AS sd JOIN Calendar AS cal
	ON (sd.TradeDate = cal.ActualDate)
ORDER BY TickerSymbol, Volume DESC;
--64
SELECT COUNT(*) AS NullCount
	FROM StockData
	WHERE PriceID IS NULL;
--66
SELECT *
	FROM StockData
	WHERE ST_Close = 0 OR ST_High = 0 OR ST_Low = 0 OR ST_Open = 0;
--68
SELECT MAX(ST_Open - ST_Close)
	FROM StockData
--70
SELECT MAX(ST_Close)
	FROM StockData
	WHERE YEAR(TradeDate)= 2018
--72
SELECT Industry, TickerSymbol, COUNT(TickerSymbol) OVER (PARTITION BY Industry ORDER BY Industry DESC) AS CompPerInd
	FROM CompanyInformation;
--74
SELECT MIN(ST_Close) AS Minimum, TradeDate
	FROM StockData
	WHERE TradeDate BETWEEN '9/11/2001' AND '9/30/2001' AND TickerSymbol = 'F'
GROUP BY TradeDate
--76
SELECT AVG(ST_CLose) AS AvgClose, MONTH(TradeDate) AS [Month]
	FROM  StockData
GROUP BY MONTH(TradeDate)
ORDER BY AvgClose;
--77
SELECT DATENAME(mm, TradeDate) AS MonthOfYear, COUNT(DISTINCT(TradeDate)) AS
TradeDays
	FROM StockData
	WHERE Volume > 0 AND TradeDate > '20171231' AND TradeDate < '20190101'
GROUP BY DATENAME(MONTH, TradeDate)
ORDER BY COUNT(DISTINCT(TradeDate));
--78
SELECT COUNT(TradeDate) AS [Count], AVG(Volume) AS Vol
	FROM  StockData
	WHERE YEAR(TradeDate) = 2018
GROUP BY MONTH(TradeDate)
ORDER BY [Count];
--80
SELECT COUNT(DISTINCT(TradeDate)) AS UniqueDates, MIN(TradeDate) AS StartDate, MAX(TradeDate) AS RecentDate, Industry, COUNT(DISTINCT(TickerSymbol)) AS [Count]
	FROM StockData
GROUP BY Industry
ORDER BY Industry
--81*
SELECT DISTINCT DATEDIFF(dd,MIN(TradeDate), MAX(TradeDate)), Industry, COUNT(DISTINCT(TradeDate)) AS UniqueDates, COUNT(DISTINCT(TickerSymbol)) AS [Count]
	FROM StockData
GROUP BY Industry, TradeDate
ORDER BY Industry
--82
SELECT TOP 5 *
	FROM StockData
ORDER BY (ST_High - ST_Low) DESC;
--83
SELECT TOP 1 (2000/ST_Low * ST_High) AS SharesPurchased
	FROM StockData
ORDER BY (ST_High/ST_Low) DESC;
--84
SELECT SUM(ST_Open*200) AS StockSum
	FROM StockData
	WHERE TradeDate = '10/9/2012';
--86
SELECT COUNT(*)
	FROM StockData
	WHERE ST_High >= ST_Low*1.1;
--88
SELECT COUNT(*) AS cnt, TickerSymbol
	FROM StockData
	WHERE ST_High >= ST_Low*1.1
GROUP BY TickerSymbol
ORDER BY cnt DESC;
--90
SELECT TOP 5 (ST_Close * Volume) AS High, *
	FROM StockData
ORDER BY (ST_Close*Volume) DESC;
--92
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
--94
SELECT *
	FROM Toys CROSS JOIN Colors
	WHERE Toys.ToyID > 12 AND Colors.ColorName NOT LIKE 'B%';
--95
CREATE PROCEDURE Test(@ID INT)
AS
SELECT *
	FROM Toys CROSS JOIN Colors
	WHERE ToyID > @ID,
EXEC Test 13
--98
SELECT TickerSymbol, TradeDate, ST_Close, Volume
	FROM StockData
	WHERE TickerSymbol = 'AAPL' AND TradeDate = '1/3/2018'
	FOR JSON PATH, ROOT('StockData');
--100
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





--test purposes
SELECT *
	FROM StockData
ORDER BY TickerSymbol, TradeDate, Volume

SELECT *
	FROM CompanyInformation