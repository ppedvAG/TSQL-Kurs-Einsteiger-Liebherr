--ein TOP braucht eigtl immer ein order by 

select top 10 * from customers
order by city

--die ersten 13 nach Frachtkosten asc
--orderid, customerid, freight..was ist der letzte Wert der Frachtkosten...

--

select top 13 with ties orderid, customerid, freight  from orders order by freight asc

--KOENE beschwert sich.. hat genauso viel

select top 5 percent * from orders



--Distinct filter doppelte Ergebniszeilen


select distinct country from customers --21 , weil 21 Länder


select distinct country, customerid from customers --alle...Customerid ist eindeutig




select 





select distinct country, city from customers








