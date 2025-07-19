-- FINAL PROJECT: AUTO CAR DEALERSHIP SCHEMA

CREATE DATABASE FinalProject;
GO

USE FinalProject;
GO

-- 1. Dealer
CREATE TABLE Dealer (
    DealerId INT IDENTITY(1,1) PRIMARY KEY,
    DealerName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Address VARCHAR(200),
    PhoneNumber VARCHAR(20) CHECK (PhoneNumber LIKE '[0-9]%')
);

-- 2. Customer
CREATE TABLE Customer (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

-- 3. SalesOfficer
CREATE TABLE SalesOfficer (
    SalesOfficerId INT IDENTITY(1,1) PRIMARY KEY,
    DealerId INT NOT NULL,
    SalesName VARCHAR(100) NOT NULL,
    FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId)
);

-- 4. Car
CREATE TABLE Car (
    CarId INT IDENTITY(1,1) PRIMARY KEY,
    CarName VARCHAR(100) NOT NULL,
    CarType VARCHAR(50) NOT NULL,
    BasePrice MONEY NOT NULL,
    Year INT,
    Color VARCHAR(30)
);

-- 5. Consultation
CREATE TABLE Consultation (
    ConsultationId INT IDENTITY(1,1) PRIMARY KEY,
    DealerId INT NOT NULL,
    CustomerId INT NOT NULL,
    SalesOfficerId INT NOT NULL,
    CarId INT,
    Budget MONEY,
    PaymentMethod VARCHAR(20),
    ConsultationDate DATE NOT NULL,
    Note VARCHAR(200),
    FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (SalesOfficerId) REFERENCES SalesOfficer(SalesOfficerId),
    FOREIGN KEY (CarId) REFERENCES Car(CarId)
);

-- 6. TestDrive
CREATE TABLE TestDrive (
    TestDriveId INT IDENTITY(1,1) PRIMARY KEY,
    DealerId INT NOT NULL,
    CustomerId INT NOT NULL,
    SalesOfficerId INT NOT NULL,
    CarId INT NOT NULL,
    ConsultationId INT,
    TestDriveDate DATE NOT NULL,
    Note VARCHAR(200),
    FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (SalesOfficerId) REFERENCES SalesOfficer(SalesOfficerId),
    FOREIGN KEY (CarId) REFERENCES Car(CarId),
    FOREIGN KEY (ConsultationId) REFERENCES Consultation(ConsultationId)
);

-- 7. Negotiation
CREATE TABLE Negotiation (
    NegotiationId INT IDENTITY(1,1) PRIMARY KEY,
    ConsultationId INT,
    TestDriveId INT,
    NegotiationDate DATE NOT NULL,
    Discount MONEY,
    Package VARCHAR(100),
    Note VARCHAR(200),
    FOREIGN KEY (ConsultationId) REFERENCES Consultation(ConsultationId),
    FOREIGN KEY (TestDriveId) REFERENCES TestDrive(TestDriveId)
);

-- 8. LetterOfIntent (LOI) - Header
CREATE TABLE LetterOfIntent (
    LOIId INT IDENTITY(1,1) PRIMARY KEY,
    DealerId INT NOT NULL,
    CustomerId INT NOT NULL,
    SalesOfficerId INT NOT NULL,
    ConsultationId INT,
    TestDriveId INT,
    LOIDate DATE NOT NULL,
    PaymentMethod VARCHAR(20),
    Note VARCHAR(200),
    FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (SalesOfficerId) REFERENCES SalesOfficer(SalesOfficerId),
    FOREIGN KEY (ConsultationId) REFERENCES Consultation(ConsultationId),
    FOREIGN KEY (TestDriveId) REFERENCES TestDrive(TestDriveId)
);

-- 9. LOIDetail
CREATE TABLE LOIDetail (
    LOIDetailId INT IDENTITY(1,1) PRIMARY KEY,
    LOIId INT NOT NULL,
    CarId INT NOT NULL,
    FixPrice MONEY NOT NULL,
    Discount MONEY,
    DownPayment MONEY,
    Note VARCHAR(200),
    FOREIGN KEY (LOIId) REFERENCES LetterOfIntent(LOIId),
    FOREIGN KEY (CarId) REFERENCES Car(CarId)
);

-- 10. Booking
CREATE TABLE Booking (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    LOIId INT NOT NULL,
    BookingFee MONEY NOT NULL,
    BookingDate DATE NOT NULL,
    Status VARCHAR(20),
    FOREIGN KEY (LOIId) REFERENCES LetterOfIntent(LOIId)
);

-- 11. Leasing
CREATE TABLE Leasing (
    LeasingId INT IDENTITY(1,1) PRIMARY KEY,
    LeasingName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    PhoneNumber VARCHAR(20)
);

