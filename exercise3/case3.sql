--Exercise3Case3

CREATE DATABASE SparePartProcurement;

USE SparePartProcurement;

CREATE TABLE PartCategory (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(200)
);

CREATE TABLE Part (
    PartId INT IDENTITY(1,1) PRIMARY KEY,
    PartNumber VARCHAR(50) NOT NULL UNIQUE,
    PartName VARCHAR(100) NOT NULL,
    CategoryId INT NOT NULL,
    Description VARCHAR(200),
    FOREIGN KEY (CategoryId) REFERENCES PartCategory(CategoryId)
);

CREATE TABLE Supplier (
    SupplierId INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

CREATE TABLE SupplierPartOffer (
    OfferId INT IDENTITY(1,1) PRIMARY KEY,
    PartId INT NOT NULL,
    SupplierId INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    LeadTimeDays INT NOT NULL,
    SupplierRating DECIMAL(3,1) CHECK (SupplierRating >= 0 AND SupplierRating <= 5),
    FOREIGN KEY (PartId) REFERENCES Part(PartID),
    FOREIGN KEY (SupplierId) REFERENCES Supplier(SupplierId)
);
