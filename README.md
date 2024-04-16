# Park Rozrywki

## Cel Projektu:
Celem projektu jest stworzenie kompletnego systemu analizy danych, obejmującego bazy danych, hurtownię danych (ETL), model OLAP oraz interaktywne dashboardy w środowisku Power BI Desktop.

## Narzędzia:

- **SQL Server Management Studio 19**
- **Toad Data Modeler 7.2**
- **Visual Studio 2019**

Projekt realizowany jest w zespołach pięcioosobowych i składa się z 4 etapów.

## Organizacja Pracy:

### Ukończone: 
#### ETAP I (26.02.2024 - 11.03.2024)
**Cel:** Opracowanie dwóch relacyjnych baz danych w środowisku MS SQL Server.

BAZA I

![BazaI](img/schematpierwszy.png)

BAZA II

![BazaII](img/schemat1.jpg)


### W trakcie: 
#### ETAP II (11.03.2024 - 15.04.2024)
**Cel:** Celem tego etapu projektu jest implementacja hurtowni danych przy użyciu technologii ETL (Microsoft SQL Server Integration Services - SSIS) oraz opartej na modelu konstelacji gwiazdy. Celem jest stworzenie dwóch tabel faktów oraz pięciu tabel wymiarów.

**Projekt gwiazdy**
  
Pierwsza faza polegała na zaprojektowaniu modelu gwiazdy dla każdej z dwóch wcześniej stworzonych baz relacyjnych.
  
**ODS**
  
Następnie wcześniej stworzony model danych został poddany kolejnej modyfikacji, celem utworzenia warstwy pośredniej między systemem OLTP a hurtownią danych. Po zdefiniowaniu struktury ODS, skonfigurowano procesy w środowisku Visual Studio, umożliwiające pobieranie danych z baz źródłowych do ODS. Opracowano również mechanizm inkrementalny, który pozwala na przesyłanie do ODS tylko tych rekordów z baz źródłowych, które uległy zmianie.



BAZA I
1. Modelowanie i implementacja schematu struktur hurtowni danych - stoworzenie modelu konstelacji gwiazdy
   ![Model gwiazdy baza I](img/gwiazda1.png)
2. Modelowanie schematu struktur ODS
   ![ODS 1](img/ODS1.png)

BAZA II
1. Konstelacja gwiazdy dla bazy drugiej
   ![Model gwiazdy baza II](img/gwiazda2.png)
2. ODS dla bazy drugiej 
   ![ODS 2](img/ods2.png)



#### ETAP III (15.04.2024 - 13.05.2024)
- **Cel:** Projekt i implementacja modelu OLAP w formie bazy tabelarycznej (MS SSAS) wraz z
zasilaniem

#### ETAP IV (13.05.2024 - 03.06.2024)
- **Cel:** Dashboardy w narzędziu analizy Microsoft Power BI Desktop.

## Planowana Data Ukończenia Projektu: 03.06.2024
