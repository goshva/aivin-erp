-- +goose Up
CREATE TABLE transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
    campaign_id UUID REFERENCES campaigns(id) ON DELETE SET NULL,
    amount DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2) DEFAULT 0,
    final_amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'RUB',
    status transaction_status DEFAULT 'pending',
    payment_method VARCHAR(50),
    payment_id VARCHAR(255),
    tinkoff_payment_id VARCHAR(255),
    items JSONB DEFAULT '[]',
    metadata JSONB DEFAULT '{}',
    confirmed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_transactions_user ON transactions(user_id);
CREATE INDEX idx_transactions_restaurant ON transactions(restaurant_id);
CREATE INDEX idx_transactions_status ON transactions(status);
-- +goose Down
DROP TABLE transactions;
