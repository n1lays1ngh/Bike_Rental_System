DELIMITER //

CREATE PROCEDURE AddBike (
    IN p_Model VARCHAR(50),
    IN p_Brand VARCHAR(50),
    IN p_Status VARCHAR(20),
    IN p_LocationID INT,
    IN p_RatePerHour DECIMAL(5,2)
)
BEGIN
    -- Validate ENUM value
    IF p_Status NOT IN ('Available', 'Rented', 'Maintenance') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid Status. Must be Available, Rented, or Maintenance.';
    ELSE
        INSERT INTO Bike (Model, Brand, Status, LocationID, RatePerHour)
        VALUES (p_Model, p_Brand, p_Status, p_LocationID, p_RatePerHour);
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN p_BooklogID INT
)
BEGIN
    DECLARE v_BikeID INT;
    DECLARE v_Status VARCHAR(20);

    -- Get the Bike ID and Status from Booking
    SELECT BikeID, Status INTO v_BikeID, v_Status
    FROM Booking
    WHERE BooklogID = p_BooklogID;

    -- Check if the booking is Confirmed or Completed
    IF v_Status IN ('Confirmed', 'Completed') THEN
        -- Update Bike Status
        UPDATE Bike
        SET Status = 'Available'
        WHERE BikeID = v_BikeID;

        -- Update Booking Status
        UPDATE Booking
        SET Status = 'Cancelled'
        WHERE BooklogID = p_BooklogID;

        -- Update Payment Status
        UPDATE Payment
        SET PaymentStatus = 'Refunded'
        WHERE BooklogID = p_BooklogID;
    ELSE
        -- Signal error
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only confirmed or completed bookings can be cancelled.';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetAvailableBikesByLocation (
    IN p_LocationID INT
)
BEGIN
    SELECT BikeID, Model, Brand, RatePerHour
    FROM Bike
    WHERE LocationID = p_LocationID AND Status = 'Available';
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetUserBookingHistory (
    IN p_UserID INT
)
BEGIN
    SELECT B.BooklogID, B.StartTime, B.EndTime, B.TotalCost, B.Status
    FROM Booking B
    WHERE B.UserID = p_UserID
    ORDER BY B.StartTime DESC;
END //

DELIMITER ;




