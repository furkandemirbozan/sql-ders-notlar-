use Northwind_turkce

--ESCAPE

select *from Personeller where Adi like '_%'--bunu yaparsam ilk harfi ve gerisi �nemli olmayan personeli hgetir demi� olurum

--ancdak veririn i�inde �zel �zel karakterler varsa �rne�in _ ile ba�l�yorsa 

--ya

select *from Personeller where Adi like '[_]%' --derim ve ba� harfi _ olan� getir demi� olurum

--yadaa
select*from Personeller where Adi like '_%' Escape '_' --dersem ka��� karakterimi s�ylemi� olurum