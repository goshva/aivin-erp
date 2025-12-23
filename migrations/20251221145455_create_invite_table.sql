-- +goose Up
CREATE TABLE invites (id UUID PRIMARY KEY, created_at TIMESTAMP NOT NULL, updated_at TIMESTAMP NOT NULL, deleted_at TIMESTAMP, email TEXT NOT NULL, code TEXT NOT NULL);

-- +goose Down
DROP TABLE invites;
