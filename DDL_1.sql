--DDL (DATA DEFİNİTİON LANGUAGE)

--Prototipi 
--Create [Database(Nesne)] [nesnenin adı]

--Create ile database oluşturma
use Northwind_turkce
create database OrnekVeriTabanı --Varsayılan ayarlar ile database i oluşturur




--------Create ile tablo oluşturma

use OrnekVeriTabanı
create table OrnekTablo
(
	kolon1 int,
	kolon2 nvarchar(max),
	[kolon 3] money

)

--Kolona primary key ve identity özelliği kazandırma

Create table OrnekTablo2
(
	id int primary key  identity(1,1),
	[Kolon 2] nvarchar
)





--ben ayalrar yapmak istiyorsam eğer

create database OrnekVeriTabanı
on
(
	Name='Furkan',
	filename='C:\TEST\Furkan.mdf', ----------------------ÇALIŞTIRAMADIM SONRA TEKRARDAN GERİYE DÖN VE BAK
	size=5,      
	filegrowth=3 
)

--------Create ile Log dostası olşturma
create database OrnekVeriTabanı1
on
(
	Name='GG',
	filename='C:\TEST',
	size=5,
	filegrowth=3 
)
Log												----------------------ÇALIŞTIRAMADIM SONRA TEKRARDAN GERİYE DÖN VE BAK
on
(
	Name='GG_LOG',
	FileName='C:\TEST\Furkan.ldf',
	size=5,
	filegrowth=3 
)












--------------------------------------------------------------------------------------
--------------------			Murat yücedağ					---------------------------------

-------------------------------------------------------------------------------------

use okulum
create table ogrenci
(
	ogrno int not null primary key,
	ogradi varchar(15),
	ogrsoyadi varchar(20),
	ogradres varchar(50),
	ogrsinif varchar (2),
	ogrilce varchar(20) default 'Seyhan',
	ogrsinav1 tinyint check (ogrsinav1>0),
	ogrsinav2 int,
	constraint chks2 check (ogrsinav2>=0 and ogrsinav2<=100),
	ogrkol varchar(20),
	constraint chkkol check (ogrkol in ('saglik','kutuphane','cevre','trafil'))

)


alter table ogrenci add devamsizlik tinyint,


--------------------------------------------------------------------------------------
--------------------			Murat yücedağ					---------------------------------

-------------------------------------------------------------------------------------












