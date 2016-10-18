--DDL
CREATE TABLE Towns (
	TownID INT,
	TownName VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Towns PRIMARY KEY(TownID)
)

CREATE TABLE Airports (
	AirportID INT,
	AirportName VARCHAR(50) NOT NULL,
	TownID INT NOT NULL,
	CONSTRAINT PK_Airports PRIMARY KEY(AirportID),
	CONSTRAINT FK_Airports_Towns FOREIGN KEY(TownID) REFERENCES Towns(TownID)
)

CREATE TABLE Airlines (
	AirlineID INT,
	AirlineName VARCHAR(30) NOT NULL,
	Nationality VARCHAR(30) NOT NULL,
	Rating INT DEFAULT(0),
	CONSTRAINT PK_Airlines PRIMARY KEY(AirlineID)
)

CREATE TABLE Customers (
	CustomerID INT,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	DateOfBirth DATE NOT NULL,
	Gender VARCHAR(1) NOT NULL CHECK (Gender='M' OR Gender='F'),
	HomeTownID INT NOT NULL,
	CONSTRAINT PK_Customers PRIMARY KEY(CustomerID),
	CONSTRAINT FK_Customers_Towns FOREIGN KEY(HomeTownID) REFERENCES Towns(TownID)
)

CREATE TABLE Flights(
FlightID INT PRIMARY KEY NOT NULL,
DepartureTime DATETIME2 NOT NULL,
ArrivalTime DATETIME2 NOT NULL,
Status VARCHAR(9)
CONSTRAINT chk_Status CHECK ([Status] IN ('Departing', 'Delayed', 'Arrived', 'Cancelled')),
OriginAirportID INT NOT NULL
CONSTRAINT FK_OriginAirport_Airport FOREIGN KEY(OriginAirportID)
REFERENCES [dbo].[Airports](AirportID),
[DestinationAirportID] INT NOT NULL
CONSTRAINT FK_DestinationAirport_Airport FOREIGN KEY(DestinationAirportID)
REFERENCES [dbo].[Airports](AirportID),
AirlineID INT NOT NULL
CONSTRAINT FK_Airline_Airline FOREIGN KEY (AirlineID)
REFERENCES [dbo].[Airlines](AirlineID)
)

CREATE TABLE Tickets(
TicketID INT PRIMARY KEY NOT NULL,
Price DECIMAL(8,2) NOT NULL,
Class VARCHAR(6)
CONSTRAINT chk_Class CHECK (Class IN ('First', 'Second', 'Third')),
Seat VARCHAR(5) NOT NULL,
CustomerID INT NOT NULL
CONSTRAINT FK_Customer_Customer FOREIGN KEY (CustomerID)
REFERENCES [dbo].[Customers](CustomerID),
[FlightID] INT NOT NULL
CONSTRAINT FK_Flight_Flight FOREIGN KEY (FlightID)
REFERENCES [dbo].[Flights](FlightID),
)

INSERT INTO Towns(TownID, TownName)
VALUES
(1, 'Sofia'),
(2, 'Moscow'),
(3, 'Los Angeles'),
(4, 'Athene'),
(5, 'New York')

INSERT INTO Airports(AirportID, AirportName, TownID)
VALUES
(1, 'Sofia International Airport', 1),
(2, 'New York Airport', 5),
(3, 'Royals Airport', 1),
(4, 'Moscow Central Airport', 2)

INSERT INTO Airlines(AirlineID, AirlineName, Nationality, Rating)
VALUES
(1, 'Royal Airline', 'Bulgarian', 200),
(2, 'Russia Airlines', 'Russian', 150),
(3, 'USA Airlines', 'American', 100),
(4, 'Dubai Airlines', 'Arabian', 149),
(5, 'South African Airlines', 'African', 50),
(6, 'Sofia Air', 'Bulgarian', 199),
(7, 'Bad Airlines', 'Bad', 10)

INSERT INTO Customers(CustomerID, FirstName, LastName, DateOfBirth, Gender, HomeTownID)
VALUES
(1, 'Cassidy', 'Isacc', '19971020', 'F', 1),
(2, 'Jonathan', 'Half', '19830322', 'M', 2),
(3, 'Zack', 'Cody', '19890808', 'M', 4),
(4, 'Joseph', 'Priboi', '19500101', 'M', 5),
(5, 'Ivy', 'Indigo', '19931231', 'F', 1)
