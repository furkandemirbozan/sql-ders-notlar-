use OrnekVT

--Outer Join 
--Inner Joinde e�le�en kay�tlar� getiriyordu .E�le�meyen kay�tlar� getirmiyordu

----------------LEFT JO�N-------------
--Soldakilerin hepsini getirecek sa�daki e�le�enleri getirecek e�leimeyenleri ise null getiricek


select *from Oyuncular o left join Filmler f on o.FilmID=f.FilmId

select*from Filmler f left join Oyuncular o on f.FilmId=o.FilmID


------------------Right Join-------------
--Sa�daki tablonun tamam�n� getiricek soldaki e�le�enleri getirecek e�le�meyenleri null olarak getiricek

select*from Oyuncular o right join Filmler f on o.FilmID=f.FilmId

select*from Filmler f right join Oyuncular o on o.FilmID=f.FilmId


------------Full Join--------
--�ki tablodada e�le�en ve e�le�meyen her �eyi getirecek

select*from Oyuncular o full join Filmler f on o.FilmID=f.FilmId

