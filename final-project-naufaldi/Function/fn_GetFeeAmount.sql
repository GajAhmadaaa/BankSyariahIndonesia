CREATE FUNCTION fn_GetFeeAmount
(
    @LOIDetailID INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @Fee MONEY
    SELECT @Fee = di.Price * di.FeePercent / 100.0
    FROM LetterOfIntentDetail lod
    JOIN DealerInventory di ON lod.DealerInventoryID = di.DealerInventoryID
    WHERE lod.LOIDetailID = @LOIDetailID
    RETURN ISNULL(@Fee, 0)
END
GO