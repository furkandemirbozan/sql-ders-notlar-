--Constraintler (KISITLAYICILAR)


--1 Default Constraint
--2 Check Constraint
--3 PrimaryKey Constraint
--4 Unique Constraint
--5 Foreign Key Constraint


-------------------Default Constraint-------------------------------
--Kolona bir deðer girilmediði taktirde varsayýlan olarak ne girilmesi gerektiðini sölüyoruz

--Genel Yapýsý
--Add Constraint [Constraint Adý] Default 'Varsayýlan Deger' For [Kolon adý]

Create table OrnekTablo
(
	Id int primary key  identity(1,1),
	Kolon1 nvarchar(max),
	kolon2 int
)

alter table [dbo].[OrnekTablo]
add Constraint Kolon1Constraint Default 'Boþ' for Kolon1

alter table [dbo].[OrnekTablo]
add Constraint Kolon2Constraint Default -1 for Kolon2

insert OrnekTablo(kolon2) values(0)
insert OrnekTablo(Kolon1) values('Ornek bir deðer')

select*from OrnekTablo


----------------------------- Check Constraint
--Bir kolona girilecek olan verinin belirli bir þarta uymasýný zorunlu tutar

-- Genel yapýsý
--Add Constraint [Constraint adý] Check (ÞART)

ALTER TABLE OrnekTablo
add constraint Kolon2Kontrol check ((kolon2 * 5 ) % 2 = 0) --Bu çalýþmýcak hata verecek hata vermesinin sebebi ise kolon 2 de bu kýsýtlamaya uymayan veriler olduðu içindir

--Bunun için kayýtlarý görmezden gelmek için with nocheck komutunu kullanmam gerekecek

--With NoCheck Komutu

--Þuana kadar olan kayýtlarý görmezden gelir ve check constranti uygular

alter table OrnekTablo
With Nocheck add constraint Kolon2Kontrol check ((kolon2 * 5 ) % 2 = 0)

-------------------------------------------------------------------------
----------------------Primary Key----------------------------------------
-------------------------------------------------------------------------

--Kolona eklenen primary key ilr baþka tablolarda foreign key oluþturarak iliþki kurulmasý mümkün olur
--Bunun yanýnda o kolonun taþýdýðý verinin tekil olacaðý da garanti edilmiþ olur

--Genel yapýsý
--Add Constraint [Constraint adý] Primary key (Kolon adý)
--Dikkat 
--Primary key Constraint kullanan kolon primary key özelliðine sahip olmamalýdýr

alter table [dbo].[OrnekTablo]
Add Constraint PrimarId Primary Key ([Id])


--Unique Constraint belirlenen kolonun tekil amaçlu kullanýlmasýný saðlamak

--genel yapýsý Add Constraint [Constraint adý] Unique (Kolon adý)

alter table [dbo].[OrnekTablo]
add Constraint OrnekTabloUnique Unique (Kolon2)

-----------------------------------------------------------
----------------Foreýgn Key-----------
--Tablolarýn kolonlarý arasýnda iliþki kurmamýzý saðlar. Bu iliþki neticesinde Foreign key olan olan kolondaki karþýlýðýnýn boþa düþmemesi için primary key olan kolonu olan tablodan veri silinmesini güncellenmesini engeller
--Genel yapýsý
--Add constraint [Constraint adý] foreign key  (Kolon adý ) Referances [2.tablo adý](2.Tablodaki kolon adý)

create table Ogrenciler
(
	OgrenciId int primary key  identity(1,1),
	DersId int ,
	Adi nvarchar(max),
	Soyadý nvarchar (max)
)
create table Dertler
(
	DersId int primary key identity(1,1),
	DersAdi nvarchar(max)
)

alter table [dbo].[Ogrenciler]
add constraint ForeignKeyOgrenciDers Foreign key ([DersId]) references Dertler([DersId])

--Bu sayede iki tablo arasýndaki ortak kolonlarla baðlantý kurmuþ oldum
--Bu durumda delete ve update iþlemlerini yapmaman
--bu davranýþý deðiþtirmem için aþaðýdaki komutlarý kullanýrým


-----Cascade 
--Ana tablodaki kayýt silindiðinde yada güncellendiðinde,iliþkili kolondaki karþýlýðýda otomatik olarak silinir yada güncellenir

alter table Ogrenciler 
add constraint  FroeignkeyOgrenciDers foreign key  ([DersId]) references Dertler ([DersId])
on delete Cascade
on update Cascade


--Set null 
----Ana tablodaki kayýt silindiðinde yada güncellendiðinde  iliþkili kolondaki karþýlýðýda null deðr basalýr
alter table Ogrenciler 
add constraint  FroeignkeyOgrenciDers1 foreign key  ([DersId]) references Dertler ([DersId])
on delete set null
on update set null

--Set Default 
--Ana tablodaki silindiðinde yada güncellendiðinde iliþkili kolonun karþýlýðýda o kolonun default  deðeri basýlýr .Bu default deðer default tipte bir  constrainttir.Bunu kendimiz oluþturabiliriz

alter table Ogrenciler 
add constraint  FroeignkeyOgrenciDers foreign key  ([DersId]) references Dertler ([DersId])
on delete Cascade
on update Cascade
--Bu ayarlar verilmediði taktirde "no action" özelliði geçerlidir

