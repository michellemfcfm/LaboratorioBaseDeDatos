USE [Practica3MMCA]
GO
ALTER TABLE [dbo].[producto] DROP CONSTRAINT [precio]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [FK_puestoEmpleado]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [FK_infoNegocio]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [FK_infoEmpleado]
GO
ALTER TABLE [dbo].[ticket] DROP CONSTRAINT [FK_datosProducto]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 02/11/2019 09:29:26 p. m. ******/
DROP TABLE [dbo].[ticket]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 02/11/2019 09:29:26 p. m. ******/
DROP TABLE [dbo].[sucursal]
GO
/****** Object:  Table [dbo].[puestoEmpleado]    Script Date: 02/11/2019 09:29:26 p. m. ******/
DROP TABLE [dbo].[puestoEmpleado]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/11/2019 09:29:26 p. m. ******/
DROP TABLE [dbo].[producto]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 02/11/2019 09:29:26 p. m. ******/
DROP TABLE [dbo].[empleado]
GO
USE [master]
GO
/****** Object:  Database [Practica3MMCA]    Script Date: 02/11/2019 09:29:26 p. m. ******/
DROP DATABASE [Practica3MMCA]
GO
/****** Object:  Database [Practica3MMCA]    Script Date: 02/11/2019 09:29:26 p. m. ******/
CREATE DATABASE [Practica3MMCA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica3MMCA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica3MMCA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica3MMCA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica3MMCA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Practica3MMCA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica3MMCA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica3MMCA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica3MMCA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica3MMCA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica3MMCA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica3MMCA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica3MMCA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica3MMCA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica3MMCA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica3MMCA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica3MMCA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica3MMCA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica3MMCA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica3MMCA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica3MMCA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica3MMCA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica3MMCA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica3MMCA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica3MMCA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica3MMCA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica3MMCA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica3MMCA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica3MMCA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica3MMCA] SET RECOVERY FULL 
GO
ALTER DATABASE [Practica3MMCA] SET  MULTI_USER 
GO
ALTER DATABASE [Practica3MMCA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica3MMCA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica3MMCA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica3MMCA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica3MMCA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practica3MMCA', N'ON'
GO
ALTER DATABASE [Practica3MMCA] SET QUERY_STORE = OFF
GO
USE [Practica3MMCA]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 02/11/2019 09:29:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[numeroDeEmpleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[primerApellido] [varchar](20) NOT NULL,
	[edad] [int] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[email] [varchar](20) NOT NULL,
	[estadoCivil] [varchar](10) NOT NULL,
	[nombreCompleto]  AS ((([nombre]+' ')+[primerApellido])+' '),
PRIMARY KEY CLUSTERED 
(
	[numeroDeEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/11/2019 09:29:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[producto_id] [int] NOT NULL,
	[nombreProducto] [varchar](30) NOT NULL,
	[fechaDeCaducidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[existencia] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puestoEmpleado]    Script Date: 02/11/2019 09:29:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puestoEmpleado](
	[tiempoTrabajando] [int] NOT NULL,
	[description] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 02/11/2019 09:29:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
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
/****** Object:  Table [dbo].[ticket]    Script Date: 02/11/2019 09:29:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[ticket_id] [int] NOT NULL,
	[negocio_id] [int] NOT NULL,
	[numeroDeEmpleado] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[description] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_datosProducto] FOREIGN KEY([producto_id])
REFERENCES [dbo].[producto] ([producto_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_datosProducto]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_infoEmpleado] FOREIGN KEY([numeroDeEmpleado])
REFERENCES [dbo].[empleado] ([numeroDeEmpleado])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_infoEmpleado]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_infoNegocio] FOREIGN KEY([negocio_id])
REFERENCES [dbo].[sucursal] ([negocio_id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_infoNegocio]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_puestoEmpleado] FOREIGN KEY([description])
REFERENCES [dbo].[puestoEmpleado] ([description])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_puestoEmpleado]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [precio] CHECK  (([precio]>=(0)))
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [precio]
GO
USE [master]
GO
ALTER DATABASE [Practica3MMCA] SET  READ_WRITE 
GO
