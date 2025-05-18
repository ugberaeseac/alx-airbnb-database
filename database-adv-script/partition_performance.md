# Database Performance Monitoring and Refinement

## Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 1. Monitoring Query Performance

We used `EXPLAIN ANALYZE` to inspect the performance of frequently used queries. Below is an example query used to retrieve booking details along with user, property, and payment information:

### Query

```sql
EXPLAIN ANALYZE
SELECT 
    bookings.booking_id,
    users.first_name,
    properties.name,
    payments.amount
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id
WHERE payments.amount > 0;

