----------------------------TABLOLARI YAN YANA B�RLE�T�RME-------------------------

SELECT*FROM Personeller
SELECT*FROM Satislar

SELECT * FROM Personeller,Satislar -- BU ��LEM �K� TABLOYU B�RLE�T�R�YOR ANCAK B�Y�K OLAN TABLO �LE K���K OLAN TABLO B�RL��T��� ���N AZ OLAN TABLODA NULL DE�ER� G�R�R�M ��NK� O TABLO VER�S� DAHA KISADIR

SELECT Adi FROM Personeller,Satislar --Adi kolonu persolellerde var ve sat��larda yok o y�zden �al���r ancak her ikisinde de olan bir kolonu �a��rsayd�m hata al�rd�m

 select PersonelID from Personeller,Satislar -- personle�d her ikisinde de oldu�u i�in hangisinden �ekece�ini bilemedi�i i�in hata alacakt�m

 --hangi tablodaki persole�d yi �ekece�ini bilemedi�i i�in ��yle yaparsaaam

 select Personeller.PersonelID, Satislar.MusteriID from Personeller,Satislar--personeller tablosundan personelID yi �ek demi� oldum yada sat��lar tablosundan MusteriID i �ek demi� oldum


 --Daha k�sa ve kolay kullan���
 select p.PersonelID, s.MusteriID from Personeller p,Satislar s

 ----------------------------WHERE KOMUTU �LE KULLANIMI---

  select p.PersonelID, s.MusteriID from Personeller p,Satislar s where p.PersonelID = s.SatisID -- personel taplosundaki(p) personel �d ile sat��lar tablosundaki(s) satisId yi e�it olanlar� getir demi� oldum