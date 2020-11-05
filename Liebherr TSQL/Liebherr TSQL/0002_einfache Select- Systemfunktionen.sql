--  'TEXT                         '

Herrn
Otto              Müller
 T    E   S    T 


--Trim

select rtrim('TEST                      ') 
select ltrim('       TEST')
select trim ....


--len  datalength

--len() misst die Länge , aber ignoriert Leerzeichen (von rechts)
select len('TEST        ')-- der LEN muss trimm gemacht haben

--datalength misst die tats. Menge der Zeichenkette
select datalength ('test       ') --macht keinen Trim
--trim



--auch normale Ausgaben von text und Zahlen möglich
select 'TEXT'

select 100

--Vorsicht bei Kommazahlen
select 100.10 --für Kommazahlen . verwenden.. ein  , acht zwei Spalten

select 100, 200

--Mit Text arbeiten


--ZK umdrehen
select reverse('Otto') -- Text in umgekehrter reihenfole

--von links oder rechts eine best ZK ausgeben
select left('testtext', 4)
select right ('testtext', 4)

--ab einer gewissen Potiion für eine gewisse Länge
select substring('testtext', 4, 2)

--Text verketten
select 'A' + 'B'

--Zeichenkette erstetzen ab einer Position für eine best Länge
select stuff('123456789', 5, 1,'xxx')


--Idee:  0867798xxx

select '08677988971'

--left, right, trim, substring, reverse , + 
--Idee: 
--Länge festellten : 10
--left von Links die ersten 7 Zeichen
-- + XXX


select left('08677988971000', len('08677988970001')-3) + 'XXX'

select reverse(stuff(reverse('08677988971'),1,3,'xxx'))



--Datumsfunktionen

select getdate() --aktuelle Uhrzeit


--datepart: teil eines Datums ausgeben: mm , yy, ww, ss, hh,dd, dw

select datepart(mm, getdate())
select datepart(ww, getdate())
select datepart(qq, getdate())
select datepart(yy, getdate())


select year(getdate()), day(getdate(), week, month


--datename: Februar, Montag

select datename(mm, getdate())

--lass dir den Wochentag ausgeben.. 1 bis 7

select datename(w, getdate())


--in 3 Wochen: dateadd

select dateadd(dd, 20, getdate())

--Welches Datum haben wir in 10 Monaten

select dateadd(mm, 10, getdate())

--Mondlandung:  20. Juli 1969

--Welcher Wochentag war und wieviel Tage ist das her..

--Dauer zwischen zwei Terminen : 
select datediff(Intervall, Datum 1 , datum 2)


select 'die erste Mondlandung fand an einem ' + datename(dw, '20.7.1969') + ' statt. '
Select  datediff(dd, '20.7.1969' , Getdate())

Select  datediff(dd,  Getdate(),'20.7.1969')































 --replace und Susbtring









