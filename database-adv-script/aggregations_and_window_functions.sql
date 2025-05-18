SELECT user_id, COUNT(*) AS total_booking
FROM bookings
GROUP BY user_id;


SELECT property_id,
COUNT(*) AS total_bookings,
ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS property_rank
FROM bookings
GROUP BY property_id;
