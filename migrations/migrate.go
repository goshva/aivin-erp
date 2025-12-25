package migrations

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"os/exec"
)

// RunMigrations - maintains your original interface (db *sql.DB, migrationsPath string)
func RunMigrations(db *sql.DB, migrationsPath string) error {
	// Build database URL from the existing connection (if possible)
	// Since we can't extract URL from *sql.DB, we'll need a different approach
	// We'll use environment variable or require URL to be passed separately
	
	// Option 1: Use environment variable
	dbURL := os.Getenv("DATABASE_URL")
	if dbURL == "" {
		// Option 2: Construct from typical PostgreSQL defaults
		// You might want to modify this based on your config
		dbURL = "postgresql://postgres:postgres@localhost:5432/aivin?sslmode=disable"
	}
	
	log.Printf("Running migrations using Goose...")
	
	// Validate migrations directory
	if _, err := os.Stat(migrationsPath); os.IsNotExist(err) {
		return fmt.Errorf("migrations directory does not exist: %s", migrationsPath)
	}

	// Build and execute goose command
	cmd := exec.Command("goose",
		"-dir", migrationsPath,
		"postgres",
		dbURL,
		"up")
	
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	
	log.Printf("Executing: goose -dir %s postgres %s up", migrationsPath, "*****") // Masked URL for security
	
	if err := cmd.Run(); err != nil {
		return fmt.Errorf("goose migration failed: %v", err)
	}
	
	log.Printf("Migrations completed successfully")
	return nil
}

// Helper function to check if migrations should run
func shouldRunMigrations(db *sql.DB) (bool, error) {
	// Check if goose_db_version table exists
	var exists bool
	err := db.QueryRow(`
		SELECT EXISTS (
			SELECT FROM information_schema.tables 
			WHERE table_schema = 'public' 
			AND table_name = 'goose_db_version'
		)
	`).Scan(&exists)
	
	if err != nil {
		return true, nil // Run migrations if we can't check
	}
	
	return exists, nil
}