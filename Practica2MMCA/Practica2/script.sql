USE [Practica2MMCA]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 02/11/2019 09:04:55 p. m. ******/
DROP TABLE [dbo].[ticket]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 02/11/2019 09:04:55 p. m. ******/
DROP TABLE [dbo].[sucursal]
GO
/****** Object:  Table [dbo].[puestoDeEempleado]    Script Date: 02/11/2019 09:04:55 p. m. ******/
DROP TABLE [dbo].[puestoDeEempleado]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 02/11/2019 09:04:55 p. m. ******/
DROP TABLE [dbo].[empleado]
GO
USE [master]
GO
/****** Object:  Database [Practica2MMCA]    Script Date: 02/11/2019 09:04:55 p. m. ******/
DROP DATABASE [Practica2MMCA]
GO
/****** Object:  Database [Practica2MMCA]    Script Date: 02/11/2019 09:04:55 p. m. ******/
CREATE DATABASE [Practica2MMCA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica2MMCA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica2MMCA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica2MMCA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica2MMCA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Practica2MMCA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica2MMCA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica2MMCA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica2MMCA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica2MMCA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica2MMCA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica2MMCA] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica2MMCA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica2MMCA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica2MMCA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica2MMCA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica2MMCA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica2MMCA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica2MMCA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica2MMCA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica2MMCA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica2MMCA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica2MMCA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica2MMCA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica2MMCA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica2MMCA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica2MMCA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica2MMCA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica2MMCA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica2MMCA] SET RECOVERY FULL 
GO
ALTER DATABASE [Practica2MMCA] SET  MULTI_USER 
GO
ALTER DATABASE [Practica2MMCA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica2MMCA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica2MMCA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica2MMCA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica2MMCA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practica2MMCA', N'ON'
GO
ALTER DATABASE [Practica2MMCA] SET QUERY_STORE = OFF
GO
USE [Practica2MMCA]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 02/11/2019 09:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[numeroDeEmpleado] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[primerApellido] [varchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[puestoDeEempleado]    Script Date: 02/11/2019 09:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puestoDeEempleado](
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
/****** Object:  Table [dbo].[sucursal]    Script Date: 02/11/2019 09:04:55 p. m. ******/
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
/****** Object:  Table [dbo].[ticket]    Script Date: 02/11/2019 09:04:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[ticket_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Practica2MMCA] SET  READ_WRITE 
GO
