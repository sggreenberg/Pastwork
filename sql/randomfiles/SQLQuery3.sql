/*Do Transaction Codes look like they are created from LocationID?*/
SELECT TransactionCode, LocationID 
	FROM Transactions
	WHERE LocationID = 1
	GROUP BY LocationID, TransactionCode WITH ROLLUP;
SELECT TransactionCode, LocationID 
	FROM Transactions
	WHERE LocationID = 2
	GROUP BY LocationID, TransactionCode WITH ROLLUP;
/*Do Transaction Codes look like they are created from the TranactionDate and TransactionTime?*/
SELECT TransactionCode, TransactionDate, TransactionTime
	FROM Transactions
	GROUP BY TransactionCode, TransactionDate, TransactionTime WITH CUBE;
/* What are the capitals of each of the fifty states? (My kid is here studying for his geography test) */
SELECT Capital, [Name]
	FROM StateInfo;
/* What year did each StateInfo.Name become a State */
SELECT [Year], [NAME]
	FROM StateInfo
/* Group LocationID by DollarsPerGallon */
SELECT Transactions.TransactionDate, (Transactions.TotalAmount / Transactions.TotalGallons) AS 'DollarsPerGallon', StateInfo.Abbreviation
	FROM Transactions, StateInfo
	GROUP BY StateInfo.Abbreviation, Transactions.TransactionDate,Transactions.TotalGallons, Transactions.TotalAmount WITH ROLLUP;