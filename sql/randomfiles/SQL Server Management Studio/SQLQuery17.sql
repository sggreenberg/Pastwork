CREATE FUNCTION fnGetMeanToo
       (
       @TickerA CHAR(10),
       @DateStart DATETIME,
       @DateEnd DATETIME
       )
RETURNS DECIMAL(22,6)
 
AS
 
BEGIN
DECLARE @Mean DECIMAL(22,6)
 
SELECT
       @Mean =(COUNT(*)*SUM(x.ST_Close*y.ST_Close)-SUM(x.ST_Close)*SUM(y.ST_Close))/(
       SQRT(SUM(SQUARE(x.ST_Close-(SUM(x.ST_Close)/Count(*))))/(Count(*)-1))*
       SQRT(COUNT(*)*SUM(SQUARE(y.ST_Close))-SQUARE(SUM(y.ST_Close))))
       --correlation
FROM StockData AS x 
WHERE (x.TickerSymbol = @TickerA)
       AND (x.TradeDate >= @DateStart)
       AND (x.TradeDate <= @DateEnd)
RETURN(@Mean)
 
END
GO
 
SELECT dbo.fnGetMeanToo('MSFT','1/1/2011','3/31/2011')
AS CorrCoeff;
