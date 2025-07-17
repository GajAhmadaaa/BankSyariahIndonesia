--Exercise3Case6

CREATE DATABASE SalesPromotion;

USE SalesPromotion;

CREATE TABLE CarModel (
    ModelID INT IDENTITY(1,1) PRIMARY KEY,
    ModelName VARCHAR(50) NOT NULL,
    ModelYear INT NOT NULL,
    Description VARCHAR(200)
);

CREATE TABLE Dealer (
    DealerID INT IDENTITY(1,1) PRIMARY KEY,
    DealerName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(50),
    Region VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE PromotionCampaign (
    CampaignID INT IDENTITY(1,1) PRIMARY KEY,
    CampaignName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    DiscountPercent DECIMAL(4,2) NOT NULL,
    Region VARCHAR(50) NOT NULL,
    Description VARCHAR(500)
);

CREATE TABLE CampaignModel (
    CampaignModelID INT IDENTITY(1,1) PRIMARY KEY,
    CampaignID INT NOT NULL,
    ModelID INT NOT NULL,
    FOREIGN KEY (CampaignID) REFERENCES PromotionCampaign(CampaignID),
    FOREIGN KEY (ModelID) REFERENCES CarModel(ModelID),
);


CREATE TABLE CampaignDealer (
    CampaignDealerID INT IDENTITY(1,1) PRIMARY KEY,
    CampaignID INT NOT NULL,
    DealerID INT NOT NULL,
    FOREIGN KEY (CampaignID) REFERENCES PromotionCampaign(CampaignID),
    FOREIGN KEY (DealerID) REFERENCES Dealer(DealerID),
);

CREATE TABLE CustomerBenefit (
    BenefitID INT IDENTITY(1,1) PRIMARY KEY,
    CampaignID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    EligibleDate DATE NOT NULL,
    CarModelID INT NOT NULL,
    DealerID INT NOT NULL,
    DiscountApplied DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CampaignID) REFERENCES PromotionCampaign(CampaignID),
    FOREIGN KEY (CarModelID) REFERENCES CarModel(ModelID),
    FOREIGN KEY (DealerID) REFERENCES Dealer(DealerID),
);