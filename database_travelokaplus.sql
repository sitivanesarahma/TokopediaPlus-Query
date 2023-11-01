CREATE DATABASE travelokaplus;

USE travelokaplus;

-- users
CREATE TABLE Users (
    UserID INT UNIQUE NOT NULL,
    Username VARCHAR(15) NOT NULL,
    Email VARCHAR(25) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    FirstName VARCHAR(10) NOT NULL,
    LastName VARCHAR(10) NOT NULL,
    Gender CHAR(1),
    DateOfBirth DATE,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(50),
    City VARCHAR(30),
    Country VARCHAR(30),
    PostalCode VARCHAR(10),
    PRIMARY KEY (UserID)
);
DESCRIBE users;

-- Insert data into Users table with different emails and usernames
INSERT INTO Users (UserID, Username, Email, Password, FirstName, LastName, Gender, DateOfBirth, PhoneNumber, Address, City, Country, PostalCode)
VALUES
    (1, 'john.doe', 'john.doe@example.com', 'password1', 'John', 'Doe', 'M', '1990-01-15', '123-456-7890', '123 Main St', 'New York', 'USA', '10001'),
    (2, 'jane.smith', 'jane.smith@example.com', 'password2', 'Jane', 'Smith', 'F', '1988-05-20', '987-654-3210', '456 Elm St', 'Los Angeles', 'USA', '90001'),
    (3, 'david.lee', 'david.lee@example.com', 'password3', 'David', 'Lee', 'M', '1992-07-10', '555-555-5555', '789 Oak St', 'Chicago', 'USA', '60001'),
    (4, 'sarah.miller', 'sarah.miller@example.com', 'password4', 'Sarah', 'Miller', 'F', '1989-03-30', '666-666-6666', '1011 Maple St', 'Houston', 'USA', '70001'),
    (5, 'mary.johnson', 'mary.johnson@example.com', 'password5', 'Mary', 'Johnson', 'F', '1987-11-25', '777-777-7777', '1213 Pine St', 'Miami', 'USA', '80001');

-- bookings
CREATE TABLE Bookings (
    BookingID INT UNIQUE NOT NULL,
    UserID INT,
    TransportationID INT,
    HotelID INT,
    SpotID INT,
    TotalPrice DECIMAL(10, 2),
    Status VARCHAR(20) NOT NULL,
    BookingDate DATE,
    CheckInDate DATE,
    CheckOutDate DATE,
    PRIMARY KEY (BookingID),
    CONSTRAINT FK_Users_Bookings FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT FK_Transportation_Bookings FOREIGN KEY (TransportationID) REFERENCES Transportation(TransportationID),
    CONSTRAINT FK_Hotels_Bookings FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID),
    CONSTRAINT FK_Spots_Bookings FOREIGN KEY (SpotID) REFERENCES TouristSpots(SpotID)
);
DESCRIBE Bookings;

-- Insert data into Bookings table
INSERT INTO Bookings (BookingID, UserID, TransportationID, HotelID, SpotID, TotalPrice, Status, BookingDate, CheckInDate, CheckOutDate)
VALUES
    (1, 1, 1, 1, 1, 500.00, 'Confirmed', '2023-10-15', '2023-11-01', '2023-11-10'),
    (2, 2, 2, 2, 2, 750.00, 'Pending', '2023-10-20', '2023-11-05', '2023-11-12'),
    (3, 3, 3, 3, 3, 600.00, 'Confirmed', '2023-10-25', '2023-11-15', '2023-11-20'),
    (4, 4, 4, 4, 4, 900.00, 'Confirmed', '2023-10-30', '2023-11-10', '2023-11-18'),
    (5, 5, 5, 5, 5, 800.00, 'Pending', '2023-10-22', '2023-11-08', '2023-11-16');


-- transportation
CREATE TABLE Transportation (
    TransportationID INT UNIQUE NOT NULL,
    Type VARCHAR(20) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    DepartureDate DATE,
    ArrivalDate DATE,
    DepartureCity VARCHAR(30),
    ArrivalCity VARCHAR(30),
    Carrier VARCHAR(50),
    PRIMARY KEY (TransportationID)
);
DESCRIBE Transportation;

-- Insert data into Transportation table
INSERT INTO Transportation (TransportationID, Type, Price, DepartureDate, ArrivalDate, DepartureCity, ArrivalCity, Carrier)
VALUES
    (1, 'Flight', 300.00, '2023-11-01', '2023-11-10', 'New York', 'Los Angeles', 'ABC Airlines'),
    (2, 'Train', 200.00, '2023-11-05', '2023-11-12', 'Los Angeles', 'Chicago', 'XYZ Trains'),
    (3, 'Bus', 150.00, '2023-11-15', '2023-11-20', 'Chicago', 'Houston', 'City Buses'),
    (4, 'Flight', 400.00, '2023-11-10', '2023-11-18', 'Houston', 'Miami', 'DEF Airlines'),
    (5, 'Train', 250.00, '2023-11-08', '2023-11-16', 'Miami', 'New York', 'PQR Trains');

-- hotels
CREATE TABLE Hotels (
    HotelID INT UNIQUE NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(50),
    PricePerNight DECIMAL(10, 2),
    RoomType VARCHAR(50),
    Description TEXT,
    StarRating INT,
    PRIMARY KEY (HotelID)
);
DESCRIBE Hotels;

