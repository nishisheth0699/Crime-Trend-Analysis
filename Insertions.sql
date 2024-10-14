USE DMDDProject;
GO




INSERT INTO [dbo].[City]
    ([City_ID], [City_Name], [State], [Latitude], [Longitude])
VALUES
    (1, 'Boston', 'MA', 42.3601, -71.0589),
    (2, 'Worcester', 'MA', 42.2626, -71.8023),
    (3, 'Springfield', 'MA', 42.1015, -72.5898),
    (4, 'Lowell', 'MA', 42.6334, -71.3162),
    (5, 'Cambridge', 'MA', 42.3736, -71.1097),
    (6, 'New Bedford', 'MA', 41.6362, -70.9342),
    (7, 'Brockton', 'MA', 42.0834, -71.0184),
    (8, 'Quincy', 'MA', 42.2529, -71.0023),
    (9, 'Lynn', 'MA', 42.4668, -70.9495),
    (10, 'Fall River', 'MA', 41.7015, -71.1550),
    (11, 'Somerville', 'MA', 42.3876, -71.0995),
    (12, 'Lawrence', 'MA', 42.7070, -71.1631),
    (13, 'Waltham', 'MA', 42.3765, -71.2356),
    (14, 'Haverhill', 'MA', 42.7762, -71.0773),
    (15, 'Malden', 'MA', 42.4251, -71.0662),
    (16, 'Medford', 'MA', 42.4184, -71.1062),
    (17, 'Taunton', 'MA', 41.9001, -71.0898),
    (18, 'Chicopee', 'MA', 42.1487, -72.6079),
    (19, 'Everett', 'MA', 42.4084, -71.0537),
    (20, 'Revere', 'MA', 42.4084, -71.0119),
    (21, 'Winthrop', 'MA', 42.3770, -70.9818),
    (22, 'Chelsea', 'MA', 42.3918, -71.0328),
    (23, 'Watertown', 'MA', 42.3724, -71.1828),
    (24, 'Arlington', 'MA', 42.4154, -71.1564),
    (25, 'Belmont', 'MA', 42.3951, -71.1787),
    (26, 'Beverly', 'MA', 42.5584, -70.8800),
    (27, 'Braintree', 'MA', 42.2223, -71.0023),
    (28, 'Brookline', 'MA', 42.3317, -71.1212),
    (29, 'Burlington', 'MA', 42.5048, -71.1956),
    (30, 'Danvers', 'MA', 42.5751, -70.9326);
GO

INSERT INTO [dbo].[Community]
    ([Community_ID], [Community_Name], [Population], [City_ID])
VALUES
    (1, 'Community1', 10000, 1),
    (2, 'Community2', 25000, 2),
    (3, 'Community3', 5000, 3),
    (4, 'Community4', 15000, 4),
    (5, 'Community5', 30000, 5),
    (6, 'Community6', 2000, 6),
    (7, 'Community7', 4000, 7),
    (8, 'Community8', 8000, 8),
    (9, 'Community9', 1000, 9),
    (10, 'Community10', 5000, 10),
    (11, 'Community11', 12000, 11),
    (12, 'Community12', 3000, 12),
    (13, 'Community13', 7000, 13),
    (14, 'Community14', 20000, 14),
    (15, 'Community15', 50000, 15),
    (16, 'Community16', 4000, 16),
    (17, 'Community17', 1000, 17),
    (18, 'Community18', 6000, 18),
    (19, 'Community19', 15000, 19),
    (20, 'Community20', 3000, 20),
    (21, 'Community21', 1000, 21),
    (22, 'Community22', 5000, 22),
    (23, 'Community23', 8000, 23),
    (24, 'Community24', 12000, 24),
    (25, 'Community25', 4000, 25),
    (26, 'Community26', 2000, 26),
    (27, 'Community27', 10000, 27),
    (28, 'Community28', 5000, 28),
    (29, 'Community29', 3000, 29),
    (30, 'Community30', 15000, 30);

GO

INSERT INTO [dbo].[Crime_Type]
    ([CrimeType_ID], [Crime_Type])
