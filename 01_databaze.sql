CREATE DATABASE IF NOT EXISTS dat20_sbirka;

USE dat20_sbirka;

CREATE TABLE vyrobci (
    id_vyrobce INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS kategorie (
    id_kategorie INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS nakupy (
    id_nakupu INT AUTO_INCREMENT PRIMARY KEY,
    id_stavebnice INT NOT NULL,
    datum_nakupu DATE NOT NULL,
    cena DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_stavebnice)
        REFERENCES stavebnice(id_stavebnice)
);
