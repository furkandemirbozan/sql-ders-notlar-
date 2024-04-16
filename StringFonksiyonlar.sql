use Northwind_turkce
--STR�NG FONKS�YONLAR

--LEFT --soldan itibaren belirtilen say�da karakteri getirir
SELECT LEFT (ADi,2) FROM Personeller
--RIGHT --SA�DAN itibaren belirtilen say�da karakteri getirir
SELECT RIGHT(AD�,3)FROM Personeller

--UPPER B��K HARFE �EV�R�R
SELECT UPPER(AD�)  from Personeller
--LOWER k���k HARFE �EV�R�R
SELECT lower(AD�)  from Personeller
--SUBSTR�NG ==> BEL�RT�LEN �NDEXTEN BEL�RT�LEN KARAKTER KADAR GET�R
SELECT SUBSTRING(SOYAD�,3,2)FROM Personeller
--REVERSE TERS�NE �EV�R�R
SELECT REVERSE(AD�) FROM Personeller
--REPLACE BEL�RT�LEN B�R �FADEY� BEL�RT�LEN BA�KA B�R �FADE �LE DE���T�R�R
SELECT REPLACE ('BEN�M ADIM FURKAN ','FURKAN','SAHRA<3')

--CHARINDEX ==> BEL�RT�LEN KARAKTER�N VER� ���NDE SIRASINI NUMARASINI VER�R
SELECT AD�,CHARINDEX('r',adi)FROM Personeller--r harfinin hangi indexte oldu�unu getirir 
--�ndex numaras�n� de�il s�ras�n� getirir 0 varsa yok demektir

--CHARINDEX �RNE��
--M��TER� TABLOSUNUN M�steriAdi kolunundan sadece adlar�n� �ekelim
select musteriadi from Musteriler
select SUBSTRING(musteriadi,0,CHARINDEX(' ',musteriadi))from Musteriler --indexlerde bo�luk bulana kadar ilerle demek istiyorum burda

--M��teriler tablosunun musteriadi kolonundan sadece soyadlar�n� �ekmek
select SUBSTRING(musteriadi,CHARINDEX(' ',Musteriadi),Len(musteriadi)-(CHARINDEX(' ',musteriadi)-1))from Musteriler

