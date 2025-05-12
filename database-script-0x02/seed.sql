-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('6d6ed2da-bf74-4d2f-9ac6-7c8a9db5c8b7', 'Kwame', 'Mensah', 'kwame.mensah@example.com', 'hashed_password1', '233-246-123456', 'guest'),
('8a03b5a4-1f1d-44a3-b849-1cd6d2b53be0', 'Amina', 'Suleiman', 'amina.suleiman@example.com', 'hashed_password2', '233-246-234567', 'host'),
('fbba15c0-4b7f-4ac7-8617-e5db3f3abf2a', 'Samuel', 'Okoro', 'samuel.okoro@example.com', 'hashed_password3', '234-812-345678', 'guest'),
('b847a5f4-d3be-47c9-a409-c85d5bfa1b87', 'Chinwe', 'Nwosu', 'chinwe.nwosu@example.com', 'hashed_password4', '234-812-987654', 'admin');

-- Insert Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('a98172d8-4d71-4c74-b14f-26d05a55d528', '8a03b5a4-1f1d-44a3-b849-1cd6d2b53be0', 'Luxury Beachfront Villa', 'A beachfront villa with stunning views of the Atlantic Ocean in Accra.', 'Accra, Ghana', 250.00, '2025-06-01', '2025-06-01'),
('2fb387df-f8b9-4a4b-a84e-2b5e944ad25e', '8a03b5a4-1f1d-44a3-b849-1cd6d2b53be0', 'Mountain Lodge', 'A serene lodge located in the highlands of Cameroon with amazing views.', 'Buea, Cameroon', 150.00, '2025-06-01', '2025-06-01'),
('f041b7ac-933d-4fd2-80fc-9f52a9818ef4', '8a03b5a4-1f1d-44a3-b849-1cd6d2b53be0', 'Traditional Rwandan Cottage', 'A cozy, traditional cottage in the beautiful hills of Rwanda.', 'Kigali, Rwanda', 120.00, '2025-07-01', '2025-07-01'),
('3c4c8136-b86b-44bb-bb9f-d41d40f54d8e', '8a03b5a4-1f1d-44a3-b849-1cd6d2b53be0', 'Luxury Safari Lodge', 'An exclusive luxury safari lodge in South Africa offering a once-in-a-lifetime experience.', 'Kruger National Park, South Africa', 500.00, '2025-06-10', '2025-06-10');

-- Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('bf347ed2-dcb9-4a9b-8d8c-dcfb9484e5b5', 'a98172d8-4d71-4c74-b14f-26d05a55d528', '6d6ed2da-bf74-4d2f-9ac6-7c8a9db5c8b7', '2025-06-10', '2025-06-15', 1250.00, 'confirmed', '2025-06-01'),
('ef2d56ca-ff60-43c7-8a09-ec443edc545b', '2fb387df-f8b9-4a4b-a84e-2b5e944ad25e', 'fbba15c0-4b7f-4ac7-8617-e5db3f3abf2a', '2025-06-15', '2025-06-18', 450.00, 'pending', '2025-06-02'),
('3d9e189f-e7b2-4d78-8082-1c82b0d92e2e', 'f041b7ac-933d-4fd2-80fc-9f52a9818ef4', '6d6ed2da-bf74-4d2f-9ac6-7c8a9db5c8b7', '2025-07-05', '2025-07-10', 600.00, 'confirmed', '2025-06-03'),
('b1ac3ff3-4404-4f96-8589-15a34504f8b0', '3c4c8136-b86b-44bb-bb9f-d41d40f54d8e', 'fbba15c0-4b7f-4ac7-8617-e5db3f3abf2a', '2025-06-20', '2025-06-25', 2500.00, 'confirmed', '2025-06-04');

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('d7f63a9e-bbe2-4f97-b5f5-7f9c6dba7b68', 'bf347ed2-dcb9-4a9b-8d8c-dcfb9484e5b5', 1250.00, '2025-06-01', 'credit_card'),
('1d7c8b45-5cf4-4e6f-8f9e-d6d9c5f0544f', 'ef2d56ca-ff60-43c7-8a09-ec443edc545b', 450.00, '2025-06-02', 'paypal'),
('d6b04025-d943-4c7e-b989-8b2496042288', '3d9e189f-e7b2-4d78-8082-1c82b0d92e2e', 600.00, '2025-06-03', 'stripe'),
('ed9e94c3-8394-4759-9b73-22f3b71c5bfa', 'b1ac3ff3-4404-4f96-8589-15a34504f8b0', 2500.00, '2025-06-04', 'credit_card');

-- Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('7d8e2383-d684-4e5e-9c0b-d2e30eaf8f6e', 'a98172d8-4d71-4c74-b14f-26d05a55d528', 'fbba15c0-4b7f-4ac7-8617-e5db3f3abf2a', 5, 'Amazing beachfront property with great amenities!', '2025-06-16'),
('9d69bb7f-4654-4c96-b84b-c3403b8c3be9', '2fb387df-f8b9-4a4b-a84e-2b5e944ad25e', '6d6ed2da-bf74-4d2f-9ac6-7c8a9db5c8b7', 4, 'The mountain views were incredible, but the access road could be improved.', '2025-06-18'),
('fb937d77-1e5f-4171-973d-2a5b8eaaeaeb', 'f041b7ac-933d-4fd2-80fc-9f52a9818ef4', 'fbba15c0-4b7f-4ac7-8617-e5db3f3abf2a', 4, 'The Rwandan cottage was charming, very peaceful stay!', '2025-07-10'),
('e8bfa283-c8a3-4eb0-bddf-0837a9c4e8e3', '3c4c8136-b86b-44bb-bb9f-d41d40f54d8e', '6d6ed2da-bf74-4d2f-9ac6-7c8a9db5c8b7', 5, 'The safari experience was unforgettable! The lodge was luxurious.', '2025-06-27');

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('3cd1a848-e040-4d94-b07b-519f1c5104d0', 'fbba15c0-4b7f-4ac7-8617-e5db3f3abf2a', '6d6ed2da-bf74-4d2f-9ac6-7c8a9db5c8b7', 'Hi Kwame, I see you booked the Luxury Beachfront Villa! Let me know if you need any help.', '2025-06-01'),
('e720f86c-5c30-4181-a02a-4589051e8f7c', 'fbba15c0-4b7f-4ac7-8617-e5db3f3abf2a', '6d6ed2da-bf74-4d2f-9ac6-7c8a9db5c8b7', 'The property is ready for check-in, enjoy your stay!', '2025-06-10');

