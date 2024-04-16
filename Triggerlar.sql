--Triggers(Tetikleyiciler)

--Dml Trigger
--Bir tabloda Insert Update Delete i�lemleri ger�ekle�tirildi�inde devreye giren yap�lard�r
--Bu i�lemler sonucunda vetya s�recinde devreye girerler

---DDL Trigger
--Create Alter Drop i�lmeleri sonucunda veya s�recinde decreye girecek olan yap�lard�r 

--Prototip
--Create Trigger [Trigger ad�]
--on [��lem yap�lacak tablo ad�]
--after veya for delete,update,insert
--as
--[Kodlar]

Create trigger OrnekTrigger
on Personeller
after insert
as											
select*from Personeller					--Bu trigger insert i�lemi ile beraber select*from personeller i�lemini �al��t�r�yor

Insert Personeller (Adi,SoyAdi) values('deniz','Gezmi�')

--Ornek 1 
--tedarik�iler Tablosundan bir veri silindi�inde t�m �r�nlerin fiat� otomatik olarak 10 arts�n

create Trigger triggerTedarik�iler
on Tedarikciler
after delete
as
update Urunler set BirimFiyati = BirimFiyati + 10
Select*from Urunler


delete from Tedarikciler where TedarikciID = 33

--Yukar�daki i�lem �u demek tedarik�iId silindi�inde urunler Tablosudaki birim fiyat�n� 10 artt�racak vev o tabloyu bana getrirecek ollan tetikleyicidir



--Ornek2
--Tedarik�iler tablosundaki bir veri g�ncellendi�inde kategoriler tablosunda "meyve kokteyli" ad�nda bir kategri olu�tsun


create trigger trgTedarikciGuncellendiginde
on Tedarikciler
for update
as
insert Kategoriler(KategoriAdi) values ('Meyve Kokteyli')


Update Tedarikciler set MusteriAdi = 'Hilmi' where TedarikciID =30
select*From Kategoriler


--Ornek 3 
--personeller tablosundan bir kay�t silindi�inde silinen kayd�n ad� soyad� kim taraf��ndan ve hangi tarihte silindi�i ba�ka bir tabloya kay�t edilsin bir nevi log tablosu misali


Create table LogTablosu
(
	Id int primary key identity(1,1),
	Rapor nvarchar(max)
)

Create Trigger triggerPersoneller
on Personeller
after delete
as
declare @adi nvarchar(max),@soyad� nvarchar(max)
select @adi=Adi,@soyad�=SoyAdi from deleted
insert LogTablosu values ('Ad� ve soyad� ' +@adi+'olan personel'+SUSER_NAME()+'Taraf�ndan'+CAST(GETDATE()as nvarchar(max))+'tarihinde silinmi�tir')

delete From Personeller where PersonelID=31 -- BU i�lem her yap�ld���nda benim a�t���m log tablosunda i�lem kay�t edilir ve tetiklenir




--Ornek4
--Personeller tablosunda update ger�ekle�ti�i anda devreye giren bir log tablosuna "ad�---- olan personel ---- yeni ad�yla de�i�tirilerek ------ kullan�c� taraf�ndan--- tarihinde g�ncellendi " kal�b�nda rapor yazan bir trigger yazal�m

Create trigger trgPersonellerRapor
on Personeller
after update
as
declare @EskiAdi nvarchar(max),@YeniAdi nvarchar(max)
select @EskiAdi =Adi from deleted
select @YeniAdi = Adi from inserted
insert LogTablosu values ('Ad�'+@EskiAdi + 'OLAN PERSONEL'+@YeniAdi+'Yeni Ad�yla de�i�tirilerek'+SUSER_NAME()+'Kullan�c�s� taraf�ndan '+CAST(GETDATE()as nvarchar(max))+'Tarihinde G�NCELLEND�')


Update Personeller set Adi= 'CEM' WHERE PersonelID=3


---------------------------------------------------------------
--===============Multiple Action Trigger====
create trigger MultiTrigger
on Personeller
after delete,insert
as
print 'Merhaba'


Insert Personeller(Adi,SoyAdi) values ('Gencay','Y�ld�z')
delete from Personeller where PersonelID=11

--Buraya kadaryapt���m i�lemler bir i�lem yapt���mda ba�ka bir i�lemin tekiklenmesiydi 
--�rne�in update i�lemi yaparken yan�nda �u i�lemide yap dedim

--===============Instead of treigger ========
--Bu i�lem ise yan�nda yap demek de�il YER�NE YAP DEMEK
--�RNE��N bir tabloya ekleme i�lemi yapmaya �al��t���mda onu de�il benim yazd���m trigger � yap demek


--Ornek1
--Personeller tablosunda update ger�ekle�ti�i anda yap�alcak g�ncelleme yerine bir log tablosunda "Ad�____olan personel ___yeni ad�yla de�i�tirilerek _____Kullan�c� taraf�ndan ___Tarihinde g�ncellenmek istendi"kal�b�nda rapor yazan trigger� yaz

Create trigger trgPersonellerRaporInstead
on Personeller
Instead of update
as
declare @EskiAdi nvarchar(max),@YeniAdi nvarchar(max)
select @EskiAdi =Adi from deleted
select @YeniAdi = Adi from inserted
insert LogTablosu values ('Ad�'+@EskiAdi + 'OLAN PERSONEL'+@YeniAdi+'Yeni Ad�yla de�i�tirilerek'+SUSER_NAME()+'Kullan�c�s� taraf�ndan '+CAST(GETDATE()as nvarchar(max))+'Tarihinde G�NCELLENMEK �STEND�����!!!!!!')

update Personeller set Adi ='CEM' where PersonelID =3


------------------------------------------------------------------------------------------------------------------
--==============================DDL TRIGGERLAR================================
--Create alter drop i�lemleri s�ncuunda veya s�recinde devreye girecek olan yap�lard�r

create trigger DDL_Trigger
on Database
for drop_table,alter_table,create_function,create_procedure,drop_procedure --vs.vs
as
print 'Bu i�lem ger�ekle�tirilemez'
rollback --yap�lan i�lemleri geri al�r

drop table LogTablosu


--Trigger� devre d��� b�rakma
Disable trigger [OrnekTrigger] on Personeller


--Trigger aktifle�tirme
enable Trigger [OrnekTrigger] ON Personeller

--Dikkat!! DDL tirggerlara ilgili veritaban�n�n Programability --> database Triggers dan ula�abilirim