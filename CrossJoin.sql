use Northwind_turkce

-----------Cross Join--------------
--Kartezyen �arp�ma benzer
select COUNT(*) from Personeller
select COUNT(*) from Bolge

 -- Where �art�n� koyamam 
select p.Adi,b.BolgeID from Personeller p cross join Bolge b