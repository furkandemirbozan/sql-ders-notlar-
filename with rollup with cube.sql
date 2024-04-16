--With Rollup

--Group by ile gruplanm�� veri k�mesinde ara toplam al�nmas�n� sa�lar


select SatisID,UrunID,SUM(Miktar)
from [Satis Detaylari] group by SatisID,UrunID with rollup  --Gruplamay� ara toplamlar ala ala verir

select KategoriID,UrunID,SUM(TedarikciID) from Urunler group by  KategoriID,UrunID with rollup

---With Cube
-- group by ile gruplanm�� veri k�melerinde teker teker toplamlar al�nmas�n� sa�lar

select SatisID,UrunID,sum(Miktar)
from [Satis Detaylari] group by SatisID,UrunID with cube

select KategoriID,UrunID, sum(TedarikciID)
from Urunler group by KategoriID,UrunID with cube

--having �art�yla beraber with cube komutu

select SatisID,UrunID,SUM(Miktar)
from [Satis Detaylari] group by SatisID,UrunID with cube having sum(Miktar)>100