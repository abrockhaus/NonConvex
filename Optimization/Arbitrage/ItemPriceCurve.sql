CREATE TABLE [Arbitrage].[ItemPriceCurve]
(
	[ID] BIGINT NOT NULL PRIMARY KEY constraint DF_Arbitrage_ItemPriceCurve_ID default next value for Arbitrage.SeqMain, 
	[ItemID] BIGINT NOT NULL, 
	[CurveID] BIGINT NOT NULL, 
	[PriceSourceID] BIGINT NOT NULL
)
