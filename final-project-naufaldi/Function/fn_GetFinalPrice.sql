CREATE FUNCTION fn_GetFinalPrice
(
    @LOIDetailID INT
)
RETURNS MONEY
AS
BEGIN
    DECLARE @Price MONEY, @Discount MONEY, @Fee MONEY
    SELECT @Price = di.Price
    FROM LetterOfIntentDetail lod
    JOIN DealerInventory di ON lod.DealerInventoryID = di.DealerInventoryID
    WHERE lod.LOIDetailID = @LOIDetailID

    SELECT @Discount = dbo.fn_GetDiscountAmount(@LOIDetailID)
    SELECT @Fee = dbo.fn_GetFeeAmount(@LOIDetailID)
    RETURN ISNULL(@Price,0) - ISNULL(@Discount,0) + ISNULL(@Fee,0)
END
GO