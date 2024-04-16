--Null kontrol Mekanizmalarý

--case when then end kalýbý ile null kontrolü
 select MusteriAdi,Bolge
 from Musteriler

 select MusteriAdi,
 case 
	when Bolge is null then 'Null deðiþti' -- is null demek nul ise demek is not null ise null deðilse deðiþtir demek
	else Bolge
 end
 from Musteriler

 --Coalesce Fonksiyonu

 select MusteriAdi,Coalesce(Bolge,'Nullll deðiþtiii')
 from Musteriler

 --Isnull Fonksiyonu ile null kontrolü
 select MusteriAdi, ISNULL(Bolge,'null deðiþti')
 from Musteriler

 --Nullif ile null kontrolu