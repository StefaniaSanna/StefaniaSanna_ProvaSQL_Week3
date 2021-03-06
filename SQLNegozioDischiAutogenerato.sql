USE [master]
GO
/****** Object:  Database [NegozioDischi]    Script Date: 22/10/2021 13:38:04 ******/
CREATE DATABASE [NegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NegozioDischi', FILENAME = N'C:\Users\sanna\NegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NegozioDischi_log', FILENAME = N'C:\Users\sanna\NegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NegozioDischi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NegozioDischi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [NegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NegozioDischi] SET QUERY_STORE = OFF
GO
USE [NegozioDischi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NegozioDischi]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 22/10/2021 13:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IDAlbum] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](30) NOT NULL,
	[AnnoUscita] [int] NOT NULL,
	[CasaDiscografica] [nvarchar](40) NOT NULL,
	[Genere] [nvarchar](20) NOT NULL,
	[SupportoDistribuzione] [nvarchar](20) NOT NULL,
	[IDBand] [int] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Album] UNIQUE NONCLUSTERED 
(
	[Titolo] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[SupportoDistribuzione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumBrano]    Script Date: 22/10/2021 13:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumBrano](
	[IDAlbum] [int] NOT NULL,
	[IDBrano] [int] NOT NULL,
 CONSTRAINT [PK_Album_Brano] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC,
	[IDBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 22/10/2021 13:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IDBand] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](40) NOT NULL,
	[NumeroComponenti] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[IDBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 22/10/2021 13:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IDBrano] [int] IDENTITY(1,1) NOT NULL,
	[TitoloBrano] [nvarchar](30) NOT NULL,
	[Durata] [int] NOT NULL,
 CONSTRAINT [PK_Brano] PRIMARY KEY CLUSTERED 
(
	[IDBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Band] FOREIGN KEY([IDBand])
REFERENCES [dbo].[Band] ([IDBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Band]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Album] FOREIGN KEY([IDAlbum])
REFERENCES [dbo].[Album] ([IDAlbum])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Album]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Brano] FOREIGN KEY([IDBrano])
REFERENCES [dbo].[Brano] ([IDBrano])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Brano]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([Genere]='Classico' OR [Genere]='Jazz' OR [Genere]='Pop' OR [Genere]='Rock' OR [Genere]='Metal'))
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([SupportoDistribuzione]='CD' OR [SupportoDistribuzione]='Vinile' OR [SupportoDistribuzione]='Streaming'))
GO
USE [master]
GO
ALTER DATABASE [NegozioDischi] SET  READ_WRITE 
GO
