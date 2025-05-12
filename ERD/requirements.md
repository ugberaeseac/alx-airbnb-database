# AirBnB Clone – ER Diagram & Database Schema

## Overview

This project models a simplified version of the AirBnB platform using a relational database design. It includes key entities such as users, properties, bookings, reviews, messages, and payments. Below you'll find the Entity-Relationship (ER) diagram and a full breakdown of entities and their attributes.

## ER Diagram

![ER Diagram](https://iili.io/38l1CHN.png)

> Replace the link above with your actual GitHub-hosted ER diagram image.

---

## Database Specification

### **User**
- `user_id`: UUID, Primary Key, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (guest, host, admin), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### **Property**
- `property_id`: UUID, Primary Key, Indexed
- `host_id`: UUID, Foreign Key → User(user_id)
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### **Booking**
- `booking_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → Property(property_id)
- `user_id`: UUID, Foreign Key → User(user_id)
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### **Payment**
- `payment_id`: UUID, Primary Key, Indexed
- `booking_id`: UUID, Foreign Key → Booking(booking_id)
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### **Review**
- `review_id`: UUID, Primary Key, Indexed
- `property_id`: UUID, Foreign Key → Property(property_id)
- `user_id`: UUID, Foreign Key → User(user_id)
- `rating`: INTEGER, CHECK (rating BETWEEN 1 AND 5), NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### **Message**
- `message_id`: UUID, Primary Key, Indexed
- `sender_id`: UUID, Foreign Key → User(user_id)
- `recipient_id`: UUID, Foreign Key → User(user_id)
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships Summary

- **User → Property** (1:N): One user (host) can list multiple properties.
- **User → Booking** (1:N): One user (guest) can make multiple bookings.
- **Property → Booking** (1:N): A property can be booked many times.
- **Booking → Payment** (1:1): Each booking has one corresponding payment.
- **User ↔ Review ↔ Property** (M:N via Review): Guests can leave multiple reviews for properties, and each property can receive reviews from many users.
- **User ↔ Message ↔ User** (1:N to 1:N): Users can send and receive many messages to and from each other.

---

> This schema is normalized to **Third Normal Form (3NF)** to remove redundancy and ensure data integrity. Future improvements might include availability calendars, address normalization, or security tokens for password recovery.

