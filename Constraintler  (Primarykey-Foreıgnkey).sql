--Constraintler (KISITLAYICILAR)


--1 Default Constraint
--2 Check Constraint
--3 PrimaryKey Constraint
--4 Unique Constraint
--5 Foreign Key Constraint


-------------------Default Constraint-------------------------------
--Kolona bir de�er girilmedi�i taktirde varsay�lan olarak ne girilmesi gerekti�ini s�l�yoruz

--Genel Yap�s�
--Add Constraint [Constraint Ad�] Default 'Varsay�lan Deger' For [Kolon ad�]

Create table OrnekTablo
(
	Id int primary key  identity(1,1),
	Kolon1 nvarchar(max),
	kolon2 int
)

alter table [dbo].[OrnekTablo]
add Constraint Kolon1Constraint Default 'Bo�' for Kolon1

alter table [dbo].[OrnekTablo]
add Constraint Kolon2Constraint Default -1 for Kolon2

insert OrnekTablo(kolon2) values(0)
insert OrnekTablo(Kolon1) values('Ornek bir de�er')

select*from OrnekTablo


----------------------------- Check Constraint
--Bir kolona girilecek olan verinin belirli bir �arta uymas�n� zorunlu tutar

-- Genel yap�s�
--Add Constraint [Constraint ad�] Check (�ART)

ALTER TABLE OrnekTablo
add constraint Kolon2Kontrol check ((kolon2 * 5 ) % 2 = 0) --Bu �al��m�cak hata verecek hata vermesinin sebebi ise kolon 2 de bu k�s�tlamaya uymayan veriler oldu�u i�indir

--Bunun i�in kay�tlar� g�rmezden gelmek i�in with nocheck komutunu kullanmam gerekecek

--With NoCheck Komutu

--�uana kadar olan kay�tlar� g�rmezden gelir ve check constranti uygular

alter table OrnekTablo
With Nocheck add constraint Kolon2Kontrol check ((kolon2 * 5 ) % 2 = 0)

-------------------------------------------------------------------------
----------------------Primary Key----------------------------------------
-------------------------------------------------------------------------

--Kolona eklenen primary key ilr ba�ka tablolarda foreign key olu�turarak ili�ki kurulmas� m�mk�n olur
--Bunun yan�nda o kolonun ta��d��� verinin tekil olaca�� da garanti edilmi� olur

--Genel yap�s�
--Add Constraint [Constraint ad�] Primary key (Kolon ad�)
--Dikkat 
--Primary key Constraint kullanan kolon primary key �zelli�ine sahip olmamal�d�r

alter table [dbo].[OrnekTablo]
Add Constraint PrimarId Primary Key ([Id])


--Unique Constraint belirlenen kolonun tekil ama�lu kullan�lmas�n� sa�lamak

--genel yap�s� Add Constraint [Constraint ad�] Unique (Kolon ad�)

alter table [dbo].[OrnekTablo]
add Constraint OrnekTabloUnique Unique (Kolon2)

-----------------------------------------------------------
----------------Fore�gn Key-----------
--Tablolar�n kolonlar� aras�nda ili�ki kurmam�z� sa�lar. Bu ili�ki neticesinde Foreign key olan olan kolondaki kar��l���n�n bo�a d��memesi i�in primary key olan kolonu olan tablodan veri silinmesini g�ncellenmesini engeller
--Genel yap�s�
--Add constraint [Constraint ad�] foreign key  (Kolon ad� ) Referances [2.tablo ad�](2.Tablodaki kolon ad�)

create table Ogrenciler
(
	OgrenciId int primary key  identity(1,1),
	DersId int ,
	Adi nvarchar(max),
	Soyad� nvarchar (max)
)
create table Dertler
(
	DersId int primary key identity(1,1),
	DersAdi nvarchar(max)
)

alter table [dbo].[Ogrenciler]
add constraint ForeignKeyOgrenciDers Foreign key ([DersId]) references Dertler([DersId])

--Bu sayede iki tablo aras�ndaki ortak kolonlarla ba�lant� kurmu� oldum
--Bu durumda delete ve update i�lemlerini yapmaman
--bu davran��� de�i�tirmem i�in a�a��daki komutlar� kullan�r�m


-----Cascade 
--Ana tablodaki kay�t silindi�inde yada g�ncellendi�inde,ili�kili kolondaki kar��l���da otomatik olarak silinir yada g�ncellenir

alter table Ogrenciler 
add constraint  FroeignkeyOgrenciDers foreign key  ([DersId]) references Dertler ([DersId])
on delete Cascade
on update Cascade


--Set null 
----Ana tablodaki kay�t silindi�inde yada g�ncellendi�inde  ili�kili kolondaki kar��l���da null de�r basal�r
alter table Ogrenciler 
add constraint  FroeignkeyOgrenciDers1 foreign key  ([DersId]) references Dertler ([DersId])
on delete set null
on update set null

--Set Default 
--Ana tablodaki silindi�inde yada g�ncellendi�inde ili�kili kolonun kar��l���da o kolonun default  de�eri bas�l�r .Bu default de�er default tipte bir  constrainttir.Bunu kendimiz olu�turabiliriz

alter table Ogrenciler 
add constraint  FroeignkeyOgrenciDers foreign key  ([DersId]) references Dertler ([DersId])
on delete Cascade
on update Cascade
--Bu ayarlar verilmedi�i taktirde "no action" �zelli�i ge�erlidir