VALUES
    (1, 'Robbery'),
    (2, 'Burglary'),
    (3, 'Assault'),
    (4, 'Theft'),
    (5, 'Vandalism'),
    (6, 'Fraud'),
    (7, 'Drug Offense'),
    (8, 'Sexual Offense'),
    (9, 'Kidnapping'),
    (10, 'Homicide'),
    (11, 'Domestic Violence'),
    (12, 'Stalking'),
    (13, 'Harassment'),
    (14, 'Arson'),
    (15, 'DUI'),
    (16, 'Weapons Offense'),
    (17, 'Trespassing'),
    (18, 'Disorderly Conduct'),
    (19, 'Hate Crime'),
    (20, 'Embezzlement'),
    (21, 'Identity Theft'),
    (22, 'Forgery'),
    (23, 'Counterfeiting'),
    (24, 'Robbery of Motor Vehicle'),
    (25, 'Car Theft'),
    (26, 'Breaking and Entering'),
    (27, 'Larceny'),
    (28, 'Shoplifting'),
    (29, 'Credit Card Fraud'),
    (30, 'Harassment by Telephone');
GO

INSERT INTO [dbo].[Neighborhood]
    ([Neighborhood_ID], [Neighborhood_Name], [Community_ID])
VALUES
    (1, 'Back Bay', 1),
    (2, 'Beacon Hill', 1),
    (3, 'South End', 1),
    (4, 'Charlestown', 2),
    (5, 'East Boston', 2),
    (6, 'South Boston', 2),
    (7, 'Allston/Brighton', 3),
    (8, 'Dorchester', 3),
    (9, 'Roxbury', 3),
    (10, 'Jamaica Plain', 4),
    (11, 'West Roxbury', 4),
    (12, 'Hyde Park', 4),
    (13, 'Mattapan', 4),
    (14, 'Cambridgeport', 5),
    (15, 'East Cambridge', 5),
    (16, 'North Cambridge', 5),
    (17, 'Porter Square', 5),
    (18, 'Agassiz', 5),
    (19, 'Riverside', 6),
    (20, 'Mid-Cambridge', 6),
    (21, 'West Cambridge', 6),
    (22, 'Harvard Square', 6),
    (23, 'Area 2/MIT', 6),
    (24, 'Inman Square', 6),
    (25, 'Cambridgeport', 6),
    (26, 'Kendall Square', 6),
    (27, 'Central Square', 6),
    (28, 'North Cambridge', 6),
    (29, 'Agassiz', 6),
    (30, 'Porter Square', 6);

GO

INSERT INTO [dbo].[Weather]
    ([Weather_ID], [Wind_Speed], [Humidity], [Precipitation])
VALUES
    (1, '10 mph', 65.2, 0.2),
    (2, '5 mph', 72.6, 0.0),
    (3, '15 mph', 81.4, 0.8),
    (4, '20 mph', 68.7, 1.2),
    (5, '10 mph', 43.2, 0.0),
    (6, '5 mph', 57.8, 0.0),
    (7, '15 mph', 68.1, 0.1),
    (8, '20 mph', 77.3, 0.3),
    (9, '10 mph', 49.6, 0.0),
    (10, '5 mph', 63.5, 0.0),
    (11, '15 mph', 76.8, 0.0),
    (12, '20 mph', 82.4, 0.4),
    (13, '10 mph', 72.6, 0.0),
    (14, '5 mph', 81.2, 0.0),
    (15, '15 mph', 68.3, 0.3),
    (16, '20 mph', 43.9, 0.8),
    (17, '10 mph', 57.4, 0.0),
    (18, '5 mph', 68.9, 0.0),
    (19, '15 mph', 77.6, 0.1),
    (20, '20 mph', 49.3, 0.0),
    (21, '10 mph', 63.6, 0.2),
    (22, '5 mph', 76.9, 0.1),
    (23, '15 mph', 82.3, 0.3),
    (24, '20 mph', 72.4, 0.0),
    (25, '10 mph', 81.1, 0.0),
    (26, '5 mph', 68.2, 0.0),
    (27, '15 mph', 43.8, 0.0),
    (28, '20 mph', 57.1, 0.0),
    (29, '10 mph', 68.8, 0.1),
    (30, '5 mph', 77.5, 0.0);

GO


INSERT INTO [dbo].[Incident]
    ([Incident_ID], [Date], [City_ID], [Weather_ID])
