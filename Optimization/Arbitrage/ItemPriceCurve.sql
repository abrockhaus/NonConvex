CREATE TABLE [Arbitrage].[ItemPriceCurve] (
    [ID]            BIGINT CONSTRAINT [DF_Arbitrage_ItemPriceCurve_ID] DEFAULT (NEXT VALUE FOR [Arbitrage].[SeqMain]) NOT NULL,
    [ItemID]        BIGINT NOT NULL,
    [CurveID]       BIGINT NOT NULL,
    [PriceSourceID] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ItemPriceCurve_Curve] FOREIGN KEY ([CurveID]) REFERENCES [Arbitrage].[Curve] ([ID]),
    CONSTRAINT [FK_ItemPriceCurve_Item] FOREIGN KEY ([ItemID]) REFERENCES [Arbitrage].[Item] ([ID]),
    CONSTRAINT [FK_ItemPriceCurve_PriceSource] FOREIGN KEY ([PriceSourceID]) REFERENCES [Arbitrage].[PriceSource] ([ID])
);


