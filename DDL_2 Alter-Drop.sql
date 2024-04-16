

---------------Alter--------------
--Nesneyi güncelleyeceðimiz zaman kullanýlýr

alter database [OrnekVeriTabaný]
modify file
(
	Name='Furkan',		
	Size=20
)

--Alter ile Kolon ekleme

alter table [dbo].[OrnekTablo]
add Kolon4 nvarchar(max)   --Kolo ekledim

--Alter ile kolon güncelleme
alter table [dbo].[OrnekTablo]
alter column Kolon4 int    --nvarchar olan kolonu int olarak deðiþtirdim

--Alter ile tablodaki kolonu silme

alter table OrnekTablo
drop column Kolon4


--Alter ile tabloya Constraint ekleme

alter table OrnekTablo
add Constraint OrnekConstraint default 'Boþ' for Kolon2

--Alter ile Constraint silme
alter table OrnekTablo
drop Constraint OrnekConstraint

--SP_RENAME ile tablo adýný güncelleme

SP_RENAME 'OrnekTablo','OrnekTabloYeni'

--SP_RENAME ÝLE KOLON GÜNCELLEME

SP_RENAME'OrnekTabloYeni.kolon1','YENIKOLON','Column'


-----------Drop komutu

--create ile oluþturulan veritabaný nesnelerini silmemize yarar

--Drop [Nesne] [Nesne ADI]

DROP TABLE OrnekTabloYeni

Drop database OrnekVeriTabaný