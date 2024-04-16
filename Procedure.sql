--=========================PROCEDURE==================
--Prototipi
--Create Procedure [Ýsim]
--(
--	Varsa parametreler
--)AS
--yazýlacak sorgular kodlar þartlar fonksiyonlar komutlar


--==========Tanýmlanma
create Procedure sp_Ornek
(
	@Id int --Parantez kullanmak zorunda deðilim
)as
select*from Personeller where PersonelID=@Id


--Kullanýmý

Exec sp_Ornek 3


--Geriye deðer döndüren Stored Procedures yapýsý

create Proc UrunGetir
(
	@Fiyat Money
)as
select*from Urunler where BirimFiyati>@Fiyat
return @@RowCount

--Kullanýmý
exec UrunGetir 40
--Bu þekilde geriye döndürülen deðeri elde etmeksizin kullanmýþ olruruz

--yadaa

declare @Sonuc int
exec @Sonuc = UrunGetir 40
print Cast(@Sonuc as nvarchar(max))+'Adet ürün iþlemden etkilenmiþtir'

-----------Output ile deðer dönen Procedure

create procedure sp_Ornek3
(
	@Id int,
	@Adi nvarchar(max) output,
	@Soyadý nvarchar(max)output
)as
select @Adi=Adi,@Soyadý=SoyAdi
FROM Personeller WHERE PersonelID = @Id

----KULLANIMI
DECLARE @Adi nvarchar(max),@Soyadý nvarchar(max)
exec sp_Ornek3 3,@Adi output,@Soyadý output
select @Adi+' ' + @Soyadý


--Genel Örnek
--Dýþarýdan aldýðým isim soyisim ve þehir bilgilerini Personeller tablosuna ilgili kolonlara ekleyen stored Procedure ü yaz

Create Procedure sp_PersonelEkle
(
	@Ad nvarchar(max),
	@Soyad nvarchar(max),
	@Sehir nvarchar(max)
)as
insert Personeller(Adi,SoyAdi,Sehir) values(@Ad,@Soyad,@Sehir)

exec sp_PersonelEkle 'Yamac','Özer','Trabzon'
select*from Personeller


------------------------
--Parametrelere varsayýlan deðer 
create proc sp_PersonelEkle2
(
	@Ad nvarchar(10)='Ýsimsiz',
	@SoyAd nvarchar(20)='SoyAadsýz',
	@Sehir nvarchar(15)='Sehir Girilmemis'
)as
insert Personeller(Adi,SoyAdi,Sehir) values (@Ad,@SoyAd,@Sehir)

exec sp_PersonelEkle2 'sahra','Demirbozqan','Trabzon'--Burada deðer verdiðim için varsayýlan deðerler devreye girmez

select*from Personeller

exec sp_PersonelEkle2-- bunu çalýþtýrdýðýmda varsayýlan deðerleri yazdýrdý kolona

exec sp_PersonelEkle2 'Ýbrahim' 
--@Adi Parametresi ibrahim deðerini alýr diðer parametreler varsayýlan deðeri almýþ olur



--===============Exec Komutu (Çalýþtýr anlamýna gelir)    
--'' Tek týrnak içerisini çalýþtýrýr

exec ('Select*from Personeller')
select*from Personeller

--Yanlýþ Kullaným
Exec('Declare @sayac int = 0')
exec ('print @Sayac')

--Doðru kullaným
exec ('Declare @Sayac int = 0 print @Sayac')

--exec kullanarak stored procedure ile tablo yapýmý gencay yýldýz sql 11. video da var oradan bakabilrisin