SELECT 
		Spalte1 , Spalte2 ,
		Mathe as ALIAS,
		f(Spalten), f(Werte)
		Zahlen, 'TXT'
		* alle Spalten (aus den Tabellen des From9
FROM TABA A

			LEFT|RIGHT|INNER|CROSS JOIN TABB B ON A.Sp1=B.Sp2 AND A.Sp2=B.Sp3 
			LEFT|RIGHT|INNER|CROSS JOIN TABC C ON B.Sp1=C.Sp2--- AND A.Sp2=B.Sp3	
			LEFT|RIGHT|INNER|CROSS JOIN TABD D ON D.Sp1=B.Sp2--- AND A.Sp2=B.Sp3	
			...
WHERE
			Sp > < <= >= != <> IN  BETWEEN  LIKE

			Wildcards: % beliebig viele Zeichen
				       _ ein Zeichen genau
					   [ABC|A-C]--ein Zeichen genau
					   Suche nach %   [%]       
					   Suche nach einem '    ''          '
			--> gehen nur bei LIKE

			AND 
			OR
			AND

			--> Merke: AND wird immer zuerst gebunden--> Klammern setzen
ORDER BY

	
select country, city as Stadt, c.Customerid from customers c
--where stadt = 'Berlin'
order by Stadt

--Logischer Fluss:

--> FROM TABA A --> JOIN --> WHERE --> SELECT (Mathe, Aliase) --> Order by --> Ausgabe


select top 2 * from customers
select top 2 * from orders
select top 2 * from [Order Details]
select top 2 * from products


select * from categories

--Wir suchen alle Firmen, die Seafood gekauft
--Wir brauchen: Firma, Verkäufer, den Produktnamen -- (Kategorie)


select		Companyname
			, productname
		--	, categoryname --nur zur Prüfung
			, Lastname
from customers c inner join orders o			on c.customerid = o.customerid
			     inner join [order details] od	ON od.orderid=o.orderid
				 inner join products p			on p.productid = od.productid
				 inner join categories cat	    on cat.categoryid = p.categoryid
				 inner join employees e			on e.employeeid = o.employeeid
where
		cat.categoryname = 'Seafood'














select customerid companyname from customers
select customerid, companyname from customers


select datepart(yy,orderdate), getdate()  from orders