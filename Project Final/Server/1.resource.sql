-- Create Users table

drop table Users CASCADE CONSTRAINTS;
drop table Rides CASCADE CONSTRAINTS;
drop table Bookings CASCADE CONSTRAINTS;


CREATE TABLE Users (
  user_id NUMBER PRIMARY KEY,
  username VARCHAR2(50) NOT NULL,
  password VARCHAR2(100) NOT NULL,
  email VARCHAR2(100) UNIQUE,
  phone_number VARCHAR2(20),
  role VARCHAR2(10) NOT NULL,
  registration_date DATE DEFAULT SYSDATE
);

-- Create Rides table
CREATE TABLE Rides (
  ride_id NUMBER PRIMARY KEY,
  driver_id NUMBER REFERENCES Users(user_id),
  start_location VARCHAR2(100) NOT NULL,
  end_location VARCHAR2(100) NOT NULL,
  start_time TIMESTAMP,
  available_seats NUMBER,
  fare NUMBER,
  status VARCHAR2(20)
);

-- Create Bookings table
CREATE TABLE Bookings (
  booking_id NUMBER PRIMARY KEY,
  ride_id NUMBER REFERENCES Rides(ride_id),
  passenger_id NUMBER REFERENCES Users(user_id),
  booking_time TIMESTAMP DEFAULT SYSTIMESTAMP,
  status VARCHAR2(20)
);
-- Insert sample users
INSERT INTO Users (user_id, username, password, email, phone_number, role)
VALUES (1, 'Masud', 'hashed_password', 'masud123@gmail.com', '01723421235', 'driver');

INSERT INTO Users (user_id, username, password, email, phone_number, role)
VALUES (2, 'Shakib', 'hashed_password', 'shakib123@gmail.com', '01834567012', 'passenger');

-- Insert sample rides
INSERT INTO Rides (ride_id, driver_id, start_location, end_location, start_time, available_seats, fare, status)
VALUES (1, 1, 'Mohammodpur', 'Hatirjhil', SYSTIMESTAMP, 3, 20.00, 'scheduled');

-- Insert sample bookings
INSERT INTO Bookings (booking_id, ride_id, passenger_id, booking_time, status)
VALUES (1, 1, 2, SYSTIMESTAMP, 'confirmed');

-- Get all rides with available seats
SELECT * FROM Rides WHERE available_seats > 0;

-- Get bookings for a specific ride
SELECT B.*, U.username AS passenger_username
FROM Bookings B
JOIN Users U ON B.passenger_id = U.user_id
WHERE B.ride_id = 1;

-- Update ride status
UPDATE Rides SET status = 'canceled' WHERE ride_id = 1;

-- Calculate total fare for a specific ride
SELECT SUM(fare) FROM Bookings WHERE ride_id = 1;
