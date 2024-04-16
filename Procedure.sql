--=========================PROCEDURE==================
--Prototipi
--Create Procedure [�sim]
--(
--	Varsa parametreler
--)AS
--yaz�lacak sorgular kodlar �artlar fonksiyonlar komutlar


--==========Tan�mlanma
create Procedure sp_Ornek
(
	@Id int --Parantez kullanmak zorunda de�ilim
)as
select*from Personeller where PersonelID=@Id


--Kullan�m�

Exec sp_Ornek 3


--Geriye de�er d�nd�ren Stored Procedures yap�s�

create Proc UrunGetir
(
	@Fiyat Money
)as
select*from Urunler where BirimFiyati>@Fiyat
return @@RowCount

--Kullan�m�
exec UrunGetir 40
--Bu �ekilde geriye d�nd�r�len de�eri elde etmeksizin kullanm�� olruruz

--yadaa

declare @Sonuc int
exec @Sonuc = UrunGetir 40
print Cast(@Sonuc as nvarchar(max))+'Adet �r�n i�lemden etkilenmi�tir'

-----------Output ile de�er d�nen Procedure

create procedure sp_Ornek3
(
	@Id int,
	@Adi nvarchar(max) output,
	@Soyad� nvarchar(max)output
)as
select @Adi=Adi,@Soyad�=SoyAdi
FROM Personeller WHERE PersonelID = @Id

----KULLANIMI
DECLARE @Adi nvarchar(max),@Soyad� nvarchar(max)
exec sp_Ornek3 3,@Adi output,@Soyad� output
select @Adi+' ' + @Soyad�


--Genel �rnek
--D��ar�dan ald���m isim soyisim ve �ehir bilgilerini Personeller tablosuna ilgili kolonlara ekleyen stored Procedure � yaz

Create Procedure sp_PersonelEkle
(
	@Ad nvarchar(max),
	@Soyad nvarchar(max),
	@Sehir nvarchar(max)
)as
insert Personeller(Adi,SoyAdi,Sehir) values(@Ad,@Soyad,@Sehir)

exec sp_PersonelEkle 'Yamac','�zer','Trabzon'
select*from Personeller


------------------------
--Parametrelere varsay�lan de�er 
create proc sp_PersonelEkle2
(
	@Ad nvarchar(10)='�simsiz',
	@SoyAd nvarchar(20)='SoyAads�z',
	@Sehir nvarchar(15)='Sehir Girilmemis'
)as
insert Personeller(Adi,SoyAdi,Sehir) values (@Ad,@SoyAd,@Sehir)

exec sp_PersonelEkle2 'sahra','Demirbozqan','Trabzon'--Burada de�er verdi�im i�in varsay�lan de�erler devreye girmez

select*from Personeller

exec sp_PersonelEkle2-- bunu �al��t�rd���mda varsay�lan de�erleri yazd�rd� kolona

exec sp_PersonelEkle2 '�brahim' 
--@Adi Parametresi ibrahim de�erini al�r di�er parametreler varsay�lan de�eri alm�� olur



--===============Exec Komutu (�al��t�r anlam�na gelir)    
--'' Tek t�rnak i�erisini �al��t�r�r

exec ('Select*from Personeller')
select*from Personeller

--Yanl�� Kullan�m
Exec('Declare @sayac int = 0')
exec ('print @Sayac')

--Do�ru kullan�m
exec ('Declare @Sayac int = 0 print @Sayac')

--exec kullanarak stored procedure ile tablo yap�m� gencay y�ld�z sql 11. video da var oradan bakabilrisin