-- +goose Up
CREATE TABLE restaurant_admins (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    restaurant_id UUID,
    permissions JSONB DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE restaurant_admins
ADD CONSTRAINT fk_restaurant_admins_restaurant
FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE;
-- +goose Down
DROP TABLE restaurant_admins;