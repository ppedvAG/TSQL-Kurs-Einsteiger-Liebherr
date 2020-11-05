--Trigger

/*

DML I U D

reagieren auf Inser update delete : legen während der Transaktion Tabellen an: inserted und deleted
*/


select * into o3 from orders



create trigger trgdemo
on dbo.o3
for INSERT, UPDATE, DELETE
as
select getdate()
select * from deleted 
select * from inserted
--code

--viele TX --> das dauert...
--Trigger ist bestandteil deiner Transaktion: geänderte Daten kann man sehen
-- jeder INS UP und DEL ist eine Transaktion .. auch ohne Angabe von begin tran. Allerdings können die nicht mehr rückgängig gemacht werden


begin tran
--wir sehen die geänderten Werte

--wir brauche eine Spalte für Rsumme

alter table orders add rsumme money 

----Trigger auf order details.... 
--bei Änderung einer Bestellung.. > Rsumme eerrechnen --> in Orders Rsumme)
--es kann immer nur eine Bestpos geändert werden

create trigger trgdemo
on dbo.o3
for INSERT, UPDATE, DELETE
as
select getdate()
select * from deleted 
select * from inserted



select * from o3

update o3 set Freight= 100 where orderid <10260



--Trigger zum update der rsumme beim Ändern einer Position



create trigger trgRngSumme on dbo.[order details]
for insert, update, delete
as
declare @Rsumme as money
select @rsumme = sum(uniprice*quantity) from [order details]	
	where orderid = (select orderid from deleted)
update orders set rsumme = @rsumme where orderid =  (select orderid from deleted)

GO

update [Order Details]  
 set Quantity = 100 where OrderID = 10250 and ProductID =51


 select * from [Order Details] where OrderID = 10250
 select rsumme, rngsumme as FSumme, * from orders where OrderID = 10250


 --Trigger sind unsichtbar. Evtl Problem durch Trigger bei INS , UP oder DEl sind evtl nicht sofort erkennbar

 
