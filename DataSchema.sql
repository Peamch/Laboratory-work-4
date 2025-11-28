CREATE TABLE app_user (
    id INT PRIMARY KEY,
    uname VARCHAR(50) NOT NULL CHECK (name ~ '^[A-ZА-ЯЇІЄҐ][a-zа-яїієґ]{1,49}$')
);

CREATE TABLE danger (
    id INT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    detected_at TIMESTAMP NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES app_user (id)
);

CREATE TABLE temperature (
    id INT PRIMARY KEY,
    current_temp FLOAT CHECK (value >= -50 AND value <= 60),
    unit VARCHAR(5) NOT NULL CHECK (unit ~ '^[°C]$'),
    time_stamp TIMESTAMP NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES app_user (id)
);

CREATE TABLE notification (
    id INT PRIMARY KEY,
    message VARCHAR(255) NOT NULL CHECK (message ~ '^[A-ZА-ЯЇІЄҐ].{4,}$'),
    time_sent TIMESTAMP NOT NULL,
    notification_type VARCHAR(20) CHECK (type IN ('danger', 'info', 'other')),
    user_id INT,
    danger_id INT,
    FOREIGN KEY (user_id) REFERENCES app_user (id),
    FOREIGN KEY (danger_id) REFERENCES danger (id)
);
