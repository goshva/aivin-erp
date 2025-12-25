-- +goose Up
CREATE TABLE analytics_daily (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
    date DATE NOT NULL,
    views INTEGER DEFAULT 0,
    swipes_left INTEGER DEFAULT 0,
    swipes_right INTEGER DEFAULT 0,
    clicks INTEGER DEFAULT 0,
    bookings INTEGER DEFAULT 0,
    revenue DECIMAL(10,2) DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(restaurant_id, date)
);
-- +goose Down
DROP TABLE analytics_daily;
