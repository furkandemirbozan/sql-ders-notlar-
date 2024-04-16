

---------------Alter--------------
--Nesneyi g�ncelleyece�imiz zaman kullan�l�r

alter database [OrnekVeriTaban�]
modify file
(
	Name='Furkan',		
	Size=20
)

--Alter ile Kolon ekleme

alter table [dbo].[OrnekTablo]
add Kolon4 nvarchar(max)   --Kolo ekledim

--Alter ile kolon g�ncelleme
alter table [dbo].[OrnekTablo]
alter column Kolon4 int    --nvarchar olan kolonu int olarak de�i�tirdim

--Alter ile tablodaki kolonu silme

alter table OrnekTablo
drop column Kolon4


--Alter ile tabloya Constraint ekleme

alter table OrnekTablo
add Constraint OrnekConstraint default 'Bo�' for Kolon2

--Alter ile Constraint silme
alter table OrnekTablo
drop Constraint OrnekConstraint

--SP_RENAME ile tablo ad�n� g�ncelleme

SP_RENAME 'OrnekTablo','OrnekTabloYeni'

--SP_RENAME �LE KOLON G�NCELLEME

SP_RENAME'OrnekTabloYeni.kolon1','YENIKOLON','Column'


-----------Drop komutu

--create ile olu�turulan veritaban� nesnelerini silmemize yarar

--Drop [Nesne] [Nesne ADI]

DROP TABLE OrnekTabloYeni

Drop database OrnekVeriTaban