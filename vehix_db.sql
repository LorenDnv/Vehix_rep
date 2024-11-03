--
-- Fichier généré par SQLiteStudio v3.4.4 sur dim. nov. 3 19:00:01 2024
--
-- Encodage texte utilisé : System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tableau : Payments
CREATE TABLE IF NOT EXISTS Payments (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    reservation_id INTEGER,
    amount REAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status TEXT DEFAULT 'completed',
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
);

-- Tableau : Reservations
CREATE TABLE IF NOT EXISTS Reservations (
    reservation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    vehicle_id INTEGER,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status TEXT DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- Tableau : Users
CREATE TABLE IF NOT EXISTS Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    user_type TEXT CHECK (user_type IN ('client', 'admin'))
);

-- Tableau : Vehicles
CREATE TABLE IF NOT EXISTS Vehicles (
    vehicle_id INTEGER PRIMARY KEY AUTOINCREMENT,
    model TEXT NOT NULL,
    brand TEXT NOT NULL,
    year INTEGER,
    daily_rate REAL NOT NULL,
    status TEXT DEFAULT 'available',
    description TEXT,
    image_url TEXT
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
