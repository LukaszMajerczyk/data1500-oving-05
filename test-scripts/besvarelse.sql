Oppgave 1 del 2

1.

SELECT * FROM kunde
ORDER BY kunde ASC LIMIT 20;

2.

SELECT Fornavn, Etternavn FROM ansatt LIMIT 10;


3.

SELECT DISTINCT stilling FROM ansatt;


4.

SELECT vnr, betegnelse, pris FROM vare;

5.

SELECT navn as Kategorinavn, katnr AS kategoriID FROM kategori;

6.

SELECT COUNT(*) FROM kunde CROSS JOIN ordre;


Oppgave 2 del 2

1

SELECT * FROM vare WHERE pris > 200;

2

SELECT * FROM ansatt WHERE stilling = 'Lagermedarbeider' OR stilling = 'Innkjøper';


3


SELECT * FROM kunde WHERE postnr IN ('3199' , '1711') AND fornavn LIKE 'A%';


4


SELECT * FROM kategori k JOIN vare v ON k.katnr = v.katnr WHERE v.katnr <> 1 AND antall > 200;


5




6


SELECT * FROM ansatt WHERE etternavn ILIKE '%sen%'






Oppgave 3 del 2

1

SELECT postnr, COUNT(*) AS antall_kunder FROM kunde GROUP BY postnr;


2


SELECT katnr, AVG(pris) as gjennomsnitt_pris FROM vare GROUP BY katnr;


3

SELECT * FROM vare v1 WHERE pris = (SELECT MAX(pris) FROM vare v2 WHERE v2.katnr = v1.katnr);



4



Oppgave 4 Del 2


1

SELECT K.Fornavn, K.Etternavn, P.Poststed FROM Kunde K    JOIN Poststed P ON K.PostNr = P.PostNr LIMIT 20;

2

SELECT V.Betegnelse, K.Navn FROM Vare V JOIN Kategori K  ON V.KatNr = K.KatNr LIMIT 20;

3

SELECT K.fornavn, K.etternavn, O.ordredato FROM ordre O JOIN kunde K ON O.knr = K.knr LIMIT 20;

4

SELECT V.betegnelse FROM vare V WHERE V.vnr NOT IN (SELECT vnr FROM ordrelinje);

5

SELECT VNr, SUM(antall) AS totalt_solgt FROM Ordrelinje GROUP BY VNr;

6

SELECT A.fornavn, A.etternavn FROM Ansatt A JOIN Poststed P ON A.postNr = P.postnr WHERE P.poststed = 'BØ'