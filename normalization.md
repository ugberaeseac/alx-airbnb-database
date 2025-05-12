# Airbnb Clone Database Normalization to 3NF

This document explains how the Airbnb database schema has been normalized to **Third Normal Form (3NF)**.

---

## Normalization Process

We will evaluate each table to confirm that it meets:
- **First Normal Form (1NF)**: Eliminate repeating groups; ensure atomicity.
- **Second Normal Form (2NF)**: Ensure full functional dependency (no partial dependencies on a composite key).
- **Third Normal Form (3NF)**: Remove transitive dependencies.

---

## 1. `User` Table

### Attributes:
- `user_id` (PK)
- `first_name`
- `last_name`
- `email`
- `password_hash`
- `phone_number`
- `role` (ENUM: guest, host, admin)
- `created_at`

### 1NF: ✅ Atomic values, no repeating groups  
### 2NF: ✅ Fully dependent on the primary key `user_id`  
### 3NF: ✅ No transitive dependencies

---

## 2. `Property` Table

### Attributes:
- `property_id` (PK)
- `host_id` (FK → User)
- `name`
- `description`
- `location`
- `pricepernight`
- `created_at`
- `updated_at`

### 1NF: ✅ Atomic fields  
### 2NF: ✅ Each field depends on the whole key  
### 3NF: ✅ No derived or transitive fields

---

## 3. `Booking` Table

### Attributes:
- `booking_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `start_date`
- `end_date`
- `total_price`
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`

### 1NF: ✅ Atomic and unique rows  
### 2NF: ✅ No partial dependencies (single-field PK)  
### 3NF: ✅ No transitive dependencies

---

## 4. `Payment` Table

### Attributes:
- `payment_id` (PK)
- `booking_id` (FK → Booking)
- `amount`
- `payment_date`
- `payment_method` (ENUM: credit_card, paypal, stripe)

### 1NF: ✅ Atomic  
### 2NF: ✅ No partial dependencies  
### 3NF: ✅ No derived fields or indirect relationships

---

## 5. `Review` Table

### Attributes:
- `review_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `rating`
- `comment`
- `created_at`

### 1NF: ✅ Fields are atomic  
### 2NF: ✅ Each non-key attribute relates fully to `review_id`  
### 3NF: ✅ No transitive dependency

---

## 6. `Message` Table

### Attributes:
- `message_id` (PK)
- `sender_id` (FK → User)
- `recipient_id` (FK → User)
- `message_body`
- `sent_at`

### 1NF: ✅ All values are atomic  
### 2NF: ✅ All fields depend fully on PK  
### 3NF: ✅ No transitive dependencies

---

## ✅ Summary

All tables are in **Third Normal Form (3NF)**:
- Every non-key attribute is fully dependent on the primary key.
- No transitive dependencies.
- The design supports scalability and avoids redundancy.

This normalized design ensures data integrity and consistency while minimizing redundancy.
