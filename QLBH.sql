USE [master]
GO
/****** Object:  Database [DU_AN_QuanLyBanHang_Nhom2]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE DATABASE [DU_AN_QuanLyBanHang_Nhom2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DU_AN_QuanLyBanHang_Nhom2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DU_AN_QuanLyBanHang_Nhom2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DU_AN_QuanLyBanHang_Nhom2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DU_AN_QuanLyBanHang_Nhom2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DU_AN_QuanLyBanHang_Nhom2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET  MULTI_USER 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET QUERY_STORE = OFF
GO
USE [DU_AN_QuanLyBanHang_Nhom2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppConfigs]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppConfigs](
	[Key] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AppConfigs] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoleClaims]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppRoles]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[NormalizedName] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserClaims]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserLogins]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserLogins](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserRoles]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AppUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUsers]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[Dob] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AppUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserTokens]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AppUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariationId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsShowOnHome] [bit] NOT NULL,
	[ParentId] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryTranslations]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTranslations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[SeoDescription] [nvarchar](500) NOT NULL,
	[SeoTitle] [nvarchar](200) NOT NULL,
	[LanguageId] [varchar](5) NOT NULL,
	[SeoAlias] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CategoryTranslations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[HEXCode] [nvarchar](15) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[PhoneNumber] [nvarchar](200) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [varchar](5) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[ProductVariationId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductVariationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ShipName] [nvarchar](200) NOT NULL,
	[ShipAddress] [nvarchar](200) NOT NULL,
	[ShipEmail] [varchar](50) NOT NULL,
	[ShipPhoneNumber] [nvarchar](200) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImagePath] [nvarchar](200) NOT NULL,
	[Caption] [nvarchar](200) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[FileSize] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInCategories]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInCategories](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductInCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OriginalPrice] [decimal](18, 2) NOT NULL,
	[ViewCount] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[IsFeatured] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTranslations]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTranslations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Details] [nvarchar](500) NOT NULL,
	[SeoDescription] [nvarchar](max) NOT NULL,
	[SeoTitle] [nvarchar](max) NOT NULL,
	[SeoAlias] [nvarchar](200) NOT NULL,
	[LanguageId] [varchar](5) NOT NULL,
 CONSTRAINT [PK_ProductTranslations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariations]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_ProductVariations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [datetime2](7) NOT NULL,
	[ToDate] [datetime2](7) NOT NULL,
	[ApplyForAll] [bit] NOT NULL,
	[DiscountPercent] [int] NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[ProductIds] [nvarchar](max) NOT NULL,
	[ProductCategoryIds] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Promotions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Code] [nvarchar](5) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Url] [nvarchar](200) NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 11/21/2022 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime2](7) NOT NULL,
	[ExternalTransactionId] [nvarchar](max) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Fee] [decimal](18, 2) NOT NULL,
	[Result] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[Provider] [nvarchar](max) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221030054210_Qlbh_V1.1', N'6.0.9')
GO
INSERT [dbo].[AppConfigs] ([Key], [Value]) VALUES (N'HomeDescription', N'This is description of eShopSolution')
INSERT [dbo].[AppConfigs] ([Key], [Value]) VALUES (N'HomeKeyword', N'This is keyword of eShopSolution')
INSERT [dbo].[AppConfigs] ([Key], [Value]) VALUES (N'HomeTitle', N'This is home page of eShopSolution')
GO
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8d04dce2-969a-435d-bba4-df3f325983dc', N'Administrator role', N'admin', N'admin', N'cd19fa39-a8ad-44e3-b559-d6637d5a95dc')
INSERT [dbo].[AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8c2aad06-413a-4256-9c04-e022cb072058', N'NhanVien', N'nhanvien', N'nhanvien', N'cd19fa39-a8ad-44e3-b559-d6637d5a95dc')
GO
INSERT [dbo].[AppUserRoles] ([UserId], [RoleId]) VALUES (N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'8c2aad06-413a-4256-9c04-e022cb072058')
INSERT [dbo].[AppUserRoles] ([UserId], [RoleId]) VALUES (N'69bd714f-9576-45ba-b5b7-f00649be00de', N'8d04dce2-969a-435d-bba4-df3f325983dc')
GO
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'Tạ Duy', N'Tùng', CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), N'taduytung99', N'TADUYTUNG99', N'string@gmain.com', N'STRING@GMAIN.COM', 0, N'AQAAAAEAACcQAAAAEB2aNOA0wSmVJ6Fnlc7eHl0o1o+r63yQJtzn1Uo+KmuNxXIdK6rcXam9Z6s633n7qQ==', N'G26O3MLXY7ROGZXSY6MD6DX67N2GP2F2', N'6745e626-0db3-4448-820b-6729c13b1267', N'0461264871', 0, 0, NULL, 1, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3169cee0-1300-451c-88eb-08dac260b063', N'Tạ Duy', N'Tùng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'1313', NULL, 0, NULL, NULL, N'da4f4603-ac5c-43c3-84c1-ec723c4cc094', N'12331', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ca8dddf3-c347-4f90-1e83-08dac26330c7', N'Tạ Duy', N'Tùng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'ada', NULL, 0, NULL, NULL, N'85656861-9b18-4e17-a086-21137e785e57', N'áddsa', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f0aaf179-8006-4a4a-e186-08dac2688bf1', N'Tạ Duy Tùng', N'tung', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'Tạ Duy Tùng', NULL, 0, NULL, NULL, N'9ec365b0-2a0e-4c54-b42f-3cba63bfe93c', N'0976909518', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd54bad09-fac9-4d1d-6000-08dac54b5c62', N'Tạ Duy ', N'Tung', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'Tạ Duy Tùng', NULL, 0, NULL, NULL, N'aa1ebd15-fde9-4cd1-834c-51f9a164d063', N'0976909518', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6da77c9c-7737-4bde-b0ed-08dac55bb4af', N'sss', N'sss', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'ss', NULL, 0, NULL, NULL, N'c324aa59-6b8b-4d2a-9303-8b957fea222f', N'sss', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'047c2e9c-7f3a-45d7-b0ee-08dac55bb4af', N'sss', N'sss', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'ss', NULL, 0, NULL, NULL, N'4e8d4437-2974-4357-8d1f-980ff879241f', N'sss', 0, 0, NULL, 0, 0)
INSERT [dbo].[AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'69bd714f-9576-45ba-b5b7-f00649be00de', N'Toan', N'Bach', CAST(N'2020-01-31T00:00:00.0000000' AS DateTime2), N'admin', N'admin', N'tedu.international@gmail.com', N'tedu.international@gmail.com', 1, N'AQAAAAEAACcQAAAAEI6ovP0+AFBaqTncpnLN8J0GqyXvrfdu+sCe1plpNw9YX16/Bfa514Jg+K9g3CiVlQ==', N'', N'347faaa7-da7c-4d24-bdb6-69a5ffb77218', NULL, 0, 0, NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (1, 1, 1, NULL, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (2, 2, 1, NULL, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (3, 1, 1, 0, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (4, -2, 1, 0, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (5, -1, 1, 1, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (6, 1, 1, 0, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (7, 1, 1, 4, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (8, 2, 1, 4, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (9, 1, 1, 4, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (10, 1, 1, 0, 1)
INSERT [dbo].[Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (11, 2, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryTranslations] ON 

INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (1, 1, N'Áo nam', N'Sản phẩm áo thời trang nam', N'Sản phẩm áo thời trang nam', N'vi', N'ao-nam')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (2, 1, N'Men Shirt', N'The shirt products for men', N'The shirt products for men', N'en', N'men-shirt')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (3, 2, N'Áo nữ', N'Sản phẩm áo thời trang nữ', N'Sản phẩm áo thời trang women', N'vi', N'ao-nu')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (4, 2, N'Women Shirt', N'The shirt products for women', N'The shirt products for women', N'en', N'women-shirt')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (5, 3, N'Nam', N'nam', N'nam', N'vi', N'nam')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (6, 4, N'Nữ', N'nu', N'nu', N'vi', N'nu')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (7, 5, N'Áo Cardigan', N'Áo Cardigan', N'Áo Cardigan', N'vi', N'Áo Cardigan')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (8, 6, N'Áo Nỉ', N'Áo Nỉ', N'Áo Nỉ', N'vi', N'Áo Nỉ')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (9, 7, N'Áo Len', N'Áo Len', N'Áo Len', N'vi', N'Áo Len')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (10, 8, N'Áo Blouson & Áo Parka', N'Áo Blouson & Áo Parka', N'Áo Blouson & Áo Parka', N'vi', N'Áo Blouson & Áo Parka')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (11, 9, N'Ultra Light Down Áo Khoác Siêu Nhẹ', N'Ultra Light Down Áo Khoác Siêu Nhẹ', N'Ultra Light Down Áo Khoác Siêu Nhẹ', N'vi', N'Ultra Light Down Áo Khoác Siêu Nhẹ')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (12, 10, N'Quần Dài', N'Quần Dài', N'Quần Dài', N'vi', N'Quần Dài')
INSERT [dbo].[CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (13, 11, N'Đồ Mặc Nhà', N'Đồ Mặc Nhà', N'Đồ Mặc Nhà', N'vi', N'Đồ Mặc Nhà')
SET IDENTITY_INSERT [dbo].[CategoryTranslations] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (1, N'Trắng', N'#FF0003', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (2, N'Xám', N'#FF11331', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (3, N'Đen', N'#FF0000', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (4, N'Hồng', N'#FF0000', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (5, N'Đỏ', N'#FF00011', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (6, N'Cam', N'gà quân', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (7, N'Màu Be', N'#FF0055', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (8, N'Nâu', N'#FF0054', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (9, N'Vàng', N'#FF0000', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (10, N'Xanh Lá', N'#FF0055', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (11, N'Xanh Lam', N'#FF0003', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (12, N'Tím', N'#FF0000', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (13, N'Đỏ da cam', N'#FF0055', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (14, N'Đỏ tươi', N'#FF0000', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (15, N'Hồng phấn', N'#FF0000', 1)
INSERT [dbo].[Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (16, N'Hồng as', N'as', 1)
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
INSERT [dbo].[Languages] ([Id], [Name], [IsDefault]) VALUES (N'en', N'English', 0)
INSERT [dbo].[Languages] ([Id], [Name], [IsDefault]) VALUES (N'vi', N'Tiếng Việt', 1)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (1, 6, 5, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (1, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (1, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (3, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (3, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (3, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (4, 6, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (6, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (6, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (6, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (7, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (7, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (7, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (8, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (8, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (8, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (9, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (9, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (9, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (10, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (10, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (10, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (11, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (11, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (11, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (12, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (12, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (12, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (13, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (13, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (13, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (14, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (14, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (14, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (15, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (15, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (15, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (16, 23, 1, CAST(489000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (17, 1, 6, CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (17, 23, 1, CAST(489000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (18, 41, 3, CAST(293000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (19, 24, 1, CAST(700000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (19, 50, 1, CAST(333.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (20, 8, 2, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (20, 28, 4, CAST(123.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (1, CAST(N'2022-11-09T21:43:02.0642758' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'1313', N'1313', N'1313', N'12331', 4)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (3, CAST(N'2022-11-09T22:00:53.0616702' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'ada', N'adda', N'ada', N'áddsa', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (4, CAST(N'2022-11-09T22:39:29.7876973' AS DateTime2), N'f0aaf179-8006-4a4a-e186-08dac2688bf1', N'Tạ Duy Tùng', N'số nhà 11 TDP Thượng 3, Phường Tây Tựu, Thành Phố Hà nội', N'T? Duy Tùng', N'0976909518', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (6, CAST(N'2022-11-09T22:46:18.2091826' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'133123', N'13213', N'133123', N'1231', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (7, CAST(N'2022-11-09T22:49:20.0100738' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'ư', N'ư', N'u', N'ư', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (8, CAST(N'2022-11-09T22:55:21.6677816' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'1212', N'12212', N'1212', N'121', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (9, CAST(N'2022-11-09T23:01:05.6095834' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'133', N'123', N'133', N'123321', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (10, CAST(N'2022-11-09T23:06:02.1037910' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'sđ', N'sd', N'sd', N'sd', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (11, CAST(N'2022-11-09T23:12:38.9518802' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'ss', N'ss', N'ss', N'sss', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (12, CAST(N'2022-11-09T23:19:15.5048004' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'ss', N'ss', N'ss', N'sc', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (13, CAST(N'2022-11-09T23:21:26.1601501' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'131', N'133', N'131', N'13', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (14, CAST(N'2022-11-09T23:24:32.7286901' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'adda', N'adda', N'adda', N'adda', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (15, CAST(N'2022-11-09T23:26:38.5787366' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'sfsfd', N'sfssf', N'sfsfd', N'fssfs', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (16, CAST(N'2022-11-13T14:47:49.0415286' AS DateTime2), N'd54bad09-fac9-4d1d-6000-08dac54b5c62', N'Tạ Duy Tùng', N'số nhà 11 TDP Thượng 3, Phường Tây Tựu, Thành Phố Hà nội', N'T? Duy Tùng', N'0976909518', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (17, CAST(N'2022-11-13T14:59:19.5612643' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'Tạ Duy Tùng', N'số nhà 11 TDP Thượng 3, Phường Tây Tựu, Thành Phố Hà nội', N'T? Duy Tùng', N'0976909518', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (18, CAST(N'2022-11-13T15:50:32.8795957' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'dddd', N'dddddd', N'dddd', N'ddd', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (19, CAST(N'2022-11-13T16:44:49.0631734' AS DateTime2), N'6da77c9c-7737-4bde-b0ed-08dac55bb4af', N'ss', N'sss', N'ss', N'sss', 3)
INSERT [dbo].[Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (20, CAST(N'2022-11-13T16:45:34.0470558' AS DateTime2), N'047c2e9c-7f3a-45d7-b0ee-08dac55bb4af', N'ss', N'ss', N'ss', N'sss', 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (6, 7, N'/Images/8052acac-16c9-4d58-88b4-e88fff81410a.webp', N'Thumbnail image', 1, CAST(N'2022-10-30T22:01:05.0762673' AS DateTime2), 1, 110790)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (7, 8, N'/Images/8052acac-16c9-4d58-88b4-e88fff81410a.webp', N'Thumbnail image', 1, CAST(N'2022-10-30T22:01:13.4409877' AS DateTime2), 1, 110790)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (8, 9, N'/Images/8052acac-16c9-4d58-88b4-e88fff81410a.webp', N'Thumbnail image', 1, CAST(N'2022-10-30T22:01:24.7565181' AS DateTime2), 1, 110790)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (9, 10, N'/Images/44d635b6-8965-44cd-a70d-237092c230e1.webp', N'Thumbnail image', 1, CAST(N'2022-10-30T22:02:26.0909141' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (13, 1, N'/Images/8052acac-16c9-4d58-88b4-e88fff81410a.webp', N'Thumbnail image', 1, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (14, 11, N'/Images/c1323435-308d-4b5a-9547-bb40ad4eae0a.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T01:45:02.5630731' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (15, 12, N'/Images/4238de74-d6be-40da-9d78-3d0c4a393886.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T01:50:37.0712208' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (16, 13, N'/Images/a7d4dc65-d8a5-492d-8696-717739cfeead.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T01:56:07.9507020' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (17, 14, N'/Images/976ed484-10f7-48d8-bc2e-14a76a102eb3.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T01:56:29.5935737' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (18, 15, N'/Images/b0771724-25bc-4e88-a066-a6c1cf112bd2.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T02:01:20.3301995' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (19, 16, N'/Images/c92f4f78-38f6-46ea-92ad-7b88600f7f40.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T02:26:35.8537666' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (20, 17, N'/Images/c3482ab5-06fe-4ccf-82c4-a1967e35617c.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T02:28:09.6690116' AS DateTime2), 1, 102284)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (21, 18, N'/Images/8052acac-16c9-4d58-88b4-e88fff81410a.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T12:06:09.2917482' AS DateTime2), 1, 30228)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (23, 19, N'/Images/8052acac-16c9-4d58-88b4-e88fff81410a.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T00:00:00.0000000' AS DateTime2), 1, 111111)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (24, 20, N'/Images/65714797-1ef4-4ccd-b5b8-079c1500fd5e.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T13:01:21.9016138' AS DateTime2), 1, 105668)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (25, 21, N'/Images/6bbda3a1-6116-45c3-92dc-780ea40428c8.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T13:03:08.3747767' AS DateTime2), 1, 82820)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (26, 22, N'/Images/2970d70e-9def-47fb-b399-a054879f6419.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T13:05:22.8075905' AS DateTime2), 1, 111526)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (27, 23, N'/Images/f5a30ac8-e545-433a-a117-5bf7be2d2517.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T13:07:47.4798922' AS DateTime2), 1, 106692)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (28, 24, N'/Images/9ab1fc60-34d5-4f85-a145-353442bf6cf5.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T13:09:46.1965168' AS DateTime2), 1, 150820)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (29, 25, N'/Images/3ce5ed4c-3a96-456a-9a86-587cf2a72802.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T13:10:49.6729062' AS DateTime2), 1, 146368)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (30, 26, N'/Images/ad5b0127-739c-4e78-aa52-1e03965a6848.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T13:12:38.6551866' AS DateTime2), 1, 34190)
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (31, 27, N'/Images/e29d73bf-0bcb-4978-b9b4-aa5bf9a3ac5c.webp', N'Thumbnail image', 1, CAST(N'2022-11-13T16:42:10.7028552' AS DateTime2), 1, 53340)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (1, 1)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (1, 2)
INSERT [dbo].[ProductInCategories] ([ProductId], [CategoryId]) VALUES (7, 1)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (1, CAST(200000.00 AS Decimal(18, 2)), CAST(100000.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T12:42:10.5434633' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (7, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:01:05.0761004' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (8, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:01:13.4409822' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (9, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:01:24.7565158' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (10, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:02:26.0909056' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (11, CAST(300000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T01:45:02.5629799' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (12, CAST(300000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T01:50:37.0711277' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (13, CAST(300000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T01:56:07.9506042' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (14, CAST(300000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T01:56:29.5935631' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (15, CAST(250000.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T02:01:20.3301122' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (16, CAST(300000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T02:26:35.8536163' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (17, CAST(300000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T02:28:09.6689015' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (18, CAST(390000.00 AS Decimal(18, 2)), CAST(450000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T12:06:09.2916320' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (19, CAST(689000.00 AS Decimal(18, 2)), CAST(600000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T12:41:38.4217686' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (20, CAST(244000.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T13:01:21.9015179' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (21, CAST(293000.00 AS Decimal(18, 2)), CAST(200000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T13:03:08.3747721' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (22, CAST(1000000.00 AS Decimal(18, 2)), CAST(982000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T13:05:22.8075872' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (23, CAST(489000.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T13:07:47.4798899' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (24, CAST(700000.00 AS Decimal(18, 2)), CAST(686000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T13:09:46.1965149' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (25, CAST(686000.00 AS Decimal(18, 2)), CAST(600000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T13:10:49.6729005' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (26, CAST(182000.00 AS Decimal(18, 2)), CAST(142000.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T13:12:38.6551813' AS DateTime2), NULL)
INSERT [dbo].[Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (27, CAST(333.00 AS Decimal(18, 2)), CAST(222.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-13T16:42:10.7027411' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTranslations] ON 

INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (1, 1, N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'ao-so-mi-nam-trang-viet-tien', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (2, 1, N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'viet-tien-men-t-shirt', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (8, 7, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (9, 7, N'Áo black shits', N'111', N'11', N'111', N'123', N'123', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (10, 8, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (11, 8, N'Áo red shirt', N'111', N'11', N'111', N'123', N'123', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (12, 9, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (13, 9, N'Áo light shirt', N'111', N'11', N'111', N'123', N'123', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (14, 10, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (15, 10, N'Áo pink shirt', N'111', N'11', N'111', N'123', N'123', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (16, 11, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (17, 11, N'Đỏ sang chảnh 24', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (18, 12, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (19, 12, N'Đỏ ráng chật', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (20, 13, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (21, 13, N'Đỏ Dáng Rộng', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (22, 14, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (23, 14, N'Áo mới về', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (24, 15, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (25, 15, N'Đỏ sang chảnh Dáng Rộng', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (26, 16, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (27, 16, N'Đỏ sang hot', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (28, 17, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (29, 17, N'Đỏ sang chảnh coll', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vn-good-s', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (30, 18, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (31, 18, N'Áo Thun Kẻ Sọc Cổ Tròn Tay Lỡ Dáng Rộng', N'Áo Thun Kẻ Sọc Cổ Tròn Tay Lỡ Dáng Rộng', N'Chất liệu vải đủ dày để có thể mặc riêng lẻ. Họa tiết kẻ sọc lớn.', N'- Được làm từ chất liệu vải mịn, đủ dày để có thể mặc riêng lẻ. - Đường cắt dáng rộng hiện đại. - Họa tiết kẻ sọc lớn.', N'Áo Thun Kẻ Sọc Cổ Tròn Tay Lỡ Dáng Rộng', N'Áo Thun Kẻ Sọc Cổ Tròn Tay Lỡ Dáng Rộng', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (32, 19, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (33, 19, N'Áo Chui Đầu Gài Nút Dài Tay', N'VẢI 100% Polyeste HƯỚNG DẪN GIẶT Giặt máy nước lạnh, giặt nhẹ, Không giặt khô', N'Phối màu đẹp mắt giúp tạo kiểu dễ dàng. Các nút ở cổ dễ phối đồ với nhiều kiểu khác nhau.', N'VẢI 100% Polyeste HƯỚNG DẪN GIẶT Giặt máy nước lạnh, giặt nhẹ, Không giặt khô', N'VẢI 100% Polyeste HƯỚNG DẪN GIẶT Giặt máy nước lạnh, giặt nhẹ, Không giặt khô', N'VẢI 100% Polyeste HƯỚNG DẪN GIẶT Giặt máy nước lạnh, giặt nhẹ, Không giặt khô', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (34, 20, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (35, 20, N'Áo Thun Gân Dáng Ngắn Ngắn Tay', N'Áo Thun Gân Dáng Ngắn Ngắn Tay', N'Áo Thun Gân Dáng Ngắn Ngắn Tay', N'Áo Thun Gân Dáng Ngắn Ngắn Tay', N'Áo Thun Gân Dáng Ngắn Ngắn Tay', N'Áo Thun Gân Dáng Ngắn Ngắn Tay', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (36, 21, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (37, 21, N'Áo Thun Waffle Cổ Tròn Dài Tay', N'Hiện tại áo đã có ở dạng dệt kim waffle mịn hơn. Một chiếc áo thun linh hoạt cho bất kỳ trang phục nào.', N'Hiện tại áo đã có ở dạng dệt kim waffle mịn hơn. Một chiếc áo thun linh hoạt cho bất kỳ trang phục nào.', N'Hiện tại áo đã có ở dạng dệt kim waffle mịn hơn. Một chiếc áo thun linh hoạt cho bất kỳ trang phục nào.', N'Áo Len', N'Áo Cardigan', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (38, 22, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (39, 22, N'Quần Legging Lửng Cạp Cao Siêu Co Giãn', N'Quần Legging Lửng Cạp Cao Siêu Co Giãn', N'Quần Legging Lửng Cạp Cao Siêu Co Giãn', N'Quần Legging Lửng Cạp Cao Siêu Co Giãn', N'Quần Legging Lửng Cạp Cao Siêu Co Giãn', N'Quần Legging Lửng Cạp Cao Siêu Co Giãn', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (40, 23, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (41, 23, N'Quần Dạ', N'Quần dạ 100% cotton mềm mại, ấm áp. Có thể mặc ở nhà hoặc đi chơi.', N'Quần dạ 100% cotton mềm mại, ấm áp. Có thể mặc ở nhà hoặc đi chơi.', N'Quần dạ 100% cotton mềm mại, ấm áp. Có thể mặc ở nhà hoặc đi chơi.', N'Quần dạ 100% cotton mềm mại, ấm áp. Có thể mặc ở nhà hoặc đi chơi.', N'Quần dạ 100% cotton mềm mại, ấm áp. Có thể mặc ở nhà hoặc đi chơi.', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (42, 24, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (43, 24, N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Đã cập nhật đường cắt để có thể dễ dàng tạo kiểu như một lớp áo nhẹ bên ngoài.', N'Đã cập nhật đường cắt để có thể dễ dàng tạo kiểu như một lớp áo nhẹ bên ngoài.', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (44, 25, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (45, 25, N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (46, 26, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (47, 26, N'Quần Jean Dáng Skinny Fit Siêu Co Giãn', N'Quần Jean Dáng Skinny Fit Siêu Co Giãn', N'Quần Jean Dáng Skinny Fit Siêu Co Giãn', N'Quần Jean Dáng Skinny Fit Siêu Co Giãn', N'Quần Jean Dáng Skinny Fit Siêu Co Giãn', N'Quần Jean Dáng Skinny Fit Siêu Co Giãn', N'vi')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (48, 27, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [dbo].[ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (49, 27, N'Đỏ sang chảnh dd', N'ssss', N'sss', N'sss', N's', N'ss', N'vi')
SET IDENTITY_INSERT [dbo].[ProductTranslations] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductVariations] ON 

INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (1, 1, 1, 1, 182)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (2, 1, 2, 1, 100)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (4, 1, 2, 2, 50)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (5, 1, 3, 4, 25)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (6, 1, 3, 6, 25)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (7, 1, 4, 7, 48)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (8, 7, 5, 2, 48)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (9, 7, 5, 6, 25)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (10, 7, 6, 8, 229)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (11, 7, 6, 9, 111)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (12, 7, 6, 9, 50)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (19, 7, 6, 12, 18)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (20, 18, 14, 18, 3)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (22, 22, 13, 2, 2)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (23, 23, 12, 6, 51)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (24, 24, 6, 2, 9)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (28, 10, 11, 12, 233)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (31, 11, 3, 6, 44)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (32, 12, 4, 8, 0)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (34, 13, 2, 8, 22)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (35, 14, 5, 9, 255)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (36, 15, 6, 13, 33)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (37, 16, 3, 4, 4)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (38, 17, 8, 1, 3)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (39, 19, 2, 1, 4)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (40, 20, 2, 1, 44)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (41, 21, 5, 1, 1)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (43, 22, 13, 2, 7)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (44, 23, 12, 6, 55)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (47, 24, 6, 2, 11)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (48, 26, 2, 11, 22)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (49, 25, 5, 4, 43)
INSERT [dbo].[ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (50, 27, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[ProductVariations] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (1, N'Size XS', N'XS', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (2, N'Size S', N'S', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (3, N'Size M ', N'M', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (4, N'Size L', N'L', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (6, N'Size XL', N'XL', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (7, N'Size XXL', N'XXL', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (8, N'Size XXXL', N'XXXL', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (9, N'Size XXXXL', N'XXXXL', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (10, N'Size 39 ', N'39', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (11, N'Size 40 ', N'40', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (12, N'Size 41', N'41', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (13, N'Size 42', N'42', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (14, N'Size 43', N'43', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (15, N'Size 44', N'44', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (16, N'Size 45 ', N'45', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (17, N'Size 38', N'38', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (18, N'Size 37', N'37', 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Code], [Status]) VALUES (19, N'Size 36', N'36', 1)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (1, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/1.png', 1, 1)
INSERT [dbo].[Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (2, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/2.png', 2, 1)
INSERT [dbo].[Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (3, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/3.png', 3, 1)
INSERT [dbo].[Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (4, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/4.png', 4, 1)
INSERT [dbo].[Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (5, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/5.png', 5, 1)
INSERT [dbo].[Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (6, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/6.png', 6, 1)
SET IDENTITY_INSERT [dbo].[Slides] OFF
GO
/****** Object:  Index [IX_Carts_ProductVariationId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_ProductVariationId] ON [dbo].[Carts]
(
	[ProductVariationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryTranslations_CategoryId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryTranslations_CategoryId] ON [dbo].[CategoryTranslations]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CategoryTranslations_LanguageId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryTranslations_LanguageId] ON [dbo].[CategoryTranslations]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ProductVariationId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductVariationId] ON [dbo].[OrderDetails]
(
	[ProductVariationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInCategories_ProductId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductInCategories_ProductId] ON [dbo].[ProductInCategories]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductTranslations_LanguageId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTranslations_LanguageId] ON [dbo].[ProductTranslations]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductTranslations_ProductId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTranslations_ProductId] ON [dbo].[ProductTranslations]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariations_ColorId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariations_ColorId] ON [dbo].[ProductVariations]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariations_ProductId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariations_ProductId] ON [dbo].[ProductVariations]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariations_SizeId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariations_SizeId] ON [dbo].[ProductVariations]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_UserId]    Script Date: 11/21/2022 1:43:21 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_UserId] ON [dbo].[Transactions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Colors] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductVariations] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Sizes] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Status]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AppUsers_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_ProductVariations_ProductVariationId] FOREIGN KEY([ProductVariationId])
REFERENCES [dbo].[ProductVariations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_ProductVariations_ProductVariationId]
GO
ALTER TABLE [dbo].[CategoryTranslations]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTranslations_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryTranslations] CHECK CONSTRAINT [FK_CategoryTranslations_Categories_CategoryId]
GO
ALTER TABLE [dbo].[CategoryTranslations]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTranslations_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryTranslations] CHECK CONSTRAINT [FK_CategoryTranslations_Languages_LanguageId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductVariations_ProductVariationId] FOREIGN KEY([ProductVariationId])
REFERENCES [dbo].[ProductVariations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductVariations_ProductVariationId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AppUsers_UserId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductInCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductInCategories] CHECK CONSTRAINT [FK_ProductInCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductInCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategories_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductInCategories] CHECK CONSTRAINT [FK_ProductInCategories_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ProductTranslations_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTranslations] CHECK CONSTRAINT [FK_ProductTranslations_Languages_LanguageId]
GO
ALTER TABLE [dbo].[ProductTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ProductTranslations_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTranslations] CHECK CONSTRAINT [FK_ProductTranslations_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductVariations]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariations_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariations] CHECK CONSTRAINT [FK_ProductVariations_Colors_ColorId]
GO
ALTER TABLE [dbo].[ProductVariations]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariations_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariations] CHECK CONSTRAINT [FK_ProductVariations_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductVariations]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariations_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariations] CHECK CONSTRAINT [FK_ProductVariations_Sizes_SizeId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_AppUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET  READ_WRITE 
GO
