CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    UserID INT,
    ServiceID INT,
    Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    ServiceID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(100),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE CancellationRefund (
    CancellationRefundID INT PRIMARY KEY,
    BookingID INT,
    CancellationDate DATE,
    RefundAmount DECIMAL(10, 2),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    UserID INT,
    BookingID INT,
    Amount DECIMAL(10, 2),
    DueDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY,
    UserID INT,
    Message TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- Insert into Users table
INSERT INTO Users (UserID, UserName, Email, Phone)
VALUES (1, 'John Doe', 'john.doe@example.com', '1234567890'),
       (2, 'Jane Smith', 'jane.smith@example.com', '0987654321');

-- Insert into Services table
INSERT INTO Services (ServiceID, ServiceName, Description, Price)
VALUES (1, 'Web Development', 'Full-stack web development service', 1200.00),
       (2, 'SEO Optimization', 'Search engine optimization service', 800.00);

-- Insert into Bookings table
INSERT INTO Bookings (BookingID, UserID, ServiceID, Date, Status)
VALUES (1, 1, 1, '2024-08-01', 'Completed'),
       (2, 2, 2, '2024-08-02', 'Pending');

-- Insert into Locations table
INSERT INTO Locations (LocationID, LocationName, Address, City, Country)
VALUES (1, 'Office 1', '123 Main Street', 'New York', 'USA'),
       (2, 'Office 2', '456 Market Road', 'San Francisco', 'USA');

-- Insert into Reviews table
INSERT INTO Reviews (ReviewID, UserID, ServiceID, Rating, Comment)
VALUES (1, 1, 1, 5, 'Excellent service!'),
       (2, 2, 2, 4, 'Very good, but could be improved.');

-- Insert into Payment table
INSERT INTO Payment (PaymentID, BookingID, Amount, PaymentDate, PaymentMethod)
VALUES (1, 1, 1200.00, '2024-08-01', 'Credit Card'),
       (2, 2, 800.00, '2024-08-02', 'PayPal');

-- Insert into CancellationRefund table
INSERT INTO CancellationRefund (CancellationRefundID, BookingID, CancellationDate, RefundAmount)
VALUES (1, 1, '2024-08-03', 600.00),
       (2, 2, '2024-08-04', 400.00);

-- Insert into Invoices table
INSERT INTO Invoices (InvoiceID, UserID, BookingID, Amount, DueDate)
VALUES (1, 1, 1, 1200.00, '2024-08-10'),
       (2, 2, 2, 800.00, '2024-08-11');

-- Insert into Notifications table
INSERT INTO Notifications (NotificationID, UserID, Message)
VALUES (1, 1, 'Your booking is confirmed.'),
       (2, 2, 'Payment received successfully.');
