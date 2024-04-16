--subquery (iç içe sorgular)

select s.SatisID,s.SatisTarihi from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID where Adi ='Nancy'
--Aþaðýdaki ile yukarýdaki ayný çýktýyý verir/// where personelID den sonra demek istediðim sorgu personeller tablosunda personelId kolonunda adý nancy olaný getir dedim ve o çýktýyý PersonelId ye eþitledim çünkü nancy nin ýd sini bilmiyordum ve bu þekilde bana id sini getirmiþ oldum

select SatisID,SatisTarihi from Satislar  WHERE PersonelID = (select PersonelID from Personeller where Adi='Nancy')

select Adi from Personeller where UnvanEki ='Dr.'

select * from Personeller where Adi= (select Adi from Personeller where UnvanEki ='Dr.')

--Dikkat edilmesi gereken nokta içerideki sorgunun tek satýrlýk bir veri getirmesi gerekir