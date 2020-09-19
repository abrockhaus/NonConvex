CREATE PROCEDURE [Arbitrage].[pReportingGetCurveValues] (@ItemID bigint = 1, @StartingFrom datetimeoffset(7) = '01 Aug 2020', @EndingWith datetimeoffset(7) = '15 Sep 2020', @BookCurrency char(3) = 'CHF') 
AS
	select 
		ItemPriceCurve.ItemID, 
		Item.Label ItemLabel, 
		ItemPriceCurve.CurveID, 
		Curve.Label CurveLabel, 
		ItemPriceCurve.PriceSourceID, 
		PriceSource.Label PriceSourceLabel, 
		Curve.Unit CurveUnit, 
		year(convert(datetime, CurveValue.Timepoint)) year, 
		datepart(quarter, convert(datetime, CurveValue.Timepoint)) quarter, 
		month(convert(datetime, CurveValue.Timepoint)) month, 
		convert(datetime, CurveValue.Timepoint) Timepoint, 
		CurveValue.Value, 
		CurveFX.Unit, 
		CurveFXValue.Value FXValue 
	from 
		Arbitrage.ItemPriceCurve join 
		Arbitrage.Item on Item.ID = ItemPriceCurve.ItemID join 
		Arbitrage.Curve on Curve.ID = ItemPriceCurve.CurveID join 
		Arbitrage.PriceSource on PriceSource.ID = ItemPriceCurve.PriceSourceID join 
		Arbitrage.CurveValue on CurveValue.CurveID = Curve.ID join 
		Arbitrage.Curve CurveFX on LEFT(CurveFX.Unit, 3) = LEFT(Curve.Unit, 3) and RIGHT(CurveFX.Unit, 3) = @BookCurrency join 
		Arbitrage.CurveValue CurveFXValue on CurveFX.ID = CurveFXValue.CurveID and CurveValue.Timepoint = CurveFXValue.Timepoint 
	where 
		ItemPriceCurve.ItemID = @ItemID and 
		CurveValue.Timepoint between @StartingFrom and @EndingWith 
	order by 
		CurveValue.Timepoint desc 
RETURN 0