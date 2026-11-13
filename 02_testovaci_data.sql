USE dat20_sbirka;

-- Vlozeni vyrobcu
INSERT INTO vyrobci (nazev)
VALUES
('LEGO'),
('COBI');

-- Vlozeni kategorii
INSERT INTO kategorie (nazev)
VALUES
('Star Wars'),
('WWII'),
('WWI'),
('Vietnam War'),
('Armed Forces'),
('Speed Champions');

-- Vlozeni stavebnic
INSERT INTO stavebnice
(nazev, cislo_setu, rok_vydani, id_vyrobce, id_kategorie)
VALUES
('AT-TE Walker', '75337', 2022, 1, 1),
('Republic Fighter Tank', '75342', 2022, 1, 1),
('Audi Sport Quattro S1', '76897', 2020, 1, 6),
('Panzer IV', '2592', 2024, 2, 2),
('F-14 Tomcat', '5811', 2023, 2, 5),
('Bell UH-1 Huey', '2423', 2022, 2, 4),
('MARK I (Male) C.19.', '2993', 2023, 2, 4),
('Bugatti vision Gran Turismo', '77253', 2026, 1, 6),
('M4A3E8 Sherman Easy Eight', '2533', 2020, 2, 2),
('T-72 (East German/Soviet)', '2625', 2023, 2, 5),
('Coruscant Guard Gunship', '75354', 2023, 1, 1),
('ARC-170 Starfighter', '75402', 2025, 1, 1),
('Panzerkampfwagen VI Tiger 131', '2556', 2021, 2, 2),
('Sopwith Camel F.1.', '2987', 2022, 2, 3),
('Ferrari 499P', '77261', 2026, 1, 6),
('Dodge Challenger SRT Hellcat', '77237', 2025, 1, 6),
('Supermarine Spitfire Mk. IXe', '5764', 2026, 2, 2),
('The Razor Crest', '75292', 2020, 1, 1),
('M41A3 Walker Bulldog', '2239', 2021, 2, 4),
('SU-57 Felon', '5909', 2025, 2, 5);

INSERT INTO nakupy
(id_stavebnice, datum_nakupu, cena)
VALUES
((SELECT id_stavebnice FROM stavebnice
  WHERE cislo_setu = '75337'), '2026-01-15', 2499.00),

((SELECT id_stavebnice FROM stavebnice
  WHERE cislo_setu = '2592'), '2026-02-10', 699.00),

((SELECT id_stavebnice FROM stavebnice
  WHERE cislo_setu = '76897'), '2026-03-05', 789.00),

((SELECT id_stavebnice FROM stavebnice
  WHERE cislo_setu = '5811'), '2026-04-20', 1599.00),

((SELECT id_stavebnice FROM stavebnice
  WHERE cislo_setu = '77261'), '2026-05-12', 649.00);
