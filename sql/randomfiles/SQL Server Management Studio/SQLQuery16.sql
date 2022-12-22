SELECT DISTINCT  TickerSymbol, [Year],         
              [1] AS ['Jan'],
              [2] AS ['Feb'],
              [3] AS ['Mar'],
              [4] AS ['Apr'],
			  [5] AS ['May'],
              [6] AS ['June'],
              [7] AS ['July'],
              [8] AS ['Aug'],
              [9] AS ['Sept'],
              [10] AS ['Oct'],
              [11] AS ['Nov'],
			  [12] AS ['Dec'],
              [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] AS Total
              FROM (SELECT MONTH(TradeDate) AS Mo,Volume, YEAR(TradeDate) AS [Year], TickerSymbol
                     FROM StockData
					GROUP BY YEAR(TradeDate), TradeDate,TickerSymbol, Volume) AS Src
PIVOT (SUM(Volume) FOR Mo IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS Pvt
GROUP BY [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12], TickerSymbol, [Year]
ORDER BY TickerSymbol, [Year]

