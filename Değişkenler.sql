--De�i�kenler
--declare komutu ,ile tan�mlan�r

--Prototip
--declare @De�i�kenad� de�i�ken tipi

declare @x int 
--yadaa
declare @yas int =3 --deger atad�m

--Tan�mlanm�� de�erlere de�er atama 
declare @y int 
--set
set @y =125

--�rne�in
declare @tarih datetime

--i�lemler yapt�m yapt�m yapt���mm

set @tarih =GETDATE() -- Burada de�eri atad�m


--DE���KEN�N DE�ER�N� OKUMA

declare @z int
set @z =3
select @z
--yada
print @z	


--Sorgu sonucu gelen verileri de�i�kenle elde etme 
select*from Personeller
--1 sorgu sonucu gelen sat�r say�s� bir adet olmal�d�r
--2 Kolonlardaki verilerin tipleri neyse o verileri temsil edecek verilerin tipleri ayn� olmal�d�r

declare @adi nvarchar(max),@soyadi nvarchar(max)
select @adi= Adi, @soyadi=SoyAdi from Personeller where PersonelID=1


select @adi,@soyadi