SELECT [idUczestnika]
      ,[imieUczestnika]
      ,[nazwiskoUczestnika]
      ,[emailUczestnika]
      ,[dataUrodzenia]
      ,[dataUtworzenia]
      ,[dataModyfikacji]
  FROM [dbo].[UczestnicyAkcji]
  WHERE [dataModyfikacji] >= dateadd(day, -1, cast(CURRENT_TIMESTAMP as date))
