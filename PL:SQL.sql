-- Trigger: Calculate total cost for booking
DELIMITER //

CREATE TRIGGER calculate_total_cost
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    DECLARE rate DECIMAL(5,2);
    DECLARE duration DECIMAL(10,2);
    
    SELECT RatePerHour INTO rate FROM Bike WHERE BikeID = NEW.BikeID;
    SET duration = TIMESTAMPDIFF(MINUTE, NEW.StartTime, NEW.EndTime) / 60.0;
    SET NEW.TotalCost = ROUND(duration * rate, 2);
END;
//

DELIMITER //

CREATE TRIGGER prevent_double_booking
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    DECLARE count_bookings INT;

    SELECT COUNT(*) INTO count_bookings
    FROM Booking
    WHERE BikeID = NEW.BikeID
      AND NEW.StartTime < EndTime
      AND NEW.EndTime > StartTime;

    IF count_bookings > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Bike already booked during this time';
    END IF;
END;
//

DELIMITER //

CREATE TRIGGER update_bike_status_after_booking
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Confirmed' THEN
        UPDATE Bike
        SET Status = 'Rented'
        WHERE BikeID = NEW.BikeID;
    ELSEIF NEW.Status = 'Cancelled' THEN
        UPDATE Bike
        SET Status = 'Available'
        WHERE BikeID = NEW.BikeID;
    END IF;
END //

DELIMITER ;
