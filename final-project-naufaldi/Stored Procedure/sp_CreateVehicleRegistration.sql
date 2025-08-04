CREATE PROCEDURE sp_CreateVehicleRegistration
    @SalesAgreementID INT,
    @RegistrationNumber VARCHAR(50),
    @OwnershipBookNumber VARCHAR(50),
    @TaxStatus VARCHAR(50),
    @InsuranceStatus VARCHAR(50)
AS
BEGIN
    -- Validasi: pastikan transaksi ada
    IF NOT EXISTS (SELECT 1 FROM SalesAgreement WHERE SalesAgreementID = @SalesAgreementID)
    BEGIN
        RAISERROR('SalesAgreementID tidak ditemukan.', 16, 1);
        RETURN;
    END

    -- Validasi: pastikan administrasi untuk transaksi ini belum ada
    IF EXISTS (SELECT 1 FROM VehicleRegistration WHERE SalesAgreementID = @SalesAgreementID)
    BEGIN
        RAISERROR('Vehicle Registration untuk transaksi ini sudah ada.', 16, 1);
        RETURN;
    END

    -- Insert administrasi baru
    INSERT INTO VehicleRegistration (SalesAgreementID, RegistrationNumber, OwnershipBookNumber, TaxStatus, InsuranceStatus)
    VALUES (@SalesAgreementID, @RegistrationNumber, @OwnershipBookNumber, @TaxStatus, @InsuranceStatus);

    PRINT 'Vehicle Registration berhasil dibuat.';
END
GO