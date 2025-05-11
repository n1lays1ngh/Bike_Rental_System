INSERT INTO Location (City, State, Street, Latitude, Longitude) VALUES
('New York', 'NY', '123 Broadway', 40.712776, -74.005974),
('Los Angeles', 'CA', '456 Sunset Blvd', 34.052235, -118.243683),
('Chicago', 'IL', '789 Michigan Ave', 41.878114, -87.629798),
('Houston', 'TX', '101 Main Street', 29.760427, -95.369804),
('Miami', 'FL', '202 Ocean Drive', 25.761681, -80.191788),
('Seattle', 'WA', '303 Pine St', 47.606209, -122.332071),
('Boston', 'MA', '404 Beacon St', 42.360081, -71.058884),
('San Francisco', 'CA', '505 Market St', 37.774929, -122.419418),
('Denver', 'CO', '606 Colfax Ave', 39.739236, -104.990251),
('Austin', 'TX', '707 Congress Ave', 30.267153, -97.743057);

SELECT * FROM Location ;

INSERT INTO User (FirstName, LastName, PhoneNumber, PasswordHash) VALUES
('John', 'Doe', '555-0101', '$2a$10$Xp1J5z8hQNQ9E9Z5jTcwve'),
('Jane', 'Smith', '555-0202', '$2a$10$Yq2K6z9iR.P7F8A3jUdXwe'),
('Robert', 'Johnson', '555-0303', '$2a$10$Zr3L7a0kS.Q9G0B4jVeYxe'),
('Emily', 'Williams', '555-0404', '$2a$10$As4M8b1lT.R1H2C5jWfZze'),
('Michael', 'Brown', '555-0505', '$2a$10$Bt5N9c2mU.S2I3D6jXgY0e'),
('Sarah', 'Davis', '555-0606', '$2a$10$Cu4O9d3nV.T3J4K7jYh1xe'),
('David', 'Miller', '555-0707', '$2a$10$Dv5P0e4oW.U4K5L8jZi2ye'),
('Jessica', 'Wilson', '555-0808', '$2a$10$Ew6Q1f5pX.V5L6M9jAj3ze'),
('Thomas', 'Moore', '555-0909', '$2a$10$Fx7R2g6qY.W6M7N0kBk4ze'),
('Jennifer', 'Taylor', '555-1010', '$2a$10$Gy8S3h7rZ.X7N8O1lCm5ze');


SELECT * FROM User ; 

INSERT INTO User_Email (Email, UserID) VALUES
('john.doe@example.com', 1),
('jane.smith@example.com', 2),
('robert.j@example.com', 3),
('emily.w@example.com', 4),
('michael.b@example.com', 5),
('sarah.d@example.com', 6),
('david.m@example.com', 7),
('jessica.w@example.com', 8),
('thomas.m@example.com', 9),
('jennifer.t@example.com', 10);


SELECT * FROM User_Email ; 

INSERT INTO Admin (PasswordHash) VALUES
('$2a$10$Xp1J5z8hQNQ9E9Z5jTcwve'),
('$2a$10$Yq2K6z9iR.P7F8A3jUdXwe'),
('$2a$10$Zr3L7a0kS.Q9G0B4jVeYxe'),
('$2a$10$As4M8b1lT.R1H2C5jWfZze'),
('$2a$10$Bt5N9c2mU.S2I3D6jXgY0e');

SELECT * FROM Admin ; 

INSERT INTO Admin_Email (Email, AdminID) VALUES
('admin1@bikerental.com', 1),
('admin2@bikerental.com', 2),
('admin3@bikerental.com', 3),
('admin4@bikerental.com', 4),
('admin5@bikerental.com', 5);

SELECT * FROM Admin_Email ; 

