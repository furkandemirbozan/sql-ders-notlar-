--Deðiþkenler
--declare komutu ,ile tanýmlanýr

--Prototip
--declare @Deðiþkenadý deðiþken tipi

declare @x int 
--yadaa
declare @yas int =3 --deger atadým

--Tanýmlanmýþ deðerlere deðer atama 
declare @y int 
--set
set @y =125

--Örneðin
declare @tarih datetime

--iþlemler yaptým yaptým yaptýýýmm

set @tarih =GETDATE() -- Burada deðeri atadým


--DEÐÝÞKENÝN DEÐERÝNÝ OKUMA

declare @z int
set @z =3
select @z
--yada
print @z	


--Sorgu sonucu gelen verileri deðiþkenle elde etme 
select*from Personeller
--1 sorgu sonucu gelen satýr sayýsý bir adet olmalýdýr
--2 Kolonlardaki verilerin tipleri neyse o verileri temsil edecek verilerin tipleri ayný olmalýdýr

declare @adi nvarchar(max),@soyadi nvarchar(max)
select @adi= Adi, @soyadi=SoyAdi from Personeller where PersonelID=1


select @adi,@soyadi