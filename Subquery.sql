--subquery (i� i�e sorgular)

select s.SatisID,s.SatisTarihi from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID where Adi ='Nancy'
--A�a��daki ile yukar�daki ayn� ��kt�y� verir/// where personelID den sonra demek istedi�im sorgu personeller tablosunda personelId kolonunda ad� nancy olan� getir dedim ve o ��kt�y� PersonelId ye e�itledim ��nk� nancy nin �d sini bilmiyordum ve bu �ekilde bana id sini getirmi� oldum

select SatisID,SatisTarihi from Satislar  WHERE PersonelID = (select PersonelID from Personeller where Adi='Nancy')

select Adi from Personeller where UnvanEki ='Dr.'

select * from Personeller where Adi= (select Adi from Personeller where UnvanEki ='Dr.')

--Dikkat edilmesi gereken nokta i�erideki sorgunun tek sat�rl�k bir veri getirmesi gerekir