--IF YAPISI


--Tek sat�rl�k �al��ma begin end e gerek yok  begin end {} <== i�lemini yapar
DECLARE @Isim nvarchar(max)
set @Isim ='Furkan'

if @Isim ='Furkan'
	print 'Evet'
else
	print 'hay�r'

--Begin end 

declare @sayi1 int =3
declare @sayi2 int =5

if @sayi1 < @sayi2
	begin
		print 'evet sayi 1 sayi 2 den k���kt�r'
		select @sayi1 [Say� 1], @sayi2 [Say� 2]
	end
else
	begin
		print 'Hay�r say�1 say�2 den k���k de�ildir'
		select @sayi1 [Say� 1], @sayi2 [Say� 2]
	end


--Ornek1 
--Musteriler tablosunda amereikal� Usa m��teri var m�

select*from Musteriler where Ulke = 'USA'

if @@ROWCOUNT >0 
	print 'Evet'
else 
	print 'Hay�r'

--Ornek 2
--Ad� furkan soyad� Demirbozan olan personel var m� varsa evet desin oksa hay�tr desin

declare @adi nvarchar(max)='Sahra'
declare @soyadi nvarchar(max)='�zt�rk'
select*from Personeller where Adi=@adi and SoyAdi=@soyadi

if @@ROWCOUNT>0
	print 'evet var'

else
	begin
		print 'Hay�r yok'
		insert Personeller(Adi,SoyAdi) values (@adi,@soyadi)
	end



--Exists Fonsksiyonu var m� yok mu sorgular true yada false d�ner

if exists(Select*from Personeller)
	print'Dolu'
else
	print 'Bo�'