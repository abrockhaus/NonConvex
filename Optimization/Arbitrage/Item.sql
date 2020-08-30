CREATE TABLE [Arbitrage].[Item]
(
	[ID] BIGINT NOT NULL PRIMARY KEY constraint DF_Arbitrage_Item_ID default next value for Arbitrage.SeqMain, 
    [Label] NVARCHAR(80) NOT NULL
)