VALUES
    (1, '2021-01-02 10:30:00', 1, 1),
    (2, '2021-01-04 15:20:00', 2, 3),
    (3, '2021-01-08 07:45:00', 3, 2),
    (4, '2021-01-12 21:00:00', 4, 5),
    (5, '2021-01-15 11:10:00', 5, NULL),
    (6, '2021-01-19 14:30:00', 6, 1),
    (7, '2021-02-01 16:45:00', 7, 3),
    (8, '2021-02-03 09:20:00', 8, 2),
    (9, '2021-02-07 19:00:00', 9, 5),
    (10, '2021-02-10 08:15:00', 10, NULL),
    (11, '2021-02-14 13:30:00', 1, 1),
    (12, '2021-03-01 12:00:00', 2, 3),
    (13, '2021-03-03 17:30:00', 3, 2),
    (14, '2021-03-07 21:00:00', 4, 5),
    (15, '2021-03-10 10:45:00', 5, NULL),
    (16, '2021-03-14 14:00:00', 6, 1),
    (17, '2021-04-01 18:00:00', 7, 3),
    (18, '2021-04-03 08:30:00', 8, 2),
    (19, '2021-04-07 16:15:00', 9, 5),
    (20, '2021-04-10 09:00:00', 10, NULL),
    (21, '2021-05-01 11:20:00', 1, 1),
    (22, '2021-05-04 14:30:00', 2, 3),
    (23, '2021-05-08 22:15:00', 3, 2),
    (24, '2021-05-12 16:00:00', 4, 5),
    (25, '2021-05-15 10:30:00', 5, NULL),
    (26, '2021-05-19 19:45:00', 6, 1),
    (27, '2021-06-01 13:00:00', 7, 3),
    (28, '2021-06-03 10:10:00', 8, 2),
    (29, '2021-06-07 17:30:00', 9, 5),
    (30, '2021-06-10 08:45:00', 10, NULL);

GO

INSERT INTO [dbo].[Victim]
    ([Victim_ID], [Name], [DOB], [Gender], [Race])
VALUES
    (1, 'John Smith', '1985-05-10', 'Male', 'White'),
    (2, 'Emily Rodriguez', '1979-08-15', 'Female', 'Hispanic'),
    (3, 'Michael Johnson', '1992-01-02', 'Male', 'Black'),
    (4, 'Sarah Lee', '1988-11-23', 'Female', 'Asian'),
    (5, 'James Davis', '1973-06-17', 'Male', 'Black'),
    (6, 'Jennifer Thompson', '1982-04-20', 'Female', 'White'),
    (7, 'Juan Martinez', '1998-09-30', 'Male', 'Hispanic'),
    (8, 'Karen Lee', '1976-12-07', 'Female', 'Asian'),
    (9, 'Marcus Wright', '1987-03-18', 'Male', 'Black'),
    (10, 'Megan Smith', '1995-07-28', 'Female', 'White'),
    (11, 'Robert Rodriguez', '1965-02-03', 'Male', 'Hispanic'),
    (12, 'Linda Chen', '1979-09-14', 'Female', 'Asian'),
    (13, 'Anthony Davis', '1991-12-29', 'Male', 'Black'),
    (14, 'Sophia Lee', '1999-04-11', 'Female', 'Asian'),
    (15, 'David Johnson', '1978-08-02', 'Male', 'White'),
    (16, 'Ava Hernandez', '1986-01-20', 'Female', 'Hispanic'),
    (17, 'Christopher Brown', '1975-03-11', 'Male', 'Black'),
    (18, 'Emma Kim', '1993-05-25', 'Female', 'Asian'),
    (19, 'Matthew Wilson', '1989-11-15', 'Male', 'White'),
    (20, 'Isabella Garcia', '1971-07-08', 'Female', 'Hispanic'),
    (21, 'Dominique Jackson', '1996-09-04', 'Male', 'Black'),
    (22, 'Grace Lee', '1983-12-31', 'Female', 'Asian'),
    (23, 'Charles Thompson', '1980-06-14', 'Male', 'White'),
    (24, 'Olivia Lopez', '1977-02-22', 'Female', 'Hispanic'),
    (25, 'Taylor Nguyen', '1990-04-05', 'Male', 'Asian'),
    (26, 'Julia Wright', '1974-11-19', 'Female', 'Black'),
    (27, 'Christopher Kim', '1997-03-22', 'Male', 'Asian'),
    (28, 'Kayla Rodriguez', '1981-08-08', 'Female', 'Hispanic'),
    (29, 'Justin Lee', '1994-12-13', 'Male', 'Asian'),
    (30, 'Mia Brown', '1984-07-01', 'Female', 'Black');

    GO


INSERT INTO [dbo].[Officer]
    ([Officer_ID], [Name], [DOB], [Gender], [Race], [Department])
