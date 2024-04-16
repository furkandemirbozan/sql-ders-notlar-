----------------------------TABLOLARI YAN YANA BÝRLEÞTÝRME-------------------------

SELECT*FROM Personeller
SELECT*FROM Satislar

SELECT * FROM Personeller,Satislar -- BU ÝÞLEM ÝKÝ TABLOYU BÝRLEÞTÝRÝYOR ANCAK BÜYÜK OLAN TABLO ÝLE KÜÇÜK OLAN TABLO BÝRLÝÞTÝÐÝ ÝÇÝN AZ OLAN TABLODA NULL DEÐERÝ GÖRÜRÜM ÇÜNKÜ O TABLO VERÝSÝ DAHA KISADIR

SELECT Adi FROM Personeller,Satislar --Adi kolonu persolellerde var ve satýþlarda yok o yüzden çalýþýr ancak her ikisinde de olan bir kolonu çaðýrsaydým hata alýrdým

 select PersonelID from Personeller,Satislar -- personleýd her ikisinde de olduðu için hangisinden çekeceðini bilemediði için hata alacaktým

 --hangi tablodaki persoleýd yi çekeceðini bilemediði için þöyle yaparsaaam

 select Personeller.PersonelID, Satislar.MusteriID from Personeller,Satislar--personeller tablosundan personelID yi çek demiþ oldum yada satýþlar tablosundan MusteriID i çek demiþ oldum


 --Daha kýsa ve kolay kullanýþý
 select p.PersonelID, s.MusteriID from Personeller p,Satislar s

 ----------------------------WHERE KOMUTU ÝLE KULLANIMI---

  select p.PersonelID, s.MusteriID from Personeller p,Satislar s where p.PersonelID = s.SatisID -- personel taplosundaki(p) personel ýd ile satýþlar tablosundaki(s) satisId yi eþit olanlarý getir demiþ oldum