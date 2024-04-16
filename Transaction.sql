--Transaction
--Birden çok iþlemin bir arada yapýldýðý durumlarda eðer parçayý oluþturan iþlemlerden herhangi birinde sorun olursa tüm iþlemi iptal ettirmeye yarar.

--Örneðin; kredi kartý ile alýþveriþ iþlemlerinde transaction iþlemi vardýr. Siz marketten ürün alýrken sizin hesabýnýzdan para düþülecek, marketin hesabýna aktarýlacaktýr. Bu iþlemde hata olmamasý gerekir ve bundan dolayý bu iþlem bir transaction bloðunda gerçekleþtirilmelidir. Bu esnada herhangi bir sorun olursa bütün iþlemler transaction tarafýndan iptal edilebilecektir.

--Begin Tran veya Begin Transaction: Transaction iþlemi baþlatýr.

--Commit Tran: Transaction iþlemini baþarýyla sona erdirir. Ýþlem(ler)i gerçekleþtirir.

--Rollback Tran: Transaction iþlemini iptal eder. Ýþlem(ler)i geri alýr.

--Commit Tran yerine sadece Commit yazýlabilir.

--Rollback Tran yerine sadece Rollback yazýlabilir.

--Normalde default olarak her þey Begin Tran ile baþlayýp Commit Tran ile biter!!! Biz bu yapýlarý kullanmasak bile!!!


---------Transaction Tanýmlama
--Prototip
--Begin Tran [Transaction Adý]
--Ýþlemler

Insert Bolge values (5,'Çorum')--Varsayýlan olarak tran kontrolünde bir iþlemdir.Netice olarak gene varsayýlan oalrak commit tran olarak bitmektedir

begin tran Kontrol --Ýsim vermek zorunda deðilim
Insert Bolge values (5,'Çorum')
Commit tran 




--Örnek
begin tran Kontrol
declare @i int 
delete from Personeller where PersonelID >20
set @i =@@ROWCOUNT
if @i =1
begin
	print'Kayýt silindi'
	Commit
end
else 
begin
	print'Ýþlemler geri alýndý'
	rollback
end

--121. video da Banka örneði var daha sonra onnu yap