--Uniqueidentifier Veri tipi
--int,varchar cs. g,ibi bir veri tipidir
--Aldýðý deðer ,rakamlar ve harflerden oluþan ve çok büyük bir sayýdýr
--Bundan dolayý bu kolona ayný deðerin birden faza gelmesi neredetse imkansýzdýr
--O yüzden tekil bir veri oluþturmak için kullanýlýr

use Northwind_turkce
create table OrnekTablo1
(
	Id int primary key identity,
	Kolon1 nvarchar(max),
	Kolon2 nvarchar(max),
	Kolon3 uniqueidentifier
)

--Newid fonksiyonu
select newid() -- uniqueidentifier tipinde bir fonksitodur ve kendini asla tekrar etmez çok büyük bir veri tipidir
insert OrnekTablo1 values ('x','y', newid())