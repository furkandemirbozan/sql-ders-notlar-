use Northwind_turkce
--STRÝNG FONKSÝYONLAR

--LEFT --soldan itibaren belirtilen sayýda karakteri getirir
SELECT LEFT (ADi,2) FROM Personeller
--RIGHT --SAÐDAN itibaren belirtilen sayýda karakteri getirir
SELECT RIGHT(ADÝ,3)FROM Personeller

--UPPER BÜÜK HARFE ÇEVÝRÝR
SELECT UPPER(ADÝ)  from Personeller
--LOWER küçük HARFE ÇEVÝRÝR
SELECT lower(ADÝ)  from Personeller
--SUBSTRÝNG ==> BELÝRTÝLEN ÝNDEXTEN BELÝRTÝLEN KARAKTER KADAR GETÝR
SELECT SUBSTRING(SOYADÝ,3,2)FROM Personeller
--REVERSE TERSÝNE ÇEVÝRÝR
SELECT REVERSE(ADÝ) FROM Personeller
--REPLACE BELÝRTÝLEN BÝR ÝFADEYÝ BELÝRTÝLEN BAÞKA BÝR ÝFADE ÝLE DEÐÝÞTÝRÝR
SELECT REPLACE ('BENÝM ADIM FURKAN ','FURKAN','SAHRA<3')

--CHARINDEX ==> BELÝRTÝLEN KARAKTERÝN VERÝ ÝÇÝNDE SIRASINI NUMARASINI VERÝR
SELECT ADÝ,CHARINDEX('r',adi)FROM Personeller--r harfinin hangi indexte olduðunu getirir 
--ýndex numarasýný deðil sýrasýný getirir 0 varsa yok demektir

--CHARINDEX ÖRNEÐÝ
--MÜÞTERÝ TABLOSUNUN MüsteriAdi kolunundan sadece adlarýný çekelim
select musteriadi from Musteriler
select SUBSTRING(musteriadi,0,CHARINDEX(' ',musteriadi))from Musteriler --indexlerde boþluk bulana kadar ilerle demek istiyorum burda

--Müþteriler tablosunun musteriadi kolonundan sadece soyadlarýný çekmek
select SUBSTRING(musteriadi,CHARINDEX(' ',Musteriadi),Len(musteriadi)-(CHARINDEX(' ',musteriadi)-1))from Musteriler

