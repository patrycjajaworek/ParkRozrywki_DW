SELECT am.idAkcji,
statusAkcji,
nazwaAkcji,
lokalizacjaAkcji,
rodzajAkcji,
dataRozpoczecia,
dataZakonczenia,
opisAkcji,
targetWiekowy, 
formaAkcji,
sponsorzy,
am.dataUtworzenia,
am.dataModyfikacji
FROM 
[dbo].[AkcjeSzczegoly] s
INNER JOIN [dbo].[AkcjeMarketingowe] am ON s.idAkcji = am.idAkcji
WHERE am.[dataModyfikacji] >= dateadd(day,-1, cast(CURRENT_TIMESTAMP as date))
UNION
SELECT s.idAkcji,
statusAkcji,
nazwaAkcji,
lokalizacjaAkcji,
rodzajAkcji,
dataRozpoczecia,
dataZakonczenia,
opisAkcji,
targetWiekowy, 
formaAkcji,
sponsorzy,
s.dataUtworzenia,
s.dataModyfikacji
FROM 
[dbo].[AkcjeSzczegoly] s
INNER JOIN [dbo].[AkcjeMarketingowe] am ON s.idAkcji = am.idAkcji
WHERE s.[dataModyfikacji] >= dateadd(day,-1, cast(CURRENT_TIMESTAMP as date))