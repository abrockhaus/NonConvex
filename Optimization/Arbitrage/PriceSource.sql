CREATE TABLE [Arbitrage].[PriceSource]
(
	[ID] BIGINT NOT NULL PRIMARY KEY constraint DF_Arbitrage_PriceSource_ID default next value for Arbitrage.SeqMain,
	Label nvarchar(80) NOT NULL
)