VALUES
    (1, 'John Smith', '1980-05-20', 'Male', 'White', 'Police Department A'),
    (2, 'Jane Doe', '1995-02-10', 'Female', 'Black', 'Police Department B'),
    (3, 'Robert Johnson', '1992-08-15', 'Male', 'Hispanic', 'Police Department A'),
    (4, 'Emily Thompson', '1988-01-01', 'Female', 'Asian', 'Police Department B'),
    (5, 'Michael Davis', '1999-06-30', 'Male', 'Black', 'Police Department A'),
    (6, 'Ashley Brown', '1990-12-25', 'Female', 'White', 'Police Department C'),
    (7, 'David Lee', '1985-03-05', 'Male', 'Asian', 'Police Department D'),
    (8, 'Stephanie Wilson', '1991-11-11', 'Female', 'Hispanic', 'Police Department C'),
    (9, 'James Garcia', '1982-09-08', 'Male', 'Hispanic', 'Police Department D'),
    (10, 'Jessica Kim', '1998-04-15', 'Female', 'Asian', 'Police Department B');

GO




INSERT INTO [dbo].[Crime]
    ([Crime_ID], [CrimeDescription], [CrimeType_ID], [Officer_ID], [City_ID], [Incident_ID])
VALUES
    (1, 'Assault', 1, 1, 1, 1),
    (2, 'Burglary', 2, 2, 1, 2),
    (3, 'Vandalism', 3, 3, 2, 3),
    (4, 'Robbery', 4, 4, 2, 4),
    (5, 'Theft', 5, 5, 3, 5),
    (6, 'Arson', 6, 6, 3, 6),
    (7, 'Homicide', 7, 7, 4, 7),
    (8, 'Drug possession', 8, 8, 4, 8),
    (9, 'Assault', 1, 9, 5, 9),
    (10, 'Burglary', 2, 10, 5, 10),
    (11, 'Vandalism', 3, 1, 6, 11),
    (12, 'Robbery', 4, 2, 6, 12),
    (13, 'Theft', 5, 3, 7, 13),
    (14, 'Arson', 6, 4, 7, 14),
    (15, 'Homicide', 7, 5, 8, 15),
    (16, 'Drug possession', 8, 6, 8, 16),
    (17, 'Assault', 1, 7, 9, 17),
    (18, 'Burglary', 2, 8, 9, 18),
    (19, 'Vandalism', 3, 9, 10, 19),
    (20, 'Robbery', 4, 10, 10, 20),
    (21, 'Theft', 5, 1, 11, 21),
    (22, 'Arson', 6, 2, 11, 22),
    (23, 'Homicide', 7, 3, 12, 23),
    (24, 'Drug possession', 8, 4, 12, 24),
    (25, 'Assault', 1, 5, 13, 25),
    (26, 'Burglary', 2, 6, 13, 26),
    (27, 'Vandalism', 3, 7, 14, 27);


    GO



INSERT INTO [dbo].[Crime_Report]
    ([Report_ID], [Report_Date], [Report_Description], [Officer_ID], [Victim_ID], [Crime_ID], [Incident_ID], [Offender_ID])
