-- =============================================
-- META SEED DATA (транзакции, отзывы, аналитика и т.д.)
-- =============================================
-- +goose Up
BEGIN;

-- =============================================
-- TRANSACTIONS (проверяем существование пользователей)
-- =============================================
INSERT INTO transactions (id, user_id, restaurant_id, campaign_id, amount, discount_amount, final_amount, status, payment_method, confirmed_at) 
SELECT 
    '88888888-8888-8888-8888-888888888801',
    '11111111-1111-1111-1111-111111111101',
    '22222222-2222-2222-2222-222222222207',
    '66666666-6666-6666-6666-666666666601',
    4500.00, 900.00, 3600.00, 'confirmed', 'card', NOW() - INTERVAL '3 days'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111101');

INSERT INTO transactions (id, user_id, restaurant_id, campaign_id, amount, discount_amount, final_amount, status, payment_method, confirmed_at) 
SELECT 
    '88888888-8888-8888-8888-888888888802',
    '11111111-1111-1111-1111-111111111102',
    '22222222-2222-2222-2222-222222222206',
    '66666666-6666-6666-6666-666666666602',
    3200.00, 750.00, 2450.00, 'confirmed', 'card', NOW() - INTERVAL '2 days'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111102');

INSERT INTO transactions (id, user_id, restaurant_id, campaign_id, amount, discount_amount, final_amount, status, payment_method, confirmed_at) 
SELECT 
    '88888888-8888-8888-8888-888888888803',
    '11111111-1111-1111-1111-111111111103',
    '22222222-2222-2222-2222-222222222205',
    '66666666-6666-6666-6666-666666666603',
    6000.00, 1500.00, 4500.00, 'confirmed', 'card', NOW() - INTERVAL '1 days'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111103');

-- =============================================
-- REVIEWS (только если существуют пользователи и транзакции)
-- =============================================
INSERT INTO reviews (id, user_id, restaurant_id, transaction_id, rating, comment, is_verified) 
SELECT 
    '99999999-9999-9999-9999-999999999901',
    '11111111-1111-1111-1111-111111111115',
    '22222222-2222-2222-2222-222222222201',
    '88888888-8888-8888-8888-888888888801',
    5, 'Отличный ресторан! Обслуживание на высшем уровне, еда просто восхитительная. Обязательно вернусь.', true
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111115')
  AND EXISTS (SELECT 1 FROM transactions WHERE id = '88888888-8888-8888-8888-888888888801');

INSERT INTO reviews (id, user_id, restaurant_id, transaction_id, rating, comment, is_verified) 
SELECT 
    '99999999-9999-9999-9999-999999999902',
    '11111111-1111-1111-1111-111111111115',
    '22222222-2222-2222-2222-222222222202',
    '88888888-8888-8888-8888-888888888802',
    4, 'Очень атмосферное место. Кухня хорошая, но немного дороговато. Персонал вежливый.', true
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111115')
  AND EXISTS (SELECT 1 FROM transactions WHERE id = '88888888-8888-8888-8888-888888888802');

INSERT INTO reviews (id, user_id, restaurant_id, transaction_id, rating, comment, is_verified) 
SELECT 
    '99999999-9999-9999-9999-999999999903',
    '11111111-1111-1111-1111-111111111114',
    '22222222-2222-2222-2222-222222222207',
    '88888888-8888-8888-8888-888888888803',
    5, 'Невероятный вид на Москву! Идеальное место для особого случая. Еда и сервис на пять с плюсом.', true
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111114')
  AND EXISTS (SELECT 1 FROM transactions WHERE id = '88888888-8888-8888-8888-888888888803');

-- =============================================
-- USER ACTIONS
-- =============================================
INSERT INTO user_actions (id, user_id, restaurant_id, action_type, created_at) 
SELECT 
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1',
    '11111111-1111-1111-1111-111111111101',
    '22222222-2222-2222-2222-222222222201',
    'view', NOW() - INTERVAL '4 hours'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111101');

INSERT INTO user_actions (id, user_id, restaurant_id, action_type, created_at) 
SELECT 
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2',
    '11111111-1111-1111-1111-111111111101',
    '22222222-2222-2222-2222-222222222201',
    'swipe_right', NOW() - INTERVAL '3 hours'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111101');

INSERT INTO user_actions (id, user_id, restaurant_id, action_type, created_at) 
SELECT 
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3',
    '11111111-1111-1111-1111-111111111102',
    '22222222-2222-2222-2222-222222222202',
    'view', NOW() - INTERVAL '5 hours'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111102');

INSERT INTO user_actions (id, user_id, restaurant_id, action_type, created_at) 
SELECT 
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4',
    '11111111-1111-1111-1111-111111111102',
    '22222222-2222-2222-2222-222222222202',
    'favorite', NOW() - INTERVAL '4 hours'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111102');

-- =============================================
-- USER FAVORITES
-- =============================================
INSERT INTO user_favorites (id, user_id, restaurant_id) 
SELECT 
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb1',
    '11111111-1111-1111-1111-111111111101',
    '22222222-2222-2222-2222-222222222201'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111101');

