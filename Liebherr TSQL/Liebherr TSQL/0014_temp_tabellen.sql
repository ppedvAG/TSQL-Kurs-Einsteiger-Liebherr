--temp Tabellen

/*
#tabelle
lokale temp Tabelle
wenn connection weg ist, ist die temp tabelle auch weg
oder gel�scht wird
und existiert nur in der Session in der sie erstellt wurde


##tabelle
globale temp tabelle

gelten auch in anderen Sessions
Lebensdauer: bis der Ersteller sie �scht ider Conn beendet wird



tempor�r: #t sind irgendwann weg


Warum nimmt man die denn her:

Um Ergebnismenge aus gro�en tabellen nicht immer wieder anferdern zu m�ssen
evtl haben wir dann aber auch veraltete Daten (Kopien)

--Zwischenergebnis 






*/

select * into #t1  from customers
select * into ##t1  from customers



drop table #t1

select * from #t1 --tempdb

--erste #t

select top 1 companyname , sum(possumme) as Summe from kundeumsatz
	group by companyname
	order by Summe asc

--2te temp tabelle


--union


select top 1 companyname , sum(possumme) as Summe 
into #xy
from kundeumsatz
	group by companyname
	order by Summe asc


select top 1 companyname , sum(possumme) as Summe 
into #xx
from kundeumsatz
	group by companyname
	order by Summe desc


select * from #xy
UNION ALL
select * from #xx



