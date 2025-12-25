package models

import (
    "time"
)

type Restaurant struct {
    ID           string            `json:"id"`
    Name         string            `json:"name"`
    Description  string            `json:"description,omitempty"`
    Address      string            `json:"address"`
    Phone        string            `json:"phone,omitempty"`
    Email        string            `json:"email,omitempty"`
    Website      string            `json:"website,omitempty"`
    Instagram    string            `json:"instagram,omitempty"`
    Telegram     string            `json:"telegram,omitempty"`
    Status       string            `json:"status"`
    Rating       float64           `json:"rating"`
    ReviewCount  int               `json:"review_count"`
    PriceRange   int               `json:"price_range"`
    Features     map[string]bool   `json:"features"`
    CreatedAt    time.Time         `json:"created_at"`
    UpdatedAt    time.Time         `json:"updated_at"`
}