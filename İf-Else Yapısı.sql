--IF YAPISI


--Tek satýrlýk çalýþma begin end e gerek yok  begin end {} <== iþlemini yapar
DECLARE @Isim nvarchar(max)
set @Isim ='Furkan'

if @Isim ='Furkan'
	print 'Evet'
else
	print 'hayýr'

--Begin end 

declare @sayi1 int =3
declare @sayi2 int =5

if @sayi1 < @sayi2
	begin
		print 'evet sayi 1 sayi 2 den küçüktür'
		select @sayi1 [Sayý 1], @sayi2 [Sayý 2]
	end
else
	begin
		print 'Hayýr sayý1 sayý2 den küçük deðildir'
		select @sayi1 [Sayý 1], @sayi2 [Sayý 2]
	end


--Ornek1 
--Musteriler tablosunda amereikalý Usa müþteri var mý

select*from Musteriler where Ulke = 'USA'

if @@ROWCOUNT >0 
	print 'Evet'
else 
	print 'Hayýr'

--Ornek 2
--Adý furkan soyadý Demirbozan olan personel var mý varsa evet desin oksa hayýtr desin

declare @adi nvarchar(max)='Sahra'
declare @soyadi nvarchar(max)='Öztürk'
select*from Personeller where Adi=@adi and SoyAdi=@soyadi

if @@ROWCOUNT>0
	print 'evet var'

else
	begin
		print 'Hayýr yok'
		insert Personeller(Adi,SoyAdi) values (@adi,@soyadi)
	end



--Exists Fonsksiyonu var mý yok mu sorgular true yada false döner

if exists(Select*from Personeller)
	print'Dolu'
else
	print 'Boþ'