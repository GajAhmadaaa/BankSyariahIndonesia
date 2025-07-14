create database Exercise1;

use Exercise1;

--Task1
create table Plant(
	PlantId int identity(1,1) primary key, --(identity(1,1) means start from 1 with increment of 1)
	PlantName varchar(30) not null,
	City varchar(50) not null,
	Country varchar(50) not null,
	YearStarted int,
	PlantArea float,
	PhoneNumber int,
	PlantStatus BIT not null -- or PlantStatus varchar(10) CHECK (PlantStatus IN ('Active', 'Inactive', 'Others')) not null
);

--Task2
create table CarModel(
	ModelId int identity(1,1) primary key,
	ModelName varchar(30) not null,
	ModelType varchar(10) not null, -- or ModelType varchar(10) CHECK (ModelType IN ('Sedan', 'SUV', 'MPV')) not null
	EngineCapacity float,
	YearLaunched int,
	FuelType varchar(10), -- or FuelType varchar(10) CHECK (ModelType IN ('Petrol', 'Diesel', 'Electric'))
	BasePrice int
);

--Task 3
create table ProductionPlan(
	PlanId int identity(1,1) primary key,
	PlanName varchar(30) not null,
	PlanMonth int not null,
	PlanYear int not null,
	TargetUnits int not null,
	Notes text
);

--Task4
create table Dealer(
	DealerId int identity(1,1) primary key,
	DealerName varchar(50) not null,
	City varchar(20) not null,
	Region varchar(20) not null,
	Country varchar(20) not null,
	PhoneNumber int not null,
	YearStarted int not null
);

--Task5
create table Customer(
	CustomerId int identity(1,1) primary key,
	CustomerName varchar(50) not null,
);

create table CarSale(
	SaleId bigint identity(1,1) primary key,
	CustomerId INT not null,
	ModelId int not null,
	SaleDate date not null,
	Price int not null,
	PaymentType varchar(10), -- or PaymentType varchar(10) CHECK (PaymentType IN ('Full', 'Credit', 'Others'))

	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (ModelId) references CarModel(ModelId)
);

--Task6
create table MaintenanceLog(
	MaintenanceId bigint identity(1,1) primary key,
	CustomerId int not null,
	ModelId int not null,
	MaintenanceDate date not null,
	ServiceType varchar(20) not null,
	ServiceCenter varchar(20) not null,

	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (ModelId) references CarModel(ModelId)
);

--Task7
create table PartInventory(
	PartId bigint identity(1,1) primary key,
	PartName varchar(10) not null,
	PartNumber int not null,
	PartCategory varchar(10) not null,
	Stock int not null,
	UnitPrice int not null,
	PartStatus BIT not null
);

--Task8
create table CustomerFeedback(
	FeedbackId int identity(1,1) primary key,
	CustomerId int not null,
	ModelId int not null,
	FeedbackDate date not null,
	Rating int not null, -- or Rating int CHECK (Rating IN ('1', '2', '3','4','5'))
	Comment text,

	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (ModelId) references CarModel(ModelId)
);