SELECT am.idAkcji,
liczbaUczestnikow,
calkowityKoszt,
am.dataUtworzenia,
am.dataModyfikacji
FROM 
[dbo].[AkcjeSzczegoly] s
INNER JOIN [dbo].[AkcjeMarketingowe] am ON s.idAkcji = am.idAkcji
WHERE am.[dataModyfikacji] >= dateadd(day,-1, cast(CURRENT_TIMESTAMP as date))
UNION
SELECT s.idAkcji,
liczbaUczestnikow,
calkowityKoszt,
s.dataUtworzenia,
s.dataModyfikacji
FROM 
[dbo].[AkcjeSzczegoly] s
INNER JOIN [dbo].[AkcjeMarketingowe] am ON s.idAkcji = am.idAkcji
WHERE s.[dataModyfikacji] >= dateadd(day,-1, cast(CURRENT_TIMESTAMP as date))