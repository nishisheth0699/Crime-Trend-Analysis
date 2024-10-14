
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DMDDProject')
DROP DATABASE DMDDProject
GO
CREATE DATABASE [DMDDProject]
go
USE DMDDProject;
GO


-- 1.City table
CREATE TABLE City
(
    City_ID INT PRIMARY KEY,
    City_Name VARCHAR(50) NOT NULL,
    [State] VARCHAR(50) NOT NULL,
    [Latitude] DECIMAL,
    [Longitude] DECIMAL
);
GO

-- 2.Community table
CREATE TABLE Community
(
    Community_ID INT PRIMARY KEY,
    Community_Name VARCHAR(50) NOT NULL,
    [Population] INT,
    City_ID INT NOT NULL,
    FOREIGN KEY (City_ID) REFERENCES City(City_ID)
);
GO
-- 3.Neighborhood table
CREATE TABLE Neighborhood
(
    Neighborhood_ID INT PRIMARY KEY,
    Neighborhood_Name VARCHAR(50) NOT NULL,
    Community_ID INT NOT NULL,
    FOREIGN KEY (Community_ID) REFERENCES Community(Community_ID)
);
GO

-- 4.Weather table
CREATE TABLE Weather
(
    Weather_ID INT PRIMARY KEY,
    Wind_Speed VARCHAR(20),
    Humidity FLOAT,
    Precipitation FLOAT
);
GO
-- 5.Incident table
CREATE TABLE Incident
(
    Incident_ID INT PRIMARY KEY ,
    Date DATETIME NOT NULL,
    City_ID INT NOT NULL,
    Weather_ID INT,
    FOREIGN KEY (City_ID) REFERENCES City(City_ID),
    FOREIGN KEY (Weather_ID) REFERENCES Weather(Weather_ID)
);
GO
-- 6.Officer table
CREATE TABLE Officer
(
    Officer_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DOB DATETIME NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Race VARCHAR(20) NOT NULL,
    Department VARCHAR(20) NOT NULL
);
GO

-- 7.Victim table
CREATE TABLE Victim
(
    Victim_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DOB DATETIME NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Race VARCHAR(20) NOT NULL
);
GO

-- 8.Crime_Type table
CREATE TABLE Crime_Type
(
    CrimeType_ID INT PRIMARY KEY,
    Crime_Type VARCHAR(26)
);
GO

-- 9.Crime table
CREATE TABLE Crime
(
    Crime_ID INT PRIMARY KEY,
    CrimeDescription VARCHAR(255),
    CrimeType_ID INT NOT NULL,
    Officer_ID INT NOT NULL,
    City_ID INT NOT NULL,
    Incident_ID INT NOT NULL,
    FOREIGN KEY (CrimeType_ID) REFERENCES Crime_Type(CrimeType_ID),
    FOREIGN KEY (Officer_ID) REFERENCES Officer(Officer_ID),
    FOREIGN KEY (City_ID) REFERENCES City(City_ID),
    FOREIGN KEY (Incident_ID) REFERENCES Incident(Incident_ID)
);
GO

-- 10.Offender table
CREATE TABLE Offender
(
    Offender_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DOB DATETIME NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Race VARCHAR(20) NOT NULL,
    Crime_ID INT NOT NULL,
    FOREIGN KEY (Crime_ID) REFERENCES Crime(Crime_ID),
);
GO

-- 11.Crime_Report table
CREATE TABLE Crime_Report
(
    Report_ID INT PRIMARY KEY,
    Report_Date DATETIME NOT NULL,
    Report_Description VARCHAR(255),
    Officer_ID INT NOT NULL,
    Victim_ID INT NOT NULL,
    Crime_ID INT NOT NULL,
    Incident_ID INT NOT NULL,
    Offender_ID INT
    FOREIGN KEY (Offender_ID) REFERENCES Offender(Offender_ID),
    FOREIGN KEY (Officer_ID) REFERENCES Officer(Officer_ID),
    FOREIGN KEY (Victim_ID) REFERENCES Victim(Victim_ID),
    FOREIGN KEY (Crime_ID) REFERENCES Crime(Crime_ID),
);
GO

----------------AuditLog table---------------------------------------------------------------
CREATE TABLE [dbo].[AuditLog]
(
    [LogID] [int] IDENTITY(1,1) NOT NULL,
    [Message] [varchar](255) NOT NULL,
    [LogDate] [datetime] NOT NULL CONSTRAINT [DF_AuditLog_LogDate]  DEFAULT (getdate()),
    CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED 
    (
        [LogID] ASC
    )
) ON [PRIMARY]
GO

-----please exec Constraints&UDF.sql Next