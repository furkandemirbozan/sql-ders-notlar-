--Triggers(Tetikleyiciler)

--Dml Trigger
--Bir tabloda Insert Update Delete işlemleri gerçekleştirildiğinde devreye giren yapılardır
--Bu işlemler sonucunda vetya sürecinde devreye girerler

---DDL Trigger
--Create Alter Drop işlmeleri sonucunda veya sürecinde decreye girecek olan yapılardır 

--Prototip
--Create Trigger [Trigger adı]
--on [İşlem yapılacak tablo adı]
--after veya for delete,update,insert
--as
--[Kodlar]

Create trigger OrnekTrigger
on Personeller
after insert
as											
select*from Personeller					--Bu trigger insert işlemi ile beraber select*from personeller işlemini çalıştırıyor

Insert Personeller (Adi,SoyAdi) values('deniz','Gezmiş')

--Ornek 1 
--tedarikçiler Tablosundan bir veri silindiğinde tüm ürünlerin fiatı otomatik olarak 10 artsın

create Trigger triggerTedarikçiler
on Tedarikciler
after delete
as
update Urunler set BirimFiyati = BirimFiyati + 10
Select*from Urunler


delete from Tedarikciler where TedarikciID = 33

--Yukarıdaki işlem şu demek tedarikçiId silindiğinde urunler Tablosudaki birim fiyatını 10 arttıracak vev o tabloyu bana getrirecek ollan tetikleyicidir



--Ornek2
--Tedarikçiler tablosundaki bir veri güncellendiğinde kategoriler tablosunda "meyve kokteyli" adında bir kategri oluştsun


create trigger trgTedarikciGuncellendiginde
on Tedarikciler
for update
as
insert Kategoriler(KategoriAdi) values ('Meyve Kokteyli')


Update Tedarikciler set MusteriAdi = 'Hilmi' where TedarikciID =30
select*From Kategoriler


--Ornek 3 
--personeller tablosundan bir kayıt silindiğinde silinen kaydın adı soyadı kim tarafıından ve hangi tarihte silindiği başka bir tabloya kayıt edilsin bir nevi log tablosu misali


Create table LogTablosu
(
	Id int primary key identity(1,1),
	Rapor nvarchar(max)
)

Create Trigger triggerPersoneller
on Personeller
after delete
as
declare @adi nvarchar(max),@soyadı nvarchar(max)
select @adi=Adi,@soyadı=SoyAdi from deleted
insert LogTablosu values ('Adı ve soyadı ' +@adi+'olan personel'+SUSER_NAME()+'Tarafından'+CAST(GETDATE()as nvarchar(max))+'tarihinde silinmiştir')

delete From Personeller where PersonelID=31 -- BU işlem her yapıldığında benim açtığım log tablosunda işlem kayıt edilir ve tetiklenir




--Ornek4
--Personeller tablosunda update gerçekleştiği anda devreye giren bir log tablosuna "adı---- olan personel ---- yeni adıyla değiştirilerek ------ kullanıcı tarafından--- tarihinde güncellendi " kalıbında rapor yazan bir trigger yazalım

Create trigger trgPersonellerRapor
on Personeller
after update
as
declare @EskiAdi nvarchar(max),@YeniAdi nvarchar(max)
select @EskiAdi =Adi from deleted
select @YeniAdi = Adi from inserted
insert LogTablosu values ('Adı'+@EskiAdi + 'OLAN PERSONEL'+@YeniAdi+'Yeni Adıyla değiştirilerek'+SUSER_NAME()+'Kullanıcısı tarafından '+CAST(GETDATE()as nvarchar(max))+'Tarihinde GÜNCELLENDİ')


Update Personeller set Adi= 'CEM' WHERE PersonelID=3


---------------------------------------------------------------
--===============Multiple Action Trigger====
create trigger MultiTrigger
on Personeller
after delete,insert
as
print 'Merhaba'


Insert Personeller(Adi,SoyAdi) values ('Gencay','Yıldız')
delete from Personeller where PersonelID=11

--Buraya kadaryaptığım işlemler bir işlem yaptığımda başka bir işlemin tekiklenmesiydi 
--Örneğin update işlemi yaparken yanında şu işlemide yap dedim

--===============Instead of treigger ========
--Bu işlem ise yanında yap demek değil YERİNE YAP DEMEK
--ÖRNEĞİN bir tabloya ekleme işlemi yapmaya çalıştıüımda onu değil benim yazdığım trigger ı yap demek


--Ornek1
--Personeller tablosunda update gerçekleştiği anda yapıalcak güncelleme yerine bir log tablosunda "Adı____olan personel ___yeni adıyla değiştirilerek _____Kullanıcı tarafından ___Tarihinde güncellenmek istendi"kalıbında rapor yazan triggerı yaz

Create trigger trgPersonellerRaporInstead
on Personeller
Instead of update
as
declare @EskiAdi nvarchar(max),@YeniAdi nvarchar(max)
select @EskiAdi =Adi from deleted
select @YeniAdi = Adi from inserted
insert LogTablosu values ('Adı'+@EskiAdi + 'OLAN PERSONEL'+@YeniAdi+'Yeni Adıyla değiştirilerek'+SUSER_NAME()+'Kullanıcısı tarafından '+CAST(GETDATE()as nvarchar(max))+'Tarihinde GÜNCELLENMEK İSTENDİİİİİ!!!!!!')

update Personeller set Adi ='CEM' where PersonelID =3


------------------------------------------------------------------------------------------------------------------
--==============================DDL TRIGGERLAR================================
--Create alter drop işlemleri sıncuunda veya sürecinde devreye girecek olan yapılardır

create trigger DDL_Trigger
on Database
for drop_table,alter_table,create_function,create_procedure,drop_procedure --vs.vs
as
print 'Bu işlem gerçekleştirilemez'
rollback --yapılan işlemleri geri alır

drop table LogTablosu


--Triggerı devre dışı bırakma
Disable trigger [OrnekTrigger] on Personeller


--Trigger aktifleştirme
enable Trigger [OrnekTrigger] ON Personeller

--Dikkat!! DDL tirggerlara ilgili veritabanının Programability --> database Triggers dan ulaşabilirim