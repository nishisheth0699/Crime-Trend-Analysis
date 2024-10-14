USE DMDDProject;
GO
--------------------Triggers------------------------------------------------------------------

CREATE TRIGGER trg_Officer_Audit
ON Officer
AFTER UPDATE
AS
BEGIN
    DECLARE @OldName VARCHAR(50)
    DECLARE @NewName VARCHAR(50)
    DECLARE @AuditMessage VARCHAR(255)

    SELECT @OldName = d.Name, @NewName = i.Name
    FROM deleted d
        JOIN inserted i ON d.Officer_ID = i.Officer_ID

    IF @OldName <> @NewName
    BEGIN
        SELECT @AuditMessage = CONCAT('Officer ID ', CAST(d.Officer_ID AS VARCHAR), 
            ' Name changed from ', @OldName, ' to ', @NewName)
        FROM deleted d
            JOIN inserted i ON d.Officer_ID = i.Officer_ID

        INSERT INTO AuditLog
            (Message)
        VALUES
            (@AuditMessage)
    END
END

GO
-----trigger test---------

UPDATE Officer
SET Name = 'John Doe'
WHERE Officer_ID = 1
GO






CREATE TRIGGER trg_Crime_CheckNull
ON Crime
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT Crime_ID, CrimeType_ID, CrimeDescription, Officer_ID
    FROM inserted
    WHERE CrimeDescription IS NULL)
BEGIN
        RAISERROR ('The Crime Description cannot be NULL.', 16, 1)
        ROLLBACK TRANSACTION
    END
END;
GO

----Null decription check for the above trigger

INSERT INTO [dbo].[Crime]
    ([Crime_ID], [CrimeDescription], [CrimeType_ID], [Officer_ID], [City_ID], [Incident_ID])
VALUES
    (30, null, 1, 1, 1, 1)
GO

-------------ENCRYPTING Report_Description---------------------------------

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password@123';
GO

-- very that master key exists
SELECT name KeyName,
    symmetric_key_id KeyID,
    key_length KeyLength,
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;
GO

CREATE CERTIFICATE MyCertificate WITH SUBJECT = 'My Column Encryption Certificate'
GO

CREATE SYMMETRIC KEY MySymmetricKey WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE MyCertificate
GO
ALTER TABLE Crime_Report
ADD Report_Description_Encrypted VARBINARY(MAX)
GO

OPEN SYMMETRIC KEY MySymmetricKey
DECRYPTION BY CERTIFICATE MyCertificate;
GO

UPDATE Crime_Report
SET Report_Description_Encrypted = ENCRYPTBYKEY(KEY_GUID('MySymmetricKey'), Report_Description)
GO

ALTER TABLE Crime_Report
DROP COLUMN Report_Description
GO

EXEC sp_rename 'Crime_Report.Report_Description_Encrypted', 'Report_Description', 'COLUMN'
GO

----------------------test encription--------------------------------------------------

-----view to get decrypted report description
CREATE VIEW vw_Crime_Report
AS
    SELECT Report_ID, Report_Date, CONVERT(varchar(255), DECRYPTBYKEY(Report_Description)) AS Decrypted_Report_Description,
        Officer_ID, Victim_ID, Crime_ID, Incident_ID
    FROM Crime_Report;
GO

SELECT Report_ID, Report_Date, Decrypted_Report_Description, Officer_ID, Victim_ID, Crime_ID, Incident_ID
FROM vw_Crime_Report
WHERE Report_ID = 1;
GO


-- view that shows the number of crimes each victim has been involved in:
CREATE VIEW [dbo].[Victim_Crime_Count]
AS
    SELECT v.Victim_ID, v.Name, COUNT(cr.Crime_ID) AS Crime_Count
    FROM Victim v
        INNER JOIN Crime_Report rpt ON v.Victim_ID = rpt.Victim_ID
        INNER JOIN Crime cr ON rpt.Crime_ID = cr.Crime_ID
    GROUP BY v.Victim_ID, v.Name
GO



-- Total number of crimes reported in each city:

CREATE VIEW vw_Crime_Count_By_City
AS
    SELECT c.City_Name AS City, COUNT(*) AS Crime_Count
    FROM Incident i
        JOIN City c ON i.City_ID = c.City_ID
    GROUP BY c.City_Name;
GO


CREATE PROCEDURE sp_GetCrimeCountByCity
AS
BEGIN
    SELECT v.City, v.Crime_Count
    FROM vw_Crime_Count_By_City v
END
GO

EXEC sp_GetCrimeCountByCity
GO




-- Total number of crimes reported during each month:

CREATE VIEW dbo.Crime_Count_By_Month 
AS 
 SELECT DATEPART(year, Report_Date) AS [Year], DATEPART(month, Report_Date) AS [Month], COUNT(*) AS Crime_Count
    FROM Crime_Report
    GROUP BY DATEPART(year, Report_Date), DATEPART(month, Report_Date)
GO



CREATE PROCEDURE sp_Crime_Count_By_Month
AS
BEGIN
    SELECT  [Year], [Month], Crime_Count
    FROM Crime_Count_By_Month 
END
GO

EXEC sp_Crime_Count_By_Month
GO

------------------Crime_Count_By_Officer---------------------------------------------------

CREATE FUNCTION dbo.Crime_Count_By_Officer(@OfficerID int)
RETURNS int
AS
BEGIN
    DECLARE @CrimeCount int

    SELECT @CrimeCount = COUNT(Report_Description)
    FROM Crime_Report
    WHERE Officer_ID = @OfficerID

    RETURN @CrimeCount
END
GO



CREATE PROCEDURE dbo.GetCrimeCountByOfficer
AS
BEGIN
    SELECT Officer_ID, dbo.Crime_Count_By_Officer(Officer_ID) AS Crime_Count
    FROM Crime_Report
    GROUP BY Officer_ID
END
GO

EXEC dbo.GetCrimeCountByOfficer
GO

-------Incidents By Date Range----------------
CREATE PROCEDURE dbo.GetIncidentsByDateRange
    @startDate DATE,
    @endDate DATE
AS
BEGIN
    SELECT i.Incident_ID, i.Date, ct.City_Name
    FROM Incident i
        INNER JOIN City ct ON i.City_ID = ct.City_ID
    WHERE i.Date >= @startDate AND i.Date <= @endDate
END
GO

EXEC GetIncidentsByDateRange '01/01/2021','02/04/2021'
GO


-- Procedure to retrieve all the crimes reported by a particular officer:
CREATE PROCEDURE dbo.GetCrimesByOfficer
    @officerID INT
AS
BEGIN
    SELECT c.Officer_ID, c.Crime_ID, cr.Report_Description, c.Incident_ID, City.City_Name
    FROM Crime c
        INNER JOIN Crime_Report cr ON c.Crime_ID = cr.Crime_ID
        INNER JOIN City ON  City.City_ID = c.City_ID
    WHERE cr.Officer_ID = @officerID
END
GO

EXEC GetCrimesByOfficer 1
GO