-- 12. CreditApplication
CREATE TABLE CreditApplication (
    CreditAppId INT IDENTITY(1,1) PRIMARY KEY,
    LOIId INT NOT NULL,
    LeasingId INT,
    ApplicationDate DATE NOT NULL,
    Status VARCHAR(20),
    FOREIGN KEY (LOIId) REFERENCES LetterOfIntent(LOIId),
    FOREIGN KEY (LeasingId) REFERENCES Leasing(LeasingId)
);

-- 13. Document
CREATE TABLE Document (
    DocumentId INT IDENTITY(1,1) PRIMARY KEY,
    CreditAppId INT NOT NULL,
    DocumentType VARCHAR(50) NOT NULL,
    DocumentPath VARCHAR(200),
    UploadDate DATE,
    FOREIGN KEY (CreditAppId) REFERENCES CreditApplication(CreditAppId)
);

-- 14. Transaction - Header
CREATE TABLE [Transaction] (
    TransactionId INT IDENTITY(1,1) PRIMARY KEY,
    DealerId INT NOT NULL,
    CustomerId INT NOT NULL,
    SalesOfficerId INT NOT NULL,
    LOIId INT,
    TransactionDate DATE NOT NULL,
    TotalAmount MONEY,
    Status VARCHAR(20),
    FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (SalesOfficerId) REFERENCES SalesOfficer(SalesOfficerId),
    FOREIGN KEY (LOIId) REFERENCES LetterOfIntent(LOIId)
);

-- 15. TransactionDetail
CREATE TABLE TransactionDetail (
    TransactionDetailId INT IDENTITY(1,1) PRIMARY KEY,
    TransactionId INT NOT NULL,
    LOIDetailId INT,
    CarId INT NOT NULL,
    Price MONEY NOT NULL,
    Discount MONEY,
    Note VARCHAR(200),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId),
    FOREIGN KEY (LOIDetailId) REFERENCES LOIDetail(LOIDetailId),
    FOREIGN KEY (CarId) REFERENCES Car(CarId)
);

-- 16. Payment
CREATE TABLE Payment (
    PaymentId INT IDENTITY(1,1) PRIMARY KEY,
    TransactionId INT,
    CreditAppId INT,
    PaymentAmount MONEY NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentType VARCHAR(20),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId),
    FOREIGN KEY (CreditAppId) REFERENCES CreditApplication(CreditAppId)
);

-- 17. Administration
CREATE TABLE Administration (
    AdministrationId INT IDENTITY(1,1) PRIMARY KEY,
    TransactionId INT NOT NULL,
    STNKNumber VARCHAR(50),
    BPKBNumber VARCHAR(50),
    TaxStatus VARCHAR(50),
    InsuranceStatus VARCHAR(50),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId)
);

-- 18. Delivery
CREATE TABLE Delivery (
    DeliveryId INT IDENTITY(1,1) PRIMARY KEY,
    TransactionId INT NOT NULL,
    DeliveryDate DATE NOT NULL,
    Status VARCHAR(20),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId)
);

-- 19. DeliverySchedule
CREATE TABLE DeliverySchedule (
    DeliveryScheduleId INT IDENTITY(1,1) PRIMARY KEY,
    DeliveryId INT NOT NULL,
    ScheduledDate DATE NOT NULL,
    Note VARCHAR(200),
    FOREIGN KEY (DeliveryId) REFERENCES Delivery(DeliveryId)
);

-- 20. Inspection
CREATE TABLE Inspection (
    InspectionId INT IDENTITY(1,1) PRIMARY KEY,
    DeliveryId INT NOT NULL,
    InspectionDate DATE NOT NULL,
    InspectorName VARCHAR(100),
    Note VARCHAR(200),
    FOREIGN KEY (DeliveryId) REFERENCES Delivery(DeliveryId)
);

-- 21. AfterSalesService
CREATE TABLE AfterSalesService (
    ServiceId INT IDENTITY(1,1) PRIMARY KEY,
    TransactionId INT NOT NULL,
    ServiceDate DATE NOT NULL,
    ServiceType VARCHAR(50),
    Note VARCHAR(200),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId)
);

-- 22. Complaint
CREATE TABLE Complaint (
    ComplaintId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    TransactionId INT,
    ComplaintDate DATE NOT NULL,
    Description VARCHAR(200),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId)
);

-- 23. WarrantyClaim
CREATE TABLE WarrantyClaim (
    WarrantyClaimId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    TransactionId INT,
    ClaimDate DATE NOT NULL,
    Description VARCHAR(200),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId)
);

