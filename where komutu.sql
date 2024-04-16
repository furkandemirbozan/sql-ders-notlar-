use Northwind_turkce
--select sorgularýnda where þartý yazmak
select*from Personeller -- Bütün personel bilgilerini getirir

--Personel tablosunda þehri london olan verileri listelerim
select*from Personeller where  Sehir='London'

--personel tablosunda baðlý çalýþtýðýkiþi sayýsýný 5 den küçk olanlarý listeleyelim
select *from Personeller where BagliCalistigiKisi<5
-- sehri london ve UK olanlarý getir
select*from Personeller where Sehir='London'and Ulke='UK'
--unvan eki Mr. veya sehri seattle olanlarý getir
select*from Personeller where  UnvanEki='Mr.'or Sehir='Seattle'

--ise baslama tarihi 1993 e eþit olanlarý getir
select *from Personeller where YEAR(IseBaslamaTarihi)=1993
--1992 den büyük olanlarý listele
select *from Personeller where YEAR(IseBaslamaTarihi)>1992
--Dogum günü ayýn 29 u olmayan personelleri listele
select *from Personeller where Day(IseBaslamaTarihi)<>29
--Dogum yýllarý 1950 ile 1965 yýllarý olan personelleri getir
select*from Personeller where YEAR(DogumTarihi)>1950 AND YEAR(DogumTarihi)<1965 


--Between komutu
--yukarýdaki komutla arasýnda hiç bir fark yoktur
select*from Personeller where YEAR(DogumTarihi) between 1950and 1965

--In komutu
select Adi from Personeller where Sehir In('London','Tacoma','Kirkland')--þehri lodon veya tacoma veya kirklan