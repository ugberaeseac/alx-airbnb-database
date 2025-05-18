# Database Indexing and Performance Improvement

## Objective
Improve performance of frequent queries by adding indexes to high-usage columns in the `users`, `bookings`, `properties`, and `reviews` tables.

---

## Step 1: Identify High-Usage Columns

Based on typical query patterns (WHERE, JOIN, ORDER BY), the following columns were identified for indexing:

 Table        Column          Reason for Indexing                    
---------------------------------------------------------------------
 users        email           Frequently used in login/search        
 bookings     user_id         Used in JOINs and user filtering       
 bookings     property_id     Used in JOINs with properties/reviews  
 properties   location        Used in searches and filters           
 properties   price           Used in sorting/filtering              
 reviews      property_id     Used in rating aggregation subqueries  

---

## Step 2: Create Indexes

```sql
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


## Query Performance

EXPLAIN ANALYZE
SELECT properties.name, properties.description, ROUND(AVG(reviews.rating), 1) AS avg_rating
FROM properties
JOIN reviews ON properties.property_id = reviews.property_id
GROUP BY properties.property_id
HAVING ROUND(AVG(reviews.rating), 1) > 4.0;
