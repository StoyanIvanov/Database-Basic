--Using SQL queries create Hotel database with the following entities:
CREATE DATABASE Hotel
GO

USE Hotel
GO
--Employees (Id, FirstName, LastName, Title, Notes)
CREATE TABLE Employees
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL
CONSTRAINT chk_EmployeesFirstName_lenght CHECK(DATALENGTH(FirstName)<51),
LastName NVARCHAR(50) NOT NULL
CONSTRAINT chk_EmployeesLastName_lenght CHECK(DATALENGTH(LastName)<51),
Title NVARCHAR(100)
CONSTRAINT chk_EmployeesTitle_lenght CHECK(DATALENGTH(Title)<101),
Notes NVARCHAR(255)
CONSTRAINT chk_EmployeesNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Employees(FirstName, LastName)
VALUES
('Pesho', 'Georgiev'),
('Pesho', 'Ivanov'),
('Gesho', 'Ivanov')

--Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
CREATE TABLE Customers
(
AccountNumber INT NOT NULL PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL
CONSTRAINT chk_CustomersFirstName_lenght CHECK(DATALENGTH(FirstName)<51),
LastName NVARCHAR(50) NOT NULL
CONSTRAINT chk_CustomersLastName_lenght CHECK(DATALENGTH(LastName)<51),
PhoneNumber VARCHAR(50) NOT NULL
CONSTRAINT chk_CustomersPhoneNumber_lenght CHECK(DATALENGTH(PhoneNumber)<51),
EmergencyName NVARCHAR(100)
CONSTRAINT chk_CustomersEmergencyName_lenght CHECK(DATALENGTH(EmergencyName)<101),
EmergencyNumber VARCHAR(50)
CONSTRAINT chk_CustomersEmergencyNumberr_lenght CHECK(DATALENGTH(EmergencyNumber)<51),
Notes NVARCHAR(255)
CONSTRAINT chk_CustomersNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Customers(AccountNumber, FirstName, LastName, PhoneNumber)
VALUES
(123456, 'Pesho', 'Georgiev', '123456'),
(654321,'Pesho', 'Ivanov', '654321'),
(321654,'Pesho', 'Ivanov', '321654')

--RoomStatus (RoomStatus, Notes)
CREATE TABLE RoomStatus
(
RoomStatus NVARCHAR(20) NOT NULL PRIMARY KEY,
Notes NVARCHAR(255)
CONSTRAINT chk_RoomStatusNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT RoomStatus(RoomStatus)
VALUES
('Used'),
('Free'),
('Cleaning')

--RoomTypes (RoomType, Notes)
CREATE TABLE RoomTypes
(
RoomType NVARCHAR(50) NOT NULL PRIMARY KEY
CONSTRAINT chk_RoomTypesRoomType_lenght CHECK(DATALENGTH(RoomType)<51),
Notes NVARCHAR(255)
CONSTRAINT chk_RoomTypesNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT RoomTypes(RoomType)
VALUES
('Type1'),
('Type2'),
('Type3')

--BedTypes (BedType, Notes)
CREATE TABLE BedTypes
(
BedType NVARCHAR(50) NOT NULL PRIMARY KEY
CONSTRAINT chk_BedTypesBedType_lenght CHECK(DATALENGTH(BedType)<51),
Notes NVARCHAR(255)
CONSTRAINT chk_BedTypesNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT BedTypes(BedType)
VALUES
('Type1'),
('Type2'),
('Type3')

--Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
CREATE TABLE Rooms
(
RoomNumber INT NOT NULL PRIMARY KEY,
RoomType NVARCHAR(50) NOT NULL REFERENCES RoomTypes(RoomType),
BedType NVARCHAR(50) NOT NULL REFERENCES BedTypes(BedType),
Rate INT,
RoomStatus NVARCHAR(20) NOT NULL REFERENCES RoomStatus(RoomStatus),
Notes NVARCHAR(255)
CONSTRAINT chk_RoomsNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Rooms(RoomNumber, RoomType, BedType, RoomStatus)
VALUES
(101, 'Type1', 'Type1', 'Used'),
(201, 'Type2', 'Type2', 'Used'),
(301, 'Type3', 'Type3', 'Used')

--Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
CREATE TABLE Payments
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
EmployeeId INT NOT NULL REFERENCES Employees(Id),
PaymentDate DATE NOT NULL,
AccountNumber INT NOT NULL REFERENCES Customers(AccountNumber),
FirstDateOccupied DATE,
LastDateOccupied DATE,
TotalDays INT,
AmountCharged FLOAT(2) NOT NULL,
TaxRate FLOAT(2),
TaxAmount FLOAT(2),
PaymentTotal FLOAT(2),
Notes NVARCHAR(255)
CONSTRAINT chk_PaymentsNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Payments(EmployeeId, PaymentDate, AccountNumber, AmountCharged)
VALUES
(1,GETDATE(),123456,1),
(2,GETDATE(),654321,2),
(3,GETDATE(),321654,3)

--Occupancies (Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
CREATE TABLE Occupancies
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
EmployeeId INT NOT NULL REFERENCES Employees(Id),
DateOccupied DATE,
AccountNumber INT NOT NULL REFERENCES Customers(AccountNumber),
RoomNumber INT NOT NULL REFERENCES Rooms(RoomNumber),
RateApplied FLOAT(2),
PhoneCharge VARCHAR(3) NOT NULL
CONSTRAINT chk_PhoneCharge CHECK(PhoneCharge IN ('Yes','No')),
Notes NVARCHAR(255)
CONSTRAINT chk_OccupanciesNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Occupancies(EmployeeId, AccountNumber, RoomNumber, PhoneCharge)
VALUES
(1,123456,101,'Yes'),
(2,654321,201,'No'),
(3,321654,301,'Yes')

--Set most appropriate data types for each column. Set primary key to each table. Populate each table with 3 records. 
--Make sure the columns that are present in 2 tables would be of the same data type. 
--Consider which fields are always required and which are optional. 
--Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
