USE [master]
GO
/****** Object:  Database [Practica 7]    Script Date: 01/11/2019 02:01:34 p. m. ******/
CREATE DATABASE [Practica 7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica 7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica 7.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica 7_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica 7_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Practica 7] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica 7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica 7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica 7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica 7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica 7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica 7] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica 7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica 7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica 7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica 7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica 7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica 7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica 7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica 7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica 7] SET RECURSIVE_TRIGGERS ON 
GO
ALTER DATABASE [Practica 7] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica 7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica 7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica 7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica 7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica 7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica 7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica 7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica 7] SET RECOVERY FULL 
GO
ALTER DATABASE [Practica 7] SET  MULTI_USER 
GO
ALTER DATABASE [Practica 7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica 7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica 7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica 7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica 7] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practica 7', N'ON'
GO
ALTER DATABASE [Practica 7] SET QUERY_STORE = OFF
GO
USE [Practica 7]
GO
/****** Object:  User [ClaseBD]    Script Date: 01/11/2019 02:01:34 p. m. ******/
CREATE USER [ClaseBD] FOR LOGIN [ClaseBD] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Alan]    Script Date: 01/11/2019 02:01:34 p. m. ******/
CREATE USER [Alan] FOR LOGIN [Code] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[empleado_id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[primerApellido] [varchar](20) NOT NULL,
	[edad] [int] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[email] [varchar](20) NOT NULL,
	[estadoCivil] [varchar](10) NOT NULL,
	[nombreCompleto]  AS ((([nombre]+' ')+[primerApellido])+' '),
PRIMARY KEY CLUSTERED 
(
	[empleado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formaDePago]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formaDePago](
	[formaPago_id] [varchar](20) NOT NULL,
	[contado] [int] NOT NULL,
	[tarjeta] [int] NULL,
	[factura] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[marca_id] [int] NOT NULL,
	[detalleMarca] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[marca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[negocio]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[negocio](
	[negocio_id] [int] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[horario] [int] NOT NULL,
	[datosGenerales]  AS ((([direccion]+' ')+[horario])+' '),
PRIMARY KEY CLUSTERED 
(
	[negocio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[presentacion]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presentacion](
	[presentacion_id] [int] NOT NULL,
	[detallePresentacion] [varchar](15) NULL,
	[detalleTamaño] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[presentacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[proveedor_id] [int] NOT NULL,
	[detalleProveedor] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[proveedor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tamaño]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tamaño](
	[tamaño_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tamaño_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[ticket_id] [int] NOT NULL,
	[negocio_id] [int] NOT NULL,
	[empleado_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unidadmedida]    Script Date: 01/11/2019 02:01:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unidadmedida](
	[uniDeMedida_id] [int] NOT NULL,
	[detalleUnidad] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uniDeMedida_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[presentacion] ([presentacion_id], [detallePresentacion], [detalleTamaño]) VALUES (1, N'embotellado', NULL)
INSERT [dbo].[presentacion] ([presentacion_id], [detallePresentacion], [detalleTamaño]) VALUES (2, N'bolsa', NULL)
INSERT [dbo].[presentacion] ([presentacion_id], [detallePresentacion], [detalleTamaño]) VALUES (3, N'plastico', NULL)
INSERT [dbo].[presentacion] ([presentacion_id], [detallePresentacion], [detalleTamaño]) VALUES (4, N'caja', NULL)
INSERT [dbo].[presentacion] ([presentacion_id], [detallePresentacion], [detalleTamaño]) VALUES (5, N'paquete', NULL)
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (1, N'Sabritas')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (2, N'Pepsi')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (3, N'Coca Cola')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (4, N'Ricolino')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (5, N'Gamesa')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (6, N'Bonafont')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (7, N'Powerade')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (8, N'Monster')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (9, N'Epura')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (10, N'Bimbo')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (11, N'Trigger')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (12, N'Oie zi')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (13, N'Sin Nombre')
INSERT [dbo].[proveedor] ([proveedor_id], [detalleProveedor]) VALUES (14, N'Proude')
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_infoEmpleado] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleado] ([empleado_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_infoEmpleado]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_infoNegocio] FOREIGN KEY([negocio_id])
REFERENCES [dbo].[negocio] ([negocio_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_infoNegocio]
GO
USE [master]
GO
ALTER DATABASE [Practica 7] SET  READ_WRITE 
GO
