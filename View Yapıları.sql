--View yapýsý

----------Kullaným amacý
--Genellikle Karmaþýk sorgularýn tek bir sorgu üzerinden çalýþtýrýlabilmesidir
--Bu amaçla raporlama iþlemlerinde kullanýlabilirler
--Ayný zamanda güvenlik ihtiyacý olduðu durumda her hangi bir sorgunun 2.-3. þahýslardan gizlenmesi amacýyla da kullanýlabilirler

--Genel özellikleri 
--Her hangi bir sorgunun sonucunu tablo olarak ele alýp ,ondan sorgu çekilebilmesini saðlarlar
--Insert,Update ve delete yapabilirler.Bu iþlemleri fiziksel tabloya yansýtýrlar*****ÖNEMLÝ
--View yapýlarý fiziksel oalrak oluþturulan yapýlardýr
--View yapýlarý normal sorgulardan daha yavaþ çalýþýrlar

create View vw_Gotur
as
select p.Adi + ' ' + p.SoyAdi [Adý Soyadý],k.KategoriAdi [Kategori Adý],COUNT(s.SatisID) [Toplam Satýþ] from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID
						Inner join [Satis Detaylari] sd on s.SatisID=sd.SatisID
						inner join Urunler u on sd.UrunID=u.UrunID
						inner join Kategoriler k on k.KategoriID=u.KategoriID
group by p.Adi + ' ' + p.SoyAdi , k.KategoriAdi

--Yukarýdaki komplike sorgumu view olarak oluþturdum ve bu komplike sorguyu herdefasýnda yazmama gerek kalmayacak view olarak çaðýrabilicem
--Aþaðýdaki gibi

select *from vw_Gotur
select *from vw_Gotur where  [Adý Soyadý] like '%Robert%'


-------With Encryption Komutu ----
--Eðer yazdýðýmýz view kaynak kodlarýný Object Explorer penceresinde  "View" kategorisine sað týklayarak design modda açýp görðntðlenmesini istemiyorsak "With Encryption" komutu ile view oluþturulmalýdýr
--Bu iþlem yapýldýktan sonra iþlemi yapan da dahil olmak üzere kimse o komutlarý göremez GERÝ DÖÜÞÜ YOKTUR.Komutlarýn yedeðini oluþturulmasý gerekmektedir
--As komutundan önce yazýlmalýdýr
--Örneðin
Create View OrnekViewPersoneleeeer
With Encryption
as
select Adi,SoyAdi,	Unvan from Personeller
--Bu iþlemi yaotýktan sonra design modu kapanmýþtýr

------------------------------------------
--------WÝTH SCHEMABÝNDÝNG KOMUTU
--Eðer view'in kullanýldýðý esas fiziksel tablolarýn kolon isimleri bir þekilde deðiþtirilir,kolonlarý silinir ya da tablo yapýsý bir þekilde deðiþikliðe uðrar ise view'in çalýþmasý artýk mümkün olmayacaktýr.
--View'in kullandýðý tablolar ve kolonlarý bu tarz iþlemler yapýlabilmesi ihtimaline karþý koruma altýna alýnabilir.
--Bu koruma ''With Schemabinding'' komutu ile yapýlabilir.
--''With Schemabinding'' ile view Create ya da Alter edilirken, view'in kullandýðý tablo,schema adýyla birlikte verilmelidir. Örneðin dbo(database owner) bir þema adýdýr. Þemalar C#'taki namespaceler gibi düþünülebilir.
--''With Schemabinding'' komutuda ''As'' keywordünden önce yazýlmalýdýr.

CREATE TABLE ORNEKTABLO
(
	Id int primary key Identity,
	kolon1 nvarchar(max)
)

create View OrnekView
with Schemabinding
as
select Id,kolon1 from dbo.OrnekTablo

alter table OrnekTablo
alter column Kolon1 int  -- bu ikisini çaýltýrdýðýmda hata alýrým çünkü with Schemabinding kullandým view de deðiþiklik yapamam.with Schemabinding kullanmassaydým hata almazdým

--------------------------------------------------------------------------------------
--View Check Option komutu
--View in içerisindeki sorguda bullunan þarta uygun kayýtlarýn Insert edilmesine müsade edip uymayan kayýtlarýn müsade edilmemesini saðlayan komuttur.

Create View OrnekView2
as
Select Adi,SoyAdi from Personeller where Adi like 'a%'

insert OrnekView2 values ('Ahmet','Bilmemneoðlu')
insert OrnekView2 values ('Furkan','Demirbozan')   ---Bu þekilde furkan a ile bþlamadýðý için eklemez ancak syadýný yazar tablo bozulur

select*from OrnekView2



Create View OrnekView2
as
Select Adi,SoyAdi from Personeller where Adi like 'a%'
with check option

insert OrnekView2 values ('Ahmet','Bilmemneoðlu')
insert OrnekView2 values ('Furkan','Demirbozan') --- A ÝLE BAÞLAMA ÞARTINA UYMADIÐINDAN DOLAYI with check option komutu decreye girecek ve hata verecek

select*from OrnekView2