use Northwind_turkce
--select sorgular�nda where �art� yazmak
select*from Personeller -- B�t�n personel bilgilerini getirir

--Personel tablosunda �ehri london olan verileri listelerim
select*from Personeller where  Sehir='London'

--personel tablosunda ba�l� �al��t���ki�i say�s�n� 5 den k��k olanlar� listeleyelim
select *from Personeller where BagliCalistigiKisi<5
-- sehri london ve UK olanlar� getir
select*from Personeller where Sehir='London'and Ulke='UK'
--unvan eki Mr. veya sehri seattle olanlar� getir
select*from Personeller where  UnvanEki='Mr.'or Sehir='Seattle'

--ise baslama tarihi 1993 e e�it olanlar� getir
select *from Personeller where YEAR(IseBaslamaTarihi)=1993
--1992 den b�y�k olanlar� listele
select *from Personeller where YEAR(IseBaslamaTarihi)>1992
--Dogum g�n� ay�n 29 u olmayan personelleri listele
select *from Personeller where Day(IseBaslamaTarihi)<>29
--Dogum y�llar� 1950 ile 1965 y�llar� olan personelleri getir
select*from Personeller where YEAR(DogumTarihi)>1950 AND YEAR(DogumTarihi)<1965 


--Between komutu
--yukar�daki komutla aras�nda hi� bir fark yoktur
select*from Personeller where YEAR(DogumTarihi) between 1950and 1965

--In komutu
select Adi from Personeller where Sehir In('London','Tacoma','Kirkland')--�ehri lodon veya tacoma veya kirklan