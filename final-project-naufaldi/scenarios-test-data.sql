-- Test Data for Additional Scenarios

USE FinalProject;
GO

-- 1. Failed Credit Application
INSERT INTO Customer (CustomerName, PhoneNumber, Email, Address) VALUES
('John Doe', '081234567890', 'john.doe@example.com', 'Jl. Kebon Jeruk No. 5');
INSERT INTO LetterOfIntent (DealerId, CustomerId, SalesOfficerId, LOIDate, PaymentMethod) VALUES
(1, 3, 1, GETDATE(), 'Credit');
INSERT INTO CreditApplication (LOIId, LeasingId, ApplicationDate, Status) VALUES
(1, 1, GETDATE(), 'Rejected');

-- 2. Canceled Booking
INSERT INTO Booking (LOIId, BookingFee, BookingDate, Status) VALUES
(1, 5000000, GETDATE(), 'Canceled');

-- 3. Bulk Purchase by Corporate Customer
INSERT INTO Customer (CustomerName, PhoneNumber, Email, Address) VALUES
('Corporate XYZ', '02198765432', 'contact@corporate.xyz', 'Jl. Sudirman No. 10');
INSERT INTO LetterOfIntent (DealerId, CustomerId, SalesOfficerId, LOIDate, PaymentMethod) VALUES
(1, 4, 2, GETDATE(), 'Cash');
INSERT INTO LOIDetail (LOIId, CarId, FixPrice, Discount, DownPayment) VALUES
(2, 1, 500000000, 50000000, 100000000),
(2, 2, 250000000, 25000000, 50000000);

-- 4. Warranty Claim for Defective Car
INSERT INTO WarrantyClaim (CustomerId, TransactionId, ClaimDate, Description, Status) VALUES
(3, 1, GETDATE(), 'Engine failure', 'Pending');

-- 5. Stock Mutation Between Dealers
INSERT INTO StockMutation (FromDealerId, ToDealerId, CarId, Quantity, MutationDate) VALUES
(1, 2, 1, 5, GETDATE());

-- 6. Late Payment for Installments
INSERT INTO Payment (TransactionId, CreditAppId, PaymentAmount, PaymentDate, PaymentType) VALUES
(1, 1, 10000000, DATEADD(DAY, -10, GETDATE()), 'Installment');

-- 7. Customer Complaint About Service
INSERT INTO Complaint (CustomerId, TransactionId, ComplaintDate, Description, Status) VALUES
(3, 1, GETDATE(), 'Delayed delivery', 'Pending');

-- 8. First Service Follow-Up
INSERT INTO AfterSalesService (TransactionId, ServiceDate, ServiceType, Note) VALUES
(1, DATEADD(MONTH, 1, GETDATE()), 'First Service', 'Follow-up completed');
-- Testing Stored Procedures, Functions, and Triggers

-- 9. Register New Customer Using Stored Procedure
EXEC sp_RegisterCustomer 
    @CustomerName = 'Jane Doe',
    @PhoneNumber = '081234567891',
    @Email = 'jane.doe@example.com',
    @Address = 'Jl. Merdeka No. 10';

-- 10. Calculate Total Price Using Function
SELECT dbo.fn_CalculateTotalPrice(300000000, 25000000) AS TotalPrice;

-- 11. Test Trigger for Stock Update
INSERT INTO TransactionDetail (TransactionId, LOIDetailId, CarId, Price, Discount, Note)
VALUES (2, 2, 2, 300000000, 25000000, 'Trigger Test');