SELECT properties.property_id, name, description, avg_rating
FROM properties
INNER JOIN (select reviews.property_id, round(AVG(rating)) as avg_rating
	FROM reviews
	GROUP BY reviews.property_id) avg_rating_property
ON properties.property_id = avg_rating_property.property_id
WHERE avg_rating_property.avg_rating > 4.0;

SELECT first_name, last_name
FROM users
WHERE (
	SELECT COUNT(*) 
	FROM bookings
	WHERE bookings.user_id = users.user_id) > 3 ;
