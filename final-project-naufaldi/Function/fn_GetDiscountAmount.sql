CREATE FUNCTION fn_GetDiscountAmount
(
    @LOIDetailID INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @Discount MONEY
    SELECT @Discount = di.Price * di.DiscountPercent / 100.0
    FROM LetterOfIntentDetail lod
    JOIN DealerInventory di ON lod.DealerInventoryID = di.DealerInventoryID
    WHERE lod.LOIDetailID = @LOIDetailID
    RETURN ISNULL(@Discount, 0)
END
GO