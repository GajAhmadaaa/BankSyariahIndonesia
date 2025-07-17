--Exercise3Case5

CREATE DATABASE WarrantySystem;

USE WarrantySystem;

CREATE TABLE Customer (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

CREATE TABLE Car (
    CarId INT IDENTITY(1,1) PRIMARY KEY,
    VIN VARCHAR(17) NOT NULL UNIQUE,
    CustomerId INT NOT NULL,
    Model VARCHAR(50) NOT NULL,
    ManufactureYear INT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

CREATE TABLE WarrantyRegistration (
    WarrantyId INT IDENTITY(1,1) PRIMARY KEY,
    CarId INT NOT NULL UNIQUE,
    PurchaseDate DATE NOT NULL,
    WarrantyPeriodYears INT NOT NULL,
    WarrantyExpiryDate DATE NOT NULL
    FOREIGN KEY (CarId) REFERENCES Car(CarId)
);

CREATE TABLE WarrantyClaim (
    ClaimId INT IDENTITY(1,1) PRIMARY KEY,
    WarrantyId INT NOT NULL,
    ServiceCenter VARCHAR(100) NOT NULL,
    IssueReported VARCHAR(500) NOT NULL,
    RepairDate DATE NOT NULL,
    RepairCost DECIMAL(10,2) NOT NULL,
    ClaimStatus VARCHAR(20) NOT NULL CHECK (ClaimStatus IN ('Submitted', 'Approved', 'Rejected', 'Completed')),
    FOREIGN KEY (WarrantyId) REFERENCES WarrantyRegistration(WarrantyId)
);