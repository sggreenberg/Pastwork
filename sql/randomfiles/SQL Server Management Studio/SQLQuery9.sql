SELECT	TradeDate, Year(TradeDate), Quarter(TradeDate) as Quarter,                   
		[1] AS [1st Qtr], 
		[2] AS [2nd Qtr],
		[3] AS [3rd Qtr],
		[4] AS [4th Qtr], 
		[1]+[2]+[3]+[4] AS Total
		FROM (SELECT *,Year(TradeDate), 
			FROM StockData) AS src 
PIVOT (SUM(ST_Close) FOR  IN ([1],[2],[3],[4])) AS pvt
ORDER BY Year
