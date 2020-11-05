--Where

select Spalten, Spalten as Alias, f(Spalte), text, Zahl, Mathe
from Tabelle
where
				Spalte >, < >=, <= , like, in, between, != , <>, = Wert

order by 


--alle frachtkosten unter 10
--wie validiere ich 
select * from orders 
	where 
		freight < 9.8
order by 
		freight desc


--Alle Bestellungen unter Brutto 10 
--einfach 

select freight, freight * 1.16 from orders 
	where 
		freight*1.16 < 10
order by 
		freight desc


--between
-- >=    <=

--alle Bestellungen die zwischen 10 und 20 liegen
--Grenzen inklusive..Ja!


select * from orders 
	where
			freight >=10 and freight <= 20



select * from orders 
	where
			freight between 10 and 20


--Vergleiche gehen auch mit Buchstaben


--Suche alle Kunden aus Customers deren Customerid kleiner E ist


select * from customers where customerid <= 'E' order by 1 desc


--Such nach ähnlichen ....

--Alle Kunden , die mit A beginnen
--wildcard: % für beliebig viele Zeichen
--like 

select * from customers where customerid like 'A%'

--wieviele gibts denn , die im Firmenamen am Ende eine A haben?


select * from customers where CompanyName like '%A' --7 


--wieviele haben ein A im Namen...

select * from customers where CompanyName like '%A%' --75 


--Jetzt suchen wir einen der A% heisst --> 0!!!
select * from customers where customerid = 'A%'



--Suchen nach allen Bestellungen, die der Ang 1 verkauft hat und die Lieferkosten > 50
select * from orders


select * from orders
	where 
			employeeid = 1 and Freight > 50



--nicht bloß AND sondern auch OR

select * from orders
	where 
			employeeid = 1 OR Freight > 50
			--and ... or .. and ... or

--Alle Bestellungen, 
--die unter 50 Frachtkosten haben oder über Shipvia 3 verschifft wurden und eine Bestellnummer unter 10500 haben

--50  184 506

select * from orders
	where
		freight < 50
		or
		(shipvia = 3
		and
		orderid < 10500)


--immer Klammern Setzen..AND ist immer stärker binden
select * from orders
	where
		(freight < 50
		or
		shipvia = 3)
		and
		orderid < 10500


--Alle Kunden, die aus den Ländern 'UK' , 'USA', 'Italy'

select 
		* 
		from customers
		where 
				country ='USA'
				or
				COUNTRY = 'UK'
				or
				COUNTRY = 'Italy'


--IN Abkürzenden Schriebweise für das Suchen auf einer Spalten nach versch Werten
select * from customers
	where
	country in ('USA','UK','Italy')


--Alle Bestellungen, die von den Ang 1 3 und 5 betreut wurden und deren Frachtkosten unter 10 liegen
 --und von einem Kunden stammen, der ein C im Namen (customerid) hatte  

 select * from orders
	where
		 employeeid in (1,3,5)
		 AND
		 freight < 10
		 AND
		 customerid like '%c%'

		 --8 Stück...


--Wir suchen alle Kunden, die wo
--mit A oder B oder C oder F beginnen

select * from customers
where
	companyname like 'A%' or cpmpanyname like 'B%' ...
	--companyname in ('A%', 'B%'....)  in macht Vergleich mit = 


	--[] sind ein Wertebereich und stellen ein Zeichen dar

select * from customers
where
	companyname like '[ABCF]%'



select * from orders
where customerid like '[A-E]%'



--Suche alle Kunden, die ein % im Namen haben...
select * from customers

select * from customers where companyname like '%[%]%' --;-)

--Suche nach Firmen, die im Namen ein  ' haben

select * from customers where companyname like '%''%' --Suche nach ' .. 2 Hochkomma


--PIN sollte vergeben
--nur Zahlen
--w301

--welche 4 Zeichen in einer Spaltne sind keine korrekten PINs

-- zwischen 0 und 9999
--[0-9][0-9][0-9][0-9]


-- [ABC|RST]%

select * from customers where customerid like '[A-C|S-Z]%'

--patterns reg Expression



--verwaschene Zettel

--- xAxxDxEx
--die Suche nache einem Kunden, der an vorletzter Stelle ein e hat

select * from customers where CompanyName like '%e%' --%[e][A-Z|0-9]'

--Wildcard für ein Zeichen genau: _


select * from customers where CompanyName like '%e_'

--Wildcards: % 0 bis bel. viele Zeichen
--           _ genau ein Zeichen
--         Suche nach % [%]
--		Suche nach '  => ''
-- Wertebereiche: [A-Z|0-9] genau ein Zeichen 

---nur bei like 


--> not in   not between not like  !=   <>   
--NON SARG



---NULL .. jede math Operation für zu NULL
--nicht das gleiche wie 

--- 0 , '', 'NULL'

select 1+0

select 1 + NULL


where sp = NULL... is null.... is not null
--NULL oder 0 



















































