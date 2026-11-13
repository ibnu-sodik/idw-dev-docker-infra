-- liquibase formatted sql

-- changeset developer:1
CREATE TABLE IF NOT EXISTS demo_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- rollback DROP TABLE IF EXISTS demo_users;
