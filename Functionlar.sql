--Function===========> Scalar Function   ---  Inline Function

--Scalar Function ======> geriye istediðimiz tipte deðer gönderen foksiyonlardýr
--Inline Function ======> Geriye Tablo gönderen fonksiyonlardýr

--Bu her iki fonksiyonda fiziksel olarak veritabanýnda oluþturulmaktadýr
--Create komutu ile oluþturulur


--=========================Scalar Function======================================
--Scalar  Fonksiyonu tanýmladýktan sonra Programmability -> Functions -> Scalar valued fýnctions kombinasyonlarýndan eriþebilirim. Fonskiyone sað týk ve modify dedikte sonra kaynak kodlarýna eriþebiliyorum

create function Topla (@sayi1 int , @sayi2 int) Returns int
as
	begin
		return @sayi1+ @sayi2
	end

--Scalar fonksiyonu kullaným
select dbo.Topla(2,5)--dbo kesinlikle kullanmam gerekiyor

--Örnek
--[Northwind_turkce] VERÝTABANINDA  herhangi bir ürünün %18 kdv dahil olmak üzere toplam maliyetini getiren fonksionu yazalým

create Function Maliyet(@BirimFiyati int ,@StokMiktari int) Returns nvarchar(max)
as
	begin
		declare @sonuc int = @BirimFiyati * @StokMiktari*1.18
		return @sonuc
	end

select dbo.Maliyet(10,20)--Dikkat dbo ile çaðýrdým


--2. Inline Function 
--Geriye bir deðer deðil tablo gönderen fonksiyondur
--Geriye tablo gönderecepi için bu fonksiyonlar çalýþtýrýlýrken sanki bir tablodan sorgu ççalýþtýrýr gibi çalýþtýrýrlarBu yönleriyle view lere benzerler.View ile yapýlan iþlemler inline function ile de yapýlabilir
--Genellikle view e benzer iþlevler için view kullanýlmasý önerilir

--=======Fonksiyon tanýmlama
--Tanýmlandýktan sonra Programability ->Function -> Table valued Function kombinasyonlarýyla eriþebilinir 
--Inline fonksiyon kullanýrken begin end yyapýsý kullanýlmaz

create Function fc_Gonder(@Ad nvarchar(20),@Sooyad nvarchar(20)) Returns Table
as
	return select Adi,Soyadi from Personeller where Adi =@Ad and SoyAdi =@Sooyad

--Fonksiyon kullanýmý
Select * from fc_Gonder('Nancy','Davolio') --Tabloya sorgu atar gibi yazýyoruz


--Detay 
--With encryption komutunu kullanýrsam View de ki gibi o komuta tekrardan bir daha eriþemem ve geri dönüþü yoktur

--Örnek ama çalýþtýrmýcam
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

--Örnek
--Çýktý olarak "____ kategorisindeki ___ ürününün toplam fiyqatý :  ___ dir" Þeklinde çýktý veren bir fonksiyon yazalým

create Function Rapor (@Kategori nvarchar(max),@UrunAdi nvarchar(max),@BirimFiyati int,@Stok int) Returns nvarchar(max)
as
	begin
		Declare @Cikti nvarchar(max)=@Kategori+'kategorisindeki'++@UrunAdi+'Ürünün toplam fiyatý : '+cast(@BirimFiyati*@Stok as nvarchar(max))+'dir'
		return @Cikti
	end

select dbo.Rapor (k.KategoriAdi ,u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi)
from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID