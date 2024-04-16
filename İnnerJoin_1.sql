--------------INNER JOÝN -----------------

--iki tablo arasýndaki kesiþim kümesi gelecektir
--yazýmý =====> select*from tablo1 inner join tablo2 on toblo1.iliþkiliKOLON=tablo2.iliþkiliKolon
--allias ile yazýmý
-- yazýmý ====> select*from tablo t1 inner join  tablo2 t2 on t1.iliþkiliKOLON =T2.ÝLÝÞKÝLÝKOLON


--Hangi personel hangi satýþlarý yapmýþtýr
select * from Personeller p Inner join  Satislar s on p.PersonelID=s.PersonelID

--hangi ürün hangi kategoride

select u.UrunAdi, k.KategoriAdi from Urunler u Inner join Kategoriler k on u.KategoriID=k.KategoriID

-------where komutu ekliyorum

--Beverages kategorisindeki ürünler(urunler ,kategoriler)
select u.UrunAdi from Kategoriler k Inner join Urunler u on k.KategoriID=u.KategoriID where  k. KategoriAdi='Beverages'

--Beverages kategorisindeki ürünlerin sayýsý kaçtýr

select COUNT(u.UrunAdi) from Kategoriler k inner join  Urunler u on k.KategoriID=u.KategoriID where k.KategoriAdi='Beverages'

--faks numarasýnda "null" olmayan tedarikçilerden alýnmýþ ürünler nelerdir (ürünler,tedarikçiler)

select u.UrunAdi from Urunler u inner join Tedarikciler t on u.UrunID=t.TedarikciID where t.Faks <>'Null'
--YADAAA
select UrunAdi from Urunler u inner join Tedarikciler t on u.UrunID=t.TedarikciID where t.Faks is not null