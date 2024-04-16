--Transaction
--Birden �ok i�lemin bir arada yap�ld��� durumlarda e�er par�ay� olu�turan i�lemlerden herhangi birinde sorun olursa t�m i�lemi iptal ettirmeye yarar.

--�rne�in; kredi kart� ile al��veri� i�lemlerinde transaction i�lemi vard�r. Siz marketten �r�n al�rken sizin hesab�n�zdan para d���lecek, marketin hesab�na aktar�lacakt�r. Bu i�lemde hata olmamas� gerekir ve bundan dolay� bu i�lem bir transaction blo�unda ger�ekle�tirilmelidir. Bu esnada herhangi bir sorun olursa b�t�n i�lemler transaction taraf�ndan iptal edilebilecektir.

--Begin Tran veya Begin Transaction: Transaction i�lemi ba�lat�r.

--Commit Tran: Transaction i�lemini ba�ar�yla sona erdirir. ��lem(ler)i ger�ekle�tirir.

--Rollback Tran: Transaction i�lemini iptal eder. ��lem(ler)i geri al�r.

--Commit Tran yerine sadece Commit yaz�labilir.

--Rollback Tran yerine sadece Rollback yaz�labilir.

--Normalde default olarak her �ey Begin Tran ile ba�lay�p Commit Tran ile biter!!! Biz bu yap�lar� kullanmasak�bile!!!


---------Transaction Tan�mlama
--Prototip
--Begin Tran [Transaction Ad�]
--��lemler

Insert Bolge values (5,'�orum')--Varsay�lan olarak tran kontrol�nde bir i�lemdir.Netice olarak gene varsay�lan oalrak commit tran olarak bitmektedir

begin tran Kontrol --�sim vermek zorunda de�ilim
Insert Bolge values (5,'�orum')
Commit tran 




--�rnek
begin tran Kontrol
declare @i int 
delete from Personeller where PersonelID >20
set @i =@@ROWCOUNT
if @i =1
begin
	print'Kay�t silindi'
	Commit
end
else 
begin
	print'��lemler geri al�nd�'
	rollback
end

--121. video da Banka �rne�i var daha sonra onnu yap