-- 24. Inventory
CREATE TABLE Inventory (
    InventoryId INT IDENTITY(1,1) PRIMARY KEY,
    DealerId INT NOT NULL,
    CarId INT NOT NULL,
    Stock INT NOT NULL,
    FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
    FOREIGN KEY (CarId) REFERENCES Car(CarId)
);

-- 25. StockMutation
CREATE TABLE StockMutation (
    MutationId INT IDENTITY(1,1) PRIMARY KEY,
    FromDealerId INT NOT NULL,
    ToDealerId INT NOT NULL,
    CarId INT NOT NULL,
    Quantity INT NOT NULL,
    MutationDate DATE NOT NULL,
    FOREIGN KEY (FromDealerId) REFERENCES Dealer(DealerId),
    FOREIGN KEY (ToDealerId) REFERENCES Dealer(DealerId),
    FOREIGN KEY (CarId) REFERENCES Car(CarId)
);

-- 26. FeedbackSurvey
CREATE TABLE FeedbackSurvey (
    FeedbackId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    TransactionId INT,
    FeedbackDate DATE NOT NULL,
    Rating INT,
    Comment VARCHAR(200),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (TransactionId) REFERENCES [Transaction](TransactionId)
);
GO

-- Stored Procedures
CREATE PROCEDURE sp_RegisterCustomer
    @CustomerName VARCHAR(100),
    @PhoneNumber VARCHAR(20),
    @Email VARCHAR(100),
    @Address VARCHAR(200)
AS
BEGIN
    INSERT INTO Customer (CustomerName, PhoneNumber, Email, Address)
    VALUES (@CustomerName, @PhoneNumber, @Email, @Address);

    SELECT SCOPE_IDENTITY() AS CustomerId;
END
GO

CREATE PROCEDURE sp_ApplyForCredit
    @LOIId INT,
    @LeasingId INT
AS
BEGIN
    INSERT INTO CreditApplication (LOIId, LeasingId, ApplicationDate, Status)
    VALUES (@LOIId, @LeasingId, GETDATE(), 'Pending');

    SELECT SCOPE_IDENTITY() AS CreditAppId;
END
GO

CREATE PROCEDURE sp_CarDelivery
    @TransactionId INT
AS
BEGIN
    INSERT INTO Delivery (TransactionId, DeliveryDate, Status)
    VALUES (@TransactionId, GETDATE(), 'Delivered');

    UPDATE [Transaction] SET Status = 'Completed' WHERE TransactionId = @TransactionId;
END
GO

-- Functions
CREATE FUNCTION fn_CalculateTotalPrice
(
    @Price MONEY,
    @Discount MONEY
)
RETURNS MONEY
AS
BEGIN
    RETURN @Price - @Discount;
END
GO

-- Views
CREATE VIEW vw_Sales_Report AS
SELECT
    t.TransactionId,
    t.TransactionDate,
    c.CustomerName,
    so.SalesName,
    cr.CarName,
    td.Price,
    td.Discount,
    dbo.fn_CalculateTotalPrice(td.Price, td.Discount) AS TotalPrice
FROM
    [Transaction] t
    JOIN TransactionDetail td ON t.TransactionId = td.TransactionId
    JOIN Customer c ON t.CustomerId = c.CustomerId
    JOIN SalesOfficer so ON t.SalesOfficerId = so.SalesOfficerId
    JOIN Car cr ON td.CarId = cr.CarId
GO

CREATE VIEW vw_Credit_Status AS
SELECT
    ca.CreditAppId,
    c.CustomerName,
    l.LeasingName,
    ca.ApplicationDate,
    ca.Status
FROM
    CreditApplication ca
    JOIN LetterOfIntent loi ON ca.LOIId = loi.LOIId
    JOIN Customer c ON loi.CustomerId = c.CustomerId
    JOIN Leasing l ON ca.LeasingId = l.LeasingId;
GO

CREATE VIEW vw_Available_Cars AS
SELECT
    d.DealerName,
    c.CarName,
    c.CarType,
    c.BasePrice,
    i.Stock
FROM
    Inventory i
    JOIN Car c ON i.CarId = c.CarId
    JOIN Dealer d ON i.DealerId = d.DealerId
WHERE
    i.Stock > 0;
GO

-- Triggers
CREATE TRIGGER trg_UpdateStockAfterSale
ON TransactionDetail
AFTER INSERT
AS
BEGIN
    UPDATE Inventory
    SET Stock = Stock - 1
    FROM Inventory i
    JOIN inserted ins ON i.CarId = ins.CarId
    JOIN [Transaction] t ON ins.TransactionId = t.TransactionId
    WHERE i.DealerId = t.DealerId;
END
GO