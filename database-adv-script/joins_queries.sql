SELECT *
FROM bookings
INNER JOIN users
ON bookings.user_id = users.user_id
ORDER BY bookings.user_id;

SELECT *
FROM properties
LEFT JOIN reviews
ON properties.property_id = reviews.property_id
ORDER BY properties.property_id;

SELECT *
FROM users
FULL OUTER JOIN bookings
ON users.user_id = bookings.user_id
ORDER BY users.user_id;
