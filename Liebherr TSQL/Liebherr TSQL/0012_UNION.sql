--UNION

--Wir kopieren alle aus der EU in eine andere Tabelle
select * into KUNDENEU from customers
	where country in ('Italy', 'UK', 'Germany', 'France')



select customerid from customers
UNION
select customerid from kundeneu

--Vorsicht: hier gibts Regeln. gleich viele Spalten, ansatzweise gleicher Datentyp

select orderid from orders
union
select customerid from customers



select 'A' --wird der Tabellenkopf festgelegt
UNION
select 'B' as SP--wird nicht beachtet

--Tabelle 


--UNION macht automatisch einen distinct
select 'A'
UNION
select 'A'



select 'A'
UNION ALL --filtert keine doppelten Zeilen
select 'A'



--Liste alle ASP: kunden und Ang

--Liste mit Firma bzw Lastname, Land, Stadt, merkmal K oder A

--bis hierhin.. ;-)
select companyname, country, city, 'K' as Typ   from customers
UNION ALL
select Lastname , country, city, 'A' from employees
order by 4



select 100
UNION
select 200
UNION 
select 300






--aus SQL Sicht ist das ein SELECT 
select companyname, country, city,region, 'K' as Typ   from customers
UNION ALL
select Lastname , country, city,NULL, 'A' from employees




---Wer ist der beste Kunde und der schlechteste Kunde gemessen an umsatz

--gerne Sicht verwenden dazu , um die Joins zu sparen...



select top 1 companyname , sum(possumme) as Summe from kundeumsatz
group by companyname
order by Summe desc
UNION
select top 1 companyname , sum(possumme) as Summe from kundeumsatz
group by companyname
order by Summe asc

--Error wg order by 


select * from (select ) t

select * from 
	(
	select top 1 companyname , sum(possumme) as Summe from kundeumsatz
	group by companyname
	order by Summe desc
	) t1
UNION
select * from 
	(
	select top 1 companyname , sum(possumme) as Summe from kundeumsatz
	group by companyname
	order by Summe asc
	) t2




--



select * from KUNDENEU


select * from customers


--neuer DS in KundenEU
insert into Kundeneu (customerid, CompanyName, country, city) values ('LHERR', 'Liebherr', 'Germany','Biberach')

--geänderter Datensatz in Customers
update customers set city = 'Burghausen' where customerid = 'ALFKI'


--Welche DS sind in bdeien gleich
--welche sind unterschiedlich

--aber wie?

--HASH Idee aber sehr komplex
--INNER JOIN

select top 1 * from customers
select top 1 * from kundenEU


select * from customers
intersect
select * from kundeneu

--Ergebnismenge zählt
select customerid, city from customers
intersect
select customerid, city from kundeneu

select customerid, city from KundenEU
intersect
select customerid, city from Customers


--Unterschiede

select * from customers
Except
select * from kundenEU



--Reihenfole wichtig
select * from KundenEU
Except
select * from customers
















































