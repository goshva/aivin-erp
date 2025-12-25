-- +goose Up
-- Создание ENUM типов
CREATE TYPE user_role AS ENUM ('user', 'restaurant_admin', 'super_admin');
CREATE TYPE restaurant_status AS ENUM ('pending', 'verified', 'suspended', 'rejected');
CREATE TYPE cuisine_type AS ENUM ('russian', 'italian', 'asian', 'european', 'american', 'mexican', 'indian', 'japanese', 'chinese', 'mediterranean', 'french', 'georgian', 'thai', 'korean');
CREATE TYPE action_type AS ENUM ('view', 'swipe_left', 'swipe_right', 'favorite', 'unfavorite', 'click_details', 'book', 'call');
CREATE TYPE transaction_status AS ENUM ('pending', 'confirmed', 'failed', 'refunded');
CREATE TYPE campaign_status AS ENUM ('draft', 'active', 'paused', 'expired');
