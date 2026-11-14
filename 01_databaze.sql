CREATE DATABASE IF NOT EXISTS dat20_sbirka;

USE dat20_sbirka;

CREATE TABLE IF NOT EXISTS vyrobci (
    id_vyrobce INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS kategorie (
    id_kategorie INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS stavebnice (
    id_stavebnice INT AUTO_INCREMENT PRIMARY KEY,
    nazev VARCHAR(150) NOT NULL,
    cislo_setu VARCHAR(20) NOT NULL UNIQUE,
    rok_vydani INT,
    id_vyrobce INT NOT NULL,
    id_kategorie INT NOT NULL,

    FOREIGN KEY (id_vyrobce)
        REFERENCES vyrobci(id_vyrobce),

    FOREIGN KEY (id_kategorie)
        REFERENCES kategorie(id_kategorie)
);

CREATE TABLE IF NOT EXISTS nakupy (
    id_nakupu INT AUTO_INCREMENT PRIMARY KEY,
    id_stavebnice INT NOT NULL,
    datum_nakupu DATE NOT NULL,
    cena DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_stavebnice)
        REFERENCES stavebnice(id_stavebnice)
);

