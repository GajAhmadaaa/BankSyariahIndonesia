--Exercise3Case4

CREATE DATABASE CarRental;

USE CarRental;

CREATE TABLE RentalBranch(
	BranchId INT IDENTITY(1,1) PRIMARY KEY,
	BranchName VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Vehicle(
	VehicleId INT IDENTITY(1,1) PRIMARY KEY,
	BranchId INT NOT NULL,
    LicensePlate VARCHAR(20) NOT NULL UNIQUE,
    Model VARCHAR(50) NOT NULL,
    Year SMALLINT NOT NULL,
    Mileage INT NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Available', 'Rented', 'Maintenance')),
    FOREIGN KEY (BranchId) REFERENCES RentalBranch(BranchId)
);

CREATE TABLE Customer(
	CustomerId INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
	Address VARCHAR(100)
);

CREATE TABLE Employee(
	EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
	BranchId INT NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    FOREIGN KEY (BranchId) REFERENCES RentalBranch(BranchId)
);

CREATE TABLE RentalContract(
	ContractId INT IDENTITY(1,1) PRIMARY KEY,
    BranchId iNT NOT NULL,
    EmployeeId INT NOT NULL,
    VehicleId INT NOT NULL,
    CustomerId INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalDays SMALLINT NOT NULL,
    DailyRate INT NOT NULL,
    FOREIGN KEY (VehicleId) REFERENCES Vehicle(VehicleId),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
);