USE [master]
GO
/****** Object:  Database [Medicina]    Script Date: 02.06.2024 20:16:32 ******/
CREATE DATABASE [Medicina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Medicina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Medicina.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Medicina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Medicina_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Medicina] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Medicina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Medicina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Medicina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Medicina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Medicina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Medicina] SET ARITHABORT OFF 
GO
ALTER DATABASE [Medicina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Medicina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Medicina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Medicina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Medicina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Medicina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Medicina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Medicina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Medicina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Medicina] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Medicina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Medicina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Medicina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Medicina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Medicina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Medicina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Medicina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Medicina] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Medicina] SET  MULTI_USER 
GO
ALTER DATABASE [Medicina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Medicina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Medicina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Medicina] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Medicina] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Medicina] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Medicina] SET QUERY_STORE = OFF
GO
USE [Medicina]
GO
/****** Object:  Table [dbo].[Balance]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMedicine] [int] NULL,
	[IdHospitalDepartment] [int] NULL,
	[ImplementationMonth] [nvarchar](10) NULL,
	[ImplementationYear] [nvarchar](10) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Balance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](120) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Patronymic] [nvarchar](20) NOT NULL,
	[IdHospitalDepartment] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalDepartament]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalDepartament](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameDepartament] [nvarchar](50) NULL,
 CONSTRAINT [PK_HospitalDepartament] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogOfReceipts]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogOfReceipts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMedicine] [int] NOT NULL,
	[DateRecepts] [date] NOT NULL,
	[QuantityReceipts] [int] NOT NULL,
	[ImplementationMonth] [nvarchar](10) NULL,
	[ImplementationYear] [nvarchar](10) NULL,
	[IdHospitalDepartament] [int] NULL,
 CONSTRAINT [PK_LogOfReceipts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogWriteOff]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogWriteOff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBalance] [int] NOT NULL,
	[DateWrite] [date] NOT NULL,
	[QuantityWrite] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[Reason] [nvarchar](30) NULL,
 CONSTRAINT [PK_LogWriteOff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [nvarchar](max) NOT NULL,
	[IdCategory] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Manufacture] [nvarchar](50) NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDeyails]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDeyails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NULL,
	[IdMedicine] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDeyails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NULL,
	[IdDepartament] [int] NULL,
	[IdEmployee] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02.06.2024 20:16:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[IdEmployee] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Balance] ON 

INSERT [dbo].[Balance] ([Id], [IdMedicine], [IdHospitalDepartment], [ImplementationMonth], [ImplementationYear], [Quantity]) VALUES (1, 1, 1, N'2', N'2024', 20)
SET IDENTITY_INSERT [dbo].[Balance] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (1, N'Наркотические анальгетики')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (2, N'Антибактериальные, противомикробные препараты')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (3, N'Антидепрессанты и средства нормотимического действия')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (4, N'Антипсихотические средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (5, N'Антисептические средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (6, N'Антихолинэстеразные средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (7, N'Витамины, макро- и микроэлементы')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (8, N'Гормоны и средства, влияющие на эндокринную систему и обмен веществ')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (9, N'Дезинтоксикационное средство')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (10, N'Заменители плазмы и других компонентов крови, растворы')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (11, N'Иммуномоделирующее средство')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (12, N'Метаболические средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (13, N'Ненаркотические анальгетики и нестероидные противовоспалительные средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (14, N'Парентеральное, энтеральное питание')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (15, N'Противовирусные средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (16, N'Препараты для лечения ВИЧ-инфицированных пациентов')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (17, N'Иммунные сыворотки')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (18, N'Противогрибковые средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (19, N'Противоопухолевые, иммунодепрессивные и сопутствующие средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (20, N'Противопротозойные и противопаразитарные средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (21, N'Прочие противовоспалительные средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (22, N'Прочие средства, влияющие на центральную нервную систему')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (23, N'Противосудорожные средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (24, N'Средства для лечения паркинсонизма')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (25, N'Спазмолитические средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (26, N'Средства для лечения аллергических реакций')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (27, N'Средства для лечения заболеваний желудочно-кишечного тракта')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (28, N'Средства для лечения подагры')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (29, N'Средства для лечения сахарного диабета')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (30, N'Средства для наркоза, анестетики, миорелаксанты')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (31, N'Средства, влияющие на кроветворение, систему свертывания')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (32, N'Средства, влияющие на органы дыхания')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (33, N'Средства, влияющие на сердечно-сосудистую систему')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (34, N'Средства, применяемые в наркологии')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (35, N'Средства, применяемые в офтальмологии')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (36, N'Рентгеноконтрастные средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (37, N'Диагностические и терапевтические радиофармацевтические средства')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (38, N'Препараты для лечения доброкачественной гиперплазии предстательной железы')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (39, N'Аллергены')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (40, N'Изделия медицинского назначения')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (41, N'Лекарственные средства и медицинские изделия, назначаемые и выписываемые по мероприятию «Сахарный диабет»')
INSERT [dbo].[Category] ([Id], [NameCategory]) VALUES (42, N'Бесплатные или 50% скидка')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [IdHospitalDepartment]) VALUES (1, N'Исупов', N'Алексей', N'Александрович', NULL)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [IdHospitalDepartment]) VALUES (2, N'Шаповалов', N'Вадим', N'Сергеевич', 15)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[HospitalDepartament] ON 

INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (1, N'Гематологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (2, N'Терапевтическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (3, N'Эндокринологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (4, N'Оториноларингологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (5, N'Отделение гнойной хирургии')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (6, N'Хирургическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (7, N'Эндоскопическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (8, N'Отделение челюстно-лицевой хирургии')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (9, N'Травматологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (10, N'Нейрохирургическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (11, N'Урологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (12, N'Отделение анестезиологии-реанимации')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (13, N'Офтальмологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (14, N'Неврологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (15, N'Кожно-венерологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (16, N'Гинекологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (17, N'Гастроэнтерологическое отделение')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (18, N'Инфекционное отделение №1 (Детская больница)')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (19, N'Инфекционное отделение №2 (Щурово)')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (20, N'Педиатрическое отделение №4 (Детская больница)')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (22, N'Отделение паллиативной медицинской помощи')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (23, N'Региональный сосудистый центр (РСЦ)')
INSERT [dbo].[HospitalDepartament] ([Id], [NameDepartament]) VALUES (28, N'Федосьинское отделение сестринского ухода')
SET IDENTITY_INSERT [dbo].[HospitalDepartament] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (1, N'Морфин', 1, N'раствор для инъекций, капсулы/таблетки пролонгированного действия', N'')
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (2, N'Пропионилфенилэтоксиэтилпиперидин', 1, N'таблетки защечные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (3, N'Трамадол', 1, N'раствор для инъекций, капсулы, таблетки, суппозитории', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (4, N'Тримеперидин', 1, N'раствор для инъекций, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (5, N'Фентанил', 1, N'раствор для инъекций, таблетки подъязычные, трансдермальная терапевтическая система', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (6, N'Азитромицин', 2, N'порошок для приготовления суспензии для приема внутрь; капсулы, таблетки; лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (7, N'Амикацин', 2, N'порошок/лиофилизат для приготовления раствора для внутривееного и/или внутримышечного введения; раствор для внутримышечного и/или внутривенного введения/ для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (8, N'Амоксициллин', 2, N'капсулы, гранулы, порошок, таблетки, таблетки диспергируемые', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (9, N'Амоксициллин+Клавулановая кислота', 2, N'таблетки (в том числе диспергируемые, покрытые оболочкой, с модифицированным высвобождением); порошок для приготовления раствора для внутривенного введения; порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (10, N'Ампициллин', 2, N'порошок для приготовления раствора для внутримышечного и внутривенного введения, порошок для приготовления суспензии для приема внутрь, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (11, N'Амфотерицин В', 2, N'лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (12, N'Бензатина бензилпенициллин', 2, N'порошок для приготовления суспензии для внутримышечного введения, в том числе пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (13, N'Бензилпенициллин', 2, N'порошок для приготовления раствора для внутривенного и внутримышечного введения/ подкожного введения/ для инъекций и /или местного применения; порошок для приготовления суспензии для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (14, N'Ванкомицин', 2, N'лиофилизат / порошок для приготовления для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (15, N'Гатифлоксацин', 2, N'таблетки, покрытые оболочкой пленочной', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (16, N'Гентамицин', 2, N'капли глазные, порошок для приготовления раствора для внутримышечного введения; раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (17, N'Гидроксихлорохин', 2, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (18, N'Джозамцин', 2, N'таблетки диспергигуемые, таблетки покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (19, N'Диоксометилтетрагидропиримидин + сульфадиметоксин+ тримекаин+ хлорамфеникол', 2, N'мазь для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (20, N'Доксициклин,', 2, N'капсулы; лиофилизат для приготовления раствора для внутривенного введения; лиофилизат для приготовления раствора для инфузий; таблетки; таблетки диспергируемые', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (21, N'Имипенем+Циластатин', 2, N'порошок для приготовления раствора для инфузий/ внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (22, N'Канамицин', 2, N'порошок для приготовления раствора для внутривенного и/или внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (23, N'Ко-тримоксазол', 2, N'концентрат для приготовления раствора для инфузий; суспензия для приема внутрь; таблетки покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (24, N'Кларитромицин', 2, N'таблетки, лиофилизат (концентрат) для приготовления раствора для инфузий, гранулы (порошок) для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (25, N'Клиндамицин', 2, N'капсулы, раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (26, N'Клотримазол', 2, N'суппозитории (таблетки) вагинальные, гель вагинальный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (27, N'Левофлоксацин', 2, N'таблетки, покрытые оболочкой, раствор для инфузий, глазные капли', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (28, N'Линезолид', 2, N'раствор для инфузий, гранулы для приготовления суспензии для приема внутрь, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (29, N'Ломефлоксацин', 2, N'таблетки, покрытые оболочкой, глазные капли', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (30, N'Меропенем', 2, N'лиофилизат/ порошок для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (31, N'Мефлохин', 2, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (32, N'Моксифлоксацин', 2, N'капли глазные, раствор для инфузий; таблетки, покрытые оболочкой пленочной', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (33, N'Оксациллин', 2, N'порошок для приготовления раствора для внутривенного и внутримышечного введения/ раствора для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (34, N'Офлоксацин', 2, N'таблетки, капли глазные, ушные; мазь глазная, раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (35, N'Рифамицин', 2, N'капли ушные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (36, N'Празиквантел', 2, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (37, N'Спарфлоксацин', 2, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (38, N'Стрептомицин', 2, N'порошок для приготовления раствора для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (39, N'Сульфасалазин', 2, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (40, N'Тетрациклин', 2, N'мазь глазная', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (41, N'Тобрамицин', 2, N'раствор/капсулы для ингаляций, раствор для внутривенного и внутримышечного введения, глазные капли, мазь глазная', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (42, N'Феноксиметилпенициллин', 2, N'порошок для приготовления суспензии для приема внутрь; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (43, N'Хлорамфеникол', 2, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (44, N'Хлоргексидин', 2, N'раствор/ спрей для местного применения/ наружного применения; суппозитории (таблетки) вагинальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (45, N'Цефазолин', 2, N'порошок для приготовления раствора для внутривенного и/или внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (46, N'Цефалексин', 2, N'гранулы для приготовления суспензии для приема внутрь; капсулы; таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (47, N'Цефоперазон+Сульбактам', 2, N'порошок для приготовления раствора для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (48, N'Цефепим', 2, N'порошок для приготовления раствора для внутривенного и/или внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (49, N'Цефотаксим', 2, N'порошок для приготовления раствора для внутривенного и/или внутримышечного введения/ для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (50, N'Цефтаролина фосамил', 2, N'порошок для приготовления концентрата для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (51, N'Цефтазидим', 2, N'порошок для приготовления раствора для инъекций/ для нутривенного и внутримышечного введения/ для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (52, N'Цефтриаксон', 2, N'порошок для приготовления раствора для инъекций/ внутримышечного/ внутривенного введения/ для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (53, N'Цефуроксим', 2, N'порошок для приготовления раствора для инъекций, инфузий, гранулы для приготовления суспензии для приема внутрь, таблетки покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (54, N'Ципрофлоксацин', 2, N'таблетки; концентрат; раствор для инфузий, глазные капли, ушные; мазь глазная; раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (55, N'Эртапенем', 2, N'лиофилизат для приготовления раствора для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (56, N'Агомелатин', 3, N'таблетки, покрытые оболочкой пленочной', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (57, N'Амитриптилин', 3, N'таблетки, капсулы; раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (58, N'Зопиклон', 3, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (59, N'Имипрамин', 3, N'таблетки, драже; раствор для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (60, N'Кломипрамин', 3, N'раствор для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (61, N'Оланзапин', 3, N'таблетки, порошок/лиофилизат для приготовления раствора/суспензии для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (62, N'Пароксетин', 3, N'таблетки, капли для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (63, N'Пипофезин', 3, N'таблетки, таблетки с модифицированным высвобождением', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (64, N'Сертралин', 3, N'таблетки, покрытые оболочкой;', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (65, N'Флуоксетин', 3, N'капсулы, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (66, N'Галоперидол', 4, N'таблетки; раствор для внутримышечного, внутривенного введения; раствор (масляный) для внутримышечного введения, капли для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (67, N'Диазепам', 4, N'таблетки, раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (68, N'Зуклопентиксол', 4, N'раствор для внутримышечного введения (масляный); таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (69, N'Кветиапин', 4, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (70, N'Клоназепам', 4, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (71, N'Левомепромазин', 4, N'раствор для инфузий и внутримышечного введения, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (72, N'Лоразепам', 4, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (73, N'Нитразепам,', 4, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (74, N'Мидазолам', 4, N'раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (75, N'Оксазепам', 4, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (76, N'Палиперидон', 4, N'суспензия для внутримышечного введения пролонгированного действия; таблетки пролонгированного действия, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (77, N'Перициазин', 4, N'капсулы; раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (78, N'Перфеназин', 4, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (79, N'Рисперидон', 4, N'таблетки, порошок для приготовления суспензии для внутримышечного введения пролонгированного действия; раствор для приема внутрь; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (80, N'Сульпирид', 4, N'таблетки, капсулы; раствор для внутримышечного введения, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (81, N'Тиоридазин', 4, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (82, N'Трифлуоперазин', 4, N'таблетки; раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (83, N'Флупентиксол', 4, N'таблетки, раствор для внутримышечного введения (масляный)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (84, N'Флуфеназин', 4, N'раствор для внутримышечного введения (масляный)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (85, N'Хлорпромазин', 4, N'таблетки, драже; раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (86, N'Водорода пероксид', 5, N'раствор для местного и наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (87, N'Йод+калия йодид+глицерол', 5, N'раствор/спрей для местного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (88, N'Калия перманганат', 5, N'порошок для приготовления для местного и наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (89, N'Повидон-йод', 5, N'раствор для местного и (или) наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (90, N'Этанол', 5, N'раствор для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (91, N'Галантамин', 6, N'капсулы, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (92, N'Неостигмина метилсульфат', 6, N'раствор для внутривенного и подкожного введения; раствор для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (93, N'Пиридостигмина бромид', 6, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (94, N'Ривастигмин', 6, N'капсулы, трансдермальная терапевтическая система, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (95, N'Аскорбиновая кислота', 7, N'раствор для внутривенного и внутримышечного введения, капсулы, драже, таблетки, капли/порошок для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (96, N'Кальция глюконат', 7, N'раствор для внутривенного и внутримышечного введения; раствор для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (97, N'Пиридоксин', 7, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (98, N'Ретинол', 7, N'капсулы, драже, капли для приема внутрь, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (99, N'Тиамин', 7, N'раствор для инъекций', NULL)
GO
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (100, N'Алендроновая кислота', 8, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (101, N'Альфакальцидол', 8, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (102, N'Атозибан', 8, N'концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (103, N'Бетаметазон', 8, N'крем, мазь; суспензия для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (104, N'Бромокриптин', 8, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (105, N'Ганиреликс', 8, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (106, N'Гексопреналин', 8, N'раствор для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (107, N'Гидрокортизон', 8, N'лиофилизат для приготовления раствора для внутривенного и внутримышечного введения; таблетки; мазь, крем, эмульсия, мазь глазная; суспензия для внутримышечного и внутрисуставного введения;', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (108, N'Гонадотропин хорионический', 8, N'лиофилизат для приготовления раствора для внутримышечного введения /и подкожного введения, подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (109, N'Глюкагон', 8, N'лиофилизат для приготовления раствора для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (110, N'Дексаметазон', 8, N'раствор для инъекций; раствор для внутривенного и внутримышечного введения; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (111, N'Десмопрессин', 8, N'таблетки, капли, спей', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (112, N'Дидрогестерон', 8, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (113, N'Динопростон', 8, N'гель интрацервикальный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (114, N'Золедроновая кислота', 8, N'концентрат/лиофилизат для приготовления раствора для инфузий, внутривенного введения; раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (115, N'Калия', 8, N'йодид таблетки, таблетки жевательные, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (116, N'Кальцитонин', 8, N'раствор для инъекций, спрей назальный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (117, N'Кальцитриол', 8, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (118, N'Карбетоцин', 8, N'раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (119, N'Кломифен', 8, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (120, N'Колекальциферол', 8, N'капли/раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (121, N'Корифоллитропин альфа', 8, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (122, N'Левотироксин натрия', 8, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (123, N'Метилпреднизолон', 8, N'лиофилизат для приготовления раствора для внутривенного и внутримышечного введения, суспензия для инъекций, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (124, N'Метилэргометрин', 8, N'раствор для внуртивенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (125, N'Мизопростол', 8, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (126, N'Мометазон', 8, N'спрей назальный; крем/ мазь для наружного применения; порошок для ингаляций, раствор для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (127, N'Нандролон', 8, N'раствор для внутримышечного введения (масляный)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (128, N'Норэтистерон', 8, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (129, N'Окситоцин', 8, N'раствор для инъекций, раствор для инфузий и внутримышечного введения, раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (130, N'Октреотид', 8, N'лиофилизат/микросферы для приготовления суспензии для внутримышечного введения, в том числе пролонгированного действия; раствор для внутривенного и подкожного введения; раствор для инфузий и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (131, N'Парикальцитол', 8, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (132, N'Преднизолон', 8, N'мазь; раствор для инъекций, раствор для внутривенного и внутримышечного введения; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (133, N'Прогестерон', 8, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (134, N'Соматотропин', 8, N'лиофилизат для приготовления раствора для инъекций/ для подкожного введения; раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (135, N'Стронция ранелат', 8, N'порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (136, N'Тиамазол', 8, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (137, N'Терипаратид', 8, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (138, N'Тестостерон', 8, N'раствор для внутримышечного введения, капсулы, гель', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (139, N'Тестостерон (смесь эфиров)', 8, N'раствор для внутримышечного введения (масляный)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (140, N'Фоллитропин альфа', 8, N'лиофилизат для приготовления раствора для внутримышечного и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (141, N'Флудрокортизон', 8, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (142, N'Цинакалцет', 8, N'таблетки, покрытые оболочкой, раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (143, N'Ципротерон', 8, N'раствор для внутримышечного введения масляный, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (144, N'Цетрореликс', 8, N'лиофилизат для приготовления раствора для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (145, N'Эстрадиол', 8, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (146, N'Димеркаптопропансульфонат натрия', 9, N'раствор для внутримышечного и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (147, N'Калий-железо гексацианоферрат', 9, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (148, N'Кальция тринатния пентетат', 9, N'лиофилизат для приготовления раствора для внутривенного введения/ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (149, N'Карбоксим', 9, N'раствор для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (150, N'Натрия тиосульфат', 9, N'раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (151, N'Цинка бисвинилимидазола диацетат', 9, N'капсулы, раствор для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (152, N'Вода', 10, N'для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (153, N'Гидроксиэтилкрахмал', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (154, N'Декстран', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (155, N'Декстроза', 10, N'раствор для внутривенного введения; раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (156, N'Декстроза+калия хлорид+натрия хлорид+натрия цитрат', 10, N'порошок для приготовления раствора для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (157, N'Желатин', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (158, N'Калия хлорид', 10, N'раствор для внутривенного введения, концентрат для приготовления раствора для инфузий и (или) приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (159, N'Калия хлорид+натрия ацетат+натрия хлорид', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (160, N'Лактулоза ', 10, N'сироп', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (161, N'Макрогол', 10, N'порошок для приготовления раствора для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (162, N'Маннитол', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (163, N'Меглюмина натрия сукцинат', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (164, N'Натрия гидрокарбонат', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (165, N'Натрия лактата', 10, N'раствор сложный (калия хлорид+кальция хлорид+натрия хлорид+натрия лактат) раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (166, N'Натрия хлорид', 10, N'раствор для инфузий, раствор для инъекций, растворитель для приготовления лекарственных форм для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (167, N'Натрия хлорида раствор сложный (калия хлорид+кальция хлорид+натрия хлорид)', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (168, N'Натрия хлорид+калия хлорид+кальция хлорида дигидрат+магния хлорида гексагидрат+натрия ацетата тригидрат+яблочная кислота', 10, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (169, N'Азоксимера бромид', 11, N'лиофилизат для приготовления инъекций раствора и раствора для местного применения, суппозитории вагинальные и ректальные, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (170, N'Глутамил-цистеинил-глицин динатрия', 11, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (171, N'Иммуноглобулин антистафилококковый', 11, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (172, N'Иммуноглобулин антирабический', 11, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (173, N'Иммуноглобулин противостолбнячный человека', 11, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (174, N'Иммуноглобулин против клещевого энцефалита', 11, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (175, N'Иммуноглобулин человека антиресус RHO (D)', 11, N'раствор для инъекций; лиофилизат  для приготовления раствора для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (176, N'Иммуноглобулин антицимоноцитарный', 11, N'концентрат/лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (177, N'Иммуноглобулин человека нормальный', 11, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (178, N'Интерферон альфа', 11, N'лиофилизат для приготовления раствора для внутримышечного и подкожного введения, для приготовления раствора для внутримышечного, субконъюктивального введения и закапывания в глаз, для приготовления раствора для инъекций, местного применения;  раствор для внутримышечного, субконъюктивального введения, раствор для инъекций, суппозитории ректальные, гель для местного и наружного применения, капли назальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (179, N'Интерферон бета', 11, N'лиофилизат для приготовления раствора для внутримышечного введения, подкожного введения; раствор для внутримышечного /подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (180, N'Интерферон гамма', 11, N'лиофилизат для приготовления раствора для внутримышечного введения, подкожного, интраназального введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (181, N'Паливизумаб', 11, N'лиофилизат для приготовления раствора для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (182, N'Декстроза', 12, N'раствор для инфузий; раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (183, N'Инозин+никотинамид+рибофлавин+янтарная кислота', 12, N'раствор для внутривенного введения, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (184, N'Тиоктовая кислота', 12, N'таблетки покрытые оболочкой, капсулы; концентрат для приготовления раствора для внутривенного введения/для инфузий; раствор для внутривенного введения; раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (185, N'Ацетилсалициловая кислота', 13, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (186, N'Диклофенак', 13, N'раствор для инъекций; таблетки ретард; таблетки, капсулы;', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (187, N'Ибупрофен', 13, N'таблетки, раствор для инъекций, гранулы /суспензия для приготовления раствора для приема внутрь, капсулы; мазь/крем/ гель для наружного применения; суппозитории', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (188, N'Кетопрофен', 13, N'раствор для инъекций; лиофилизат для приготовления раствора для внутримышечного введения, раствор для внутривенного и внутримышечного введения, раствор для инфузий; капсулы, таблетки; суппозитории', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (189, N'Кеторолак', 13, N'раствор для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (190, N'Лорноксикам лиофилизат', 13, N'для приготовления инъекционного раствора, таблетки покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (191, N'Парацетамол', 13, N'таблетки; суппозитории, раствор для инфузий, сироп, суспензия/гранулы  для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (192, N'Пеницилламин', 13, N'таблетки покрытые оболочкой пленочной', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (193, N'Аминокислоты для парентерального питания', 14, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (194, N'Аминокислоты для парентерального питания+прочие препараты', 14, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (195, N'Аминокислоты и их смеси', 14, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (196, N'Жировые эмульсии для парентерального питания', 14, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (197, N'Кетоаналоги аминокислот', 14, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (198, N'Ацикловир', 15, N'таблетки; мазь, крем; глазная мазь, порошок / порошок для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (199, N'Валганцикловир', 15, N'таблетки, покрытые оболочкой пленочной', NULL)
GO
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (200, N'Ганцикловир', 15, N'лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (201, N'Имидазолилэтанамид пентадиновой кислоты', 15, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (202, N'Кагоцел', 15, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (203, N'Меглюмина акридонацетат', 15, N'раствор для внутривенного и внутримышечного введения; таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (204, N'Осельтамивир', 15, N'капсулы порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (205, N'Пэгинтерферон альфа', 15, N'лиофилизат для приготовления раствора для подкожного введения,  раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (206, N'Ралтегравир', 15, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (207, N'Рибавирин', 15, N'таблетки, капсулы, концентрат для приготовления раствора для инфузий, лиофилизат для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (208, N'Тилорон', 15, N'капсулы, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (209, N'Умифеновир', 15, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (210, N'Цепэгинтерферон альфа', 15, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (211, N'Энфувиртид', 15, N'лиофилизат для приготовления раствора для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (212, N'Абакавир', 16, N'раствор для приема внутрь, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (213, N'Абакавир+Ламивудин', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (214, N'Абакавир+Ламивудин+Зидовудин', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (215, N'Атазанавир', 16, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (216, N'Даруновир', 16, N'таблетки, покрытые оболочкой пленочной', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (217, N'Диданозин', 16, N'капсулы, порошок для приготовления раствора для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (218, N'Зидовудин', 16, N'капсулы, таблетки, раствор для инфузий, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (219, N'Зидовудин+Ламивудин', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (220, N'Индинавир', 16, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (221, N'Ламивудин', 16, N'раствор для приема внутрь, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (222, N'Лопинавир+ритонавир', 16, N'раствор для приема внутрь; таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (223, N'Невирапин', 16, N'суспензия для приема внутрь, таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (224, N'Нелфинавир', 16, N'порошок для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (225, N'Ритонавир', 16, N'капсулы, мягкие капсулы, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (226, N'Саквинавир', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (227, N'Ставудин', 16, N'капсулы, порошок для приготовления раствора для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (228, N'Телапревир', 16, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (229, N'Телбивудин', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (230, N'Тенофовир', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (231, N'Фосампренавир', 16, N'суспензия для приема внутрь, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (232, N'Фосфазид', 16, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (233, N'Энтекавир', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (234, N'Этравирин', 16, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (235, N'Эфавиренз', 16, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (236, N'Анатоксин дифтерийный', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (237, N'Анатоксин дифтерийно-столбнячный', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (238, N'Анатоксин столбнячный', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (239, N'Анатоксин яда гадюки обыкновенной', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (240, N'Сыворотка противоботулиническая', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (241, N'Сыворотка противогангренозная поливалентная очищенная концентрированная лошадиная жидкая', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (242, N'Сыворотка противодифтерийная', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (243, N'Сываротка противостолбнячная', 17, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (244, N'Вориконазол', 18, N'таблетки, лиофилизат для приготовления раствора для инфузий, порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (245, N'Каспофунгин', 18, N'лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (246, N'Натамицин ', 18, N'суппозитории вагинальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (247, N'Нистатин', 18, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (248, N'Микафунгин', 18, N'лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (249, N'Салициловая кислота', 18, N'мазь для наружного применения; раствор для наружного применения (спиртовой)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (250, N'Флуконазол', 18, N'капсулы, таблетки; раствор для внутривенного введения, раствор для инфузий, порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (251, N'Абатацепт', 19, N'лиофилизат для приготовления раствора для инфузий; раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (252, N'Адалимумаб', 19, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (253, N'Азатиприн', 19, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (254, N'Базиликсимаб', 19, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (255, N'Инфликсимаб', 19, N'лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (256, N'Лефлуномид', 19, N'таблетки, покрытые оболочкой пленочной', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (257, N'Метотрексат', 19, N'таблетки, раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (258, N'Микофенолата мофетил', 19, N'капсулы, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (259, N'Микофеноловая кислота', 19, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (260, N'Натализумаб', 19, N'концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (261, N'Ритуксимаб ', 19, N'концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (262, N'Такролимус', 19, N'капсулы, концентрат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (263, N'Тоцилизумаб', 19, N'концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (264, N'Устекинумаб', 19, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (265, N'Цертолизумаба пэгол', 19, N'раствор подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (266, N'Циклоспорин,', 19, N'капсулы, капсулы мягкие, раствор для инфузий, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (267, N'Циклофосфамид', 19, N'порошок/лиофилизат для приготовления раствора для инъекций, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (268, N'Финголимод', 19, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (269, N'Эверолимус', 19, N'таблетки, в том числе диспергируемые', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (270, N'Экулизумаб', 19, N'концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (271, N'Этанерцепт ', 19, N'лиофилизат для приготовления раствора для подкожного введения; раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (272, N'Бензилбензоат', 20, N'мазь, эмульсия для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (273, N'Левамизол', 20, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (274, N'Мебендазол', 20, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (275, N'Метронидазол', 20, N'таблетки; раствор для инфузий, раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (276, N'Пирантел', 20, N'таблетки, суспензия для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (277, N'Пимекролимус', 21, N'крем для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (278, N'Бетагистин ', 22, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (279, N'Бромдигидрохлорфенилбензодиазепин', 22, N'раствор для инъекций, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (280, N'Винпоцетин ', 22, N'концентрат для инфузий, раствор для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (281, N'Глицин ', 22, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (282, N'Кофеин ', 22, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (283, N'Мемантин', 22, N'капли для приема внутрь, таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (284, N'Метионил-глутамил-гистидил-фенилаланил-пролил-глицил-пролин', 22, N'капли назальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (285, N'Пирацетам', 22, N'раствор для инъекций; раствор для инфузий, таблетки; таблетки, покрытые оболочкой, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (286, N'N-карбамоилметил-4-фенил-2-пирролидон,', 22, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (287, N'Тизанидин', 22, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (288, N'Топирамат', 22, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (289, N'Тригексифенидил', 22, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (290, N'Холина альфосцерат', 22, N'раствор для инъекций, капсулы, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (291, N'Церебролизин', 22, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (292, N'Цитиколин', 22, N'раствор для внутривенного, внутримышечного введения, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (293, N'Этилметилгидроксипиридина сукцинат', 22, N'раствор для внутривенного и внутримышечного введения, капсулы, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (294, N'Бензобарбитал', 23, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (295, N'Вальпроевая кислота', 23, N'таблетки, таблетки пролонгированного действия; гранулы пролонгированного действия; капсулы, сироп, раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (296, N'Карбамазепин', 23, N'таблетки, таблетки пролонгированного действия, сироп', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (297, N'Лакосамид', 23, N'раствор для инфузий, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (298, N'Леветирацетам', 23, N'таблетки, раствор для приема внутрь, концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (299, N'Окскарбазепин,', 23, N'таблетки, покрытые оболочкой; суспензия для приема внутрь', NULL)
GO
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (300, N'Прегабалин', 23, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (301, N'Фенобарбитал', 23, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (302, N'Фенитоин', 23, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (303, N'Этосуксимид', 23, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (304, N'Амантадин', 24, N'таблетки, капсулы, раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (305, N'Бипериден', 24, N'раствор для внутривенного и внутримышечного введения, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (306, N'Леводопа+бенсеразид', 24, N'капсулы, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (307, N'Левадопа+карбидопа', 24, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (308, N'Прамипексол,', 24, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (309, N'Пирибедил', 24, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (310, N'Дротаверин', 25, N'таблетки (в том числе покрытые пленочной оболочкой); раствор для внутривенного и внутримышечного введения, раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (311, N'Мебеверин', 25, N'капсулы пролонгированного действия, таблетки покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (312, N'Платифиллин', 25, N'раствор для подкожного введения, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (313, N'Солифенацин', 25, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (314, N'Дифенгидрамин', 26, N'таблетки; раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (315, N'Лоратадин', 26, N'таблетки, сироп, суспензия для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (316, N'Хлоропирамин ', 26, N'раствор для инъекций; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (317, N'Цетиризин', 26, N'капли/раствор/сироп для приема внутрь; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (318, N'Адеметионин', 27, N'таблетки, покрытые оболочкой; лиофилизат для приготовления раствора для внутримышечного, внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (319, N'Агалсидаза альфа', 27, N'концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (320, N'Агалсидаза бета', 27, N'лиофилизат для приготовления концентрата для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (321, N'Атропин', 27, N'раствор для инъекций; капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (322, N'Бисакодил', 27, N'таблетки, покрытые оболочкой, суппозитории ректальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (323, N'Бифидобактерии бифидум', 27, N'капсулы, таблетки, лиофилизат (или порошок) для приготовления раствора (или суспензии) для приема внутрь и местного применения, суппозитории вагинальные и ректальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (324, N'Велаглюцераза альфа', 27, N'лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (325, N'Висмута трикалия дицитрат', 27, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (326, N'Идурсульфаза', 27, N'концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (327, N'Имиглюцераза', 27, N'лиофилизат для приготовления раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (328, N'Лоперамид', 27, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (329, N'Миглустат', 27, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (330, N'Метоклопрамид', 27, N'раствор для инъекций, раствор для внутривенного и внутримышечного введения, раствор для приема внутрь, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (331, N'Нитизинон', 27, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (332, N'Омепразол', 27, N'капсулы (в том числе кишечнорастворимые), таблетки, покрытые пленочной оболочкой, лиофилизат для приготовления раствора для внутривенного введения; лиофилизат для приготовления раствора инфузий, порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (333, N'Ондансетрон', 27, N'таблетки (в том числе покрытые оболочкой), раствор для внутривенного и внутримышечного введения, сироп, суппозитории ректальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (334, N'Панкреатин', 27, N'капсулы, таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (335, N'Ранитидин', 27, N'таблетки, покрытые оболочкой (в том числе пленочной), раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (336, N'Сеннозиды А и В', 27, N'таблетки, в том числе покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (337, N'Смектит доиктаэдрический', 27, N'порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (338, N'Урсодезоксихолевая кислота', 27, N'капсулы, таблетки, покрытые пленочной оболочкой, суспензия для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (339, N'Фамотидин', 27, N'таблетки, покрытые оболочкой (в том числе пленочной), лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (340, N'Фосфолипиды + Глицерризиновая кислота', 27, N'лиофилизат для приготовления раствора для внутривенного введения; капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (341, N'Эзомепразол', 27, N'капсулы кишечнорастворимые, таблетки, покрытые оболочкой, лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (342, N'Аллопуринол', 28, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (343, N'Вилдаглиптин', 29, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (344, N'Глибенкламид', 29, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (345, N'Гликлазид', 29, N'таблетки, в том числе пролонгированного действия (с модифицированным высвобождением)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (346, N'Инсулин аспарт', 29, N'раствор для подкожного и внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (347, N'Инсулин аспарт двухфазный', 29, N'суспензия для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (348, N'Инсулин гларгин', 29, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (349, N'Инсулин глулизин', 29, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (350, N'Инсулин двухфазный человеческий генно-инженерный', 29, N'суспензия для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (351, N'Инсулин деглудек', 29, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (352, N'Инсулин детемир', 29, N'раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (353, N'Инсулин изофан человеческий генно-инженерный', 29, N'суспензия для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (354, N'Инсулин лизпро двухфазный', 29, N'суспензия для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (355, N'Инсулин лизпро', 29, N'раствор для внутривенного и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (356, N'Инсулин растворимый человеческий генно-инженерный', 29, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (357, N'Метформин', 29, N'таблетки, в том числе покрытые оболочкой, таблетки пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (358, N'Репаглинид', 29, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (359, N'Росиглитазон', 29, N'таблетки, покрытые  пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (360, N'Саксаглиптин', 29, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (361, N'Ситаглиптин', 29, N'таблетки, покрытые  пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (362, N'Баклофен', 30, N'раствор для интратекального введения, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (363, N'Ботулинический токсин типа А-геммаглютинин комплекс', 30, N'лиофилизат для приготовления раствора для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (364, N'Бупивакаин', 30, N'раствор для интратекального введения, раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (365, N'Галотан', 30, N'жидкость для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (366, N'Динитрогена оксид', 30, N'газ сжатый', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (367, N'Дроперидол', 30, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (368, N'Кетамин', 30, N'раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (369, N'Натрия оксибутират', 30, N'раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (370, N'Лидокаин', 30, N'раствор для инъекций, раствор для внутривенного введения, спрей, гель, капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (371, N'Пипекурония бромид', 30, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (372, N'Прокаин', 30, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (373, N'Пропофол ', 30, N'эмульсия для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (374, N'Рокурония бромид', 30, N'раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (375, N'Ропивакаин', 30, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (376, N'Севофлуран', 30, N'жидкость для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (377, N'Сертиндол', 30, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (378, N'Суксаметония йодид и хлорид', 30, N'раствор для внутривенного и внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (379, N'Тиопентал натрия', 30, N'порошок для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (380, N'Алтеплаза', 31, N'лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (381, N'Альбумин', 31, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (382, N'Аминокапроновая кислота', 31, N'раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (383, N'Антиингибиторный', 31, N'коагулянтный комплекс лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (384, N'Апротинин', 31, N'лиофилизат для приготовления раствора для внутривенного введения; раствор для внутривенного введения, раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (385, N'Ацетилсалициловая кислота', 31, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (386, N'Варфарин', 31, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (387, N'Гепарин натрия', 31, N'раствор для инъекций, раствор для внутривенного и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (388, N'Дабигатрана этексилат', 31, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (389, N'Железа (III) гидроксида сахарозный комплекс', 31, N'раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (390, N'Железа (III) гидроксид полимальтозат', 31, N'жевательные таблетки; раствор для приема внутрь, сироп, капли для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (391, N'Клопидогрел', 31, N'таблетки покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (392, N'Менадиона натрия бисульфит', 31, N'раствор для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (393, N'Мороктоког альфа', 31, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (394, N'Октоког альфа', 31, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (395, N'Протамина сульфат', 31, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (396, N'Проурокиназа', 31, N'лиофилизат для приготовления раствора для внутривенного введения, раствора для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (397, N'Ривароксабан', 31, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (398, N'Рекомбинантный', 31, N'белок, содержащий аминокислотную последовательность стафилокиназы лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (399, N'Ромиплостим', 31, N'порошок для приготовления раствора для подкожного введения', NULL)
GO
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (400, N'Транексамовая кислота', 31, N'раствор для внутривенного введения, таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (401, N'Факторы сверывания крови  VII, VIII, IX', 31, N'лиофилизат для приготовления раствора для внутривенного введения; лиофилизат для приготовления раствора для инфузий; раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (402, N'Факторы сверывания крови II, IX, X  в комбинации', 31, N'лиофилизат приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (403, N'Фактор свертывания крови VIII +фактор Виллебранда', 31, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (404, N'Фолиевая кислота', 31, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (405, N'Цианокобаламин', 31, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (406, N'Эноксапарин натрия', 31, N'раствор для инъекций, раствор для подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (407, N'Эптаког альфа активированный', 31, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (408, N'Этамзилат', 31, N'раствор для инъекций; раствор для внутривенного и внутримышечного введения, раствор для иъекций и наружного применения; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (409, N'Амброксол', 32, N'таблетки; сироп, раствор для приема внутрь/ и ингаляций, раствор для инъекций, капсулы, пастилки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (410, N'Аминофиллин', 32, N'таблетки,  раствор для внутривенного, внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (411, N'Ацетилцистеин', 32, N'таблетки, таблетки шипучие; гранулы/порошок для приготовления раствора для приема внутрь, сироп', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (412, N'Беклометазон', 32, N'аэрозоль для ингаляций, аэрозоль/спрей назальный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (413, N'Будесонид', 32, N'суспензия /порошок/ аэрозоль/ капсулы/ раствор для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (414, N'Будесонид + формотерол', 32, N'порошок (капсулы с порошком) для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (415, N'Дорназа альфа', 32, N'раствор для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (416, N'Зафирлукаст', 32, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (417, N'Ипратропия бромид', 32, N'аэрозоль/раствор для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (418, N'Ипратропия бромид+фенотерол', 32, N'раствор для ингаляций, аэрозоль', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (419, N'Ксилометазолин', 32, N'капли назальные, спрей/гель назальный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (420, N'Кромоглициевая кислота', 32, N'аэрозоль/раствор  для ингаляций; капли глазные; капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (421, N'Порактант альфа', 32, N'суспензия для эндотрахеального введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (422, N'Сальбутамол', 32, N'аэрозоль/раствор для ингаляций, порошок для ингаляций, капсулы для ингаляций, таблетки пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (423, N'Салметерол+флутиказон', 32, N'аэрозоль/порошок  для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (424, N'Сурфактант', 32, N'лиофилизат для приготовления эмульсии для ингаляционного/ эндотрахеального/эндобронхиального и ингаляционного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (425, N'Тиотропия Бромид', 32, N'капсулы с порошком /раствор для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (426, N'Фенспирид', 32, N'таблетки, сироп', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (427, N'Формотерол', 32, N'капсулы/порошок, аэрозоль для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (428, N'Амиодарон', 33, N'раствор для внутривенного введения, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (429, N'Амлодипин', 33, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (430, N'Алпростадил', 33, N'концентрат/лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (431, N'Атенолол', 33, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (432, N'Аторвастатин', 33, N'таблетки, покрытые оболочкой, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (433, N'Ацетазоламид', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (434, N'Бозентан ', 33, N'таблетки, покрытые оболочкой пленочной', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (435, N'Бисопролол', 33, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (436, N'Верапамил', 33, N'таблетки, раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (437, N'Гидрохлортиазид', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (438, N'Дигоксин', 33, N'раствор для внутривенного введения; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (439, N'Добутамин', 33, N'раствор для инфузий; концентрат/лиофилизат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (440, N'Допамин', 33, N'раствор для инъекций, концентрат для приготовления раствора для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (441, N'Ивабрадин', 33, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (442, N'Изосорбида динитрат', 33, N'таблетки, таблетки пролонгированного действия; концентрат для приготовления раствора для инфузий, спрей дозированный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (443, N'Изосорбида мононитрат', 33, N'таблетки, капсулы, в том числе пролонгированного действия, с модифицированным высвобождением', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (444, N'Индапамид', 33, N'таблетки, капсулы, в том числе пролонгированного действия и покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (445, N'Калия и магния аспарагинат', 33, N'раствор для внутривенного введения; таблетки, в том числе покрытые оболочкой; раствор для инфузий', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (446, N'Каптоприл', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (447, N'Карведилол', 33, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (448, N'Клонидин', 33, N'раствор для внутривенного введения, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (449, N'Клопидогрел', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (450, N'Лаппаконитина гидробромид', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (451, N'Лизиноприл', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (452, N'Левосимендан', 33, N'концентрат для приготовления раствора для инфузий.', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (453, N'Лозартан', 33, N'таблетки, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (454, N'Магния сульфат', 33, N'раствор для внутривенного введения, внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (455, N'Мельдоний', 33, N'капсулы, раствор для внутривенного и парабульбарного введения; внутримышечного введения, раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (456, N'Метилдопа', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (457, N'Метопролол ', 33, N'таблетки, таблетки пролонгированного действия (с замедленным высвобождением), в том числе покрытые оболочкой; раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (458, N'Моксонидин', 33, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (459, N'Нимодипин', 33, N'раствор для инфузий, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (460, N'Нитроглицерин ', 33, N'таблетки, капсулы, аэрозоль; концентрат для приготовления раствора для инфузий; пленки для наклеивания на десну; раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (461, N'Нифедипин ', 33, N'раствор для инфузий; таблетки, в том числе покрытые оболочкой и пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (462, N'Норэпинефрин ', 33, N'концентрат для приготовления для раствора для внутривенного', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (463, N'Пентоксифиллин', 33, N'концентрат для приготовления раствора для внутривенного и внутриартериального введения/раствора для инфузий/ раствора для инъекций; раствор для инфузий, раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (464, N'Периндоприл', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (465, N'Прокаинамид', 33, N'раствор для внутривенного и внутримышечного введения, раствор для инъекций, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (466, N'Пропафенон', 33, N'раствор для внутривенного введения, таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (467, N'Пропранолол', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (468, N'Симвастатин', 33, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (469, N'Соталол ', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (470, N'Спиронолактон', 33, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (471, N'Урапидил', 33, N'раствор для внутривенного введения, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (472, N'Фенилэфрин ', 33, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (473, N'Фенофибрат', 33, N'капсулы, в том числе пролонгированного действия; таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (474, N'Фуросемид', 33, N'раствор для инъекций; раствор для внутривенного и внутримышечного введения; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (475, N'Эналаприл', 33, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (476, N'Эпинефрин', 33, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (477, N'Эпоэтин альфа', 33, N'раствор для внутривенного и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (478, N'Этоэтин бета (метоксиполиэтиленгликоль)', 33, N'раствор для подкожного и  внутривенного введения; лиофилизат для приготовления раствора для внутривенного и подкожного введения, раствор для внутривенного и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (479, N'Налоксон', 34, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (480, N'Налтрексон', 34, N'капсулы, таблетки; порошок для приготовления суспензии для внутримышечного введения пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (481, N'Бутиламиногидроксипропоксифеноксиметилметиооксадиазол', 35, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (482, N'Гипромеллоза', 35, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (483, N'Диклофенак', 35, N'глазные капли', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (484, N'Дорзоламид', 35, N'глазные капли', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (485, N'Оксибупрокаин', 35, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (486, N'Пилокарпин', 35, N'глазные капли', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (487, N'Ранибизумаб', 35, N'раствор для внутриглазного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (488, N'Тимолол', 35, N'глазные капли', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (489, N'Тропикамид', 35, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (490, N'Бария сульфат', 36, N'порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (491, N'Гадодиамид', 36, N'раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (492, N'Гадобутрол', 36, N'раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (493, N'Гадопентетовая кислота', 36, N'раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (494, N'Йогексол', 36, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (495, N'Йоверсол', 36, N'раствор для внутривенного и внутриартериального введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (496, N'Йогексол', 36, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (497, N'Йомепрол', 36, N'раствор для внутрисосудистого введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (498, N'Йопромид', 36, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (499, N'Натрия амидотризоат', 36, N'раствор для инъекций', NULL)
GO
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (500, N'Меброфенин', 37, N'лиофилизат для приготовления раствора для внутривенного  введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (501, N'Пентатех 99 mТс', 37, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (502, N'Пирфотех 99 mТс', 37, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (503, N'Стронция хлорид  89 Sr', 37, N'раствор для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (504, N'Технеция (99m ТС) фитат', 37, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (505, N'Технеция (99m ТС) оксабифор', 37, N'лиофилизат для приготовления раствора для внутривенного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (506, N'Алфузозин', 38, N'таблетки пролонгированного действия, таблетки с контролируемым высвобождением, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (507, N'Доксазозин', 38, N'таблетки, в том числе пролонгированного действия, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (508, N'Тамсулозин', 38, N'капсулы (в том числе кишечнорастворимые)/ таблетки пролонгированного действия/с модифицированным высвобождением', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (509, N'Финастерид', 38, N'таблетки покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (510, N'Аллерген бактерийный (туберкулезный рекомбинантный)', 39, N'раствор для внутрикожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (511, N'Адалимумаб', 42, N'раствор для подкожного введения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (512, N'Адеметионин', 42, N'таблетки, покрытые кишечнорастворимой оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (513, N'Азитромицин', 42, N'таблетки, покрытые оболочкой, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (514, N'Аллопуринол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (515, N'Альфакальцидол', 42, N'капсулы/таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (516, N'Алфузозин', 42, N'таблеткипролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (517, N'Амантадин,', 42, N'капсулы/таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (518, N'Амброксол', 42, N'сироп/раствор для приема внутрь, таблетки/капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (519, N'Аминофиллин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (520, N'Амиодарон', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (521, N'Амитриптилин', 42, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (522, N'Амлодипин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (523, N'Амоксициллин + Клавулановая кислота', 42, N'порошок для приготовления суспензии для приема внутрь, таблетки диспергируемые, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (524, N'Ампициллин', 42, N'порошок для приготовления суспензии для приема внутрь, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (525, N'Амоксициллин', 42, N'капсулы, таблетки, порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (526, N'Анастрозол', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (527, N'Алфузозин', 42, N'таблетки пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (528, N'Аскорбиновая кислота', 42, N'капли для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (529, N'Аспарагиназа', 42, N'лиофилизат для приготовления раствора для внутривенного и внутримышечного введения *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (530, N'Атенолол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (531, N'Аторвастатин', 42, N'капсулы, таблетки, покрытые оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (532, N'Ацетазоламид', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (533, N'Ацетилсалициловая', 42, N'кислота таблетки, покрытые кишечнорастворимой пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (534, N'Ацетилцистеин', 42, N'таблетки, таблетки шипучие, гранулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (535, N'Ацикловир', 42, N'мазь, мазь глазная, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (536, N'Баклофен', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (537, N'Бевацизумаб', 42, N'концентрат для приготовления раствора для инфузий*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (538, N'Беклометазон', 42, N'аэрозоль для ингаляций, спрей назальный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (539, N'Бензобарбитал', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (540, N'Бетагистин', 42, N'таблетки/капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (541, N'Бетаметазон', 42, N'крем, мазь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (542, N'Бикалутамид', 42, N'таблетки, покрытые оболочкой *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (543, N'Бипериден', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (544, N'Бисакодил', 42, N'суппозитории ректальные, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (545, N'Бисопролол', 42, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (546, N'Бифидобактерии бифидум', 42, N'лиофилизат для приготовления раствора для приема внутрь и местного применения, капсулы, таблетки, порошок для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (547, N'Бозентан', 42, N'таблетки, покрытые пленочной оболочкой**', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (548, N'Бромдигидрохлорфенил-бензодиазепин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (549, N'Бромокриптин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (550, N'Будесонид', 42, N'порошок/аэрозоль для ингаляций, суспензия для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (551, N'Бусульфан', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (552, N'Бутиламиногидроксипропоксифеноксиметил-метилоксадиазол', 42, N'глазные капли', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (553, N'Валганцикловир', 42, N'таблетки, покрытые оболочкой * (для СПИД и ВИЧ-инфицированных пациентов)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (554, N'Вальпроевая кислота', 42, N'таблетки /гранулы пролонгированного действия, покрытые оболочкой; таблетки, покрытые кишечнорастворимой оболочкой, сироп', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (555, N'Варфарин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (556, N'Верапамил', 42, N'таблетки, покрытые оболочкой; таблетки пролонгированного действия, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (557, N'Винпоцетин', 42, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (558, N'Висмута трикалия дицитрат', 42, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (559, N'Галоперидол', 42, N'раствор для внутримышечного введения [масляный]; таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (560, N'Ганцикловир', 42, N'лиофилизат для инфузий * (для СПИД и ВИЧ-инфицированных пациентов)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (561, N'Гексопреналин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (562, N'Гепарин натрия', 42, N'раствор для внутривенного и подкожного введения, раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (563, N'Гефитиниб', 42, N'таблетки, покрытые оболочкой *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (564, N'Гидроксикарбамид', 42, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (565, N'Гидрокортизон', 42, N'крем/мазь/раствор для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (566, N'Гидрохлоротиазид', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (567, N'Гипромеллоза', 42, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (568, N'Гозерелин', 42, N'капсула для подкожного введения пролонгированного действия *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (569, N'Дарбэпоэтин альфа', 42, N'раствор для инъекций*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (570, N'Десмопрессин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (571, N'Деферазирокс ', 42, N'таблетки диспергируемые**', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (572, N'Джозамицин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (573, N'Диазепам', 42, N'таблетки, покрытые оболочкой, раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (574, N'Дигоксин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (575, N'Диклофенак', 42, N'глазные капли, таблетки/капсулы пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (576, N'Доксазозин', 42, N'таблетки, в том числе пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (577, N'Доксициклин', 42, N'капсулы, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (578, N'Диоксрметилтетрагидро-пиримидин+сульфадиметоксин+тримекаин+', 42, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (579, N'хлорамфеникол', 42, N'мазь для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (580, N'Доксазозин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (581, N'Дорзоламид', 42, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (582, N'Дротаверин', 42, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (583, N'Железа [III] гидроксид полимальтозат', 42, N'таблетки жевательные, сироп капли/раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (584, N'Железа [III] гидроксида сахарозный комплекс', 42, N'раствор для внутривенного введения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (585, N'Зафирлукаст', 42, N'таблетки, покрытые оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (586, N'Золедроновая кислота', 42, N'концентрат/лиофилизат для приготовления раствора для инфузий, для внутривенного введения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (587, N'Зопиклон', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (588, N'Зуклопентиксол', 42, N'раствор для внутримышечного введения [масляный]*, таблетки, покрытые оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (589, N'Ибупрофен суспензия', 42, N'/гранулы для приема внутрь, гель для наружного применения, таблетки покрытые оболочкой/капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (590, N'Изосорбид динитрат', 42, N'таблетки, таблетки пролонгированного действия, спрей дозированный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (591, N'Изосорбид мононитрат', 42, N'капсулы пролонгированного действия, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (592, N'Имипрамин', 42, N'драже, таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (593, N'Иммуноглобулин человека нормальный', 42, N'лиофилизат для приготовления раствора для инфузий/внутривенного введения; раствор для инфузий/внутривенного введения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (594, N'Индапамид ', 42, N'капсулы, таблетки, покрытые оболочкой, таблетки с модифицированным высвобождением', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (595, N'Интерферон альфа 2b', 42, N'капли назальные ***', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (596, N'Интерферон альфа-2b', 42, N'суппозитории ректальные ***', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (597, N'Интерферон альфа-2b', 42, N'лиофилизат для приготовления раствора для инъекций, раствор для инъекций*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (598, N'Инфликсимаб лиофилизат', 42, N'для приготовления раствора для инфузий*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (599, N'Ипратропия бромид + Фенотерол', 42, N'аэрозоль для ингаляций; раствор для ингаляций', NULL)
GO
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (600, N'Ипратропия бромид', 42, N'аэрозоль для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (601, N'Йод+калия йодид+глицерол', 42, N'раствор/спрей для местного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (602, N'Кагоцел', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (603, N'Калия и магния аспарагинат', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (604, N'Кальцитонин', 42, N'спрей назальный *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (605, N'Кальцитриол', 42, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (606, N'Кальция глюконат', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (607, N'Кальция фолинат', 42, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (608, N'Капецитабин', 42, N'таблетки, покрытые оболочкой *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (609, N'Каптоприл', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (610, N'Карбамазепин', 42, N'таблетки, таблетки пролонгированного действия, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (611, N'Карведилол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (612, N'Кветиапин ', 42, N'таблетки пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (613, N'Кетоаналоги аминокислот', 42, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (614, N'Кетопрофен', 42, N'капсулы, таблетки ретард', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (615, N'Кеторолак ', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (616, N'Кларитромицин', 42, N'таблетки, покрытые оболочкой, гранулы, суспензия для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (617, N'Клоназепам ', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (618, N'Клонидин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (619, N'Клопидогрел', 42, N'таблетки, покрытые оболочкой *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (620, N'Клотримазол', 42, N'гель/таблетки/суппозитории вагинальные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (621, N'Колекальциферол', 42, N'капли/раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (622, N'Ко-тримоксазол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (623, N'Кромоглициевая кислота', 42, N'аэрозоль для ингаляций дозированный, капсулы, раствор для ингаляций, спрей назальный дозированный*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (624, N'Ксилометазолин 0,05%', 42, N'капли назальные/спрей/гель нальный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (625, N'Лактулоза', 42, N'сироп', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (626, N'Ламотриджин', 42, N'таблетки*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (627, N'Леветитирацетам', 42, N'таблетки, покрытые оболочкой*, раствор для приема внутрь*+***', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (628, N'Леводопа + Бенсеразид', 42, N'капсулы/таблетки, таблетки диспергируемые', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (629, N'Леводопа + Карбидопа', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (630, N'Левомепромазин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (631, N'Левотироксин натрия', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (632, N'Леналидомид', 42, N'капсулы **', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (633, N'Лефлуномид', 42, N'таблетки, покрытые пленочной оболочкой *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (634, N'Лизиноприл', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (635, N'Лозартан', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (636, N'Ломустин', 42, N'капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (637, N'Лоперамид', 42, N'капсулы/таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (638, N'Лоратадин', 42, N'таблетки, сироп/суспензия для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (639, N'Лорноксикам', 42, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (640, N'Мебеверин', 42, N'капсулы пролонгированного действия, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (641, N'Мебендазол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (642, N'Медроксипрогестерон', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (643, N'Мельдоний', 42, N'капсулы*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (644, N'Мелфалан', 42, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (645, N'Меркаптопурин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (646, N'Метилдопа', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (647, N'Метилпреднизолон', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (648, N'Метоклопрамид', 42, N'таблетки, раствор для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (649, N'Метопролол', 42, N'таблетки, в том числе покрытые оболочкой, пролонгированного действия, с замедленным высвобождением', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (650, N'Метотрексат ', 42, N'раствор для инъекций, таблетки покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (651, N'Метронидазол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (652, N'Микофенолата', 42, N'мофетил капсулы, таблетки, покрытые оболочкой**', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (653, N'Моксонидин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (654, N'Мометазон', 42, N'спрей назальный, крем/мазь/раствор для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (655, N'Морфин', 42, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (656, N'Нандролон', 42, N'раствор для внутримышечного введения (масляный)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (657, N'Нилотиниб,', 42, N'капсулы**', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (658, N'Нистатин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (659, N'Нитразепам', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (660, N'Нитроглицерин', 42, N'спрей/аэрозоль подъязычный дозированный, таблетки/капсулы подъязычные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (661, N'Нифедипин', 42, N'таблетки, таблетки с замедленным высвобождением', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (662, N'N-карбамоилметил-4-фенил-2-пирролидон', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (663, N'Оксакарбазепин', 42, N'таблетки, покрытые пленочной  оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (664, N'Оксациллин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (665, N'Октреотид', 42, N'лиофилизат/микросферы для приготовления суспензии для внутримышечного введения, в том числе пролонгированного действия*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (666, N'Оланзапин', 42, N'таблетки, в том числе диспергируемые, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (667, N'Омепразол', 42, N'капсулы, в том числе кишечнорастворимые, порошок для приготовления суспензии для приема внутрь, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (668, N'Ондансентрон', 42, N'сироп, таблетки, суппозитории', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (669, N'Офлоксацин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (670, N'Панкреатин', 42, N'капсулы, таблетки покрытые кишечнорастворимой оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (671, N'Парацетамол ', 42, N'сироп/гранулы/суспензия для приема внутрь, суппозитории ректальные, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (672, N'Пароксетин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (673, N'Пеницилламин', 42, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (674, N'Периндоприл', 42, N'таблетки, в том числе покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (675, N'Перфеназин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (676, N'Пилокарпин ', 42, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (677, N'Пимекролимус', 42, N'крем для наружного применения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (678, N'Пипофезин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (679, N'Пирацетам ', 42, N'капсулы/таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (680, N'Пирибедил', 42, N'таблетки с контролируемым высвобождением покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (681, N'Пиридостигмина', 42, N'бромид таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (682, N'Платифиллин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (683, N'Повидон-йод', 42, N'раствор для местного и наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (684, N'Прамипексол', 42, N'таблетки*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (685, N'Преднизолон', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (686, N'Прокаинамид', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (687, N'Пропафенон', 42, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (688, N'Пропионилфенилэтоксиэтилпиперидин', 42, N'таблетки защечные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (689, N'Пропранолол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (690, N'Пэгинтерферон альфа2a', 42, N'раствор для инъекций * (для СПИД и ВИЧ-инфицированных пациентов)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (691, N'Пэгинтерферон альфа2b', 42, N'лиофилизат для приготовления раствора для подкожного введения * (для СПИД и ВИЧ-инфицированных пациентов, детей, больных вирусным гепатитом до 18 лет)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (692, N'Ранитидин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (693, N'Ретинол', 42, N'драже/капсулы, капли /раствор для приема внутрь, мазь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (694, N'Рибавирин', 42, N'таблетки * (для СПИД и ВИЧ-инфицированных пациентов, детей с вирусным гепатитом до 18 лет)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (695, N'Ривароксабан', 42, N'таблетки, покрытые пленочной оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (696, N'Рисперидон', 42, N'таблетки, покрытые оболочкой, таблетки для рассасывания*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (697, N'Ритуксимаб', 42, N'концентрат для приготовления инфузионного раствора (флаконы) * (для пациентов с ревматоидным артритом)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (698, N'Рифамицин', 42, N'капли ушные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (699, N'Салициловая кислота', 42, N'мазь/раствор для наружного применения', NULL)
GO
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (700, N'Салметерол', 42, N'+ Флутиказон аэрозоль для ингаляций дозированный, порошок для ингаляций дозированный', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (701, N'Сальбутамол ', 42, N'аэрозоль для ингаляций, раствор для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (702, N'Силденафил', 42, N'таблетки, покрытые пленочной оболочкой ** (для назначения по жизненным показаниям гражданам, страдающим орфанными заболеваниями и детям с легочной гипертензией)', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (703, N'Симвастатин', 42, N'таблетки, покрытые оболочкой *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (704, N'Смектит', 42, N'диоктаэдрический порошок для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (705, N'Соталол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (706, N'Спиронолактон', 42, N'таблетки, капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (707, N'Сульпирид', 42, N'капсулы, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (708, N'Сульфасалазин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (709, N'Тамоксифен', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (710, N'Тамсулозин', 42, N'капсулы с модифицированным высвобождением, таблетки пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (711, N'Темозоломид', 42, N'капсулы *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (712, N'Тиамазол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (713, N'Тизанидин', 42, N'таблетки /капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (714, N'Тимолол', 42, N'капли глазные', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (715, N'Тиоктовая кислота', 42, N'капсулы/таблетки, покрытые оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (716, N'Тиоридазин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (717, N'Тиотропия бромид', 42, N'капсулы с порошком для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (718, N'Топирамат', 42, N'капсулы/таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (719, N'Тоцилизумаб', 42, N'концентрат для приготовления раствора для инфузий***', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (720, N'Трамадол', 42, N'раствор для инъекций, суппозитории ректальные, таблетки, таблетки пролонгированного действия покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (721, N'Трастузумаб', 42, N'лиофилизат для приготовления раствора для инфузий *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (722, N'Тригексифенидил', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (723, N'Тримеперидин', 42, N'раствор для инъекций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (724, N'Трипторелин', 42, N'лиофилизат для приготовления раствора для подкожного введения/внутримышечного введения пролонгированного действия*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (725, N'Трифлуоперазин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (726, N'Умифеновир', 42, N'капсулы, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (727, N'Урапидил', 42, N'капсулы пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (728, N'Урсодезоксихолевая кислота', 42, N'капсулы/таблетки, суспензия для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (729, N'Фамотидин', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (730, N'Фенитоин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (731, N'Фенобарбитал', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (732, N'Фенофибрат', 42, N'капсулы, таблетки, в том числе покрытые оболочкой, пролонгированного действия', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (733, N'Фенспирид', 42, N'сироп***', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (734, N'Фентанил', 42, N'трансдермальная терапевтическая система', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (735, N'Финастерид', 42, N'таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (736, N'Флудрокортизон', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (737, N'Флуконазол', 42, N'капсулы, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (738, N'Флуоксетин', 42, N'капсулы /таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (739, N'Флупентиксол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (740, N'Флутамид', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (741, N'Флуфеназин', 42, N'* раствор для внутримышечного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (742, N'Фолиевая кислота', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (743, N'Формотерол', 42, N'капсулы с порошком для ингаляций, аэрозоль/порошок для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (744, N'Формотерол+Будесонид', 42, N'порошок для ингаляций, капсулы с порошком для ингаляций', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (745, N'Фосфолипиды+глицирризиновая', 42, N'кислота капсулы', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (746, N'Фулвестрант', 42, N'раствор внутримышечного введения *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (747, N'Фуросемид', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (748, N'Хлорамбуцил', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (749, N'Хлорамфеникол', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (750, N'Хлоргексидин', 42, N'раствор для местного/наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (751, N'Хлоропирамин', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (752, N'Хлорпромазин', 42, N'драже, таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (753, N'Цетиризин', 42, N'таблетки, покрытые оболочкой, сироп /капли для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (754, N'Цефазолин', 42, N'порошок для приготовления раствора для внутривенного и внутримышечного введения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (755, N'Цефуроксим', 42, N'гранулы для приготовления суспензии для приема внутрь', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (756, N'Циклоспорин ', 42, N'капсулы мягкие, раствор для приема внутрь*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (757, N'Циклофосфамид', 42, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (758, N'Ципрофлоксацин', 42, N'капли глазные и ушные, таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (759, N'Эналаприл', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (760, N'Эноксапарин натрия', 42, N'раствор для инъекций, раствор для подкожного введения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (761, N'Эпоэтин альфа', 42, N'раствор для инъекций**', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (762, N'Эпоэтин бета', 42, N'раствор для инъекций, лиофилизат для приготовления раствора для инъекций *', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (763, N'Эрлотиниб', 42, N'таблетки, покрытые пленочной оболочкой **', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (764, N'Этамзилат', 42, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (765, N'Этанерцепт', 42, N'лиофилизат для приготовления раствора для подкожного введения с растворителем, шприцами, иглами, салфетками в комплекте ***+**', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (766, N'Этанол', 42, N'раствор для наружного применения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (767, N'Этилметилгидроксипиридина сукцинат', 42, N'капсулы/таблетки, покрытые пленочной оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (768, N'Бинт стерильный, нестерильный (для онкологических больных)', 42, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (769, N'Шприцы для инсулинов (с иглами)', 42, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (770, N'Вилдаглиптин', 41, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (771, N'Глибенкламид', 41, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (772, N'Гликлазид', 41, N'таблетки, таблетки с модифицированным высвобождением', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (773, N'Иглы одноразовые к глюкометрам', 41, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (774, N'Инсулин аспарт двухфазный Флекс Пен', 41, N' суспензия для подкожного введения картриджи со шприц-ручкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (775, N'Инсулин аспарт ФлексПен', 41, N' раствор для подкожного и внутривенного введения  шприц-ручки мультидозовые одноразовые', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (776, N'Инсулин гларгин', 41, N' раствор для подкожного введения в шприц-ручках', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (777, N'Инсулин глулизин', 41, N' раствор для подкожного введения в шприц-ручках', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (778, N'Инсулин деглудек', 41, N' раствор для подкожного введения*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (779, N'Инсулин детемир ФлексПен', 41, N' раствор для подкожного введения шприц-ручки мультидозовые одноразовые', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (780, N'Инсулин лизпро', 41, N' раствор для внутривенного и подкожного введения', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (781, N'Инсулин растворимый (человеческий генно-инженерный)', 41, N' раствор для инъекций картриджи', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (782, N'Инсулин-изофан пенфилл', 41, N' суспензия для подкожного введения картриджи', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (783, N'Саксаглиптин', 41, N'таблетки, покрытые оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (784, N'Ситаглиптин', 41, N'таблетки покрытые пленочной оболочкой*', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (785, N'Метформин', 41, N'таблетки, покрытые оболочкой', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (786, N'Расходные материалы для дозатора инсулинового инфузионного***', 41, N'', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (787, N'Репаглинид', 41, N'таблетки', NULL)
INSERT [dbo].[Medicine] ([Id], [MedicineName], [IdCategory], [Description], [Manufacture]) VALUES (788, N'Росиглитазон', 41, N'таблетки, покрытые пленочной оболочкой', NULL)
SET IDENTITY_INSERT [dbo].[Medicine] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Login], [Password], [IdEmployee]) VALUES (1, N'L', N'P', 1)
INSERT [dbo].[Users] ([Id], [Login], [Password], [IdEmployee]) VALUES (2, N'ShapoValov', N'157', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_HospitalDepartament] FOREIGN KEY([IdHospitalDepartment])
REFERENCES [dbo].[HospitalDepartament] ([Id])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_HospitalDepartament]
GO
ALTER TABLE [dbo].[Balance]  WITH CHECK ADD  CONSTRAINT [FK_Balance_Medicine] FOREIGN KEY([IdMedicine])
REFERENCES [dbo].[Medicine] ([Id])
GO
ALTER TABLE [dbo].[Balance] CHECK CONSTRAINT [FK_Balance_Medicine]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_HospitalDepartament] FOREIGN KEY([IdHospitalDepartment])
REFERENCES [dbo].[HospitalDepartament] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_HospitalDepartament]
GO
ALTER TABLE [dbo].[LogOfReceipts]  WITH CHECK ADD  CONSTRAINT [FK_LogOfReceipts_HospitalDepartament] FOREIGN KEY([IdHospitalDepartament])
REFERENCES [dbo].[HospitalDepartament] ([Id])
GO
ALTER TABLE [dbo].[LogOfReceipts] CHECK CONSTRAINT [FK_LogOfReceipts_HospitalDepartament]
GO
ALTER TABLE [dbo].[LogOfReceipts]  WITH CHECK ADD  CONSTRAINT [FK_LogOfReceipts_Medicine] FOREIGN KEY([IdMedicine])
REFERENCES [dbo].[Medicine] ([Id])
GO
ALTER TABLE [dbo].[LogOfReceipts] CHECK CONSTRAINT [FK_LogOfReceipts_Medicine]
GO
ALTER TABLE [dbo].[LogWriteOff]  WITH CHECK ADD  CONSTRAINT [FK_LogWriteOff_Balance] FOREIGN KEY([IdBalance])
REFERENCES [dbo].[Balance] ([Id])
GO
ALTER TABLE [dbo].[LogWriteOff] CHECK CONSTRAINT [FK_LogWriteOff_Balance]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Category]
GO
ALTER TABLE [dbo].[OrderDeyails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDeyails_Medicine] FOREIGN KEY([IdMedicine])
REFERENCES [dbo].[Medicine] ([Id])
GO
ALTER TABLE [dbo].[OrderDeyails] CHECK CONSTRAINT [FK_OrderDeyails_Medicine]
GO
ALTER TABLE [dbo].[OrderDeyails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDeyails_Orders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDeyails] CHECK CONSTRAINT [FK_OrderDeyails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employee]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_HospitalDepartament] FOREIGN KEY([IdDepartament])
REFERENCES [dbo].[HospitalDepartament] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_HospitalDepartament]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employee]
GO
USE [master]
GO
ALTER DATABASE [Medicina] SET  READ_WRITE 
GO