INSERT INTO user_favorites (id, user_id, restaurant_id) 
SELECT 
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb2',
    '11111111-1111-1111-1111-111111111102',
    '22222222-2222-2222-2222-222222222202'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111102');

INSERT INTO user_favorites (id, user_id, restaurant_id) 
SELECT 
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb3',
    '11111111-1111-1111-1111-111111111103',
    '22222222-2222-2222-2222-222222222207'
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111103');

-- =============================================
-- ANALYTICS DAILY
-- =============================================
INSERT INTO analytics_daily (id, restaurant_id, date, views, swipes_left, swipes_right, clicks, bookings, revenue) VALUES
('cccccccc-cccc-cccc-cccc-ccccccccccc1', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '7 days', 45, 10, 25, 15, 3, 12000.00),
('cccccccc-cccc-cccc-cccc-ccccccccccc2', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '6 days', 52, 12, 28, 18, 4, 15000.00),
('cccccccc-cccc-cccc-cccc-ccccccccccc3', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '5 days', 48, 8, 30, 20, 5, 18000.00),
('cccccccc-cccc-cccc-cccc-ccccccccccc4', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '4 days', 60, 15, 35, 25, 6, 21000.00),
('cccccccc-cccc-cccc-cccc-ccccccccccc5', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '3 days', 55, 10, 32, 22, 4, 16000.00),
('cccccccc-cccc-cccc-cccc-ccccccccccc6', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '2 days', 65, 18, 38, 30, 7, 24000.00),
('cccccccc-cccc-cccc-cccc-ccccccccccc7', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '1 days', 70, 20, 40, 35, 8, 27000.00)
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- NOTIFICATIONS
-- =============================================
INSERT INTO notifications (id, user_id, title, message, type, is_read) 
SELECT 
    'dddddddd-dddd-dddd-dddd-ddddddddddd1',
    '11111111-1111-1111-1111-111111111101',
    'Ваш заказ подтверждён',
    'Заказ №88888888-8888-8888-8888-888888888801 успешно оплачен',
    'success', true
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111101');

INSERT INTO notifications (id, user_id, title, message, type, is_read) 
SELECT 
    'dddddddd-dddd-dddd-dddd-ddddddddddd2',
    '11111111-1111-1111-1111-111111111101',
    'Новая акция',
    'В ресторане Turandot действует скидка 20% на всё меню',
    'promo', false
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111101');

INSERT INTO notifications (id, user_id, title, message, type, is_read) 
SELECT 
    'dddddddd-dddd-dddd-dddd-ddddddddddd3',
    '11111111-1111-1111-1111-111111111102',
    'Спасибо за отзыв',
    'Ваш отзыв о ресторане Café Pushkin был опубликован',
    'info', true
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111102');

-- =============================================
-- REFERRALS
-- =============================================
INSERT INTO referrals (id, referrer_id, referee_id, referral_code, reward_amount, is_rewarded) 
SELECT 
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1',
    '11111111-1111-1111-1111-111111111101',
    '11111111-1111-1111-1111-111111111104',
    'REFALEX', 500.00, true
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111101')
  AND EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111104');

INSERT INTO referrals (id, referrer_id, referee_id, referral_code, reward_amount, is_rewarded) 
SELECT 
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2',
    '11111111-1111-1111-1111-111111111102',
    '11111111-1111-1111-1111-111111111105',
    'REFMARIA', 500.00, false
WHERE EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111102')
  AND EXISTS (SELECT 1 FROM users WHERE id = '11111111-1111-1111-1111-111111111105');

COMMIT;

-- +goose Down
-- Удаляем метаданные
DELETE FROM referrals WHERE id IN (
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1',
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2'
);

DELETE FROM notifications WHERE id IN (
    'dddddddd-dddd-dddd-dddd-ddddddddddd1',
    'dddddddd-dddd-dddd-dddd-ddddddddddd2',
    'dddddddd-dddd-dddd-dddd-ddddddddddd3'
);

DELETE FROM analytics_daily WHERE id IN (
    'cccccccc-cccc-cccc-cccc-ccccccccccc1',
    'cccccccc-cccc-cccc-cccc-ccccccccccc2',
    'cccccccc-cccc-cccc-cccc-ccccccccccc3',
    'cccccccc-cccc-cccc-cccc-ccccccccccc4',
    'cccccccc-cccc-cccc-cccc-ccccccccccc5',
    'cccccccc-cccc-cccc-cccc-ccccccccccc6',
    'cccccccc-cccc-cccc-cccc-ccccccccccc7'
);

DELETE FROM user_favorites WHERE id IN (
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb1',
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb2',
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb3'
);

DELETE FROM user_actions WHERE id IN (
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4'
);

DELETE FROM reviews WHERE id IN (
    '99999999-9999-9999-9999-999999999901',
    '99999999-9999-9999-9999-999999999902',
    '99999999-9999-9999-9999-999999999903'
);

DELETE FROM transactions WHERE id IN (
    '88888888-8888-8888-8888-888888888801',
    '88888888-8888-8888-8888-888888888802',
    '88888888-8888-8888-8888-888888888803'
);
