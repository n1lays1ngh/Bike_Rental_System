CALL AddBike('Mountain Pro', 'Trek', 'Available', 3, 18.50);
SELECT * FROM Bike WHERE Model = 'Mountain Pro' AND Brand = 'Trek';

CALL AddBike('Test Bike', 'Brand', 'InvalidStatus', 1, 15.00);

-- CANCEL BOOKING PROCEDURE

SELECT * FROM Booking WHERE BookLogID = 2;
CALL CancelBooking(2);

CALL GetAvailableBikesByLocation(1);

SELECT UserID, FirstName, LastName FROM User;

CALL GetUserBookingHistory(1);