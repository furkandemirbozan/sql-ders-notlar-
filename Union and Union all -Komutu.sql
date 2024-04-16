--Union komutu ve union aLL KOMUTU

------------------UNÝON-----------
--Birden fazla selct sorgusu sonucu tabloyu alt alta tek tablo halinde gösteririr

select Adi,SoyAdi from Personeller
select MusteriAdi,MusteriUnvani from Musteriler
--Böyle yaparsam iki tablo halinde gelir
--ancaaaak


select Adi,SoyAdi from Personeller
union
select MusteriAdi,MusteriUnvani from Musteriler--Böyle yaparsam alt alta gösterir

--2 den fazla da yapabilirim
select Adi,SoyAdi from Personeller
union
select MusteriAdi,MusteriUnvani from Musteriler
union
select SevkAdi,SevkAdresi from Satislar

--Joinler tablolarý yan yana birleþtirir unionlar alt alta birleþtirir

--dikkat eilmesi gereken
--kolon isimleri üstteki sorgunun kolon isimlerinden oluþur
--Üstteki sorgudan kaç kolon çekilmiþse altata o kadar kolon çekilir
--üstteki sorgu ile alttaki sorgunun tipleri ayný olmasý gerekiyor
--Tekrar eden kayýtlarý getirmez

-------------------------------------------------UNÝON ALL----------------------------------
-----------------------TEKRAR EDEN KOMUTÞARI DA GETÝRÝR ------------------------------------
--Bu þekilde 10 kayýt gelir tekrar eden kayýtlarý getirmicek
select Adi,SoyAdi from Personeller
union
select Adi,SoyAdi from Personeller
--aþaðýdaki gibi kullanýrsam eðer tekrar edenleri getireceðinden 20  kayýt getirir
select Adi,SoyAdi from Personeller
union all
select Adi,SoyAdi from Personeller