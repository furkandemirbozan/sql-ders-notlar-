--Case -when -else -end

--personellerin isim ve soyisim yan�na �nvan eki "Mr." ise erkek, "ms " ise kad�n yazs�n

select Adi,SoyAdi,UnvanEki
from Personeller


select Adi,SoyAdi,
case 
when UnvanEki='Mrs'or UnvanEki='Ms.' then 'Kad�n'--mrs veya ms ise kad�n yaz
when UnvanEki='Mr.' then 'Erkek'--mr. ise erkek yaz
else UnvanEki -- bunlardan biri de�ilse direkt �nvan ekini yaz
end
from Personeller

--E�er �r�n�n birim fiyat� 0-50 aras�ndaysa dandik 50-100 arasndaysa ucuz 100-200 aras�ydsa normal 200 den fazla ise pahal� yazd�r�caz

select 
UrunID,
case
when BirimFiyati between 0 and 50 then 'DAND�K'
when BirimFiyati >50 and BirimFiyati<100 then 'UCUZ'
WHEN BirimFiyati between 100 and 200 then 'Normak'
when BirimFiyati >200 then 'A�IRI PAHALI'
else
'Belirsiz fiyart'
end

from Urunler