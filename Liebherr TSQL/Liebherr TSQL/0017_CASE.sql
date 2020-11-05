--Fallunterscheidungen


/*

eine Liste aller bestellungen

Frachtkosten: > 500  C

rest ist B

Frachtkosten < 100   A


*/


--Alle Bestellungen (orderid, freight, ABC)


select orderid, freight, 'A'  from orders where freight < 100
UNION ALL
select orderid, freight, 'B'  from orders where freight between 100 and 500
UNION ALL
select orderid, freight, 'C'  from orders where freight > 500



---CASE 
--CASE 
		WHEN Bedingung.. then ausgabe
		...
		ELSE
END


select 
		country,
		CASE
				WHEN COUNTRY = 'germany' then 'EU'
				ELSE 'Rest der Welt'
		END  as Fall
from customers

--bei trfeffer, dann wird der nachste when nicht mehr interpretiert

select orderid, freight, 
		case
			when freight > 100 then 'A' --610
			when freight > 500 then 'C'
			else 'B'
		end ABCKunde
from orders
order by 2 desc



select 
		country,
		CASE
				WHEN COUNTRY IN ('germany', 'Italy', 'France') then 'EU'
				when country like 'U%' then 'TESTMIT%' --auch > < between 
				ELSE 'Rest der Welt'
		END  as Fall
from customers
order by fall


--from--join--where--group--habving--select--order by--ausgabe


--Sicht kann ich mit order by ohne Top erstellt werden

--top 100 percent ..order by