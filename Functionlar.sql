--Function===========> Scalar Function   ---  Inline Function

--Scalar Function ======> geriye istedi�imiz tipte de�er g�nderen foksiyonlard�r
--Inline Function ======> Geriye Tablo g�nderen fonksiyonlard�r

--Bu her iki fonksiyonda fiziksel olarak veritaban�nda olu�turulmaktad�r
--Create komutu ile olu�turulur


--=========================Scalar Function======================================
--Scalar  Fonksiyonu tan�mlad�ktan sonra Programmability -> Functions -> Scalar valued f�nctions kombinasyonlar�ndan eri�ebilirim. Fonskiyone sa� t�k ve modify dedikte sonra kaynak kodlar�na eri�ebiliyorum

create function Topla (@sayi1 int , @sayi2 int) Returns int
as
	begin
		return @sayi1+ @sayi2
	end

--Scalar fonksiyonu kullan�m
select dbo.Topla(2,5)--dbo kesinlikle kullanmam gerekiyor

--�rnek
--[Northwind_turkce] VER�TABANINDA  herhangi bir �r�n�n %18 kdv dahil olmak �zere toplam maliyetini getiren fonksionu yazal�m

create Function Maliyet(@BirimFiyati int ,@StokMiktari int) Returns nvarchar(max)
as
	begin
		declare @sonuc int = @BirimFiyati * @StokMiktari*1.18
		return @sonuc
	end

select dbo.Maliyet(10,20)--Dikkat dbo ile �a��rd�m


--2. Inline Function 
--Geriye bir de�er de�il tablo g�nderen fonksiyondur
--Geriye tablo g�nderecepi i�in bu fonksiyonlar �al��t�r�l�rken sanki bir tablodan sorgu ��al��t�r�r gibi �al��t�r�rlarBu y�nleriyle view lere benzerler.View ile yap�lan i�lemler inline function ile de yap�labilir
--Genellikle view e benzer i�levler i�in view kullan�lmas� �nerilir

--=======Fonksiyon tan�mlama
--Tan�mland�ktan sonra Programability ->Function -> Table valued Function kombinasyonlar�yla eri�ebilinir 
--Inline fonksiyon kullan�rken begin end yyap�s� kullan�lmaz

create Function fc_Gonder(@Ad nvarchar(20),@Sooyad nvarchar(20)) Returns Table
as
	return select Adi,Soyadi from Personeller where Adi =@Ad and SoyAdi =@Sooyad

--Fonksiyon kullan�m�
Select * from fc_Gonder('Nancy','Davolio') --Tabloya sorgu atar gibi yaz�yoruz


--Detay 
--With encryption komutunu kullan�rsam View de ki gibi o komuta tekrardan bir daha eri�emem ve geri d�n��� yoktur

--�rnek ama �al��t�rm�cam
create Function OrnekFonksiyon()returns int
with encryption
as
	begin
		return 3
	end

create Function OrnekFonksiyon2()returns Table
with encryption
as
	return select*from Personeller


--================Fonkisyonlarda Otomatik Hesaplanabilir Kolonlar - Computed Column ===
--Herhangi bir kolonda fonksiyon kullanarak otomatik hesaplanabilir kolonlar

create function Topla(@Sayi1 int ,@Sayi2 int) Returns int 
as
begin
	return @Sayi1+@Sayi2
end

select UrunAdi,dbo.Topla(BirimFiyati,HedefStokDuzeyi) from Urunler

--�rnek
--��kt� olarak "____ kategorisindeki ___ �r�n�n�n toplam fiyqat� :  ___ dir" �eklinde ��kt� veren bir fonksiyon yazal�m

create Function Rapor (@Kategori nvarchar(max),@UrunAdi nvarchar(max),@BirimFiyati int,@Stok int) Returns nvarchar(max)
as
	begin
		Declare @Cikti nvarchar(max)=@Kategori+'kategorisindeki'++@UrunAdi+'�r�n�n toplam fiyat� : '+cast(@BirimFiyati*@Stok as nvarchar(max))+'dir'
		return @Cikti
	end

select dbo.Rapor (k.KategoriAdi ,u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi)
from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID