--DDL (DATA DEF�N�T�ON LANGUAGE)

--Prototipi 
--Create [Database(Nesne)] [nesnenin ad�]

--Create ile database olu�turma
use Northwind_turkce
create database OrnekVeriTaban� --Varsay�lan ayarlar ile database i olu�turur




--------Create ile tablo olu�turma

use OrnekVeriTaban�
create table OrnekTablo
(
	kolon1 int,
	kolon2 nvarchar(max),
	[kolon 3] money

)

--Kolona primary key ve identity �zelli�i kazand�rma

Create table OrnekTablo2
(
	id int primary key  identity(1,1),
	[Kolon 2] nvarchar
)





--ben ayalrar yapmak istiyorsam e�er

create database OrnekVeriTaban�
on
(
	Name='Furkan',
	filename='C:\TEST\Furkan.mdf', ----------------------�ALI�TIRAMADIM SONRA TEKRARDAN GER�YE D�N VE BAK
	size=5,      
	filegrowth=3 
)

--------Create ile Log dostas� ol�turma
create database OrnekVeriTaban�1
on
(
	Name='GG',
	filename='C:\TEST',
	size=5,
	filegrowth=3 
)
Log												----------------------�ALI�TIRAMADIM SONRA TEKRARDAN GER�YE D�N VE BAK
on
(
	Name='GG_LOG',
	FileName='C:\TEST\Furkan.ldf',
	size=5,
	filegrowth=3 
)












--------------------------------------------------------------------------------------
--------------------			Murat y�ceda�					---------------------------------

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
--------------------			Murat y�ceda�					---------------------------------

-------------------------------------------------------------------------------------












