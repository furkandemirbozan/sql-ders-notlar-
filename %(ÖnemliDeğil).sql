use Northwind_turkce

--Like sorgular�

--%(Genel �nemli de�il Operat�r�)
select Adi,SoyAdi from Personeller where Adi like 'j%'--j ile ba�l�cak gerisi �nemli de�il demek

select Adi,SoyAdi from Personeller where Adi like '%y' --y ile biticek �ncesi �nemli de�il

select Adi,SoyAdi from Personeller where Adi like 'r%t'--r ile ba�l�cak t ile biticek ortas� �nemli de�il

select Adi,SoyAdi from Personeller where Adi like '%an%'--isminin i�inde an ge�ecek ba�� ve sonu �nemli olmayacak

--isminin ilk harfi a, ikinci harfi fark etmez ve ���nc� harfi d olan personeli getir
select *from Personeller where Adi like 'a_d%'

--[] ==> yada operat�r�
select * from Personeller where Adi like '[nm]%'--isminin ilk harfi n yada m olacak geri kalan� �nemki de�il

select * from Personeller where Adi like '%[ai]%'--ba�� ve sonu �nemli de�il i�erisinde a yada i ge�en personelleri getir

--[*-*] Alfabetik aras�nda operat�r�
--isminin ba� harfi a yada k aras�nda alfabetik s�raya g�re herhangi bir harf olan personellerin ad�n� getir
select Adi from Personeller where Adi like '[a-z]%'

--[^*]==> de�il operat�r�
--isminin ba� harfi a olmayan personelleri getir

select * from Personeller where Adi like '[^a]%'

select * from Personeller where Adi like '[^an]%'