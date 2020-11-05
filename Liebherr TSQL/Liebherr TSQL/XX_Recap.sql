/*
Select 
		TOP 10|Percent with ties
		distinct
		Sp1, Sp2, Mathe as Alias, 'TXT',
		SUM(), MIN(),MAX(),COUNT(), AVG()
		F(wert|Spalte)
		(select ...) as Alias --Unterabfragen
from
		TABA A inner|left|right join TABB on A.spx=B.spx
			   inner|left|right join TABC on C.spx=B.spx
			   inner|left|right join VIEW1 v  on v1.spy=B.spy
			   inner|left|right join (select ...) ua  on ua.spX=v.spx
			   ...
WHERE 
		sp > < >= <= between in like = != <>
		LIKE Wildcards: % , _ , [Wertebreich].. genau ein Zeichen
				% Suche [%]
				' Suche ''
		AND OR AND AND OR  .. das AND wird immer zuerst verknüpft (Mach Klammern)
GROUP BY (alles aus dem Select nur keine AGG und kein Alias) HAVING AGG > < ...
UNION | UNION ALL ..filtert nicht doppelte Ergebniszeilen
	select ...
INTERSECT
	select ... Ausgabe der gemeinsamen Datenzeilen
EXCEPT
	select... Ausgabe der unterschiedlichen Zeilen


ORDER BY Sp asc , SP2 desc, 3,5 desc			   

*/



SELECT 
VIEW enthält keine Daten
#t

--Erstellen der #t
select * into #t from orders

--Daten hinzufügen

insert into #t
select * from orders

Unterabfragen




select *from orders

select * from [Order Details]

--Rsummen pro Ang

--Ang Davolio
-----
--Um wieviel Euro weicht der höchste Rechnungsbetrag von Davolio vom durchschn. Rechnugsbetrag aller ab
--top .. join AGG group by where 



--Zuerst Rechnungssummen

select avg(RSummen)
from 
(
select  orderid, sum(possumme) as Rsummen from kundeumsatz
group by orderid) t

--1631,8778

--MAX RSUMME des Davolio

select max(Rsummen) from 
(
select  orderid, sum(possumme) as Rsummen from kundeumsatz
where lastname = 'Davolio'
group by orderid
) t

--15810.00





select (
 -- höchster Umsatz Davilio
 select o.orderid, o.employeeid, unitprice, quantity,unitprice* quantity -- *  --top 1 od.Quantity*od.UnitPrice as Umsatz from Orders o inner join Employees e on e.EmployeeID = o.EmployeeID
 inner join [Order Details] od on od.OrderID = o.OrderID
 where e.LastName = 'davolio'
 order by 5 desc
 ) - (
 -- Durschnittlicher Umsatz
 select avg(od.Quantity*od.UnitPrice)
 from Orders o
 inner join [Order Details] od on od.OrderID = o.OrderID
 )







select ( -- höchster Umsatz Davilio
  select orderid,sum(od.Quantity*od.UnitPrice) as Rsumme
 from Orders o
 inner join Employees e on e.EmployeeID = o.EmployeeID
 inner join [Order Details] od on od.OrderID = o.OrderID
 where e.LastName = 'davolio'
 order by Umsatz desc
 ) - (
 -- Durschnittlicher Umsatz
 select avg(od.Quantity*od.UnitPrice)
 from Orders o
 inner join [Order Details] od on od.OrderID = o.OrderID
 ) --1631,8778

--MAX RSUMME des DavolioVAR =  select 
	(
	select avg(RSummen)
	from 
	(
	select  orderid, sum(possumme) as Rsummen from kundeumsatz
	group by orderid) t
	)
-

(
select max(Rsummen) from 
(
select  orderid, sum(possumme) as Rsummen from kundeumsatz
where lastname = 'Davolio'
group by orderid
) t1)





