--Simple Abfrage


use northwind;

select Spalten, Spalten , Spalten from tabelle

select customerid, companyname from customers 

-- * Wildcard alle Spalten

select * from customers --besser Spalten angeben
 --

 select *, customerid from customers

 select customerid, * from customers



 select left(contactname,2) from customers



 select freight, freight*1.16 from orders

 select * from employees

 --- "Davolio, Nancy"


 select Lastname, Firstname, Lastname + ', ' +  Firstname from employees



 select * from orders



 --Sind Lieferung verzögert 
 --Requ = gewünschte Lieferdatum
 --SHip = tats. Lieferdatum

 --Liste aller Bestellung mit orderid, Shippdate, Requireddate und der Verzögerung (in Tagen) --- datediff--  zu spät angekommen als Minus

 select datediff(dd, Getdate(), '1.11.2020') ---    -1
 select datediff(dd, '1.11.2020', Getdate()) ----   +1

 select		orderid
		--	, requireddate
		--	, shippedDate
			, datediff(dd, shippeddate, requireddate) as Verz --zu spät als Minus
from orders
order by Verz asc --desc

--wie kann ich filtern


--13 :10

select Spalten , f(spalte) as Alias, *
from Tabelle
order by Spalte | Alias asc |desc



--eine Liste (orderid, orderdate, Frachtkosten, Brutto und den MwST Anteil) aller Bestellungen inkl Frachtkosten
select * from orders


--10248    2.11.1998   32.38  37.0004   4.95 --16 %

select	orderid
		, freight
		, freight *1.16 as Brutto
		, (freight*1.16 - freight) as MwST 
from orders
order by MwSt desc


--für die Faulen, aber keine gute Idee
select	orderid
		, freight
		, freight *1.16 as Brutto
		, (freight*1.16 - freight) as MwST 
from orders
order by 3 desc

´--mehrere Spalten


select Companyname, Country, city from customers
order by Country asc, city asc


select Companyname, Country, city from customers
order by Country asc, city desc, .... Alias..





















 




