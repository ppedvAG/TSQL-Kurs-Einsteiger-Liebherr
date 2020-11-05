--Tabellen
--Beziehungen

--PK --> FK


--Spalten

--Normalisierung (Ziel: redundanz vermeiden)
--NF1 NF2 NF3 BC NF4 NF5
--

--Redundanz (ist schnell)


--Generalisierung

/*

Normalisierung: Vermeide Redundanz.


1 NF bis 3NF--> Stammdaten und Bewegungsdaten unterteilen, 

--vermeide mehrere Werte in einer Zelle
--Setze Primärschlüssel
--Vergebe den passenden Datentyp: dateteim wenn du ms brauchst, date wenn du nur Datum brauchst
--n(varchar), n(char) wenn du unicode brauchst
--varchar wenn die Werte flexibel lang sind char bei fixen Längen

--int (2,1 Mrd) , smallint (ca 32000), tinyint (255)
--money ( Nachkommastellen)
--

Vermeide Sonderzeichen, mathematische Operatoren und Leerzeichen in Tab-, DB Namen

--Tipp: Datetime
select * from orders where orderdate between '1.1.1997' and '31.12.1997 23:59:59.997' order by 4 desc

select * from orders where year(Datum) = 1998


--datetime hat eine Ungenauigkeit von ca 2 bis 3 ms

--muss GebTag ein Datetime sein????

--Merke... das Volumen auf der HDD wird 1:1 in RAM geladen...