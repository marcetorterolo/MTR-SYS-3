USE [master]
GO
/****** Object:  Database [DB_Bank]    Script Date: 09/05/2019 3:28:06 ******/
CREATE DATABASE [DB_Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Bank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MTRSQLSERVER\MSSQL\DATA\DB_Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Bank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MTRSQLSERVER\MSSQL\DATA\DB_Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_Bank] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Bank] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Bank] SET QUERY_STORE = OFF
GO
USE [DB_Bank]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 09/05/2019 3:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[Id] [varchar](10) NOT NULL,
	[TipoId] [varchar](10) NOT NULL,
	[Saldo] [int] NOT NULL,
	[UsuarioId] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuenta]    Script Date: 09/05/2019 3:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuenta](
	[Id] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoCuenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferencia]    Script Date: 09/05/2019 3:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferencia](
	[CuentaIdOrigen] [varchar](10) NOT NULL,
	[CuentaIdDestino] [varchar](10) NOT NULL,
	[Monto] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Transferencia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/05/2019 3:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cuenta] ([Id], [TipoId], [Saldo], [UsuarioId]) VALUES (N'1111100201', N'1002', 0, N'1111')
GO
INSERT [dbo].[Cuenta] ([Id], [TipoId], [Saldo], [UsuarioId]) VALUES (N'1112100101', N'1001', 215, N'1112')
GO
INSERT [dbo].[Cuenta] ([Id], [TipoId], [Saldo], [UsuarioId]) VALUES (N'1112100102', N'1001', 120, N'1112')
GO
INSERT [dbo].[Cuenta] ([Id], [TipoId], [Saldo], [UsuarioId]) VALUES (N'1112100103', N'1001', 65, N'1112')
GO
INSERT [dbo].[Cuenta] ([Id], [TipoId], [Saldo], [UsuarioId]) VALUES (N'1112100201', N'1002', 120, N'1112')
GO
INSERT [dbo].[Cuenta] ([Id], [TipoId], [Saldo], [UsuarioId]) VALUES (N'1112100202', N'1002', 5, N'1112')
GO
INSERT [dbo].[TipoCuenta] ([Id], [Nombre]) VALUES (N'1001', N'Caja Ahorro Pesos')
GO
INSERT [dbo].[TipoCuenta] ([Id], [Nombre]) VALUES (N'1002', N'Caja Ahorro Dolares')
GO
INSERT [dbo].[TipoCuenta] ([Id], [Nombre]) VALUES (N'2001', N'Cuenta Corriente Pesos')
GO
INSERT [dbo].[TipoCuenta] ([Id], [Nombre]) VALUES (N'2002', N'Cuenta Corriente Dolares')
GO
SET IDENTITY_INSERT [dbo].[Transferencia] ON 
GO
INSERT [dbo].[Transferencia] ([CuentaIdOrigen], [CuentaIdDestino], [Monto], [Descripcion], [Fecha], [Id]) VALUES (N'1112100102', N'1112100101', 15, N'prueba', CAST(N'2019-05-09T02:44:39.2888171' AS DateTime2), 7)
GO
INSERT [dbo].[Transferencia] ([CuentaIdOrigen], [CuentaIdDestino], [Monto], [Descripcion], [Fecha], [Id]) VALUES (N'1112100102', N'1112100103', 15, N'prueba', CAST(N'2019-05-09T02:45:32.7408505' AS DateTime2), 8)
GO
INSERT [dbo].[Transferencia] ([CuentaIdOrigen], [CuentaIdDestino], [Monto], [Descripcion], [Fecha], [Id]) VALUES (N'1112100202', N'1112100201', 20, N'prueba', CAST(N'2019-05-09T03:02:28.9224497' AS DateTime2), 9)
GO
SET IDENTITY_INSERT [dbo].[Transferencia] OFF
GO
INSERT [dbo].[Usuario] ([Id], [Nombre]) VALUES (N'1111', N'Marcelo')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre]) VALUES (N'1112', N'Leonardo')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre]) VALUES (N'1113', N'Pedro')
GO
INSERT [dbo].[Usuario] ([Id], [Nombre]) VALUES (N'1114', N'Juan')
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_TipoCuenta] FOREIGN KEY([TipoId])
REFERENCES [dbo].[TipoCuenta] ([Id])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_TipoCuenta]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [FK_Cuenta_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [FK_Cuenta_Usuario]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_CuentaDestino] FOREIGN KEY([CuentaIdDestino])
REFERENCES [dbo].[Cuenta] ([Id])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_CuentaDestino]
GO
ALTER TABLE [dbo].[Transferencia]  WITH CHECK ADD  CONSTRAINT [FK_Transferencia_CuentaOrigen] FOREIGN KEY([CuentaIdOrigen])
REFERENCES [dbo].[Cuenta] ([Id])
GO
ALTER TABLE [dbo].[Transferencia] CHECK CONSTRAINT [FK_Transferencia_CuentaOrigen]
GO
USE [master]
GO
ALTER DATABASE [DB_Bank] SET  READ_WRITE 
GO
