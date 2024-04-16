--Inner join 2 den fazla tablo birle�tirme

-- 1997 y�l�ndan sonra Nancy nin sat�� yapt��� firmen�n ismleri

select*from Personeller p  inner join Satislar s on p.PersonelID =s.PersonelID inner join Musteriler m on s.MusteriID=m.MusteriID where p.Adi='Nancy' and YEAR(s.SatisTarihi)>1997

--Lmited olan tedarik�ilerden al�nm� seafood kategorisindeki �r�nlerin toplam sat�� tutar�.(Urunler , Kategoriler,Tedarik�iler)

select sum(u.HedefStokDuzeyi*u.BirimFiyati)from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID inner join  Kategoriler k on u.KategoriID=k.KategoriID 
where t.SirketAdi like '%Ltd.%'and k.KategoriAdi='Seafood'

--Ayn� tabloyu ili�kisel olarak B�RLE�T�RME

--Personellerin ba�l� olarak �al��t��� ki�ileri listeleme

select p1.Adi,p2.Adi from Personeller p1 inner join Personeller p2 on p1.BagliCalistigiKisi=p2.PersonelID


--Inner join de Group by kullan�m�

--hangi kategoride ka� adet �r�n vard�r
select KategoriID, COUNT(*) from Urunler group by KategoriID

--hangi personelim(ad� ve soyad� ile birlikte) toplam ka� adetlik sat�� yapm��.Sat�� adeti 100 den fazla olanlar ve personelin ad�n�n ba� harfi M olan kay�tlar gelsin.(personeller, sat��lar)

select p.Adi +' '+ p.SoyAdi,COUNT(s.SatisID) from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID where p.Adi like'm%' group by p.Adi + ' ' +SoyAdi having COUNT(s.SatisID)>100


--seafood kategorisindeki �r�nlerin say�s� ka�t�r (�r�nler,Kategoriler)

select k.KategoriAdi,COUNT(u.UrunAdi) from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID where k.KategoriAdi ='Seafood' group by k.KategoriAdi

--hangi personel toplam ka� adet sat�� yapm��t�r.(Personeller ,Sat��lar)

select top 1 P.Adi,COUNT(S.SatisID) from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID group by P.Adi ORDER BY COUNT(s.SatisID) desc


