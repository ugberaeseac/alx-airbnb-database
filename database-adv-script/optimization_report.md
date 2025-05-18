# Query Performance Optimization Report

## Objective

Refactor complex queries to improve performance.

---

## Initial Query

The initial query retrieves all bookings along with the associated user, property, and payment details using multiple joins:

```sql
SELECT 
    bookings.booking_id,
    bookings.user_id,
    users.first_name,
    users.last_name,
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


## Explain/Analyze Query

```sql
EXPLAIN ANALYZE
SELECT 
    bookings.booking_id,
    bookings.user_id,
    users.first_name,
    users.last_name,
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


## Recommended Indexes
```sql
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_booking_id ON bookings(booking_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);


## Refactored Query
```sql
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
