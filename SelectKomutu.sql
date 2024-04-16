use Northwind_turkce --database i seçmek
--select komutu
select 3
select 'Furkan'
select 3,5,7
select 'Furkan','Demirbozan',26
select *from Personeller

--Allias Atama
select 3 as Deðer
select 3 Deðer
select Adi Ýsimler, SoyAdi SoyÝsimler from Personeller

--Boþlýk Karakteri varsa 
select 1453 [Ýstanbulun Fethi]
--Bosluk karakteri olan tabloyu sorgulama
select*from [Satis Detaylari]
--Kolonlarý birleþtirme
select Adi+' ' + SoyAdi [Personel Bilgileri] from Personeller

--Farklý Tipte Kolonlarý Birleþtirme
select Adi +' '+IseBaslamaTarihi from Personeller--farklý tipte olduðundan hata verir
select Adi + ' '  +CONVERT(nvarchar, IseBaslamaTarihi) from Personeller
select Adi +' ' + CAST(IseBaslamaTarihi as nvarchar)from Personeller