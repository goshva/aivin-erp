-- +goose Up
-- Создаём таблицу ресторанов с PostGIS
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE TABLE restaurants (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    address TEXT,
    coordinates geography(Point, 4326), -- PostGIS тип для гео-точек
    phone VARCHAR(20),
    email VARCHAR(255),
    website TEXT,
    instagram TEXT,
    telegram TEXT,
    status restaurant_status DEFAULT 'pending',
    rating DECIMAL(3,2) DEFAULT 0.00,
    review_count INTEGER DEFAULT 0,
    price_range INTEGER CHECK (price_range BETWEEN 1 AND 4),
    features JSONB DEFAULT '{}',
    opening_hours JSONB DEFAULT '{}',
    images JSONB DEFAULT '[]',
    owner_id UUID REFERENCES users(id),
    verified_at TIMESTAMPTZ,
    verified_by UUID REFERENCES users(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Индекс для быстрого поиска по координатам
CREATE INDEX idx_restaurants_location ON restaurants USING GIST(coordinates);

-- +goose Down
DROP TABLE restaurants;
