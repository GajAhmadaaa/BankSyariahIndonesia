CREATE PROCEDURE sp_ApplyForCredit
    @LOIID INT,
    @LeasingCompanyID INT
AS
BEGIN
    INSERT INTO CreditApplication (LOIID, LeasingCompanyID, ApplicationDate, Status)
    VALUES (@LOIID, @LeasingCompanyID, GETDATE(), 'Pending');

    SELECT SCOPE_IDENTITY() AS CreditAppID;
END
GO