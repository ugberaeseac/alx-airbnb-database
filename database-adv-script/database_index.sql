
-- users table
CREATE INDEX idx_users_email ON users(email);

-- bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);

-- reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);



EXPLAIN ANALYZE
SELECT properties.name, properties.description, ROUND(AVG(reviews.rating), 1) AS avg_rating
FROM properties
JOIN reviews ON properties.property_id = reviews.property_id
GROUP BY properties.property_id
HAVING ROUND(AVG(reviews.rating), 1) > 4.0;
