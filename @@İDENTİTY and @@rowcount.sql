-----@@Identity Komutu

insert Kategoriler (KategoriAdi,Tanimi) values ('X','X kategorisi')

select @@IDENTITY -- yapýlan en sonuncu insert deðerinin identity deðerini getirir


-----------@@Rowcount Komutu

--Kaç adet eleman etkilenmiþtir in cevabýný veriri bize
--ÖRN

DELETE FROM OrnekPersoneller2 WHERE soyadi='ASDF'
SELECT @@ROWCOUNT -- SIFIR ELEMAN ETÝKÝENDÝ

SELECT * FROM Personeller
SELECT @@ROWCOUNT--10 ADET ELEMAN ETKÝLENDÝ 