--IF


IF Bedingung Code

IF 1=1 select 'A'

if 1=0 select 'B'


IF 1=0
	select 'A'
ELSE
	SELECT 'B'


IF (select count(*) from employees where country = 'UK') >=5
	select 'is ok'
ELSE
	select 'wir müssen einstellen'



--Wenn wir in Deutschland mehr als 10 Kunden haben ,dann machen wir ein Filiale auf
--wenn aber nicht, dann keine Filiale 


if (select count(*) from customers where country = 'germany') >= 10
	select 'neue Filiale'
	--select 'XYZ'
else
	select 'keine neue Filiale'
	

	--RAT --immer Blöcke beschreiben
if (select count(*) from customers where country = 'germany') >= 15
	BEGIN
		select 'neue Filiale'
	END
else
	BEGIN
		select 'keine neue Filiale'
		select 'zu wenig Geld'
	END


IF 1=0 Select'A'


IF 1=1
	select 100
		IF 1=1 select 'B'	
		else
			select 'C'




--WHILE


WHILE BEDINGUNG
	BEGIN
		--code
	END


declare @i as int = 1

while @i<= 10
	begin
		select @i
		set @i=@i+1
--		set @i+=1
	end


	--Break continue



declare @i as int = 1

while @i<= 10
	begin
		select @i
		set @i=@i+1
		IF @i=5 break --sofortige Unterbrechung der schleife
--		set @i+=1
	end


declare @i as int = 1

while @i<= 10
	begin
		select @i
	--	set @i=@i+1
		IF @i=5 continue --sofortige Unterbrechung der schleife
		set @i=@i+1
		select 1000000
	end


select * into o2 from orders


--erhöhe die Frachtkosten um 10 % bis in Summe 100000 frachtkosten enstanden sind, aber eben nicht höher!!


Frachtvar money
select @var = sum(freight)

WHILE var <= 100000
	begin
		select @var
		set var = var*1.1
		If sum(var) = 10000 break

	end


select sum(freight) from o2

begin  tran

	while (select sum(freight) from o2) <= 100000
		begin 
				update o2 set Freight=freight *1.1
				IF (select sum(freight) from o2) >100000
					begin
						update o2 set freight = freight /1.1
						break
					end
	    end
select sum(freight) from o2
rollback


--Funktionen. ..Trigger
--




begin  tran

	while (select sum(freight)*1.1 from o2) <= 100000
		begin 
				update o2 set Freight=freight *1.1		
	end
select sum(freight) from o2
rollback


--wir ergänzen: wir wollen nicht die 10000 erreichen in Summe oder auch der Max Wert darf nicht 1300 überschreiten


select max(freight), sum(freight) from o2

begin  tran

	while (select sum(freight)*1.1 from o2) <= 100000 AND (select max(freight) from o2) <= 1300/1.1
		begin 
				update o2 set Freight=freight *1.1		
	end
select sum(freight), max(freight) from o2
rollback






END














