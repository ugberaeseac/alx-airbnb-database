-- Step 1: Initial query (complex version)
-- Retrieves all bookings with user, property, and payment details

SELECT 
    bookings.booking_id,
    bookings.user_id,
    users.name AS user_name,
    users.email,
    properties.property_id,
    properties.name AS property_name,
    properties.location,
    payments.payment_id,
    payments.amount,
    payments.status
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id;

-- Step 2: Analyze the query performance
-- (Run this in your SQL tool to see the query plan)
EXPLAIN ANALYZE
SELECT 
    bookings.booking_id,
    bookings.user_id,
    users.first_name,
    users.email,
    properties.property_id,
    properties.name AS property_name,
    properties.location,
    payments.payment_id,
    payments.amount
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id;

-- Step 3: Refactor to improve performance
-- - Ensure relevant indexes exist
-- - Remove unnecessary columns or joins if not needed
-- - Assume we only need bookings with amounts > 500

-- Recommended indexes (run once)
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_booking_id ON bookings(booking_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);

-- Refactored query with filter and only essential fields
SELECT 
    bookings.booking_id,
    users.first_name,
    properties.name,
    payments.amount
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id
WHERE payments.amount > 500;


