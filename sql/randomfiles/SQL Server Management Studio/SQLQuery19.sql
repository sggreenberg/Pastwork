DECLARE @hh geography;
SET @hh = geography::Point(41.740892, -111.809865, 4236)
DECLARE @pov geography;
SET @pov = geography::Point(48.805077, 2.120742, 4236)
DECLARE @tm geography;
SET @tm = geography::Point(27.175412, 78.042207, 4236)
DECLARE @wpstp geography;
SET @wpstp = geography::Point(59.942973, 30.317640, 4236)
DECLARE @cr geography;
SET @cr = geography::Point(-22.951590, -43.210530, 4236)
DECLARE @spaus geography;
SET @spaus= geography::Point( -27.59580, 153.24585 , 4236)

SELECT @hh.STDistance(@hh)/1609.344 AS [Huntsman Hall to Huntsman Hall]
SELECT @pov.STDistance(@hh)/1609.344 AS [Palace of Versailles to Huntsman Hall]
SELECT @tm.STDistance(@hh)/1609.344 AS [Taj Mahal to Huntsman Hall]
SELECT @wpstp.STDistance(@hh)/1609.344 AS [Winter Palace to Huntsman Hall]
SELECT @cr.STDistance(@hh)/1609.344 AS [Cristo Redentor to Huntsman Hall]
SELECT @spaus.STDistance(@hh)/1609.344 AS [Surfers Paradise Australia to Huntsman Hall]

DECLARE @ebb geography;
SET @ebb= geography::Point(40.762200, -111.841000, 4236)
SELECT @ebb.STDistance(@hh)/1609.344 AS [Eccles Business Building to Huntsman Hall]
