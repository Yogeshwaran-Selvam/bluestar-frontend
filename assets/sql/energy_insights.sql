CREATE TABLE energy_insights (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ac_id INTEGER,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  energy_kwh REAL,
  cost_usd REAL,
  co2_kg REAL,
  energy_status TEXT,
  co2_status TEXT,
  FOREIGN KEY(ac_id) REFERENCES ac_units(id) ON DELETE CASCADE
);