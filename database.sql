CREATE TABLE IF NOT EXISTS oxlib_redesign (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    redesign_data TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO oxlib_redesign (player_id, redesign_data) VALUES (1, '{"design": "default"}');