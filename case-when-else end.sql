--Case -when -else -end

--personellerin isim ve soyisim yanýna ünvan eki "Mr." ise erkek, "ms " ise kadýn yazsýn

select Adi,SoyAdi,UnvanEki
from Personeller


select Adi,SoyAdi,
case 
when UnvanEki='Mrs'or UnvanEki='Ms.' then 'Kadýn'--mrs veya ms ise kadýn yaz
when UnvanEki='Mr.' then 'Erkek'--mr. ise erkek yaz
else UnvanEki -- bunlardan biri deðilse direkt ünvan ekini yaz
end
from Personeller

--Eðer ürünün birim fiyatý 0-50 arasýndaysa dandik 50-100 arasndaysa ucuz 100-200 arasýydsa normal 200 den fazla ise pahalý yazdýrýcaz

select 
UrunID,
case
when BirimFiyati between 0 and 50 then 'DANDÝK'
when BirimFiyati >50 and BirimFiyati<100 then 'UCUZ'
WHEN BirimFiyati between 100 and 200 then 'Normak'
when BirimFiyati >200 then 'AÞIRI PAHALI'
else
'Belirsiz fiyart'
end

from Urunler