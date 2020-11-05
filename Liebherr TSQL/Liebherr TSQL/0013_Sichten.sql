--Sichten oder Views

/*
gespeicherte Abfragen, die wie einen tabellen funktionieren

basiert immer auf einem SELECT

Sicht enthält keine Daten

--es geht auch : INS UP DEL, aber nur unter Einschränkungen


Wieso eigtl eine Sicht?

Nur die Daten anzeigen, die der User sehen

Komplexe Statement nicht wiederholen müssen ,aber auch nicht zweckentfremden


*/



create view KdCiCy
as
select Country, city from customers



select * from KdCiCy




--Abfrage für

--Customerid, companyname, country, city ..customers
--orderid, freight, orderdate  ...orders
--unitprice, quantity , productid     order details
--products productname
--Lastname, Firstname ... employees


create view KundeUmsatz
as
select 
		 c.customerid, c.companyname, c.city, c.country	--Kundengerümpel
		,o.orderid, o.freight, o.orderdate				--Bestellzeug
		,od.unitprice, od.quantity, od.productid		--Positionen
		,p.productname									--Produktname
		,e.lastname, e.firstname						--Verkäuferinfos
from 
	customers c inner join orders o				on c.CustomerID	=	o.CustomerID
				inner join [Order Details] od	on od.OrderID	=	o.orderid
				inner join Products p			on p.ProductID	=	od.ProductID
				inner join employees e			on e.EmployeeID	=	o.EmployeeID


select * from kundeumsatz


--Sicht ändern
--CREATE .. ALTER ..DROP 
--DROP VIEW KundeUmsatz

ALTER VIEW KundeUmsatz
as
select 
		 c.customerid, c.companyname, c.city, c.country	--Kundengerümpel
		,o.orderid, o.freight, o.orderdate				--Bestellzeug
		,od.unitprice, od.quantity, od.productid		--Positionen
		,p.productname									--Produktname
		,e.lastname, e.firstname						--Verkäuferinfos
		, (od.unitprice * od.quantity) as Possumme
from 
	customers c inner join orders o				on c.CustomerID	=	o.CustomerID
				inner join [Order Details] od	on od.OrderID	=	o.orderid
				inner join Products p			on p.ProductID	=	od.ProductID
				inner join employees e			on e.EmployeeID	=	o.EmployeeID


--Summe der Frachtkosten pro Kunde
--Kunden aus Germany

select companyname, sum(freight) from Customers c
inner join orders o on c.customerid = o.customerid 
where country = 'Germany'
group by companyname


select companyname, sum(freight) from Kundeumsatz 
where country = 'Germany'
group by companyname


select companyname from customers where country = 'Germany'

select distinct companyname from kundeumsatz where country = 'Germany'

drop table slf

create table slf (id int identity, stadt int, land int)

insert into slf
select 3,30


select * from slf

drop view vslf

create view vslf with schemabinding
as
select id, stadt, land from dbo.slf


--Ergebnis: alle Spalten
select * from vslf


alter table slf add fluss int

update slf set fluss = id *100


select * from vslf --gibt nur die Spalten id, stadt und land aus.. merkt sich das Schema beim Erstellen


alter table slf drop column land

select * from vslf --flsches Ergebnis.. es erscheint Land mit den Werten von Fluss


---das darf nicht sein!!!!


create view vName with schemabinding --zwingt zur pedantischen Schreibweise

--zwingt einen den * zu vermeiden
--und exakte Angabe zu Tabellen inkl schema   dbo...


--Was ist schneller : die Sicht oder das entspr Adhoc statement
--egal







--wie Unterabfrage

select * from (select * from customers) c










