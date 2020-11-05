--Unterabfragen



select sp, sp2 from tabelle
	where sp > wert
	order by


select * from Tabelle, Sicht, Unterabfrage


select * from 
				(select * from customers where country = 'Germany') c
																		inner join orders o on c.CustomerID=o.customerid
	where c.City='Burghausen'


--auch als Zelle
select orderid, (select max(freight) from orders) from orders


--auch im where möglich
select * from customers
	where 
		country = (select country from customers)-- where customerid = 'ALFKI') --Error


--falls mehr zurückkommen
select * from customers
	where 
		country IN (select country from customers)-- where customerid = 'ALFKI') --Error



--Wir brauchen eine Liste der Bestellungen
--BestellID, freight, abw vom schnitt der Frachtkosten
---sortieren nach Abweichung.. höchste Abweichung oben...
--

select orderid, freight, freight - (select avg(freight)   from orders) from orders
order by 3 desc


--Alternativen: Variablen


--wir brauchen alle Bestellungen, deren Frachtkosten über dem Schnitt liegen

select orderid, freight from orders
	where freight > (select avg(freight) from orders) --242


	--F().. seit SQL 2019 werden in UNterabfragen umgebaut








