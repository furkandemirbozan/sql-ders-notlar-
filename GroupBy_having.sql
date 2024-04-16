use Northwind_turkce

--Group By        GENELDE AGGRAGE FONKSYONU KULLANIRKEN KULLANIRIM
select *from Urunler

select KategoriID,COUNT(*) from Urunler Group By KategoriID --Gruplama yapýyorum yani KategoriID den kça tane olduðunu gösteren bir gruplama yaptým
--kategoryýd si 1 olandan 12 adet 2 olandan 12 adet 3 olandan 13 adet olduðunu gördüm

select KategoriID, TedarikciID , COUNT(*) from Urunler Group By KategoriID,TedarikciID-- BÝRDEN FAZLA KOLONUN GRUPÞAMASINA BÝR ÖRNEK



--PERSONELID SÜTÜNU VE COUNT GÝBÝ BÝR SÜTUN VAR ÝSE GENELDE GROUP BY KULLANACAÐIM
SELECT PersonelID,COUNT(*) FROM Satislar GROUP BY PersonelID --BURADA HANGÝ PERSONELID SÝ NE KADAR SATIÞ YAPTIYI GÖRÜCEM

SELECT PersonelID , SUM(NakliyeUcreti) FROM Satislar GROUP BY PersonelID

--kategoriýd si 5 den büyük olanlarý grupladý ve yazdý
SELECT KategoriID,COUNT(*) from Urunler where KategoriID>5 group by KategoriID 


---------------------

--having aggregate fonksiyonlarý için þart konulur ve sona yazýlýr
SELECT KategoriID,COUNT(*) from Urunler where KategoriID>5 group by KategoriID having COUNT(*)>6

------------------------------------------------------------------------------------------------------------------------------------
-------------------GROUP BY ÝÞLEMÞNDE WHERE ÞARTI----------------

SELECT *FROM Urunler

SELECT KategoriID,COUNT(*) FROM Urunler where KategoriID>5 group by KategoriID--kategoriýd si 5 ten büyük olanlarý getirdim

select PersonelID,COUNT(*) from Satislar where PersonelID<4 group by PersonelID


--------------------------------------HAVÝNG KOMUTU---------------------------------------
--Where normal kolonlar üzerinde kullanýrýz ama having komutunu aggregate(count sum len ) gibi komutlar üzerinde kullanýrýz

SELECT KategoriID,COUNT(*) FROM Urunler where KategoriID>5 group by KategoriID having COUNT(*)>6