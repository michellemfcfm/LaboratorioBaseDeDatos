USE [Practica7MMCA]
GO
/****** Object:  Trigger [trEliminaSoloUnaCategoria]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TRIGGER [dbo].[trEliminaSoloUnaCategoria]
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_ticketDetalle]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP PROCEDURE [dbo].[Eliminar_ticketDetalle]
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_ticket]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP PROCEDURE [dbo].[Eliminar_ticket]
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_proveedor]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP PROCEDURE [dbo].[Eliminar_proveedor]
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_producto]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP PROCEDURE [dbo].[Eliminar_producto]
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_marca]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP PROCEDURE [dbo].[Eliminar_marca]
GO
ALTER TABLE [dbo].[ticketdetalle] DROP CONSTRAINT [FK_producto]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [FK_infoNegocio]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [FK_infoEmpleado]
GO
ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_uniDeMedida]
GO
ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_tamaño]
GO
ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_proveedor]
GO
ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_presentacion]
GO
ALTER TABLE [dbo].[producto] DROP CONSTRAINT [FK_marca]
GO
/****** Object:  Table [dbo].[unidadmedida]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[unidadmedida]
GO
/****** Object:  Table [dbo].[tamaño]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[tamaño]
GO
/****** Object:  Table [dbo].[presentacion]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[presentacion]
GO
/****** Object:  Table [dbo].[negocio]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[negocio]
GO
/****** Object:  Table [dbo].[formaDePago]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[formaDePago]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[empleado]
GO
/****** Object:  View [dbo].[vw_ticketDetalle]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP VIEW [dbo].[vw_ticketDetalle]
GO
/****** Object:  Table [dbo].[ticketdetalle]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[ticketdetalle]
GO
/****** Object:  View [dbo].[vw_ticket]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP VIEW [dbo].[vw_ticket]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[ticket]
GO
/****** Object:  View [dbo].[vw_Productos]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP VIEW [dbo].[vw_Productos]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[producto]
GO
/****** Object:  View [dbo].[vw_Proveedores]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP VIEW [dbo].[vw_Proveedores]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[proveedor]
GO
/****** Object:  View [dbo].[vw_Marcas]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP VIEW [dbo].[vw_Marcas]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP TABLE [dbo].[marca]
GO
USE [master]
GO
/****** Object:  Database [Practica7MMCA]    Script Date: 02/11/2019 06:52:27 p. m. ******/
DROP DATABASE [Practica7MMCA]
GO
/****** Object:  Database [Practica7MMCA]    Script Date: 02/11/2019 06:52:27 p. m. ******/
CREATE DATABASE [Practica7MMCA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica7MMCA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica7MMCA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica7MMCA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica7MMCA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Practica7MMCA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica7MMCA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica7MMCA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica7MMCA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica7MMCA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica7MMCA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica7MMCA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica7MMCA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica7MMCA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica7MMCA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica7MMCA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica7MMCA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica7MMCA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica7MMCA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica7MMCA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica7MMCA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica7MMCA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica7MMCA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica7MMCA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica7MMCA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica7MMCA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica7MMCA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica7MMCA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica7MMCA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica7MMCA] SET RECOVERY FULL 
GO
ALTER DATABASE [Practica7MMCA] SET  MULTI_USER 
GO
ALTER DATABASE [Practica7MMCA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica7MMCA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica7MMCA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica7MMCA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica7MMCA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practica7MMCA', N'ON'
GO
ALTER DATABASE [Practica7MMCA] SET QUERY_STORE = OFF
GO
USE [Practica7MMCA]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
/****** Object:  View [dbo].[vw_Marcas]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[vw_Marcas]  
   AS  
   SELECT marca.detalleMarca FROM marca;  
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
/****** Object:  View [dbo].[vw_Proveedores]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[vw_Proveedores]
   AS  
   SELECT proveedor.detalleProveedor FROM proveedor;  
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[producto_id] [varchar](20) NOT NULL,
	[proveedor_id] [int] NOT NULL,
	[marca_id] [int] NOT NULL,
	[tamaño_id] [int] NOT NULL,
	[presentacion_id] [int] NOT NULL,
	[uniDeMedida_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Productos]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Productos]
   AS  
   SELECT producto.producto_id FROM producto;  
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
/****** Object:  View [dbo].[vw_ticket]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ticket]
   AS  
   SELECT ticket.ticket_id FROM ticket;  
GO
/****** Object:  Table [dbo].[ticketdetalle]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticketdetalle](
	[ticketDetalle_id] [varchar](20) NOT NULL,
	[producto_id] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ticketDetalle]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ticketDetalle]
   AS  
   SELECT ticketdetalle.ticketDetalle_id FROM ticketdetalle;  
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
/****** Object:  Table [dbo].[formaDePago]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
/****** Object:  Table [dbo].[negocio]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
/****** Object:  Table [dbo].[presentacion]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
/****** Object:  Table [dbo].[tamaño]    Script Date: 02/11/2019 06:52:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tamaño](
	[tamaño_id] [int] NOT NULL,
	[detalleTamaño] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[tamaño_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[unidadmedida]    Script Date: 02/11/2019 06:52:27 p. m. ******/
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
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (1, N'Sabritas')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (2, N'Pringles')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (3, N'Gamesa')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (4, N'Vero')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (5, N'Bimbo')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (6, N'quaker')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (7, N'Marinela')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (8, N'Pepsi')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (9, N'Coca Cola')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (10, N'Peñafiel')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (11, N'Del Valle')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (12, N'Ferrero')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (13, N'Kosher')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (14, N'Ricolino')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (15, N'Lucas')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (16, N'Sonrics')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (17, N'Bubbalob')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (18, N'Barrilitos')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (19, N'Big Cola')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (20, N'Drew Mountain')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (21, N'sidral mundet')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (22, N'Electrolit')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (23, N'Alpura')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (24, N'Lala')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (25, N'Sello Rojo')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (27, N'Boing')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (28, N'Gatorade')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (29, N'Red Bull')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (30, N'Bonafont')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (31, N'Be Light')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (32, N'Fuze Tea')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (33, N'Epura')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (34, N'Valle Fruit')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (35, N'Monster')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (36, N'Yakult')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (37, N'Natures Factory')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (38, N' A De Coco')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (39, N'Valley Foods')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (40, N'Ami')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (41, N'Boost')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (42, N' Pau-Pau ')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (43, N'Cafe Ole')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (44, N'Soyapac')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (45, N'Frut')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (46, N'Vida')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (47, N'Bonafont Kids')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (48, N' Ciel')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (49, N' Calahua')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (50, N'Pureza Vital')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (51, N'Fuze')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (52, N'Powerade')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (53, N'Bonafont Levite ')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (54, N'Be Light H2o')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (55, N'Starbucks')
INSERT [dbo].[marca] ([marca_id], [detalleMarca]) VALUES (56, N'Levite')
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
INSERT [dbo].[tamaño] ([tamaño_id], [detalleTamaño]) VALUES (2, N'chico')
INSERT [dbo].[tamaño] ([tamaño_id], [detalleTamaño]) VALUES (3, N'mediano')
INSERT [dbo].[tamaño] ([tamaño_id], [detalleTamaño]) VALUES (4, N'grande')
INSERT [dbo].[unidadmedida] ([uniDeMedida_id], [detalleUnidad]) VALUES (1, N'kilogramos')
INSERT [dbo].[unidadmedida] ([uniDeMedida_id], [detalleUnidad]) VALUES (2, N'litros')
INSERT [dbo].[unidadmedida] ([uniDeMedida_id], [detalleUnidad]) VALUES (3, N'mililitros')
INSERT [dbo].[unidadmedida] ([uniDeMedida_id], [detalleUnidad]) VALUES (4, N'miligramos')
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_marca] FOREIGN KEY([marca_id])
REFERENCES [dbo].[marca] ([marca_id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_marca]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_presentacion] FOREIGN KEY([presentacion_id])
REFERENCES [dbo].[presentacion] ([presentacion_id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_presentacion]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_proveedor] FOREIGN KEY([proveedor_id])
REFERENCES [dbo].[proveedor] ([proveedor_id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_proveedor]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_tamaño] FOREIGN KEY([tamaño_id])
REFERENCES [dbo].[tamaño] ([tamaño_id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_tamaño]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_uniDeMedida] FOREIGN KEY([uniDeMedida_id])
REFERENCES [dbo].[unidadmedida] ([uniDeMedida_id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_uniDeMedida]
GO
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
ALTER TABLE [dbo].[ticketdetalle]  WITH CHECK ADD  CONSTRAINT [FK_producto] FOREIGN KEY([producto_id])
REFERENCES [dbo].[producto] ([producto_id])
GO
ALTER TABLE [dbo].[ticketdetalle] CHECK CONSTRAINT [FK_producto]
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_marca]    Script Date: 02/11/2019 06:52:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_marca]
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM marca WHERE marca_id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_producto]    Script Date: 02/11/2019 06:52:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_producto]
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM producto WHERE producto_id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_proveedor]    Script Date: 02/11/2019 06:52:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_proveedor]
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM proveedor WHERE proveedor_id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_ticket]    Script Date: 02/11/2019 06:52:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_ticket]
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM ticket WHERE ticket_id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_ticketDetalle]    Script Date: 02/11/2019 06:52:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_ticketDetalle]
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM ticketdetalle WHERE ticketDetalle_id = @id;
END
GO
/****** Object:  Trigger [dbo].[trEliminaSoloUnaCategoria]    Script Date: 02/11/2019 06:52:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[trEliminaSoloUnaCategoria]
on [dbo].[marca] for delete
As
IF (Select COUNT(*) from Deleted)>1
BEGIN
Rollback Tran
END
GO
ALTER TABLE [dbo].[marca] ENABLE TRIGGER [trEliminaSoloUnaCategoria]
GO
USE [master]
GO
ALTER DATABASE [Practica7MMCA] SET  READ_WRITE 
GO
