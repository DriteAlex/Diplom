USE [master]
GO
/****** Object:  Database [Medicina]    Script Date: 31.05.2024 22:05:54 ******/
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
/****** Object:  Table [dbo].[Balance]    Script Date: 31.05.2024 22:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balance](
	[Id] [int] NOT NULL,
	[IdMedicine] [int] NULL,
	[IdHospitalDepartment] [int] NULL,
	[ImplementationMonht] [nvarchar](10) NULL,
	[ImplementationYear] [nvarchar](10) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Balance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Jd] [int] NOT NULL,
	[NameCategory] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Jd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[Nane] [nvarchar](20) NOT NULL,
	[Patronymic] [nvarchar](20) NOT NULL,
	[Surname] [nvarchar](20) NOT NULL,
	[IdHospitalDepartment] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalDepartament]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalDepartament](
	[Id] [int] NOT NULL,
	[NameDepartament] [nvarchar](50) NULL,
 CONSTRAINT [PK_HospitalDepartament] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogOfReceipts]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogOfReceipts](
	[Id] [int] NOT NULL,
	[IdMedicune] [int] NOT NULL,
	[DateRecepts] [date] NOT NULL,
	[QuantityReceipts] [int] NOT NULL,
	[ImplementationMonht] [nvarchar](10) NULL,
	[ImplementationYear] [nvarchar](10) NULL,
	[IdHospitalDepartament] [int] NULL,
 CONSTRAINT [PK_LogOfReceipts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogWriteOff]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogWriteOff](
	[Id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Medicine]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[OrderDeyails]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDeyails](
	[id] [int] NOT NULL,
	[IdOrder] [int] NULL,
	[IdMedicine] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDeyails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] NOT NULL,
	[DateOrder] [date] NULL,
	[IdHospitalDepartament] [int] NULL,
	[IdEmployee] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.05.2024 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[IdEmployee] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[LogOfReceipts]  WITH CHECK ADD  CONSTRAINT [FK_LogOfReceipts_Medicine] FOREIGN KEY([IdMedicune])
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
REFERENCES [dbo].[Category] ([Jd])
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_HospitalDepartament] FOREIGN KEY([IdHospitalDepartament])
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