VALUES
    (1, '2021-01-15 09:00:00', 'Burglary at Main St', 1, 1, 1, 1, 3),
    (2, '2021-02-05 14:30:00', 'Assault and Battery at Maple Ave', 2, 2, 2, 2, 7),
    (3, '2021-03-12 20:45:00', 'Robbery at Elm St', 3, 3, 3, 3, 2),
    (4, '2021-04-25 11:15:00', 'Car Theft at Pine St', 4, 4, 4, 4, 10),
    (5, '2021-05-18 17:30:00', 'Vandalism at Oak St', 5, 5, 5, 5, 14),
    (6, '2021-06-07 08:00:00', 'Fraud at Cedar St', 6, 6, 6, 6, 18),
    (7, '2021-07-23 22:00:00', 'Arson at Birch St', 7, 7, 7, 7, 23),
    (8, '2021-08-09 13:45:00', 'Breaking and Entering at Walnut St', 8, 8, 8, 8, 6),
    (9, '2021-09-16 10:30:00', 'Grand Larceny at Chestnut St', 9, 9, 9, 9, 9),
    (10, '2021-10-11 19:15:00', 'Forgery at Spruce St', 10, 10, 10, 10, 12),
    (11, '2021-11-28 12:00:00', 'Embezzlement at Pine St', 1, 11, 11, 11, 25),
    (12, '2021-12-14 16:45:00', 'Kidnapping at Cedar St', 2, 12, 12, 12, 1),
    (13, '2021-03-20 10:30:00', 'Assault and Battery at Park St', 3, 13, 13, 13, 26),
    (14, '2021-03-08 16:45:00', 'Vandalism at Grove St', 4, 14, 14, 14, 4),
    (15, '2021-03-17 22:00:00', 'Robbery at Washington St', 5, 15, 15, 15, 16),
    (16, '2021-03-28 09:00:00', 'Burglary at Lincoln St', 6, 16, 16, 16, 21),
    (17, '2021-05-25 17:30:00', 'Breaking and Entering at Jefferson St', 7, 17, 17, 17, 22),
    (18, '2021-06-14 13:45:00', 'Kidnapping at Franklin St', 8, 18, 18, 18, 20),
    (19, '2021-07-27 08:00:00', 'Fraud at Adams St', 9, 19, 19, 19, 23),
    (20, '2021-08-12 20:45:00', 'Arson at Madison St', 2, 20, 20, 20, 21),
    (21, '2021-09-20 11:15:00', 'Car Theft at Hancock St', 1, 21, 21, 21, 2),
    (22, '2021-10-15 22:00:00', 'Grand Larceny at Monroe St', 2, 22, 22, 22, 8),
    (23, '2021-11-30 14:30:00', 'Forgery at Jackson St', 3, 23, 23, 23, 9),
    (24, '2021-12-17 12:00:00', 'Embezzlement at Van Buren St', 4, 24, 24, 24, 11),
    (25, '2021-06-08 19:15:00', 'Robbery at Harrison St', 5, 25, 25, 25, 26),
    (26, '2021-06-16 10:30:00', 'Assault and Battery at Wilson St', 6, 26, 26, 26, 27),
    (27, '2021-06-25 13:45:00', 'Breaking and Entering at Tyler St', 7, 27, 27, 27, 18);


GO


INSERT INTO [dbo].[Offender]
    ([Offender_ID], [Name], [DOB], [Gender], [Race], [Crime_ID])
VALUES
    (1, 'John Doe', '1990-05-12', 'Male', 'White', 1),
    (2, 'Jane Smith', '1985-02-28', 'Female', 'Black', 2),
    (3, 'David Johnson', '1998-09-15', 'Male', 'Hispanic', 3),
    (4, 'Samantha Lee', '2001-11-03', 'Female', 'Asian', 4),
    (5, 'Michael Davis', '1979-08-20', 'Male', 'White', 5),
    (6, 'Michelle Lee', '1992-06-18', 'Female', 'Hispanic', 6),
    (7, 'Christopher Brown', '1995-01-10', 'Male', 'Black', 7),
    (8, 'Maria Rodriguez', '1988-04-26', 'Female', 'Hispanic', 8),
    (9, 'Daniel Kim', '2000-03-22', 'Male', 'Asian', 9),
    (10, 'Emily Chen', '1999-07-08', 'Female', 'Asian', 10),
    (11, 'William Johnson', '1980-12-05', 'Male', 'Black', 11),
    (12, 'Olivia Taylor', '1987-03-01', 'Female', 'White', 12),
    (13, 'Juan Martinez', '1996-05-29', 'Male', 'Hispanic', 13),
    (14, 'Ashley Kim', '2002-02-14', 'Female', 'Asian', 14),
    (15, 'Jacob Jones', '1993-09-17', 'Male', 'White', 15),
    (16, 'Sophia Hernandez', '1998-06-12', 'Female', 'Hispanic', 16),
    (17, 'Ethan Davis', '1982-08-03', 'Male', 'Black', 17),
    (18, 'Isabella Lee', '1991-11-19', 'Female', 'Asian', 18),
    (19, 'Anthony Rodriguez', '1978-04-07', 'Male', 'Hispanic', 19),
    (20, 'Mia Kim', '2004-01-22', 'Female', 'Asian', 20),
    (21, 'Robert Thompson', '1997-02-18', 'Male', 'White', 21),
    (22, 'Avery Hernandez', '2000-07-29', 'Female', 'Hispanic', 22),
    (23, 'Andrew Johnson', '1989-12-25', 'Male', 'Black', 23),
    (24, 'Chloe Davis', '1994-03-09', 'Female', 'White', 24),
    (25, 'Gabriel Lee', '1999-05-02', 'Male', 'Asian', 25),
    (26, 'Victoria Rodriguez', '1990-10-12', 'Female', 'Hispanic', 26),
    (27, 'Samuel Kim', '1984-09-23', 'Male', 'Asian', 27);

