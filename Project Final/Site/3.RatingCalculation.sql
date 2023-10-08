-- Connect to your Oracle database
--CONNECT username/password@database

-- Get average ratings for drivers
SELECT U.username, AVG(R.rating) AS avg_driver_rating
FROM Users U
JOIN Ratings R ON U.user_id = R.driver_id
WHERE U.role = 'driver'
GROUP BY U.username;

-- Get average ratings for users (passengers)
SELECT U.username, AVG(R.rating) AS avg_passenger_rating
FROM Users U
JOIN Ratings R ON U.user_id = R.passenger_id
WHERE U.role = 'passenger'
GROUP BY U.username;

-- Disconnect from the databa
--DISCONNECT;
