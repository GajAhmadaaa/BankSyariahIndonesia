-- FINAL PROJECT: SAMPLE DATA

USE FinalProject;
GO

-- Sample Data for Dealer
INSERT INTO Dealer (DealerName, City, Address, PhoneNumber) VALUES
('Mitsu Auto Center', 'Jakarta', 'Jl. Sudirman No. 123', '021-1234567'),
('Mitsu Prima Motor', 'Surabaya', 'Jl. Basuki Rahmat No. 45', '031-7654321');

-- Sample Data for Car
INSERT INTO Car (CarName, CarType, BasePrice, Year, Color) VALUES
('Pajero Sport', 'SUV', 500000000, 2023, 'Black'),
('Xpander', 'MPV', 250000000, 2023, 'White'),
('Triton', 'Pickup', 400000000, 2022, 'Silver');

-- Sample Data for Customer
INSERT INTO Customer (CustomerName, PhoneNumber, Email, Address) VALUES
('Budi Santoso', '081234567890', 'budi.santoso@example.com', 'Jl. Merdeka No. 1'),
('Ani Wijaya', '087654321098', 'ani.wijaya@example.com', 'Jl. Pahlawan No. 10');

-- Sample Data for SalesOfficer
INSERT INTO SalesOfficer (DealerId, SalesName) VALUES
(1, 'Rina Marlina'),
(1, 'Agus Setiawan'),
(2, 'Dewi Lestari');

-- Sample Data for Leasing
INSERT INTO Leasing (LeasingName, Address, PhoneNumber) VALUES
('Mega Auto Finance', 'Jl. Gatot Subroto No. 78', '021-9876543'),
('Adira Finance', 'Jl. MT Haryono No. 12', '021-5432198');