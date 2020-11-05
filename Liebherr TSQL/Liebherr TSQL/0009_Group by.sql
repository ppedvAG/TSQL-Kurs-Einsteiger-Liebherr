--AGGREGATE

--SUM(), AVG(), COUNT(), MIN(), MAX(), 

select Count(Customerid) from customers
select Count(*) from customers

select * from customers

select count(region) from customers --NULL wird nicht mitgezählt  0 ''

select sum(freight) from orders --wird NULL ignorieren


--Prüft mal ob der AVG der Fracht korrekt ist?

--Schnitt der Fracht per AVG.. und errechneter Schnitt

select avg(freight), sum(freight), count(freight), sum(freight)/ count(freight) from orders 




select isnull(Region,0) from customers


--berechnung pro .. group by

select country, count(*) as Anzahl
from customers
group by country --alles aus dem Sleect rein, agg entfernen und Aliase entfernen
order by Anzahl desc


--gebe folgendes aus:

--Customerid, Summe der Frachtkosten pro Kunde in absteigender sortierter Form..aus orders

select customerid, sum(freight) as SummeFracht
from orders
group by customerid
order by Summefracht desc


select country, city , count(*) from customers
group by country, city 
order by country, city


--ich suche aber nicht alle

--Anzahl der Kunden pro Land, Stadt..aber nur bei Ländern, die mit U beginnen
--sortiere nach Anzahl abst


select country, city , count(*) from customers
where country like 'U%'
group by country, city 
order by country, city

--von diesem Ergebnis wollen wir aber nur die haben, die mehr als 1 pro Standt , land haben

--FROM-->JOIN--WHERE--GROUP BY-->HAVING--SELECT-->ORDER BY--AUSGABE

select country, city , count(*) as Anzahl from customers
where	country like 'U%'
group by country, city having count(*) > 1
order by country, city

--daher sollte man imer fogendes beachten
--Wieso sollte man nie in Having etwas filtern was ein where leisten kann
--im Having sollten immer nur AGG zu finden


--Zwischenaggregate

select * from customers

select country, city, count(*) as Anzahl
from customers
group by country, city with cube --jedes mögliche AGG
order by 1,2


select country, city, count(*) as Anzahl
from customers
group by country, city with rollup -- vernünftige Agg.. pro Land und weltweit dazu
order by 1,2


Datawarehouse...Cube--Redundanz  denormalisierung

--Wer ist der beste Kunde
--gemessen an Umsatz: 


--Was wollen wir sehen

--Firma  Umsatz

companyname sum(unitprice*quantity)


--alle Kunden und derer Umsatz

select companyname, sum(unitprice*quantity) 
	

select top 1 companyname, sum(unitprice*quantity) as Umsatz from 
	customers c inner join orders o on o.customerid = c.CustomerID
			    inner join [Order Details] OD on od.OrderID=o.orderid
group by  companyname
order by Umsatz desc


select companyname,o.orderid, sum(unitprice*quantity) as RSumme from 
	customers c inner join orders o on o.customerid = c.CustomerID
			    inner join [Order Details] OD on od.OrderID=o.orderid
group by  companyname, o.orderid 
order by companyname desc



--wer ist der schlechteste verkäufer .. gemessen an Umsatz


select top 1 with ties e.lastname, sum(unitprice*quantity) as Umsatz
	from orders o inner join employees e on e.EmployeeID=o.EmployeeID
				  inner join [Order Details] od on od.OrderID=o.OrderID
group by e.lastname
order by Umsatz asc


select country, city, count(*) as Anzahl
into #result
from customers
group by country, city with rollup -- vernünftige Agg.. pro Land und weltweit dazu
order by 1,2



select * from #result

select * from orders

















--




