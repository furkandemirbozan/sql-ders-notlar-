use Northwind_turkce 

--aggregate fonksiyonlar

--AVG ===> ORTALAMA ALIR

select AVG(PersonelID) FROM Personeller --Personelýd lerinin ortalamsýný aldý

--Max ==> en büyük deðeri bulur
SELECT MAX(PersonelID) FROM Personeller
--MÝN ==> EN KÜÇÜK DEÐERÝ GETÝRÝR
SELECT MIN(PersonelID)FROM Personeller

--COUNT ==> TOPLAM SAYISINI GETÝRÝR
select COUNT(*) from Personeller
SELECT COUNT(Adi)from Personeller

--SUM ==> toplamýný getirir
select SUM(nakliyeUcreti)from Satislar