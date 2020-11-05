--tabelle anlegen

--create , alter , drop


create table Kunden
			(
			KdNr int identity,
			Famname varchar(50),
			Vorname varchar(50),
			eMail nvarchar(50) not null,
			GebDatum date
			)


--INS: 

--entweder alle Spalten angeben
insert into Kunden (Famname, Vorname, email, gebdatum) values ('Rauch', 'Andreas', 'andreasrqppedv.de', '2.6.2020')


--oder wenn alle übergebven werden.. dann keine Spalte vorgeben
insert into Kunden values ('Maier', 'otto', 'Motto@outlook.de', '10.5.2020')


insert into Kunden values 
		('Maier', 'Bruno', 'Bruno@outlook.de', '10.5.2020'),
		('Schmitt', 'Evi', 'Evi@outlook.de', '5.5.2020'),
		('Huber', 'Sepp', 'Sepp@outlook.de', '8.5.2020')


--zuerst der SELECT Test,, dann einfügen

--Daten von anderen tabellen einfügen


insert into Kunden 
select lastname, firstname, NULL, BirthDate from employees where country = 'UK'


select * from kunden

insert into kunden
select 'Maier', 'Eva', 'eva@outlook.com', '1.5.2019'
UNION ALL
select 'Maier', 'Eva', 'eva@outlook.com', '1.5.2019'
UNION ALL
select 'Maier', 'Eva', 'eva@outlook.com', '1.5.2019'


--Ändern der Daten

update tabelle set Sp = Wert
		where sp = Wert



select * from kunden


update kunden set email = 'steve@gmx.net'
	where kdnr = 6


--Versicherung abschliessen
--aber aufpassen..

begin tran

update kunden set email = 'hansqglück.de'
select * from kunden


commit
rollback


--Ändere die frachtkosten wie folgt

--erhöhe alle Frachtkosten des Kunden BLAUS um 10 %
--und errechne den neuen Schnitt der Frachtkosten aller
--78,2442

--anschliessend rollback


begin tran

update orders set freight = freight *1.1 where customerid = 'BLAUS'
select avg(freight) from orders 

rollback



---Delete 
--auch jier mit tran möglich
select * from kunden


delete from kunden where kdnr = 8


select * from kunden

--Lösche "email" aus der tabelle

update kunden set email = '' where email = 'email'




--Update Teil 2

select * from customers

--Hilfskopie --> Cust

--bei allen Kunden den Firmenanme um ein X ergänzen AlfredsfutterkisteX
--ber nur dei den Kunden, die Frachtkosten haben, die unter dem Schnitt liegen


--1) lege Cust an
--2 ) Abfrage, die die Daten ausgibt, die geändert werden sollten

--1)
select * into cust from customers

update cust set companyname = companyname + 'X' --substring(cname, 1, len(cname)-1)
--select distinct c.customerid 
		from cust c 
		inner join orders o on o.customerid = c.CustomerID
	where freight < (select avg(freight) from orders)



---Hilfstabelle o1
select * into o1 from orders

--Frachtkosten um 10 erhöhen, bei allen Kunden aus Deutschland
--o1 





--zuerst Abfrage
update o1 set freight = freight *1.1
--select o.customerid, c.country, o.freight 
	from 
			o1 o inner join customers c on c.CustomerID=o.CustomerID
	where 
		c.country = 'Germany'


delete

--Lösche alle Kunden aus Cust, die weniger als 10 Frachtkosten hatten

delete from cust
--select distinct c.customerid 
from cust c inner join orders o on c.CustomerID=o.CustomerID
where o.freight < 10



--lösche Tabelle Cust

--lösche Tabelle o1

drop table cust


drop table o1




--Prozeduren: schnell und praktisch
--f()
--Variablen
--CASE
--IF 
--WHILE
--Recap





































--ins update delete