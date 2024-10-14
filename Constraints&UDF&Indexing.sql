USE DMDDProject;
GO

----------------------CONSTRAINTS-------------------------

ALTER TABLE City
ADD CONSTRAINT CHK_Longitude CHECK (Longitude >= -180 AND Longitude <= 180);

GO

-- CHECK constraint to enforce the minimum age requirement:
CREATE FUNCTION dbo.fn_CalculateAge(@DOB DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    SET @Age = DATEDIFF(YEAR, @DOB, GETDATE());
    RETURN @Age;
END;

GO

ALTER TABLE Officer
ADD CONSTRAINT CHK_OfficerMinimumAge
CHECK (dbo.fn_CalculateAge(DOB) >= 21);

GO

--------Only reports of 2021 in MA
ALTER TABLE Incident 
ADD CONSTRAINT CHK_IncidentDateRange
CHECK (Date >= '2021-01-01' AND Date <= '2021-12-31');

GO

ALTER TABLE Crime_Report
ADD CONSTRAINT CK_Crime_Report_Report_Date CHECK (Report_Date <= GETDATE());

GO

ALTER TABLE Community
ADD CONSTRAINT CHK_Community_Population CHECK (Population >= 0)


GO
-- Check constraint to ensure that the crime report date is not before the incident date:
--  UDF
CREATE FUNCTION fn_CheckReportDate (@Report_Date DATETIME, @Incident_ID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT;

    SELECT @Result = CASE WHEN @Report_Date >= Date THEN 1 ELSE 0 END
    FROM Incident
    WHERE Incident_ID = @Incident_ID;

    RETURN @Result;
END;
GO

--  CHECK constraint using UDF
ALTER TABLE Crime_Report
ADD CONSTRAINT CHK_Crime_Report_ReportDate CHECK (dbo.fn_CheckReportDate(Report_Date, Incident_ID) = 1);
GO

----------indexing--------------------------------------------
CREATE NONCLUSTERED INDEX IX_Incident_City_ID
ON Incident (City_ID);


CREATE NONCLUSTERED INDEX idx_Incident_City_ID_Incident_Date
ON Incident (City_ID, [Date])


CREATE NONCLUSTERED INDEX IX_Crime_Report_Report_Date ON Crime_Report (Report_Date)
GO

CREATE NONCLUSTERED INDEX idx_CrimeReport_OfficerID ON Crime_Report (Officer_ID);
GO
