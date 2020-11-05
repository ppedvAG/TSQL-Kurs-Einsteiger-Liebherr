Select Sp, Sp as Alias, f8Spalten), Mathe, TXT
from
	TABA inner|right|left JOIN TABB ON TABA.Sp1 = TABB.sp2

where
		< < between in in 
order by


select *
	from 
		customers inner join orders on customers.customerid = orders.customerid


select c.customerid, o.*, country
	from
		customers c inner join orders o on c.CustomerID=o.CustomerID
	where 
		country = 'Germany'



--Angestellte Employees
--Orders

select * from employees
select * from orders

--Welcher Angstellte hatte Verkaufe gemacht, die weniger als 10 Frachtkosten hatten
select e.LastName, e.FirstName, o.orderid
	from employees e inner join orders o on e.EmployeeID=o.EmployeeID --830..alle Bestellungen
	where o.freight < 10



--Wie hängen die Tabellen zusammen


select *
	from TABA A inner join TABB B on A.SP = B.SP
				inner join TABC C on C.SP = B.SP
				INNER JOIN TABD D on D.SP = C.SP
where...
order by 


--Alle Firmn und die Produkte die sie kauften
--Firma, Produkt
--Cust-->Orders-->orderdetails--Products

--2155


select c.CompanyName, p.ProductName
from customers c inner join orders o				on c.CustomerID=o.CustomerID
			     inner join [Order Details] od		on od.OrderID=o.OrderID
				 inner join products p				on p.ProductID = od.ProductID
		


--und nun noch dazu den Angestellten dazu

select c.CompanyName, p.ProductName, e.lastname
from customers c 
			     inner join orders o				on c.CustomerID=o.CustomerID
			     inner join [Order Details] od		on od.OrderID=o.OrderID
				 inner join products p				on p.ProductID = od.ProductID
				 inner join employees e				on e.EmployeeID=o.EmployeeID



--Left right JOIN
--nun statt 830 (inner join) 832

select *
	from customers c left join orders o on c.customerid = o.customerid
	order by o.customerid asc


--Left join ist identisch mit dem right join

--formuliere die Abfrage so, dass ein right join  dasselebe Ergebnis liefert

select c.*,o.*
	from orders o  right join customers c on c.customerid = o.customerid
	order by o.customerid asc


--Prüfe, ob die ref. Integrität der Tabellen in Ordnung ist

--ist in orders ein Kunde, der nicht in Customers ist

select o.customerid, c.customerid
from
	orders o left join customers c on o.CustomerID=c.CustomerID
	where c.customerid is null --! 
	order by c.customerid asc



select * from employees

--LISTE

Lastname, stadt , Lastname Stv , Stdt des Stv




--JOIN auf die selbe Tabelle ist erlaubt
-- from employees e1 inner join employees e2


select e1.lastname, e1.city, e2.lastname AS STV, e2.city as STVSTADT
		from employees e1
				inner join employees e2 on e1.city = e2.city AND  e1.lastname != e2.lastname
				--where e1.lastname != e2.lastname
order by e1.city


--Versuche den CROSS JOIN zu vermeiden



--91 Kunde, 80 Orders 2155 Order details
--kaum 3 MB... 160MIO 

select 91*830*2155


select * from customers cross join orders




--Welche Kunde íst von welchem Ang in UK (Land des Kunden) betreut worden


--Ausgabe: Companyname Customer,  lastname (Employees)

select c.customerid, o.employeeid, E.LastName
	from customers C inner join orders O ON c.customerid = O.CustomerID
				     inner join employees E On e.EmployeeID=o.EmployeeID



--Welches Angestellte hat welche produkte verkauft...
--Employees  -->  orders  -->  order details --> products


select e.lastname, p.ProductName from 
	employees e inner join orders o					ON  e.EmployeeID=o.employeeid
			    inner join [Order Details] od		ON  od.orderid = o.orderid
				inner join products p				ON p.ProductID = od.ProductID






select * from View

GROUP BY 


Sp1 as Vorname, 

TAB1 SP Vorname
TAB1 Sp2 FamName









































