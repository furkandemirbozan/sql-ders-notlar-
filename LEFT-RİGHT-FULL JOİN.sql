use OrnekVT

--Outer Join 
--Inner Joinde eþleþen kayýtlarý getiriyordu .Eþleþmeyen kayýtlarý getirmiyordu

----------------LEFT JOÝN-------------
--Soldakilerin hepsini getirecek saðdaki eþleþenleri getirecek eþleimeyenleri ise null getiricek


select *from Oyuncular o left join Filmler f on o.FilmID=f.FilmId

select*from Filmler f left join Oyuncular o on f.FilmId=o.FilmID


------------------Right Join-------------
--Saðdaki tablonun tamamýný getiricek soldaki eþleþenleri getirecek eþleþmeyenleri null olarak getiricek

select*from Oyuncular o right join Filmler f on o.FilmID=f.FilmId

select*from Filmler f right join Oyuncular o on o.FilmID=f.FilmId


------------Full Join--------
--Ýki tablodada eþleþen ve eþleþmeyen her þeyi getirecek

select*from Oyuncular o full join Filmler f on o.FilmID=f.FilmId

