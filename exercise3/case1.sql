--Exercise3Case1

CREATE DATABASE VehicleTesting;

USE VehicleTesting;

CREATE TABLE CarModel (
    ModelId INT IDENTITY(1,1) PRIMARY KEY,
    ModelName VARCHAR(50) NOT NULL,
    ModelYear INT NOT NULL,
    Description VARCHAR(200)
);

CREATE TABLE PrototypeVehicle (
    PrototypeId INT IDENTITY(1,1) PRIMARY KEY,
    ModelId INT NOT NULL,
    PrototypeNumber INT NOT NULL,
    ManufactureDate DATE NOT NULL,
    FOREIGN KEY (ModelId) REFERENCES CarModel(ModelId)
);

CREATE TABLE TestEngineer (
    EngineerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

CREATE TABLE TestLocation (
    LocationId INT IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE VehicleTest (
    TestId INT IDENTITY(1,1) PRIMARY KEY,
    PrototypeId INT NOT NULL,
    EngineerId INT NOT NULL,
    LocationId INT NOT NULL,
    TestType VARCHAR(50) NOT NULL,
    TestDate DATE NOT NULL,
    TestResult BIT NOT NULL,
    TestNotes VARCHAR(500),
    FOREIGN KEY (PrototypeId) REFERENCES PrototypeVehicle(PrototypeId),
    FOREIGN KEY (EngineerId) REFERENCES TestEngineer(EngineerId),
    FOREIGN KEY (LocationId) REFERENCES TestLocation(LocationId)
);
