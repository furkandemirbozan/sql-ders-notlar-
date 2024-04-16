--while Döngüsü

--while Þart komut

declare @Sayac int = 0
while @Sayac <100
	Begin
		print @Sayac
		set @Sayac=@Sayac+1
	end

--Break Komutu

declare @Sayac1 int = 0
while @Sayac1 <100
	Begin
		print @Sayac1
		set @Sayac1=@Sayac1+1
		if @Sayac1 %5=0
			break
	end

--Continue Komutu

declare @Sayac2 int = 0
while @Sayac2 <1000
	Begin
		if @Sayac2 %5=0
		begin
		set @Sayac2=@Sayac2 + 1
			continue
		end
		print @Sayac2
		set @Sayac2=@Sayac2 + 1
	end