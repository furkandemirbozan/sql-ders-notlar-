use Northwind_turkce --database i se�mek
--select komutu
select 3
select 'Furkan'
select 3,5,7
select 'Furkan','Demirbozan',26
select *from Personeller

--Allias Atama
select 3 as De�er
select 3 De�er
select Adi �simler, SoyAdi Soy�simler from Personeller

--Bo�l�k Karakteri varsa 
select 1453 [�stanbulun Fethi]
--Bosluk karakteri olan tabloyu sorgulama
select*from [Satis Detaylari]
--Kolonlar� birle�tirme
select Adi+' ' + SoyAdi [Personel Bilgileri] from Personeller

--Farkl� Tipte Kolonlar� Birle�tirme
select Adi +' '+IseBaslamaTarihi from Personeller--farkl� tipte oldu�undan hata verir
select Adi + ' '  +CONVERT(nvarchar, IseBaslamaTarihi) from Personeller
select Adi +' ' + CAST(IseBaslamaTarihi as nvarchar)from Personeller