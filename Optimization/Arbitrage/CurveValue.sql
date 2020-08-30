CREATE TABLE [Arbitrage].[CurveValue]
(
	[ID] BIGINT NOT NULL PRIMARY KEY constraint DF_Arbitrage_CurveValue_ID default next value for Arbitrage.SeqMain, 
	[CurveID] BIGINT, 
    [Timepoint] DATETIMEOFFSET NOT NULL, 
    [Value] FLOAT NOT NULL, 
    CONSTRAINT [FK_CurveValue_Curve] FOREIGN KEY ([CurveID]) REFERENCES [Arbitrage].[Curve]([ID])
)
