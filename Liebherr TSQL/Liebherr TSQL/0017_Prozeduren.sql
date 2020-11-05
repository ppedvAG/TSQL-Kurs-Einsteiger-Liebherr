/*
Prozeduren

wie Windows Batchdateien..nur für SQL

..enthalten eine oder mehrere Anweisungen
...BI Logik

--schneller im Regelfall schneller
--schneller aber nur , wenn sie gut geschrieben ist

--der Plan der Prozeedure wird errechnet und bleibt..auch nach Neustart

--der Plan sollte immer der richtige


select * from tabelle where sp like % --sehr wenige oder sehr viele



*/

set statistics time on --messen wir mal die Zeiten
--Abfargen müssen anylsiert werden und es uss ein Plan erstellt werden
--
set statistics time off


--Pläne zu errechnen kostet Zeit... Prozeduren helfen hier zu sparen
select top 3 * from customers c inner join orders o on o.CustomerID=c.CustomerID
where c.Country='UK'


create proc gpdemo1 
as
select * from customers
GO

exec gpdemo1


alter proc gpdemo1
as
select * from orders
select * from customers
--INS UP DEL --in Prozeduren ist alles möglich <--> Sicht


exec gpdemo1


--prozeduren sollten allerdings aus Performancegründen so geschrieben sein,
--dass immer rel gleich viel als  Ergebnis herauskommt und 
--sich auch immer auf dieseleben tabellen bezieht

alter proc gpdemo1 @par1 int
as
select * from orders where freight > @par1

--erster Aufruf 500..sehr wenige treffer

exec gpdemo1 1000







--gpKundenSuche

exec gpKundensuche 'ALFKI' --1 Treffer

exec gpKundensuche 'A%' --4 Treffer

exec gpKundensuche '%' --4 Treffer


select * from customers

--Variablen oder Parameter: kann manchmal nützlich sein, sie höhre einzustellen, als de eigtl Wert ist
--betrifft wor allem bei order by und variablen Datentypen

alter proc gpKundenSuche @kdid varchar(15) --ist so in DB  'O%   
--Hintergrund: variablen werden geschätzt varchar wird auf 50%
as
select * from customers where customerid like @KDID


create proc gpSuchefrachtkosten @wert money 
--
as
select * from orders where freight > @wert


--und dann die Bestellnummer ausgeben lassen

declare @schnitt as money
select @schnitt = avg(freight) from orders

exec gpSuchefrachtkosten @schnitt





exec gpKundensuche 'ALFKI'
exec gpKundensuche 'A%'


exec gpKundensuche 'A'--alle die mit A beginnen

exec gpKundensuche '%'

alter proc gpKundenSuche @kdid varchar(15) --ist so in DB  'O%   
--Hintergrund: variablen werden geschätzt varchar wird auf 50%
as
select * from customers where customerid like @KDID+'%'




--ich möchte für alle Kunden, nichts angeben müssen: 

alter proc gpKundenSuche @kdid varchar(15) = '%' --Standardwert
--Hintergrund: variablen werden geschätzt varchar wird auf 50%
as
select * from customers where customerid like @KDID+'%'


exec gpKundensuche


alter proc gpKundenSuche @kdid varchar(15) = '%' , @Land varchar(50)
AS
select * from customers
		where
				customerid like @kdid +'%' and country = @Land


exec gpKundenSuche 'A', 'UK'


--alle Kunden aus England
exec gpKundenSuche '%', 'UK'


--parameter direkt angeben
exec gpKundensuche @land='UK'


--Was kommt hier raus...
drop proc gptest

create proc gptest
as
select 10;
GO --ein GO tut am Ende einer prozedur ganz gut... ;-)
--vorsicht bei rekursisven Aufrufen..!
exec gptest;


--Löschen Kunden
--Lösche ALFKI  aus tab Customer

drop table kunden
select * into kunden from customers
select * into best from orders
select * into od from [Order Details]


begin tran

exec gpdelKunde 'ALFKI'
-->Kontroll ..is er wech..
rollback

delete from customers where customerid = 'ALFKI'--..geht normalerweise nicht wg ref Integrität

--zuerst muss ich die FK Datensätze aus Orders löschen
--das geht aber auch nur , wenn ich zuerst die order details Zeilen lösche, die zur Bestellung gehören

--

create proc gpKddel @kdid varchar(15)
as
--als erstes die order details Zeilen löschen, die zum Kunden gehören
--dann die Bestellungen des Kunden löschen
--dann den Kunden löschen

---
begin tran
exec gpKddel 'ALFKI'
rollback


--Proz mit Prüfung der gelöschten Datensätze
Alter proc gpKddel @kdid varchar(15)
as
Select 'Löschen folgender Bestellpositionen'
select * from OD where OrderID in 
			(select OrderID from orders where CustomerID = @kdid)
Select 'Löschen folgender Bestellungen'
select * from best where customerid = @kdid
Select 'Löschen folgender Kunden'
select * from Kunden where CustomerID = @kdid
delete from OD where OrderID in 
			(select OrderID from orders where CustomerID = @kdid)
delete from best where customerid = @kdid
delete from Kunden where CustomerID = @KDID
--
select '...sollte alles leer sein.....'
select * from OD where OrderID in 
			(select OrderID from orders where CustomerID = @kdid)
select * from best where customerid = @kdid
select * from Kunden where CustomerID = @kdid
GO

begin tran
exec gpKddel 'ALFKI'
rollback




--Prozeduren haben auch Ausgabeparameter
--Alerdings ist ein OUTPUT auch INPUT... 

create proc gpdemo2 @par1 int, @par2 int output --= INPUT und OUTPUT
as
set @par2 = @par1+333
GO

--Umweg über Variablen

declare @varextern as int
exec gpdemo2 @par1=100, @par2=@varextern output

select @varextern
select * from orders where freight > @varextern




--Wir suchen alle Bestellungen, die über dem Schnitt der Fracht liegenliegen

create proc gpSucheueberschnitt
as
---...

Alter proc gpSucheueberschnitt @wert money, @minwert as money output
as
select * from orders where Freight > @wert
select @minwert=MIN(freight) from orders where Freight > @wert
GO


declare @frschnitt as money, @MinFracht as money
select @frschnitt = AVG(freight) from orders

exec gpSucheueberschnitt @frschnitt, @MinWert = @MinFracht output
select * from orders where Freight = @minfracht



--

erhöhe die Frachtkosten um 10 %
--Proz : exec gpFrachtup Prozent, Employeeid

exec gpFrachtup 0.1 , 2

create proc gpFrachtUp @proz decimal(5,2), @Angid int
as
update orders set freight = freight * (@Proz/100+1) 
where customerid = @angid



--float, money, decimal(18,0), decimal (5,2)

declare @zahl decimal (5,2) = 10
select @zahl/100




