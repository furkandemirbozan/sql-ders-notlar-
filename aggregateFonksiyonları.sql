use Northwind_turkce 

--aggregate fonksiyonlar

--AVG ===> ORTALAMA ALIR

select AVG(PersonelID) FROM Personeller --Personel�d lerinin ortalams�n� ald�

--Max ==> en b�y�k de�eri bulur
SELECT MAX(PersonelID) FROM Personeller
--M�N ==> EN K���K DE�ER� GET�R�R
SELECT MIN(PersonelID)FROM Personeller

--COUNT ==> TOPLAM SAYISINI GET�R�R
select COUNT(*) from Personeller
SELECT COUNT(Adi)from Personeller

--SUM ==> toplam�n� getirir
select SUM(nakliyeUcreti)from Satislar