-- Insert data into Hotels table
INSERT INTO Hotels (HotelID, Name, Location, PricePerNight, RoomType, Description, StarRating)
VALUES
    (1, 'Luxury Hotel', 'Downtown', 150.00, 'Suite', 'Luxurious hotel in the heart of the city.', 5),
    (2, 'Cozy Inn', 'Suburb', 80.00, 'Standard', 'A comfortable inn with a cozy atmosphere.', 3),
    (3, 'Seaside Resort', 'Beachfront', 200.00, 'Deluxe', 'A beautiful resort by the sea.', 4),
    (4, 'City View Hotel', 'City Center', 120.00, 'Standard', 'Great views of the city skyline.', 4),
    (5, 'Mountain Lodge', 'Mountain Retreat', 100.00, 'Cabin', 'A lodge nestled in the mountains.', 3);


-- touristspots
CREATE TABLE TouristSpots (
    SpotID INT UNIQUE NOT NULL,
    NameSpot VARCHAR(50) NOT NULL,
    Location VARCHAR(50),
    Description TEXT,
    EntranceTicketPrice DECIMAL(10, 2),
    CityID INT,
    PRIMARY KEY (SpotID),
    CONSTRAINT FK_Cities_TouristSpots FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);
DESCRIBE TouristSpots;

-- Insert data into TouristSpots table
INSERT INTO TouristSpots (SpotID, NameSpot, Location, Description, EntranceTicketPrice, CityID)
VALUES
    (1, 'Museum of Art', 'Downtown', 'Explore world-class art collections.', 20.00, 1),
    (2, 'Beach Park', 'Beachfront', 'Enjoy the sun and sea at the beach park.', 10.00, 2),
    (3, 'Historic Old Town', 'City Center', 'Step back in time in the historic old town.', 15.00, 3),
    (4, 'Hiking Trails', 'Mountain Retreat', 'Discover scenic hiking trails in the mountains.', 5.00, 4),
    (5, 'Zoo and Wildlife Sanctuary', 'Suburb', 'Get close to exotic animals at the wildlife sanctuary.', 12.00, 5);

-- cities
CREATE TABLE Cities (
    CityID INT UNIQUE NOT NULL,
    NameCities VARCHAR(30) NOT NULL,
    Country VARCHAR(30),
    Population INT,
    Area DECIMAL(10, 2),
    PRIMARY KEY (CityID)
);
DESCRIBE Cities;

-- Insert data into Cities table
INSERT INTO Cities (CityID, NameCities, Country, Population, Area)
VALUES
    (1, 'New York', 'USA', 8500000, 468.9),
    (2, 'Los Angeles', 'USA', 4000000, 469.1),
    (3, 'Chicago', 'USA', 2700000, 227.6),
    (4, 'Houston', 'USA', 2300000, 637.5),
    (5, 'Miami', 'USA', 470000, 143.1);

-- travelagent
CREATE TABLE TravelAgents (
    AgentID INT UNIQUE NOT NULL,
    NameAgent VARCHAR(50) NOT NULL,
    TouristPackage VARCHAR (50),
    Description TEXT,
    ContactInfo VARCHAR(50),
    Website VARCHAR(50),
    PRIMARY KEY (AgentID)
);
DESCRIBE TravelAgents;

-- Insert data into TravelAgents table
INSERT INTO TravelAgents (AgentID, NameAgent, TouristPackage, Description, ContactInfo, Website)
VALUES
    (1, 'Explore World Travel', 'Adventure Package', 'Your journey begins with us.', 'info@exploreworldtravel.com', 'www.exploreworldtravel.com'),
    (2, 'Sun and Fun Tours', 'Beach Getaway', 'Create memorable moments with us.', 'contact@sunandfuntours.com', 'www.sunandfuntours.com'),
    (3, 'City Explorers', 'City Adventure', 'Discover cities like never before.', 'info@cityexplorers.com', 'www.cityexplorers.com'),
    (4, 'Adventure Seekers', 'Mountain Retreat', 'Seek the thrill of adventure.', 'contact@adventureseekers.com', 'www.adventureseekers.com'),
    (5, 'Relaxation Retreats', 'Beach Bliss', 'Escape to serene retreats.', 'info@relaxationretreats.com', 'www.relaxationretreats.com');

-- TouristPackageBookings
CREATE TABLE TouristPackageBookings (
    AgentBookingID INT PRIMARY KEY,
    AgentID INT,
    BookingID INT,
    SpotID INT,
    RoyaltyAgen DECIMAL(10, 2),
    CONSTRAINT FK_AgentBookings_Agents FOREIGN KEY (AgentID) REFERENCES TravelAgents(AgentID),
    CONSTRAINT FK_AgentBookings_Bookings FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    CONSTRAINT FK_TouristPackageBookings_TouristSpots FOREIGN KEY (SpotID) REFERENCES TouristSpots(SpotID)
);
DESCRIBE TouristPackageBookings;

-- Insert data into TouristPackageBookings table
INSERT INTO TouristPackageBookings (AgentBookingID, AgentID, BookingID, SpotID, RoyaltyAgen)
VALUES
    (1, 1, 1, 1, 50.00),
    (2, 2, 2, 2, 75.00),
    (3, 3, 3, 3, 60.00),
    (4, 4, 4, 4, 90.00),
    (5, 5, 5, 5, 80.00);


-- pembayaran
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    PaymentMethod VARCHAR(50),
    CONSTRAINT FK_Payment_Booking FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);    
DESCRIBE Payment;

-- Insert data into Payment table
INSERT INTO Payment (PaymentID, BookingID, PaymentMethod)
VALUES
    (1, 1, 'Credit Card'),
    (2, 2, 'PayPal'),
    (3, 3, 'Credit Card'),
    (4, 4, 'Bank Transfer'),
    (5, 5, 'Credit Card');
