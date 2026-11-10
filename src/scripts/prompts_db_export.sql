--
-- Plik wygenerowany przez Letos v4.0.4 dnia Sat Nov 7 22:24:14 2026
--
-- Użyte kodowanie tekstu: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: classes
CREATE TABLE IF NOT EXISTS classes (
    id   INTEGER PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE
);
INSERT INTO classes (id, code) VALUES (1, 't2i');
INSERT INTO classes (id, code) VALUES (2, 'image edit');
INSERT INTO classes (id, code) VALUES (3, 't2va');
INSERT INTO classes (id, code) VALUES (4, 'i2va');
INSERT INTO classes (id, code) VALUES (5, 'FL2VA');
INSERT INTO classes (id, code) VALUES (6, 'L2VA');
INSERT INTO classes (id, code) VALUES (7, 'ref2VA');

-- Tabela: models
CREATE TABLE IF NOT EXISTS models (
    id   INTEGER PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE
);
INSERT INTO models (id, code) VALUES (1, 'not defined');
INSERT INTO models (id, code) VALUES (2, 'ZIT');
INSERT INTO models (id, code) VALUES (3, 'Krea 2');
INSERT INTO models (id, code) VALUES (4, 'FLUX 3 Image');
INSERT INTO models (id, code) VALUES (5, 'Qwen Image 2.1');
INSERT INTO models (id, code) VALUES (6, 'Qwen Image 2512');
INSERT INTO models (id, code) VALUES (7, 'MOSS-Image');
INSERT INTO models (id, code) VALUES (8, 'Fibo 2');
INSERT INTO models (id, code) VALUES (9, 'LTX-2.5');
INSERT INTO models (id, code) VALUES (10, 'Minimax H3');
INSERT INTO models (id, code) VALUES (11, 'Pika H3');
INSERT INTO models (id, code) VALUES (12, 'Fast H3');

-- Tabela: prompts
CREATE TABLE IF NOT EXISTS prompts (
    id         INTEGER PRIMARY KEY,
    body       VARCHAR(1024) NOT NULL,
    class      VARCHAR(20),
    model      VARCHAR(30),
    created_at DATETIME,
    FOREIGN KEY (class) REFERENCES classes(code),
    FOREIGN KEY (model) REFERENCES models(code)
);
INSERT INTO prompts (id, body, class, model, created_at) VALUES (1, 'Home by the sea', 't2i', 'ZIT', '2026-11-07 09:00:00');
INSERT INTO prompts (id, body, class, model, created_at) VALUES (2, 'Beautiful woman walking down the street', 't2va', 'Minimax H3', '2026-11-07 14:00:00');
INSERT INTO prompts (id, body, class, model, created_at) VALUES (3, 'female face close-up', 't2i', 'Krea 2', '2026-11-07 09:00:00');
INSERT INTO prompts (id, body, class, model, created_at) VALUES (4, 'Beautiful young woman walking in the garden', 't2i', 'Krea 2', '2026-11-07 09:00:00');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
