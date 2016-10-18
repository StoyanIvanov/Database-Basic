--Using SQL queries create CarRental database with the following entities:
--Set most appropriate data types for each column. Set primary key to each table. 
--Populate each table with 3 records. Make sure the columns that are present in 2 tables would be of the same data type. 
--Consider which fields are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
CREATE DATABASE CarRental
GO

USE CarRental
GO

--Categories (Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
CREATE TABLE Categories
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Category VARCHAR(50) NOT NULL
CONSTRAINT chk_CategoriesCategory_lenght CHECK(DATALENGTH(Category)<51),
DailyRate FLOAT(2),
WeeklyRate FLOAT(2),
MonthlyRate FLOAT(2),
WeekendRate FLOAT(2)
);

INSERT Categories(Category)
VALUES 
('Category1'),
('Category2'),
('Category3')


--Cars (Id, PlateNumber, Make, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
CREATE TABLE Cars
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
PlateNumber NVARCHAR(10) NOT NULL
CONSTRAINT chk_CarsPlateNumber_lenght CHECK(DATALENGTH(PlateNumber)<11),
Make NVARCHAR(5)
CONSTRAINT chk_CarsMake CHECK(Make IN ('New','Old')),
Model NVARCHAR(50)
CONSTRAINT chk_CarsModel_lenght CHECK(DATALENGTH(Model)<51),
CarYear DATE NOT NULL,
CategoryId INT NOT NULL REFERENCES Categories(Id),
Doors INT NOT NULL,
Picture IMAGE,
Condition NVARCHAR(255)
CONSTRAINT chk_CarsCondition_lenght CHECK(DATALENGTH(Condition)<256),
Available VARCHAR(3) NOT NULL DEFAULT('No')
CONSTRAINT chk_CarsAvailable CHECK(Available IN ('No','Yes')),
);

INSERT Cars(PlateNumber, CarYear, CategoryId, Doors, Available)
VALUES 
('123',GETDATE(),1,4,'Yes'),
('345',GETDATE(),1,2,'No'),
('567',GETDATE(),1,3,'Yes')

--Employees (Id, FirstName, LastName, Title, Notes)
CREATE TABLE Employees
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL
CONSTRAINT chk_EmployeesFirstName_lenght CHECK(DATALENGTH(FirstName)<51),
LastName NVARCHAR(50) NOT NULL
CONSTRAINT chk_EmployeesLastName_lenght CHECK(DATALENGTH(LastName)<51),
Title NVARCHAR(50)
CONSTRAINT chk_EmployeesTitle_lenght CHECK(DATALENGTH(Title)<51),
Notes NVARCHAR(255)
CONSTRAINT chk_EmployeesNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Employees(FirstName, LastName)
VALUES 
('Pesho','Peshov'),
('Georgi','Georgiev'),
('Stamat','Stamatov')

--Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
CREATE TABLE Customers
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
DriverLicenceNumber INT NOT NULL,
FullName NVARCHAR(50) NOT NULL
CONSTRAINT chk_CustomersFullName_lenght CHECK(DATALENGTH(FullName)<51),
Address NVARCHAR(255) NOT NULL
CONSTRAINT chk_EmployeesAddress_lenght CHECK(DATALENGTH(Address)<256),
City NVARCHAR(30) NOT NULL
CONSTRAINT chk_CustomersCity_lenght CHECK(DATALENGTH(City)<31),
ZIPCode NVARCHAR(20) NOT NULL
CONSTRAINT chk_CustomersZIPCode_lenght CHECK(DATALENGTH(ZIPCode)<21),
Notes NVARCHAR(255)
CONSTRAINT chk_CustomersNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT Customers(DriverLicenceNumber, FullName, Address, City, ZIPCode )
VALUES 
('123456789','Pesho Peshov', 'address1', 'City1', 'Code1'),
('256458874','Georgi Georgiev', 'address2', 'City2', 'Code2'),
('294658754','Manav Manavof', 'address2', 'City2', 'Code3')

--RentalOrders (Id, EmployeeId, CustomerId, CarId, CarCondition, TankLevel, KilometrageStart, KilometrageEnd, 
--				TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)

CREATE TABLE RentalOrders
(
Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
EmployeeId INT NOT NULL REFERENCES Employees(Id),
CustomerId INT NOT NULL REFERENCES Customers(Id),
CarCondition NVARCHAR(255)
CONSTRAINT chk_RentalOrdersCarCondition_lenght CHECK(DATALENGTH(CarCondition)<256),
TankLevel FLOAT(2),
KilometrageStart INT NOT NULL,
KilometrageEnd INT NOT NULL,
TotalKilometrage INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalDays INT NOT NULL,
RateApplied INT,
TaxRate FLOAT(2),
OrderStatus FLOAT(2),
Notes NVARCHAR(255)
CONSTRAINT chk_RentalOrdersNotes_lenght CHECK(DATALENGTH(Notes)<256),
);

INSERT RentalOrders(EmployeeId, CustomerId, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays)
VALUES 
(1,1,123540,123540,0,GETDATE(),GETDATE(),0),
(2,2,123540,123540,0,GETDATE(),GETDATE(),0),
(3,3,123540,123540,0,GETDATE(),GETDATE(),0)
