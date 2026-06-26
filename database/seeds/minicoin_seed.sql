-- Minicoin Seed Data
-- Initial setup for the minicoin system

BEGIN TRANSACTION;

-- Insert default earning rules
INSERT INTO minicoin_earning_rules (name, description, earning_type, amount_earned, max_frequency, is_active) VALUES
('Complete Appointment', 'Earn coins when an appointment is completed', 'APPOINTMENT_COMPLETION', 25.00, 'UNLIMITED', TRUE),
('Write a Review', 'Earn coins for leaving a review after service', 'REVIEW', 25.00, 'ONCE_PER_APPOINTMENT', TRUE),
('Share on Social Media', 'Earn coins for sharing studio content on social media', 'SOCIAL_SHARE', 15.00, 'DAILY', TRUE),
('Referral Bonus', 'Earn coins when a referred user completes their first appointment', 'REFERRAL', 50.00, 'UNLIMITED', TRUE),
('Birthday Bonus', 'Special bonus on your birthday', 'BIRTHDAY', 100.00, 'YEARLY', TRUE),
('First Appointment', 'Welcome bonus for new users', 'FIRST_APPOINTMENT', 50.00, 'ONCE', TRUE);

-- Insert default rewards
INSERT INTO minicoin_rewards (name, description, category, cost, quantity_available, reward_details, is_active) VALUES
('10% Off Any Service', 'Get 10% discount on your next service', 'DISCOUNT', 100.00, NULL, '{"discount_percentage": 10, "valid_days": 30}', TRUE),
('20% Off Any Service', 'Get 20% discount on your next service', 'DISCOUNT', 200.00, NULL, '{"discount_percentage": 20, "valid_days": 30}', TRUE),
('Free Touch-Up', 'One free touch-up session', 'SERVICE', 150.00, NULL, '{"service_type": "touch_up", "valid_days": 60}', TRUE),
('Free Consultation', 'One free design consultation', 'SERVICE', 100.00, NULL, '{"service_type": "consultation", "valid_days": 90}', TRUE),
('Priority Booking', 'Priority booking for 3 months', 'VIP', 250.00, NULL, '{"duration_months": 3}', TRUE),
('Studio Merchandise', 'Premium studio branded t-shirt', 'MERCHANDISE', 150.00, 100, '{"item": "premium_tshirt", "size": "varies"}', TRUE),
('Studio Hoodie', 'Exclusive studio branded hoodie', 'MERCHANDISE', 200.00, 50, '{"item": "hoodie", "size": "varies"}', TRUE),
('Cleaning & Care Kit', 'Professional tattoo care products', 'MERCHANDISE', 120.00, 75, '{"items": ["soap", "lotion", "sunscreen"]}', TRUE),
('VIP Pass - 6 Months', 'VIP treatment for 6 months', 'VIP', 400.00, NULL, '{"duration_months": 6, "benefits": ["priority_booking", "free_touch_ups", "referral_bonus"]}', TRUE);

-- Insert sample promotions
INSERT INTO minicoin_promotions (name, description, promotion_type, multiplier, start_date, end_date, is_active) VALUES
('Summer Promotion', 'Double coins earned during summer', 'BONUS_MULTIPLIER', 2.00, '2026-06-01', '2026-08-31', TRUE),
('Grand Opening Bonus', 'Triple coins for new customers', 'BONUS_MULTIPLIER', 3.00, '2026-06-20', '2026-07-20', TRUE),
('Referral Boost', 'Extra 25 bonus coins per successful referral', 'SPECIAL_REWARD', 1.50, '2026-06-15', '2026-06-30', TRUE);

-- Commit all changes
COMMIT;
