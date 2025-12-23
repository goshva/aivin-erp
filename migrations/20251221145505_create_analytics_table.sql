-- +goose Up
CREATE TABLE analytics (
    id UUID PRIMARY KEY,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP,
    name TEXT NOT NULL,
    value INTEGER NOT NULL
);

-- =============================================
-- DOWN MIGRATION FOR MOSCOW SEED DATA
-- =============================================

-- +goose Down
BEGIN;

-- Remove data in reverse order of foreign key dependencies

-- Referrals (depends on users)
DELETE FROM referrals;

-- Notifications (depends on users)
DELETE FROM notifications;

-- Analytics Daily (depends on restaurants)
DELETE FROM analytics_daily;

-- User Favorites (depends on users and restaurants)
DELETE FROM user_favorites;

-- User Actions (depends on users, restaurants, menu_items, campaigns)
DELETE FROM user_actions;

-- Reviews (depends on users, restaurants, transactions)
DELETE FROM reviews;

-- Transactions (depends on users, restaurants, campaigns)
DELETE FROM transactions;

-- Campaigns (depends on restaurants and users)
DELETE FROM campaigns;

-- Menu Items (depends on restaurants and menu_categories)
DELETE FROM menu_items;

-- Menu Categories (depends on restaurants)
DELETE FROM menu_categories;

-- Restaurant Admins (depends on users and restaurants)
DELETE FROM restaurant_admins;

-- Restaurants (depends on users)
DELETE FROM restaurants;

-- Invites (no dependencies)
DELETE FROM invites;

-- Users (base table)
DELETE FROM users;

-- Reset sequences if any (for UUIDs this isn't necessary, but included for completeness)
-- SELECT setval(pg_get_serial_sequence('users', 'id'), 1, false); -- Not needed for UUID

COMMIT;