CREATE TABLE [dbo].[DimCzasSt](
	[IdCzasu] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Miesiac] [smallint] NOT NULL,
	[Kwartal] [smallint] NOT NULL,
	[Rok] [int] NOT NULL,
	[DzienTygodnia] [smallint] NOT NULL,
	[DzienMiesiaca] [smallint] NOT NULL,
	[NazwaDniaTygodniaPol] [varchar](15) NOT NULL,
	[NazwaDniaTygodniaAng] [varchar](15) NOT NULL,
	[NazwaMiesiacaPol] [varchar](15) NOT NULL,
	[NazwaMiesiacaAng] [varchar](15) NOT NULL,
	[DataUtworzenia] [datetime] NOT NULL,
	[DataModyfikacji] [datetime] NULL,
 CONSTRAINT [PK_DimCzasSt] PRIMARY KEY CLUSTERED 
(
	[IdCzasu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Data] UNIQUE NONCLUSTERED 
(
	[Data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimCzasSt] ADD  DEFAULT (getdate()) FOR [DataUtworzenia]
GO

-------------------
CREATE PROCEDURE [dbo].[ProcLoadDimCzasSt]
AS
BEGIN
DELETE FROM [dbo].[DimCzasSt]

    DECLARE @data Date, 
	        @stop_date Date,
			@dataId int,
			@dzienMiesiaca numeric(2),
			@miesiac numeric(2),
			@kwartal numeric(1),
			@rok numeric(4),
			@dzienTygodnia numeric(1),
			@nazwaMiesiacaPolska varchar(50),
			@nazwaMiesiacaAngielska varchar(50),
			@nazwaDniaTygodniaPolska varchar(50),
			@nazwaDniaTygodniaAngielska varchar(50)
	

	SET @data = '2020-01-01'
	SET @stop_date = '2030-12-31'

	While @data <= @stop_date
	 begin
	   SET @dataId = replace(cast(@data as char(10)),'-','')
	   SET  @dzienMiesiaca = DATEPART(Day,@data)
	   SET  @miesiac = DATEPART(MM,@data)
	   SET  @kwartal = DATEPART(QQ,@data)
	   SET  @rok = DATEPART(YEAR,@data)
	   SET  @dzienTygodnia  = DATEPART(WEEKDAY,@data)

	   SELECT @dzienTygodnia = case when @dzienTygodnia=1 then 7
	                                        when @dzienTygodnia =2 then 1
											when @dzienTygodnia =3 then 2
											when @dzienTygodnia =4 then 3
											when @dzienTygodnia =5 then 4
											when @dzienTygodnia =6 then 5
											when @dzienTygodnia =7 then 6
									    end

	   SELECT @nazwaMiesiacaPolska = case when @miesiac = 1 then 'Styczeń'
	                                      when @miesiac = 2 then 'Luty'
										  when @miesiac = 3 then 'Marzec'
										  when @miesiac = 4 then 'Kwiecień'
										  when @miesiac = 5 then 'Maj'
										  when @miesiac = 6 then 'Czerwiec'
										  when @miesiac = 7 then 'Lipiec'
										  when @miesiac = 8 then 'Sierpień'
										  when @miesiac = 9 then 'Wrzesień'
										  when @miesiac = 10 then 'Październik'
										  when @miesiac = 11 then 'Listopad'
										  when @miesiac = 12 then 'Grudzień'
										  end
      
	  SELECT @nazwaMiesiacaAngielska = case when @miesiac = 1 then 'January'
	                                      when @miesiac = 2 then 'February'
										  when @miesiac = 3 then 'March'
										  when @miesiac = 4 then 'April'
										  when @miesiac = 5 then 'Maj'
										  when @miesiac = 6 then 'June'
										  when @miesiac = 7 then 'July'
										  when @miesiac = 8 then 'August'
										  when @miesiac = 9 then 'September'
										  when @miesiac = 10 then 'October'
										  when @miesiac = 11 then 'November'
										  when @miesiac = 12 then 'December'
										  end

	 SELECT @nazwaDniaTygodniaPolska = case when @dzienTygodnia =1 then 'Poniedziałek'
	                                        when @dzienTygodnia =2 then 'Wtorek'
											when @dzienTygodnia =3 then 'Środa'
											when @dzienTygodnia =4 then 'Czwartek'
											when @dzienTygodnia =5 then 'Piątek'
											when @dzienTygodnia =6 then 'Sobota'
											when @dzienTygodnia =7 then 'Niedziela'
									    end

	 SELECT @nazwaDniaTygodniaAngielska = case when @dzienTygodnia =1 then 'Monday'
	                                        when @dzienTygodnia =2 then 'Tuesday'
											when @dzienTygodnia =3 then 'Wednesday'
											when @dzienTygodnia =4 then 'Thursday'
											when @dzienTygodnia =5 then 'Friday'
											when @dzienTygodnia =6 then 'Saturday'
											when @dzienTygodnia =7 then 'Sunday'
									    end


	   insert into [dbo].[DimCzasSt]
	      ([IdCzasu],
		   [Data],
		   [Miesiac],
		   [Kwartal],
		   [Rok],
		   [DzienTygodnia],
		   [DzienMiesiaca],
		   [NazwaDniaTygodniaPol],
		   [NazwaDniaTygodniaAng],
		   [NazwaMiesiacaPol],
		   [NazwaMiesiacaAng]
		   )
	   values (@dataId,
	           @data,
			   @miesiac,
			   @kwartal,
			   @rok,
			   @dzienTygodnia,
			   @dzienMiesiaca,
			   @nazwaDniaTygodniaPolska,
			   @nazwaDniaTygodniaAngielska,
			   @nazwaMiesiacaPolska,
			   @nazwaMiesiacaAngielska
			);

	   SET @data = dateadd(day,1,@data) 
	 end
END
GO
