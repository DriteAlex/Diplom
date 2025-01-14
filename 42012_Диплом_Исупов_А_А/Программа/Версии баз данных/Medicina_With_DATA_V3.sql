USE [master]
GO
/****** Object:  Database [Medicina]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[Balance]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[HospitalDepartament]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[LogOfReceipts]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[LogWriteOff]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[Medicine]    Script Date: 01.06.2024 12:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [nvarchar](50) NULL,
	[IdCategory] [int] NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Manufacture] [nvarchar](50) NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDeyails]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 01.06.2024 12:12:00 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 01.06.2024 12:12:00 ******/
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
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [IdHospitalDepartment]) VALUES (1, N'Исупов', N'Алексей', N'Александрович', NULL)
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
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Login], [Password], [IdEmployee]) VALUES (1, N'L', N'P', 1)
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
