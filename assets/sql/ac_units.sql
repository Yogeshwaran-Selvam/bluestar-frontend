CREATE TABLE ac_units (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nickname TEXT,
  temperature REAL,
  mode TEXT,
  fan_speed TEXT,
  power_on INTEGER,
  alexa_enabled INTEGER,
  google_enabled INTEGER,
  geofencing_enabled INTEGER,
  schedule TEXT,
  service_alert TEXT,
  last_service TIMESTAMP,
  ar_troubleshoot INTEGER
);