INSERT INTO Bike (Model, Brand, Status, LocationID, RatePerHour) VALUES
('Roadster 500', 'Giant', 'Available', 1, 15.75),
('Mountain Pro', 'Trek', 'Available', 2, 18.50),
('City Cruiser', 'Schwinn', 'Rented', 3, 12.00),
('Speed Demon', 'Specialized', 'Maintenance', 4, 20.00),
('Urban Commuter', 'Cannondale', 'Available', 5, 14.25),
('Trail Blazer', 'Scott', 'Available', 6, 16.75),
('Beach Cruiser', 'Electra', 'Rented', 7, 11.50),
('Hybrid X', 'Fuji', 'Available', 8, 17.25),
('Gravel Grinder', 'Canyon', 'Available', 9, 19.00),
('Folding Pro', 'Brompton', 'Maintenance', 10, 22.50),
('E-Bike Plus', 'Rad Power', 'Available', 1, 25.00),
('Kids Bike', 'Huffy', 'Available', 2, 8.50);

SELECT * FROM Bike;

INSERT INTO Booking (UserID, BikeID, StartTime, EndTime, TotalCost, Status) VALUES
(1, 3, '2023-06-01 10:00:00', '2023-06-01 12:30:00', 30.00, 'Completed'),
(2, 1, '2023-06-02 09:00:00', '2023-06-02 11:00:00', 31.50, 'Completed'),
(3, 2, '2023-06-03 14:00:00', '2023-06-03 17:00:00', 55.50, 'In Progress'),
(4, 5, '2023-06-04 08:00:00', '2023-06-04 10:00:00', 28.50, 'Upcoming'),
(5, 4, '2023-06-05 13:00:00', '2023-06-05 15:00:00', 40.00, 'Cancelled'),
(6, 6, '2023-06-06 10:00:00', '2023-06-06 14:00:00', 67.00, 'Completed'),
(7, 7, '2023-06-07 09:00:00', '2023-06-07 12:00:00', 34.50, 'Completed'),
(8, 8, '2023-06-08 13:00:00', '2023-06-08 16:00:00', 51.75, 'In Progress'),
(9, 9, '2023-06-09 08:00:00', '2023-06-09 11:00:00', 57.00, 'Upcoming'),
(10, 10, '2023-06-10 14:00:00', '2023-06-10 17:00:00', 67.50, 'Cancelled'),
(1, 11, '2023-06-11 10:00:00', '2023-06-11 13:00:00', 75.00, 'Completed'),
(2, 12, '2023-06-12 09:00:00', '2023-06-12 11:00:00', 17.00, 'Completed'),
(3, 1, '2023-06-13 14:00:00', '2023-06-13 18:00:00', 63.00, 'In Progress'),
(4, 2, '2023-06-14 08:00:00', '2023-06-14 10:00:00', 37.00, 'Upcoming'),
(5, 3, '2023-06-15 13:00:00', '2023-06-15 16:00:00', 36.00, 'Cancelled');

SELECT * FROM Booking ;


INSERT INTO Manages (AdminID, BooklogID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(1, 6), (2, 7), (3, 8), (4, 9), (5, 10),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15);

SELECT * FROM Manages ;

INSERT INTO Payment (BooklogID, UserID, Amount, PaymentMethod, PaymentStatus) VALUES
(1, 1, 30.00, 'Card', 'Completed'),
(2, 2, 31.50, 'Wallet', 'Completed'),
(3, 3, 55.50, 'Card', 'Processing'),
(4, 4, 28.50, 'Cash', 'Pending'),
(5, 5, 40.00, 'Card', 'Failed'),
(6, 6, 67.00, 'Card', 'Completed'),
(7, 7, 34.50, 'Wallet', 'Completed'),
(8, 8, 51.75, 'Card', 'Processing'),
(9, 9, 57.00, 'Cash', 'Pending'),
(10, 10, 67.50, 'Card', 'Failed'),
(11, 1, 75.00, 'Card', 'Completed'),
(12, 2, 17.00, 'Wallet', 'Completed'),
(13, 3, 63.00, 'Card', 'Processing'),
(14, 4, 37.00, 'Cash', 'Pending'),
(15, 5, 36.00, 'Card', 'Failed');

SELECT * FROM Payment ;
