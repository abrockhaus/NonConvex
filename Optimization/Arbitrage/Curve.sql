CREATE TABLE [Arbitrage].[Curve]
(
	[ID] BIGINT NOT NULL PRIMARY KEY constraint DF_Arbitrage_Curve_ID default next value for Arbitrage.SeqMain, 
    [Label] NVARCHAR(20) NOT NULL
)
