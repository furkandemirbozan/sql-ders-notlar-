use Northwind_turkce

--Like sorgularý

--%(Genel önemli deðil Operatörü)
select Adi,SoyAdi from Personeller where Adi like 'j%'--j ile baþlýcak gerisi önemli deðil demek

select Adi,SoyAdi from Personeller where Adi like '%y' --y ile biticek öncesi önemli deðil

select Adi,SoyAdi from Personeller where Adi like 'r%t'--r ile baþlýcak t ile biticek ortasý önemli deðil

select Adi,SoyAdi from Personeller where Adi like '%an%'--isminin içinde an geçecek baþý ve sonu önemli olmayacak

--isminin ilk harfi a, ikinci harfi fark etmez ve üçüncü harfi d olan personeli getir
select *from Personeller where Adi like 'a_d%'

--[] ==> yada operatörü
select * from Personeller where Adi like '[nm]%'--isminin ilk harfi n yada m olacak geri kalaný önemki deðil

select * from Personeller where Adi like '%[ai]%'--baþý ve sonu önemli deðil içerisinde a yada i geçen personelleri getir

--[*-*] Alfabetik arasýnda operatörü
--isminin baþ harfi a yada k arasýnda alfabetik sýraya göre herhangi bir harf olan personellerin adýný getir
select Adi from Personeller where Adi like '[a-z]%'

--[^*]==> deðil operatörü
--isminin baþ harfi a olmayan personelleri getir

select * from Personeller where Adi like '[^a]%'

select * from Personeller where Adi like '[^an]%'