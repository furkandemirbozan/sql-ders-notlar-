--Temporary Tables (Ge�ici Tablolar)

--Bir tabloyu fiziksel olarak kopyalama


select * Into Ge�iciPersoneller from Personeller
--Bu �ekilde kullan�mda sadece primary key ve foreign key constraintler olu�turulmazlar.Geri kalan her �ey birebir fiziksel oalrak olu�turulur



--Bir tabloyu # ifadesi ile bele�e ge�ici olarak kopyalama
select*into #GeciciPersoneller from Personeller

select*from #GeciciPersoneller
Insert #GeciciPersoneller(Adi,SoyAdi) values ('yamaaa�','Seni seviyorum asq�m')
delete from #GeciciPersoneller where PersonelID=3
update #GeciciPersoneller set Adi = 'Hilmi',SoyAdi='bilmembe' where PersonelID=5

--Gecicidir belle�e kaydeder ve her i�lemi yapabilirim verilerimde de�i�.iklik olmaz



--Bir tabloyu ## ifadesi ile belle�e ge�ici olarak kopyalama

--di�eri ile ayn�d�r aralar�ndak�i fark bu tabloyu d�ar�dan gelen 3. �ah�sda kullanabilir aralar�dnaki tek fark budur