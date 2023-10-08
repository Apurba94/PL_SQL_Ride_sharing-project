-- Connect to your Oracle database
CONNECT username/password@database

-- Search for riders who are drivers
SELECT U.username, U.phone_number, R.start_location, R.end_location
FROM Users U
JOIN Rides R ON U.user_id = R.driver_id
WHERE U.role = 'driver';

-- Search for users who have booked rides
SELECT U.username, U.email, R.start_location, R.end_location, B.booking_time
FROM Users U
JOIN Bookings B ON U.user_id = B.passenger_id
JOIN Rides R ON B.ride_id = R.ride_id;

-- Disconnect from the data
DISCONNECT;