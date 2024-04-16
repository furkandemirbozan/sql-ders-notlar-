--With Rollup

--Group by ile gruplanmýþ veri kümesinde ara toplam alýnmasýný saðlar


select SatisID,UrunID,SUM(Miktar)
from [Satis Detaylari] group by SatisID,UrunID with rollup  --Gruplamayý ara toplamlar ala ala verir

select KategoriID,UrunID,SUM(TedarikciID) from Urunler group by  KategoriID,UrunID with rollup

---With Cube
-- group by ile gruplanmýþ veri kümelerinde teker teker toplamlar alýnmasýný saðlar

select SatisID,UrunID,sum(Miktar)
from [Satis Detaylari] group by SatisID,UrunID with cube

select KategoriID,UrunID, sum(TedarikciID)
from Urunler group by KategoriID,UrunID with cube

--having þartýyla beraber with cube komutu

select SatisID,UrunID,SUM(Miktar)
from [Satis Detaylari] group by SatisID,UrunID with cube having sum(Miktar)>100