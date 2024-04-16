--Temporary Tables (Geçici Tablolar)

--Bir tabloyu fiziksel olarak kopyalama


select * Into GeçiciPersoneller from Personeller
--Bu þekilde kullanýmda sadece primary key ve foreign key constraintler oluþturulmazlar.Geri kalan her þey birebir fiziksel oalrak oluþturulur



--Bir tabloyu # ifadesi ile beleðe geçici olarak kopyalama
select*into #GeciciPersoneller from Personeller

select*from #GeciciPersoneller
Insert #GeciciPersoneller(Adi,SoyAdi) values ('yamaaaç','Seni seviyorum asqým')
delete from #GeciciPersoneller where PersonelID=3
update #GeciciPersoneller set Adi = 'Hilmi',SoyAdi='bilmembe' where PersonelID=5

--Gecicidir belleðe kaydeder ve her iþlemi yapabilirim verilerimde deðiþ.iklik olmaz



--Bir tabloyu ## ifadesi ile belleðe geçici olarak kopyalama

--diðeri ile aynýdýr aralarýndakði fark bu tabloyu dþarýdan gelen 3. þahýsda kullanabilir aralarýdnaki tek fark budur