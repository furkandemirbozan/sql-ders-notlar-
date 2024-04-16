--Inner join 2 den fazla tablo birleþtirme

-- 1997 yýlýndan sonra Nancy nin satýþ yaptýðý firmenýn ismleri

select*from Personeller p  inner join Satislar s on p.PersonelID =s.PersonelID inner join Musteriler m on s.MusteriID=m.MusteriID where p.Adi='Nancy' and YEAR(s.SatisTarihi)>1997

--Lmited olan tedarikçilerden alýnmý seafood kategorisindeki ürünlerin toplam satýþ tutarý.(Urunler , Kategoriler,Tedarikçiler)

select sum(u.HedefStokDuzeyi*u.BirimFiyati)from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID inner join  Kategoriler k on u.KategoriID=k.KategoriID 
where t.SirketAdi like '%Ltd.%'and k.KategoriAdi='Seafood'

--Ayný tabloyu iliþkisel olarak BÝRLEÞTÝRME

--Personellerin baðlý olarak çalýþtýðý kiþileri listeleme

select p1.Adi,p2.Adi from Personeller p1 inner join Personeller p2 on p1.BagliCalistigiKisi=p2.PersonelID


--Inner join de Group by kullanýmý

--hangi kategoride kaç adet ürün vardýr
select KategoriID, COUNT(*) from Urunler group by KategoriID

--hangi personelim(adý ve soyadý ile birlikte) toplam kaç adetlik satýþ yapmýþ.Satýþ adeti 100 den fazla olanlar ve personelin adýnýn baþ harfi M olan kayýtlar gelsin.(personeller, satýþlar)

select p.Adi +' '+ p.SoyAdi,COUNT(s.SatisID) from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID where p.Adi like'm%' group by p.Adi + ' ' +SoyAdi having COUNT(s.SatisID)>100


--seafood kategorisindeki ürünlerin sayýsý kaçtýr (Ürünler,Kategoriler)

select k.KategoriAdi,COUNT(u.UrunAdi) from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID where k.KategoriAdi ='Seafood' group by k.KategoriAdi

--hangi personel toplam kaç adet satýþ yapmýþtýr.(Personeller ,Satýþlar)

select top 1 P.Adi,COUNT(S.SatisID) from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID group by P.Adi ORDER BY COUNT(s.SatisID) desc


