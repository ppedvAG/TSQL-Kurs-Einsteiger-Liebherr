--Functions
--sind eigtl fast grundsätzlich als langsam einzuschätzen
--gut oder schlecht bei Suche: im PLAN: SCAN oder SEEK
--scan ist ein von a bis z
--seek herauspicken

--vor allem im where

select * from customers where customerid like 'H%'

select * from customers where left(customerid ,1) = 'H'

--sind einfach superpraktisch

select f(wert), f(spalte) from f(wert) where f(spalte) > f(wert)



create function fdemo1 (@par1 int)
returns int
as
	Begin
		return(select @par1+13)
	end;
GO


select fdemo1(100) --komplette Name notwendig



select * from Northwind.dbo.orders


select * from dbo.orders


select * from Nwindbig.dbo.orders


select * from Northwind..orders

select dbo.fdemo1(100) --jetzt klappt das... schema.objektname



create function fbrutto (@netto money)
returns money
as
	begin
		return (select @netto*1.19)
	end

select dbo.fbrutto (100)


select orderid, freight, dbo.fbrutto(freight) as Brutto from orders
	where 
			dbo.fbrutto(freight) > 500



--erstelle eine F() die die Rsumme pro Bestellnr errechnet

select f(10248) --> 440


--fRngSumme

create function dbo.fRngSumme(@bestnr int) returns money
as
	begin
		return (select sum(unitprice*quantity) from [order details] where orderid = @bestnr)
	end

select dbo.fRngsumme(10248)


select dbo.fRngsumme(orderid), * from orders 
		where dbo.frngsumme(orderid) > 500 order by 1 desc

alter table orders add RngSumme as dbo.fRngSumme(orderid)

---830 --- 2155
select * from orders where RngSumme > 500 --Stimme die Kosten des Plans eigtl...


--Idee : wir wollen die Rsumme, aber bei select * from orders ..ist das doof , wenn man sie nicht braucht


---eine Sicht macht : auf orders inkl frngsumme



create function dbo.fTabelle (@land varchar(50))
returns table
as
Return
	( select * from customers where country = @land);
	GO


--sieht einer Sicht rel ähnlich
select * from dbo.fTabelle('UK')


create function dbo.MSVF (@par1 int, @par2 int)
returns @outTable TABLE (sp1 int, sp2 int)
as
Begin
	insert into @outTable
	select @par1, @par2
	return
end


select * from dbo.msvf(10,20)


select * from [Order Details]


440 10248

select 14*12

--Ausgabe.. orderid , possumme, Rsumme, %Anteil

--11000



select	   orderid 
		, (unitprice*quantity) as PosSumme
		, dbo.FRngSumme(orderid) as RngSumme
		, convert(varchar(50), ((unitprice*quantity)/ dbo.FRngSumme(orderid))*100) +' %' as prozent
from [Order Details]
where orderid = 11000



select convert(varchar(50), 10000) +'A'

select 1000 +'A'

select convert(varchar(50), getdate())












