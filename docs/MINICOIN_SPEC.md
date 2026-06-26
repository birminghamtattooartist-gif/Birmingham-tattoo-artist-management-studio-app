# Minicoin Virtual Currency System

## Overview
Minicoin is a virtual currency system for the tattoo studio management app that rewards client loyalty, engagement, and referrals. Users earn coins through various activities and can redeem them for discounts, services, or merchandise.

## Core Features

### 1. User Accounts
- Each user has a minicoin account tracking balance, total earned, and total spent
- Account created automatically upon user registration
- Balance updates in real-time with transactions

### 2. Earning Mechanisms
Users can earn coins through:

| Activity | Coins | Frequency |
|----------|-------|-----------|
| Appointment Completion | 10-50 | Per appointment |
| Leave a Review | 25 | Once per appointment |
| Social Media Share | 15 | Daily limit |
| Referral Bonus | 50 | Per successful referral |
| Birthday Bonus | 100 | Annual |
| Seasonal Promotion | Variable | Limited time |

### 3. Spending/Redemption
Users can redeem coins for:
- **Discounts**: 5-20% off services (100-250 coins)
- **Free Services**: Mini touch-ups, cleaning (200-300 coins)
- **Merchandise**: Studio branded items (150-400 coins)
- **VIP Perks**: Priority booking, free consultation (300-500 coins)

### 4. Transaction Types
- **EARN**: Coins gained from activities
- **SPEND**: Coins used for redemptions
- **BONUS**: Special promotions or bonuses
- **REFUND**: Returned coins (cancelled appointments, returns)
- **ADJUSTMENT**: Manual admin adjustments

### 5. Referral System
- Each user gets a unique referral code
- Earn bonus when referred user completes first appointment
- Referred user also receives welcome bonus

### 6. Promotions
- Seasonal multipliers (double coins events)
- Time-limited special earning opportunities
- Holiday bonuses

## Database Schema

### Tables

#### minicoin_accounts
Stores user account balances and totals
```sql
id, user_id, balance, total_earned, total_spent, created_at, updated_at
```

#### minicoin_transactions
Complete transaction history for auditing
```sql
id, user_id, transaction_type, amount, description, reference_type, reference_id, balance_after, created_at
```

#### minicoin_earning_rules
Configurable earning rules for flexibility
```sql
id, name, description, earning_type, amount_earned, max_frequency, is_active, created_at, updated_at
```

#### minicoin_rewards
Available rewards in the shop
```sql
id, name, description, category, cost, quantity_available, quantity_redeemed, reward_details, is_active, created_at, updated_at
```

#### minicoin_redemptions
User redemption history and status tracking
```sql
id, user_id, reward_id, redemption_code, redeemed_at, expires_at, used_at, status, notes
```

#### minicoin_referrals
Referral tracking and bonus management
```sql
id, referrer_user_id, referred_user_id, referral_code, bonus_amount, referrer_bonus, is_active, referred_at, created_at
```

#### minicoin_events
Analytics and event logging
```sql
id, user_id, event_type, event_details, metadata, created_at
```

#### minicoin_promotions
Time-limited promotions and bonuses
```sql
id, name, description, promotion_type, multiplier, start_date, end_date, is_active, created_at, updated_at
```

## API Endpoints (To Be Implemented)

### User Endpoints
- `GET /api/minicoin/balance` - Get user's current balance
- `GET /api/minicoin/history` - Get transaction history
- `GET /api/minicoin/rewards` - Get available rewards
- `POST /api/minicoin/redeem/:rewardId` - Redeem a reward
- `GET /api/minicoin/referral-code` - Get user's referral code

### Admin Endpoints
- `POST /api/admin/minicoin/rules` - Create earning rule
- `PUT /api/admin/minicoin/rules/:id` - Update earning rule
- `POST /api/admin/minicoin/rewards` - Create reward
- `PUT /api/admin/minicoin/rewards/:id` - Update reward
- `POST /api/admin/minicoin/promotion` - Create promotion
- `POST /api/admin/minicoin/adjust-balance` - Manual balance adjustment

## Business Rules

1. **Minimum Balance**: Balance cannot go negative
2. **Coin Expiration**: Coins earned do not expire, but redeemed rewards may have expiration dates
3. **Transaction Atomicity**: All coin transactions must be atomic (all or nothing)
4. **Audit Trail**: All transactions must be logged for compliance
5. **Fraud Prevention**: Duplicate earning detection (same user, same activity, same day = blocked)
6. **Referral Limits**: Each referral code can only be used once per new user

## Security Considerations

1. All coin transfers require authentication
2. Admin adjustments logged with admin user ID
3. Redemption codes generated with cryptographic randomness
4. Rate limiting on earning endpoints
5. Transactions signed/verified for integrity

## Analytics Dashboards

### User Dashboard
- Current balance display
- Recent transactions
- Available rewards
- Referral earnings

### Admin Dashboard
- Total coins in circulation
- Popular rewards
- Referral conversion rate
- Revenue impact analysis
- Fraud detection alerts

## Future Enhancements

- [ ] Leaderboards (top coin earners)
- [ ] Coin marketplace (user-to-user trading)
- [ ] Loyalty tiers (Bronze, Silver, Gold, Platinum)
- [ ] Integration with payment systems
- [ ] Mobile app notifications for coin earnings
- [ ] Gamification elements (badges, achievements)
- [ ] Cryptocurrency integration option
