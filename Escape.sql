use Northwind_turkce

--ESCAPE

select *from Personeller where Adi like '_%'--bunu yaparsam ilk harfi ve gerisi önemli olmayan personeli hgetir demiþ olurum

--ancdak veririn içinde özel özel karakterler varsa örneðin _ ile baþlýyorsa 

--ya

select *from Personeller where Adi like '[_]%' --derim ve baþ harfi _ olaný getir demiþ olurum

--yadaa
select*from Personeller where Adi like '_%' Escape '_' --dersem kaçýþ karakterimi söylemiþ olurum