--------------INNER JO�N -----------------

--iki tablo aras�ndaki kesi�im k�mesi gelecektir
--yaz�m� =====> select*from tablo1 inner join tablo2 on toblo1.ili�kiliKOLON=tablo2.ili�kiliKolon
--allias ile yaz�m�
-- yaz�m� ====> select*from tablo t1 inner join  tablo2 t2 on t1.ili�kiliKOLON =T2.�L��K�L�KOLON


--Hangi personel hangi sat��lar� yapm��t�r
select * from Personeller p Inner join  Satislar s on p.PersonelID=s.PersonelID

--hangi �r�n hangi kategoride

select u.UrunAdi, k.KategoriAdi from Urunler u Inner join Kategoriler k on u.KategoriID=k.KategoriID

-------where komutu ekliyorum

--Beverages kategorisindeki �r�nler(urunler ,kategoriler)
select u.UrunAdi from Kategoriler k Inner join Urunler u on k.KategoriID=u.KategoriID where  k. KategoriAdi='Beverages'

--Beverages kategorisindeki �r�nlerin say�s� ka�t�r

select COUNT(u.UrunAdi) from Kategoriler k inner join  Urunler u on k.KategoriID=u.KategoriID where k.KategoriAdi='Beverages'

--faks numaras�nda "null" olmayan tedarik�ilerden al�nm�� �r�nler nelerdir (�r�nler,tedarik�iler)

select u.UrunAdi from Urunler u inner join Tedarikciler t on u.UrunID=t.TedarikciID where t.Faks <>'Null'
--YADAAA
select UrunAdi from Urunler u inner join Tedarikciler t on u.UrunID=t.TedarikciID where t.Faks is not null