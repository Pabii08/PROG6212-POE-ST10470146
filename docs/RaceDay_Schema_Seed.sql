-- ============================================
-- RaceDay Database Schema and Seed Data
-- Author: Paballo Mmako Maphakela
-- Student: ST10470146
-- Date: 2026-09-04
-- ============================================

-- ============================================
-- CREATE TABLES
-- ============================================

-- Table: User
CREATE TABLE [User] (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    [Role] NVARCHAR(20) NOT NULL CHECK ([Role] IN ('Organiser', 'Participant')),
    DateJoined DATETIME DEFAULT GETDATE() NOT NULL
);
GO

-- Table: Event
CREATE TABLE [Event] (
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserId INT NOT NULL,
    [Name] NVARCHAR(255) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Date] DATETIME NOT NULL,
    [Location] NVARCHAR(255) NOT NULL,
    MaxParticipants INT NULL,
    [Status] NVARCHAR(20) DEFAULT 'Active' NOT NULL CHECK ([Status] IN ('Active', 'Closed', 'Cancelled')),
    CreatedAt DATETIME DEFAULT GETDATE() NOT NULL,
    CONSTRAINT FK_Event_User FOREIGN KEY (OrganiserId) REFERENCES [User](UserId)
);
GO

-- Table: Category
CREATE TABLE Category (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    [Name] NVARCHAR(100) NOT NULL,
    DistanceKm DECIMAL(5,2) NOT NULL,
    AgeGroup NVARCHAR(50) NOT NULL,
    Gender NCHAR(1) NOT NULL CHECK (Gender IN ('M', 'F', 'X')),
    EntryFee DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Category_Event FOREIGN KEY (EventId) REFERENCES [Event](EventId)
);
GO

-- Table: Enrolment
CREATE TABLE Enrolment (
    EnrolmentId INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantId INT NOT NULL,
    CategoryId INT NOT NULL,
    EnrolmentDate DATETIME DEFAULT GETDATE() NOT NULL,
    [Status] NVARCHAR(20) NOT NULL CHECK ([Status] IN ('Pending', 'Confirmed', 'Completed', 'Cancelled')),
    RaceNumber NVARCHAR(20) NULL,
    CONSTRAINT FK_Enrolment_User FOREIGN KEY (ParticipantId) REFERENCES [User](UserId),
    CONSTRAINT FK_Enrolment_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);
GO

-- Table: Result
CREATE TABLE [Result] (
    ResultId INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentId INT NOT NULL UNIQUE,
    FinishTime TIME NULL,
    OverallPosition INT NULL,
    CategoryPosition INT NULL,
    [Status] NVARCHAR(20) NOT NULL CHECK ([Status] IN ('Finished', 'DNF', 'DNS')),
    CONSTRAINT FK_Result_Enrolment FOREIGN KEY (EnrolmentId) REFERENCES Enrolment(EnrolmentId)
);
GO

-- Table: WeatherInfo
CREATE TABLE WeatherInfo (
    WeatherInfoId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL UNIQUE,
    RecordedDate DATETIME DEFAULT GETDATE() NOT NULL,
    TemperatureC DECIMAL(4,1) NULL,
    [Condition] NVARCHAR(100) NULL,
    WindSpeedKph DECIMAL(5,1) NULL,
    HumidityPercent INT NULL,
    CONSTRAINT FK_WeatherInfo_Event FOREIGN KEY (EventId) REFERENCES [Event](EventId)
);
GO

-- ============================================
-- INSERT SAMPLE DATA
-- ============================================

-- Insert Users (Organisers and Participants)
INSERT INTO [User] (Email, PasswordHash, FirstName, LastName, [Role], DateJoined)
VALUES
    ('organiser1@raceday.co.za', 'hashed_pw_org1', 'Thabo', 'Nkosi', 'Organiser', GETDATE()),
    ('organiser2@raceday.co.za', 'hashed_pw_org2', 'Anika', 'van der Merwe', 'Organiser', GETDATE()),
    ('runner1@example.com', 'hashed_pw_run1', 'Zanele', 'Mthembu', 'Participant', GETDATE()),
    ('runner2@example.com', 'hashed_pw_run2', 'James', 'Petersen', 'Participant', GETDATE());
GO

-- Insert Events
INSERT INTO [Event] (OrganiserId, [Name], [Description], [Date], [Location], MaxParticipants, [Status], CreatedAt)
VALUES
    (1, 'Soweto Marathon 2026', 'The iconic Soweto Marathon through the streets of Soweto.', '2026-11-01 06:00:00', 'Soweto, Johannesburg', 25000, 'Active', GETDATE()),
    (1, 'Cape Town Cycle Tour 2026', 'The world''s largest timed cycle race.', '2026-03-08 06:30:00', 'Cape Town', 35000, 'Active', GETDATE()),
    (2, 'Durban Park Run #100', 'Celebrating the 100th Durban park run with a special event.', '2026-05-15 07:00:00', 'Durban Botanical Gardens', 500, 'Active', GETDATE());
GO

-- Insert Categories for Events
INSERT INTO Category (EventId, [Name], DistanceKm, AgeGroup, Gender, EntryFee)
VALUES
    (1, '42.2km Open Male', 42.2, 'Open', 'M', 200.00),
    (1, '42.2km Open Female', 42.2, 'Open', 'F', 200.00),
    (1, '21.1km Junior Male', 21.1, 'U23', 'M', 100.00),
    (2, '109km Elite Men', 109.0, 'Open', 'M', 400.00),
    (2, '109km Elite Women', 109.0, 'Open', 'F', 400.00),
    (3, '5km Open', 5.0, 'Open', 'X', 0.00);
GO

-- Insert Enrolments
INSERT INTO Enrolment (ParticipantId, CategoryId, EnrolmentDate, [Status], RaceNumber)
VALUES
    (3, 1, GETDATE(), 'Confirmed', 'SOW-001'),
    (4, 2, GETDATE(), 'Confirmed', 'SOW-002'),
    (4, 4, GETDATE(), 'Pending', NULL),
    (3, 6, GETDATE(), 'Confirmed', 'DRB-001');
GO

-- Insert Results
INSERT INTO [Result] (EnrolmentId, FinishTime, OverallPosition, CategoryPosition, [Status])
VALUES
    (1, '03:45:22', 102, 45, 'Finished'),
    (2, '04:12:10', 305, 78, 'Finished'),
    (4, '00:22:15', 8, 3, 'Finished');
GO

-- Insert WeatherInfo
INSERT INTO WeatherInfo (EventId, RecordedDate, TemperatureC, [Condition], WindSpeedKph, HumidityPercent)
VALUES
    (1, GETDATE(), 18.5, 'Partly Cloudy', 12.0, 65),
    (2, GETDATE(), 22.0, 'Sunny', 8.0, 55);
GO

-- ============================================
-- VERIFY SAMPLE DATA (Optional SELECT statements)
-- ============================================
-- SELECT * FROM [User];
-- SELECT * FROM [Event];
-- SELECT * FROM Category;
-- SELECT * FROM Enrolment;
-- SELECT * FROM [Result];
-- SELECT * FROM WeatherInfo;
-- GO