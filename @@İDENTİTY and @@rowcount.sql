-----@@Identity Komutu

insert Kategoriler (KategoriAdi,Tanimi) values ('X','X kategorisi')

select @@IDENTITY -- yap�lan en sonuncu insert de�erinin identity de�erini getirir


-----------@@Rowcount Komutu

--Ka� adet eleman etkilenmi�tir in cevab�n� veriri bize
--�RN

DELETE FROM OrnekPersoneller2 WHERE soyadi='ASDF'
SELECT @@ROWCOUNT -- SIFIR ELEMAN ET�K�END�

SELECT * FROM Personeller
SELECT @@ROWCOUNT--10 ADET ELEMAN ETK�LEND� 