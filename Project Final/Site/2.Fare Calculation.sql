-- Connect to your Oracle database
CONNECT username/password@database

-- Calculate total fare for a specific ride
SELECT R.ride_id, R.start_location, R.end_location, 
       SUM(B.fare) AS total_fare
FROM Rides R
JOIN Bookings B ON R.ride_id = B.ride_id
WHERE R.ride_id = 1; -- Replace with the desired ride_id

-- Disconnect from the database
--DISCONNECT;