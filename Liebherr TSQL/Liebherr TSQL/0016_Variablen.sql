--Variablen


/*
@var
lokale
Zugriff nur in der Erstellersession
Lebensdauer: existiert nur solange der Batch läuft  ..Achtung kommt ein GO.. dann ist das Ding weg


@@var
globale
meist Systemvariablen
Zugriff: jeder auch in anderen Session
Lebensdauer: solange wie die lokale
*/



declare @var1 as int

set @var1 = 1

select @var1
go

set @var1 = 100
select @var1




--Batch_ eine Reihe von Anweisungen
--GO: Batchdelimiter



declare @var2 as int

select @var2=count(*) from customers
select @var2

--Freight
--Welche/wieviele Bestellungen liegen über dem Durchschnitt der Frachtkosten

select * from orders

declare @Frachtschnitt as int

select @Frachtschnitt=min(freight)  from orders-- where freight > @Frachtschnitt
select *
 from orders where freight > @Frachtschnitt
GO --Variable tot
select @Frachtschnitt


select * from orders 
	where freight > (select avg(freight) from orders)


declare @var3 as int=0 --default Wert

set @var3 = @var3 +3

select @var3

--Prozeduren 




