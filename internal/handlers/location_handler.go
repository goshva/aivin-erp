package handlers

import (
	"database/sql"
	"fmt"
	"net/http"
	"strconv"
	"strings"
	"vend_erp/internal/models"
)

type LocationHandler struct {
    db       *sql.DB
    renderer *TemplateRenderer
}

func NewLocationHandler(db *sql.DB, renderer *TemplateRenderer) *LocationHandler {
    return &LocationHandler{db: db, renderer: renderer}
}

func (h *LocationHandler) ListLocations(w http.ResponseWriter, r *http.Request) {
    fmt.Printf("DEBUG: LocationHandler.ListLocations called\n")
    
    query := `
        SELECT 
            id::text, 
            name, 
            COALESCE(address, '') as address,
            COALESCE(phone, '') as phone,
            COALESCE(email, '') as email,
            COALESCE(website, '') as website,
            status::text, 
            COALESCE(rating, 0) as rating,
            COALESCE(review_count, 0) as review_count,
            COALESCE(price_range, 0) as price_range,
            COALESCE(features::text, '{}') as features,
            created_at, 
            updated_at
        FROM public.restaurants 
        ORDER BY created_at DESC
    `
    
    rows, err := h.db.Query(query)
    if err != nil {
        fmt.Printf("DEBUG: Query error: %v\n", err)
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }
    defer rows.Close()

    var locations []models.Restaurant
    for rows.Next() {
        var location models.Restaurant
        var featuresJSON string
        var createdAt, updatedAt sql.NullTime
        
        err := rows.Scan(
            &location.ID,
            &location.Name,
            &location.Address,
            &location.Phone,
            &location.Email,
            &location.Website,
            &location.Status,
            &location.Rating,
            &location.ReviewCount,
            &location.PriceRange,
            &featuresJSON,
            &createdAt,
            &updatedAt,
        )
        if err != nil {
            fmt.Printf("DEBUG: Scan error: %v\n", err)
            continue
        }
        
        // Handle nullable timestamps
        if createdAt.Valid {
            location.CreatedAt = createdAt.Time
        }
        if updatedAt.Valid {
            location.UpdatedAt = updatedAt.Time
        }
        
        // Parse features JSON
        location.Features = parseJSONToMap(featuresJSON)
        locations = append(locations, location)
    }

    fmt.Printf("DEBUG: Loaded %d restaurants\n", len(locations))

    data := map[string]interface{}{
        "Locations": locations,
        "Active":    "locations",
        "Title":     "Рестораны",
    }
    
    if r.Header.Get("HX-Request") == "true" {
        h.renderer.Render(w, "locations_list.html", data)
        return
    }
    
    h.renderer.Render(w, "locations_page.html", data)
}
// Helper function to parse JSON string to map
func parseJSONToMap(jsonStr string) map[string]bool {
    result := make(map[string]bool)
    
    if jsonStr == "" || jsonStr == "{}" {
        return result
    }
    
    // Simple parsing for {"feature": true} format
    // Remove curly braces
    jsonStr = strings.Trim(jsonStr, "{}")
    if jsonStr == "" {
        return result
    }
    
    pairs := strings.Split(jsonStr, ",")
    for _, pair := range pairs {
        parts := strings.Split(pair, ":")
        if len(parts) == 2 {
            key := strings.Trim(parts[0], "\" ")
            value := strings.TrimSpace(parts[1])
            result[key] = value == "true"
        }
    }
    
    return result
}
func (h *LocationHandler) GetLocationForm(w http.ResponseWriter, r *http.Request) {
    idStr := r.URL.Query().Get("id")
    var location models.Restaurant
    
    if idStr != "" {
        var featuresJSON sql.NullString
        var openingHoursBytes, imagesBytes []byte
        var rating sql.NullFloat64
        var reviewCount sql.NullInt64
        var priceRange sql.NullInt64
        var createdAt, updatedAt sql.NullTime
        var website, instagram, telegram sql.NullString
        
        err := h.db.QueryRow(`
            SELECT id, name, address, phone, email, 
                   website, instagram, telegram, status, 
                   rating, review_count, price_range, 
                   features, opening_hours, images,
                   created_at, updated_at
            FROM restaurants WHERE id = $1
        `, idStr).Scan(
            &location.ID, &location.Name, &location.Address,
            &location.Phone, &location.Email, 
            &website, &instagram, &telegram, &location.Status,
            &rating, &reviewCount, &priceRange,
            &featuresJSON, &openingHoursBytes, &imagesBytes,
            &createdAt, &updatedAt,
        )
        if err != nil && err != sql.ErrNoRows {
            http.Error(w, err.Error(), http.StatusInternalServerError)
            return
        }
        
        // Handle nullable string fields
        if website.Valid {
            location.Website = website.String
        }
        if instagram.Valid {
            location.Instagram = instagram.String
        }
        if telegram.Valid {
            location.Telegram = telegram.String
        }
        
        // Handle nullable numeric fields
        if rating.Valid {
            location.Rating = rating.Float64
        }
        if reviewCount.Valid {
            location.ReviewCount = int(reviewCount.Int64)
        }
        if priceRange.Valid {
            location.PriceRange = int(priceRange.Int64)
        }
        
        // Parse features JSON
        if featuresJSON.Valid && featuresJSON.String != "" && featuresJSON.String != "{}" {
            location.Features = parseJSONToMap(featuresJSON.String)
        } else {
            location.Features = make(map[string]bool)
        }
        
        // Handle timestamps
        if createdAt.Valid {
            location.CreatedAt = createdAt.Time
        }
        if updatedAt.Valid {
            location.UpdatedAt = updatedAt.Time
        }
    }
    
    // Get all restaurant statuses
    statuses := []string{"pending", "verified", "suspended", "rejected"}
    
    data := map[string]interface{}{
        "Location": location,
        "Edit":     idStr != "",
        "Statuses": statuses,
        "PriceRanges": []map[string]interface{}{
            {"value": 1, "label": "₽ (Бюджетный)"},
            {"value": 2, "label": "₽₽ (Средний)"},
            {"value": 3, "label": "₽₽₽ (Дорогой)"},
            {"value": 4, "label": "₽₽₽₽ (Люкс)"},
        },
    }
    h.renderer.Render(w, "location_form.html", data)
}
func (h *LocationHandler) SaveLocation(w http.ResponseWriter, r *http.Request) {
    if err := r.ParseForm(); err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }
    
    idStr := r.FormValue("id")
    rating, _ := strconv.ParseFloat(r.FormValue("rating"), 64)
    reviewCount, _ := strconv.Atoi(r.FormValue("review_count"))
    priceRange, _ := strconv.Atoi(r.FormValue("price_range"))
    
    location := models.Restaurant{
        Name:        r.FormValue("name"),
        Address:     r.FormValue("address"),
        Phone:       r.FormValue("phone"),
        Email:       r.FormValue("email"),
        Website:     r.FormValue("website"),
        Instagram:   r.FormValue("instagram"),
        Telegram:    r.FormValue("telegram"),
        Status:      r.FormValue("status"),
        Rating:      rating,
        ReviewCount: reviewCount,
        PriceRange:  priceRange,
        Description: r.FormValue("description"),
    }
    
    // Parse features from form
    features := make(map[string]bool)
    for _, feature := range []string{"wifi", "parking", "terrace", "delivery", "takeaway"} {
        features[feature] = r.FormValue("feature_"+feature) == "on"
    }
    
    var err error
    if idStr == "" || idStr == "0" {
        _, err = h.db.Exec(`
            INSERT INTO restaurants (
                name, address, phone, email, website,
                instagram, telegram, status, rating, review_count,
                price_range, features, description
            ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
        `, 
            location.Name, location.Address, location.Phone, location.Email, location.Website,
            location.Instagram, location.Telegram, location.Status, location.Rating, location.ReviewCount,
            location.PriceRange, features, location.Description)
    } else {
        location.ID = idStr
        
        _, err = h.db.Exec(`
            UPDATE restaurants 
            SET name=$1, address=$2, phone=$3, email=$4, website=$5,
                instagram=$6, telegram=$7, status=$8, rating=$9, review_count=$10,
                price_range=$11, features=$12, description=$13, updated_at=NOW()
            WHERE id=$14
        `, 
            location.Name, location.Address, location.Phone, location.Email, location.Website,
            location.Instagram, location.Telegram, location.Status, location.Rating, location.ReviewCount,
            location.PriceRange, features, location.Description, location.ID)
    }
    
    if err != nil {
        http.Error(w, "Database error: "+err.Error(), http.StatusInternalServerError)
        return
    }
    
    w.Header().Set("HX-Trigger", "locationSaved")
    h.ListLocations(w, r)
}

