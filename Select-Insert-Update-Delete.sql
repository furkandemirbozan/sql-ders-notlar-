use Northwind_turkce

------------------DML (DATA MANÝPULATÝON LANGUAGE)

--SELECT , INSERT,UPDATE,DELETE

------------------------------------SELECT----------------------------------
SELECT*FROM Personeller

-------------------------------------Insert --------------------------------------------------------

---[Tablo adý](Kolonlar) Values(Degerler)

insert Personeller(Adi,SoyAdi) values ('Furkan','Demirbozan')--kolon adý verdiðim için sadece o kolonlara sýrasýyla ekleme yapar

insert Personeller values ('Demirbozan','Furkan','Yazýlým ve Veri tabaný uzmaný','YM','09.05.1997',GETDATE(),'Ankara','Ankara','Ýç Anadolu','06130','Turkiye','031354351',null,null,null,null,null)
--Yukarýda ki gibi gerekli kolon adýný vermezsem kolonla sýrasýyla verileri atamýþ olucam

------------------DÝKKAT EDÝLMESÝ GEREKENLER----------------------
--Into komutu ile kullanýlabilir
Insert into Personeller(Adi,SoyAdi) values ('Furkan','Demirbozan')

--Kolonun kabul ettiði veri tipi ve karakter uzunluðunda kayýt yapýlmalýdýr
--Not null olan kolonlara boþ býrkýlamayacaðýndan dolayý mutlaka deðer girilmeldir

Insert Personeller(Adi,SoyAdi) values ('Demirbozan')--adý ve soyadý olarak iki kolon parametresi girilmesigerekirken 1 tane gönderildi o yüzden yanlýþ

insert Personeller values('Demirbozan')--Tüm koolonlara deðer girilmesi gerkirken 1 tane kolon deðeri girildi o yüzden yanlýþ

--Pritik Kulaným
insert Musteriler (MusteriAdi,Adres) values('Furkan','Demirbozan')
insert Musteriler (MusteriAdi,Adres) values('sahra','Demirbozan')-------Böyl ayrý ayrý 3 tane yazmaktansa 
insert Musteriler (MusteriAdi,Adres) values('yamaç','Demirbozan')
----------kýsa yolu------------
insert Musteriler (MusteriAdi,Adres) values('Furkan','Demirbozan'),('sahra','Demirbozan'),('yamac','Demirbozan')
-----------------------------------------------------------------------------------------------------------------------------

--------------------select sorugusu ile gelen veerileri farklý bir tabloda oluþurarak kaydetme

insert OrnekPersoneller select Adi,SoyAdi from Personeller
--Dikkat edilmesi gereken nokta select sorgusunda dönen kolon sayýsý ile insert iþlemi  yapacak tablonun kolon sayýsý eþit olmalý

--Select sorgusu gelen verileri farklý bir tablo oluþturarak kaydetöe Ornek personeller tablosunu aþaðýdaki kodu execute yaptýktan sonra oluþtu
select adi,soyadi,Ulke into OrnekPersoneller2 FROM PERSONELLER
--Ancak bu yöntem ile PK ve FK oluþturulamaz


-------------------------------------UPDATE---------------------------------------------

--uPDATE [Tablo Adý] set [Kolon Adý]=deðer

Update OrnekPersoneller set adi ='Sahra' --BÜTÜN ÝSÝMLER SAHRA OLDU ÞART KOYMADIM

--Update sorgusuna where sorgusu yazmak
Update OrnekPersoneller set adi ='Sahra'where adi='fURKAN'
UPDATE OrnekPersoneller SET adi='AYÞE' WHERE soyadi='Davolio'--	SOYADI Davolio OLANIN ADINI AYÞE OLARAK DEÐÝÞTÝRDÝM


--update sorgusunda join yapýsýný kullanarak birden fazla tabloda güncelleme yapmak
update Urunler set UrunAdi=k.KategoriAdi from Urunler u inner join Kategoriler k on u.KategoriID=K.KategoriID

--Ürünler tablosu ve kategoriler tablosu kategori ýd sine göre birleþtiriliyo
--her bir ürünün adýný, o ürünün ait olduðu kategorinin adýyla günceller.



--Update sorgusunda Subqery ile güncelleme yapmak

update Urunler set UrunAdi=(select adi from Personeller where PersonelID=3)



--TOP KOMUTU ÝLE GÜNCELLEME YAPMAK ÝLK 30 SATIR X OLUR
update top(30)Urunler SET UrunAdi='x'



---------------------------DELETE------------
--delet from [Tablo adý]
--Silersem identity olan kolon kaldýðý yerden devam eder sýfýrlanmaz

delete from Urunler --Þart yazmazsam hepsini siler o yüzden açlýþtýrmadým

delete from Urunler where KategoriID>3 --kategoriID si 3 ten küçük olanlarý sil demiþ oldum

--hem identity hem içeriði silinsin istiyorsam truncate komutunu kullanmam gerekecek
