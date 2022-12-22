CREATE VIEW cte AS
 
SELECT TickerSymbol, AVG(ST_Close) AS AverageClose
              FROM StockData
              WHERE YEAR(TradeDate) = 2016
GROUP BY TickerSymbol
HAVING AVG(ST_Close) >= 100