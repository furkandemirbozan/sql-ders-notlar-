--Uniqueidentifier Veri tipi
--int,varchar cs. g,ibi bir veri tipidir
--Ald��� de�er ,rakamlar ve harflerden olu�an ve �ok b�y�k bir say�d�r
--Bundan dolay� bu kolona ayn� de�erin birden faza gelmesi neredetse imkans�zd�r
--O y�zden tekil bir veri olu�turmak i�in kullan�l�r

use Northwind_turkce
create table OrnekTablo1
(
	Id int primary key identity,
	Kolon1 nvarchar(max),
	Kolon2 nvarchar(max),
	Kolon3 uniqueidentifier
)

--Newid fonksiyonu
select newid() -- uniqueidentifier tipinde bir fonksitodur ve kendini asla tekrar etmez �ok b�y�k bir veri tipidir
insert OrnekTablo1 values ('x','y', newid())