use Northwind_turkce

--Group By        GENELDE AGGRAGE FONKSYONU KULLANIRKEN KULLANIRIM
select *from Urunler

select KategoriID,COUNT(*) from Urunler Group By KategoriID --Gruplama yap�yorum yani KategoriID den k�a tane oldu�unu g�steren bir gruplama yapt�m
--kategory�d si 1 olandan 12 adet 2 olandan 12 adet 3 olandan 13 adet oldu�unu g�rd�m

select KategoriID, TedarikciID , COUNT(*) from Urunler Group By KategoriID,TedarikciID-- B�RDEN FAZLA KOLONUN GRUP�AMASINA B�R �RNEK



--PERSONELID S�T�NU VE COUNT G�B� B�R S�TUN VAR �SE GENELDE GROUP BY KULLANACA�IM
SELECT PersonelID,COUNT(*) FROM Satislar GROUP BY PersonelID --BURADA HANG� PERSONELID S� NE KADAR SATI� YAPTIYI G�R�CEM

SELECT PersonelID , SUM(NakliyeUcreti) FROM Satislar GROUP BY PersonelID

--kategori�d si 5 den b�y�k olanlar� gruplad� ve yazd�
SELECT KategoriID,COUNT(*) from Urunler where KategoriID>5 group by KategoriID 


---------------------

--having aggregate fonksiyonlar� i�in �art konulur ve sona yaz�l�r
SELECT KategoriID,COUNT(*) from Urunler where KategoriID>5 group by KategoriID having COUNT(*)>6

------------------------------------------------------------------------------------------------------------------------------------
-------------------GROUP BY ��LEM�NDE WHERE �ARTI----------------

SELECT *FROM Urunler

SELECT KategoriID,COUNT(*) FROM Urunler where KategoriID>5 group by KategoriID--kategori�d si 5 ten b�y�k olanlar� getirdim

select PersonelID,COUNT(*) from Satislar where PersonelID<4 group by PersonelID


--------------------------------------HAV�NG KOMUTU---------------------------------------
--Where normal kolonlar �zerinde kullan�r�z ama having komutunu aggregate(count sum len ) gibi komutlar �zerinde kullan�r�z

SELECT KategoriID,COUNT(*) FROM Urunler where KategoriID>5 group by KategoriID having COUNT(*)>6