func (h *LocationHandler) DeleteLocation(w http.ResponseWriter, r *http.Request) {
    idStr := r.URL.Query().Get("id")
    if idStr == "" {
        http.Error(w, "Invalid ID", http.StatusBadRequest)
        return
    }
    
    _, err := h.db.Exec("DELETE FROM restaurants WHERE id = $1", idStr)
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }
    
    w.Header().Set("HX-Trigger", "locationDeleted")
    w.WriteHeader(http.StatusOK)
    h.ListLocations(w, r)
}

// Helper function to parse features JSON
func parseFeatures(jsonStr string) map[string]bool {
    // Remove curly braces and quotes
    jsonStr = strings.Trim(jsonStr, "{}")
    features := make(map[string]bool)
    
    if jsonStr == "" {
        return features
    }
    
    pairs := strings.Split(jsonStr, ",")
    for _, pair := range pairs {
        parts := strings.Split(pair, ":")
        if len(parts) == 2 {
            key := strings.Trim(parts[0], "\" ")
            value := strings.TrimSpace(parts[1])
            features[key] = value == "true"
        }
    }
    
    return features
}

// Helper function to format features for display
func formatFeatures(features map[string]bool) string {
    if len(features) == 0 {
        return "Нет"
    }
    
    var featureList []string
    for feature, enabled := range features {
        if enabled {
            featureList = append(featureList, feature)
        }
    }
    
    return strings.Join(featureList, ", ")
}