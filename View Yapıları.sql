--View yap�s�

----------Kullan�m amac�
--Genellikle Karma��k sorgular�n tek bir sorgu �zerinden �al��t�r�labilmesidir
--Bu ama�la raporlama i�lemlerinde kullan�labilirler
--Ayn� zamanda g�venlik ihtiyac� oldu�u durumda her hangi bir sorgunun 2.-3. �ah�slardan gizlenmesi amac�yla da kullan�labilirler

--Genel �zellikleri 
--Her hangi bir sorgunun sonucunu tablo olarak ele al�p ,ondan sorgu �ekilebilmesini sa�larlar
--Insert,Update ve delete yapabilirler.Bu i�lemleri fiziksel tabloya yans�t�rlar*****�NEML�
--View yap�lar� fiziksel oalrak olu�turulan yap�lard�r
--View yap�lar� normal sorgulardan daha yava� �al���rlar

create View vw_Gotur
as
select p.Adi + ' ' + p.SoyAdi [Ad� Soyad�],k.KategoriAdi [Kategori Ad�],COUNT(s.SatisID) [Toplam Sat��] from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID
						Inner join [Satis Detaylari] sd on s.SatisID=sd.SatisID
						inner join Urunler u on sd.UrunID=u.UrunID
						inner join Kategoriler k on k.KategoriID=u.KategoriID
group by p.Adi + ' ' + p.SoyAdi , k.KategoriAdi

--Yukar�daki komplike sorgumu view olarak olu�turdum ve bu komplike sorguyu herdefas�nda yazmama gerek kalmayacak view olarak �a��rabilicem
--A�a��daki gibi

select *from vw_Gotur
select *from vw_Gotur where  [Ad� Soyad�] like '%Robert%'


-------With Encryption Komutu ----
--E�er yazd���m�z view kaynak kodlar�n� Object Explorer penceresinde  "View" kategorisine sa� t�klayarak design modda a��p g�r�nt�lenmesini istemiyorsak "With Encryption" komutu ile view olu�turulmal�d�r
--Bu i�lem yap�ld�ktan sonra i�lemi yapan da dahil olmak �zere kimse o komutlar� g�remez GER� D���� YOKTUR.Komutlar�n yede�ini olu�turulmas� gerekmektedir
--As komutundan �nce yaz�lmal�d�r
--�rne�in
Create View OrnekViewPersoneleeeer
With Encryption
as
select Adi,SoyAdi,	Unvan from Personeller
--Bu i�lemi yaot�ktan sonra design modu kapanm��t�r

------------------------------------------
--------W�TH SCHEMAB�ND�NG KOMUTU
--E�er view'in kullan�ld��� esas fiziksel tablolar�n kolon isimleri bir �ekilde de�i�tirilir,kolonlar� silinir ya da tablo yap�s� bir �ekilde de�i�ikli�e u�rar ise view'in �al��mas� art�k m�mk�n olmayacakt�r.
--View'in kulland��� tablolar ve kolonlar� bu tarz i�lemler yap�labilmesi ihtimaline kar�� koruma alt�na al�nabilir.
--Bu koruma ''With Schemabinding'' komutu ile yap�labilir.
--''With Schemabinding'' ile view Create ya da Alter edilirken, view'in kulland��� tablo,schema ad�yla birlikte verilmelidir. �rne�in dbo(database owner) bir �ema ad�d�r. �emalar C#'taki namespaceler gibi d���n�lebilir.
--''With Schemabinding'' komutuda ''As'' keyword�nden �nce�yaz�lmal�d�r.

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
alter column Kolon1 int  -- bu ikisini �a�lt�rd���mda hata al�r�m ��nk� with Schemabinding kulland�m view de de�i�iklik yapamam.with Schemabinding kullanmassayd�m hata almazd�m

--------------------------------------------------------------------------------------
--View Check Option komutu
--View in i�erisindeki sorguda bullunan �arta uygun kay�tlar�n Insert edilmesine m�sade edip uymayan kay�tlar�n m�sade edilmemesini sa�layan komuttur.

Create View OrnekView2
as
Select Adi,SoyAdi from Personeller where Adi like 'a%'

insert OrnekView2 values ('Ahmet','Bilmemneo�lu')
insert OrnekView2 values ('Furkan','Demirbozan')   ---Bu �ekilde furkan a ile b�lamad��� i�in eklemez ancak syad�n� yazar tablo bozulur

select*from OrnekView2



Create View OrnekView2
as
Select Adi,SoyAdi from Personeller where Adi like 'a%'
with check option

insert OrnekView2 values ('Ahmet','Bilmemneo�lu')
insert OrnekView2 values ('Furkan','Demirbozan') --- A �LE BA�LAMA �ARTINA UYMADI�INDAN DOLAYI with check option komutu decreye girecek ve hata verecek

select*from OrnekView2