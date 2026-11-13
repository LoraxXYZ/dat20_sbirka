USE dat20_sbirka;

-- Dotaz 1: INNER JOIN
-- Vypis stavebnic a jejich vyrobcu

SELECT
    s.nazev AS stavebnice,
    s.cislo_setu,
    s.rok_vydani,
    v.nazev AS vyrobce
FROM stavebnice s
INNER JOIN vyrobci v
    ON s.id_vyrobce = v.id_vyrobce;

    -- Dotaz 2: LEFT JOIN
-- Vypis vsech kategorii a jejich stavebnic

SELECT
    k.nazev AS kategorie,
    s.nazev AS stavebnice,
    s.cislo_setu
FROM kategorie k
LEFT JOIN stavebnice s
    ON k.id_kategorie = s.id_kategorie
ORDER BY k.nazev, s.nazev;

-- Dotaz 3: GROUP BY + COUNT
-- Pocet stavebnic podle vyrobcu

SELECT
    v.nazev AS vyrobce,
    COUNT(s.id_stavebnice) AS pocet_stavebnic
FROM vyrobci v
INNER JOIN stavebnice s
    ON v.id_vyrobce = s.id_vyrobce
GROUP BY v.id_vyrobce, v.nazev
ORDER BY pocet_stavebnic DESC;

-- Dotaz 4: SUM
-- Celkova hodnota vsech nakupu

SELECT
    SUM(cena) AS celkova_hodnota_nakupu
FROM nakupy;


-- Dotaz 5: AVG
-- Prumerna cena nakupu stavebnic

SELECT
    ROUND(AVG(cena), 2) AS prumerna_cena_nakupu
FROM nakupy;

-- Dotaz 6: GROUP BY + HAVING
-- Kategorie s vice nez 2 stavebnicemi

SELECT
    k.nazev AS kategorie,
    COUNT(s.id_stavebnice) AS pocet_stavebnic
FROM kategorie k
INNER JOIN stavebnice s
    ON k.id_kategorie = s.id_kategorie
GROUP BY k.id_kategorie, k.nazev
HAVING COUNT(s.id_stavebnice) > 2
ORDER BY pocet_stavebnic DESC;

-- Dotaz 7: JOIN + GROUP BY
-- Pocet nakupu a celkova utrata podle vyrobcu

SELECT
    v.nazev AS vyrobce,
    COUNT(n.id_nakupu) AS pocet_nakupu,
    SUM(n.cena) AS celkova_utrata
FROM nakupy n
INNER JOIN stavebnice s
    ON n.id_stavebnice = s.id_stavebnice
INNER JOIN vyrobci v
    ON s.id_vyrobce = v.id_vyrobce
GROUP BY v.id_vyrobce, v.nazev
ORDER BY celkova_utrata DESC;


-- Dotaz 8: PODDOTAZ
-- Nakoupene stavebnice s cenou nad prumerem

SELECT
    s.nazev AS stavebnice,
    s.cislo_setu,
    n.cena AS cena_nakupu
FROM nakupy n
INNER JOIN stavebnice s
    ON n.id_stavebnice = s.id_stavebnice
WHERE n.cena > (
    SELECT AVG(cena)
    FROM nakupy
)
ORDER BY n.cena DESC;