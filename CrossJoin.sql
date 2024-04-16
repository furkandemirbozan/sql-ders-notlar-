use Northwind_turkce

-----------Cross Join--------------
--Kartezyen çarpýma benzer
select COUNT(*) from Personeller
select COUNT(*) from Bolge

 -- Where þartýný koyamam 
select p.Adi,b.BolgeID from Personeller p cross join Bolge b