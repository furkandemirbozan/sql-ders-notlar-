--Null kontrol Mekanizmalar�

--case when then end kal�b� ile null kontrol�
 select MusteriAdi,Bolge
 from Musteriler

 select MusteriAdi,
 case 
	when Bolge is null then 'Null de�i�ti' -- is null demek nul ise demek is not null ise null de�ilse de�i�tir demek
	else Bolge
 end
 from Musteriler

 --Coalesce Fonksiyonu

 select MusteriAdi,Coalesce(Bolge,'Nullll de�i�tiii')
 from Musteriler

 --Isnull Fonksiyonu ile null kontrol�
 select MusteriAdi, ISNULL(Bolge,'null de�i�ti')
 from Musteriler

 --Nullif ile null kontrolu