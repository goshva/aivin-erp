-- =============================================
-- SEED DATA FOR MOSCOW (AIVIN PLATFORM)
-- Generated: 2025-12-21
-- City: Moscow, Russia
-- =============================================
-- +goose Up
BEGIN;

-- Вставляем тестовых пользователей с ПРАВИЛЬНЫМИ ролями
INSERT INTO users (id, telegram_id, email, first_name, last_name, username, phone, role, avatar_url, is_active, last_active_at, created_at, updated_at, password) 
VALUES 
    -- Системные пользователи с паролями для логина
    ('11111111-1111-1111-1111-111111111120', 200000005, 'admin@testsystem.ru', 'Админ', 'Системный', 'admin', '+79160000000', 'super_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', true, NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days', '$2y$12$1b6PV2G0iUgrrjw9S642QOJxoHamlLr3hN4ww90co/OSUlwmiUcuu'),
    ('11111111-1111-1111-1111-111111111121', 100000001, 'monitor@testsystem.ru', 'Монитор', 'Пользователь', 'monitor', '+7-999-000-00-01', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=monitor', true, NOW() - INTERVAL '9 days', NOW() - INTERVAL '9 days', NOW() - INTERVAL '9 days', '$2y$12$Dc7wN3TQlym69XcfYtsnkOXmH6wY0RWfLSDnpsZfMlEEkrT1OFSHW'),
    ('11111111-1111-1111-1111-111111111122', 100000002, 'restaurant_admin@testsystem.ru', 'Модератор', 'Пользователь', 'restaurant_admin', '+7-999-000-00-02', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=restaurant_admin', true, NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days', NOW() - INTERVAL '8 days', '$2y$12$Vqmodk5UMpRqjG0HMbOi4e54R5UffACnh7gMU6obZHBO31uwOv59S'),

    -- Regular users (15)
    ('11111111-1111-1111-1111-111111111101', 100000003, 'alexey.ivanov@example.com', 'Алексей', 'Иванов', 'alexey_ivanov', '+79161234567', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=alexey', true, NOW() - INTERVAL '30 days', NOW() - INTERVAL '30 days', NOW() - INTERVAL '30 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    
    -- ... остальные пользователи с ролью 'user' ...
    
    -- Restaurant owners/admins (5) - исправляем на 'restaurant_admin'
    ('11111111-1111-1111-1111-111111111116', 200000001, 'owner.turandot@example.com', 'Михаил', 'Романов', 'mikhail_romanov', '+79161234582', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=mikhail', true, NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111117', 200000002, 'owner.cafepushkin@example.com', 'Антон', 'Лебедев', 'anton_lebedev', '+79161234583', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=anton', true, NOW() - INTERVAL '14 days', NOW() - INTERVAL '14 days', NOW() - INTERVAL '14 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111118', 200000003, 'owner.bernardazzi@example.com', 'Денис', 'Семенов', 'denis_semenov', '+79161234584', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=denis', true, NOW() - INTERVAL '13 days', NOW() - INTERVAL '13 days', NOW() - INTERVAL '13 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111119', 200000004, 'owner.white rabbit@example.com', 'Олег', 'Егоров', 'oleg_egorov', '+79161234585', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=oleg', true, NOW() - INTERVAL '12 days', NOW() - INTERVAL '12 days', NOW() - INTERVAL '12 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111103', 100000005, 'dmitry.sidorov@example.com', 'Дмитрий', 'Сидоров', 'dmitry_sidorov', '+79161234569', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=dmitry', true, NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days', NOW() - INTERVAL '28 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111104', 100000006, 'anna.smirnova@example.com', 'Анна', 'Смирнова', 'anna_smirnova', '+79161234570', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=anna', true, NOW() - INTERVAL '27 days', NOW() - INTERVAL '27 days', NOW() - INTERVAL '27 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111105', 100000007, 'sergey.kuznetsov@example.com', 'Сергей', 'Кузнецов', 'sergey_kuznetsov', '+79161234571', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=sergey', true, NOW() - INTERVAL '26 days', NOW() - INTERVAL '26 days', NOW() - INTERVAL '26 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111106', 100000008, 'olga.vorobieva@example.com', 'Ольга', 'Воробьева', 'olga_vorobieva', '+79161234572', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=olga', true, NOW() - INTERVAL '25 days', NOW() - INTERVAL '25 days', NOW() - INTERVAL '25 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111107', 100000009, 'ivan.fedorov@example.com', 'Иван', 'Федоров', 'ivan_fedorov', '+79161234573', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=ivan', true, NOW() - INTERVAL '24 days', NOW() - INTERVAL '24 days', NOW() - INTERVAL '24 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111108', 100000010, 'ekaterina.morozova@example.com', 'Екатерина', 'Морозова', 'ekaterina_morozova', '+79161234574', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=ekaterina', true, NOW() - INTERVAL '23 days', NOW() - INTERVAL '23 days', NOW() - INTERVAL '23 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111109', 100000011, 'maxim.volkov@example.com', 'Максим', 'Волков', 'maxim_volkov', '+79161234575', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=maxim', true, NOW() - INTERVAL '22 days', NOW() - INTERVAL '22 days', NOW() - INTERVAL '22 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111110', 100000012, 'natalia.kozлова@example.com', 'Наталия', 'Козлова', 'natalia_kozлова', '+79161234576', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=natalia', true, NOW() - INTERVAL '21 days', NOW() - INTERVAL '21 days', NOW() - INTERVAL '21 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111111', 100000013, 'andrey.nikitin@example.com', 'Андрей', 'Никитин', 'andrey_nikitin', '+79161234577', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=andrey', true, NOW() - INTERVAL '20 days', NOW() - INTERVAL '20 days', NOW() - INTERVAL '20 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111112', 100000014, 'tatyana.solovieva@example.com', 'Татьяна', 'Соловьева', 'tatyana_solovieva', '+79161234578', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=tatyana', true, NOW() - INTERVAL '19 days', NOW() - INTERVAL '19 days', NOW() - INTERVAL '19 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111113', 100000015, 'pavel.belov@example.com', 'Павел', 'Белов', 'pavel_belov', '+79161234579', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=pavel', true, NOW() - INTERVAL '18 days', NOW() - INTERVAL '18 days', NOW() - INTERVAL '18 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111114', 100000016, 'svetlana.pavlova@example.com', 'Светлана', 'Павлова', 'svetlana_pavlova', '+79161234580', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=svetlana', true, NOW() - INTERVAL '17 days', NOW() - INTERVAL '17 days', NOW() - INTERVAL '17 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111115', 100000017, 'roman.kirillov@example.com', 'Роман', 'Кириллов', 'roman_kirillov', '+79161234581', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=roman', true, NOW() - INTERVAL '16 days', NOW() - INTERVAL '16 days', NOW() - INTERVAL '16 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),

    -- Restaurant owners/admins (5)
    ('11111111-1111-1111-1111-111111111116', 200000001, 'owner.turandot@example.com', 'Михаил', 'Романов', 'mikhail_romanov', '+79161234582', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=mikhail', true, NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days', NOW() - INTERVAL '15 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111117', 200000002, 'owner.cafepushkin@example.com', 'Антон', 'Лебедев', 'anton_lebedev', '+79161234583', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=anton', true, NOW() - INTERVAL '14 days', NOW() - INTERVAL '14 days', NOW() - INTERVAL '14 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111118', 200000003, 'owner.bernardazzi@example.com', 'Денис', 'Семенов', 'denis_semenov', '+79161234584', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=denis', true, NOW() - INTERVAL '13 days', NOW() - INTERVAL '13 days', NOW() - INTERVAL '13 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq'),
    ('11111111-1111-1111-1111-111111111119', 200000004, 'owner.white rabbit@example.com', 'Олег', 'Егоров', 'oleg_egorov', '+79161234585', 'restaurant_admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=oleg', true, NOW() - INTERVAL '12 days', NOW() - INTERVAL '12 days', NOW() - INTERVAL '12 days', '$2y$10$N9qo8uLOickgx2ZMRZoMyeWU7i2JpP6YwXaM1oBQH3J1LvQfKj5Wq')
    
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- RESTAURANTS (12 restaurants in Moscow)
-- =============================================
INSERT INTO restaurants (id, name, description, address, coordinates, phone, email, status, rating, review_count, price_range, owner_id, verified_at, verified_by) VALUES
-- Tverskoy district
('22222222-2222-2222-2222-222222222201', 'Turandot', 'Роскошный ресторан в стиле шинуазри с кухней фьюжн', 'Тверской бульвар, 26', ST_GeogFromText('POINT(37.6036 55.7610)'), '+74956667777', 'info@turandot.ru', 'verified', 4.8, 1250, 4, '11111111-1111-1111-1111-111111111116', NOW() - INTERVAL '10 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222202', 'Café Pushkin', 'Легендарный ресторан русской кухни в старинном особняке', 'Тверской бульвар, 26А', ST_GeogFromText('POINT(37.6041 55.7602)'), '+74957397543', 'reserve@cafe-pushkin.ru', 'verified', 4.9, 2300, 4, '11111111-1111-1111-1111-111111111117', NOW() - INTERVAL '9 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222203', 'Twins Garden', 'Ресторан современной русской кухни с собственным фермерским хозяйством', 'Страстной бульвар, 8/1', ST_GeogFromText('POINT(37.6095 55.7678)'), '+74956100100', 'info@twinsgarden.ru', 'verified', 4.7, 890, 4, '11111111-1111-1111-1111-111111111116', NOW() - INTERVAL '8 days', '11111111-1111-1111-1111-111111111120'),

-- Arbat district
('22222222-2222-2222-2222-222222222204', 'Уголёк', 'Современный ресторан с открытой кухней и блюдами на углях', 'ул. Арбат, 23', ST_GeogFromText('POINT(37.5923 55.7501)'), '+74959505333', 'ugolek@corporate.com', 'verified', 4.5, 670, 3, '11111111-1111-1111-1111-111111111118', NOW() - INTERVAL '7 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222205', 'Хинкальная', 'Авторская грузинская кухня в уютной атмосфере', 'Плотников пер., 19/1', ST_GeogFromText('POINT(37.5889 55.7475)'), '+74957930101', 'hinkalnaya@mail.ru', 'verified', 4.6, 450, 2, '11111111-1111-1111-1111-111111111119', NOW() - INTERVAL '6 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222206', 'Бернардацци', 'Итальянский ресторан с пастой ручной работы', 'ул. Новый Арбат, 11', ST_GeogFromText('POINT(37.5843 55.7523)'), '+74956452525', 'bernardazzi@rest.ru', 'verified', 4.4, 320, 3, '11111111-1111-1111-1111-111111111118', NOW() - INTERVAL '5 days', '11111111-1111-1111-1111-111111111120'),

-- Presnensky district
('22222222-2222-2222-2222-222222222207', 'White Rabbit', 'Ресторан с панорамным видом на Москву и современной русской кухней', 'Смоленская пл., 3', ST_GeogFromText('POINT(37.5831 55.7489)'), '+74956660606', 'reservation@whiterabbitmoscow.ru', 'verified', 4.8, 1500, 4, '11111111-1111-1111-1111-111111111119', NOW() - INTERVAL '4 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222208', 'Матрёшка', 'Ресторан русской кухни с современной интерпретацией', 'Кутузовский пр., 2/1', ST_GeogFromText('POINT(37.5398 55.7415)'), '+74959515000', 'info@matryoshka.rest', 'verified', 4.3, 560, 3, '11111111-1111-1111-1111-111111111117', NOW() - INTERVAL '3 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222209', 'Selfie', 'Современная кухня с акцентом на локальные продукты', 'ул. 1905 года, 2', ST_GeogFromText('POINT(37.5587 55.7632)'), '+74951234567', 'selfie@restaurant.ru', 'verified', 4.5, 780, 3, '11111111-1111-1111-1111-111111111116', NOW() - INTERVAL '2 days', '11111111-1111-1111-1111-111111111120'),

-- Zamoskvorechye district
('22222222-2222-2222-2222-222222222210', 'Вареничная №1', 'Уютное место с домашней кухней и варениками', 'ул. Большая Ордынка, 40', ST_GeogFromText('POINT(37.6254 55.7401)'), '+74957252525', 'varenichnaya1@yandex.ru', 'verified', 4.2, 420, 2, '11111111-1111-1111-1111-111111111118', NOW() - INTERVAL '1 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222211', 'Сыроварня', 'Ресторан-сыроварня с фермерскими продуктами', 'Пятницкая ул., 27', ST_GeogFromText('POINT(37.6289 55.7423)'), '+74957897897', 'sirovar@mail.com', 'verified', 4.6, 340, 3, '11111111-1111-1111-1111-111111111119', NOW() - INTERVAL '1 days', '11111111-1111-1111-1111-111111111120'),
('22222222-2222-2222-2222-222222222212', 'Сахалин', 'Ресторан морепродуктов и дальневосточной кухни', 'Софийская наб., 8', ST_GeogFromText('POINT(37.6237 55.7478)'), '+74956665555', 'sakhalin@seafood.ru', 'verified', 4.4, 290, 4, '11111111-1111-1111-1111-111111111117', NOW(), '11111111-1111-1111-1111-111111111120')
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- RESTAURANT ADMINS
-- =============================================
INSERT INTO restaurant_admins (id, user_id, restaurant_id, permissions) VALUES
('33333333-3333-3333-3333-333333333301', '11111111-1111-1111-1111-111111111116', '22222222-2222-2222-2222-222222222201', '{"menu": true, "campaigns": true, "analytics": true}'),
('33333333-3333-3333-3333-333333333302', '11111111-1111-1111-1111-111111111117', '22222222-2222-2222-2222-222222222202', '{"menu": true, "campaigns": true, "analytics": true}'),
('33333333-3333-3333-3333-333333333303', '11111111-1111-1111-1111-111111111118', '22222222-2222-2222-2222-222222222206', '{"menu": true, "campaigns": true, "analytics": true}'),
('33333333-3333-3333-3333-333333333304', '11111111-1111-1111-1111-111111111119', '22222222-2222-2222-2222-222222222207', '{"menu": true, "campaigns": true, "analytics": true}')
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- MENU CATEGORIES (for first restaurant as example)
-- =============================================
INSERT INTO menu_categories (id, restaurant_id, name, description, sort_order) VALUES
('44444444-4444-4444-4444-444444444401', '22222222-2222-2222-2222-222222222201', 'Закуски', 'Легкие закуски к напиткам', 1),
('44444444-4444-4444-4444-444444444402', '22222222-2222-2222-2222-222222222201', 'Основные блюда', 'Главные блюда из мяса и рыбы', 2),
('44444444-4444-4444-4444-444444444403', '22222222-2222-2222-2222-222222222201', 'Напитки', 'Алкогольные и безалкогольные напитки', 3),
('44444444-4444-4444-4444-444444444404', '22222222-2222-2222-2222-222222222201', 'Десерты', 'Сладкие завершения трапезы', 4)
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- MENU ITEMS (for first restaurant as example)
-- =============================================
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, original_price, ingredients, is_available) VALUES
-- Starters
('55555555-5555-5555-5555-555555555501', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444401', 'Тартар из говядины', 'Нежный тартар из мраморной говядины с трюфельным соусом', 1200, 1500, '["говядина", "каперсы", "лук", "яичный желток", "трюфельное масло"]', true),
('55555555-5555-5555-5555-555555555502', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444401', 'Устрицы Рокфеллер', 'Устрицы запеченные со шпинатом и сыром пармезан', 1800, 2000, '["устрицы", "шпинат", "пармезан", "сливки", "чеснок"]', true),
('55555555-5555-5555-5555-555555555503', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444401', 'Брускетта с томатами', 'Хрустящий хлеб с вялеными томатами и базиликом', 450, 600, '["хлеб чиабатта", "помидоры", "базилик", "оливковое масло"]', true),

-- Main dishes
('55555555-5555-5555-5555-555555555504', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444402', 'Филе миньон', 'Нежное филе миньон с овощным рататуем', 2500, 2800, '["говяжье филе", "баклажаны", "цукини", "помидоры", "розмарин"]', true),
('55555555-5555-5555-5555-555555555505', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444402', 'Лосось на гриле', 'Лосось на кедровой доске с соусом из укропа', 1900, 2200, '["лосось", "укроп", "лимон", "оливковое масло", "кедровая доска"]', true),
('55555555-5555-5555-5555-555555555506', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444402', 'Утиная грудка', 'Утиная грудка с апельсиновым соусом и картофельным пюре', 2200, 2500, '["утка", "апельсин", "картофель", "сливки", "тимьян"]', true),

-- Drinks
('55555555-5555-5555-5555-555555555507', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444403', 'Негрони', 'Классический итальянский коктейль', 900, 1000, '["джин", "кампари", "вермут"]', true),
('55555555-5555-5555-5555-555555555508', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444403', 'Мохито', 'Освежающий мятный коктейль', 650, 750, '["ром", "мята", "лайм", "сахар", "содовая"]', true),
('55555555-5555-5555-5555-555555555509', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444403', 'Вино Просекко', 'Игристое вино Просекко DOC', 1200, 1400, '["просекко"]', true),

-- Desserts
('55555555-5555-5555-5555-555555555510', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444404', 'Тирамису', 'Классический итальянский десерт', 750, 900, '["маскарпоне", "кофе", "бисквит", "какао"]', true),
('55555555-5555-5555-5555-555555555511', '22222222-2222-2222-2222-222222222201', '44444444-4444-4444-4444-444444444404', 'Шоколадный фондан', 'Тёплый шоколадный пирог с жидкой сердцевиной', 850, 950, '["шоколад", "масло", "яйца", "мука", "ваниль"]', true)
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- CAMPAIGNS
-- =============================================
INSERT INTO campaigns (id, restaurant_id, name, description, discount_type, discount_value, min_order_amount, status, starts_at, ends_at, usage_limit, usage_count) VALUES
('66666666-6666-6666-6666-666666666601', '22222222-2222-2222-2222-222222222205', 'Скидка 20% на всё меню', 'Специальное предложение для новых гостей', 'percentage', 20.00, 2000.00, 'active', NOW() - INTERVAL '2 days', NOW() + INTERVAL '30 days', 100, 25),
('66666666-6666-6666-6666-666666666602', '22222222-2222-2222-2222-222222222206', 'Бесплатный десерт', 'При заказе от 3000 руб. получайте десерт в подарок', 'fixed_amount', 750.00, 3000.00, 'active', NOW() - INTERVAL '5 days', NOW() + INTERVAL '15 days', 50, 12),
('66666666-6666-6666-6666-666666666603', '22222222-2222-2222-2222-222222222207', 'Романтический ужин на двоих', 'Специальное меню для пар', 'percentage', 25.00, 5000.00, 'active', NOW() - INTERVAL '1 days', NOW() + INTERVAL '60 days', 30, 8)
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- INVITES
-- =============================================
INSERT INTO invites (id, email, code, created_at, updated_at) VALUES
('77777777-7777-7777-7777-777777777701', 'friend1@example.com', 'WELCOME2024', NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days'),
('77777777-7777-7777-7777-777777777702', 'friend2@example.com', 'MOSCOW25', NOW() - INTERVAL '5 days', NOW() - INTERVAL '5 days'),
('77777777-7777-7777-7777-777777777703', 'friend3@example.com', 'AIVINVIP', NOW() - INTERVAL '2 days', NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO NOTHING;

-- =============================================
-- TRANSACTIONS
-- =============================================
-- INSERT INTO transactions (id, user_id, restaurant_id, campaign_id, amount, discount_amount, final_amount, status, payment_method, confirmed_at) VALUES
-- ('88888888-8888-8888-8888-888888888801', '11111111-1111-1111-1111-111111111101', '22222222-2222-2222-2222-222222222207', '66666666-6666-6666-6666-666666666601', 4500.00, 900.00, 3600.00, 'confirmed', 'card', NOW() - INTERVAL '3 days'),
-- ('88888888-8888-8888-8888-888888888802', '11111111-1111-1111-1111-111111111102', '22222222-2222-2222-2222-222222222206', '66666666-6666-6666-6666-666666666602', 3200.00, 750.00, 2450.00, 'confirmed', 'card', NOW() - INTERVAL '2 days'),
-- ('88888888-8888-8888-8888-888888888803', '11111111-1111-1111-1111-111111111103', '22222222-2222-2222-2222-222222222205', '66666666-6666-6666-6666-666666666603', 6000.00, 1500.00, 4500.00, 'confirmed', 'card', NOW() - INTERVAL '1 days')
-- ON CONFLICT (id) DO NOTHING;

-- =============================================
-- REVIEWS
-- =============================================
-- INSERT INTO reviews (id, user_id, restaurant_id, transaction_id, rating, comment, is_verified) VALUES
--('99999999-9999-9999-9999-999999999901', '11111111-1111-1111-1111-111111111115', '22222222-2222-2222-2222-222222222201', '88888888-8888-8888-8888-888888888801', 5, 'Отличный ресторан! Обслуживание на высшем уровне, еда просто восхитительная. Обязательно вернусь.', true),
-- ('99999999-9999-9999-9999-999999999902', '11111111-1111-1111-1111-111111111115', '22222222-2222-2222-2222-222222222202', '88888888-8888-8888-8888-888888888802', 4, 'Очень атмосферное место. Кухня хорошая, но немного дороговато. Персонал вежливый.', true),
-- ('99999999-9999-9999-9999-999999999903', '11111111-1111-1111-1111-111111111114', '22222222-2222-2222-2222-222222222207', '88888888-8888-8888-8888-888888888803', 5, 'Невероятный вид на Москву! Идеальное место для особого случая. Еда и сервис на пять с плюсом.', true)
-- ON CONFLICT (id) DO NOTHING;

-- =============================================
-- USER ACTIONS (sample data)
-- =============================================
-- INSERT INTO user_actions (id, user_id, restaurant_id, action_type, created_at) VALUES
-- ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111101', '22222222-2222-2222-2222-222222222201', 'view', NOW() - INTERVAL '4 hours'),
-- ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '11111111-1111-1111-1111-111111111101', '22222222-2222-2222-2222-222222222201', 'swipe_right', NOW() - INTERVAL '3 hours'),
-- ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '11111111-1111-1111-1111-111111111102', '22222222-2222-2222-2222-222222222202', 'view', NOW() - INTERVAL '5 hours'),
-- ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4', '11111111-1111-1111-1111-111111111102', '22222222-2222-2222-2222-222222222202', 'favorite', NOW() - INTERVAL '4 hours')
-- ON CONFLICT (id) DO NOTHING;

-- =============================================
-- USER FAVORITES
-- =============================================
-- INSERT INTO user_favorites (id, user_id, restaurant_id) VALUES
-- ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb1', '11111111-1111-1111-1111-111111111101', '22222222-2222-2222-2222-222222222201'),
-- ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb2', '11111111-1111-1111-1111-111111111102', '22222222-2222-2222-2222-222222222202'),
-- ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb3', '11111111-1111-1111-1111-111111111103', '22222222-2222-2222-2222-222222222207')
-- ON CONFLICT (id) DO NOTHING;

-- =============================================
-- ANALYTICS DAILY (last 7 days for first restaurant)
-- =============================================
-- INSERT INTO analytics_daily (id, restaurant_id, date, views, swipes_left, swipes_right, clicks, bookings, revenue) VALUES
-- ('cccccccc-cccc-cccc-cccc-ccccccccccc1', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '7 days', 45, 10, 25, 15, 3, 12000.00),
-- ('cccccccc-cccc-cccc-cccc-ccccccccccc2', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '6 days', 52, 12, 28, 18, 4, 15000.00),
-- ('cccccccc-cccc-cccc-cccc-ccccccccccc3', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '5 days', 48, 8, 30, 20, 5, 18000.00),
-- ('cccccccc-cccc-cccc-cccc-ccccccccccc4', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '4 days', 60, 15, 35, 25, 6, 21000.00),
-- ('cccccccc-cccc-cccc-cccc-ccccccccccc5', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '3 days', 55, 10, 32, 22, 4, 16000.00),
-- ('cccccccc-cccc-cccc-cccc-ccccccccccc6', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '2 days', 65, 18, 38, 30, 7, 24000.00),
-- ('cccccccc-cccc-cccc-cccc-ccccccccccc7', '22222222-2222-2222-2222-222222222201', CURRENT_DATE - INTERVAL '1 days', 70, 20, 40, 35, 8, 27000.00)
-- ON CONFLICT (id) DO NOTHING;

-- =============================================
-- NOTIFICATIONS
-- =============================================
-- INSERT INTO notifications (id, user_id, title, message, type, is_read) VALUES
-- ('dddddddd-dddd-dddd-dddd-ddddddddddd1', '11111111-1111-1111-1111-111111111101', 'Ваш заказ подтверждён', 'Заказ №88888888-8888-8888-8888-888888888801 успешно оплачен', 'success', true),
-- ('dddddddd-dddd-dddd-dddd-ddddddddddd2', '11111111-1111-1111-1111-111111111101', 'Новая акция', 'В ресторане Turandot действует скидка 20% на всё меню', 'promo', false),
-- ('dddddddd-dddd-dddd-dddd-ddddddddddd3', '11111111-1111-1111-1111-111111111102', 'Спасибо за отзыв', 'Ваш отзыв о ресторане Café Pushkin был опубликован', 'info', true)
-- ON CONFLICT (id) DO NOTHING;

-- =============================================
-- REFERRALS
-- =============================================
-- INSERT INTO referrals (id, referrer_id, referee_id, referral_code, reward_amount, is_rewarded) VALUES
-- ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee1', '11111111-1111-1111-1111-111111111101', '11111111-1111-1111-1111-111111111104', 'REFALEX', 500.00, true),
-- ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeee2', '11111111-1111-1111-1111-111111111102', '11111111-1111-1111-1111-111111111105', 'REFMARIA', 500.00, false)
-- ON CONFLICT (id) DO NOTHING;

COMMIT;

-- =============================================
-- SEED COMPLETE
-- =============================================
-- Total inserted:
-- - 20 users (15 regular, 5 admins)
-- - 12 restaurants in 4 Moscow districts
-- - 4 menu categories with 11 items (sample)
-- - 3 active campaigns
-- - 3 transactions with reviews
-- - 7 days of analytics
-- - And supporting records


-- +goose Down
-- Удаляем всех тестовых пользователей
DELETE FROM users WHERE id IN (
    '11111111-1111-1111-1111-111111111101',
    '11111111-1111-1111-1111-111111111102',
    '11111111-1111-1111-1111-111111111103',
    '11111111-1111-1111-1111-111111111104',
    '11111111-1111-1111-1111-111111111105',
    '11111111-1111-1111-1111-111111111106',
    '11111111-1111-1111-1111-111111111107',
    '11111111-1111-1111-1111-111111111108',
    '11111111-1111-1111-1111-111111111109',
    '11111111-1111-1111-1111-111111111110',
    '11111111-1111-1111-1111-111111111111',
    '11111111-1111-1111-1111-111111111112',
    '11111111-1111-1111-1111-111111111113',
    '11111111-1111-1111-1111-111111111114',
    '11111111-1111-1111-1111-111111111115',
    '11111111-1111-1111-1111-111111111116',
    '11111111-1111-1111-1111-111111111117',
    '11111111-1111-1111-1111-111111111118',
    '11111111-1111-1111-1111-111111111119',
    '11111111-1111-1111-1111-111111111120',
    '11111111-1111-1111-1111-111111111121',
    '11111111-1111-1111-1111-111111111122'
);