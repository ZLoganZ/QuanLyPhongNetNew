USE [master]
GO
/****** Object:  Database [QuanLyPhongNet]    Script Date: 24/5/2022 1:07:16 AM ******/
CREATE DATABASE [QuanLyPhongNet]
GO
ALTER DATABASE [QuanLyPhongNet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyPhongNet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyPhongNet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyPhongNet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyPhongNet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyPhongNet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyPhongNet] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyPhongNet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyPhongNet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyPhongNet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyPhongNet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyPhongNet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyPhongNet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyPhongNet', N'ON'
GO
ALTER DATABASE [QuanLyPhongNet] SET QUERY_STORE = OFF
GO
USE [QuanLyPhongNet]
GO
/****** Object:  Table [dbo].[AfterPayClient]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AfterPayClient](
	[ClientName] [varchar](30) NOT NULL,
	[BillID] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[UseTime] [time](7) NULL,
	[PriceUnit] [float] NULL,
	[TotalMoney] [float] NULL,
 CONSTRAINT [PK__AfterPay__D49F2265B506120F] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BeforePayClient]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BeforePayClient](
	[ClientName] [varchar](30) NOT NULL,
	[BillID] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[UseTime] [time](7) NULL,
	[LeftTime] [time](7) NULL,
 CONSTRAINT [PK__BeforePa__D49F2265E685E762] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[FoundedUser] [nvarchar](60) NULL,
	[FoundedDate] [date] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__Bill__11F2FC4A977BCF23] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryName] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK__Category__8517B2E1AFD6FCE7] PRIMARY KEY CLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[ClientName] [varchar](30) NOT NULL,
	[GroupClientName] [nvarchar](30) NULL,
	[StatusClient] [varchar](50) NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK__Client__65800DA1FEE369FE] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Drink]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drink](
	[DrinkID] [int] IDENTITY(1,1) NOT NULL,
	[DrinkName] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](60) NULL,
	[PriceUnit] [float] NULL,
	[UnitLot] [nvarchar](100) NULL,
	[InventoryNumber] [int] NULL,
 CONSTRAINT [PK__Drink__C094D3C8F9C03AB7] PRIMARY KEY CLUSTERED 
(
	[DrinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](60) NULL,
	[PriceUnit] [float] NULL,
	[UnitLot] [nvarchar](100) NULL,
	[InventoryNumber] [int] NULL,
 CONSTRAINT [PK__Food__856DB3CBF6829878] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupClient]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupClient](
	[GroupName] [nvarchar](30) NOT NULL,
	[Discription] [nvarchar](120) NULL,
 CONSTRAINT [PK__GroupCli__6EFCD4352C33DF6E] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupClientAndGroupUser]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupClientAndGroupUser](
	[GroupUserName] [nvarchar](30) NOT NULL,
	[GroupClientName] [nvarchar](30) NOT NULL,
	[GiaDichVu] [float] NULL,
 CONSTRAINT [PK__GroupCli__21FE1C2BC679EAC4] PRIMARY KEY CLUSTERED 
(
	[GroupUserName] ASC,
	[GroupClientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupUser]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupUser](
	[GroupName] [nvarchar](30) NOT NULL,
	[TypeName] [varchar](30) NULL,
 CONSTRAINT [PK__GroupUse__6EFCD4359AF7AE7E] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginMember]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginMember](
	[memberID] [int] NOT NULL,
	[ClientName] [varchar](30) NOT NULL,
	[StartTime] [time](7) NULL,
	[UseTime] [time](7) NULL,
	[LeftTime] [time](7) NULL,
 CONSTRAINT [PK__LoginMem__798FCF2CDC92FBC2] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC,
	[ClientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[GroupUser] [nvarchar](30) NULL,
	[CurrentTime] [time](7) NULL,
	[CurrentMoney] [float] NULL,
	[StatusAccount] [nvarchar](30) NULL,
 CONSTRAINT [PK__Member__0CF04B382652A470] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MemberInformation]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberInformation](
	[memberID] [int] NOT NULL,
	[MemberName] [nvarchar](100) NULL,
	[FoundedDate] [date] NULL,
	[PhoneNumber] [varchar](11) NULL,
	[MemberAddress] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__MemberIn__7FD7CFF6ED10E3CF] PRIMARY KEY CLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderCard]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderCard](
	[ClientName] [varchar](30) NOT NULL,
	[CardID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__OrderCar__90DFE179BE878F64] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDrink]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDrink](
	[ClientName] [varchar](30) NOT NULL,
	[DrinkID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__OrderDri__F989409DFD691638] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[DrinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderFood]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderFood](
	[ClientName] [varchar](30) NOT NULL,
	[FoodID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[PriceTotal] [float] NULL,
 CONSTRAINT [PK__OrderFoo__CDD6D69DFB8E47F0] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheCard]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheCard](
	[CardID] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [nvarchar](100) NULL,
	[CategoryName] [nvarchar](60) NULL,
	[PriceUnit] [float] NULL,
	[UnitLot] [nvarchar](100) NULL,
	[InventoryNumber] [int] NULL,
 CONSTRAINT [PK__TheCard__55FECD8E7246C322] PRIMARY KEY CLUSTERED 
(
	[CardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheUser]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TheUser](
	[UserName] [nvarchar](60) NOT NULL,
	[Type] [varchar](30) NULL,
	[GroupUser] [nvarchar](30) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__TheUser__C9F284573AB56A79] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionDiary]    Script Date: 24/5/2022 1:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDiary](
	[UserName] [nvarchar](60) NULL,
	[memberID] [int] NULL,
	[TransacDate] [date] NULL,
	[AddTime] [time](7) NULL,
	[AddMoney] [float] NULL,
	[UseTime] [time](7) NULL,
	[Note] [nvarchar](120) NULL
) ON [PRIMARY]
GO
UPDATE STATISTICS [dbo].[TransactionDiary] WITH ROWCOUNT = 0, PAGECOUNT = 0
GO
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Bia')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Bún')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Cơm')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Mì gói')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Nước ngọt')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Phở')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Rượu')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Thẻ Điện Thoại')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Thẻ Game')
INSERT [dbo].[Category] ([CategoryName]) VALUES (N'Trà')
GO
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-1', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-10', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-11', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-12', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-13', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-14', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-15', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-16', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-17', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-18', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-19', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-2', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-20', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-3', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-4', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-5', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-6', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-7', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-8', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY-9', N'Máy Lạnh', N'DISCONNECT', N'máy phòng máy lạnh')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY1', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY10', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY11', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY12', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY13', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY14', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY15', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY16', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY17', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY18', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY19', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY2', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY20', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY3', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY4', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY5', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY6', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY7', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY8', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAY9', N'Mặc Định', N'DISCONNECT', N'máy phòng thường')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-1', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-10', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-11', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-12', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-13', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-14', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-15', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-2', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-3', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-4', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-5', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-6', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-7', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-8', N'VIP', N'DISCONNECT', N'máy phòng VIP')
INSERT [dbo].[Client] ([ClientName], [GroupClientName], [StatusClient], [Note]) VALUES (N'MAYVIP-9', N'VIP', N'DISCONNECT', N'máy phòng VIP')
GO
SET IDENTITY_INSERT [dbo].[Drink] ON 

INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (1, N'7 UP', N'Nước ngọt', 10000, N'Chai', 35)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (2, N'Pepsi', N'Nước ngọt', 10000, N'Chai', 25)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (3, N'Coca', N'Nước ngọt', 10000, N'Chai', 40)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (4, N'Trà xanh không độ', N'Trà', 12000, N'Chai', 21)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (5, N'C2', N'Trà', 8000, N'Chai', 32)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (6, N'Fanta', N'Nước ngọt', 10000, N'Chai', 22)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (7, N'Mirinda xá xị', N'Nước ngọt', 10000, N'Chai', 20)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (8, N'Rồng đỏ', N'Nước ngọt', 10000, N'Hủ', 45)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (9, N'STING dâu', N'Nước ngọt', 10000, N'Chai', 48)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (10, N'STING dâu promax', N'Nước ngọt', 12000, N'Lon', 35)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (11, N'STING vàng', N'Nước ngọt', 12000, N'Chai', 47)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (12, N'RED BULL', N'Nước ngọt', 12000, N'Lon', 50)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (13, N'Trà đá', N'Trà', 12000, N'Ly', 100)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (14, N'Trà đá ca', N'Trà', 12000, N'Ca', 100)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (15, N'Bia Tiger', N'Bia', 15000, N'Lon', 42)
INSERT [dbo].[Drink] ([DrinkID], [DrinkName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (16, N'Rượu Đế', N'Rượu', 20000, N'Chai', 48)
SET IDENTITY_INSERT [dbo].[Drink] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (1, N'Phở gà', N'Bia', 20000, N'Tô', 8)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (2, N'Mì xào bò', N'Mì gói', 15000, N'Dĩa', 20)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (3, N'Mì xào bò trứng', N'Mì gói', 20000, N'Dĩa', 11)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (4, N'Cơm chiên trứng', N'Cơm', 12000, N'Dĩa', 12)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (5, N'Cơm chiên thịt heo', N'Cơm', 15000, N'Dĩa', 14)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (6, N'Cơm xào bò', N'Cơm', 20000, N'Dĩa', 16)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (7, N'Bún xào', N'Bún', 12000, N'Dĩa', 13)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (8, N'Phở gà đá', N'Phở', 25000, N'Tô', 15)
INSERT [dbo].[Food] ([FoodID], [FoodName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (9, N'Phở bò', N'Phở', 22000, N'Tô', 6)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'Mặc Định', N'Phòng máy thường')
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'Máy Lạnh', N'Phòng máy lạnh')
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'Thi Đấu', N'Phòng máy dành cho giải đấu Game')
INSERT [dbo].[GroupClient] ([GroupName], [Discription]) VALUES (N'VIP', N'Phòng vip')
GO
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Hội viên', N'Member')
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Khách vãng lai', N'Guest')
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Nhân viên', N'Staff')
INSERT [dbo].[GroupUser] ([GroupName], [TypeName]) VALUES (N'Quản lý', N'Manager')
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (2, N'Seraphim', N'123', N'Hội viên', CAST(N'07:00:00' AS Time), 28000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (3, N'0961563202', N'123', N'Hội viên', CAST(N'03:00:00' AS Time), 12000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (4, N'heavenhell8899', N'123', N'Hội viên', CAST(N'10:00:00' AS Time), 40000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (5, N'abc', N'123', N'Hội viên', CAST(N'00:00:00' AS Time), 0, N'Hết Thời Gian')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (6, N'xyz', N'123', N'Hội viên', CAST(N'15:00:00' AS Time), 60000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (7, N'tikitaka', N'123', N'Hội viên', CAST(N'00:00:00' AS Time), 0, N'Hết Thời Gian')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (8, N'barca', N'123', N'Hội viên', CAST(N'00:00:00' AS Time), 0, N'Hết Thời Gian')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (9, N'realmadrid', N'123', N'Hội viên', CAST(N'00:00:00' AS Time), 0, N'Hết Thời Gian')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (11, N'haivl', N'123', N'Hội viên', CAST(N'12:12:00' AS Time), 50000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (12, N'xemvn', N'123', N'Hội viên', CAST(N'08:00:00' AS Time), 32000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (13, N'facebook', N'123', N'Hội viên', CAST(N'07:12:00' AS Time), 30000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (23, N'loganz', N'123', N'Hội viên', CAST(N'06:30:00' AS Time), 65000, N'Cho Phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (24, N'taynguyen', N'123', N'Hội viên', CAST(N'05:00:00' AS Time), 50000, N'Cho phép')
INSERT [dbo].[Member] ([MemberID], [AccountName], [Password], [GroupUser], [CurrentTime], [CurrentMoney], [StatusAccount]) VALUES (26, N'quangbao', N'123', N'Hội viên', CAST(N'02:30:00' AS Time), 25000, N'Cho phép')
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[TheCard] ON 

INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (1, N'GATE 20K', N'Thẻ Game', 20000, N'Thẻ', 51)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (2, N'GATE 30K', N'Thẻ Game', 30000, N'Thẻ', 60)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (3, N'GATE 50K', N'Thẻ Game', 50000, N'Thẻ', 42)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (4, N'GATE 100K', N'Thẻ Game', 100000, N'Thẻ', 22)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (5, N'VINAGAME 20K', N'Thẻ Game', 20000, N'Thẻ', 35)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (6, N'VINAGAME 50K', N'Thẻ Game', 50000, N'Thẻ', 39)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (7, N'VINAGAME 100K', N'Thẻ Game', 100000, N'Thẻ', 21)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (8, N'ZING 20K', N'Thẻ Game', 20000, N'Thẻ', 36)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (9, N'ZING 50K', N'Thẻ Game', 50000, N'Thẻ', 25)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (10, N'ZING 100K', N'Thẻ Game', 100000, N'Thẻ', 19)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (11, N'VTC ONLINE 20K', N'Thẻ Game', 20000, N'Thẻ', 62)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (12, N'VTC ONLINE 50K', N'Thẻ Game', 50000, N'Thẻ', 35)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (13, N'VTC ONLINE 100K', N'Thẻ Game', 100000, N'Thẻ', 26)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (14, N'VTC ONLINE 200K', N'Thẻ Game', 200000, N'Thẻ', 12)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (15, N'GARENA 20K', N'Thẻ Game', 20000, N'Thẻ', 80)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (16, N'GARENA 30K', N'Thẻ Game', 30000, N'Thẻ', 120)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (17, N'GARENA 50K', N'Thẻ Game', 50000, N'Thẻ', 110)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (18, N'GARENA 100K', N'Thẻ Game', 100000, N'Thẻ', 40)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (19, N'GARENA 200K', N'Thẻ Game', 200000, N'Thẻ', 25)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (20, N'Mobifone 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 76)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (21, N'Mobifone 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 80)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (22, N'Mobifone 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 56)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (23, N'Mobifone 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 40)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (24, N'Mobifone 200K', N'Thẻ Điện Thoại', 200000, N'Thẻ', 21)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (25, N'Vinaphone 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 54)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (26, N'Vinaphone 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 60)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (27, N'Vinaphone 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 32)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (28, N'Vinaphone 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 16)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (29, N'Viettel 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 84)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (30, N'Viettel 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 69)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (31, N'Viettel 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 54)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (32, N'Viettel 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 32)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (33, N'VietNamMobile 10K', N'Thẻ Điện Thoại', 10000, N'Thẻ', 45)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (34, N'VietNamMobile 20K', N'Thẻ Điện Thoại', 20000, N'Thẻ', 54)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (35, N'VietNamMobile 50K', N'Thẻ Điện Thoại', 50000, N'Thẻ', 25)
INSERT [dbo].[TheCard] ([CardID], [CardName], [CategoryName], [PriceUnit], [UnitLot], [InventoryNumber]) VALUES (36, N'VietNamMobile 100K', N'Thẻ Điện Thoại', 100000, N'Thẻ', 14)
SET IDENTITY_INSERT [dbo].[TheCard] OFF
GO
INSERT [dbo].[TheUser] ([UserName], [Type], [GroupUser], [PhoneNumber], [Email]) VALUES (N'Hoàng Hải', N'Manager', N'Quản lý', N'0961563202', N'hoanghai@gmail.com')
INSERT [dbo].[TheUser] ([UserName], [Type], [GroupUser], [PhoneNumber], [Email]) VALUES (N'Huyền Trang', N'Staff', N'Nhân viên', N'0123456789', N'trang@gmail.com')
INSERT [dbo].[TheUser] ([UserName], [Type], [GroupUser], [PhoneNumber], [Email]) VALUES (N'Văn Tiến', N'Staff', N'Nhân viên', N'097851364', N'tien@gmail.com')
GO
ALTER TABLE [dbo].[AfterPayClient]  WITH CHECK ADD  CONSTRAINT [FK__AfterPayC__BillI__5812160E] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[AfterPayClient] CHECK CONSTRAINT [FK__AfterPayC__BillI__5812160E]
GO
ALTER TABLE [dbo].[AfterPayClient]  WITH CHECK ADD  CONSTRAINT [FK__AfterPayC__Clien__571DF1D5] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[AfterPayClient] CHECK CONSTRAINT [FK__AfterPayC__Clien__571DF1D5]
GO
ALTER TABLE [dbo].[BeforePayClient]  WITH CHECK ADD  CONSTRAINT [FK__BeforePay__BillI__5BE2A6F2] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[BeforePayClient] CHECK CONSTRAINT [FK__BeforePay__BillI__5BE2A6F2]
GO
ALTER TABLE [dbo].[BeforePayClient]  WITH CHECK ADD  CONSTRAINT [FK__BeforePay__Clien__5AEE82B9] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[BeforePayClient] CHECK CONSTRAINT [FK__BeforePay__Clien__5AEE82B9]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__FoundedUse__5441852A] FOREIGN KEY([FoundedUser])
REFERENCES [dbo].[TheUser] ([UserName])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__FoundedUse__5441852A]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK__Client__GroupCli__2F10007B] FOREIGN KEY([GroupClientName])
REFERENCES [dbo].[GroupClient] ([GroupName])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK__Client__GroupCli__2F10007B]
GO
ALTER TABLE [dbo].[Drink]  WITH CHECK ADD  CONSTRAINT [FK__Drink__CategoryN__33D4B598] FOREIGN KEY([CategoryName])
REFERENCES [dbo].[Category] ([CategoryName])
GO
ALTER TABLE [dbo].[Drink] CHECK CONSTRAINT [FK__Drink__CategoryN__33D4B598]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK__Food__CategoryNa__36B12243] FOREIGN KEY([CategoryName])
REFERENCES [dbo].[Category] ([CategoryName])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK__Food__CategoryNa__36B12243]
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser]  WITH CHECK ADD  CONSTRAINT [FK__GroupClie__Group__2B3F6F97] FOREIGN KEY([GroupUserName])
REFERENCES [dbo].[GroupUser] ([GroupName])
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser] CHECK CONSTRAINT [FK__GroupClie__Group__2B3F6F97]
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser]  WITH CHECK ADD  CONSTRAINT [FK__GroupClie__Group__2C3393D0] FOREIGN KEY([GroupClientName])
REFERENCES [dbo].[GroupClient] ([GroupName])
GO
ALTER TABLE [dbo].[GroupClientAndGroupUser] CHECK CONSTRAINT [FK__GroupClie__Group__2C3393D0]
GO
ALTER TABLE [dbo].[LoginMember]  WITH CHECK ADD  CONSTRAINT [FK__LoginMemb__Clien__4BAC3F29] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[LoginMember] CHECK CONSTRAINT [FK__LoginMemb__Clien__4BAC3F29]
GO
ALTER TABLE [dbo].[LoginMember]  WITH CHECK ADD  CONSTRAINT [FK__LoginMemb__membe__4AB81AF0] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[LoginMember] CHECK CONSTRAINT [FK__LoginMemb__membe__4AB81AF0]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK__Member__GroupUse__47DBAE45] FOREIGN KEY([GroupUser])
REFERENCES [dbo].[GroupUser] ([GroupName])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK__Member__GroupUse__47DBAE45]
GO
ALTER TABLE [dbo].[MemberInformation]  WITH CHECK ADD  CONSTRAINT [FK__MemberInf__membe__4E88ABD4] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[MemberInformation] CHECK CONSTRAINT [FK__MemberInf__membe__4E88ABD4]
GO
ALTER TABLE [dbo].[OrderCard]  WITH CHECK ADD  CONSTRAINT [FK__OrderCard__CardI__44FF419A] FOREIGN KEY([CardID])
REFERENCES [dbo].[TheCard] ([CardID])
GO
ALTER TABLE [dbo].[OrderCard] CHECK CONSTRAINT [FK__OrderCard__CardI__44FF419A]
GO
ALTER TABLE [dbo].[OrderCard]  WITH CHECK ADD  CONSTRAINT [FK__OrderCard__Clien__440B1D61] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[OrderCard] CHECK CONSTRAINT [FK__OrderCard__Clien__440B1D61]
GO
ALTER TABLE [dbo].[OrderDrink]  WITH CHECK ADD  CONSTRAINT [FK__OrderDrin__Clien__3C69FB99] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[OrderDrink] CHECK CONSTRAINT [FK__OrderDrin__Clien__3C69FB99]
GO
ALTER TABLE [dbo].[OrderDrink]  WITH CHECK ADD  CONSTRAINT [FK__OrderDrin__Drink__3D5E1FD2] FOREIGN KEY([DrinkID])
REFERENCES [dbo].[Drink] ([DrinkID])
GO
ALTER TABLE [dbo].[OrderDrink] CHECK CONSTRAINT [FK__OrderDrin__Drink__3D5E1FD2]
GO
ALTER TABLE [dbo].[OrderFood]  WITH CHECK ADD  CONSTRAINT [FK__OrderFood__Clien__403A8C7D] FOREIGN KEY([ClientName])
REFERENCES [dbo].[Client] ([ClientName])
GO
ALTER TABLE [dbo].[OrderFood] CHECK CONSTRAINT [FK__OrderFood__Clien__403A8C7D]
GO
ALTER TABLE [dbo].[OrderFood]  WITH CHECK ADD  CONSTRAINT [FK__OrderFood__FoodI__412EB0B6] FOREIGN KEY([FoodID])
REFERENCES [dbo].[Food] ([FoodID])
GO
ALTER TABLE [dbo].[OrderFood] CHECK CONSTRAINT [FK__OrderFood__FoodI__412EB0B6]
GO
ALTER TABLE [dbo].[TheCard]  WITH CHECK ADD  CONSTRAINT [FK__TheCard__Categor__398D8EEE] FOREIGN KEY([CategoryName])
REFERENCES [dbo].[Category] ([CategoryName])
GO
ALTER TABLE [dbo].[TheCard] CHECK CONSTRAINT [FK__TheCard__Categor__398D8EEE]
GO
ALTER TABLE [dbo].[TheUser]  WITH CHECK ADD  CONSTRAINT [FK__TheUser__GroupUs__286302EC] FOREIGN KEY([GroupUser])
REFERENCES [dbo].[GroupUser] ([GroupName])
GO
ALTER TABLE [dbo].[TheUser] CHECK CONSTRAINT [FK__TheUser__GroupUs__286302EC]
GO
ALTER TABLE [dbo].[TransactionDiary]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__membe__5165187F] FOREIGN KEY([memberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[TransactionDiary] CHECK CONSTRAINT [FK__Transacti__membe__5165187F]
GO
ALTER TABLE [dbo].[TransactionDiary]  WITH CHECK ADD  CONSTRAINT [FK__Transacti__UserN__5070F446] FOREIGN KEY([UserName])
REFERENCES [dbo].[TheUser] ([UserName])
GO
ALTER TABLE [dbo].[TransactionDiary] CHECK CONSTRAINT [FK__Transacti__UserN__5070F446]
GO
/****** Object:  Statistic [PK__AfterPay__D49F2265B506120F]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[AfterPayClient]([PK__AfterPay__D49F2265B506120F]) WITH STATS_STREAM = 0x01000000020000000000000000000000E58EA2470000000058000000000000000000000000000000A703DD40A70000001E0000000000000008D00034140200003803DB403800000004000A00000000000000000014020000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [PK__BeforePa__D49F2265E685E762]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[BeforePayClient]([PK__BeforePa__D49F2265E685E762]) WITH STATS_STREAM = 0x01000000020000000000000000000000E58EA2470000000058000000000000000000000000000000A703DD40A70000001E0000000000000008D00034140200003803DB403800000004000A00000000000000000014020000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [PK__Bill__11F2FC4A977BCF23]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[Bill]([PK__Bill__11F2FC4A977BCF23]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [PK__Category__8517B2E1AFD6FCE7]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[Category]([PK__Category__8517B2E1AFD6FCE7]) WITH STATS_STREAM = 0x0100000001000000000000000000000088A8B2F5000000001904000000000000D903000000000000E7030000E7000000780000000000000008D000340000000007000000F66910009FAE00000A000000000000000A000000000000000000803FCDCCCC3D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000009000000010000001000000033333341000020410000000033333341000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013040000000000000000000000000000810100000000000055020000000000005D0200000000000065020000000000004800000000000000650000000000000082000000000000009F00000000000000C200000000000000EB000000000000000A010000000000003D010000000000006401000000000000300010000000803F000000000000803F04000001001D00420069006100300010000000803F000000000000803F04000001001D004200FA006E00300010000000803F000000000000803F04000001001D004300A1016D00300010000000803F000000000000803F040000010023004D00EC0020006700F3006900300010000000803F000000000000803F040000010029004E00B001DB1E630020004E006700CD1E7400300010000000803F0000803F0000803F04000001001F005200B001E31E7500300010000000803F000000000000803F0400000100330054006800BB1E200010016900C71E6E002000540068006F00A11E6900300010000000803F000000000000803F0400000100270054006800BB1E2000470061006D006500300010000000803F000000000000803F04000001001D0054007200E000FF01000000000000000A0000000A0000002800000028000000000000000000000032000000420069006100FA006E004300A1016D004D00EC0020006700F30069004E00B001DB1E630020004E006700CD1E740050006800DF1E5200B001E31E750054006800BB1E200010016900C71E6E002000540068006F00A11E6900470061006D0065007200E0000E0000004000000000C001000000810201000001020300008103050000810608000081090E0000810317000081041A000040011E0000C0031F0000810A22000001042C00000102300000000A000000000000000000000000000000, ROWCOUNT = 10, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__Client__65800DA1FEE369FE]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[Client]([PK__Client__65800DA1FEE369FE]) WITH STATS_STREAM = 0x01000000010000000000000000000000C44113240000000040000000000000000000000000000000A7030000A70000001E0000000000000008D0003400000000, ROWCOUNT = 55, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_31EC6D26]    Script Date: 24/5/2022 1:07:17 AM ******/
CREATE STATISTICS [_WA_Sys_00000002_31EC6D26] ON [dbo].[Drink]([DrinkName]) WITH STATS_STREAM = 0x01000000010000000000000000000000D20CCC47000000003E05000000000000FE04000000000000E7020000E7000000C80000000000000008D000340000000007000000CDE706009FAE0000100000000000000010000000000000000000803F8988883D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E0000000E0000000100000010000000000078410000804100000000000078410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130400000000000000000000000000007E020000000000007A0300000000000082030000000000008A0300000000000070000000000000008F00000000000000B800000000000000D300000000000000F200000000000000130100000000000034010000000000005B010000000000008001000000000000A501000000000000CE01000000000000F9010000000000001C020000000000004502000000000000300010000000803F000000000000803F04000001001F003700200055005000300010000000803F000000000000803F04000001002900420069006100200054006900670065007200300010000000803F000000000000803F04000001001B0043003200300010000000803F000000000000803F04000001001F0043006F0063006100300010000000803F000000000000803F04000001002100460061006E0074006100300010000000803F0000803F0000803F0400000100210050006500700073006900300010000000803F000000000000803F040000010027005200450044002000420055004C004C00300010000000803F000000000000803F040000010025005200D31E6E00670020001001CF1E300010000000803F000000000000803F040000010025005200B001E31E750020001001BF1E3000100000000040000000000000803F040000010029005300540049004E00470020006400E2007500300010000000803F000000000000803F04000001002B005300540049004E00470020007600E0006E006700300010000000803F000000000000803F0400000100230054007200E00020001001E100300010000000803F000000000000803F0400000100290054007200E00020001001E100200063006100300010000000803F000000000000803F0400000100390054007200E0002000780061006E00680020006B006800F4006E00670020001101D91EFF01000000000000000A0000000A0000002800000028000000000000000000000046000000370020005500500043003200460061006E00740061004D006900720069006E006400610020007800E10020007800CB1E5200450044002000420055004C004C00D31E6E00670020001001CF1E5300540049004E00470020006400E20075007600E0006E00670054007200E00020001001E100780061006E00680020006B006800F4006E00670020001101D91E0E0000004000000000810400000081020400008105060000810D0B0000C00118000081071900000106200000C00626000081032C000001042F000040043300008102370000010D3900000010000000000000000000000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_31EC6D26]    Script Date: 24/5/2022 1:07:17 AM ******/
CREATE STATISTICS [_WA_Sys_00000003_31EC6D26] ON [dbo].[Drink]([CategoryName]) WITH STATS_STREAM = 0x01000000010000000000000000000000791FA93200000000C2020000000000008202000000000000E7020067E7000000780000000000000008D000340020006407000000FDB511009FAE000010000000000000001000000000000000000000000000803E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000004000000010000001000000000005A41000080410000000000005A41000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013040000000000000000000000000000A200000000000000FE0000000000000006010000000000000E0100000000000020000000000000003D0000000000000066000000000000008500000000000000300010000000803F000000000000803F04000001001D004200690061003000100000002041000000000000803F040000010029004E00B001DB1E630020004E006700CD1E7400300010000000803F000000000000803F04000001001F005200B001E31E75003000100000008040000000000000803F04000001001D0054007200E000FF01000000000000000A00000003000000280000002800000000000000000000000F0000004200690061004E00B001DB1E630020004E006700CD1E740054007200E0000400000040000000008103000000860903000003030C00000010000000000000000000000000000000
GO
/****** Object:  Statistic [PK__Drink__C094D3C8F9C03AB7]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[Drink]([PK__Drink__C094D3C8F9C03AB7]) WITH STATS_STREAM = 0x01000000010000000000000000000000CD13415F0000000040000000000000000000000000000000380304003800000004000A00000000000000000000000080, ROWCOUNT = 16, PAGECOUNT = 1
GO
/****** Object:  Statistic [_WA_Sys_00000002_34C8D9D1]    Script Date: 24/5/2022 1:07:17 AM ******/
CREATE STATISTICS [_WA_Sys_00000002_34C8D9D1] ON [dbo].[Food]([FoodName]) WITH STATS_STREAM = 0x01000000010000000000000000000000F8799CC80000000042040000000000000204000000000000E7020000E7000000C80000000000000008D000343D00000007000000410906009FAE000009000000000000000900000000000000000000000000003E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000080000000100000010000000398EA3410000104100000000398EA341000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013040000000000000000000000000000A4010000000000007E0200000000000086020000000000008E0200000000000040000000000000006500000000000000A000000000000000D500000000000000000100000000000029010000000000005E010000000000008101000000000000300010000000803F000000000000803F040000010025004200FA006E0020007800E0006F00300010000000803F000000000000803F04000001003B004300A1016D002000630068006900EA006E00200074006800CB1E74002000680065006F00300010000000803F000000000000803F040000010035004300A1016D002000630068006900EA006E00200074007200E91E6E006700300010000000803F000000000000803F04000001002B004300A1016D0020007800E0006F0020006200F200300010000000803F000000000000803F040000010029004D00EC0020007800E0006F0020006200F200300010000000803F000000000000803F040000010035004D00EC0020007800E0006F0020006200F200200074007200E91E6E006700300010000000803F000000000000803F0400000100230050006800DF1E20006200F2003000100000000040000000000000803F0400000100230050006800DF1E20006700E000FF01000000000000000900000008000000280000002800000000000000000000003A0000004200FA006E0020007800E0006F004300A1016D002000630068006900EA006E00200074006800CB1E74002000680065006F007200E91E6E0067007800E0006F0020006200F2004D00EC0020007800E0006F0020006200F200200074007200E91E6E00670050006800DF1E20006200F2006700E0000C00000040000000008107000000C004070000C0070B00008107120000010419000001061D0000C10923000001062C00004004320000810236000002023800000009000000000000000000000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_34C8D9D1]    Script Date: 24/5/2022 1:07:17 AM ******/
CREATE STATISTICS [_WA_Sys_00000003_34C8D9D1] ON [dbo].[Food]([CategoryName]) WITH STATS_STREAM = 0x01000000010000000000000000000000D90F627E00000000F202000000000000B202000000000000E702DD40E7000000780000000000000008D000340000000007000000FDB511009FAE00000900000000000000090000000000000000000000CDCC4C3E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000050000000100000010000000ABAAEA400000104100000000ABAAEA40000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013040000000000000000000000000000BF000000000000002E0100000000000036010000000000003E010000000000002800000000000000450000000000000062000000000000007F00000000000000A200000000000000300010000000803F000000000000803F04000001001D00420069006100300010000000803F000000000000803F04000001001D004200FA006E003000100000004040000000000000803F04000001001D004300A1016D003000100000000040000000000000803F040000010023004D00EC0020006700F30069003000100000000040000000000000803F04000001001D0050006800DF1EFF010000000000000009000000050000002800000028000000000000000000000011000000420069006100FA006E004300A1016D004D00EC0020006700F300690050006800DF1E070000004000000000C001000000810201000001020300008303050000820608000002030E00000009000000000000000000000000000000
GO
/****** Object:  Statistic [PK__Food__856DB3CBF6829878]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[Food]([PK__Food__856DB3CBF6829878]) WITH STATS_STREAM = 0x01000000010000000000000000000000529F6D0D00000000400000000000000000000000000000003803001D3800000004000A00000000000000000000000000, ROWCOUNT = 9, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__GroupCli__6EFCD4352C33DF6E]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[GroupClient]([PK__GroupCli__6EFCD4352C33DF6E]) WITH STATS_STREAM = 0x010000000100000000000000000000005B9F85AE0000000040000000000000000000000000000000E7030000E70000003C0000000000000008D00034EC002000, ROWCOUNT = 4, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__GroupCli__21FE1C2BC679EAC4]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[GroupClientAndGroupUser]([PK__GroupCli__21FE1C2BC679EAC4]) WITH STATS_STREAM = 0x01000000020000000000000000000000DF0948ED0000000058000000000000000000000000000000E7030000E70000003C0000000000000008D0003414020000E703DD40E70000003C0000000000000008D0003400000000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [PK__GroupUse__6EFCD4359AF7AE7E]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[GroupUser]([PK__GroupUse__6EFCD4359AF7AE7E]) WITH STATS_STREAM = 0x010000000100000000000000000000007243F20E000000001B03000000000000DB02000000000000E7031041E70000003C0000000000000008D00034000000000700000019207D019DAE000004000000000000000400000000000000000000000000803E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000004000000010000001000000000009841000080400000000000009841000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013040000000000000000000000000000C80000000000000057010000000000005F010000000000006701000000000000200000000000000047000000000000007A00000000000000A300000000000000300010000000803F000000000000803F040000010027004800D91E6900200076006900EA006E00300010000000803F000000000000803F040000010033004B006800E1006300680020007600E3006E00670020006C0061006900300010000000803F000000000000803F040000010029004E006800E2006E00200076006900EA006E00300010000000803F000000000000803F0400000100250051007500A31E6E0020006C00FD00FF0100000000000000040000000400000028000000280000000000000000000000260000004800D91E6900200076006900EA006E004B006800E1006300680020007600E3006E00670020006C00610069004E006800E2006E00200076006900EA006E0051007500A31E6E0020006C00FD000500000040000000008108000000810E080000810916000001071F00000004000000000000000000000000000000, ROWCOUNT = 4, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__LoginMem__798FCF2CDC92FBC2]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[LoginMember]([PK__LoginMem__798FCF2CDC92FBC2]) WITH STATS_STREAM = 0x0100000002000000000000000000000040F86F980000000058000000000000000000000000000000380300003800000004000A00000000000000000000000000A7030000A70000001E0000000000000008D0003413040000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [_WA_Sys_00000004_45F365D3]    Script Date: 24/5/2022 1:07:17 AM ******/
CREATE STATISTICS [_WA_Sys_00000004_45F365D3] ON [dbo].[Member]([GroupUser]) WITH STATS_STREAM = 0x01000000010000000000000000000000F789C782000000003702000000000000F701000000000000E702DD40E70000003C0000000000000008D00034007600E30700000019207D019DAE00000D000000000000000D00000000000000000000000000803F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000100000010000000000080410000504100000000000080410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130400000000000000000000000000002F0000000000000073000000000000007B00000000000000830000000000000008000000000000003000100000005041000000000000803F040000010027004800D91E6900200076006900EA006E00FF01000000000000000A0000000100000028000000280000000000000000000000080000004800D91E6900200076006900EA006E000200000040000000000A08000000000D000000000000000000000000000000
GO
/****** Object:  Statistic [PK__Member__0CF04B382652A470]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[Member]([PK__Member__0CF04B382652A470]) WITH STATS_STREAM = 0x01000000010000000000000000000000ED0358EE0000000040000000000000000000000000000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 14, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__MemberIn__7FD7CFF6ED10E3CF]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[MemberInformation]([PK__MemberIn__7FD7CFF6ED10E3CF]) WITH STATS_STREAM = 0x010000000100000000000000000000006FC962C000000000400000000000000000000000000000003803FFFF3800000004000A00000000000000000000000000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [PK__OrderCar__90DFE179BE878F64]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[OrderCard]([PK__OrderCar__90DFE179BE878F64]) WITH STATS_STREAM = 0x0100000002000000000000000000000020F7321F0000000058000000000000000000000000000000A7030000A70000001E0000000000000008D0003400000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [PK__OrderDri__F989409DFD691638]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[OrderDrink]([PK__OrderDri__F989409DFD691638]) WITH STATS_STREAM = 0x0100000002000000000000000000000020F7321F0000000058000000000000000000000000000000A7030000A70000001E0000000000000008D0003400000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [PK__OrderFoo__CDD6D69DFB8E47F0]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[OrderFood]([PK__OrderFoo__CDD6D69DFB8E47F0]) WITH STATS_STREAM = 0x0100000002000000000000000000000020F7321F0000000058000000000000000000000000000000A7030000A70000001E0000000000000008D0003400000000380300003800000004000A00000000000000000000000000, ROWCOUNT = 0, PAGECOUNT = 0
GO
/****** Object:  Statistic [_WA_Sys_00000002_37A5467C]    Script Date: 24/5/2022 1:07:17 AM ******/
CREATE STATISTICS [_WA_Sys_00000002_37A5467C] ON [dbo].[TheCard]([CardName]) WITH STATS_STREAM = 0x010000000100000000000000000000008EE0F8FD00000000A40A000000000000640A000000000000E7020000E7000000C80000000000000008D0003400000000070000006ECF09009FAE0000240000000000000024000000000000000000803F398EE33C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000230000002300000001000000100000008EE3C04100001042000000008EE3C0410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130400000000000000000000000000009107000000000000E008000000000000E808000000000000F0080000000000001801000000000000450100000000000072010000000000009D01000000000000C801000000000000F3010000000000001C0200000000000043020000000000006A020000000000009B02000000000000CA02000000000000FB020000000000002A0300000000000059030000000000009403000000000000CD0300000000000006040000000000003F040000000000006E040000000000009B04000000000000C804000000000000F504000000000000260500000000000055050000000000008405000000000000B705000000000000E80500000000000019060000000000004A060000000000007F06000000000000B406000000000000E7060000000000001A0700000000000043070000000000006A07000000000000300010000000803F000000000000803F04000001002D0047004100520045004E00410020003100300030004B00300010000000803F000000000000803F04000001002D0047004100520045004E00410020003200300030004B00300010000000803F000000000000803F04000001002B0047004100520045004E0041002000320030004B00300010000000803F000000000000803F04000001002B0047004100520045004E0041002000330030004B00300010000000803F000000000000803F04000001002B0047004100520045004E0041002000350030004B00300010000000803F000000000000803F04000001002900470041005400450020003100300030004B00300010000000803F0000803F0000803F0400000100270047004100540045002000330030004B00300010000000803F000000000000803F0400000100270047004100540045002000350030004B00300010000000803F000000000000803F040000010031004D006F006200690066006F006E00650020003100300030004B00300010000000803F000000000000803F04000001002F004D006F006200690066006F006E0065002000310030004B00300010000000803F000000000000803F040000010031004D006F006200690066006F006E00650020003200300030004B00300010000000803F000000000000803F04000001002F004D006F006200690066006F006E0065002000320030004B00300010000000803F000000000000803F04000001002F004D006F006200690066006F006E0065002000350030004B00300010000000803F000000000000803F04000001003B0056006900650074004E0061006D004D006F00420069006C00650020003100300030004B00300010000000803F000000000000803F0400000100390056006900650074004E0061006D004D006F00420069006C0065002000310030004B00300010000000803F000000000000803F0400000100390056006900650074004E0061006D004D006F00420069006C0065002000320030004B00300010000000803F000000000000803F0400000100390056006900650074004E0061006D004D006F00420069006C0065002000350030004B00300010000000803F000000000000803F04000001002F005600690065007400740065006C0020003100300030004B00300010000000803F000000000000803F04000001002D005600690065007400740065006C002000310030004B00300010000000803F000000000000803F04000001002D005600690065007400740065006C002000320030004B00300010000000803F000000000000803F04000001002D005600690065007400740065006C002000350030004B00300010000000803F000000000000803F04000001003100560049004E004100470041004D00450020003100300030004B00300010000000803F000000000000803F04000001002F00560049004E004100470041004D0045002000320030004B00300010000000803F000000000000803F04000001002F00560049004E004100470041004D0045002000350030004B00300010000000803F000000000000803F04000001003300560069006E006100700068006F006E00650020003100300030004B00300010000000803F000000000000803F04000001003100560069006E006100700068006F006E0065002000310030004B00300010000000803F000000000000803F04000001003100560069006E006100700068006F006E0065002000320030004B00300010000000803F000000000000803F04000001003100560069006E006100700068006F006E0065002000350030004B00300010000000803F000000000000803F0400000100350056005400430020004F004E004C0049004E00450020003100300030004B00300010000000803F000000000000803F0400000100350056005400430020004F004E004C0049004E00450020003200300030004B00300010000000803F000000000000803F0400000100330056005400430020004F004E004C0049004E0045002000320030004B00300010000000803F000000000000803F0400000100330056005400430020004F004E004C0049004E0045002000350030004B00300010000000803F000000000000803F040000010029005A0049004E00470020003100300030004B00300010000000803F000000000000803F040000010027005A0049004E0047002000320030004B00300010000000803F000000000000803F040000010027005A0049004E0047002000350030004B00FF01000000000000000B0000000B000000280000002800000000000000000000006300000047004100520045004E00410020003100300030004B00350030004B00540045002000330030004B004D006F006200690066006F006E0065002000310030004B0056006900650074004E0061006D004D006F00420069006C00650020003100300030004B00740065006C002000320030004B004E004100470041004D0045002000320030004B00700068006F006E0065002000320030004B005400430020004F004E004C0049004E00450020003200300030004B005A0049004E00470020003100300030004B00130000004000000000C002000000C005020000810407000001030B000001060E0000810C140000C001200000C001210000C002220000C00A24000081042E000001030B00000107320000400239000081083B00000109430000010E4C000001095A00000024000000000000000000000000000000
GO
/****** Object:  Statistic [_WA_Sys_00000003_37A5467C]    Script Date: 24/5/2022 1:07:17 AM ******/
CREATE STATISTICS [_WA_Sys_00000003_37A5467C] ON [dbo].[TheCard]([CategoryName]) WITH STATS_STREAM = 0x01000000010000000000000000000000E979AD040000000090020000000000005002000000000000E7020000E7000000780000000000000008D000346900660007000000FDB511009FAE000024000000000000002400000000000000000000000000003F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000200000001000000100000005555AD4100001042000000005555AD410000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000130400000000000000000000000000006A00000000000000CC00000000000000D400000000000000DC00000000000000100000000000000043000000000000003000100000008841000000000000803F0400000100330054006800BB1E200010016900C71E6E002000540068006F00A11E69003000100000009841000000000000803F0400000100270054006800BB1E2000470061006D006500FF01000000000000000B00000002000000280000002800000000000000000000001200000054006800BB1E200010016900C71E6E002000540068006F00A11E6900470061006D0065000400000040000000004004000000850A04000006040E00000024000000000000000000000000000000
GO
/****** Object:  Statistic [PK__TheCard__55FECD8E7246C322]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[TheCard]([PK__TheCard__55FECD8E7246C322]) WITH STATS_STREAM = 0x01000000010000000000000000000000D87325F90000000040000000000000000000000000000000380300023800000004000A00000000000000000000000012, ROWCOUNT = 36, PAGECOUNT = 1
GO
/****** Object:  Statistic [PK__TheUser__C9F284573AB56A79]    Script Date: 24/5/2022 1:07:17 AM ******/
UPDATE STATISTICS [dbo].[TheUser]([PK__TheUser__C9F284573AB56A79]) WITH STATS_STREAM = 0x01000000010000000000000000000000318F9A4A0000000040000000000000000000000000000000E7030002E7000000780000000000000008D0003400000012, ROWCOUNT = 3, PAGECOUNT = 1
GO
USE [master]
GO
ALTER DATABASE [QuanLyPhongNet] SET  READ_WRITE 
GO
