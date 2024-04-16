--Union komutu ve union aLL KOMUTU

------------------UN�ON-----------
--Birden fazla selct sorgusu sonucu tabloyu alt alta tek tablo halinde g�steririr

select Adi,SoyAdi from Personeller
select MusteriAdi,MusteriUnvani from Musteriler
--B�yle yaparsam iki tablo halinde gelir
--ancaaaak


select Adi,SoyAdi from Personeller
union
select MusteriAdi,MusteriUnvani from Musteriler--B�yle yaparsam alt alta g�sterir

--2 den fazla da yapabilirim
select Adi,SoyAdi from Personeller
union
select MusteriAdi,MusteriUnvani from Musteriler
union
select SevkAdi,SevkAdresi from Satislar

--Joinler tablolar� yan yana birle�tirir unionlar alt alta birle�tirir

--dikkat eilmesi gereken
--kolon isimleri �stteki sorgunun kolon isimlerinden olu�ur
--�stteki sorgudan ka� kolon �ekilmi�se altata o kadar kolon �ekilir
--�stteki sorgu ile alttaki sorgunun tipleri ayn� olmas� gerekiyor
--Tekrar eden kay�tlar� getirmez

-------------------------------------------------UN�ON ALL----------------------------------
-----------------------TEKRAR EDEN KOMUT�ARI DA GET�R�R ------------------------------------
--Bu �ekilde 10 kay�t gelir tekrar eden kay�tlar� getirmicek
select Adi,SoyAdi from Personeller
union
select Adi,SoyAdi from Personeller
--a�a��daki gibi kullan�rsam e�er tekrar edenleri getirece�inden 20  kay�t getirir
select Adi,SoyAdi from Personeller
union all
select Adi,SoyAdi from Personeller