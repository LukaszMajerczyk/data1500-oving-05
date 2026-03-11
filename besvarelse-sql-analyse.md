# Besvarelse: SQL-Analyse

## Oppgave 1: Grunnleggende Spørringer
1.  `SELECT * FROM Vare;`
2.  `SELECT VNr, Betegnelse FROM Vare;`
3.  `SELECT DISTINCT KatNr FROM Vare;`
4.  `SELECT Fornavn, Etternavn, Stilling AS Jobbtittel FROM Ansatt;`

1.  **Forklaring:** ... Velg alt fra Vare

2.  **Forklaring:** ... velg VNr og Betegnelse fra Vare

3.  **Forklaring:** ... Velg alle unike KatNr fra Vare. DISTINCT fjerner alle duplikater.

4.  **Forklaring:** ... Velg Fornavn, Etternavn og Stilling som Jobbtittel fra Ansatt. 

## Oppgave 2: WHERE-klausulen
1.  `SELECT * FROM Vare WHERE Pris > 500;`
2.  `SELECT * FROM Ansatt WHERE Stilling = 'Salgssjef' AND Årslønn > 600000;`
3.  `SELECT Fornavn, Etternavn FROM Kunde WHERE PostNr = '0001' OR PostNr = '0002';`
4.  `SELECT Betegnelse FROM Vare WHERE NOT KatNr = 1;`

1.  **Forklaring:** ... Velg alt fra Vare som har et pris over 500

2.  **Forklaring:** ... Velg alle fra Ansatte som er salgssjefer og har en årslønn over 600000 

3.  **Forklaring:** ... Velg Fornavn og Etternavn fra Kunder som har PostNr = 0001 eller 0002

4.  **Forklaring:** ... Velg Betegnelse Fra Vare Hvor KatNr er ikke 1

## Oppgave 3: Gruppering og Sortering
1.  `SELECT * FROM Vare ORDER BY Pris DESC;`
2.  `SELECT KatNr, COUNT(*) FROM Vare GROUP BY KatNr;`
3.  `SELECT Stilling, AVG(Årslønn) FROM Ansatt GROUP BY Stilling;`
4.  `SELECT KatNr, SUM(Antall) FROM Vare GROUP BY KatNr HAVING SUM(Antall) > 500;`

1.  **Forklaring:** ... Velg alt fra Vare og sorter fra dyreste til billigste.

2.  **Forklaring:** ... Velg KatNr, tell alle fra Vare grupper etter KatNr

3.  **Forklaring:** ... Velg Stilling gjennomsnittlig Årslønn som ansatte tjener. grupper etter stilling.

4.  **Forklaring:** ... Velg KatNr, sum av Antall fra Vare grupper etter KatNr som har sum over 500

## Oppgave 4: Spørringer mot Flere Tabeller
1.  `SELECT V.Betegnelse, K.Navn FROM Vare V JOIN Kategori K ON V.KatNr = K.KatNr;`
2.  `SELECT O.OrdreNr, K.Fornavn, K.Etternavn FROM Ordre O LEFT JOIN Kunde K ON O.KNr = K.KNr;`
3.  `SELECT A1.Fornavn, A2.Fornavn FROM Ansatt A1, Ansatt A2 WHERE A1.PostNr = A2.PostNr AND A1.AnsNr < A2.AnsNr;`
4.  `SELECT V.Betegnelse FROM Vare V WHERE V.VNr NOT IN (SELECT VNr FROM Ordrelinje);`

1.  **Forklaring:** ...   
Velg betegnelse fra tabellen vare. Velg navn fra kategori. Koble tabellen kategori med vare. kobler rader der KatNr i Vare = KatNr i Kategori


**Forklaring:** ...


SELECT O.OrdreNr, K.Fornavn, K.Etternavn.  =   Vis  ordreNr fra ordre tabellen, fornavn og etternavn fra kunde tabellen.
FROM Ordre O. = gjør O til alias for Ordre.
LEFT JOIN kunde k = beholder alle rader fra tabellen til Ordre. k = alias for Kunde
O.KNr = K.KNr.  = KNr i ordre må være lik KNr i kunde.


3.  **Forklaring:** ...

A1 = kopi 1 av ansatt.
A2 = kopi 2 av ansatt.
A1.PostNr = A2 PostNr. Velger bare ansatte som har samme postnummer.
A1.AnsNr < A2.AnsNr Gjør at samme ansatt kan ikke bli sammen lignet med seg selv. og gjør at vi får ikke duplikater.

Vis fornavn fra ansatt A1, Og fornavn fra tabellen A2 Hvor PostNr til A1 er lik PostNr til A2 og ansatt nummer til A2 er større enn ansatt nummer til A1.





4.  **Forklaring:** ...

SELECT V.Betegnelse FROM Vare V WHERE V.VNr NOT IN (SELECT VNr FROM Ordrelinje);`

V = alias til Vare

Vis Betegnelse fra Vare.
Hent alle varenummer som finnes i tabellen Ordrelinje. Hvor VNr. som ikke finnes i listen fra Ordrelinje.


Finner alle varer som ble aldri bestilt.


## Oppgave 5: NULL-verdier og Aggregeringsfunksjoner

Forklar hva følgende SQL-spørringer gjør, og hvorfor resultatene blir som de blir. Vær spesielt oppmerksom på hvordan `NULL` påvirker resultatet.

1.  **Spørring:**
    ```sql
    SELECT COUNT(*), COUNT(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

2.  **Spørring:**
    ```sql
    SELECT AVG(Bonus) FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

3.  **Spørring:**
    ```sql
    SELECT Fornavn, Etternavn, COALESCE(Bonus, 0) AS JustertBonus FROM Ansatt;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

4.  **Spørring:**
    ```sql
    SELECT Stilling, SUM(Årslønn + Bonus) FROM Ansatt GROUP BY Stilling;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

## Oppgave 6: Tre-verdi Logikk (TRUE, FALSE, UNKNOWN)

SQLs logikk er ikke bare `TRUE` eller `FALSE`. Når `NULL` er involvert, får vi en tredje tilstand: `UNKNOWN`. Denne oppgaven utforsker hvordan dette påvirker `WHERE`-klausuler.

### Del 1: Forklar SQL-spørringene

Forklar resultatet av følgende SQL-spørringer. Hvorfor returnerer de det de gjør?

1.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

2.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = FALSE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

3.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt = TRUE OR ErBetalt = FALSE;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*

4.  **Spørring:**
    ```sql
    SELECT COUNT(*) FROM Ordre WHERE ErBetalt IS UNKNOWN;
    ```
    **Forklaring:**
    *   *... Skriv din forklaring her ...*
