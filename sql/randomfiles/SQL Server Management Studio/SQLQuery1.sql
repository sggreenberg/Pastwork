IF EXISTS
	(SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'fnGetCorrelationToo')
		AND
		TYPE in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION dbo.fnGetCorrelationToo
GO
CREATE FUNCTION fnGetCorrelationToo
   (
    @TickerA CHAR(10),
    @TickerB CHAR(10),
    @DateStart DATETIME,
    @DateEnd DATETIME
    )
RETURNS DECIMAL(22,6)

AS

BEGIN
DECLARE @Corr DECIMAL(22,6)

SELECT 
   @Corr =(COUNT(*)*SUM(x.ST_Close*y.ST_Close)-SUM(x.ST_Close)*SUM(y.ST_Close))/(
   SQRT(COUNT(*)*SUM(SQUARE(x.ST_Close))-SQUARE(SUM(x.ST_Close)))*
   SQRT(COUNT(*)*SUM(SQUARE(y.ST_Close))-SQUARE(SUM(y.ST_Close)))) 
   --correlation
FROM StockData AS x JOIN StockData AS y 
ON (x.TradeDate = y.TradeDate)
WHERE (x.TickerSymbol = @TickerA) 
AND (y.TickerSymbol = @TickerB)
	AND (x.TradeDate >= @DateStart)
	AND (x.TradeDate <= @DateEnd)
RETURN(@Corr)

END
GO

SELECT dbo.fnGetCorrelationToo('MSFT', 'ORCL','1/1/2011','3/31/2011')
AS CorrCoeff;
select month(TradeDate) from stockdata;