use Northwind_turkce

------------------DML (DATA MAN�PULAT�ON LANGUAGE)

--SELECT , INSERT,UPDATE,DELETE

------------------------------------SELECT----------------------------------
SELECT*FROM Personeller

-------------------------------------Insert --------------------------------------------------------

---[Tablo ad�](Kolonlar) Values(Degerler)

insert Personeller(Adi,SoyAdi) values ('Furkan','Demirbozan')--kolon ad� verdi�im i�in sadece o kolonlara s�ras�yla ekleme yapar

insert Personeller values ('Demirbozan','Furkan','Yaz�l�m ve Veri taban� uzman�','YM','09.05.1997',GETDATE(),'Ankara','Ankara','�� Anadolu','06130','Turkiye','031354351',null,null,null,null,null)
--Yukar�da ki gibi gerekli kolon ad�n� vermezsem kolonla s�ras�yla verileri atam�� olucam

------------------D�KKAT ED�LMES� GEREKENLER----------------------
--Into komutu ile kullan�labilir
Insert into Personeller(Adi,SoyAdi) values ('Furkan','Demirbozan')

--Kolonun kabul etti�i veri tipi ve karakter uzunlu�unda kay�t yap�lmal�d�r
--Not null olan kolonlara bo� b�rk�lamayaca��ndan dolay� mutlaka de�er girilmeldir

Insert Personeller(Adi,SoyAdi) values ('Demirbozan')--ad� ve soyad� olarak iki kolon parametresi girilmesigerekirken 1 tane g�nderildi o y�zden yanl��

insert Personeller values('Demirbozan')--T�m koolonlara de�er girilmesi gerkirken 1 tane kolon de�eri girildi o y�zden yanl��

--Pritik Kulan�m
insert Musteriler (MusteriAdi,Adres) values('Furkan','Demirbozan')
insert Musteriler (MusteriAdi,Adres) values('sahra','Demirbozan')-------B�yl ayr� ayr� 3 tane yazmaktansa 
insert Musteriler (MusteriAdi,Adres) values('yama�','Demirbozan')
----------k�sa yolu------------
insert Musteriler (MusteriAdi,Adres) values('Furkan','Demirbozan'),('sahra','Demirbozan'),('yamac','Demirbozan')
-----------------------------------------------------------------------------------------------------------------------------

--------------------select sorugusu ile gelen veerileri farkl� bir tabloda olu�urarak kaydetme

insert OrnekPersoneller select Adi,SoyAdi from Personeller
--Dikkat edilmesi gereken nokta select sorgusunda d�nen kolon say�s� ile insert i�lemi  yapacak tablonun kolon say�s� e�it olmal�

--Select sorgusu gelen verileri farkl� bir tablo olu�turarak kaydet�e Ornek personeller tablosunu a�a��daki kodu execute yapt�ktan sonra olu�tu
select adi,soyadi,Ulke into OrnekPersoneller2 FROM PERSONELLER
--Ancak bu y�ntem ile PK ve FK olu�turulamaz


-------------------------------------UPDATE---------------------------------------------

--uPDATE [Tablo Ad�] set [Kolon Ad�]=de�er

Update OrnekPersoneller set adi ='Sahra' --B�T�N �S�MLER SAHRA OLDU �ART KOYMADIM

--Update sorgusuna where sorgusu yazmak
Update OrnekPersoneller set adi ='Sahra'where adi='fURKAN'
UPDATE OrnekPersoneller SET adi='AY�E' WHERE soyadi='Davolio'--	SOYADI Davolio OLANIN ADINI AY�E OLARAK DE���T�RD�M


--update sorgusunda join yap�s�n� kullanarak birden fazla tabloda g�ncelleme yapmak
update Urunler set UrunAdi=k.KategoriAdi from Urunler u inner join Kategoriler k on u.KategoriID=K.KategoriID

--�r�nler tablosu ve kategoriler tablosu kategori �d sine g�re birle�tiriliyo
--her bir �r�n�n ad�n�, o �r�n�n ait oldu�u kategorinin ad�yla g�nceller.



--Update sorgusunda Subqery ile g�ncelleme yapmak

update Urunler set UrunAdi=(select adi from Personeller where PersonelID=3)



--TOP KOMUTU �LE G�NCELLEME YAPMAK �LK 30 SATIR X OLUR
update top(30)Urunler SET UrunAdi='x'



---------------------------DELETE------------
--delet from [Tablo ad�]
--Silersem identity olan kolon kald��� yerden devam eder s�f�rlanmaz

delete from Urunler --�art yazmazsam hepsini siler o y�zden a�l��t�rmad�m

delete from Urunler where KategoriID>3 --kategoriID si 3 ten k���k olanlar� sil demi� oldum

--hem identity hem i�eri�i silinsin istiyorsam truncate komutunu kullanmam gerekecek
