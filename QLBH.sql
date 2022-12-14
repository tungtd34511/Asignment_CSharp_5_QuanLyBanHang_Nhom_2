USE [master]
GO
/****** Object:  Database [DU_AN_QuanLyBanHang_Nhom2]    Script Date: 11/9/2022 10:23:07 PM ******/
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
/****** Object:  Table [__EFMigrationsHistory]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AppConfigs]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppConfigs](
	[Key] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AppConfigs] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [AppRoleClaims]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppRoleClaims](
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
/****** Object:  Table [AppRoles]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppRoles](
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
/****** Object:  Table [AppUserClaims]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUserClaims](
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
/****** Object:  Table [AppUserLogins]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUserLogins](
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
/****** Object:  Table [AppUserRoles]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AppUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AppUsers]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUsers](
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
/****** Object:  Table [AppUserTokens]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUserTokens](
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
/****** Object:  Table [Carts]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Carts](
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
/****** Object:  Table [Categories]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Categories](
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
/****** Object:  Table [CategoryTranslations]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CategoryTranslations](
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
/****** Object:  Table [Colors]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Colors](
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
/****** Object:  Table [Contacts]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contacts](
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
/****** Object:  Table [Languages]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Languages](
	[Id] [varchar](5) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [OrderDetails]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderDetails](
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
/****** Object:  Table [Orders]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders](
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
/****** Object:  Table [ProductImages]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductImages](
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
/****** Object:  Table [ProductInCategories]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductInCategories](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductInCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Products]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products](
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
/****** Object:  Table [ProductTranslations]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductTranslations](
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
/****** Object:  Table [ProductVariations]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductVariations](
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
/****** Object:  Table [Promotions]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Promotions](
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
/****** Object:  Table [Sizes]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sizes](
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
/****** Object:  Table [Slides]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Slides](
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
/****** Object:  Table [Transactions]    Script Date: 11/9/2022 10:23:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Transactions](
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
INSERT [__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221030054210_Qlbh_V1.1', N'6.0.9')
GO
INSERT [AppConfigs] ([Key], [Value]) VALUES (N'HomeDescription', N'This is description of eShopSolution')
INSERT [AppConfigs] ([Key], [Value]) VALUES (N'HomeKeyword', N'This is keyword of eShopSolution')
INSERT [AppConfigs] ([Key], [Value]) VALUES (N'HomeTitle', N'This is home page of eShopSolution')
GO
INSERT [AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8d04dce2-969a-435d-bba4-df3f325983dc', N'Administrator role', N'admin', N'admin', N'cd19fa39-a8ad-44e3-b559-d6637d5a95dc')
INSERT [AppRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8c2aad06-413a-4256-9c04-e022cb072058', N'NhanVien', N'nhanvien', N'nhanvien', N'cd19fa39-a8ad-44e3-b559-d6637d5a95dc')
GO
INSERT [AppUserRoles] ([UserId], [RoleId]) VALUES (N'69bd714f-9576-45ba-b5b7-f00649be00de', N'8d04dce2-969a-435d-bba4-df3f325983dc')
GO
INSERT [AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'Tạ Duy', N'Tùng', CAST(N'2022-11-24T00:00:00.0000000' AS DateTime2), N'taduytung99', N'TADUYTUNG99', N'string@gmain.com', N'STRING@GMAIN.COM', 0, N'AQAAAAEAACcQAAAAEB2aNOA0wSmVJ6Fnlc7eHl0o1o+r63yQJtzn1Uo+KmuNxXIdK6rcXam9Z6s633n7qQ==', N'G26O3MLXY7ROGZXSY6MD6DX67N2GP2F2', N'dcb49476-c25f-4ed2-b9b2-9264be9d0eaf', N'0461264871', 0, 0, NULL, 1, 0)
INSERT [AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3169cee0-1300-451c-88eb-08dac260b063', N'Tạ Duy', N'Tùng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'1313', NULL, 0, NULL, NULL, N'da4f4603-ac5c-43c3-84c1-ec723c4cc094', N'12331', 0, 0, NULL, 0, 0)
INSERT [AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ca8dddf3-c347-4f90-1e83-08dac26330c7', N'Tạ Duy', N'Tùng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'ada', NULL, 0, NULL, NULL, N'85656861-9b18-4e17-a086-21137e785e57', N'áddsa', 0, 0, NULL, 0, 0)
INSERT [AppUsers] ([Id], [FirstName], [LastName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'69bd714f-9576-45ba-b5b7-f00649be00de', N'Toan', N'Bach', CAST(N'2020-01-31T00:00:00.0000000' AS DateTime2), N'admin', N'admin', N'tedu.international@gmail.com', N'tedu.international@gmail.com', 1, N'AQAAAAEAACcQAAAAEI6ovP0+AFBaqTncpnLN8J0GqyXvrfdu+sCe1plpNw9YX16/Bfa514Jg+K9g3CiVlQ==', N'', N'347faaa7-da7c-4d24-bdb6-69a5ffb77218', NULL, 0, 0, NULL, 0, 0)
GO
SET IDENTITY_INSERT [Carts] ON 

INSERT [Carts] ([Id], [ProductVariationId], [Quantity], [Price], [UserId], [DateCreated]) VALUES (6, 6, 6, CAST(123.00 AS Decimal(18, 2)), N'dd57e58c-c92c-4bdf-449e-08daba637f72', CAST(N'2022-11-09T16:40:42.1584859' AS DateTime2))
INSERT [Carts] ([Id], [ProductVariationId], [Quantity], [Price], [UserId], [DateCreated]) VALUES (7, 7, 3, CAST(123.00 AS Decimal(18, 2)), N'dd57e58c-c92c-4bdf-449e-08daba637f72', CAST(N'2022-11-09T16:40:51.1266336' AS DateTime2))
INSERT [Carts] ([Id], [ProductVariationId], [Quantity], [Price], [UserId], [DateCreated]) VALUES (8, 10, 1, CAST(123.00 AS Decimal(18, 2)), N'dd57e58c-c92c-4bdf-449e-08daba637f72', CAST(N'2022-11-09T16:50:03.0136174' AS DateTime2))
SET IDENTITY_INSERT [Carts] OFF
GO
SET IDENTITY_INSERT [Categories] ON 

INSERT [Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (1, 1, 1, NULL, 1)
INSERT [Categories] ([Id], [SortOrder], [IsShowOnHome], [ParentId], [Status]) VALUES (2, 2, 1, NULL, 1)
SET IDENTITY_INSERT [Categories] OFF
GO
SET IDENTITY_INSERT [CategoryTranslations] ON 

INSERT [CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (1, 1, N'Áo nam', N'Sản phẩm áo thời trang nam', N'Sản phẩm áo thời trang nam', N'vi', N'ao-nam')
INSERT [CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (2, 1, N'Men Shirt', N'The shirt products for men', N'The shirt products for men', N'en', N'men-shirt')
INSERT [CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (3, 2, N'Áo nữ', N'Sản phẩm áo thời trang nữ', N'Sản phẩm áo thời trang women', N'vi', N'ao-nu')
INSERT [CategoryTranslations] ([Id], [CategoryId], [Name], [SeoDescription], [SeoTitle], [LanguageId], [SeoAlias]) VALUES (4, 2, N'Women Shirt', N'The shirt products for women', N'The shirt products for women', N'en', N'women-shirt')
SET IDENTITY_INSERT [CategoryTranslations] OFF
GO
SET IDENTITY_INSERT [Colors] ON 

INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (1, N'Đỏ Tươi', N'#FF0000', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (2, N'Cam', N'#FF11331', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (3, N'Đỏ sang chảnh', N'#FF0000', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (4, N'Đỏ sang chảnh', N'#FF0000', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (5, N'Đỏ sang chảnh 24', N'#FF00011', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (6, N'Đỏ sang chảnh 24ghgc', N'gà quân', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (7, N'Đỏ sang chảnh', N'#FF0055', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (8, N'Đỏ sang chảnh', N'#FF0054', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (9, N'Đỏ sang chảnh 24', N'#FF0000', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (10, N'Đỏ sang chảnh 24', N'#FF0055', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (11, N'Đỏ sang chảnh 24', N'#FF0000', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (12, N'Đỏ sang chảnh 24', N'#FF0000', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (13, N'Đỏ sang chảnh', N'#FF0055', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (14, N'Đỏ sang chảnh 24', N'#FF0000', 1)
INSERT [Colors] ([Id], [Name], [HEXCode], [Status]) VALUES (15, N'Đỏ sang chảnh 24', N'#FF0000', 1)
SET IDENTITY_INSERT [Colors] OFF
GO
INSERT [Languages] ([Id], [Name], [IsDefault]) VALUES (N'en', N'English', 0)
INSERT [Languages] ([Id], [Name], [IsDefault]) VALUES (N'vi', N'Tiếng Việt', 1)
GO
INSERT [OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (1, 6, 5, CAST(123.00 AS Decimal(18, 2)))
INSERT [OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (1, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (1, 10, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (3, 6, 6, CAST(123.00 AS Decimal(18, 2)))
INSERT [OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (3, 7, 3, CAST(123.00 AS Decimal(18, 2)))
INSERT [OrderDetails] ([OrderId], [ProductVariationId], [Quantity], [Price]) VALUES (3, 10, 1, CAST(123.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [Orders] ON 

INSERT [Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (1, CAST(N'2022-11-09T21:43:02.0642758' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'1313', N'1313', N'1313', N'12331', 3)
INSERT [Orders] ([Id], [OrderDate], [UserId], [ShipName], [ShipAddress], [ShipEmail], [ShipPhoneNumber], [Status]) VALUES (3, CAST(N'2022-11-09T22:00:53.0616702' AS DateTime2), N'dd57e58c-c92c-4bdf-449e-08daba637f72', N'ada', N'adda', N'ada', N'áddsa', 3)
SET IDENTITY_INSERT [Orders] OFF
GO
SET IDENTITY_INSERT [ProductImages] ON 

INSERT [ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (6, 7, N'/Images/25f22667-eb69-4aab-bd91-070d659b9940.jpg', N'Thumbnail image', 1, CAST(N'2022-10-30T22:01:05.0762673' AS DateTime2), 1, 110790)
INSERT [ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (7, 8, N'/Images/25f22667-eb69-4aab-bd91-070d659b9940.jpg', N'Thumbnail image', 1, CAST(N'2022-10-30T22:01:13.4409877' AS DateTime2), 1, 110790)
INSERT [ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (8, 9, N'/Images/25f22667-eb69-4aab-bd91-070d659b9940.jpg', N'Thumbnail image', 1, CAST(N'2022-10-30T22:01:24.7565181' AS DateTime2), 1, 110790)
INSERT [ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (9, 10, N'/Images/25f22667-eb69-4aab-bd91-070d659b9940.jpg', N'Thumbnail image', 1, CAST(N'2022-10-30T22:02:26.0909141' AS DateTime2), 1, 67220)
INSERT [ProductImages] ([Id], [ProductId], [ImagePath], [Caption], [IsDefault], [DateCreated], [SortOrder], [FileSize]) VALUES (13, 1, N'/Images/25f22667-eb69-4aab-bd91-070d659b9940.jpg', N'1', 1, CAST(N'2022-10-30T00:00:00.0000000' AS DateTime2), 1, 1222)
SET IDENTITY_INSERT [ProductImages] OFF
GO
INSERT [ProductInCategories] ([ProductId], [CategoryId]) VALUES (1, 1)
INSERT [ProductInCategories] ([ProductId], [CategoryId]) VALUES (7, 1)
GO
SET IDENTITY_INSERT [Products] ON 

INSERT [Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (1, CAST(200000.00 AS Decimal(18, 2)), CAST(100000.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T12:42:10.5434633' AS DateTime2), NULL)
INSERT [Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (7, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:01:05.0761004' AS DateTime2), NULL)
INSERT [Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (8, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:01:13.4409822' AS DateTime2), NULL)
INSERT [Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (9, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:01:24.7565158' AS DateTime2), NULL)
INSERT [Products] ([Id], [Price], [OriginalPrice], [ViewCount], [DateCreated], [IsFeatured]) VALUES (10, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-30T22:02:26.0909056' AS DateTime2), NULL)
SET IDENTITY_INSERT [Products] OFF
GO
SET IDENTITY_INSERT [ProductTranslations] ON 

INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (1, 1, N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'Áo sơ mi nam trắng Việt Tiến', N'ao-so-mi-nam-trang-viet-tien', N'vi')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (2, 1, N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'Viet Tien Men T-Shirt', N'viet-tien-men-t-shirt', N'en')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (8, 7, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (9, 7, N'Áo 1', N'111', N'11', N'111', N'123', N'123', N'vi')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (10, 8, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (11, 8, N'Áo 2', N'111', N'11', N'111', N'123', N'123', N'vi')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (12, 9, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (13, 9, N'Áo 3', N'111', N'11', N'111', N'123', N'123', N'vi')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (14, 10, N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'N/A', N'en')
INSERT [ProductTranslations] ([Id], [ProductId], [Name], [Description], [Details], [SeoDescription], [SeoTitle], [SeoAlias], [LanguageId]) VALUES (15, 10, N'Áo 4', N'111', N'11', N'111', N'123', N'123', N'vi')
SET IDENTITY_INSERT [ProductTranslations] OFF
GO
SET IDENTITY_INSERT [ProductVariations] ON 

INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (1, 1, 1, 1, 190)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (2, 7, 1, 1, 100)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (4, 8, 1, 1, 50)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (5, 9, 1, 1, 25)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (6, 10, 1, 1, 25)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (7, 10, 2, 1, 444)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (8, 10, 1, 2, 11)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (9, 10, 2, 2, 122)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (10, 10, 2, 3, 0)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (11, 10, 2, 3, 111)
INSERT [ProductVariations] ([Id], [ProductId], [ColorId], [SizeId], [Stock]) VALUES (12, 9, 1, 2, 50)
SET IDENTITY_INSERT [ProductVariations] OFF
GO
SET IDENTITY_INSERT [Sizes] ON 

INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (1, N'Size XL Áo', N'XL', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (2, N'Size XXL Áo', N'XXL', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (3, N'Size M Áo', N'M', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (4, N'Size XXXL', N'XXXL', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (6, N'Quân', N'SM', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (7, N'Nô lệ Quân', N'SM', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (8, N'Nô lệ Quân 1', N'SM', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (9, N'Nô lệ Quân 12', N'SM', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (10, N'1', N'1', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (11, N'2', N'2', 1)
INSERT [Sizes] ([Id], [Name], [Code], [Status]) VALUES (12, N'3', N'4', 1)
SET IDENTITY_INSERT [Sizes] OFF
GO
SET IDENTITY_INSERT [Slides] ON 

INSERT [Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (1, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/1.png', 1, 1)
INSERT [Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (2, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/2.png', 2, 1)
INSERT [Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (3, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/3.png', 3, 1)
INSERT [Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (4, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/4.png', 4, 1)
INSERT [Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (5, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/5.png', 5, 1)
INSERT [Slides] ([Id], [Name], [Description], [Url], [Image], [SortOrder], [Status]) VALUES (6, N'Second Thumbnail label', N'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.', N'#', N'/themes/images/carousel/6.png', 6, 1)
SET IDENTITY_INSERT [Slides] OFF
GO
/****** Object:  Index [IX_Carts_ProductVariationId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_ProductVariationId] ON [Carts]
(
	[ProductVariationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryTranslations_CategoryId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryTranslations_CategoryId] ON [CategoryTranslations]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CategoryTranslations_LanguageId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryTranslations_LanguageId] ON [CategoryTranslations]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ProductVariationId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductVariationId] ON [OrderDetails]
(
	[ProductVariationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInCategories_ProductId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductInCategories_ProductId] ON [ProductInCategories]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductTranslations_LanguageId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTranslations_LanguageId] ON [ProductTranslations]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductTranslations_ProductId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTranslations_ProductId] ON [ProductTranslations]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariations_ColorId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariations_ColorId] ON [ProductVariations]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariations_ProductId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariations_ProductId] ON [ProductVariations]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariations_SizeId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariations_SizeId] ON [ProductVariations]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_UserId]    Script Date: 11/9/2022 10:23:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_UserId] ON [Transactions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Categories] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [Colors] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Status]
GO
ALTER TABLE [Products] ADD  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [ProductVariations] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [Sizes] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Status]
GO
ALTER TABLE [Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Carts] CHECK CONSTRAINT [FK_Carts_AppUsers_UserId]
GO
ALTER TABLE [Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_ProductVariations_ProductVariationId] FOREIGN KEY([ProductVariationId])
REFERENCES [ProductVariations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Carts] CHECK CONSTRAINT [FK_Carts_ProductVariations_ProductVariationId]
GO
ALTER TABLE [CategoryTranslations]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTranslations_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [CategoryTranslations] CHECK CONSTRAINT [FK_CategoryTranslations_Categories_CategoryId]
GO
ALTER TABLE [CategoryTranslations]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTranslations_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [Languages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [CategoryTranslations] CHECK CONSTRAINT [FK_CategoryTranslations_Languages_LanguageId]
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductVariations_ProductVariationId] FOREIGN KEY([ProductVariationId])
REFERENCES [ProductVariations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductVariations_ProductVariationId]
GO
ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_AppUsers_UserId]
GO
ALTER TABLE [ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [ProductInCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductInCategories] CHECK CONSTRAINT [FK_ProductInCategories_Categories_CategoryId]
GO
ALTER TABLE [ProductInCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategories_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductInCategories] CHECK CONSTRAINT [FK_ProductInCategories_Products_ProductId]
GO
ALTER TABLE [ProductTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ProductTranslations_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [Languages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductTranslations] CHECK CONSTRAINT [FK_ProductTranslations_Languages_LanguageId]
GO
ALTER TABLE [ProductTranslations]  WITH CHECK ADD  CONSTRAINT [FK_ProductTranslations_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductTranslations] CHECK CONSTRAINT [FK_ProductTranslations_Products_ProductId]
GO
ALTER TABLE [ProductVariations]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariations_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductVariations] CHECK CONSTRAINT [FK_ProductVariations_Colors_ColorId]
GO
ALTER TABLE [ProductVariations]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariations_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductVariations] CHECK CONSTRAINT [FK_ProductVariations_Products_ProductId]
GO
ALTER TABLE [ProductVariations]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariations_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductVariations] CHECK CONSTRAINT [FK_ProductVariations_Sizes_SizeId]
GO
ALTER TABLE [Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_AppUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [AppUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Transactions] CHECK CONSTRAINT [FK_Transactions_AppUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [DU_AN_QuanLyBanHang_Nhom2] SET  READ_WRITE 
GO
