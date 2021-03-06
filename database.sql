USE [master]
GO
/****** Object:  Database [QuanLyWebsiteNgheNhac]    Script Date: 22-May-19 8:21:37 AM ******/
CREATE DATABASE [QuanLyWebsiteNgheNhac]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyWebsiteNgheNhac', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QuanLyWebsiteNgheNhac.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyWebsiteNgheNhac_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QuanLyWebsiteNgheNhac_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyWebsiteNgheNhac].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyWebsiteNgheNhac', N'ON'
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET QUERY_STORE = OFF
GO
USE [QuanLyWebsiteNgheNhac]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [QuanLyWebsiteNgheNhac]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[Views] [int] NULL,
	[Likes] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Follows] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[Background] [nvarchar](50) NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist_Album]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist_Album](
	[Artist] [int] NOT NULL,
	[Album] [int] NOT NULL,
 CONSTRAINT [PK_Artist_Album] PRIMARY KEY CLUSTERED 
(
	[Artist] ASC,
	[Album] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist_User]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist_User](
	[Artist] [int] NOT NULL,
	[User] [varchar](50) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Artist_User] PRIMARY KEY CLUSTERED 
(
	[Artist] ASC,
	[User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteSong]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteSong](
	[Song] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FavoriteSong] PRIMARY KEY CLUSTERED 
(
	[Song] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowArtist]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowArtist](
	[Username] [varchar](50) NOT NULL,
	[Artist] [int] NOT NULL,
 CONSTRAINT [PK_FollowArtist] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Artist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeAlbum]    Script Date: 22-May-19 8:21:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeAlbum](
	[Username] [varchar](50) NOT NULL,
	[Album] [int] NOT NULL,
 CONSTRAINT [PK_LikeAlbum] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Album] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeSong]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeSong](
	[Username] [varchar](50) NOT NULL,
	[Song] [int] NOT NULL,
 CONSTRAINT [PK_LikeSong] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Song] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlist]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Views] [int] NULL,
	[Image] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Username] [varchar](50) NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RankForMonth]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RankForMonth](
	[Rank] [int] NOT NULL,
	[Song] [int] NULL,
 CONSTRAINT [PK_RankForMonth] PRIMARY KEY CLUSTERED 
(
	[Rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RankForWeek]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RankForWeek](
	[Rank] [int] NOT NULL,
	[Song] [int] NULL,
 CONSTRAINT [PK_RankForWeek] PRIMARY KEY CLUSTERED 
(
	[Rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Lyrics] [nvarchar](max) NULL,
	[Views] [int] NULL,
	[Likes] [int] NULL,
	[FileName] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[Album] [int] NULL,
	[Composer] [int] NULL,
	[ViewsPerWeek] [int] NULL,
	[ViewsPerMonth] [int] NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song_Artist]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_Artist](
	[Artist] [int] NOT NULL,
	[Song] [int] NOT NULL,
 CONSTRAINT [PK_Song_Artist] PRIMARY KEY CLUSTERED 
(
	[Artist] ASC,
	[Song] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song_Genre]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_Genre](
	[Song] [int] NOT NULL,
	[Genre] [int] NOT NULL,
 CONSTRAINT [PK_Song_Genre] PRIMARY KEY CLUSTERED 
(
	[Song] ASC,
	[Genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song_PlayList]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_PlayList](
	[Song] [int] NOT NULL,
	[PlayList] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Song_PlayList] PRIMARY KEY CLUSTERED 
(
	[Song] ASC,
	[PlayList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[Role] [bit] NULL,
	[Status] [bit] NULL,
	[Phone] [nchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (1, N'Làm Người Yêu Em Nhé Baby', NULL, N'1.jpg', NULL, NULL, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (2, N'Anh Mơ', NULL, N'2.jpg', 0, 0, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (3, N'Trà Đăng Khoa', N'<p>dwdqwd</p>

<p>wqdqwd</p>
', N'20190520194729.jpg', 12, 31, 0)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (4, N'Test', N'<p>asdasd</p>
', N'20190521114129.jpg', 5766, 0, 0)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (5, N'Buồn Của Em', NULL, N'20190520221134.jpg', 0, 0, 0)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (6, N'Tìm Lại Bầu Trời', NULL, N'20190520215101.jpg', NULL, NULL, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (7, N't1', N'<p>sad</p>
', N'20190521133216.jpg', 12, 31, 0)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (8, N'Different World', NULL, N'20190521195423.jpg', 0, 0, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (9, N'Unity', NULL, N'20190521200318.jpg', 0, 0, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (10, N'Yêu Em Từ Cái Nhìn Đầu Tiên (Bản Truyền Hình OST)', N'<p>Y&ecirc;u em từ c&aacute;i nh&igrave;n đầu ti&ecirc;n (t&ecirc;n tiếng Anh: Just One Slight Smile is Very Alluring) l&agrave; bộ phim được chuyển thể từ cuốn tiểu thuyết c&ugrave;ng t&ecirc;n của nh&agrave; văn Cố Mạn v&agrave; do L&acirc;m Ngọc Ph&acirc;n l&agrave;m đạo diễn với sự tham gia của c&aacute;c diễn vi&ecirc;n Dương Dương, Trịnh Sảng, Mao Hiểu Đồng,... Phim được ch&iacute;nh thức khởi quay ng&agrave;y 25 th&aacute;ng 8 năm 2015 v&agrave; đ&oacute;ng m&aacute;y v&agrave;o th&aacute;ng 11 c&ugrave;ng năm. Nội dung phim kể về mối t&igrave;nh l&atilde;ng mạn từ trong game đến đời thực của Ti&ecirc;u Nại v&agrave; c&ocirc; n&agrave;ng Bối Vy Vy.</p>
', N'20190521201503.jpg', 0, 0, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (11, N'One Piece Memorial Best CD1', NULL, N'20190521203010.jpg', 0, 0, 0)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (12, N'Something Just Like This (Remix Pack) (EP)', NULL, N'20190521204108.jpg', 0, 0, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (13, N'Vân Tịch Truyện OST', NULL, N'20190521205143.jpg', 0, 0, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (14, N'Your Name', NULL, N'20190521211541.jpg', 13962, 1382, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (15, N'Black Pink', NULL, N'20190521212936.jpg', 5310288, 182571, 1)
INSERT [dbo].[Album] ([ID], [Name], [Description], [Image], [Views], [Likes], [Status]) VALUES (16, N'EXO', NULL, N'20190521213243.jpg', 5134672, 564813, 1)
SET IDENTITY_INSERT [dbo].[Album] OFF
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1, N'Jack', 320, N'Jack', N'Jack.jpg', 1, N'1.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2, N'Thanh Hưng', 824, N'ThanhHung', N'ThanhHung.jpg', 1, N'2.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1002, N'Huỳnh Ái Vy', 2770, N'HuynhAiVy', N'HuynhAiVy.jpg', 1, N'1002.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1003, N'Minh Vương M4U', 1415, N'MinhVuongM4U', N'MinhVuongM4U.jpg', 1, N'1003.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1004, N'ERIK', 53, N'ERIK', N'ERIK.jpg', 1, N'1004.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1005, N'Dương Hoàng Yến', 1210, N'DuongHoangYen', N'DuongHoangYen.jpg', 1, N'1005.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1006, N'Hòa Minzy', 629, N'HoaMinzy', N'HoaMinzy.jpg', 1, N'1006.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1007, N'Nguyễn Trung Quân', 2937, N'NguyenTrungQuan', N'NguyenTrungQuan.jpg', 1, N'1007.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1008, N'Châu Khải Phong', 106, N'ChauKhaiPhong', N'ChauKhaiPhong.jpg', 1, N'1008.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1009, N'Khang Việt', 2720, N'KhangViet', N'KhangViet.jpg', 1, N'1009.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1010, N'Nhật Tinh Anh', 2368, N'NhatTinhAnh', N'NhatTinhAnh.jpg', 1, N'1010.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1011, N'Phan Duy Anh', 975, N'PhanDuyAnh', N'PhanDuyAnh.jpg', 1, N'1011.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1012, N'Hoaprox', 2367, N'Hoaprox', N'Hoaprox.jpg', 1, N'1012.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1013, N'K-ICM', 401, N'K-ICM', N'K-ICM.jpg', 1, N'1013.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1014, N'Hương Giang', 1242, N'HuongGiang', N'HuongGiang.jpg', 1, N'1014.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1015, N'Xesi', 2971, N'Xesi', N'Xesi.jpg', 1, N'1015.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1016, N'JustaTee', 1847, N'JustaTee', N'JustaTee.jpg', 1, N'1016.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1017, N'Lê Bảo Bình', 454, N'LeBaoBinh', N'LeBaoBinh.jpg', 1, N'1017.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1018, N'Mr Siro', 769, N'MrSiro', N'MrSiro.jpg', 1, N'1018.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1019, N'Hiền Hồ', 182, N'HienHo', N'HienHo.jpg', 1, N'1019.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1020, N'Hương Tràm', 376, N'HuongTram', N'HuongTram.jpg', 1, N'1020.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1021, N'Cao Nam Thành', 2152, N'CaoNamThanh', N'CaoNamThanh.jpg', 1, N'1021.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1022, N'Wendy Thảo', 1177, N'WendyThao', N'WendyThao.jpg', 1, N'1022.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1023, N'Lou Hoàng', 1929, N'LouHoang', N'LouHoang.jpg', 1, N'1023.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1024, N'Phương Ly', 531, N'PhuongLy', N'PhuongLy.jpg', 1, N'1024.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1025, N'JayKii', 1553, N'JayKii', N'JayKii.jpg', 1, N'1025.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1026, N'Sara Luu', 2313, N'SaraLuu', N'SaraLuu.jpg', 1, N'1026.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1027, N'Đạt G', 1575, N'DatG', N'DatG.jpg', 1, N'1027.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1028, N'Trịnh Tuấn Vỹ', 258, N'TrinhTuanVy', N'TrinhTuanVy.jpg', 1, N'1028.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1029, N'Hoa Vinh', 1863, N'HoaVinh', N'HoaVinh.jpg', 1, N'1029.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1030, N'Thịnh Suy', 2199, N'ThinhSuy', N'ThinhSuy.jpg', 1, N'1030.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1031, N'Đinh Đại Vũ', 546, N'DinhDaiVu', N'DinhDaiVu.jpg', 1, N'1031.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1032, N'LyLy', 2458, N'LyLy', N'LyLy.jpg', 1, N'1032.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1033, N'Nguyễn Trọng Tài', 1503, N'NguyenTrongTai', N'NguyenTrongTai.jpg', 1, N'1033.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1034, N'Hồ Gia Hùng', 1546, N'HoGiaHung', N'HoGiaHung.jpg', 1, N'1034.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1035, N'Saka Trương Tuyền', 2799, N'SakaTruongTuyen', N'SakaTruongTuyen.jpg', 1, N'1035.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (1036, N'Hồ Việt Trung', 46, N'HoVietTrung', N'HoVietTrung.jpg', 1, N'1036.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2035, N'DC Tâm', 2602, N'DCTam', N'DCTam.jpg', 1, N'2035.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2036, N'Huy Cung', 1568, N'HuyCung', N'HuyCung.jpg', 1, N'2036.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2037, N'Hoàng Bảo Nam', 1088, N'HoangBaoNam', N'HoangBaoNam.jpg', 1, N'2037.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2038, N'Andiez', 725, N'Andiez', N'Andiez.jpg', 1, N'2038.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2039, N'Khắc Việt', 767, N'KhacViet', N'KhacViet.jpg', 1, N'2039.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2040, N'Đinh Tùng Huy', 854, N'DinhTungHuy', N'DinhTungHuy.jpg', 1, N'2040.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2041, N'Tanzui', 2379, N'Tanzui', N'Tanzui.jpg', 1, N'2041.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2042, N'Nguyên Jenda', 832, N'NguyenJenda', NULL, 1, N'2042.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2043, N'Anh Khang', 2135, N'AnhKhang', N'AnhKhang.jpg', 1, N'2043.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2044, N'Min', 1274, N'MIN', N'MIN.jpg', 1, N'2044.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2046, N'AMEE', 832, N'<p>AMEE</p>

<p>Tên thật:&nbsp;Trần Huyền My</p>

<p>Quốc gia:&nbsp;Việt Nam</p>

<p>Ngày sinh:&nbsp;23/03/2000</p>
', N'20190521110349image.jpg', 1, N'20190521110349background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2047, N'Tuấn Hưng', 1283, N'<p>Tuấn Hưng</p>

<p>Tên thật:&nbsp;Nguyễn Tuấn Hưng</p>

<p>Quốc gia:&nbsp;Việt Nam</p>

<p>Ngày sinh:&nbsp;05/10/1978</p>

<p>Tuấn Hưng sinh ngày 05/10/1978 sinh ra và lớn lên tại Hà Nội, nay lập nghiệp ở Sài Gòn, với Tuấn Hưng, Hà Nội mãi mãi vẫn đẹp, nên thơ và cổ kính.&nbsp;<br />
<br />
Năm Hưng học lớp 11 (1995), nhà trường tổ chức liên hoan văn nghệ mừng ngày Nhà giáo Việt Nam, Hưng đã tham gia chương trình với bài &quot;Hãy hàn gắn thế giới&quot;. Giọng Tuấn Hưng được giới âm nhạc phát hiện từ dịp đó. Và cũng từ đó, trong Hưng âm ỉ một khát khao được gắn bó với âm nhạc.&nbsp;<br />
<br />
Đang học năm III Đại học dân lập Thăng Long (khoa Quản trị kinh doanh), Hưng quyết định chọn con đường ca hát cùng nhóm Quả Dưa Hấu mặc dù gặp không ít lời phản đối từ gia đình, bạn bè.&nbsp;<br />
<br />
Ba chàng trai Bằng Kiều, Anh Tú, Tuấn Hưng đã trở nên khá quen thuộc với người dân Hà Nội, sức mạnh của âm nhạc cứ thế đã&nbsp;<br />
cuốn hút Hưng. Tháng 2/2000, Hưng quyết định vào Sài Gòn để lập nghiệp, rời mái ấm gia đình và xa cả một tình yêu Hà Nội của riêng mình. Trước mắt anh là một con đường còn rất xa mà anh phải dấn chân với bao hoài bão.&nbsp;<br />
<br />
Thời gian đầu khá khó khăn với Tuấn Hưng. Tất cả mọi thứ đều mới mẻ kể cả phong cách làm việc của người dân Thành phố, nhịp sống Sài Gòn mà anh cần phải theo để bắt kịp. Dấu ấn đầu tiên để lại trong anh là lần biểu diễn chương trình CLB Bạn yêu nhạc tại Nhà hát Bến Thành đúng ngày sinh nhật của mình. Ngập tràn những lời chúc mừng, hoa và nến&nbsp;<br />
<br />
Tuấn Hưng lặng cả người trước những tình cảm của các fan hâm mộ dành cho mình, để rồi đêm về không ngủ được khi nhận ra rằng hình như hạnh phúc luôn được bắt nguồn từ những điều giản dị nhất. Không đặt cho mình những chỉ tiêu, những hảo vọng, Hưng chỉ biết làm việc hết sức mình vì Hưng tin vào câu thành ngữ Bạn hiến dâng cuộc đời bằng những gì thì cuộc đời sẽ trả lại cho bạn thứ ấy.&nbsp;<br />
<br />
Hầu như các phòng trà, tụ điểm ca nhạc đều có tiếng hát Tuấn Hưng. &ldquo;Vũ điệu thần tiên (Minh Châu), Mưa (Tuấn Nghĩa) là hai ca khúc gắn liền tên tuổi Tuấn Hưng rất được các bạn trẻ yêu thích.&nbsp;<br />
Thật bất ngờ khi Hưng được đạo diễn Hồng Vân mời đóng vai Xuân Tóc đỏ (thay Bằng Kiều) trong vở kịch Số đỏ. Với suy nghĩ đây là một loại hình mới cần khám phá để chinh phục chính bản thân mình nên Hưng đã nhận lời như một cuộc dạo chơi vô tư không hề toan tính. Chính cái lối diễn &ldquo;tỉnh ấy&rdquo; đã nhận không ít lời khen ngợi, còn với Hưng tuy cực mà vui.&nbsp;<br />
<br />
Với chất giọng trầm, Tuấn Hưng thường thể hiện các ca khúc về tình yêu với nhiều nốt cao, tuy nhiên, thỉnh thoảng anh cũng thể hiện các ca khúc sôi động Dance, house hoặc electro.&nbsp;<br />
<br />
Trong thời gian đầu, Tuấn Hưng cũng hay thể hiện các ca khúc nhạc Hoa phổ lời Việt nổi tiếng. Tuy nhiên, về sau anh chuyên tâm thể hiện các ca khúc của nhạc sĩ Việt hơn, phong cách âm nhạc và hát của anh cũng trở nên đa dạng và phong phú hơn. Ngoài ra, Tuấn Hưng cũng từng viết nhiều ca khúc.&nbsp;<br />
<br />
Cho đến nay, Tuấn Hưng trở thành 1 cái tên hot trong thị trường âm nhạc Việt Nam và được vào trong top Làn Sóng Xanh trong nhiều năm qua. Khán giả quen thuộc với nhiều bài hit gắn liền với tên tuổi Tuấn Hưng: Vũ Điệu Thần Tiên, Tình Yêu Lung Linh, Đêm Định Mệnh, Tình Yêu Đâu Phải Trò Chơi, Vẫn Nhớ, Dĩ Vãng Cuộc Tình, Cầu Vồng Khuyết.&nbsp;<br />
<br />
Đã phát hành được 7 CD riêng với nhiều phong cách, thể loại khác nhau như trẻ, trữ tình, rock và cả dance.&nbsp;<br />
<br />
Tuấn Hưng đã kết hôn cùng Hương Baby tại Hà Nội vào ngày 05/04/2014.&nbsp;<br />
<br />
Năm 2015, Tuấn Hưng, cùng với Đàm Vĩnh Hưng, Mỹ Tâm và Thu Phương đảm nhiệm vị trí giám khảo của chương trình Giọng hát Việt mùa thứ 3.&nbsp;<br />
<br />
Các album đã phát hành:&nbsp;<br />
Vũ điệu thần tiên (2001)&nbsp;<br />
Tình yêu lung linh (2002)&nbsp;<br />
Vườn tình nhân - với Ngô Thanh Vân (2002)&nbsp;<br />
Đốt chút lá khô (2003)&nbsp;<br />
Tình yêu hát (2004)&nbsp;<br />
Vẫn nhớ 2 (2005)&nbsp;<br />
Đêm định mệnh (2006)&nbsp;<br />
Dance (2007)&nbsp;<br />
Tình là gì (2008)&nbsp;<br />
Như giấc chiêm bao - với Lệ Quyên (2008)&nbsp;<br />
Nhạc...xưa (2009)&nbsp;<br />
Tuấn Hưng vol. 8 (2010)&nbsp;<br />
Tình yêu phôi pha (2010)&nbsp;<br />
Anh sẽ vui...Nếu (2011)&nbsp;<br />
Tìm lại bầu trời (2012)&nbsp;<br />
Ảo giác - Anh nhớ em (2013)&nbsp;<br />
Đam mê - remixes (2014)&nbsp;<br />
Tha thứ lỗi lầm (2015)&nbsp;<br />
Điều quý giá nhất (2016)</p>
', N'20190521114549image.jpg', 1, N'20190521114549background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2048, N'test', 484, N'<p>123</p>
', N'20190521133401image.jpg', 0, N'20190521133401background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2049, N'Liam', 31, N'<p>Liam</p>

<p>Tên thật:&nbsp;Liam</p>

<p>Quốc gia:&nbsp;Việt Nam</p>

<p>Ngày sinh:&nbsp;1995</p>

<p>DJ, Producer giấu mặt Liam là nghệ sĩ giấu mặt. Anh theo đuổi dòng nhạc điện tử. Được Biets anh là người Việt nhưng ở Hà Lan từ nhỏ, trong những tác phẩm âm nhạc gần đây anh đều chỉ xuất hiện với chiếc mặt nạ cá tính. Anh thực sự vẫn còn là ẩn số.</p>
', N'20190521133802image.jpg', 1, N'20190521133802background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2050, N'Lê Quang', 1550, N'<p>Lê Quang</p>

<p>Tên thật:&nbsp;Lê Quang</p>

<p>Quốc gia:&nbsp;Việt Nam</p>

<p>Ngày sinh:&nbsp;1969</p>

<p>&nbsp;</p>

<p>Anh nổi tiếng với những ca khúc được giới trẻ yêu thích<br />
như &quot;Đi về nơi xa&quot;, &quot;Mùa hạ mãi xa&quot;, &quot;Mưa trên cuộc tình&quot;... đồng thời<br />
là cây guitar bass khá nổi tiếng của ban nhạc Da vàng.</p>

<p>&nbsp;</p>

<p>Một điều khá thú vị là vợ anh &ndash; Cam Thơ chính là ca sĩ đoạt giải nhất Tiếng hát truyền hình năm 1991.</p>

<p>&nbsp;&nbsp;</p>
', N'20190521134540image.jpg', 1, N'20190521134540background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2051, N'Hakoota Dũng Hà', 32, N'<p>Hakoota Dũng Hà</p>

<p>Tên thật:&nbsp;Phạm Dũng Hà</p>

<p>Quốc gia:&nbsp;Việt Nam</p>

<p>Ngày sinh:&nbsp;18/03/1981</p>

<p>Hakoota Dũng Hà tên thật là Phạm Dũng Hà, là nam ca sĩ người Việt Nam. Anh được công chúng biết đến nhiều nhất khi tham gia chương trình Giọng hát Việt năm 2013.&nbsp;<br />
<br />
Hakoota Dũng Hà từng theo học chuyên ngành Fashion Design tại học viện T.A.F.E Australia. Anh tham gia cuộc thi Vietnam Collection Grand Prix 2001 và đã giành được giải thưởng của chương trình. Bộ sưu tập của Hakoota Dũng Hà tạiV ietnam Collection Grand Prix đã được một nhà sản xuất phim mua lại. Từ năm 2000, Dũng Hà làm việc tại phong thu với vai trò ca sĩ hát bè cho nhiều ca sĩ. Năm 2013, Dũng Hà quyết định nộp đơn đăng ký tham gia cuộc thi Giọng Hát Việt và may mắn đã trở thành thành viên của team huấn luyện viên Đàm Vĩnh Hưng. Các tiết mục dự thi của Dũng Hà trong Giọng Hát Việt đều nhận được lời khen từ phía huấn luyện viên, đặc biệt anh đã được nghệ sĩ người Pháp Irma dành tặng những lời khen có cánh trên trang cá nhân của nghệ sĩ này, sau khi anh được nghe Dũng Hà thể hiện ca khúc &quot;I Know&quot;.&nbsp;<br />
Sau The Voice, Hakoota Dũng Hà còn tham gia chương trình truyền hình &quot;Bếp hát&quot; - phiên bản Việt lấy ý tưởng từ bộ phim &quot;The Kitchen Musical &quot;. Trong đó, Dũng Hà vào vai Hà Nam, một anh chàng bartender tốt bụng và vui tính.&nbsp;<br />
<br />
Xuất thân từ học viện T.A.F.E Australia (chuyên ngành Fashion Design) và từng giành giải thưởng New Impression tại cuộc thi Vietnam Collection Grand Prix 2001. Bộ sưu tập này đã được mua lại và sử dụng bởi một nhà sản xuất phim khoa học viễn tưởng nước ngoài. Anh cũng may mắn có cơ hội được học việc cho một trong những thương hiệu sản xuất đồ trang trí nội thất nổi tiếng của Anh là Habitat.&nbsp;<br />
<br />
Trước khi chính thức bắt đầu với sự nghiệp ca hát, anh đã làm việc tại phòng thu với vị trí là ca sĩ hát bè cho khá nhiều các ca sĩ từ năm 2000 (Điển hình là Hiền Thục với bản hít Dẫu Có Lỗi Lầm phiên bản RnB).&nbsp;<br />
<br />
Năm 2013, anh quyết định tham gia chương trình Giọng Hát Việt trong đội hình của HLV Đàm Vĩnh Hưng. Anh đã để lại ấn tượng cho khán giả qua các phần trình diễn mang đậm màu sắc cá nhân của mình. Và đặc biệt, anh đã nhận được lời khen ngợi trên trang cá nhân của chính nghệ sĩ người Pháp Irma khi trình diễn lại ca khúc I Know thành công trong cuộc thi.&nbsp;<br />
<br />
Ngoài ra, anh còn tham gia trong serie phim truyền hình Bếp Hát &ndash; một phiên bản Việt từ bộ phim nổi tiếng The Kitchen Musical trong vai Hà Nam &ndash;anh chàng bartender vui tính, tốt bụng nhưng có chút nhiều chuyện.&nbsp;<br />
<br />
Được biết anh còn từng đảm nhiệm công việc stylist cho một kênh truyền hình chuyên về kinh doanh các mặt hàng đa dụng và còn là một Host MC năng nổ của đài phát thanh Xone FM : chuyện mục MRS, Hot10@10, VN10&nbsp;<br />
<br />
2014: Anh cho ra mắt sản phẩm âm nhạc đầu tiên của mình sau Giọng Hát Việt, single online mang tên Giọt Buồn Để Lại, ca khúc do nhạc sĩ Dương Khắc Linh.&nbsp;<br />
<br />
2015: Khoảng Cách Chia Đôi là tên gọi của single online thứ hai trong sự nghiệp của Hakoota Dũng Hà. Ca khúc do Hoàng Huy Long sáng tác. Hakoota Dũng Hà còn thể hiện ca khúc này bằng một phiên bản tiếng Anh.&nbsp;<br />
<br />
Ngoài ra, Hakoota Dũng Hà còn từng làm stylist cho một kênh truyền hình, và là một MC chính của Xone FM : chuyện mục MRS, Hot10@10, VN10&hellip; Năm 2014, Hakoota Dũng Hà đã cho ra mắt sản phẩm âm nhạc đầu tiên của mình, đó là single online có tựa đề &quot;Giọt Buồn Để Lại&quot; của nhạc sĩ Dương Khắc Linh. Năm 2015, anh cho ra mắt single online thứ hai mang tên &quot; Khoảng cách chia đôi&quot;. Ca khúc này được Hakoota Dũng Hà thể hiện bằng tiếng Anh. Ngày 05/11/2015, Hakoota Dũng Hà phát hành album đầu tay của mình mang tên &quot;Ngày mai chuyện đã khác&quot;.&nbsp;<br />
<br />
Bên cạnh &ldquo;Giọt buồn để lại&rdquo;, single còn có thêm 2 ca khúc nhạc Hàn Quốc là &ldquo;Say lah lah bah&rdquo; (cover của nhóm Hug &amp; Kiss) và &ldquo;Mất Trí&rdquo; (cover của Kim Bo Hyung) được Dũng Hà lựa chọn kĩ càng để phù hợp với chất giọng và &ldquo;màu&rdquo; chung của toàn bộ single.&nbsp;<br />
<br />
Các album đã phát hành:</p>
', N'20190521135132image.jpg', 1, N'20190521135132background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2052, N'Tăng Nhật Tuệ', 2904, N'<p>Tăng Nhật Tuệ</p>

<p>Tên thật:&nbsp;Tăng Duy Linh</p>

<p>Quốc gia:&nbsp;Việt Nam</p>

<p>Ngày sinh:&nbsp;24/12/1987</p>

<p>Tăng Nhật Tuệ (sinh ngày 24/12/1987) là một nam ca sĩ, nhạc sĩ kiêm diễn viên Việt Nam.&nbsp;<br />
<br />
Tiểu sử&nbsp;<br />
<br />
Tăng Nhật Tuệ tên thật là Tăng Duy Linh, sinh ngày 24 tháng 12 năm 1987, nguyên quán huyện Đông Anh, Hà Nội. Từ khi còn nhỏ, anh đã theo học múa ba lê, học hát và nhiều sinh hoạt khác tại Cung Văn hóa Thiếu nhi Hà Nội. Năm 2003, anh đỗ vào Trường Cao đẳng Văn hóa Nghệ thuật Hà Nội, khoa thanh nhạc .&nbsp;<br />
<br />
Tăng Nhật Tuệ là một người vô duyên với các cuộc thi. Năm 2006, anh từng tham gia dự thi Sao Mai điểm hẹn nhưng không lọt vào vòng chung kết. Đối với anh, đây là thất bại lớn nhất trong đời .&nbsp;</p>
', N'20190521135343image.jpg', 1, N'20190521135343background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2053, N'Sơn Tùng M-TP', 727, N'<p>Sơn Tùng M-TP</p>

<p>Tên thật:&nbsp;Nguyễn Thanh Tùng</p>

<p>Quốc gia:&nbsp;Việt Nam</p>

<p>Ngày sinh:&nbsp;05/07/1994</p>

<p>M-TP tên thật là Nguyễn Thanh Tùng. Cậu thanh niên sinh năm 1994 ở Thái Bình sớm bị hip hop hớp hồn giống như bao bạn bè đồng trang lứa. Và với niềm đam mê này, M-TP quyết tâm khăn gói tới Hà Nội học hỏi thêm về hip hop. Sau khi tốt nghiệp cấp 3, anh chàng dự định sẽ đầu quân làm học viên tại Học viện M4Me để rèn rũa khả năng ca hát, sáng tác... trước khi chính thức theo đuổi con đường âm nhạc.&nbsp;<br />
<br />
Ngoài đam mê ca hát, M-TP còn có khả năng sáng tác, chơi piano và nhảy cực &quot;đỉnh&quot;. Với thế mạnh này, anh chàng không ngừng cố gắng học tập các bậc đàn anh đàn chị và đã có trong tay một hành trang khá &quot;khủng&quot; những sáng tác của riêng mình.&nbsp;<br />
<br />
Sự nghiệp âm nhạc:&nbsp;<br />
<br />
Tháng 8/2011: M-TP phát hành ca khúc &quot;Cơn Mưa Ngang Qua&quot; lên mạng, ngay lập tức nó trở thành một ca khúc hot lúc bấy giờ khi mà chỉ sau hai tháng, đã có hơn 1.7 triệu lượt nghe - con số mà những ca sĩ kỳ cựu như Đàm Vĩnh Hưng, Hồ Ngọc Hà... cũng phải mơ ước.&nbsp;<br />
<br />
Năm 2012, với tổng điểm 25,5đ, M-TP trở thành thủ khoa Nhạc viện TP.HCM. Cậu chia sẻ rằng &quot;chia sẻ cảm xúc: &quot;Mặc dù khá tự tin sau khi kết thúc buổi thi nhưng mình vẫn không khỏi ngạc nhiên và hạnh phúc khi biết được kết quả thi. Đây thực sự là một món quà vô cùng ý nghĩa để bù đắp cho những nỗ lực của mình trong suốt thời gian ôn luyện vừa qua&quot;&nbsp;<br />
<br />
Để lại nhiều ấn tượng trong lòng khán giả khi M-TP trình diễn thành công ca khúc &quot;Cơn Mưa Ngang Qua&quot; tại Bài Hát Yêu Thích tháng 10/2012 và tiếp tục nhận giải thưởng hát hát yêu thích của tháng trong chương trình là động lực rất lớn cho M-TP tiếp tục phấn đấu trong con đường âm nhạc chuyên nghiệp. Sau Bài Hát Yêu Thích, M-TP còn được mời tham gia biểu diễn trong đêm công bố kết quả Top 9 Vietnam Idol 2012.&nbsp;<br />
<br />
Tại Zing Mp3, &quot;Cơn Mưa Ngang Qua&quot; như là cút hít đầu tiên của cậu ca sĩ trẻ M-TP bước vào làng nhạc trẻ. Tính đến tháng 11/2014, ca khúc đạt được 64,278,735 lượt nghe.&nbsp;<br />
<br />
Năm 2013, anh đầu quân về công ty Văn Production JSC của nhạc sĩ Huy Tuấn và chính thức đổi nghệ danh thành Sơn Tùng M-TP để hoạt động âm nhạc chuyên nghiệp. Vào giữa năm, Sơn Tùng phát hành 2 đĩa đơn &quot;Đừng Về Trễ&quot; và &quot;Em Của Ngày Hôm Qua&quot; trong đó &quot;Đừng Về Trễ&quot; đoạt giải Bài hát yêu thích&nbsp;<br />
<br />
Với &quot;Em Của Ngày Hôm Qua&quot;, ca khúc này đã trở thành một bài hit lớn trong sự nghiệp của Sơn Tùng M-TP khi ca khúc này liên tiếp chiếm giữ vị trí số 1 tại bảng xếp hạng của Zing Mp3 ở cả hai hạng mục là Bài hát và Video clip. 08/09/2014, MV &quot;Em Của Ngày Hôm Qua&quot; chính thức đạt hơn 40 triệu lượt xem trên Youtube trong vòng 9 tháng. Đây là một con số kỷ lục đối với MV nhạc Việt tình cho thời điểm bấy giờ. Dù gặp phải rất nhiều ý kiến xung quanh việc đạo nhạc nhưng không thể phủ nhận sức nóng của những ca khúc mà Sơn Tùng biểu diễn kể từ &quot;Nắng Ấm Xa Dần&quot;, &quot;Cơn Mưa Ngang Qua&quot;&nbsp;<br />
<br />
Vào đầu năm 2014, anh hợp tác với Phương Thanh, Quang Dũng, Vy Oanh, Ngô Kiến Huy, Ông Cao Thắng, Đông Nhi, Hồ Trung Dũng, Phương Vy và Đinh Hương, tất cả cùng nhau có mặt trong ca khúc mang tên &quot;Sống Như Những Đóa Hoa&quot; và cũng được phát hành làm đĩa đơn.&nbsp;<br />
<br />
Cùng trong năm 2014, Sơn Tùng M-TP đảm nhận vai nam chính trong bộ phim nhựa &quot;Chàng Trai Năm Ấy&quot; của đạo diễn Quang Huy. Việc anh hóa thân vào ca sĩ Wanbi Tuấn Anh trên màn ảnh rộng đã thu hút được rất nhiều sự quan tâm từ truyền thông và người hâm mộ.&nbsp;<br />
<br />
Ngày 23/10/2014, ca khúc trích trong bộ phim &quot;Chàng Trai Năm Ấy&quot; do Sơn Tùng M-TP sáng tác và thể hiện mang tên &quot;Chắc Ai Đó Sẽ Về&quot; ra mắt đầu tiên tại Zing Mp3, từ hiện tượng &quot;Em Của Ngày Hôm Qua&quot; ca khúc này lập tức trở thành bài hit khác của Sơn Tùng, chỉ trong vòng 24 giờ ra mắt &quot;Chắc Ai Đó Sẽ Về&quot; đã đạt được gần 5 triệu lượt nghe.&nbsp;<br />
<br />
Tuy nhiên, cũng như &quot;Em Của Ngày Hôm Qua&quot; khi ra mắt, ca khúc này dính ngay nghi án đạo nhạc từ một ca khúc khác của Hàn Quốc mang tên &quot;Because I Miss You&quot; do trưởng nhóm CN Blue, Jung Yong Hwa trình bày, ca khúc này trích trong bộ truyền hình tại Hàn Quốc mang tên &quot;Heartstrings&quot;. Vấn đề đạo nhạc của ca khúc &quot;Chắc Ai Đó Sẽ Về&quot; đã trở thành đề tài tranh luận gay gắt trên các phương tiện truyền thông, nhiều nhạc sĩ tên tuổi đã vào cuộc để mổ xẻ, phân tích chuyên môn về hai ca khúc này. Ca khúc &quot;Chắc Ai Đó Sẽ Về&quot; và bộ phim &quot;Chàng Trai Năm Ấy&quot; trở thành tâm điểm của giới truyền thông trong suốt thời gian đấy.&nbsp;<br />
<br />
Sau khi nhận được đơn giải trình từ đạo diễn Nguyễn Quang Huy, Cục Bản quyền đã đề nghị Hội Âm nhạc họp để đánh giá ca khúc này có đạo nhạc hay không. Hội Âm nhạc gồm các nhạc sĩ tên tuổi như Phó Đức Phương, Trương Ngọc Ninh, Võ Thiện Thanh, Đỗ Bảo&hellip; đã có cuộc họp kín vào sáng 10/11/2014 và tất cả đều tán đồng ý kiến ca khúc &quot;Chắc Ai Đó Sẽ Về&quot; là sản phẩm đạo nhạc. Ý kiến trong cuộc họp này được cấu thành văn bản và gửi đến Cục Bản quyền để đề nghị xử lý. Nhạc sĩ Phó Đức Phương bình luận, Sơn Tùng M-TP đã đạo nhạc một cách tinh vi. Còn nhạc sĩ Trương Ngọc Ninh cho biết, ca khúc của Sơn Tùng giống bản gốc tới 80%.&nbsp;<br />
<br />
Với kết quả trên, vô hình chung đã ảnh hưởng đến tiến độ ra mắt của bộ phim &quot;Chàng Trai Năm Ấy&quot;, dự kiến ra rạp vào ngày 14/11/2014. Đạo diễn của bộ phim là Nguyễn Quang Huy quyết định dời ngày công chiếu vì những vấn đề liên quan đến ca khúc &quot;Chắc Ai Đó Sẽ Về&quot;.&nbsp;<br />
<br />
Trong thời cùng gian trên, Sơn Tùng M-TP nhiều lần bị tố tự hủy show diễn, đền hợp đồng biểu diễn.. Cho đến việc lùm xùm hợp đồng với công ty quản lý của mình, cụ thể là Văn Production JSC. Tất cả những sự việc không hay trên ít nhiều đã ảnh hưởng đến sự nghiệp của Sơn Tùng M-TP khi tài năng và sức trẻ đang ở trong giai đoạn bắt đầu phát triển.Đầu năm 2015, Sơn Tùng M-TP tham gia chương trình thực tế The Remix - Hòa âm Ánh sáng. Qua từng đêm thi, anh khẳng định được tài năng và thực lực của bản thân với các tiết mục đầu tư nghiêm túc, những màn trình diễn độc đáo, cùng khả năng sáng tác cực ổn với các ca khúc như &quot;Thái Bình mồ hôi rơi&quot;, &quot;Khuôn mặt đáng thương&quot;, &quot;Cơn mưa ngang qua&quot;...[9]&nbsp;<br />
<br />
Tháng 7 năm 2015, kỷ niệm sinh nhật lần thứ 21 của mình, Sơn Tùng M-TP đã tổ chức một mini-show kết hợp buổi fan-meeting đầu tiên trong sự nghiệp mang tên &ldquo;M-TP and Friends&rdquo;. Chỉ trong vòng 2 tuần sau khi mở bán, 8.000 vé đã được bán hết.Ngày 24 tháng 1 năm 2016, Sơn Tùng M-TP tung ra MV &quot; Một năm mới bình an&quot;.2017: Rời khỏi WePro, thành lập M-TP Entertainment. &quot;Lạc trôi&quot; và &quot;Nơi này có anh&quot;Ngày 22 tháng 8 năm 2017 , Sơn Tùng kết hợp với SlimV ra bản remix mới của &quot;Remember Me&quot;&nbsp;<br />
<br />
Ngày 8 tháng 9 năm 2017 , Sơn Tùng ra mắt Music Video 360 Lạc Trôi do TRIPLE D Remix&nbsp;<br />
<br />
Ngày 30 tháng 9 năm 2017, Sơn Tùng ra mắt tự truyện &quot;Chạm tới giấc mơ&quot;, bán được 10000 bản trong 2 ngày.</p>
', N'20190521140105image.jpg', 1, N'20190521140105background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2055, N'Đường Yên', 277, N'<p>Đường Y&ecirc;n<br />
T&ecirc;n thật: Đường Y&ecirc;n<br />
Quốc gia: Chile<br />
Ng&agrave;y sinh: 6/9/1983</p>
', N'20190521122533image.jpg', 1, N'20190521122533background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2056, N'La Tấn', 1689, NULL, N'20190521101228image.jpg', 1, N'20190521101228background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2057, N'Aki A Kiệt', 1811, NULL, N'20190521101748image.jpg', 1, N'20190521101748background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2058, N'Hoảng Nhi', 1782, NULL, N'20190521101810image.jpg', 1, N'20190521101810background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2059, N'Hoa Chúc', 2995, NULL, N'20190521101839image.jpg', 1, N'20190521101839background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2060, N'Mã Vũ Dương', 2020, NULL, N'20190521102017image.jpg', 1, N'20190521102017background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2061, N'Hà Đồ', 2524, NULL, N'20190521102048image.jpg', 1, N'20190521102048background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2063, N'Hatsune Miku', 2000, NULL, N'20190521102324image.jpg', 1, N'20190521102324background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2064, N'Hoàng Linh', 5, NULL, N'20190521102429image.jpg', 1, N'20190521102429background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2065, N'Từ Mộng Viên', 1764, NULL, N'20190521102602image.jpg', 1, N'20190521102602background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2066, N'Xomu', 2062, NULL, N'20190521102629image.jpg', 1, N'20190521102629background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2067, N'Lý Ngọc Cương', 2048, NULL, N'20190521102658image.jpg', 1, N'20190521102658background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2068, N'Khalid', 2155, N'<p>Khalid<br />
T&ecirc;n thật: Khalid<br />
Quốc gia: United States</p>
', N'20190521113916image.jpg', 1, N'20190521113916background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2069, N'Charlie Puth', 2416, N'<p>Charlie Puth<br />
T&ecirc;n thật: Charles Otto Puth Jr.<br />
Quốc gia: United States<br />
Ng&agrave;y sinh: 02/12/1991<br />
Charlie Puth t&ecirc;n thật l&agrave; Charles Otto Puth Jr, sinh ng&agrave;y 2 th&aacute;ng 12 năm 1991 v&agrave; sinh sống tại Rumson New Jersey Hoa Kỳ. Anh l&agrave; một ca sĩ, nhạc sĩ được biết đền khi đồng s&aacute;ng t&aacute;c v&agrave; thể hiện b&agrave;i h&aacute;t &quot;See You Again &quot; c&ugrave;ng với Wiz Khalifa trong bộ phim Furious 7 nhằm tưởng nhớ Pual Walker. B&agrave;i h&aacute;t th&agrave;nh c&ocirc;ng khi đạt thứ hạng cao trong tất cả c&aacute;c bảng xếp hạng tr&ecirc;n thế giới. &quot;See You Again&quot; li&ecirc;n tục đứng đầu bảng xếp hạng tại c&aacute;c quốc gia &Uacute;c, &Aacute;o, Bỉ, Thụy Điển, Canada, Đức trong suốt nhiều tuần liền.</p>
', N'20190521114159image.jpg', 1, N'20190521114159background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2070, N'Imagine Dragon', 2574, N'<p>Imagine Dragons<br />
T&ecirc;n thật: Imagine Dragons<br />
Quốc gia: United States<br />
Ng&agrave;y sinh: 2/6/2008<br />
Imagine Dragons l&agrave; nh&oacute;m nhạc Indie rock của Mỹ đến từ Las Vegas gồm 4 th&agrave;nh vi&ecirc;n với Dan Reynolds h&aacute;t ch&iacute;nh, Wayne Sermon chơi ghi ta, Ben McKee đ&aacute;nh bass v&agrave; Daniel Platzman chơi trống. &Acirc;m nhạc của họ thường được so s&aacute;nh với The Killers v&agrave; Arcade Fire, trong khi giai điệu v&agrave; nội dung trữ t&igrave;nh đ&atilde; thường được m&ocirc; tả l&agrave; t&iacute;ch cực v&agrave; lạc quan. T&ecirc;n nh&oacute;m, Imagine Dragons, được tạo ra từ ph&eacute;p đảo chữ Anagram, nhưng &yacute; nghĩa thật sự của n&oacute; l&agrave; g&igrave; th&igrave; chỉ c&oacute; những th&agrave;nh vi&ecirc;n trong nh&oacute;m mới biết. Sở hữu chất nhạc cuồng nhiệt, đầy cảm x&uacute;c ch&acirc;n thật v&agrave; khiến người kh&aacute;c phải nh&uacute;n nhảy theo, với b&agrave;i hit &ldquo;It&#39;s time&rdquo; (Đến l&uacute;c rồi) đ&atilde; khiến cho nh&oacute;m trở th&agrave;nh hiện tượng &acirc;m nhạc Mỹ cuối năm 2012. Ca kh&uacute;c n&agrave;y cũng định h&igrave;nh phong c&aacute;ch &acirc;m nhạc cho album đầu tay của nh&oacute;m &ldquo;Night Visions&rdquo; v&agrave; được một đề cử trong hạng mục Video Rock xuất sắc nhất của Giải Video &acirc;m nhạc của MTV năm 2012.&nbsp;</p>

<p>Th&aacute;ng 1/2013, kh&aacute;n giả y&ecirc;u nhạc tr&ecirc;n to&agrave;n thế giới đ&atilde; được biết đến Imagine Dragons nhiều hơn khi nh&oacute;m trở th&agrave;nh Nghệ sĩ mới th&aacute;ng 1 - MTV Push của MTV.</p>
', N'20190521114353image.jpg', 1, N'20190521114353background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2071, N'Chainsmokers', 2467, N'<p>The Chainsmokers<br />
T&ecirc;n thật: The Chainsmokers<br />
Quốc gia: United States<br />
Bộ đ&ocirc;i DJ gồm 2 th&agrave;nh vi&ecirc;n, Alex Pall v&agrave; Drew Taggart gặp nhau qua niềm say m&ecirc; &acirc;m nhạc một c&aacute;ch t&igrave;nh cờ. Drew học tại Syracuse University, c&ograve;n Alex học ở New York University. Cả 2 tốt nghiệp đại học m&agrave; kh&ocirc;ng mảy may tới suy nghĩ sẽ trở th&agrave;nh những DJ khuynh đảo thế giới. Trước khi th&agrave;nh lập The Chainsmokers, Drew từng l&agrave;m việc tại một quầy hot dog, c&ograve;n Alex an phận với vị tr&iacute; nh&acirc;n vi&ecirc;n văn ph&ograve;ng.&nbsp;</p>

<p>Khi mới bắt đầu v&agrave;o năm 2012, họ đ&atilde; l&ecirc;n kế hoạch cho một chặng đường d&agrave;i v&agrave; kh&ocirc;ng c&oacute; &yacute; định từ bỏ. Th&agrave;nh c&ocirc;ng đến với The Chainsmokers chỉ 2 năm sau đ&oacute; khi ca kh&uacute;c #Selfie ra đời. C&ugrave;ng với tr&agrave;o lưu chụp ảnh tự sướng ca kh&uacute;c n&agrave;y nhanh ch&oacute;ng b&ugrave;ng nổ tr&ecirc;n c&aacute;c trang mạng, nhận được sự quan t&acirc;m của nhiều bạn trẻ y&ecirc;u &acirc;m nhạc.&nbsp;</p>

<p>2 năm trở lại đ&acirc;y tiếp tục đ&aacute;nh dấu sự b&ugrave;ng nổ của cặp đ&ocirc;i người Mỹ với h&agrave;ng loạt ca kh&uacute;c mới ra mắt. Nổi bật nhất trong số đ&oacute; l&agrave; bản hit Roses với một chứng nhận đĩa bạch kim danh gi&aacute;. Tiếp theo l&agrave; Don&#39;t let me down tr&igrave;nh l&agrave;ng cuối năm 2015, hiện xếp ở vị tr&iacute; 14 top Billboard 100 v&agrave; hứa hẹn sẽ vươn l&ecirc;n qu&aacute;n qu&acirc;n trong thời gian tới.&nbsp;</p>

<p>Ngo&agrave;i việc ch&uacute; trọng v&agrave;o &acirc;m nhạc, The Chainsmokers cũng kh&aacute; chăm ch&uacute;t trong việc x&acirc;y dựng một h&igrave;nh ảnh ho&agrave;n to&agrave;n mới tr&ecirc;n s&acirc;n khấu với hiệu ứng &aacute;nh s&aacute;ng full monte độc đ&aacute;o. B&ecirc;n cạnh đ&oacute;, cặp đ&ocirc;i DJ c&ograve;n cho ra mắt chương tr&igrave;nh Nice Hair Radio l&ecirc;n s&oacute;ng ph&aacute;t thanh mỗi th&aacute;ng một lần nhằm chia sẻ những sự kiện mới, giải đ&aacute;p c&acirc;u hỏi v&agrave; phỏng vấn những DJ kh&aacute;c.&nbsp;</p>

<p>Trước xu hướng EDM đang dần b&atilde;o h&ograve;a, sự xuất hiện của The Chainsmokers như một l&agrave;n gi&oacute; mới. Rất c&oacute; thể sau những gương mặt từng tạo đột ph&aacute; như Martin Garrix, Avicii... The Chainsmokers sẽ l&agrave; c&aacute;i t&ecirc;n l&agrave;m đảo lộn bảng xếp hạng DJMag trong năm nay.</p>
', N'20190521114853image.jpg', 1, N'20190521114853background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2072, N'Alan Walker', 2474, N'<p>Alan Walker</p>

<p>Tên thật:&nbsp;Alan Walker</p>

<p>Quốc gia:&nbsp;Norway</p>

<p>Chàng trai Na Uy 18 tuổi bất ngờ được cả thế giới biết đến sau khi một trong trong những ca khúc đầu tay trở thành hiện tượng EDM toàn cầu.&nbsp;<br />
Trả lời phỏng vấn Mashable, nghệ sĩ trẻ không giấu khỏi tự hào khi Faded bất ngờ trở thành hiện tượng EDM tại Na Uy năm nay. Bài hát có sự góp giọng của nhạc sĩ/ca sĩ Iselin Solheim dựa trên nguyên gốc ca khúc Fade từng ra mắt cách đây 2 năm. Sau khi trở thành hiện tượng EDM, bài hát nhanh chóng được những DJ hàng đầu thế giới như Tiësto, Hardwell, Dash Berlin... lấy cảm hứng để cho ra mắt nhiều phiên bản remix khác nhau.&nbsp;<br />
<br />
<br />
Sinh ra và lớn lên tại Bergen, Na Uy, Alan Walker sở hữu tài năng âm nhạc thiên bẩm ngay từ khi còn là một đứa trẻ với khả năng chơi thành thạo nhiều loại nhạc cụ như piano, violin, guitar... và bắt đầu theo đuổi sự nghiệp sáng tác từ khi mới 14 tuổi. Trong một lần nghe một bản mix của Ness, anh bất chợt có cảm hứng và tìm mọi cách liên lạc với DJ người Italy để xin theo học sản xuất âm nhạc. Nhờ sự dìu dắt của Ness, Walker bắt đầu lên ý tưởng và sản xuất tác phẩm đầu tay bằng laptop qua một phần mềm nổi tiếng dành cho DJ nghiệp dư mang tên FruityLoop.</p>
', N'20190521195218image.jpg', 1, N'20190521195218background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2073, N'TheFatRat', 1505, N'<p>TheFatRat</p>

<p>Tên thật:&nbsp;TheFatRat</p>

<p>Quốc gia:&nbsp;United States</p>
', N'20190521200225image.jpg', 1, N'20190521200225background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2074, N'Uông Tô Lang', 2789, N'<p>Uông Tô Lang</p>

<p>Tên thật:&nbsp;汪蘇瀧</p>

<p>Quốc gia:&nbsp;China</p>

<p>Ngày sinh:&nbsp;12/1/1990</p>
', N'20190521200932image.jpg', 1, N'20190521200932background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2075, N'Dương Dương', 1240, N'<p>Dương Dương</p>

<p>Tên thật:&nbsp;Dương Dương</p>

<p>Quốc gia:&nbsp;China</p>

<p>Ngày sinh:&nbsp;9/9/1991</p>

<p>Tên: Dương Dương&nbsp;<br />
Giới tính: Nam&nbsp;<br />
Tuổi: 17&nbsp;<br />
Ngày sinh: 9/9&nbsp;<br />
Chiều cao: 1m80&nbsp;<br />
Nhóm máu: AB&nbsp;<br />
Quê quán: An Huy&nbsp;<br />
Đang học tập tại Học viện nghệ thuật nhân dân giải phóng quân Trung Quốc&nbsp;<br />
Chuyên nghiệp: vũ đạo&nbsp;<br />
Phim đã tham gia: Tân Hồng Lâu Mộng (2008) vai Bảo Ngọc</p>
', N'20190521201323image.jpg', 1, N'20190521201323background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2076, N'Tiểu Phan Phan', 2253, N'<p>Tiểu Phan Phan</p>

<p>Tên thật:&nbsp;小峰峰</p>
', N'20190521204513image.jpg', 1, N'20190521204513background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2077, N'Tiểu Phong Phong', 849, N'<p>Tiểu Phong Phong</p>

<p>Tên thật:&nbsp;小峰峰</p>
', N'20190521204601image.jpg', 1, N'20190521204601background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2078, N'Cúc Tịnh Y', 1851, N'<p>Cúc Tịnh Y</p>

<p>Tên thật:&nbsp;鞠婧祎</p>

<p>Quốc gia:&nbsp;China</p>

<p>Ngày sinh:&nbsp;18/06/1994</p>
', N'20190521205039image.jpg', 1, N'20190521205039background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2079, N'Wiz Khalifa', 329, N'<p>Wiz Khalifa</p>

<p>Tên thật:&nbsp;Cameron Jibril Thomaz</p>

<p>Quốc gia:&nbsp;United States</p>

<p>Ngày sinh:&nbsp;08/09/1987</p>

<p>Wiz Khalifa - Tên thật Cameron Jibril Thomaz. Biết đến nghệ danh Wiz Khalifa. Wiz khalifa phát hành album đầu tay năm 2006 và sau đó ký hợp đồng với Warner Bros Records vào năm 2007. Single &quot;Say Yeah&quot; say đó lọt vào top 40 của bảng xếp hạng danh giá BillBoard.&nbsp;<br />
<br />
Năm 2008 phát hành album thứ 2 Deal or No Deal và Black and Yellow nhanh chóng chiếm vị trí dẫn đầu trong Billboard top 100 sau đó...</p>
', N'20190521210806image.jpg', 1, N'20190521210806background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2080, N'BigBang', 97, N'<p>Big Bang (Tiếng Triều Tiên: 빅뱅, Cú Nổ Lớn), thường được viết là BIGBANG, là một nhóm nhạc nam của Hàn Quốc với 5 thành viên thuộc YG Entertainment. Big Bang được biết đến lần đầu tiên qua những tập phim tài liệu ghi lại quá trình hình thành của họ được chiếu trên TV với tựa đề The Big Bang Documentary từ tháng 7 đến tháng 8 năm 2006. Những tập phim này cũng được phát lại trên GomTV và MTV Hàn Quốc. Thời điểm này nhóm có 6 thành viên, sau đó một thành viên đã phải rời khỏi nhóm (SO-1, Jang Hyun Seung) trong lúc các tập tài liệu đang phát sóng trước khi nhóm chính thức ra mắt, để cuối cùng trở thành đội hình 5 thành viên như hiện nay gồm: G-Dragon, T.O.P, Taeyang, Daesung và Seungri.<br />
Dưới sự dẫn dắt của YG Entertainment, Big Bang liên tiếp phát hành những chuỗi single và EP và đạt được những thành công khá khiêm tốn. Cả nhóm chỉ thật sự đột phá với EP Always (&#39;Luôn luôn&#39;) được phát hành vào năm 2007, làm tiền đề cho single số một của họ là &#39;Lies&#39; (Korean: 거짓말; Âm đọc: Geojitmal, Nghĩa: dối trá ). Những EP tiếp theo của họ là Hot Issue và Stand Up khẳng định vị trí của họ trong số những nhóm nhạc hip-hop hàng đầu tại Hàn Quốc. Sau khi được trao giải &#39;Nghệ sĩ của năm&#39; của chương trình Mnet KM Music Festival và giải thưởng &#39;Seoul Gayo Daesang&#39;, cả nhóm mở rộng hoạt động sang thị trường Nhật Bản bằng việc phát hành một số mini album và single được phát sóng trên các kênh truyền thông. Tuy nhiên, những sản phẩm này không có được bất kỳ sự quảng bá nào cho đến khi single thật sự đầu tiên tại Nhật Bản của họ là My Heaven (&#39;Thiên đường của tôi&#39;) chính thức ra mắt vào năm kế tiếp.<br />
Cuối năm 2009, Big Bang trở thành tên tuổi nghệ sĩ được tìm kiếm nhiều nhất tại Hàn Quốc. Họ cũng trở thành nhóm nhạc nước ngoài đầu tiên tại Nhật Bản nhận được giải thưởng của Truyền hình cáp Nhật Bản với hạng mục &#39;Nghệ sĩ mới&#39;. Trong thời gian gần đây, các thành viên của nhóm dành thời gian cho những công việc cá nhân: Taeyang và G-Dragon phát hành những sản phẩm solo trong khi T.O.P, Daesung và Seungri bắt đầu sự nghiệp diễn xuất.<br />
Tháng 11 năm 2011 tại Belfast - Bắc Ailen, Big Bang đã đại diện cho khu vực Châu Á Thái Bình Dương tham dự giải thưởng âm nhạc là MTV Châu Âu 2011 khi được đề cử ở hạng mục Worldwide Act và giành chiến thắng nhờ 58 triệu lượt phiếu bầu của người hâm mộ. Như vậy, cùng với nhóm nhạc huyền thoại Queen, Big Bang là những nghệ sĩ duy nhất chiến thắng tại EMA 2011 mà không đến từ Bắc Mỹ.</p>
', N'20190521204505image.jpg', 1, N'20190521204505background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2081, N'Kobasolo', 1556, NULL, N'20190521205440image.jpg', 1, N'20190521205440background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2082, N'Eve', 2219, N'<p>Eve, also known as Keitora \ and Kurowa, is mostly known as an utaite on the platforms Niconico and YouTube. In recent years, he has also composed original VOCALOID works.&nbsp;<br />
Although being quite a new face as a VOCALOID producer, he has gained huge success, as every of his works so far have entered the Hall of Fame. His most notable songs include &quot;Nonsense Bungaku&quot; and &quot;Dramaturgy&quot;, both of which have exceed 1,500,000 views on Niconico.<br />
He was born on May 23, 1995.</p>
', N'20190521210305image.jpg', 1, N'20190521210305background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2083, N'RADWIMPS', 2711, N'<p>RADWIMPS<br />
Tên thật: RADWIMPS<br />
Quốc gia: Japan<br />
Ngày sinh: 2011<br />
RADWIMPS là một ban nhạc rock Nhật Bản thành lập năm 2001 tại tỉnh Kanagawa Họ đã ký kết với EMI Music Japan trong năm 2005.</p>
', N'20190521211138image.jpg', 1, N'20190521211138background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2084, N'BlackPink', 1819, N'<p>Tên thật:&nbsp;BLACKPINK</p>

<p>Quốc gia:&nbsp;South Korea</p>

<p>Ngày sinh:&nbsp;08/08/2016</p>

<p>BLACKPINK (Hangul: 블랙핑크; Romaja quốc ngữ: Beullaek Pingkeu, thường được viết cách điệu thành BLACK PINK, BLACKPINK hay BL&Lambda;ƆKPIИK)&nbsp;<br />
<br />
Vào ngày 29/06/2016, YG Entertainment đã chính thức tiết lộ girlgroup mới của họ sẽ chỉ gồm bốn thành viên đã công bố từ trước, đồng thời nhóm sẽ có tên là Black Pink.&nbsp;<br />
<br />
Đại diện YG Entertainment cho biết: &quot;Ý nghĩa của tên gọi Black Pink là để phản bác lại cách nhìn nhận phổ biến về màu hồng. Hồng thường được sử dụng để thể hiện vẻ xinh đẹp nhưng BLACKPINK mang ý nghĩa &quot;Xinh đẹp không phải là tất cả&quot;. Nó còn mang nghĩa biểu tượng rằng họ là một nhóm không chỉ sở hữu ngoại hình xinh đẹp mà còn cực kỳ tài năng và cá tính&quot;.&nbsp;<br />
<br />
Nhóm được thành lập vào năm 2016 và quản lý bởi công ty YG Entertainment bao gồm 4 thành viên: Jisoo sinh ngày 03/01/1995.&nbsp;<br />
Jennie sinh ngày 16/01/1996.&nbsp;<br />
Rosé sinh ngày 11/02/1997.&nbsp;<br />
Lisa sinh ngày 27/03/1997.&nbsp;<br />
YG thông báo rằng Black Pink sẽ không có trưởng nhóm vì công ty muốn cả bốn thành viên cùng hỗ trợ lẫn nhau.&nbsp;<br />
<br />
Nhóm chính thức ra mắt vào lúc 8:00PM (KST) ngày 08/08/2016 với hai đĩa đơn &quot;BOOMBAYAH&quot; và &quot;Whistle&quot;, nằm trong album đĩa đơn đầu tay &quot;SQUARE ONE&quot;. Black Pink lập kỉ lục là nhóm nhạc nữ được đề cử và giành chiến thắng trên các show âm nhạc nhanh nhất kể từ khi ra mắt và bắt đầu quảng bá. Nhóm được no.1 trên Inkigayo chỉ sau 13 ngày debut.&nbsp;<br />
<br />
Trước khi ra mắt: Ngày 01/06/2016, YG Entertainment bắt đầu giới thiệu hình ảnh teaser cho sự ra mắt của nhóm nhạc nữ mới, thành viên đầu tiên được tiết lộ là Jennie Kim, thực tập sinh khá nổi tiếng của YG, người trước đây đã hợp tác với các nghệ sĩ cùng công ty, trong đó có G-Dragon qua ca khúc &quot;Black&quot; (2012).&nbsp;<br />
<br />
Ngày 08/06, hình ảnh của thành viên Lisa, một cô nàng bí ẩn gây nhiều ấn tượng với những video được đăng tải trên kênh Youtube của công ty. Lisa là thành viên ngoại quốc đầu tiên trong lịch sử nhà YG và được biết đến là người duy nhất dành chiến thắng trong cuộc thi YG Audition tại Thái Lan vào năm 2010.&nbsp;<br />
<br />
Ngày 15/06, YG tiết lộ hình ảnh của thành viên Jisoo, thành viên lớn tuổi nhất, là người mẫu cho nhiều nhãn hiệu quảng cáo và diễn xuất trong nhiều video âm nhạc.&nbsp;<br />
<br />
Ngày 22/06, tiết lộ thành viên cuối cùng: Rosé. Người đã từng góp giọng trong ca khúc &quot;Without You&quot; (2012) của G-Dragon.&nbsp;<br />
<br />
Cuối cùng, vào ngày 29/06, YG Entertainment cho ra mắt những hình ảnh teaser của cả bốn thành viên đã tiết lộ trước đó và xác nhận nhóm sẽ mang tên BLACKPINK.&nbsp;<br />
<br />
Ngày 15/01/2017, Black Pink tiết lộ BLINK sẽ là tên fanclub chính thức của nhóm bằng một hình ảnh đăng tải lên Instagram. YG giải thích rằng họ đã lấy &ldquo;BL&rdquo; trong Black và &ldquo;INK&rdquo; trong &ldquo;pink&rdquo; để hợp thành từ Blink (nhấp nháy), mang ý nghĩa là cách mà Black Pink nhìn thấy người hâm mộ của họ.&nbsp;<br />
<br />
Sáng ngày 17/05, YGEX Entertainment (công ty hợp tác giữa YG và AVEX, chuyên phụ trách hoạt động của nghệ sĩ YG tại Nhật) đã thông báo rằng nhóm nhạc nữ Black Pink sẽ ra mắt tại thị trường Nhật Bản vào tháng 07. Để quảng bá cho nhóm, kể từ ngày 17/05, YVEX đã đăng tải hồ sơ của 4 thành viên Jennie, Jisoo, Rosé và Lisa lên website chính thức.</p>
', N'20190521212002image.jpg', 1, N'20190521212002background.jpg')
INSERT [dbo].[Artist] ([ID], [Name], [Follows], [Description], [Image], [Status], [Background]) VALUES (2085, N'Exo', 2824, N'<p>Tên thật:&nbsp;EXO</p>

<p>Quốc gia:&nbsp;South Korea</p>

<p>Ngày sinh:&nbsp;2012</p>

<p>EXO là một nhóm nhạc nam Hàn-Trung Quốc được S.M. Entertainment thành lập vào năm 2011 và ra mắt công chúng vào năm 2012, ban đầu nhóm bao gồm 12 thành viên được chia thành hai nhóm nhỏ, EXO-K và EXO-M, thu âm và biểu diễn các bài hát lần lượt bằng tiếng Hàn và tiếng Quan Thoại. EXO trở nên nổi tiếng với album phòng thu đầu tay XOXO (2013) và bài hát đột phá &quot;Growl&quot;. XOXO giành chiến thắng ở hạng mục album của năm tại hai lễ trao giải Mnet Asian Music Awards lần thứ 15 và Golden Disk Awards lần thứ 28, trở thành album bán chạy nhất năm 2013 tại Hàn Quốc và là album đầu tiên bán được trên 1 triệu bản tại Hàn Quốc trong vòng 12 năm.&nbsp;<br />
<br />
Tháng 5 năm 2014, Kris khởi kiện S.M. Entertainment và yêu cầu chấm dứt hợp đồng với công ty. Luhan tiếp tục làm điều tương tự vào tháng 10 năm 2014. Tháng 4 năm 2015, Tao chấm dứt hoạt động cùng nhóm và sau đó cũng khởi kiện công ty vào tháng 8 năm 2015. Sau sự ra đi của ba thành viên trên, EXO tiếp tục hoạt động với chín thành viên còn lại.</p>
', N'20190521212146image.jpg', 1, N'20190521212146background.jpg')
SET IDENTITY_INSERT [dbo].[Artist] OFF
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1, 7)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2, 3)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1002, 3)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1006, 3)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1008, 4)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1013, 7)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1022, 1)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1023, 1)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (1035, 5)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2043, 2)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2047, 6)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2048, 7)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2068, 8)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2071, 12)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2072, 8)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2072, 11)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2073, 9)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2074, 10)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2074, 13)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2075, 10)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2078, 13)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2082, 14)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2083, 14)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2084, 15)
INSERT [dbo].[Artist_Album] ([Artist], [Album]) VALUES (2085, 16)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (2, N'admin', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (2, N'khoatd', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (2, N't', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (1002, N't', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (1003, N't', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (1011, N'khoatd', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (1012, N'khoatd', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (1017, N'khoatd', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (1021, N'khoatd', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (2038, N't', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (2065, N'admin', 1)
INSERT [dbo].[Artist_User] ([Artist], [User], [Status]) VALUES (2071, N'admin', 1)
INSERT [dbo].[FavoriteSong] ([Song], [Username]) VALUES (6029, N'admin')
INSERT [dbo].[FavoriteSong] ([Song], [Username]) VALUES (6029, N't')
INSERT [dbo].[FavoriteSong] ([Song], [Username]) VALUES (6031, N't')
INSERT [dbo].[FavoriteSong] ([Song], [Username]) VALUES (6038, N't')
INSERT [dbo].[FavoriteSong] ([Song], [Username]) VALUES (6070, N'admin')
INSERT [dbo].[FollowArtist] ([Username], [Artist]) VALUES (N'khoatd', 1017)
INSERT [dbo].[FollowArtist] ([Username], [Artist]) VALUES (N'khoatd', 1021)
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (1, N'Âu Mỹ', NULL, N'AuMy.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (2, N'Country', NULL, N'Country.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (3, N'EDM', NULL, N'EDM.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (4, N'HipHop', NULL, N'HipHop.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (5, N'Nhạc Không Lời', NULL, N'KhongLoi.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (6, N'K-POP', NULL, N'K-POP.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (7, N'Nhạc Dance', NULL, N'NhacDance.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (8, N'Nhạc Hoa', NULL, N'NhacHoa.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (9, N'Nhạc Trẻ', NULL, N'NhacTre.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (10, N'R&B', NULL, N'R&B.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (11, N'Rap Việt', NULL, N'RapViet.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (12, N'Thiếu Nhi', NULL, N'ThieuNhi.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (13, N'Trữ tình & Bolero', NULL, N'TruTinh.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (14, N'Nhạc Nhật', NULL, N'NhacNhat.jpg', 1)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (1017, N'asdsa', N'<p>sadsa</p>
', N'20190520211300genreImage.jpg', 0)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (1018, N'tet', N'<p>t</p>
', N'20190520211901genreImage.jpg', 0)
INSERT [dbo].[Genre] ([ID], [Name], [Description], [Image], [Status]) VALUES (1019, N'ddfdsf', N'<p>sefss</p>
', N'20190521062641genreImage.jpg', 0)
SET IDENTITY_INSERT [dbo].[Genre] OFF
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'admin', 6029)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'admin', 6070)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 0)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2002)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2003)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2004)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2005)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2007)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2008)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2009)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2010)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2011)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 2012)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 5003)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 5007)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 6014)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 6015)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N'khoatd', 6016)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 2003)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 2005)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 5005)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 5007)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 5009)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 6029)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 6031)
INSERT [dbo].[LikeSong] ([Username], [Song]) VALUES (N't', 6038)
SET IDENTITY_INSERT [dbo].[Playlist] ON 

INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1, N'My Play List', 0, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (8, N'aa', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (9, N'bb', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (10, N'cc', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (11, N'dd', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (12, N'abc', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1012, N'eee', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1013, N'111', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1014, N'222', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1015, N'13dq', NULL, NULL, NULL, 1, N'khoatd')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1016, N'my', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1017, N'aa', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1018, N'bb', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1019, N'dd', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1020, N'ee', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1021, N'1', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1022, N'2', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1023, N'33', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1024, N'44', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1025, N'5', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1026, N'6', NULL, NULL, NULL, 1, N't')
INSERT [dbo].[Playlist] ([ID], [Name], [Views], [Image], [Description], [Status], [Username]) VALUES (1027, N'playlist của tôi', NULL, NULL, NULL, 1, N'admin')
SET IDENTITY_INSERT [dbo].[Playlist] OFF
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (1, 6055)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (2, 6078)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (3, 6035)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (4, 2007)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (5, 6029)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (6, 2002)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (7, 6056)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (8, 2008)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (9, 6054)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (10, 6065)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (11, 6072)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (12, 6064)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (13, 5004)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (14, 6037)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (15, 6077)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (16, 5005)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (17, 6066)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (18, 2009)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (19, 6073)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (20, 6059)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (21, 6036)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (22, 6046)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (23, 6051)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (24, 2003)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (25, 6031)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (26, 2010)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (27, 6068)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (28, 6061)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (29, 5009)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (30, 6041)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (31, 6063)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (32, 6049)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (33, 6062)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (34, 6045)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (35, 6080)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (36, 6067)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (37, 6075)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (38, 6039)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (39, 6060)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (40, 2004)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (41, 6030)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (42, 6043)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (43, 6042)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (44, 6038)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (45, 6074)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (46, 2012)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (47, 6070)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (48, 6044)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (49, 6047)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (50, 6040)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (51, 2006)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (52, 6048)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (53, 5003)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (54, 6058)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (55, 6069)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (56, 2005)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (57, 2011)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (58, 5006)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (59, 6052)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (60, 5007)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (61, 6079)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (62, 6053)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (63, 5008)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (64, 6057)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (65, 6071)
INSERT [dbo].[RankForMonth] ([Rank], [Song]) VALUES (66, 6076)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (1, 6041)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (2, 6070)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (3, 6038)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (4, 6078)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (5, 2012)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (6, 2011)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (7, 6057)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (8, 6074)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (9, 6039)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (10, 6031)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (11, 6046)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (12, 6060)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (13, 6047)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (14, 6059)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (15, 5003)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (16, 6077)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (17, 5009)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (18, 5004)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (19, 2010)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (20, 5005)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (21, 6030)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (22, 6063)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (23, 6036)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (24, 6045)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (25, 6044)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (26, 6049)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (27, 2003)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (28, 6035)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (29, 6062)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (30, 6058)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (31, 6054)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (32, 6067)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (33, 2008)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (34, 6065)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (35, 6075)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (36, 6052)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (37, 6051)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (38, 6055)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (39, 2002)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (40, 6066)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (41, 6042)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (42, 2007)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (43, 6064)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (44, 6061)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (45, 6068)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (46, 6080)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (47, 6048)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (48, 6069)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (49, 6072)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (50, 2006)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (51, 2004)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (52, 6073)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (53, 6056)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (54, 6037)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (55, 6043)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (56, 6040)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (57, 2005)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (58, 6029)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (59, 5006)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (60, 2009)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (61, 6079)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (62, 6071)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (63, 5007)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (64, 6053)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (65, 6076)
INSERT [dbo].[RankForWeek] ([Rank], [Song]) VALUES (66, 5008)
SET IDENTITY_INSERT [dbo].[Song] ON 

INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2002, N'Hồng Nhan', N'<p>Mel :<br />
V&agrave; d&ograve;ng thư tay em gửi trao anh ng&agrave;y n&agrave;o<br />
Giờ c&ograve;n lại hư v&ocirc; em gửi anh đ&acirc;y lời ch&agrave;o<br />
M&agrave; nh&igrave;n người đi vội...M&igrave;nh l&agrave;m g&igrave; n&ecirc;n tội<br />
Tại sao lại c&aacute;ch xa...C&ograve;n y&ecirc;u như thế m&agrave;<br />
Để lệ hoen mi khi m&ugrave;a xu&acirc;n đang thầm th&igrave;<br />
Nh&igrave;n người m&agrave; ra đi anh chẳng n&iacute;u k&eacute;o điều g&igrave;<br />
M&agrave; nghe sao đ&aacute;ng thương...Nh&igrave;n nhau như cố hương<br />
T&igrave;m em ở bốn phương...V&igrave; say n&ecirc;n vấn vương<br />
Em ơi v&ocirc; t&igrave;nh d&ugrave; t&igrave;nh m&igrave;nh gặp kh&ocirc;ng may<br />
Em xa nơi n&agrave;y để giọt lệ ở b&ecirc;n đ&acirc;y<br />
Bầu trời giờ hắt hiu nh&igrave;n về nơi đ&oacute; đ&acirc;y<br />
Ngo&agrave;i trời th&igrave; c&oacute; m&acirc;y...Chỉ c&ograve;n lại l&agrave; đắng cay<br />
Thương cha thương mẹ để đ&agrave;nh l&ograve;ng m&agrave; quay lưng<br />
25 &acirc;m lịch nh&igrave;n người cười m&agrave; rưng rưng<br />
B&ecirc;n kia l&agrave; ph&aacute;o hoa...Rộn r&agrave;ng người đến xem<br />
Họ h&agrave;ng mừng kết duy&ecirc;n...C&ograve;n phần m&igrave;nh l&agrave; hết duy&ecirc;n<br />
Rap 1 :<br />
Ohh...<br />
Anh như kẻ lạc c&ograve;n t&acirc;m tối giữa rừng th&ocirc;ng<br />
Nơi c&aacute;nh chim nhỏ lạc đ&agrave;n t&igrave;m bến đỗ để ngừng tr&ocirc;ng<br />
Anh l&agrave; 1 con đom đ&oacute;m mắt anh s&aacute;ng đến xoay v&ograve;ng<br />
Gieo cho anh cả 1 mầm sống nhưng chẳng chịu c&ocirc;ng vun trồng<br />
V&igrave; l&uacute;c ấy ta c&ograve;n trẻ n&ecirc;n đời bạc v&agrave; mưu sinh<br />
Anh chưa học hết lớp 10 người ta gọi l&agrave; lưu linh<br />
Anh gắn b&oacute; với s&ocirc;ng nước v&agrave; cảnh vật n&agrave;y hữu t&igrave;nh<br />
C&ograve;n người ta cho em &aacute;o lụa hỏi tại sao chẳng phụ m&igrave;nh<br />
Mel :<br />
T&igrave;nh y&ecirc;u ơi b&igrave;nh y&ecirc;n ơi<br />
Về đ&acirc;y đi để anh &ocirc;m để gi&oacute; cuốn đ&ecirc;m nay ai đưa về nh&agrave;<br />
Để gi&oacute; vang l&ecirc;n c&acirc;u t&igrave;nh ca<br />
Để lệ hoen mi khi m&ugrave;a xu&acirc;n đang thầm th&igrave;<br />
Nh&igrave;n người m&agrave; ra đi anh chẳng n&iacute;u k&eacute;o điều g&igrave;<br />
M&agrave; nghe sao đ&aacute;ng thương...Nh&igrave;n nhau như cố hương<br />
T&igrave;m em ở bốn phương...V&igrave; say n&ecirc;n vấn vương<br />
Hết rồi cuối c&ugrave;ng nắng th&igrave; cũng đ&atilde; ng&atilde; v&agrave;ng<br />
B&ecirc;n người nh&acirc;n t&igrave;nh em phải thương bản th&acirc;n m&igrave;nh<br />
Rap 2 :<br />
Buồn lắm phải kh&ocirc;ng...Gi&atilde; tr&agrave;ng lấp biển Đ&ocirc;ng<br />
Biết người cũng chả tr&ocirc;ng n&ecirc;n th&ocirc;i c&acirc;u chuyện thả ra s&ocirc;ng<br />
Nhưng nếu anh say như thế n&agrave;y th&igrave; ai xem<br />
Người ta sẽ n&oacute;i anh tệ với những thứ m&agrave; em đem<br />
V&igrave; thế n&ecirc;n anh phải sống như c&aacute;i c&aacute;ch anh từng mơ<br />
D&ugrave; cho bản th&acirc;n n&agrave;y h&oacute;a đ&aacute; nhưng tr&aacute;i tim chẳng ngừng thở<br />
V&agrave; ba của anh l&agrave; l&iacute;nh...M&aacute; anh từng l&agrave;m c&aacute;n bộ<br />
Anh kh&ocirc;ng cho ph&eacute;p m&igrave;nh kh&oacute;c...Xe c&oacute; hư cũng r&aacute;ng độ<br />
Đời người l&agrave; kiếp l&atilde;ng du, anh chẳng may l&agrave;m lữ kh&aacute;ch<br />
Đi với nhau cả 1 h&agrave;nh tr&igrave;nh giờ c&oacute; xa chẳng nỡ tr&aacute;ch<br />
Em ước l&agrave; đời của em b&igrave;nh y&ecirc;n<br />
Chẳng buồn phiền như người ta<br />
M&agrave; giờ ra đ&acirc;y m&agrave; xem c&oacute; người đang l&ecirc;n kiệu hoa<br />
V&agrave; rồi sẽ tốt nhưng m&agrave; ở nơi kh&aacute;c chẳng c&ograve;n bận l&ograve;ng như ở đ&acirc;y<br />
T&igrave;nh y&ecirc;u của anh th&igrave; c&oacute; đủ m&ugrave;i vị nhưng m&agrave; chẳng ngọt như ở t&acirc;y<br />
Mel :<br />
N&agrave; na na na (xN)<br />
Để lệ hoen mi khi m&ugrave;a xu&acirc;n đang thầm th&igrave;<br />
Nh&igrave;n người m&agrave; ra đi anh chẳng n&iacute;u k&eacute;o điều g&igrave;<br />
M&agrave; nghe sao đ&aacute;ng thương...Nh&igrave;n nhau như cố hương<br />
T&igrave;m em ở bốn phương...V&igrave; say n&ecirc;n vấn vương.....﻿</p>
', 6667, 231, N'2002.mp3', 1, NULL, 1, 150, 912)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2003, N'Đúng người đúng thời điểm', N'<p>H&ocirc;m nay em n&oacute;i em cần đ&ocirc;i tay&nbsp;<br />
&Ocirc;m lấy em v&agrave; dắt em đến những chốn y&ecirc;u xa ng&agrave;n m&acirc;y<br />
H&ocirc;m nay tạm ngưng hết những &acirc;u lo thường ng&agrave;y<br />
Chỉ cần em ngồi sau c&ugrave;ng anh ta đi đến đ&acirc;u cũng đc<br />
Nếu như một ng&agrave;y anh kh&ocirc;ng giống như em từng tr&ocirc;ng mong<br />
Chẳng &ocirc;m được thế giới liệu em c&oacute; y&ecirc;u kh&ocirc;ng<br />
V&igrave; anh &ocirc;m được mỗi tr&aacute;i tim thật nhỏ b&eacute; của người anh y&ecirc;u<br />
C&oacute; em thật ấm &aacute;p như một b&agrave;i h&aacute;t anh phi&ecirc;u<br />
M&igrave;nh giữ nhau thật chắc nh&eacute; nếu đi ta c&ugrave;ng đi<br />
Mọi b&atilde;o gi&ocirc;ng đếu qua khi con tim c&ugrave;ng theo l&iacute; tr&iacute;<br />
Giờ gi&oacute; đ&ocirc;ng lạnh gi&aacute; lắm cứ y&ecirc;u t&acirc;m c&ograve;n anh v&agrave; nắng v&agrave;ng<br />
C&ugrave;ng sưởi ấm để em cảm thấy y&ecirc;u thương nhiều hơn<br />
Việc của em l&agrave; y&ecirc;u anh c&oacute; mưa gi&ocirc;ng th&igrave; để anh lo&nbsp;<br />
Chẳng hứa xua đc m&acirc;y đen nhưng b&igrave;nh y&ecirc;n khi b&ecirc;n anh<br />
T&igrave;m thấy em người anh y&ecirc;u l&uacute;c y&ecirc;u thương tựa như nắng cuối chiều<br />
Từ nay em sẽ l&agrave;m cuộc sống tốt hơn bao điều</p>
', 9183, 153, N'2003.mp3', 1, NULL, 2, 235, 626)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2004, N'Về đây em lo', N'<p>Đ&ecirc;m h&ocirc;m nay sao qu&aacute; chơi vơi đặng l&ograve;ng đau bước ch&acirc;n r&atilde; rời<br />
Y&ecirc;u đơn phương đau lắm ai ơi hạnh ph&uacute;c đ&atilde; xa m&ugrave; khơi.<br />
Khi xưa c&ograve;n b&ecirc;n nhau em giấu kh&ocirc;ng n&oacute;i ra.<br />
N&ecirc;n anh đ&acirc;u biết y&ecirc;u thương trong em l&agrave;.<br />
Bao nhi&ecirc;u l&agrave; mong,nhi&ecirc;u l&agrave; mơ, nhi&ecirc;u l&agrave; y&ecirc;u.<br />
Suốt cuộc đời n&agrave;y,chắc kh&ocirc;ng bao giờ anh hiểu.<br />
ĐK:<br />
T&ocirc;i ơi buồn l&agrave;m g&igrave;,t&ocirc;i ơi bước đi đi.<br />
Đừng ho&agrave;i mong nữa anh ấy kh&ocirc;ng y&ecirc;u m&igrave;nh đ&acirc;u m&agrave;.<br />
Đ&atilde; cố phải dằn l&ograve;ng,qu&ecirc;n anh chẳng an t&acirc;m.<br />
V&igrave; em cảm thấy ai kia kh&ocirc;ng y&ecirc;u anh thật l&ograve;ng.<br />
Em vẫn sẽ chờ ho&agrave;i,em kh&ocirc;ng bỏ anh đi.<br />
D&ugrave; cuộc đời s&oacute;ng gi&oacute; c&oacute; mỏi mệt th&igrave; anh.<br />
Anh cứ quay về đ&acirc;y,em lo lắng cho anh.<br />
Em sẽ kh&ocirc;ng y&ecirc;u ai ngo&agrave;i anh.</p>

<p>Xa nhau m&igrave;nh em đ&acirc;u,em giấu anh c&oacute; hay.<br />
Chia tay nước mắt bu&ocirc;ng tay anh đ&acirc;u cần.<br />
B&ecirc;n em v&agrave; y&ecirc;u,y&ecirc;u rồi xa xa c&agrave;ng qu&ecirc;n.<br />
Đớn đau y&ecirc;u anh chắc kh&ocirc;ng bao giờ anh biết.</p>

<p>T&ocirc;i ơi buồn l&agrave;m g&igrave;,t&ocirc;i ơi bước đi đi.<br />
Đừng ho&agrave;i mong nữa anh ấy kh&ocirc;ng y&ecirc;u m&igrave;nh đ&acirc;u m&agrave;.<br />
Đ&atilde; cố phải dằn l&ograve;ng,qu&ecirc;n anh chẳng an t&acirc;m.<br />
V&igrave; em cảm thấy ai kia kh&ocirc;ng y&ecirc;u anh thật l&ograve;ng.<br />
Em vẫn sẽ chờ ho&agrave;i,em kh&ocirc;ng bỏ anh đi.<br />
D&ugrave; cuộc đời s&oacute;ng gi&oacute; c&oacute; mỏi mệt th&igrave; anh.<br />
Anh cứ quay về đ&acirc;y,em lo lắng cho anh.<br />
Em sẽ kh&ocirc;ng y&ecirc;u ai ngo&agrave;i anh.</p>
', 2905, 334, N'2004.mp3', 1, NULL, 2035, 73, 473)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2005, N'Em sẽ là cô dâu', N'<p>Từ khi quen em ph&uacute;t ban đầu<br />
Cuộc sống anh kh&aacute;c xưa nhiều lắm<br />
Cho anh cảm nhận t&igrave;nh y&ecirc;u lớn l&ecirc;n đổi thay từng ng&agrave;y<br />
Anh biết qu&yacute; trọng<br />
Từng ph&uacute;t gi&acirc;y khi c&oacute; em b&ecirc;n cạnh<br />
T&igrave;m được em<br />
L&agrave; điều v&ocirc; gi&aacute; nhất trong anh hằng mong</p>

<p>Ở b&ecirc;n em bao muộn phiền<br />
Lo lắng trong anh tan biến hết<br />
Chỉ c&oacute; nụ cười hạnh ph&uacute;c ở trong tr&aacute;i tim m&agrave; th&ocirc;i<br />
Em h&atilde;y nhắm mắt lại nhận lời đ&iacute;nh h&ocirc;n của anh thật l&ograve;ng<br />
V&ograve;ng tr&ograve;n t&igrave;nh y&ecirc;u của chiếc nhẫn cưới<br />
Sẽ minh chứng t&igrave;nh y&ecirc;u anh d&agrave;nh cho em</p>

<p>Em sẽ l&agrave; c&ocirc; d&acirc;u xinh đẹp nhất trong đời anh<br />
Cho anh cuộc sống mới đầy ắp tiếng cười rộn vang<br />
Cho anh sự b&igrave;nh y&ecirc;n thật ấm &aacute;p mỗi khi đ&ecirc;m về<br />
Cho anh ng&agrave;n nụ h&ocirc;n chắp c&aacute;nh ước mơ bay thật xa<br />
Em sẽ l&agrave; c&ocirc; d&acirc;u<br />
Hạnh ph&uacute;c nhất trong đời anh<br />
Dẫu vui buồn gian kh&oacute; hai ta sẽ cố gắng vượt qua<br />
Anh sẽ l&agrave; bờ vai che chở em d&otilde;i theo từng ng&agrave;y<br />
H&atilde;y l&agrave;m vợ anh y&ecirc;u anh đến hết cuộc đời</p>

<p>Anh sẽ lu&ocirc;n ở b&ecirc;n người<br />
V&agrave; đời n&agrave;y người sẽ m&atilde;i che trở cho em<br />
Sẽ b&ecirc;n nhau kh&ocirc;ng xa rời<br />
V&agrave; m&igrave;nh c&ugrave;ng nguyện ước b&ecirc;n nhau m&atilde;i th&ocirc;i<br />
C&ocirc; d&acirc;u trong anh, duy nhất trong anh<br />
Ch&iacute;nh em, h&atilde;y l&agrave; vợ anh em nh&eacute;<br />
Cho nụ h&ocirc;n thật s&acirc;u rất l&acirc;u<br />
Sẽ nắm tay nhau đến bạc m&aacute;i đầu</p>

<p>Vượt qua bao ng&agrave;y gian kh&oacute; ta đ&atilde; c&oacute; nhau rồi<br />
H&atilde;y l&agrave;m vợ anh em nh&eacute;, người y&ecirc;u ơi</p>
', 1674, 238, N'2005.mp3', 1, NULL, 2037, 36, 157)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2006, N'Em Đã Thấy Anh Cùng Người Ấy', N'<p>V&agrave; em đ&atilde; thấy<br />
Anh c&ugrave;ng người ấy&nbsp;<br />
L&agrave;m điều g&igrave; đ&ecirc;m ấy&nbsp;<br />
Em muốn biết anh thấy thế n&agrave;o<br />
C&oacute; như khi h&ocirc;n em?<br />
D&ugrave; em cố gắng, trấn an mọi thứ&nbsp;<br />
Mọi chuyện rồi sẽ qua&nbsp;<br />
Nhưng đ&acirc;u biết c&oacute; c&ograve;n nguy&ecirc;n vẹn<br />
Như khi anh bước đi&nbsp;<br />
V&agrave; em đ&atilde; thấy<br />
Anh c&ugrave;ng người ấy<br />
L&agrave;m điều g&igrave; ph&iacute;a sau&nbsp;<br />
Em kh&oacute;c như vậy<br />
Đau như vậy&nbsp;<br />
Anh đ&acirc;u biết đ&acirc;u<br />
V&agrave; em đ&atilde; thấy<br />
Người đang đổi thay<br />
Ch&iacute;nh anh ngay l&uacute;c n&agrave;y<br />
Nếu hết y&ecirc;u rồi, cứ bu&ocirc;ng tay<br />
Sao anh lại l&agrave;m như thế n&agrave;y!</p>

<p>L&agrave; c&ocirc; ấy tốt hơn<br />
Hay những thứ anh cần...<br />
Chẳng c&ograve;n xuất ph&aacute;t từ em<br />
Chẳng c&ograve;n như lời anh hứa<br />
V&agrave; em đ&atilde; thấy<br />
Anh c&ugrave;ng người ấy<br />
L&agrave;m điều g&igrave; ph&iacute;a sau&nbsp;<br />
Em kh&oacute;c như vậy<br />
Đau như vậy&nbsp;<br />
Anh đ&acirc;u biết đ&acirc;u<br />
V&agrave; em đ&atilde; thấy<br />
Người đang đổi thay<br />
Ch&iacute;nh anh ngay l&uacute;c n&agrave;y<br />
Nếu hết y&ecirc;u rồi, cứ bu&ocirc;ng tay<br />
Sao anh lại như thế...<br />
Nếu đến cuối em chẳng biết&nbsp;<br />
Mọi chuyện cứ thế &ecirc;m đẹp&nbsp;<br />
Liệu rằng anh c&oacute; biết dừng lại<br />
Liệu anh c&oacute; giật m&igrave;nh nhớ ra<br />
Em vẫn đứng đấy<br />
Vẫn lu&ocirc;n chờ anh<br />
D&ugrave; điều g&igrave; xảy ra&nbsp;<br />
Khiến em kh&oacute;c như vậy, đau đến thế<br />
Sao vẫn mong nhớ<br />
V&agrave; em đ&atilde; thấy, c&ocirc; ấy đến nơi<br />
C&oacute; anh đang đứng đợi&nbsp;<br />
Nếu hết y&ecirc;u rồi, cứ bu&ocirc;ng tay<br />
Sao anh lại l&agrave;m như thế n&agrave;y!</p>
', 3161, 119, N'2006.mp3', 1, NULL, 2038, 78, 241)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2007, N'Không Phải Em Đúng Không?', N'<p>Em biết anh y&ecirc;u c&ocirc; ta<br />
Giấu em những h&ocirc;m kh&ocirc;ng về nh&agrave;<br />
Giấu em từ trong &aacute;nh mắt, từ trong lời n&oacute;i<br />
Anh lu&ocirc;n giấu em<br />
Em sẽ đứng im em nh&igrave;n<br />
Xem tr&aacute;i tim em sẽ chịu đựng được<br />
Một người em đang y&ecirc;u thương, em đang chăm s&oacute;c, đang lừa dối em...<br />
V&agrave; nếu như c&oacute; một ng&agrave;y anh kh&ocirc;ng thấy em<br />
V&agrave; em sẽ n&oacute;i rằng anh h&atilde;y đi đi anh<br />
Anh cố nắm thật chặt đ&ocirc;i tay của em<br />
Cố &ocirc;m chầm v&agrave; anh xin lỗi em<br />
V&agrave; nếu suy nghĩ của em sẽ kh&ocirc;ng như vậy<br />
Sẽ kh&ocirc;ng phải l&agrave; em, m&agrave; l&agrave; c&ocirc; ấy<br />
Em kh&ocirc;ng phải l&agrave; người đi đến cuối c&ugrave;ng<br />
Sẽ kh&ocirc;ng phải l&agrave; em đ&uacute;ng kh&ocirc;ng...<br />
Anh<br />
Em biết anh y&ecirc;u c&ocirc; ta<br />
Giấu em những h&ocirc;m kh&ocirc;ng về nh&agrave;,<br />
Giấu em từ trong &aacute;nh mắt, từ trong lời n&oacute;i<br />
Anh lu&ocirc;n giấu em<br />
Em sẽ đứng im em nh&igrave;n<br />
Xem tr&aacute;i tim em sẽ chịu đựng được<br />
Một người em đang y&ecirc;u thương, em đang chăm s&oacute;c, đang lừa dối em...<br />
V&agrave; nếu như c&oacute; một ng&agrave;y anh kh&ocirc;ng thấy em<br />
V&agrave; em sẽ n&oacute;i rằng anh h&atilde;y đi đi anh<br />
Anh cố nắm thật chặt đ&ocirc;i tay của em<br />
Cố &ocirc;m chầm v&agrave; anh xin lỗi em<br />
V&agrave; nếu suy nghĩ của em sẽ kh&ocirc;ng như vậy<br />
Sẽ kh&ocirc;ng phải l&agrave; em, m&agrave; l&agrave; c&ocirc; ấy<br />
Em kh&ocirc;ng phải l&agrave; người đi đến cuối c&ugrave;ng<br />
Sẽ kh&ocirc;ng phải l&agrave; em đ&uacute;ng kh&ocirc;ng...<br />
Anh</p>
', 9380, 159, N'2007.mp3', 1, NULL, 2039, 120, 938)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2008, N'Một Đêm Say (X)', N'<p>Khi đ&ocirc;i m&ocirc;i em c&ograve;n đỏ mọng&nbsp;<br />
Em muốn n&oacute;i Em y&ecirc;u anh&nbsp;<br />
Khi men c&ograve;n trong hơi thở&nbsp;<br />
Lại gần h&ocirc;n anh đi.&nbsp;</p>

<p>Khi con tim kh&ocirc;ng c&ograve;n tr&ecirc;n đầu&nbsp;<br />
Khi hai m&aacute; em h&acirc;y h&acirc;y&nbsp;<br />
Em n&oacute;i em say tiếng đ&agrave;n&nbsp;<br />
Vậy lại gần h&ocirc;n anh đi.&nbsp;</p>

<p>Lại gần h&ocirc;n anh&nbsp;<br />
Anh sẽ để em mặt trời&nbsp;<br />
Lại gần h&ocirc;n anh&nbsp;<br />
Hay em để anh chơi vơi.&nbsp;</p>

<p>Giờ c&ograve;n đ&ocirc;i ta&nbsp;<br />
Kia l&agrave; n&uacute;i đ&acirc;y l&agrave; nh&agrave;&nbsp;<br />
Giờ c&ograve;n đ&ocirc;i ta&nbsp;<br />
Em c&oacute; muốn đi thật xa?&nbsp;</p>

<p>Khi đ&ocirc;i m&ocirc;i em c&ograve;n đỏ mọng&nbsp;<br />
Em muốn n&oacute;i Em y&ecirc;u Anh&nbsp;<br />
Khi men c&ograve;n trong hơi thở&nbsp;<br />
Lại gần h&ocirc;n anh đi.&nbsp;</p>

<p>Khi đ&ocirc;i m&ocirc;i em c&ograve;n đỏ mọng&nbsp;<br />
Khi anh n&oacute;i Anh y&ecirc;u Em&nbsp;<br />
Khi anh ta c&ograve;n say giấc nồng&nbsp;<br />
Lại gần h&ocirc;n anh đi.</p>
', 1885, 43, N'2008.mp3', 1, NULL, 1030, 184, 892)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2009, N'Nếu Ta Ngược Lối', N'<p>M&igrave;nh đ&atilde; từng l&agrave; của nhau, ngỡ bền l&acirc;u&nbsp;<br />
V&agrave; đ&atilde; y&ecirc;u nhau thật đậm s&acirc;u&nbsp;<br />
Y&ecirc;u hết trọn cuộc đời n&agrave;y, hứa kh&ocirc;ng đổi thay&nbsp;<br />
M&agrave; nay em bước như vậy&nbsp;</p>

<p>Anh cố nhặt lại kỷ niệm, em đ&aacute;nh rơi&nbsp;<br />
D&ugrave; biết em chẳng c&ograve;n nghĩ tới&nbsp;<br />
Ta đ&atilde; nhiều lần trải qua, bao nhi&ecirc;u x&oacute;t xa&nbsp;<br />
M&agrave; nay sao ta gục ng&atilde;.&nbsp;</p>

<p>[ĐK:]&nbsp;<br />
Tự cho nhau hai đường lối, nếu y&ecirc;u nhau sẽ trở về b&ecirc;n nhau th&ocirc;i&nbsp;<br />
D&ugrave; anh c&oacute; n&iacute;u k&eacute;o em cũng xa rồi&nbsp;<br />
Dăn l&ograve;ng sẽ kh&ocirc;ng bu&ocirc;ng, nhủ long sẽ kh&ocirc;ng bu&ocirc;ng&nbsp;<br />
Đ&agrave;nh v&ugrave;i ch&ocirc;n k&yacute; ức với niềm đau&nbsp;</p>

<p>Ng&agrave;y mai nếu lỡ gặp nhau, đừng bận l&ograve;ng anh chẳng sao đ&acirc;u&nbsp;<br />
Anh vội v&atilde; rồi lại ng&atilde; nơi tim em rồi&nbsp;<br />
Đoạn đường ngắn ph&iacute;a trước, c&ograve;n anh cứ m&atilde;i lối ngược&nbsp;<br />
Nếu y&ecirc;u nhau sẽ trở về b&ecirc;n nhau.</p>
', 7867, 81, N'2009.mp3', 1, NULL, 2040, 25, 768)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2010, N'Anh Chẳng Sao Mà', N'<p>C&oacute; lẽ h&ocirc;m nay anh kh&ocirc;ng hề muốn<br />
Nhưng chuyện t&igrave;nh y&ecirc;u ch&uacute;ng ta đang c&oacute; những gi&acirc;y ph&uacute;t rất buồn.<br />
Đ&atilde; đến với nhau trong sự lặng im<br />
Thế b&acirc;y giờ m&igrave;nh n&ecirc;n c&aacute;ch xa trong im lặng?<br />
Nh&igrave;n những thứ đ&aacute;ng lẽ l&agrave; của ri&ecirc;ng anh<br />
M&agrave; l&acirc;u nay anh thấy em trao tặng ai<br />
Người h&atilde;y n&oacute;i tất cả l&agrave; tại anh sai đi<br />
Để khi xa rời anh ko thấy đau trong l&ograve;ng</p>

<p>Thật l&ograve;ng ngỡ b&ecirc;n nhau trăm năm<br />
Cớ sao mọi chuyện đi qu&aacute; xa xăm<br />
Tồn tại giữa c&ocirc; đơn kh&ocirc;ng em l&agrave; điều rất kh&oacute;<br />
Phải chăng đ&atilde; thương em y&ecirc;u em qu&aacute; l&acirc;u n&ecirc;n giờ ch&aacute;n ng&aacute;n t&ecirc;n nhau<br />
Em đ&atilde; kh&ocirc;ng cần anh b&ecirc;n cạnh về sau</p>

<p>Ng&agrave;y c&ograve;n ấm y&ecirc;u thương b&ecirc;n nhau chẳng bao giờ ngờ sẽ c&oacute; h&ocirc;m nay<br />
Nh&igrave;n gi&acirc;y ph&uacute;t em quay lưng đi thật sự buồn lắm<br />
Trời xanh bỗng h&ocirc;m nay cho mưa giấu đi lệ nh&ograve;a trong l&uacute;c chia xa<br />
Em cứ đi đừng lo anh chẳng sao m&agrave; !</p>
', 2223, 155, N'2010.mp3', 1, NULL, 2, 290, 601)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2011, N'Em Vẫn Chưa Về', N'<p>Đồng hồ vừa t&iacute;ch tắc,&nbsp;<br />
Chỉ đến số 12 giờ&nbsp;<br />
Sao giấc ngủ đ&ecirc;m nay của anh&nbsp;<br />
Chợt kh&oacute; hơn như khi mọi ng&agrave;y,&nbsp;<br />
Rồi nhiều đ&ecirc;m qua như thế,&nbsp;<br />
Em đ&atilde; kh&ocirc;ng c&ograve;n như l&uacute;c xưa&nbsp;<br />
L&uacute;c em buồn đ&atilde; c&oacute; điều kh&aacute;c thay anh,&nbsp;<br />
X&oacute;a tan mỏi mệt&nbsp;</p>

<p>Đời hư ảo đưa em v&agrave;o cơn m&ecirc;,&nbsp;<br />
Gọi em đến b&ecirc;n ai s&aacute;t vai&nbsp;<br />
Mỗi ng&agrave;y như thế&nbsp;<br />
Em đều d&ugrave;ng cảm x&uacute;c ảo đề t&igrave;m niềm vui.&nbsp;<br />
Chạy theo những xa hoa ph&ugrave; du&nbsp;<br />
T&agrave;n tro của đ&ecirc;m em vẫn chưa về&nbsp;<br />
C&oacute; lẽ đ&ecirc;m nay sẽ l&agrave; đ&ecirc;m cuối m&agrave; anh nghĩ về em th&ocirc;i, anh phải đi rồi&nbsp;</p>

<p>Ng&agrave;y d&agrave;i vừa tắt nắng&nbsp;<br />
M&agrave;n đ&ecirc;m lại chợt &ugrave;a về&nbsp;<br />
L&ecirc; bước ch&acirc;n anh đi về nơi xa&nbsp;<br />
C&oacute; x&oacute;a hết kỷ niệm đ&atilde; qua.&nbsp;<br />
Rồi nhiều đ&ecirc;m qua như thế&nbsp;<br />
Em đ&atilde; kh&ocirc;ng c&ograve;n như l&uacute;c xưa,&nbsp;<br />
L&uacute;c em buồn đ&atilde; c&oacute; điều kh&aacute;c thay anh,&nbsp;<br />
X&oacute;a tan mỏi mệt.&nbsp;</p>

<p>Đời hư ảo đưa em v&agrave;o cơn m&ecirc;,&nbsp;<br />
Gọi em đến b&ecirc;n ai s&aacute;t vai&nbsp;<br />
Mỗi ng&agrave;y như thế&nbsp;<br />
Em đều d&ugrave;ng cảm x&uacute;c ảo đề t&igrave;m niềm vui.&nbsp;<br />
Chạy theo những xa hoa ph&ugrave; du&nbsp;<br />
T&agrave;n tro của đ&ecirc;m em vẫn chưa về&nbsp;<br />
C&oacute; lẽ đ&ecirc;m nay sẽ l&agrave; đ&ecirc;m cuối m&agrave; anh nghĩ về em th&ocirc;i, anh phải đi rồi&nbsp;</p>

<p><br />
Một liều thuốc đưa em v&agrave;o cơn m&ecirc;,&nbsp;<br />
gọi em đến b&ecirc;n ai s&aacute;t vai&nbsp;<br />
Mỗi ng&agrave;y như thế&nbsp;<br />
Em đều d&ugrave;ng cảm x&uacute;c ảo đề t&igrave;m niềm vui.&nbsp;<br />
Chạy theo những xa hoa ph&ugrave; du&nbsp;<br />
T&agrave;n tro của đ&ecirc;m em vẫn chưa về&nbsp;<br />
C&oacute; lẽ đ&ecirc;m nay sẽ l&agrave; đ&ecirc;m cuối m&agrave; anh nghĩ về em th&ocirc;i, anh phải đi rồi...</p>
', 1729, 245, N'2011.mp3', 1, NULL, 2041, 420, 130)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (2012, N'Yêu Em Dại Khờ', N'<p>Thức trắng đ&ecirc;m nay, c&oacute; lẽ do anh đang say.&nbsp;<br />
Biết n&oacute;i cho ai nghe đ&acirc;y bởi v&igrave; kh&ocirc;ng c&ograve;n được b&ecirc;n em mỗi ng&agrave;y.&nbsp;<br />
M&igrave;nh từng hứa sẽ vượt qua, vậy m&agrave; kết th&uacute;c rời xa.&nbsp;<br />
Cớ sao anh cứ mong chờ, anh đ&atilde; y&ecirc;u dại khờ.&nbsp;<br />
Từng c&ugrave;ng nhau đi qua gi&ocirc;ng b&atilde;o nhưng kh&ocirc;ng c&ograve;n thấy nhau khi mưa tan.<br />
Tại v&igrave; sao t&igrave;nh y&ecirc;u lu&ocirc;n khiến cho m&igrave;nh m&atilde;i tin v&agrave;o một giấc mơ.&nbsp;<br />
Ng&agrave;y em quay lưng bước đi mưa rơi ướt nh&ograve;e l&ecirc;n tr&ecirc;n kh&oacute;e mi.&nbsp;<br />
V&igrave; khi y&ecirc;u chẳng cần l&yacute; tr&iacute; mặc kệ con tim l&agrave;m điều v&ocirc; l&iacute;.&nbsp;<br />
Đừng trao nhau &acirc;n &aacute;i nhạt m&agrave;u, đừng để tr&aacute;i tim cứ m&atilde;i u sầu.&nbsp;<br />
C&oacute; đ&ocirc;i khi mệt qu&aacute; ta muốn rời xa h&atilde;y nhớ l&iacute; do v&igrave; sao hai ta bắt đầu.&nbsp;<br />
Lời chia tay muốn n&oacute;i th&agrave;nh lời v&agrave; em cũng đau khi ta xa rời.&nbsp;<br />
Phải kh&ocirc;ng người ơi??&nbsp;<br />
Lệ rơi tim anh chơi vơi...&nbsp;<br />
V&igrave; anh đ&atilde; y&ecirc;u em dại khờ, d&ugrave; bơ vơ...&nbsp;<br />
T&igrave;nh y&ecirc;u ấy m&atilde;i kh&ocirc;ng phai mờ, anh lu&ocirc;n t&ocirc;n thờ. Chẳng thể x&oacute;a đi những vui cười ng&agrave;y n&agrave;o b&ecirc;n em.&nbsp;<br />
C&agrave;ng kh&ocirc;ng muốn tương lai y&ecirc;u người n&agrave;o kh&aacute;c em.&nbsp;<br />
V&igrave; anh đ&atilde; y&ecirc;u em dại khờ khờ khờ uh oh oh...<br />
Đ&atilde; y&ecirc;u em dại khờ khờ khờ uh oh oh....&nbsp;<br />
V&igrave; anh đ&atilde; y&ecirc;u em dại khờ khờ uh oh oh....&nbsp;<br />
Đ&atilde; y&ecirc;u em dại khờ khờ khờ uh oh oh</p>

<p>Rap:<br />
Thời gian qua nhiều phong ba l&agrave;m cho ta tự g&acirc;y ra điều buồn b&atilde; lại c&atilde;i v&atilde; rồi chia xa&nbsp;<br />
Pick up the phone v&ocirc; t&igrave;nh giọng em vang l&ecirc;n&nbsp;<br />
Vậy nếu kh&ocirc;ng n&oacute;i g&igrave; th&ecirc;m th&ocirc;i từ nay n&ecirc;n qu&ecirc;n t&ecirc;n&nbsp;<br />
Stop it th&ocirc;i đừng n&oacute;i nhiều th&ecirc;m giờ qu&ecirc;n được chưa&nbsp;<br />
B&acirc;y giờ đ&atilde; qu&aacute; trễ để c&oacute; thể quay lại y&ecirc;u lần nữa&nbsp;<br />
Tạm biệt tất cả những lời hứa dối tr&aacute;&nbsp;<br />
Những g&igrave; đ&atilde; tr&ocirc;i qua&nbsp;<br />
Tấm h&igrave;nh cũ đ&ocirc;i ta&nbsp;<br />
X&oacute;a sạch hết ph&ocirc;i pha.</p>
', 3373, 317, N'2012.mp3', 1, NULL, 2042, 441, 406)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (5003, N'Sai Người Sai Thời Điểm', N'<p>Chuyện t&igrave;nh y&ecirc;u l&uacute;c n&agrave;o cũng thế.<br />
Đi m&atilde;i bao năm l&ecirc; th&ecirc; mong t&igrave;m được ai tr&ecirc;n lối về<br />
Để d&agrave;nh 1 đời y&ecirc;u thương trao về nhau kh&ocirc;ng vấn vương<br />
Chỉ mong rằng ta m&atilde;i b&ecirc;n cạnh d&ugrave; đời c&ograve;n bao gi&oacute; sương<br />
V&agrave; chuyện t&igrave;nh y&ecirc;u b&acirc;y giờ vẫn thế<br />
Anh vẫn lu&ocirc;n y&ecirc;u em th&ocirc;i dẫu em giờ đ&acirc;y đ&atilde; kh&aacute;c rồi<br />
T&igrave;nh y&ecirc;u m&agrave; anh vun v&eacute;n bao l&acirc;u<br />
Kết th&uacute;c khi em n&oacute;i c&acirc;u<br />
Em thấy ch&uacute;ng ta kh&ocirc;ng hợp m&igrave;nh chia tay nh&eacute;<br />
ĐK:<br />
M&igrave;nh gặp nhau đ&uacute;ng hay sai m&agrave; đ&atilde; chia hai<br />
Coi nhau như chẳng tồn tại<br />
Hợp nhau l&agrave; do m&igrave;nh th&ocirc;i lu&ocirc;n sống thứ tha v&igrave; nhau<br />
T&igrave;m được nhau dễ d&agrave;ng đ&acirc;u c&oacute; phải b&ecirc;n nhau 1 ng&agrave;y hay 4 5 h&ocirc;m?<br />
Nay em n&oacute;i c&acirc;u kh&ocirc;ng hợp l&agrave; do duy&ecirc;n số hay sao?<br />
Vậy em c&oacute; chắc bao năm mọi thứ y&ecirc;u thương em trao ri&ecirc;ng mỗi anh ko?<br />
M&igrave;nh gặp nhau sai thời gian v&agrave; sai người phải ko em?<br />
Nh&igrave;n người m&agrave; anh từng thương cứ thế đi xa từng bước tr&ecirc;n phố quen thuộc<br />
Một người đứng tr&ocirc;ng 1 người khuất xa dần</p>
', 3174, 299, N'5003.mp3', 1, NULL, 2, 337, 198)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (5004, N'Quan Trọng Là Thần Thái', N'<p>Quan trọng phải l&agrave; thần th&aacute;i<br />
Quan trọng khi l&agrave; con g&aacute;i ,&nbsp;<br />
Bao giờ y&ecirc;u th&igrave; lu&ocirc;n đ&uacute;ng , chẳng bao giờ thấy sai<br />
Quan trọng vẫn l&agrave; thần th&aacute;i<br />
Khi m&igrave;nh y&ecirc;u l&agrave; con trai ,&nbsp;<br />
Dẫu người ta gọi m&igrave;nh &aacute;i , cũng chẳng c&oacute; g&igrave; để sai.</p>

<p>Tốt hơn l&agrave; m&igrave;nh thấy thần th&aacute;i nằm đ&acirc;u<br />
Tốt hơn l&agrave; m&igrave;nh thấy thần th&aacute;i đậm s&acirc;u<br />
Tốt hơn l&agrave; m&igrave;nh thấy thần th&aacute;i nằm đ&acirc;u ,thấy thần th&aacute;i nằm đ&acirc;u ,thấy thần th&aacute;i như n&agrave;o</p>

<p>Quan trọng ! vẫn l&agrave; c&aacute;i thần th&aacute;i<br />
Quan trọng ! vẫn l&agrave; c&aacute;i thần th&aacute;i<br />
Ai khen ch&ecirc; cứ mặc kệ , m&igrave;nh cứ ngầu c&oacute; g&igrave; phải ngần ngại<br />
V&igrave; m&igrave;nh đẹp chỗ n&agrave;o tự m&igrave;nh biết , m&igrave;nh xấu chỗ n&agrave;o cũng m&igrave;nh biết&nbsp;<br />
C&aacute;i g&igrave; của m&igrave;nh tự m&igrave;nh quyết để t&acirc;m l&agrave;m g&igrave; mấy lời kh&ocirc;ng cần thiết<br />
Bởi cơ bản x&atilde; hội vốn thị phi , bất kể l&agrave; chuyện lớn hay l&agrave; việc li ti<br />
M&igrave;nh l&agrave;m g&igrave; đi nữa th&igrave; họ vẫn dị nghị , thế n&ecirc;n kệ đi hơi đ&acirc;u m&agrave; suy nghĩ</p>

<p>Quan trọng nhất kh&ocirc;ng phải vẻ bề ngo&agrave;i<br />
Xấu , đẹp , ch&acirc;n ngắn hay ch&acirc;n d&agrave;i<br />
M&igrave;nh đang chơi hay l&agrave; đứng gần ai<br />
M&agrave; quan trọng l&agrave;...</p>

<p>Biển người biển khẩu lung tung , đ&uacute;ng hay sai miệng đời vẫn dậy s&oacute;ng<br />
Tốt nhất bản th&acirc;n cứ ung dung , để ra đường n&atilde;o bộ c&ograve;n bay bổng<br />
Nếu cong kh&ocirc;ng thẳng th&igrave; đ&atilde; sao ?<br />
Lỡ thua kh&ocirc;ng thắng th&igrave; đ&atilde; sao ?<br />
Đen đ&uacute;a kh&ocirc;ng trắng th&igrave; đ&atilde; sao ?<br />
M&igrave;nh vẫn sống v&agrave; đầu cứ ngẩng cao...<br />
D&ugrave; l&ecirc;n voi , hay xuống ch&oacute; , nh&agrave; m&igrave;nh gi&agrave;u hay kh&ocirc;ng bằng ch&uacute;ng n&oacute;</p>

<p>Bước ra đường , vẫn phải tỉnh , d&ugrave; cho c&oacute; bao nhiều thằng đứng ng&oacute;<br />
V&igrave; quan trọng kh&ocirc;ng phải vẻ bề ngo&agrave;i<br />
Xấu , đẹp , ch&acirc;n ngắn hay ch&acirc;n d&agrave;i<br />
M&igrave;nh đang chơi hay l&agrave; đứng gần ai<br />
M&agrave; quan trọng l&agrave; l&agrave; l&agrave;...</p>

<p><br />
Chơi l&ecirc;n chơi l&ecirc;n .... Ai ko chơi anh em tui chơi</p>

<p><br />
....<br />
Quan trọng phải l&agrave; thần th&aacute;i ,<br />
quan trọng phải l&agrave; thần th&aacute;i ,<br />
quan trọng vẫn l&agrave; thần th&aacute;i....</p>
', 1303, 339, N'5004.mp3', 1, NULL, 2, 290, 822)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (5005, N'Làm Người Yêu Em Nhé Baby', N'<p>L&Agrave;M NGƯỜI Y&Ecirc;U EM NH&Eacute;<br />
ST Nguy&ecirc;n Jenda</p>

<p>Người y&ecirc;u ơi y&ecirc;u m&igrave;nh em được kh&ocirc;ng<br />
Từ giờ v&agrave; sau n&agrave;y gi&oacute; lạnh nơi đ&acirc;y m&ugrave;a đ&ocirc;ng<br />
L&agrave; ng&agrave;y ta sum vầy con tim hao gầy<br />
T&igrave;nh y&ecirc;u đong đầy<br />
H&atilde;y để anh chứng minh cho em thấy<br />
Người y&ecirc;u ơi!<br />
Y&ecirc;u th&igrave; c&oacute; g&igrave; sai đ&acirc;u c&oacute; sai đ&acirc;u,<br />
kh&ocirc;ng l&agrave; em th&igrave; ai<br />
Để em đưa anh về, l&agrave; t&igrave;nh y&ecirc;u m&atilde;i m&ecirc;<br />
Mặc kệ người ta cười ch&ecirc;<br />
Bởi v&igrave; t&igrave;nh y&ecirc;u l&agrave; thế<br />
L&agrave;m người y&ecirc;u em nh&eacute; baybe.</p>

<p>Anh l&agrave; em, c&ograve;n em th&igrave;<br />
Anh l&agrave; em c&ograve;n em th&igrave; ngồi ngẫn ngơ nh&igrave;n khu&ocirc;n mặt<br />
Ng&acirc;y thơ đ&oacute; anh hẫn hờ qu&aacute; n&ecirc;n em mới sợ bơ vơ<br />
Đợi chờ đ&ocirc;i mắt ngoan anh ngại ng&ugrave;ng ng&oacute; sang<br />
Em thẫn thờ, bơ phờ đ&ocirc;i mắt mơ<br />
Em đ&atilde; cố đổi thay để mạnh mẽ hơn v&igrave; em sợ<br />
C&ocirc; đơn n&oacute;i y&ecirc;u m&ocirc;i hồng mắt c&ocirc;ng bờ m&ocirc;i mộng<br />
Rất kh&oacute; v&igrave; lo trong tr&aacute;i tim anh đ&atilde; c&oacute; ai<br />
Nhưng người y&ecirc;u anh l&agrave; sai th&igrave; em đ&acirc;y<br />
Kh&ocirc;ng cần đ&uacute;ng.</p>
', 571, 110, N'5005.mp3', 1, 1, 2042, 287, 794)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (5006, N'Biết Khóc Với Ai', N'<p>BIẾT KH&Oacute;C V&Igrave; AI<br />
ST Wendy Thảo</p>

<p>Em vẫn biết tr&aacute;i tim anh kh&ocirc;ng l&agrave; của em<br />
M&agrave; sao cứ nhớ<br />
Em vẫn biết nghĩ suy trong anh chẳng l&agrave; em<br />
M&agrave; sao cứ mong<br />
Sao đ&ocirc;i tay ng&agrave;y ấy<br />
Nỡ bỏ mặc em giữ đ&ecirc;m quạnh hi&ecirc;u<br />
Quay lưng đi chẳng lời chia ly<br />
Để lại nhữngk k&yacute; ức vun vỡ<br />
Anh c&oacute; thấy x&oacute;t xa khi em<br />
Đang gục ng&atilde; tận trong đau đớn<br />
Anh c&oacute; thấy tổn thương khi đ&atilde;<br />
L&agrave;m cuộc sống của em mất đi<br />
Em đ&atilde; kh&ocirc;ng l&agrave; em mạnh mẽ&nbsp;<br />
Hồn nhi&ecirc;n trước kia của anh<br />
Đ&ocirc;i m&ocirc;i trao ng&agrave;n lời y&ecirc;u thương<br />
Giờ l&agrave;m tổn thương em như thế<br />
Giọt nước mắt ấy rơi khi người đi<br />
V&agrave; ai quay bước quay đi kh&ocirc;ng cần chi<br />
Chuyện h&ocirc;m qua anh b&ecirc;n ai vậy m&agrave;<br />
L&agrave;m sao c&oacute; thể xem như chưa xảy ra<br />
Giờ tr&aacute;ch m&oacute;c c&oacute; đổi thay được đ&acirc;u<br />
L&ograve;ng tin đ&atilde; mất, mất cả những đậm s&acirc;u<br />
Buồn nhưng biết kh&ocirc;ng phải ai giờ đ&acirc;y<br />
V&igrave; người m&igrave;nh y&ecirc;u nhất cũng đ&atilde; mang đổi thay</p>
', 8206, 371, N'5006.mp3', 1, 1, 1022, 28, 106)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (5007, N'Anh Mơ', N'<p>5007</p>
', 5118, 210, N'5007.mp3', 1, 2, 2043, 22, 96)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (5008, N'Anh Yêu Em', NULL, 5282, 324, N'5008.mp3', 1, 2, 2043, 8, 77)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (5009, N'Nhớ', NULL, 9775, 54, N'5009.mp3', 1, 2, 2043, 294, 567)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6028, N'asd', N'<p>fggfgf</p>
', 8799, 59, N'20190513112440.mp3', 0, NULL, 1016, 491, 870)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6029, N'Âm thầm bên em', N'<p>Khi b&ecirc;n anh em thấy điều chi?<br />
Khi b&ecirc;n anh em thấy điều g&igrave;?<br />
Nước mắt rơi gần kề l&agrave;n mi<br />
Chẳng c&ograve;n những gi&acirc;y ph&uacute;t, chẳng c&ograve;n những &acirc;n t&igrave;nh<br />
Gi&oacute; mang em rời xa nơi đ&acirc;y...</p>

<p>Khi xa anh em nhớ về ai?<br />
Khi xa anh em nhớ một người<br />
Chắc kh&ocirc;ng phải một người như anh<br />
Người từng l&agrave;m em kh&oacute;c, người từng khiến em buồn<br />
Bu&ocirc;ng b&agrave;n tay,rời xa lặng thinh bước đi...</p>

<p>[chorus]<br />
Hạt mưa rơi bủa v&acirc;y tr&aacute;i tim hiu quạnh<br />
Ng&agrave;n y&ecirc;u thương vụt tan bỗng xa<br />
Người từng n&oacute;i ở b&ecirc;n cạnh anh mỗi khi anh buồn<br />
Cớ sao giờ lời n&oacute;i kia như gi&oacute; bay<br />
Đừng bỏ rơi b&agrave;n tay ấy bơ vơ m&agrave;<br />
Một m&igrave;nh anh lặng im chốn đ&acirc;y<br />
Y&ecirc;u em &acirc;m thầm b&ecirc;n em...</p>

<p>[rap]<br />
Y&ecirc;u thương kh&ocirc;ng c&ograve;n nơi đ&acirc;y<br />
Mang t&igrave;nh buồn theo m&acirc;y<br />
Cơn mơ về<br />
Mong manh c&acirc;u thề<br />
Tan tr&ocirc;i qua mau qu&ecirc;n đi ph&uacute;t gi&acirc;y<br />
Mưa rơi tr&ecirc;n đ&ocirc;i mi qua lối vắng<br />
&Aacute;nh s&aacute;ng mờ bu&ocirc;ng lơi L&agrave;n kh&oacute;i trắng<br />
B&oacute;ng d&aacute;ng em,nụ cười ng&agrave;y h&ocirc;m qua, k&iacute; ức c&oacute; ngủ qu&ecirc;n ch&igrave;m trong m&agrave;n sương đắng.?<br />
Anh nhớ giọt nước mắt s&acirc;u lắng<br />
Anh nhớ nỗi buồn của em ng&agrave;y kh&ocirc;ng nắng</p>

<p>[chorus]<br />
Hạt mưa rơi bủa v&acirc;y tr&aacute;i tim hiu quạnh<br />
Ng&agrave;n y&ecirc;u thương vụt tan bỗng xa<br />
Người từng n&oacute;i ở b&ecirc;n cạnh anh mỗi khi anh buồn<br />
Cớ sao giờ lời n&oacute;i kia như gi&oacute; bay<br />
Đừng bỏ rơi b&agrave;n tay ấy bơ vơ m&agrave;<br />
Cầm b&ocirc;ng hoa chờ mong nhớ thương<br />
L&agrave;m sao qu&ecirc;n người ơi, t&igrave;nh anh m&atilde;i như h&ocirc;m n&agrave;o<br />
Vẫn y&ecirc;u người v&agrave; vẫn mong em về đ&acirc;y...</p>

<p>[coda]<br />
Giọt nước mắt tại sao cứ lăn rơi ho&agrave;i<br />
Ở b&ecirc;n anh chỉ c&oacute; đớn đau<br />
Th&igrave; anh xin nhận hết ng&agrave;n đau đớn để thấy em cười<br />
Dẫu biết rằng người đến kh&ocirc;ng như giấc mơ<br />
Y&ecirc;u em &acirc;m thầm b&ecirc;n em...</p>

<p>Th&igrave; anh xin nhận hết ng&agrave;n đau đớn để thấy em cười<br />
Dẫu biết rằng người đến kh&ocirc;ng như giấc mơ<br />
Y&ecirc;u em &acirc;m thầm b&ecirc;n em...</p>
', 8053, 123, N'20190514073248.mp3', 1, NULL, 2053, 38, 921)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6030, N'Một Bước Yêu Vạn Dặm Đau', N'<p>(Intro:<br />
H&ocirc;m nay...&nbsp;<br />
D&agrave;nh hết lầm lỗi để chia tay<br />
T&igrave;nh ta từ nay vỡ đ&ocirc;i<br />
Một d&ograve;ng nước mắt lăn chạm qua m&ocirc;i...)</p>

<p>Lời 1:<br />
Một thế giới hư ảo, nhưng thật ấm &aacute;p<br />
Em xuất hiện khiến những băng gi&aacute; đời anh bỗng dần tan đi<br />
Cuộc đời anh đặt t&ecirc;n l&agrave; Muộn Phiền<br />
n&ecirc;n l&agrave;m sao d&aacute;m mơ m&igrave;nh may mắn được trọn vẹn c&ugrave;ng em<br />
Ta phải xa em mặc kệ nước mắt em rơi<br />
V&igrave; những nguy&ecirc;n do cả đời kh&ocirc;ng d&aacute;m đối diện</p>

<p>Chỉ c&ograve;n v&agrave;i gang tấc nhưng lại xa x&ocirc;i<br />
T&igrave;nh m&igrave;nh tựa đ&ocirc;i đũa lệch đ&agrave;nh bu&ocirc;ng tr&ocirc;i<br />
Cầu mong em sẽ sớm qu&ecirc;n được tất cả<br />
T&igrave;m thấy một người xứng đ&aacute;ng ở b&ecirc;n...</p>

<p>Chorus:<br />
Từ nay duy&ecirc;n kiếp bỏ lại ph&iacute;a sau<br />
Ng&agrave;y v&agrave; b&oacute;ng tối chẳng c&ograve;n kh&aacute;c nhau<br />
Chẳng c&oacute; nơi n&agrave;o y&ecirc;n b&igrave;nh được như em b&ecirc;n anh<br />
(T&igrave;nh y&ecirc;u một lần lỡ bước<br />
l&agrave; mu&ocirc;n dặm trường đau thương...)</p>

<p>Hạt mưa bỗng h&oacute;a th&agrave;nh m&agrave;u nỗi đau<br />
Trời như muốn kh&oacute;c ng&agrave;y m&igrave;nh mất nhau<br />
C&oacute; bao nhi&ecirc;u đ&ocirc;i ng&ocirc;n t&igrave;nh, cớ sao l&igrave;a xa m&igrave;nh ta?</p>

<p>(Giang tấu:<br />
L&agrave; nh&acirc;n duy&ecirc;n Trời ban cớ sao m&igrave;nh chẳng thể th&agrave;nh đ&ocirc;i...)</p>

<p>Lời 2:<br />
Tại sao qu&aacute; ngu ngốc bỏ lại mảnh gh&eacute;p&nbsp;<br />
m&agrave; đối với nhau l&agrave; tất cả c&ograve;n m&igrave;nh th&igrave; vụn vỡ...<br />
Thế giới thực tại ồn &agrave;o vẫn thấy c&ocirc; đơn<br />
C&ograve;n hai ta th&igrave; kh&aacute;c, chỉ nh&igrave;n th&ocirc;i tim đ&atilde; thấu</p>

<p>Chorus cuối:<br />
Từ nay ranh giới của hai ch&uacute;ng ta l&agrave;&nbsp;<br />
y&ecirc;u nhưng kh&ocirc;ng thể n&agrave;o bước qua<br />
Ngọn cỏ ven đường th&ocirc;i m&agrave; l&agrave;m sao với được m&acirc;y...</p>

<p>Từ sau c&acirc;u gi&atilde; từ &ecirc;m &aacute;i kia<br />
Chẳng cơn b&atilde;o lớn n&agrave;o bằng b&atilde;o l&ograve;ng..<br />
Gặp trong mơ m&agrave; cũng kh&ocirc;ng d&aacute;m g&agrave;o l&ecirc;n: &quot;anh thương em...&quot;</p>
', 2368, 150, N'20190518202848.mp3', 1, NULL, 1018, 284, 458)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6031, N'Đừng Yêu Nữa, Em Mệt Rồi', N'<p>Verse 1<br />
Đ&atilde; bao giờ anh nghe, c&oacute; v&agrave;i điều khi y&ecirc;u<br />
Một l&agrave; kh&ocirc;ng n&oacute;i dối, hai l&agrave; ko n&oacute;i dối nhiều lần<br />
Cớ sao to&agrave;n thấy nước mắt<br />
Cớ sao to&agrave;n những vết cắt<br />
C&oacute; lẽ n&agrave;o đến l&uacute;c, khi hai ta đ&atilde; hết y&ecirc;u<br />
Cứ đi rồi sẽ đến, cứ im lặng sẽ qua<br />
Một người như thế đấy<br />
Y&ecirc;u l&agrave; y&ecirc;u đến hết đời n&agrave;y<br />
Em kh&ocirc;ng l&agrave; thế giới ấy<br />
Em thật l&agrave; nhỏ b&eacute; th&ocirc;i<br />
Tại sao em cứ ấp &uacute;ng m&atilde;i kh&ocirc;ng bao giờ n&oacute;i ra</p>

<p>Chorus 1<br />
C&oacute; lẽ em y&ecirc;u anh nhiều qu&aacute;<br />
N&ecirc;n l&agrave; em chẳng d&aacute;m bu&ocirc;ng ra<br />
C&oacute; lẽ anh thấy em mạnh mẽ<br />
N&ecirc;n l&agrave; anh chẳng muốn vỗ về<br />
Y&ecirc;u anh bằng trọn con tim ấy<br />
Đớn đau nhiều lắm anh biết kh&ocirc;ng?<br />
Cứ cho đi rồi nhận ra tim em vỡ đ&ocirc;i th&ecirc;m đau<br />
C&oacute; lẽ kh&ocirc;ng n&ecirc;n y&ecirc;u nhiều thế<br />
Bởi t&igrave;nh y&ecirc;u sẽ n&oacute;i em nghe<br />
Với tr&aacute;i tim ưu tư vụn vỡ<br />
N&ecirc;n l&agrave;m quen với những bơ vơ<br />
C&oacute; khi chỉ v&igrave; anh kh&ocirc;ng xứng đ&aacute;ng với ba chữ Y&Ecirc;U nữa rồi<br />
Thế th&ocirc;i em xin dừng lại đừng y&ecirc;u nữa nh&eacute; anh ơi<br />
Em mệt rồi&hellip;</p>

<p>Verse 2<br />
Cứ đi rồi sẽ đến, cứ im lặng sẽ qua<br />
Một người như thế đấy<br />
Y&ecirc;u l&agrave; y&ecirc;u đến hết đời n&agrave;y<br />
Em kh&ocirc;ng l&agrave; thế giới ấy<br />
Em thật l&agrave; nhỏ b&eacute; th&ocirc;i<br />
Tại sao em cứ ấp &uacute;ng m&atilde;i kh&ocirc;ng bao giờ n&oacute;i ra<br />
Chorus 2<br />
C&oacute; lẽ em y&ecirc;u anh nhiều qu&aacute;<br />
N&ecirc;n l&agrave; em chẳng d&aacute;m bu&ocirc;ng ra<br />
C&oacute; lẽ anh thấy em mạnh mẽ<br />
N&ecirc;n l&agrave; anh chẳng muốn vỗ về<br />
Y&ecirc;u anh bằng trọn con tim ấy<br />
Đớn đau nhiều lắm anh biết kh&ocirc;ng?<br />
Cứ cho đi rồi nhận ra tim em vỡ đ&ocirc;i th&ecirc;m đau</p>

<p>C&oacute; lẽ kh&ocirc;ng n&ecirc;n y&ecirc;u nhiều thế<br />
Bởi t&igrave;nh y&ecirc;u sẽ n&oacute;i em nghe<br />
Với tr&aacute;i tim ưu tư vụn vỡ<br />
N&ecirc;n l&agrave;m quen với những bơ vơ<br />
C&oacute; khi chỉ v&igrave; anh kh&ocirc;ng xứng đ&aacute;ng với ba chữ Y&Ecirc;U nữa rồi<br />
Thế th&ocirc;i em xin dừng lại đừng y&ecirc;u nữa nh&eacute; anh ơi<br />
Em mệt rồi&hellip;</p>

<p>Bridge<br />
Đ&ocirc;i khi em nghĩ<br />
Thật l&ograve;ng em muốn c&aacute;m ơn anh v&igrave; đ&atilde; b&ecirc;n em ng&agrave;y qua<br />
Dừng lại th&ocirc;i chỉ mong t&igrave;m lại một ch&uacute;t b&igrave;nh y&ecirc;n</p>

<p>Chorus 3<br />
C&oacute; lẽ kh&ocirc;ng n&ecirc;n y&ecirc;u nhiều thế<br />
Bởi t&igrave;nh y&ecirc;u sẽ n&oacute;i em nghe<br />
Với tr&aacute;i tim ưu tư vụn vỡ<br />
N&ecirc;n l&agrave;m quen với những bơ vơ<br />
C&oacute; khi chỉ v&igrave; anh kh&ocirc;ng xứng đ&aacute;ng với ba chữ Y&Ecirc;U nữa rồi<br />
Thế th&ocirc;i em xin dừng lại đừng y&ecirc;u nữa nh&eacute; anh ơi<br />
Em mệt rồi&hellip;</p>
', 6338, 195, N'20190519175533.mp3', 1, NULL, 1013, 383, 619)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6035, N'Bạc Phận', N'<p>Ai gieo t&igrave;nh n&agrave;y, ai mang t&igrave;nh n&agrave;y, để lệ tr&ecirc;n kh&oacute;e mi cay&nbsp;<br />
Ai đưa về nh&agrave;, ai cho ngọc ng&agrave;, giờ người xa c&aacute;ch ta<br />
Từng l&agrave; một thời thiếu nữ trong v&ugrave;ng qu&ecirc; ngh&egrave;o<br />
Hồn nhi&ecirc;n c&agrave;i hoa m&aacute;i đầu<br />
D&ograve;ng người vội v&agrave;ng em h&oacute;a th&acirc;n đời bẽ b&agrave;ng<br />
Rời xa t&igrave;nh anh năm th&aacute;ng &hellip;</p>

<p>Đk :<br />
&Ocirc;i ph&uacute;t gi&acirc;y tương ph&ugrave;ng anh nhớ v&agrave; mong<br />
D&ograve;ng lưu b&uacute;t năm xưa in dấu m&atilde;i đậm s&acirc;u<br />
Trong nỗi đau anh mệt nho&agrave;i<br />
Trong ph&uacute;t gi&acirc;y anh t&igrave;m ho&agrave;i<br />
Muốn giữ em ở lại một lần n&agrave;y v&igrave; anh m&atilde;i thương<br />
Xa c&aacute;ch nhau thật rồi sương trắng chiều thu<br />
Ng&agrave;y em bước ra đi nước mắt ấy biệt li<br />
Hoa vẫn rơi b&ecirc;n thềm nh&agrave;<br />
L&aacute; x&aacute;t xơ đi nhiều v&agrave;<br />
Anh ch&uacute;c em y&ecirc;n b&igrave;nh mối t&igrave;nh m&igrave;nh hẹn em kiếp sau &hellip;</p>

<p>Tho&aacute;ng tho&aacute;ng, ng&agrave;y mi&ecirc;ng mang, giờ con nước d&agrave;i th&ecirc;nh thang<br />
Kh&ocirc;ng tr&aacute;ch, người kh&ocirc;ng thương, m&agrave; hương t&oacute;c c&ograve;n vương vương</p>

<p>Rap:<br />
Gửi tặng em m&agrave;u son cỏ dại<br />
Ch&uacute;t b&igrave;nh y&ecirc;n tr&ecirc;n m&ocirc;i bỏ lại<br />
Nước mắt n&agrave;o thấm đẩm cả hai vai<br />
Mắt phượng m&agrave;y ng&agrave;i người phải t&igrave;m đến thi&ecirc;n thai<br />
&Agrave; ơi c&acirc;u h&aacute;t em kh&ocirc;ng cần những lời khuy&ecirc;n&nbsp;<br />
Em bu&ocirc;ng thả m&igrave;nh v&agrave; chẳng m&agrave;ng đến t&igrave;nh duy&ecirc;n&nbsp;<br />
Đời em phi&ecirc;u bạc đau đớn lắm l&uacute;c cũng v&igrave; tiền&nbsp;<br />
Thương th&acirc;n em khổ để một lần c&ugrave;ng ch&iacute; tuyến &hellip;</p>

<p><br />
Giờ em ở nơi khu&ecirc; ph&ograve;ng<br />
Ng&agrave;y mai nữa em theo chồng<br />
V&agrave; t&ocirc; m&aacute; em th&ecirc;m hồng &ocirc;i đớn đau l&ograve;ng &ocirc;i đớn đau l&ograve;ng<br />
B&igrave;nh minh dẫn em đi rồi&nbsp;<br />
V&ograve;ng xoay b&aacute;nh xe lu&acirc;n hồi&nbsp;<br />
Ho&agrave;ng h&ocirc;n khuất sau lưng đồi &ocirc;i vỡ tan rồi &ocirc;i vỡ tan rồi!</p>

<p>Một ng&agrave;y buồn m&acirc;y t&iacute;m, em về th&ocirc;n l&agrave;ng &hellip;&nbsp;<br />
Mẹ cha của em vỡ &ograve;a &hellip;<br />
Giọt lệ chạnh l&ograve;ng em kh&oacute;c, thương người sang đ&ograve;<br />
Hồng nhan bạc phận &ndash; s&oacute;ng gi&oacute;!&nbsp;</p>

<p>Đk :<br />
&Ocirc;i ph&uacute;t gi&acirc;y tương ph&ugrave;ng anh nhớ v&agrave; mong<br />
D&ograve;ng lưu b&uacute;t năm xưa in dấu m&atilde;i đậm s&acirc;u<br />
Trong nỗi đau anh mệt nho&agrave;i<br />
Trong ph&uacute;t gi&acirc;y anh t&igrave;m ho&agrave;i<br />
Muốn giữ em ở lại một lần n&agrave;y v&igrave; anh m&atilde;i thương<br />
Xa c&aacute;ch nhau thật rồi sương trắng chiều thu<br />
Ng&agrave;y em bước ra đi nước mắt ấy biệt li<br />
Hoa vẫn rơi b&ecirc;n thềm nh&agrave;<br />
L&aacute; x&aacute;t xơ đi nhiều v&agrave;<br />
Anh ch&uacute;c em y&ecirc;n b&igrave;nh mối t&igrave;nh m&igrave;nh hẹn em kiếp sau &hellip;</p>
', 9062, 275, N'20190520164038.mp3', 1, NULL, 1, 233, 946)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6036, N'Tìm Lại Bầu Trời', N'<p>T&Igrave;M LẠI BẦU TRỜI</p>

<p>Anh kh&oacute;c v&igrave; giờ đ&acirc;y anh đ&atilde; mất em rồi.<br />
Anh kh&oacute;c v&igrave; giờ đ&acirc;y em đ&atilde; xa thật rồi.<br />
Anh nhớ lời hẹn ước ta kh&ocirc;ng xa rời, m&agrave; giờ đ&acirc;y sao chỉ anh lẻ loi.<br />
Anh cứ cố gắng tại sao vẫn cứ xa vời.<br />
Anh v&agrave; em dường như ta đ&atilde; hết y&ecirc;u nhau rồi.<br />
Em h&atilde;y n&oacute;i cho anh nghe đi hỡi người y&ecirc;u ơi, tại sao giờ ch&uacute;ng ta l&igrave;a đ&ocirc;i.</p>

<p>Tại anh đ&atilde; v&ocirc; t&acirc;m hay tại anh kh&ocirc;ng quan t&acirc;m em mỗi ng&agrave;y.<br />
Để giờ đ&acirc;y khi lời anh n&oacute;i em kh&ocirc;ng tin anh nữa vậy<br />
Trong t&igrave;nh y&ecirc;u đ&ocirc;i l&uacute;c ta hay giận hờn anh biết<br />
Nhưng anh thấy giờ em kh&ocirc;ng c&ograve;n y&ecirc;u anh<br />
Vậy th&ocirc;i anh cho em đi về nơi em chưa bắt đầu ...<br />
nơi m&agrave; em khi chưa quen anh,anh thấy em vui hơn nhiều...<br />
anh xin lỗi v&igrave; đ&atilde; cướp mất khoảng trời của em<br />
Nhưng c&oacute; người sẽ cho em lại một bầu trời.</p>
', 2917, 345, N'20190520214829.mp3', 1, 6, 2047, 270, 665)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6037, N'Sẽ Không Còn Nữa', N'<p>Bao ng&agrave;y xa c&aacute;ch nhau L&agrave; anh vẫn đợi chờ gi&acirc;y ph&uacute;t em về<br />
Để anh được nh&igrave;n thấy em Được nghe n&oacute;i cười v&agrave; được &ocirc;m em m&atilde;i.<br />
Th&aacute;ng ng&agrave;y thiếu vắng anh Em c&oacute; nhớ kh&ocirc;ng ng&agrave;y ta vẫn b&ecirc;n nhau?<br />
Y&ecirc;u m&igrave;nh anh nh&eacute; em Chỉ cần thế th&ocirc;i l&agrave; anh hạnh ph&uacute;c lắm.&nbsp;<br />
Rồi từng ng&agrave;y qua đi em vẫn chưa về<br />
Chỉ c&ograve;n mỗi anh nơi đ&acirc;y m&agrave; th&ocirc;i<br />
V&igrave; sao hỡi em? tại sao thế em?&nbsp;<br />
[ĐK:]<br />
Đừng n&oacute;i c&acirc;u lừa dối<br />
Đừng bắt anh phải mong chờ<br />
Đừng tr&aacute;ch anh lặng thinh V&igrave; rằng em đ&atilde; v&ocirc; t&igrave;nh.&nbsp;<br />
Qua ng&agrave;y mai sẽ chỉ c&ograve;n lại đ&acirc;y<br />
Tr&ecirc;n con đường một m&igrave;nh anh đi.<br />
V&agrave; sẽ kh&ocirc;ng c&ograve;n nữa<br />
V&agrave; sẽ kh&ocirc;ng cần quay về<br />
V&agrave; sẽ kh&ocirc;ng chờ em<br />
V&agrave; đợi em y&ecirc;u nữa. Sẽ kh&ocirc;ng c&ograve;n g&igrave;<br />
Sẽ kh&ocirc;ng c&ograve;n g&igrave; đ&acirc;u...em y&ecirc;u.</p>
', 2677, 221, N'20190520214724.mp3', 1, 6, 2047, 58, 817)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6038, N'Sao Em Vô Tình', N'<p>Em về chưa? Đang ở đâu?<br />
Ngoài trời thì đổ mưa<br />
Bước chân người đi, xa dần xa<br />
Lệ nhòe trên khóe mi<br />
Em nói thương anh, yêu anh, vì anh<br />
Nắng hay mưa vẫn ở cạnh nhau<br />
Sao giờ đành khuất lối&nbsp;<br />
Chìm bóng tối, lệ chia phôi<br />
Hoa bàng rơi, mây mù giăng&nbsp;<br />
Tạm biệt hương tóc thơm<br />
Chúc em bình yên, mong tình duyên<br />
Ngọt ngào đôi cánh tay<br />
Cô bé năm xưa yêu anh giờ đây<br />
Hóa lung linh cơn gió nhẹ lay<br />
Em dịu dàng biết mấy<br />
Tà áo trắng, chiều tung bay<br />
Sao em vô tình anh quá em ơi!<br />
Con tim đau lòng thương lắm em ơi<br />
Tìm về lại một chút hương thơm<br />
Tìm về lại một chút ngây ngô<br />
Đợi chờ ai? Đợi chờ ai?<br />
Bên kia sông buồn mây trắng êm trôi<br />
Bao năm hẹn thề em có thương tôi?<br />
Mình hãy ngồi lại với nhau đi<br />
Chuyện trò một chút mai khi<br />
Dòng thời gian vô tình người mang<br />
Nơi đó anh chờ em!</p>

<p>Chúng ta sẽ yêu<br />
Nhưng đáng tiếc là ai khác<br />
Không phải nhìn nhau nữa đâu<br />
Duyên tình ta giờ phai nhạt<br />
Nơi cánh chim ùa về<br />
Nơi nỗi đau gần kề<br />
Chẳng đi cùng lề<br />
Vì thế như thằng hề<br />
Kệ cuộc đời này trôi cứ như áng mây<br />
Ngày bay đến nơi đó đây<br />
Xây giấc mơ với nhau<br />
Mà đau lắm em có hay!<br />
Thương thân ai bờ vai ngày xưa yêu thương<br />
Mà giờ đành xa xăm<br />
Muôn phương cuối con đường!<br />
Ngày hôm ấy người đã nói<br />
Lời chia tay, lệ hoen cay<br />
Lòng đau nhói, chẳng thể khóc&nbsp;<br />
Vì còn thương, vì còn yêu<br />
Giá như em đừng đi<br />
Giá như em ở đây<br />
Lắng nghe anh vài câu<br />
Trái tim anh đậm sâu<br />
Nhưng sao bây giờ khuất lối&nbsp;<br />
Chìm bóng tối, lệ chia phôi<br />
Sao em vô tình anh quá em ơi!<br />
Con tim đau lòng thương lắm em ơi<br />
Tìm về lại một chút hương thơm<br />
Tìm về lại một chút ngây ngô<br />
Đợi chờ ai? Đợi chờ ai?<br />
Bên kia sông buồn mây trắng êm trôi<br />
Bao năm hẹn thề em có thương tôi?<br />
Mình hãy ngồi lại với nhau đi<br />
Chuyện trò này một chút mai khi<br />
Dòng thời gian vô tình người mang<br />
Nơi đó anh chờ em!</p>

<p>Dù Thiên ý bắt ta phải xa nhau<br />
Mạnh mẽ bước nói anh chẳng sao đâu<br />
Lặng lẽ vớt ánh sáng phía trăng soi<br />
Đi về lẻ loi, cô đơn<br />
Một lần nữa để anh viết cho em<br />
Một lần nữa để anh nhớ tên em<br />
Một lần nữa thôi, một lần nữa thôi</p>

<p>Sao em vô tình anh quá em ơi!<br />
Con tim đau lòng thương lắm em ơi<br />
Tìm về lại một chút hương thơm<br />
Tìm về lại một chút ngây ngô<br />
Đợi chờ ai? Đợi chờ ai?<br />
Bên kia sông buồn mây trắng êm trôi<br />
Bao năm hẹn thề em có thương tôi?<br />
Mình hãy ngồi lại với nhau đi<br />
Chuyện trò này một chút mai khi<br />
Dòng thời gian vô tình người mang<br />
Nơi đó anh chờ em!</p>
', 2318, 102, N'20190521133928.mp3', 1, NULL, 1, 464, 411)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6039, N'Kiếp Rong Buồn', N'<p>M&ugrave;a thu qua từng chiếc l&aacute; bay về nơi chốn xa<br />
V&agrave; cơn gi&oacute; t&igrave;m l&atilde;ng qu&ecirc;n về nơi cuối trời<br />
Người y&ecirc;u hỡi giờ lối xưa c&ograve;n đ&acirc;u g&oacute;t hồng<br />
Kiếp rong buồn t&igrave;nh hoang vu m&atilde;i tr&ocirc;i ho&agrave;i về nơi xa<br />
C&ograve;n trong anh từng nỗi nhớ theo anh trong b&oacute;ng đ&ecirc;m<br />
Đường xưa bước, l&ograve;ng gi&aacute; băng từ nay mất người<br />
Người y&ecirc;u hỡi, đời đ&atilde; chia tay từ đ&acirc;y mất người<br />
C&ograve;n đ&acirc;u nữa, từng đ&ecirc;m nhớ giờ xa x&ocirc;i<br />
Người dấu y&ecirc;u</p>

<p>ĐK:&nbsp;</p>

<p>T&igrave;nh đ&atilde; bay, người c&oacute; hay<br />
Ngồi đếm l&aacute; rớt qua tầm tay, b&oacute;ng em đ&acirc;u rồi<br />
T&igrave;nh như gi&oacute; qua thềm<br />
Thu t&agrave;n l&aacute; kh&ocirc; rơi m&ugrave;a đ&atilde; xa<br />
M&igrave;nh mất nhau l&ograve;ng vẫn nhớ đấu ch&acirc;n người xưa<br />
Vẫn đ&acirc;u đ&acirc;y c&ograve;n<br />
Nồng ấm những con đường<br />
Đ&atilde; qua m&ugrave;a băng gi&aacute;<br />
Th&acirc;n anh kiếp rong buồn<br />
C&ograve;n trong anh<br />
Từng nỗi nhớ theo anh trong b&oacute;ng đ&ecirc;m<br />
Đường xưa bước, l&ograve;ng gi&aacute; băng từ nay mất người<br />
Người y&ecirc;u hỡi, đời đ&atilde; chia tay từ đ&acirc;y mất người<br />
Đ&atilde; kh&ocirc;ng c&ograve;n từng đ&ecirc;m nhớ<br />
Giờ xa x&ocirc;i người dấu y&ecirc;u</p>
', 3505, 232, N'20190521134716.mp3', 1, NULL, 2050, 384, 483)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6040, N'Tình Yêu Tìm Thấy (Cà Chớn, Anh Đừng Đi OST)', N'<p>Nếu kh&ocirc;ng c&ograve;n anh<br />
Bầu trời chẳng c&ograve;n xanh<br />
Nếu kh&ocirc;ng c&ograve;n anh<br />
Giấc mơ chẳng l&agrave;nh<br />
Ngắm những v&igrave; sao<br />
Tr&ecirc;n trời thật l&agrave; cao<br />
Nhốt ch&uacute;ng v&agrave;o mắt anh buồn n&ocirc;n nao<br />
Đừng qu&aacute; ồn &agrave;o nh&eacute;<br />
Để gi&oacute; th&igrave; th&agrave;o khẽ<br />
Để nụ h&ocirc;n ấm cho tim rung l&ecirc;n m&igrave;nh em lắng nghe<br />
M&igrave;nh y&ecirc;u thật rồi đấy<br />
Giấc mơ anh t&igrave;m thấy<br />
Ta nu&ocirc;i lớn nh&eacute; những giấc mơ th&agrave;nh đ&ocirc;i.</p>

<p>Đặt b&agrave;n tay l&ecirc;n tr&aacute;i tim em đi anh<br />
Cảm nhận từng mạch sống khi em y&ecirc;u anh<br />
Nơi đ&acirc;u b&igrave;nh y&ecirc;n bằng tim người m&igrave;nh nhớ thương<br />
Một lần y&ecirc;u d&agrave;nh hết thơ ng&acirc;y cho nhau.<br />
Tựa như s&oacute;ng d&acirc;ng nơi đại dương xanh<br />
Tr&oacute;i m&igrave;nh lại với nhau kh&ocirc;ng bu&ocirc;ng rời đ&acirc;u<br />
Bờ m&ocirc;i kia sưởi ấm cho ri&ecirc;ng anh th&ocirc;i<br />
B&agrave;n tay kia nhẹ vuốt m&aacute;i t&oacute;c &ecirc;m tr&ocirc;i<br />
Tim ch&aacute;y cạnh tim chẳng bao giờ tắt đ&acirc;u anh.<br />
Ng&agrave;y mai khi thức giấc em kh&ocirc;ng b&ecirc;n anh.<br />
M&igrave;nh em biết kh&ocirc;ng c&ograve;n ng&agrave;y tươi xanh.<br />
H&atilde;y tr&oacute;i m&igrave;nh lại với nhau.<br />
Kh&ocirc;ng bu&ocirc;ng rời đ&acirc;u...</p>
', 9927, 26, N'20190521135511.mp3', 1, NULL, 2052, 40, 247)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6041, N'Đạo Tướng Hành', N'<p>J&iacute;eg&ugrave;o jiǔch&oacute;ng ch&eacute;ngguān wǒ z&ugrave;o x&igrave;amǎ zh&egrave;ng hān&nbsp;<br />
K&agrave;n n&agrave; qīngpiāopiāo de yībǎi ch&egrave;n cā jiān bǎ q&uacute;n xiān&nbsp;<br />
T&agrave; b&igrave;an sānjiāng l&igrave;u &agrave;n j&igrave;e dāo guāng z&ugrave;o ch&uacute;an fān&nbsp;<br />
R&egrave;n l&ugrave;shuǐ j&igrave;nt&ograve;ule duǎn shān d&agrave;d&agrave;o p&igrave;n&igrave; siy&egrave;̌&nbsp;</p>

<p>Zhěn fēng s&ugrave; xuě duōn&iacute;an wǒ yǔ hǔ m&oacute;u zǎocān&nbsp;<br />
Līnzhe d&igrave;ao sǒu de &yacute;u x&iacute;an w&egrave;n w&ograve;l&oacute;ng jǐ liǎng q&iacute;an&nbsp;<br />
Shǔ zhōng daỳǔ l&iacute;anm&iacute;an guānw&agrave;i h&eacute;ng shī b&igrave;anyě&nbsp;<br />
Nǐ de x&igrave;ao x&igrave;ang yīt&iacute;ao &egrave; quǎn zh&ugrave;ang l&ugrave;anle wǒ xīnx&iacute;an&nbsp;</p>

<p>T&aacute;n huā yǐn y&ugrave;e f&ugrave;x&iacute;an zh&egrave; chūnxiāo y&agrave;ny&aacute;ng tiān&nbsp;<br />
D&agrave;i d&agrave;o m&egrave;ng xǐng sh&iacute;fēn zhēng yǎn tiějiǎ h&aacute;nỳi lǐnl&igrave;e&nbsp;<br />
Suy&ugrave;&agrave;n zhǐ g&eacute; yī j&igrave;an g&ugrave;xiāng j&igrave;ns&igrave; tiānbiān&nbsp;<br />
B&ugrave;zhī h&eacute;r&eacute;n qiǎn ch&agrave;ng n&ograve;ng x&iacute;an wǒ fǎng h&uacute;ang b&ugrave;kě q&iacute;an&nbsp;</p>

<p>Zhěn fēng s&ugrave; xuě duōn&iacute;an wǒ yǔ hǔ m&oacute;u zǎocān&nbsp;<br />
Līnzhe d&igrave;ao sǒu de &yacute;u x&iacute;an w&egrave;n w&ograve;l&oacute;ng jǐ liǎng q&iacute;an&nbsp;<br />
Shǔ zhōng daỳǔ l&iacute;anm&iacute;an guānw&agrave;i h&eacute;ng shī b&igrave;anyě&nbsp;<br />
Nǐ de x&igrave;ao x&igrave;ang yīt&iacute;ao &egrave; quǎn zh&ugrave;ang l&ugrave;an wǒ xīnx&iacute;an&nbsp;</p>

<p>Fēngyān w&agrave;nlǐ r&uacute; x&iacute;an zh&igrave; q&uacute;nx&iacute;ong x&igrave;a jiǔy&agrave;n&nbsp;<br />
X&igrave;ej&uacute;e c&egrave; xūn sh&iacute;&#39;&egrave;r zhuǎn xiǎng w&egrave;i nǐ q&igrave;e ỳuzān&nbsp;<br />
R&ugrave; x&igrave;ang jiān chī tāngm&igrave;an x&igrave;ao k&agrave;n chuāng biān fēi xuě&nbsp;</p>

<p>Qǔ yāo jiān m&iacute;ngzhū t&aacute;n shānqu&egrave; l&igrave; p&iacute;p&aacute; &yacute;u t&iacute;ng q&iacute;an&nbsp;<br />
R&ugrave; x&igrave;ang jiān chī tāngm&igrave;an x&igrave;ao k&agrave;n chuāng biān fēi xuě&nbsp;<br />
Qǔ yāo jiān m&iacute;ngzhū t&aacute;n shānqu&egrave; l&igrave; p&iacute;p&aacute; &yacute;u t&iacute;ng q&iacute;an</p>
', 9912, 22, N'20190521103332.mp3', 1, NULL, 2059, 497, 542)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6042, N'Duyên Sinh Ý Chuyển', NULL, 4674, 43, N'20190521103621.mp3', 1, NULL, 2061, 133, 413)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6043, N'Gió Nhẹ Hiểu Lòng Ta', N'<p>Qīngfēng zhī wǒ y&igrave;, ji&egrave; yīlǚ, pēngch&aacute; q&ugrave;.<br />
H&eacute;r&eacute;n xi&aacute;n b&agrave;o q&iacute;n, b&ugrave; xū tīng, xi&aacute;n w&agrave;i yīn.</p>

<p>Ru&ograve;sh&igrave; xiāngy&ugrave;, yīy&egrave; q&iacute;, du&igrave; ji&ugrave; j&uacute;.<br />
M&iacute;ng ch&aacute;o s&ugrave; yǔ, huā lu&ograve; mǎn dī,k&egrave; yǒuxi&aacute;n q&iacute;ng, yuē guīqī.<br />
Li&uacute; wǒ c&iacute;qǔ, qu&egrave; w&uacute;t&iacute;, d&agrave;i shu&iacute; t&iacute;.Jiǎng shēng lǐ, x&uacute;n q&iacute;n jī,w&uacute; ch&ugrave; w&egrave;n q&iacute;n jī,</p>

<p>qīngfēng zhī wǒ y&igrave;</p>
', 3801, 46, N'20190521103803.mp3', 1, NULL, 2057, 53, 418)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6044, N'Họa Nữ', N'<p><br />
W&eacute;i l&uacute; tīng xuě, xīn pēi sh&igrave; shǒu t&agrave;ng.&nbsp;<br />
M&eacute;izi p&ograve; y&ugrave; sh&iacute; y&ograve;u x&ugrave; jǐ zhāng?&nbsp;</p>

<p>Shuǐm&ograve; yūn rǎn t&ograve;u gǔ &agrave;n xiāng,&nbsp;<br />
Bǐ lu&ograve; qīngsī p&aacute;ng.&nbsp;</p>

<p>Qiǎn hu&agrave; l&oacute;ug&eacute; yī x&iacute; s&ugrave; b&aacute;i shang.&nbsp;<br />
D&agrave;i yǐn b&agrave; shu&ograve; xuě cāngm&aacute;ng,&nbsp;</p>

<p>Yīng sh&igrave; chūn hu&iacute; y&agrave;n r&ugrave; t&aacute;ng.&nbsp;<br />
Qu&egrave; r&uacute;h&eacute;, zhǐ sh&agrave;ng yu&egrave;, w&egrave;i r&oacute;ng shuāng.&nbsp;</p>

<p>Hu&agrave; zhōng kě ni&aacute;n su&igrave; w&uacute;y&agrave;ng?&nbsp;<br />
Tānli&agrave;n zh&egrave; y&iacute; sh&igrave; gū fāng.&nbsp;</p>

<p>R&eacute;njiān cǐk&egrave;, lu&ograve; y&iacute;n zhuāng.&nbsp;<br />
Zhǎng dōng yǒng y&egrave;, bīng fēngle gu&ograve;wǎng.&nbsp;</p>

<p>H&eacute;r&eacute;n chī lu&ograve;d&eacute; yīshēn zu&igrave; ku&aacute;ng.&nbsp;<br />
Ru&ograve;sh&igrave; sh&igrave; xuě bi&agrave;n n&eacute;ng xiāng w&agrave;ng,&nbsp;</p>

<p>Ěr biān shu&iacute; y&oacute;u ch&agrave;ng.&nbsp;<br />
Hū &eacute;r xūkōng hu&agrave; pi&agrave;nyǔ j&iacute;guāng.&nbsp;</p>

<p>D&agrave;i yǐn b&agrave; shu&ograve; xuě cāngm&aacute;ng,&nbsp;<br />
Yīng sh&igrave; chūn hu&iacute; y&agrave;n r&ugrave; t&aacute;ng.&nbsp;</p>

<p>Qu&egrave; r&uacute;h&eacute;, zhǐ sh&agrave;ng yu&egrave;, w&egrave;i r&oacute;ng shuāng&nbsp;<br />
Hu&agrave; zhōng kě ni&aacute;n su&igrave; w&uacute;y&agrave;ng?&nbsp;</p>

<p>Tānli&agrave;n zh&egrave; y&iacute; sh&igrave; gū fāng.&nbsp;<br />
R&eacute;njiān cǐk&egrave;, lu&ograve; y&iacute;n zhuāng.&nbsp;</p>

<p>D&agrave;i yǐn b&agrave; shu&ograve; xuě cāngm&aacute;ng,&nbsp;<br />
Yīng sh&igrave; l&iacute;huā chuī mǎnt&aacute;ng.&nbsp;</p>

<p>Qu&egrave; r&uacute;h&eacute;, zhǐ sh&agrave;ng b&igrave;n, yǒng fēi shuāng.&nbsp;<br />
Xiǎngl&aacute;i sh&igrave; j&igrave;nr&igrave; w&uacute;y&agrave;ng,&nbsp;</p>

<p>Zhǐsh&igrave; fēng xūnle yǎnku&agrave;ng.&nbsp;<br />
R&eacute;njiān cǐk&egrave;, kōng ch&oacute;uch&agrave;ng.</p>
', 9242, 316, N'20190521104332.mp3', 1, NULL, 2058, 240, 256)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6045, N'Manh Nhãn Họa Sư ', N'<p>&Aacute;i gu&ograve; fēng xuẽ l&ograve;u chuāng y&aacute;n yǔ chuān qi&aacute;ng&nbsp;<br />
Ji&egrave; m&iacute;ng yu&egrave; qiān lǐ n&eacute;ng s&ograve;ng wǒ h&aacute;i xiāng&nbsp;<br />
Y&egrave; l&aacute;i m&egrave;ng zhōng sh&igrave; shu&iacute; d&ugrave; k&otilde;u tiāo dẽng w&agrave;ng&nbsp;<br />
Yī xī l&egrave;i guāng yīn yūn le liǎn p&aacute;ng&nbsp;</p>

<p>Qīng m&eacute;i zh&uacute; mǎ de ni&aacute;n yu&egrave; ch&eacute;ng shī h&aacute;ng&nbsp;<br />
Tā hu&agrave; j&igrave;n lǜ wǎ gāo f&aacute;ng yǔ h&oacute;ng zhuāng&nbsp;<br />
Duō shǎo hu&iacute; zh&agrave;n z&agrave;i ch&eacute;ng l&oacute;u sh&agrave;ng yuǎn w&agrave;ng&nbsp;<br />
N&agrave; sh&igrave; tā w&agrave;ng b&ugrave; ji&agrave;n de d&igrave; lǎo tiān huāng&nbsp;</p>

<p>Tā w&agrave;ng zhe yuǎn fāng xiāng sī chuān gu&ograve; ch&aacute;ng&nbsp;<br />
Tā c&aacute;ng zhe h&oacute;ng zh&uacute; děng bǎ tā zh&agrave;o li&agrave;ng&nbsp;<br />
Tā hu&agrave; zhe n&agrave; g&egrave; tā d&agrave;o ěr l&oacute;ng yǎn m&aacute;ng&nbsp;<br />
&Eacute;r tā z&agrave;i k&agrave;n b&ugrave; ji&agrave;n tā de gū ni&aacute;ng&nbsp;</p>

<p>W&agrave;ng b&ugrave; ji&agrave;n w&agrave;ng b&ugrave; ji&agrave;n tā yǎn dǐ xīng m&aacute;ng&nbsp;<br />
W&agrave;ng b&ugrave; ji&agrave;n w&agrave;ng b&ugrave; ji&agrave;n tā liǎng b&igrave;n cāng cāng&nbsp;<br />
W&agrave;ng b&ugrave; ji&agrave;n w&agrave;ng b&ugrave; ji&agrave;n tā m&eacute;i ji&agrave;n āi shāng&nbsp;<br />
Qīng m&eacute;i zh&uacute; mǎ de ni&aacute;n yu&egrave; ch&eacute;ng shī h&aacute;ng&nbsp;</p>

<p>Tā hu&agrave; j&igrave;n lǜ wǎ gāo f&aacute;ng yǔ h&oacute;ng zhuāng&nbsp;<br />
Duō shǎo hu&iacute; zh&agrave;n z&agrave;i ch&eacute;ng l&oacute;u sh&agrave;ng yuǎn w&agrave;ng&nbsp;<br />
N&agrave; sh&igrave; tā w&agrave;ng b&ugrave; ji&agrave;n de d&igrave; lǎo tiān huāng&nbsp;<br />
Tā w&agrave;ng zhe yuǎn fāng xiāng sī chuān gu&ograve; ch&aacute;ng&nbsp;</p>

<p>Tā c&aacute;ng zhe h&oacute;ng zh&uacute; děng bǎ tā zh&agrave;o li&agrave;ng&nbsp;<br />
Tā hu&agrave; zhe n&agrave; g&egrave; tā d&agrave;o ěr l&oacute;ng yǎn m&aacute;ng&nbsp;<br />
&Eacute;r tā z&agrave;i k&agrave;n b&ugrave; ji&agrave;n tā de gū ni&aacute;ng&nbsp;<br />
Sh&iacute; zǎi gu&ograve; w&agrave;ng chuān h&eacute; p&aacute;ng wǒ m&eacute;i w&agrave;ng&nbsp;</p>

<p>Nǐ shǒu z&agrave;i d&ugrave; kǒu yǔ wǒ g&eacute; shuǐ w&agrave;ng&nbsp;<br />
Yǒu xuě huā lu&ograve; z&agrave;i ji&agrave;n t&oacute;u h&eacute; fā sh&agrave;ng&nbsp;<br />
&Eacute;r wǒ z&agrave;i k&agrave;n b&ugrave; ji&agrave;n nǐ jīn shēng m&oacute; y&agrave;ng&nbsp;<br />
Y&agrave;o r&uacute; h&eacute; yǔ nǐ g&ograve;ng shǎng zh&egrave; fēng guāng</p>
', 4328, 123, N'20190521104516.mp3', 1, NULL, 2061, 253, 507)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6046, N'Mộng Phồn Hoa', N'<p>Cānghǎi b&igrave;bō, cāngm&aacute;ng shām&ograve;&nbsp;<br />
Zǔ su&igrave;yu&egrave; xiāom&oacute;&nbsp;<br />
Zhǎng ji&agrave;n z&agrave;iw&ograve;, hu&iacute;y&igrave; bānb&oacute;&nbsp;<br />
Jiě m&igrave;ngy&ugrave;n de suǒ&nbsp;</p>

<p>Tiānd&igrave; yōuyōu, ji&egrave; yībēi jiǔ&nbsp;<br />
Dǐdǎng zh&egrave; h&oacute;ngch&eacute;n de ku&aacute;ng li&uacute;&nbsp;<br />
Ji&ugrave;su&agrave;n yǐh&ograve;u, b&aacute;iy&uacute;n cāng gǒu&nbsp;<br />
B&ugrave; hu&iacute;t&oacute;u&nbsp;</p>

<p>Q&iacute;ng shēny&igrave; zh&ograve;ng, &agrave;i h&egrave;n liǎng ch&oacute;ng&nbsp;<br />
Chīxīn sh&eacute;i l&aacute;i zhǒng&nbsp;<br />
Tiānd&igrave; guǎngku&ograve;, q&iacute;ng hǎi xiōngyǒng&nbsp;<br />
Xiāngsī sh&eacute;i yǔg&ograve;ng&nbsp;</p>

<p>Jiāngshān r&uacute; m&egrave;ng, ji&agrave;n q&igrave; r&uacute; h&oacute;ng&nbsp;<br />
Xīnzhōng b&ugrave; li&uacute; yīsī hu&aacute;ngkǒng&nbsp;<br />
Sh&igrave;s&uacute; huāngmi&ugrave;, w&uacute;xū t&aacute;ozǒu&nbsp;<br />
Ch&eacute;ngsh&ograve;u&nbsp;</p>

<p>Ji&ugrave;su&agrave;n qi&aacute;n l&ugrave; yǒu qiān n&aacute;n w&agrave;n xiǎn&nbsp;<br />
Z&agrave;i nǐ shǒu lǐ w&ograve; zh&ugrave;le m&iacute;ngtiān&nbsp;<br />
Xīnx&ugrave; w&agrave;n qiān, yǐ wěn fēng jiān&nbsp;<br />
Sh&eacute;i sh&igrave; sh&eacute;i c&eacute;ngjīng de yu&aacute;ndiǎn&nbsp;</p>

<p>Z&agrave;i yī sh&ugrave;njiān wēn r&egrave;le shuāngyǎn&nbsp;<br />
Q&iacute;ng shēny&igrave; zh&ograve;ng, &agrave;i h&egrave;n liǎng ch&oacute;ng&nbsp;<br />
Chīxīn sh&eacute;i l&aacute;i zhǒng&nbsp;<br />
Tiānd&igrave; guǎngku&ograve;, q&iacute;ng hǎi xiōngyǒng&nbsp;</p>

<p>Xiāngsī sh&eacute;i yǔg&ograve;ng&nbsp;<br />
Jiāngshān r&uacute; m&egrave;ng, ji&agrave;n q&igrave; r&uacute; h&oacute;ng&nbsp;<br />
Xīnzhōng b&ugrave; li&uacute; yīsī hu&aacute;ngkǒng&nbsp;<br />
Sh&igrave;s&uacute; huāngmi&ugrave;, w&uacute;xū t&aacute;ozǒu&nbsp;</p>

<p>Ch&eacute;ngsh&ograve;u&nbsp;<br />
Ji&ugrave;su&agrave;n qi&aacute;n l&ugrave; yǒu qiān n&aacute;n w&agrave;n xiǎn&nbsp;<br />
Z&agrave;i nǐ shǒu lǐ w&ograve; zh&ugrave;le m&iacute;ngtiān&nbsp;<br />
Xīnx&ugrave; w&agrave;n qiān, yǐ wěn fēng jiān&nbsp;</p>

<p>Sh&eacute;i sh&igrave; sh&eacute;i c&eacute;ngjīng de yu&aacute;ndiǎn&nbsp;<br />
Z&agrave;i yī sh&ugrave;njiān wēn r&egrave;le shuāngyǎn&nbsp;<br />
Ji&ugrave;su&agrave;n m&iacute;ngtiān yǒu fēngyǔ li&aacute;npiān&nbsp;<br />
Z&agrave;i nǐ yǎnzhōng wǒ k&agrave;n d&agrave;o chūntiān&nbsp;</p>

<p>W&agrave;nbān &agrave;ili&agrave;n, yǐ wěn fēng jiān&nbsp;<br />
Nǐ sh&igrave; wǒ cǐshēng de zhōngdiǎn&nbsp;<br />
Z&agrave;i yī sh&ugrave;njiān xi&agrave;ng x&igrave;n le yǒngyuǎn&nbsp;<br />
Yǔ sh&igrave; w&eacute;i d&iacute; yě xīngānq&iacute;ngyu&agrave;n</p>
', 4447, 169, N'20190521104703.mp3', 1, NULL, 2064, 374, 655)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6047, N'Thủy Mặc Đan Thanh', NULL, 3074, 108, N'20190521105100.mp3', 1, NULL, 2067, 368, 252)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6048, N'Vạn Mộng Tinh', NULL, 4163, 100, N'20190521105419.mp3', 1, NULL, 2064, 85, 210)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6049, N'Tỳ Bà Hành', N'<p>X&uacute;n y&aacute;ngjiāng t&oacute;u y&egrave;<br />
s&ograve;ng k&egrave; fēngy&egrave; d&iacute; huā<br />
qiū s&egrave;s&egrave; zhǔr&eacute;n xi&agrave;mǎ k&egrave;<br />
z&agrave;i chu&aacute;n</p>

<p>jǔ jiǔ y&ugrave; yǐn w&uacute;<br />
guǎnxi&aacute;n zu&igrave; b&ugrave;ch&eacute;ng<br />
huān cǎn jiāng bi&eacute; bi&eacute;<br />
sh&iacute; m&aacute;ngm&aacute;ng jiāng<br />
j&igrave;n yu&egrave;</p>

<p>hū w&eacute;n shuǐsh&agrave;ng p&iacute;p&aacute; shēng<br />
zhǔr&eacute;n w&agrave;ng guī k&egrave; b&ugrave; fā<br />
x&uacute;n shēng &agrave;n w&egrave;n d&agrave;n zhě sh&eacute;i<br />
p&iacute;p&aacute; shēng t&iacute;ng y&ugrave; yǔ ch&iacute;</p>

<p>y&iacute; chu&aacute;n xiāngj&igrave;n yāo xiāng ji&agrave;n<br />
tiān jiǔ hu&iacute; dēng ch&oacute;ng kāi y&agrave;n<br />
qiān hū w&agrave;n hu&agrave;n shǐ chūl&aacute;i<br />
y&oacute;u b&agrave;o p&iacute;p&aacute; b&agrave;n zhē mi&agrave;n</p>

<p>zhuǎnzh&oacute;u bō xi&aacute;n sān liǎng shēng<br />
w&egrave;ich&eacute;ng qǔdi&agrave;o xiān yǒuq&iacute;ng<br />
xi&aacute;n xi&aacute;n yǎn y&igrave; shēng shēng<br />
sī sh&igrave; s&ugrave; p&iacute;ngshēng b&ugrave;d&eacute; zh&igrave;</p>

<p>dī m&eacute;i x&igrave;n shǒux&ugrave; x&ugrave; d&agrave;n<br />
shuō j&igrave;n xīnzhōng w&uacute;xi&agrave;n sh&igrave;<br />
qīng lǒng m&agrave;n niǎn mǒ f&ugrave; tiāo<br />
chū w&egrave;i n&iacute;shang h&ograve;u li&ugrave; yāo</p>

<p>d&agrave; xi&aacute;n c&aacute;o c&aacute;o r&uacute; j&iacute; yǔ<br />
xiǎo xi&aacute;n qi&egrave;qi&egrave; r&uacute; sīyǔ<br />
r&uacute; sīyǔ<br />
c&aacute;o c&aacute;o qi&egrave;qi&egrave; cu&ograve;z&aacute; d&agrave;n<br />
d&agrave; zhū xiǎo zhū lu&ograve; y&ugrave; p&aacute;n<br />
lu&ograve; y&ugrave; p&aacute;n</p>

<p>jiān guān yīng yǔ huā dǐ hu&aacute;<br />
yōuy&egrave; qu&aacute;nli&uacute; bīng xi&agrave; n&aacute;n<br />
bīng qu&aacute;n lěng s&egrave; xi&aacute;n n&iacute;ng ju&eacute;<br />
n&iacute;ng ju&eacute; b&ugrave;tōng shēng z&agrave;n xiē</p>

<p>bi&eacute; yǒu yōu ch&oacute;u<br />
&agrave;n h&egrave;n shēng<br />
cǐ sh&iacute; w&uacute;shēng sh&egrave;ng yǒushēng<br />
sh&egrave;ng yǒushēng</p>

<p>y&iacute;n p&iacute;ng zh&agrave; p&ograve;shuǐ jiāng b&egrave;ng<br />
tiěq&iacute; t&uacute;chū dāoqiāng m&iacute;ng<br />
dāoqiāng m&iacute;ng</p>

<p>qǔ zhōng shōu bō<br />
dāngxīn hu&agrave;<br />
s&igrave; xi&aacute;n yīshēng r&uacute; li&egrave;b&oacute;<br />
r&uacute; li&egrave;b&oacute;<br />
dōng chu&aacute;n xī fǎng<br />
qiāo w&uacute; y&aacute;n<br />
w&eacute;i ji&agrave;n jiāng xīn qiūyu&egrave; b&aacute;i<br />
qiūyu&egrave; b&aacute;i</p>

<p>ch&eacute;ny&iacute;n f&agrave;ng bō chā xi&aacute;n zhōng<br />
zhěngd&ugrave;n yīshang qǐ liǎnr&oacute;ng<br />
z&igrave; y&aacute;n běn sh&igrave; jīngch&eacute;ng nǚ<br />
jiā z&agrave;i h&aacute; m&aacute; l&iacute;ng xi&agrave; zh&ugrave;</p>

<p>sh&iacute;sān xu&eacute; d&eacute; p&iacute;p&aacute; ch&eacute;ng<br />
m&iacute;ng shǔ ji&agrave;o fāng d&igrave; yī b&ugrave;<br />
qū b&agrave; c&eacute;ng ji&agrave;o sh&agrave;n c&aacute;i f&uacute;<br />
zhuāng ch&eacute;ng měi b&egrave;i qiū ni&aacute;ng d&ugrave;</p>

<p>wǔ l&iacute;ng ni&aacute;nsh&agrave;o zhēng ch&aacute;n<br />
t&oacute;u yī qū h&oacute;ng xiāo b&ugrave;zhī sh&ugrave;<br />
di&agrave;n t&oacute;u y&iacute;n b&igrave; jīji&eacute; su&igrave;<br />
xu&egrave;s&egrave; luō q&uacute;n fān jiǔ wū</p>

<p>jīnni&aacute;n huānxi&agrave;o f&ugrave;m&iacute;ng<br />
ni&aacute;nqiū yu&egrave; chūnfēng děngxi&aacute;n d&ugrave;<br />
d&igrave; zǒu c&oacute;ngjūn āy&iacute; sǐ<br />
m&ugrave; q&ugrave; ch&aacute;ol&aacute;i y&aacute;ns&egrave; g&ugrave;</p>

<p>m&eacute;n qi&aacute;n lěnglu&ograve; ānmǎ xī<br />
lǎod&agrave; ji&agrave; zu&ograve; shāngr&eacute;n f&ugrave;<br />
shāngr&eacute;n f&ugrave;<br />
shāngr&eacute;n zh&ograve;ngl&igrave; qīng bi&eacute;l&iacute;<br />
qi&aacute;nyu&egrave; f&uacute; li&aacute;ng mǎi ch&aacute; q&ugrave;<br />
mǎi ch&aacute; q&ugrave;</p>

<p>q&ugrave; l&aacute;i jiāngkǒu shǒu kōng chu&aacute;n<br />
r&agrave;o chu&aacute;n yu&egrave; m&iacute;ng jiāngshuǐ h&aacute;n<br />
jiāngshuǐ h&aacute;n<br />
y&egrave; shēn hū m&egrave;ng sh&agrave;oni&aacute;n sh&igrave;<br />
m&egrave;ng t&iacute; zhuāng l&egrave;i h&oacute;ng l&aacute;ngān<br />
h&oacute;ng l&aacute;ngān</p>

<p>wǒ w&eacute;n p&iacute;p&aacute; yǐ<br />
t&agrave;nx&iacute; y&ograve;u w&eacute;n cǐ yǔ zh&ograve;ng<br />
jījī t&oacute;ng sh&igrave; tiāny&aacute; l&uacute;nlu&ograve; r&eacute;n<br />
xiāngf&eacute;ng h&eacute;b&igrave; c&eacute;ng xiāngsh&iacute;<br />
wǒ c&oacute;ng q&ugrave;ni&aacute;n c&iacute; d&igrave;jīng<br />
zh&eacute;jū w&ograve;b&igrave;ng x&uacute;n y&aacute;ng ch&eacute;ng</p>

<p>x&uacute;n y&aacute;ng d&igrave; p&igrave; w&uacute;<br />
yīnyu&egrave; zhōng su&igrave; b&ugrave; w&eacute;n sī<br />
zh&uacute; shēng zh&ugrave; j&igrave;n p&eacute;n jiāng de dīshī<br />
hu&aacute;ng l&uacute; kǔzh&uacute; r&agrave;o zh&aacute;i shēng<br />
q&iacute;jiān d&agrave;n m&ugrave; w&eacute;n h&eacute; w&ugrave;<br />
d&ugrave;juān t&iacute; xu&egrave; yu&aacute;n āim&iacute;ng</p>

<p>chūnjiāng huā zhāo qiū yu&egrave; y&egrave;<br />
wǎngwǎng qǔ jiǔ h&aacute;i d&uacute; qīng<br />
qǐ w&uacute; shāngē yǔ cūn d&iacute;<br />
ǒu yǎ ch&aacute;o zhā n&aacute;nw&eacute;i tīng<br />
jīny&egrave; w&eacute;n jūn p&iacute;p&aacute; yǔ<br />
r&uacute; tīng xiān yu&egrave; ěr z&agrave;n m&iacute;ng</p>

<p>m&ograve; c&iacute; g&egrave;ng zu&ograve; d&agrave;n y&igrave; qū<br />
w&egrave;i jūn fān zu&ograve; p&iacute;p&aacute; x&iacute;ng<br />
p&iacute;p&aacute; x&iacute;ng<br />
gǎn wǒ cǐ y&aacute;n li&aacute;ngjiǔ l&igrave;<br />
qu&egrave; zu&ograve; c&ugrave; xi&aacute;n xi&aacute;n zhuǎn j&iacute;<br />
xi&aacute;n zhuǎn j&iacute;</p>

<p>qī qī b&ugrave; sh&igrave; xi&agrave;ng qi&aacute;n shēng<br />
mǎnzu&ograve; zh&ograve;ng w&eacute;n jiē yǎn q&igrave;<br />
jiē yǎn q&igrave;<br />
zu&ograve; zhōng q&igrave; xi&agrave; sh&eacute;i zu&igrave;duō<br />
jiāng zhōu sīmǎ qīng<br />
shān shī qīng shān shī</p>

<p>jiāng zhōu sīmǎ qīng shān shī</p>
', 6380, 215, N'20190521110222.mp3', 1, NULL, 2049, 237, 512)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6051, N'Thiên Phú', N'<p>Ru guo wo yi ke xin bie ni fu lu&nbsp;<br />
Jiu liu lang zai ni huai li de guo du&nbsp;<br />
Wo yan ni shou zhang xin de wen lu&nbsp;<br />
Qi cheng wo de zhui zhu&nbsp;<br />
Ru guo ni mei yu du gua zhe gu du&nbsp;<br />
Jiu fu mo rang ni bing shan hua cheng hu&nbsp;<br />
Wo pei ni feng de ren xing hu tu&nbsp;<br />
Xiao de lei yan mo hu&nbsp;<br />
Jiu yi yan ai bian cheng yi zhong tian fu&nbsp;<br />
Xin tiao zai ni mian quian you le wen du&nbsp;<br />
Wo wei ni kai shi ling wu&nbsp;<br />
Wang diao ming tian he jia ru&nbsp;<br />
Xing fu jiu shi man zu&nbsp;<br />
Zhi yi yan ai bian cheng yi zhong tian fu&nbsp;<br />
Bu zi jue neng qian ni xiao bao ni ku&nbsp;<br />
Wo wei ni you le lu tu&nbsp;<br />
Bu guan li tian ya ji bu&nbsp;<br />
Wo du bu zai hụi&nbsp;<br />
Jiu yi yan ai bian cheng yi zhong tian fu&nbsp;<br />
Xin tiao zai ni mian qian you le wen du&nbsp;<br />
Wo wei ni kai shi ling wu&nbsp;<br />
Wang diao ming tian he jia ru&nbsp;<br />
Xing fu jiu shi man zu&nbsp;<br />
Zhi yi yan ai bian cheng yi zhong tian fu&nbsp;<br />
Bu zi jue neng qian ni xiao bao ni ku&nbsp;<br />
Wo wei ni you le lu tu&nbsp;<br />
Bu guan li tian ya ji bu&nbsp;<br />
Wo du bu zai hu</p>
', 2758, 226, N'20190521111759.mp3', 1, NULL, 2055, 160, 640)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6052, N'We Don''t Talk Anymore', N'<p>[Charlie Puth:]&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
Like we used to do&nbsp;<br />
We don&#39;t love anymore&nbsp;<br />
What was all of it for?&nbsp;<br />
Oh, we don&#39;t talk anymore&nbsp;<br />
Like we used to do...&nbsp;<br />
<br />
I just heard you found the one you&#39;ve been looking&nbsp;<br />
You&#39;ve been looking for&nbsp;<br />
I wish I would have known that wasn&#39;t me&nbsp;<br />
Cause even after all this time I still wonder&nbsp;<br />
Why I can&#39;t move on&nbsp;<br />
Just the way you did so easily&nbsp;<br />
<br />
Don&#39;t wanna know&nbsp;<br />
What kind of dress you&#39;re wearing tonight&nbsp;<br />
If he&#39;s holding onto you so tight&nbsp;<br />
The way I did before&nbsp;<br />
I overdosed&nbsp;<br />
Should&#39;ve known your love was a game&nbsp;<br />
Now I can&#39;t get you out of my brain&nbsp;<br />
Oh, it&#39;s such a shame&nbsp;<br />
<br />
That we don&#39;t talk anymore&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
Like we used to do&nbsp;<br />
We don&#39;t love anymore&nbsp;<br />
What was all of it for?&nbsp;<br />
Oh, we don&#39;t talk anymore&nbsp;<br />
Like we used to do&nbsp;<br />
<br />
[Selena Gomez:]&nbsp;<br />
I just hope you&#39;re lying next to somebody&nbsp;<br />
Who knows how to love you like me&nbsp;<br />
There must be a good reason that you&#39;re gone&nbsp;<br />
Every now and then I think you&nbsp;<br />
Might want me to come show up at your door&nbsp;<br />
But I&#39;m just too afraid that I&#39;ll be wrong&nbsp;<br />
<br />
Don&#39;t wanna know&nbsp;<br />
If you&#39;re looking into her eyes&nbsp;<br />
If she&#39;s holding onto you so tight the way I did before&nbsp;<br />
I overdosed&nbsp;<br />
Should&#39;ve known your love was a game&nbsp;<br />
Now I can&#39;t get you out of my brain&nbsp;<br />
Oh, it&#39;s such a shame&nbsp;<br />
<br />
[Charlie Puth &amp; Selena Gomez:]&nbsp;<br />
That we don&#39;t talk anymore&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
Like we used to do&nbsp;<br />
We don&#39;t love anymore&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
What was all of it for?&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
Oh, we don&#39;t talk anymore&nbsp;<br />
Like we used to do&nbsp;<br />
Like we used to do&nbsp;<br />
<br />
Don&#39;t wanna know&nbsp;<br />
What kind of dress you&#39;re wearing tonight&nbsp;<br />
If he&#39;s giving it to you just right&nbsp;<br />
The way I did before&nbsp;<br />
I overdosed&nbsp;<br />
Should&#39;ve known your love was a game&nbsp;<br />
Now I can&#39;t get you out of my brain&nbsp;<br />
Oh, it&#39;s such a shame&nbsp;<br />
<br />
That we don&#39;t talk anymore&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
We don&#39;t talk anymore&nbsp;<br />
Like we used to do&nbsp;<br />
We don&#39;t love anymore&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
What was all of it for?&nbsp;<br />
(We don&#39;t we don&#39;t)&nbsp;<br />
Oh, we don&#39;t talk anymore&nbsp;<br />
Like we used to do&nbsp;<br />
<br />
(We don&#39;t talk anymore)&nbsp;<br />
Don&#39;t wanna know&nbsp;<br />
What kind of dress you&#39;re wearing tonight (Oh)&nbsp;<br />
If he&#39;s holding onto you so tight (Oh)&nbsp;<br />
The way I did before&nbsp;<br />
(We don&#39;t talk anymore)&nbsp;<br />
I overdosed&nbsp;<br />
Should&#39;ve known your love was a game (Oh)&nbsp;<br />
Now I can&#39;t get you out of my brain (Woah)&nbsp;<br />
Oh, it&#39;s such a shame&nbsp;<br />
<br />
That we don&#39;t talk anymore</p>
', 9923, 381, N'20190521115433.mp3', 1, NULL, 2069, 167, 102)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6053, N'Believer', N'<p>Verse 1]&nbsp;<br />
First things first&nbsp;<br />
I&#39;ma say all the words inside my head&nbsp;<br />
I&#39;m fired up and tired of the way that things have been, oh-ooh&nbsp;<br />
The way that things have been, oh-ooh&nbsp;<br />
Second thing second&nbsp;<br />
Don&#39;t you tell me what you think that I can be&nbsp;<br />
I&#39;m the one at the sail, I&#39;m the master of my sea, oh-ooh&nbsp;<br />
The master of my sea, oh-ooh&nbsp;<br />
<br />
[Pre-Chorus]&nbsp;<br />
I was broken from a young age&nbsp;<br />
Taking my sulking to the masses&nbsp;<br />
Writing my poems for the few&nbsp;<br />
That looked at me took to me, shook to me, feeling me&nbsp;<br />
Singing from heart ache from the pain&nbsp;<br />
Take up my message from the veins&nbsp;<br />
Speaking my lesson from the brain&nbsp;<br />
Seeing the beauty through the...&nbsp;<br />
<br />
[Chorus]&nbsp;<br />
Pain!&nbsp;<br />
You made me a, you made me a believer, believer&nbsp;<br />
Pain!&nbsp;<br />
You break me down, you build me up, believer, believer&nbsp;<br />
Pain!&nbsp;<br />
I let the bullets fly, oh let them rain&nbsp;<br />
My life, my love, my drive, it came from...&nbsp;<br />
Pain!&nbsp;<br />
You made me a, you made me a believer, believer&nbsp;<br />
<br />
[Verse 2]&nbsp;<br />
Third things third&nbsp;<br />
Send a prayer to the ones up above&nbsp;<br />
All the hate that you&#39;ve heard has turned your spirit to a dove, oh-ooh&nbsp;<br />
Your spirit up above, oh-ooh&nbsp;<br />
<br />
[Pre-Chorus 2]&nbsp;<br />
I was choking in the crowd&nbsp;<br />
Building my rain up in the cloud&nbsp;<br />
Falling like ashes to the ground&nbsp;<br />
Hoping my feelings, they would drown&nbsp;<br />
But they never did, ever lived, ebbing and flowing&nbsp;<br />
Inhibited, limited&nbsp;<br />
Till it broke open and it rained down&nbsp;<br />
It rained down, like...&nbsp;<br />
<br />
[Chorus]&nbsp;<br />
Pain!&nbsp;<br />
You made me a, you made me a believer, believer&nbsp;<br />
Pain!&nbsp;<br />
You break me down, you build me up, believer, believer&nbsp;<br />
Pain!&nbsp;<br />
I let the bullets fly, oh let them rain&nbsp;<br />
My life, my love, my drive, it came from...&nbsp;<br />
Pain!&nbsp;<br />
You made me a, you made me a believer, believer&nbsp;<br />
<br />
[Bridge]&nbsp;<br />
Last things last&nbsp;<br />
By the grace of the fire and the flames&nbsp;<br />
You&#39;re the face of the future, the blood in my veins, oh-ooh&nbsp;<br />
The blood in my veins, oh-ooh&nbsp;<br />
But they never did, ever lived, ebbing and flowing&nbsp;<br />
Inhibited, limited&nbsp;<br />
Till it broke open and it rained down&nbsp;<br />
It rained down, like...&nbsp;<br />
<br />
[Chorus]&nbsp;<br />
Pain!&nbsp;<br />
You made me a, you made me a believer, believer&nbsp;<br />
Pain!&nbsp;<br />
You break me down, you build me up, believer, believer&nbsp;<br />
Pain!&nbsp;<br />
I let the bullets fly, oh let them rain&nbsp;<br />
My life, my love, my god, it came from...&nbsp;<br />
Pain!&nbsp;<br />
You made me a, you made me a believer, believer</p>
', 2192, 202, N'20190521115557.mp3', 1, NULL, 2070, 15, 77)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6054, N'Talk', N'<p>[Chorus]&nbsp;<br />
Can&#39;t we just talk? Can&#39;t we just talk?&nbsp;<br />
Talk about where we&#39;re goin&#39;&nbsp;<br />
Before we get lost, let me out first&nbsp;<br />
Can&#39;t get what we want without knowin&#39;&nbsp;<br />
I&#39;ve never felt like this before&nbsp;<br />
I apologize if I&#39;m movin&#39; too far&nbsp;<br />
Can&#39;t we just talk? Can&#39;t we just talk?&nbsp;<br />
Figure out where we&#39;re goin&#39;&nbsp;<br />
<br />
[Verse 1]&nbsp;<br />
Yeah, started off right&nbsp;<br />
I can see it in your eyes&nbsp;<br />
I can tell that you&#39;re wantin&#39; more&nbsp;<br />
What&#39;s been on your mind?&nbsp;<br />
There&#39;s no reason we should hide&nbsp;<br />
Tell me somethin&#39; I ain&#39;t heard before&nbsp;<br />
<br />
[Refrain]&nbsp;<br />
Oh, I&#39;ve been dreamin&#39; &#39;bout it&nbsp;<br />
And it&#39;s you I&#39;m on&nbsp;<br />
So stop thinkin&#39; &#39;bout it&nbsp;<br />
<br />
[Chorus]&nbsp;<br />
Can&#39;t we just talk? Can&#39;t we just talk?&nbsp;<br />
Talk about where we&#39;re goin&#39;&nbsp;<br />
Before we get lost, let me out first (Yeah)&nbsp;<br />
Can&#39;t get what we want without knowin&#39; (No)&nbsp;<br />
I&#39;ve never felt like this before&nbsp;<br />
I apologize if I&#39;m movin&#39; too far&nbsp;<br />
Can&#39;t we just talk? Can&#39;t we just talk?&nbsp;<br />
Figure out where we&#39;re goin&#39;&nbsp;<br />
<br />
[Verse 2]&nbsp;<br />
Oh, nah&nbsp;<br />
Penthouse view, left some flowers in the room&nbsp;<br />
I&#39;ll make sure I leave the door unlocked&nbsp;<br />
Now I&#39;m on the way, swear I won&#39;t be late&nbsp;<br />
I&#39;ll be there by five o&#39;clock&nbsp;<br />
<br />
[Refrain]&nbsp;<br />
Oh, you&#39;ve been dreamin&#39; &#39;bout it&nbsp;<br />
And I&#39;m what you want&nbsp;<br />
So stop thinkin&#39; &#39;bout it&nbsp;<br />
<br />
[Chorus]&nbsp;<br />
Can&#39;t we just talk? (Oh) Can&#39;t we just talk?&nbsp;<br />
Talk about where we&#39;re goin&#39;&nbsp;<br />
Before we get lost, let me out first&nbsp;<br />
Can&#39;t get what we want without knowin&#39;&nbsp;<br />
I&#39;ve never felt like this before&nbsp;<br />
I apologize if I&#39;m movin&#39; too far&nbsp;<br />
Can&#39;t we just talk? Can&#39;t we just talk?&nbsp;<br />
Figure out where we&#39;re goin&#39;&nbsp;<br />
<br />
[Outro]&nbsp;<br />
Figure out where we&#39;re goin&#39;</p>
', 3760, 148, N'20190521115830.mp3', 1, NULL, 2068, 205, 890)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6055, N'Location', N'<p>Send me your location<br />
Let&#39;s focus on communicatin&#39; &#39;cause<br />
I just need the time and place to come through<br />
(A place to come through)<br />
Send me your location<br />
Let&#39;s ride the vibrations<br />
I don&#39;t need nothin&#39; else but you (I don&#39;t need nothin&#39; else but)</p>

<p>At times I wonder why I fool with you<br />
But this is new to me, this is new to you<br />
Initially, I didn&#39;t wanna fall for you<br />
Gather my attention it was all for you, so don&#39;t<br />
Take advantage, don&#39;t leave my heart damaged<br />
To understand that things go a little bit better when you plan it</p>

<p>So won&#39;t you send me, your location&nbsp;<br />
Let&#39;s focus on communicatin&#39; &#39;cause<br />
I just need the time and place to come through<br />
Send me your location&nbsp;<br />
Let&#39;s ride the vibrations<br />
I don&#39;t need nothing else but you (I don&#39;t need nothin&#39; else)</p>

<p>I don&#39;t wanna fall in love off of subtweets so<br />
Let&#39;s get personal<br />
I got a lot of cool spots that we can go<br />
Tell me what&#39;s the move and I got you<br />
I&#39;m only acting like this &#39;cause I like you<br />
Just give me the vibe to slide then<br />
Oh, I might make you mine by the night</p>

<p>Send me your location&nbsp;<br />
Let&#39;s focus on communicatin&#39; &#39;cause<br />
I just need the time and place to come through<br />
(A place to come through)<br />
Send me your location&nbsp;<br />
Let&#39;s ride the vibrations<br />
I don&#39;t need nothing else but you (I don&#39;t need nothin&#39; else but you)</p>

<p>Ride, ride, ride, come and vibe with me tonight<br />
I don&#39;t need nothing else but you<br />
(I don&#39;t need nothing else but you)<br />
Ride, ride, ride, come and vibe with me tonight<br />
I don&#39;t need nothing else but you<br />
Nothing else but you</p>

<p>Do, do, do, do, do, do<br />
Oh, oh, mmm, mmm, mmm, mmm<br />
Oh, oh, oh<br />
Oh, oh, oh, mmm, mmm, mmm<br />
Do, do, do, do, do, do, do<br />
Do, do, do, do, do, do, do</p>

<p>I don&#39;t need nothing else but you</p>
', 2536, 47, N'20190521121708.mp3', 1, NULL, 2068, 151, 959)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6056, N'Cold Blooded', N'<p>Cold blooded, cold blooded</p>

<p>The way you&#39;ve been treating me<br />
Is getting out of hand<br />
And you walk around<br />
Like you&#39;re so innocent<br />
I gave you my heart<br />
And it melted in your arms<br />
This isn&#39;t a place that I belong</p>

<p>I feel your fear<br />
Surrounded by your skin<br />
You feel my heartbeat<br />
Vibrate so violent<br />
Inside of your head<br />
I see it in your eyes<br />
You&#39;re no good for me<br />
And love is blind</p>

<p>Oh, and cold blooded<br />
Cold blooded<br />
You want what I&#39;m giving up<br />
But my love is not enough<br />
Cold blooded, cold blooded<br />
And I can&#39;t feel my fingertips<br />
But you feel better when we touch</p>

<p>I lost my sight<br />
And you&#39;re leading me on<br />
Is it &#39;cause you&#39;re used to guys<br />
Always doing you wrong<br />
Do you really love me?<br />
Or is it just revenge?<br />
Lately, you don&#39;t seem so genuine</p>

<p>And I feel your fear<br />
Surrounded by your skin<br />
You feel my heartbeat<br />
Vibrate so violent<br />
Inside of your head<br />
I see it in your eyes<br />
You&#39;re no good for me<br />
And love is blind</p>

<p>Oh, and cold blooded<br />
Cold blooded<br />
You want what I&#39;m giving up<br />
But my love is not enough<br />
Cold blooded, cold blooded<br />
And I can&#39;t feel my fingertips<br />
But you feel better when we touch</p>

<p>Mmm<br />
Fill me up<br />
Keep me high<br />
Use me up or<br />
Fall off guide</p>

<p>I feel your fear<br />
Surrounded by your skin<br />
You feel my heartbeat<br />
Vibrate so violent<br />
Inside of your head<br />
I see it in your eyes<br />
You&#39;re no good for me<br />
And love is blind</p>

<p>Oh, and cold blooded<br />
Cold blooded<br />
You want what I&#39;m giving up<br />
But my love is not enough<br />
Cold blooded, cold blooded<br />
And I can&#39;t feel my fingertips<br />
But you feel better when we touch</p>

<p>Mmm<br />
Fill me up<br />
Keep me high<br />
Use me up or<br />
Fall off guide<br />
(Cold blooded, cold blooded)<br />
(Cold blooded, cold blooded)</p>
', 4282, 377, N'20190521121934.mp3', 1, NULL, 2068, 68, 893)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6057, N'Something Just Like This', N'<p>I&#39;ve been reading books of old<br />
The legends and the myths<br />
Achilles and his gold<br />
Hercules and his gifts<br />
Spiderman&#39;s control<br />
And Batman with his fists<br />
And clearly I don&#39;t see myself upon that list</p>

<p>But she said, where&#39;d you wanna go?<br />
How much you wanna risk?<br />
I&#39;m not looking for somebody<br />
With some superhuman gifts<br />
Some superhero<br />
Some fairytale bliss<br />
Just something I can turn to<br />
Somebody I can kiss</p>

<p>I want something just like this<br />
Doo-doo-doo, doo-doo-doo<br />
Doo-doo-doo, doo-doo-doo<br />
Doo-doo-doo, doo-doo-doo<br />
Oh, I want something just like this<br />
Doo-doo-doo, doo-doo-doo<br />
Doo-doo-doo, doo-doo-doo<br />
Doo-doo-doo, doo-doo-doo<br />
Oh, I want something just like this</p>

<p>I want something just like this</p>

<p>I&#39;ve been reading books of old<br />
The legends and the myths<br />
The testaments they told<br />
The moon and its eclipse<br />
And Superman unrolls<br />
A suit before he lifts<br />
But I&#39;m not the kind of person that it fits</p>

<p>She said, where&#39;d you wanna go?<br />
How much you wanna risk?<br />
I&#39;m not looking for somebody<br />
With some superhuman gifts<br />
Some superhero<br />
Some fairytale bliss<br />
Just something I can turn to<br />
Somebody I can miss</p>

<p>I want something just like this<br />
I want something just like this</p>

<p>I want something just like this<br />
Doo-doo-doo, doo-doo-doo<br />
Doo-doo-doo, doo-doo-doo<br />
Doo-doo-doo, doo-doo-doo<br />
Oh, I want something just like this<br />
Doo-doo-doo, doo-doo<br />
Doo-doo-doo, doo-doo-doo<br />
Doo-doo-doo, doo-doo-doo</p>

<p>Where&#39;d you wanna go?<br />
How much you wanna risk?<br />
I&#39;m not looking for somebody<br />
With some superhuman gifts<br />
Some superhero<br />
Some fairytale bliss<br />
Just something I can turn to<br />
Somebody I can kiss<br />
I want something just like this</p>

<p>Oh, I want something just like this<br />
Oh, I want something just like this<br />
Oh, I want something just like this</p>
', 6537, 112, N'20190521122337.mp3', 1, 12, 2071, 410, 76)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6058, N'Who Do You Love', N'<p>Yeah<br />
Found cigarettes in your Fendi coat<br />
Even though you don&#39;t even smoke<br />
Always changin&#39; your access codes<br />
Yeah, I can tell you no one knew<br />
Yeah, you&#39;ve been actin&#39; so conspicuous<br />
You flip it on me, say I think too much<br />
You&#39;re movin&#39; different when we makin&#39; love<br />
Baby, tell me, tell me<br />
Who do you love, do you love now?<br />
I wanna know the truth (whoa)<br />
Who do you love, do you love now?<br />
I know it&#39;s someone new<br />
You ain&#39;t gotta make it easy, where you been sleepin&#39;?<br />
This shit is keepin&#39; me up at night, just admit it<br />
Who do you love, do you love now?<br />
I wanna know, I wanna know who<br />
Now, now, who do you, who do you love, love (yeah)<br />
Now, now, who do you, who do you love now? (Oh)<br />
Now, now, who do you, who do you love, love (yeah)<br />
I wanna know, I wanna know who<br />
Well, keep switchin&#39; your alibi<br />
Or stutterin&#39; when you reply<br />
You can&#39;t even look me in the eye<br />
Oh, I can tell, I know you&#39;re lyin&#39;<br />
&#39;Cause you&#39;ve been actin&#39; so conspicuous<br />
You flip it on me, say I think too much<br />
We&#39;re movin&#39; different while we&#39;re makin&#39; love<br />
So, baby, tell me, tell me<br />
Who do you love, do you love now?<br />
I wanna know the truth (whoa)<br />
Who do you love, do you love now?<br />
I know it&#39;s someone new<br />
You ain&#39;t gotta make it easy, where you been sleepin&#39;?<br />
This shit is keepin&#39; me up at night, just admit it<br />
Who do you love, do you love now?<br />
I wanna know, I wanna know who<br />
Now, now, who do you, who do you love, love (yeah)<br />
Now, now, who do you, who do you love now? (Oh)<br />
Now, now, who do you, who do you love, love (yeah)<br />
I wanna know, I wanna know who<br />
You been actin&#39; so conspicuous<br />
(Who?) You flip it on me, say I think too much<br />
(Who?) Movin&#39; different when we makin&#39; love<br />
(Who?) Baby, tell me, tell me<br />
Who do you love, do you love now?<br />
I wanna know the truth (whoa)<br />
Who do you love, do you love now?<br />
I know it&#39;s someone new<br />
You ain&#39;t gotta make it easy, where you been sleepin&#39;?<br />
This shit is keepin&#39; me up at night, just admit it<br />
Who do you love, do you love now?<br />
I wanna know, I wanna know who<br />
Now, now, who do you, who do you love, love<br />
Now, now, who do you, who do you love now?<br />
Now, now, who do you, who do you love, love<br />
Now, now, who do you, who do you love now?<br />
You ain&#39;t gotta make it easy (hey), where you been sleepin&#39;? (Hey)<br />
This shit is keepin&#39; me up at night, just admit it<br />
Who do you love, do you love now?<br />
I wanna know, I wanna know who</p>
', 5110, 236, N'20190521130103.mp3', 1, NULL, 2071, 220, 190)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6059, N'Radioactive', NULL, 507, 193, N'20190521135938.mp3', 1, NULL, 2070, 355, 675)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6060, N'Intro', NULL, 9932, 345, N'20190521195600.mp3', 1, 8, 2072, 374, 480)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6061, N'Lost Control', N'<p>[Verse 1: Sorana]<br />
Mirrors they never lie<br />
Don&#39;t see myself inside<br />
Why can&rsquo;t I get it right?<br />
I don&rsquo;t know<br />
You&#39;re always watching me fall<br />
Shadows they like my wall<br />
Why do I feel so small?<br />
I don&#39;t know</p>

<p>[Pre-Chorus: Sorana]<br />
So I walk into the dead of night<br />
Where my monsters like to hide<br />
Chaos feels so good inside<br />
Now I know</p>

<p>[Chorus: Sorana]<br />
I&#39;ve lost, I&#39;ve lost<br />
I&#39;ve lost control again<br />
Always do the same and not to blame I&#39;ve lost control again<br />
I don&#39;t, I don&#39;t<br />
I don&#39;t know who I am<br />
Always do the same and not to blame I&#39;ve lost control again<br />
Ooh</p>

<p>[Verse 2: Sorana]<br />
Tired of being afraid<br />
But lately, I&#39;ve lost my faith<br />
What is love without pain, it ain&#39;t home<br />
You&#39;re watching me but I&#39;m below<br />
When I get caught I hope<br />
This is kinda like how they will<br />
Take me home</p>

<p>[Pre-Chorus: Sorana]<br />
So I walk into the dead of night<br />
Where my monsters like to hide<br />
Chaos feels so good inside<br />
Now I know</p>

<p>[Chorus: Sorana]<br />
I&#39;ve lost, I&#39;ve lost<br />
I&#39;ve lost control again<br />
Always do the same and not to blame I&#39;ve lost control again<br />
I don&#39;t, I don&#39;t<br />
I don&#39;t know who I am<br />
Always do the same and not to blame I&#39;ve lost control again</p>

<p>[Bridge: Sorana]<br />
I know that I&#39;m a mess<br />
But I ain&#39;t trying to be the best<br />
Oh, whatever&#39;s coming next<br />
I better pray-ay-ay-ay<br />
Never said I was an angel<br />
I am damaged all the way<br />
So whatever&#39;s coming next<br />
I better pray-ay-ay-ay</p>

<p>[Outro: Sorana]<br />
I&#39;ve lost, I&#39;ve lost<br />
I&#39;ve lost control again<br />
Always do the same and not to blame I&#39;ve lost control again<br />
I don&#39;t, I don&#39;t<br />
I don&#39;t know who I am<br />
Always do the same and not to blame I&#39;ve lost control again</p>
', 201, 349, N'20190521195728.mp3', 1, 8, 2072, 114, 580)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6062, N'I Don''t Wanna Go', N'<p>[Verse 1: Julie Bergan]&nbsp;<br />
So here we are&nbsp;<br />
Like we were&nbsp;<br />
To feed apart&nbsp;<br />
In different worlds&nbsp;<br />
No need to say&nbsp;<br />
Another word&nbsp;<br />
No, I should leave&nbsp;<br />
But I don&rsquo;t wanna go just yet&nbsp;<br />
&#39;Cause I&#39;m not really over it&nbsp;<br />
<br />
[Chorus: Julie Bergan]&nbsp;<br />
You remind my heart&nbsp;<br />
Of a lie I wish you never told&nbsp;<br />
But it&#39;s all I&#39;ve got&nbsp;<br />
Just five more minutes and I&#39;m gone&nbsp;<br />
Same old song like an echo, ooh&nbsp;<br />
&#39;Cause I know I&#39;m better off alone&nbsp;<br />
It is my pride and I really know I shouldn&#39;t stay but I don&#39;t wanna go&nbsp;<br />
<br />
[Instrumental Break]&nbsp;<br />
<br />
[Verse 2: Julie Bergan]&nbsp;<br />
Now that I know the way it ends&nbsp;<br />
The words we chose, irrelevant&nbsp;<br />
Let&#39;s just pretend a little bit&nbsp;<br />
I know I should leave but&nbsp;<br />
I don&#39;t wanna go just yet&nbsp;<br />
&#39;Cause I&#39;m not really over it&nbsp;<br />
<br />
[Chorus: Julie Bergan]&nbsp;<br />
You remind my heart (You remind my heart)&nbsp;<br />
Of a lie I wish you never told&nbsp;<br />
But it&#39;s all I&#39;ve got (All I&#39;ve got)&nbsp;<br />
Just five more minutes and I&#39;ll go&nbsp;<br />
(Five more minutes and I&#39;ll go)&nbsp;<br />
Same old song like an echo, ooh&nbsp;<br />
&#39;Cause I know I&#39;m better off alone (Better off alone)&nbsp;<br />
It is my pride and I really know I shouldn&#39;t stay but I don&#39;t wanna go&nbsp;<br />
(Ooh, ooh)&nbsp;<br />
<br />
[Outro: Julie Bergan]&nbsp;<br />
Just five more minutes and I&#39;ll go&nbsp;<br />
(Five more minutes and I&#39;ll go) (Ooh, ooh, ooh)&nbsp;<br />
Shouldn&#39;t stay but I don&#39;t wanna go&nbsp;<br />
Same old song like an echo (Ooh, ooh, ooh)&nbsp;<br />
(I&#39;m better off alone)&nbsp;<br />
It is my pride and I really know I shouldn&#39;t stay but I don&#39;t wanna go</p>
', 8987, 285, N'20190521195925.mp3', 1, 8, 2072, 224, 511)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6063, N'Unity', N'<p>Stand together like we&#39;re rocks in a wall&nbsp;<br />
Growing stronger everyday, even more&nbsp;<br />
Stand together in the eye of the storm&nbsp;<br />
And show the whole world who we are, oh&nbsp;</p>

<p>Keep on walking to the sound of the drums&nbsp;<br />
Feel the fire run through our lungs&nbsp;<br />
Find our treasure in the light of the sun&nbsp;<br />
And show the whole world who we are, oh</p>
', 5216, 37, N'20190521200531.mp3', 1, 9, 2073, 273, 534)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6064, N'Nhất Tiếu Khuynh Thành / 一笑倾城', N'<p>Wǒ zǒng sh&igrave; qīngm&iacute;aod&agrave;nxiě g&agrave;os&ugrave; nǐ wǒ de y&ugrave;anw&agrave;ng&nbsp;</p>

<p>yě gěi nǐ qiāny&aacute;n w&agrave;n yǔ dōu shuō bu j&igrave;n de m&ugrave;guāng&nbsp;</p>

<p>Zh&egrave; sh&igrave;j&igrave;e zǒng yǒur&eacute;n z&agrave;i m&aacute;ng mang l&ugrave;l&ugrave; x&uacute;nbǎo z&agrave;ng&nbsp;</p>

<p>qu&egrave; w&ugrave;le f&uacute;sh&igrave; jiāoy&aacute;ng yě c&ugrave;og&ugrave;o r&eacute;njiān w&agrave;nx&igrave;ang&nbsp;</p>

<p>Gǔch&eacute;ng lǐ ch&aacute;ng q&iacute;ao sh&agrave;ng r&eacute;n r&uacute; hǎi chē ch&eacute;ngx&iacute;ng&nbsp;</p>

<p>zhāngbīnbīn:&nbsp;</p>

<p>Nǐ x&igrave;ao d&eacute; x&igrave;ang guāngm&aacute;ng m&ograve;r&aacute;n bǎ wǒ zh&agrave;o l&igrave;ang&nbsp;</p>

<p><br />
Fēng qīngy&aacute;ng x&igrave;a weiy&agrave;̄ng l&iacute;n yīn l&ugrave; dānchē xiǎng&nbsp;</p>

<p><br />
Y&uacute;anl&aacute;i suǒw&egrave;i &agrave;iq&iacute;ng sh&igrave; zh&egrave; muy&aacute;̀ng&nbsp;</p>

<p><br />
J&igrave;u ch&eacute;ngr&egrave;n yīx&igrave;ao qīngch&eacute;ng yī j&igrave;an z&igrave; n&aacute;nw&agrave;ng&nbsp;</p>

<p>Shuō sh&eacute;nme q&iacute;ng shēn s&igrave; hǎi wǒ qu&egrave; b&ugrave; gǎndāng&nbsp;</p>

<p><br />
Z&ugrave;i l&agrave;ngm&agrave;n b&ugrave;g&ugrave;o yǔ nǐ b&igrave;ngjiān k&agrave;n xīy&aacute;ng&nbsp;</p>

<p>wǒ xīn zhī suǒ x&igrave;ang&nbsp;</p>

<p>Xiǎng h&eacute; nǐ y&oacute;u s&igrave;fāng shǎng q&iacute;ngyǔ de fēngguāng&nbsp;</p>

<p>xiǎng h&eacute; nǐ p&ugrave; zhǐ bǐ xiě &yacute;ushēng de piānzhāng&nbsp;</p>

<p>x&igrave;ao yǔ l&egrave;i dōu fēnxiǎng guǎn q&iacute;ngj&iacute;e duō diēd&agrave;ng&nbsp;</p>

<p>wǒmen b&uacute; s&agrave;nchǎng&nbsp;</p>

<p>Nǐ sh&igrave; wǒ ǒur&aacute;n tīngw&eacute;n m&iacute;nggǎn &yacute;u xīn de gēch&agrave;ng&nbsp;</p>

<p>yěsh&igrave; wǒ jīng h&oacute;ng yīpiē &eacute;rh&ograve;u yǒngb&agrave;o de fēnfāng&nbsp;</p>

<p><br />
Zh&egrave; sh&igrave;j&igrave;e fēngh&uacute;a zh&egrave;ng m&agrave;o kě b&iacute;e gūf&ugrave; hǎo sh&iacute;guāng&nbsp;</p>

<p>l&igrave;u y&ugrave;e fēng zǒu jiē chuān x&igrave;ang&nbsp;</p>

<p>l&igrave;u y&ugrave;e huā m&ograve; sh&agrave;ng sh&egrave;ng f&agrave;ng&nbsp;</p>

<p>Gǔch&eacute;ng lǐ ch&aacute;ng q&iacute;ao sh&agrave;ng r&eacute;n r&uacute; hǎi chē ch&eacute;ngx&iacute;ng&nbsp;</p>

<p>Nǐ x&igrave;ao d&eacute; x&igrave;ang guāngm&aacute;ng m&ograve;r&aacute;n bǎ wǒ zh&agrave;o l&igrave;ang&nbsp;</p>

<p><br />
Fēng qīngy&aacute;ng x&igrave;a weiy&agrave;̄ng l&iacute;n yīn l&ugrave; dānchē xiǎng&nbsp;</p>

<p>Y&uacute;anl&aacute;i suǒw&egrave;i &agrave;iq&iacute;ng sh&igrave; zh&egrave; muy&aacute;̀ng&nbsp;</p>

<p>J&igrave;u ch&eacute;ngr&egrave;n yīx&igrave;ao qīngch&eacute;ng yī j&igrave;an z&igrave; n&aacute;nw&agrave;ng&nbsp;</p>

<p>shuō sh&eacute;nme q&iacute;ng shēn s&igrave; hǎi wǒ qu&egrave; b&ugrave; gǎndāng&nbsp;</p>

<p><br />
Z&ugrave;i l&agrave;ngm&agrave;n b&ugrave;g&ugrave;o yǔ nǐ b&igrave;ngjiān k&agrave;n xīy&aacute;ng&nbsp;</p>

<p>wǒ xīn zhī suǒ x&igrave;ang&nbsp;</p>

<p>Xiǎng h&eacute; nǐ y&oacute;u s&igrave;fāng shǎng q&iacute;ngyǔ de fēngguāng&nbsp;</p>

<p>xiǎng h&eacute; nǐ p&ugrave; zhǐ bǐ xiě &yacute;ushēng de piānzhāng&nbsp;</p>

<p>x&igrave;ao yǔ l&egrave;i dōu fēnxiǎng guǎn q&iacute;ngj&iacute;e duō diēd&agrave;ng&nbsp;</p>

<p>wǒmen b&uacute; s&agrave;nchǎng</p>
', 734, 304, N'20190521201705.mp3', 1, 10, 2074, 114, 851)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6065, N'Nụ Cười Của Vi Vi Rất Khuynh Thành', N'<p>Yu shui di zai wo de wai tao Si nian jin tou wo de yi jiao Ni ge de an hao Wei wei yi xiao Chu xian de gang gang hao Ca jian er guo ni de fa shao Xiang shi chun feng chui lu qing cao Lang man zai fa xiao Zhi yuan wei ni Gan zou suo you fan nao Dai ni dao tian ya hai jiao Ting ni de xin tiao Xiang gei ni yi ge yong bao Rang quan shi jie zhi dao [Chorus] Yu jian ni wo cai zhi dao ni dui wo dou zhong yao Mei you ren neng gan jue dao ni zui tian mei de xiao Wo zai bu yong ba bie ren xun zhao yin wei wo yi jing zhao dao Wo men de yuan fen gang hao bu xu bie ren da rao Da pei ai qing de mei miao zhi you wo men zhi dao Jin jin wei rao ni mei fen mei miao ni dui wo duo mo(me) zhong yao</p>
', 2293, 341, N'20190521201802.mp3', 1, 10, 2075, 176, 879)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6066, N'Học Mèo Kêu (学猫叫)', NULL, 5225, 238, N'20190521204715.mp3', 1, NULL, NULL, 145, 788)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6067, N'Hoa Rơi Thành Bùn / 落花成泥', N'<p>Yue yuan feng dan chui san chen xiang&nbsp;<br />
Jiang men qing yan shang&nbsp;<br />
Zhua yi wei dang gui ru yao tang&nbsp;<br />
Xiang si lei xu duan xin tou shang&nbsp;</p>

<p>Nian er liang shou wu zai zhi shang&nbsp;<br />
Yao yin shi huang liang&nbsp;<br />
Ban xia xin yue zhao qian li guang&nbsp;<br />
Yu jun yi bie liang cang mang&nbsp;</p>

<p>Bing lang ci qu wu gui qi qing deng lai sheng zai xu<br />
Ru zhen qu wang bu liu xing&nbsp;<br />
Deng xin ran jin lu huo ting&nbsp;<br />
Yi wan hui xiang du huo&nbsp;</p>

<p>Huan xin tang qing jun yi pin&nbsp;<br />
Da yu xi xi li li mo hu yan jing&nbsp;<br />
Que rang ceng jing geng qing xi&nbsp;<br />
Wei jun zai zou yi qu jin xi he xi&nbsp;</p>

<p>Miao shou nan hui tian zhu ding&nbsp;<br />
Da yu xi xi li li zhan shi hui yi&nbsp;<br />
Hen bie li wu yao ke yu&nbsp;<br />
Ren you qing er tian wu yi&nbsp;</p>

<p>Dai yun dou san qu&nbsp;<br />
Sheng minh yue tan xi&nbsp;<br />
Xi xin xie xia zui hou yao fang&nbsp;<br />
Man man de feng shang&nbsp;</p>

<p>Chi wang zhao ni zai de fang xiang&nbsp;<br />
Xiang ni shi fou ye yi yang&nbsp;<br />
Bing lang ci qu wu gui qi qing deng lai sheng zai xu&nbsp;<br />
Ru zhen qu wang bu liu xing&nbsp;</p>

<p>Deng xin ran jin lu huo ting&nbsp;<br />
Yi wan hui xiang du huo&nbsp;<br />
Huan xin tang qing jun yi pin&nbsp;<br />
Da yu xi xi li li mo hu yan jing&nbsp;</p>

<p>Que rang ceng jing geng qing xi&nbsp;<br />
Wei jun zai zou yi qu jin xi he xi&nbsp;<br />
Miao shou nan hui tian zhu ding&nbsp;<br />
Da yu xi xi li li zhan shi hui yi&nbsp;</p>

<p>Hen bie li wu yao ke yu&nbsp;<br />
Ren you qing er tian wu yi&nbsp;<br />
Dai yun dou san qu&nbsp;<br />
Sheng minh yue tan xi&nbsp;</p>

<p>Ting wan feng ye qi qi luo hua cheng ni&nbsp;<br />
Jiu lian yu ye sheng sheng qing&nbsp;<br />
Zai chan</p>
', 3595, 222, N'20190521205413.mp3', 1, 13, 2078, 187, 485)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6068, N'Thán Vân Hề / 叹云兮', NULL, 2509, 46, N'20190521205538.mp3', 1, 13, 2078, 95, 589)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6069, N'See You Again', N'<p>It&#39;s been a long day without you my friend<br />
And I&#39;ll tell you all about it when I see you again<br />
We&#39;ve come a long way from where we began<br />
Oh, I&#39;ll tell you all about it when I see you again<br />
When I see you again</p>

<p>Why&#39;d you have to leave so soon?<br />
Why&#39;d you have to go?<br />
Why&#39;d you have to leave me when I needed you the most?</p>

<p>&#39;Cause I don&#39;t really know how to tell you<br />
Without feeling much worse<br />
I know you&#39;re in a better place<br />
But it&#39;s always gonna hurt</p>

<p>Carry on<br />
Give me all the strength I need to carry on</p>

<p>It&#39;s been a long day without you my friend<br />
And I&#39;ll tell you all about it when I see you again<br />
We&#39;ve come a long way from where we began<br />
Oh, I&#39;ll tell you all about it when I see you again<br />
When I see you again</p>

<p>How do I breathe without you<br />
I&#39;m feeling so cold<br />
I&#39;ll be waiting right here for you&nbsp;<br />
Till the day you&#39;re home</p>

<p>Carry on<br />
Give me all the strength I need to carry on</p>

<p>So let the light guide your way<br />
Hold every memory as you go<br />
And every road you take will always lead you home</p>

<p>It&#39;s been a long day without you my friend<br />
And I&#39;ll tell you all about it when I see you again<br />
We&#39;ve come a long way from where we began<br />
Oh, I&#39;ll tell you all about it when I see you again<br />
When I see you again</p>
', 1775, 11, N'20190521210952.mp3', 1, NULL, 2069, 83, 165)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6070, N'HaruHaru', NULL, 7407, 186, N'20190521204906.mp3', 1, NULL, 2080, 472, 331)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6071, N'GaraGaraGo', NULL, 7385, 302, N'20190521205114.mp3', 1, NULL, 2080, 22, 66)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6072, N'Haiiro To Ao Masaki Suda', N'<p><br />
Sodetake ga obotsukanai natsu no owari<br />
akegata no densha ni yurare te omoidashi ta<br />
natsukashii ano fūkei<br />
takusan no tōmawari o kurikaeshi te<br />
onaji yō na machinami ga tada tōrisugi ta<br />
mado ni boku ga utsutteru<br />
&nbsp;<br />
kimi wa ima mo ano koro mitai ni<br />
iru no daro u ka<br />
hishage te magatta<br />
ano jitensha de hashirimawatta<br />
bakabakashii tsunawatari hiza ni nijin da chi<br />
ima wa nandaka hidoku munashii<br />
&nbsp;<br />
dore dake setake ga kawaro u tomo<br />
kawara nai nani ka ga ari masu yō ni<br />
kudaranai omokage ni hagemasare<br />
ima mo utau ima mo utau ima mo utau<br />
&nbsp;<br />
sewashinaku machi o hashiru takushī ni<br />
bonyari to seoware ta mama<br />
kushami o shi ta<br />
mado no soto o nagameru<br />
kokorokara furue ta ano shunkan ni<br />
mōichido deae tara ii to tsuyoku omou<br />
wasureru koto wa nai n da<br />
kimi wa ima mo ano koro mitai ni<br />
iru no daro u ka<br />
kutsu o katahō shigemi ni otoshi te sagashimawatta<br />
&nbsp;<br />
&lsquo;nani ga aro u to bokura wa kitto<br />
umaku iku&rsquo; to<br />
mujaki ni warae ta hibi o oboe te iru<br />
&nbsp;<br />
dore dake buzama ni kizutsuko u tomo<br />
owara nai mainichi ni hanataba o<br />
kudaranai omokage o oikake te<br />
ima mo utau ima mo utau ima mo utau<br />
&nbsp;<br />
asahi ga noboru mae no kake ta tsuki o<br />
kimi mo doko ka de mi te iru ka na<br />
nazeka wake mo nai noni mune ga itaku te<br />
nijimu kao kasumu iro<br />
&nbsp;<br />
imasara kanashii to sakebu ni wa<br />
amarini subete ga oso sugi ta ka na<br />
mōichido hajime kara arukeru nara<br />
surechigau yō ni kimi ni ai tai<br />
&nbsp;<br />
dore dake setake ga kawaro u tomo<br />
kawara nai nani ka ga ari masu yō ni<br />
kudaranai omokage ni hagemasare<br />
ima mo utau ima mo utau ima mo utau<br />
&nbsp;<br />
asahi ga noboru mae no kake ta tsuki o<br />
kimi mo doko ka de mi te iru ka na<br />
nani mo nai to waraeru asahi ga ki te<br />
hajimari wa aoi iro</p>
', 5520, 104, N'20190521205658.mp3', 1, 14, NULL, 78, 878)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6073, N'Lemon', N'<p><br />
Yume naraba dore hodo yokatta deshou<br />
Imada ni anata no koto wo yume ni miru<br />
Wasureta mono wo tori ni kaeru you ni<br />
Furubita omoide no hokori wo harau<br />
&nbsp;<br />
Modoranai shiawase ga aru koto wo<br />
Saigo ni anata ga oshiete kureta<br />
Iezu ni kakushiteta kurai kako mo<br />
Anata ga inakya eien ni kurai mama<br />
&nbsp;<br />
Kitto mou kore ijou kizutsuku koto nado<br />
Ari wa shinai to wakatte iru<br />
&nbsp;<br />
Ano hi no kanashimi sae ano hi no kurushimi sae<br />
Sono subete wo aishiteta anata to tomo ni<br />
Mune ni nokori hanarenai nigai remon no nioi<br />
Ame ga furiyamu made wa kaerenai<br />
Ima demo anata wa watashi no hikari<br />
&nbsp;<br />
Kurayami de anata no se wo nazotta<br />
Sono rinkaku wo senmei ni oboete iru<br />
Uketome kirenai mono to deau tabi<br />
Afurete yamanai no wa namida dake<br />
&nbsp;<br />
Nani wo shiteita no nani wo miteita no<br />
Watashi no shiranai yokogao de<br />
&nbsp;<br />
Dokoka de anata ga ima watashi to onaji you na<br />
Namida ni kure sabishisa no naka ni iru nara<br />
Watashi no koto nado douka wasurete kudasai<br />
Sonna koto wo kokoro kara negau hodo ni<br />
Ima demo anata wa watashi no hikari<br />
&nbsp;<br />
Jibun ga omou yori<br />
Koi wo shiteita anata ni<br />
Are kara omou you ni<br />
Iki ga dekinai<br />
&nbsp;<br />
Anna ni soba ni ita no ni<br />
Marude uso mitai<br />
Totemo wasurerarenai<br />
Sore dake ga tashika<br />
&nbsp;<br />
Ano hi no kanashimi sae ano hi no kurushimi sae<br />
Sono subete wo aishiteta anata to tomo ni<br />
Mune ni nokori hanarenai nigai remon no nioi<br />
Ame ga furiyamu made wa kaerenai<br />
Kiriwaketa kajitsu no katahou no you ni<br />
Ima demo anata wa watashi no hikari</p>
', 4468, 57, N'20190521205846.mp3', 1, NULL, 2081, 73, 707)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6074, N'Tokyo Ghetto', N'<p>dare demo ii ya<br />
dare demo ii kara dareka inai ka<br />
koe de wa nai ga<br />
niramu shisen ga<br />
futatsu to aru to omoeta</p>

<p>kore de osaraba<br />
jubaku kara saraba yoru ga toketa<br />
koukishin datta yuushitessen no<br />
mukougawa e to</p>

<p>zenzen kyoumi nai tte<br />
chou ga maikomeba<br />
souzoudoori datta<br />
to ieba uso ni naru ga<br />
taihaiteki datta<br />
koohii no awa o koboshita</p>

<p>sonna sonna<br />
mainichi datta boku no mae ni<br />
arawareta kimi wa</p>

<p>doushita tte doushita tte<br />
susumenai mama da<br />
hippiina kono machi no saga ni<br />
dou yatte dou yatte riyuu o<br />
&quot;daiji nan da zenbu&quot;<br />
kikoe dake wa ii keredo</p>

<p>mukougawa kara totsujo<br />
arawarete kizukeba<br />
tsurete ikarete shimaisou na bokura<br />
tebanasu koto ni<br />
obiete kimi wa kyou mo sutei<br />
kimi wa kyou mo sutei</p>

<p>anatagata ni wa<br />
anatagata ni wa osewa ni natta<br />
oboe wa nai ga<br />
nanika to iitai<br />
sonna kao shite imasu ga</p>

<p>me ni utsuru mono ga<br />
koko ni aru mono subete<br />
ga nisemono deshita<br />
jou ni kaketa tte bou ni futtatte<br />
ima ni hajimaru</p>

<p>seizei shita o kande<br />
soko de damatte ireba<br />
souteidoori datta<br />
to ieba uso ni naru ga<br />
kanshouteki datta<br />
kimirashiku wa nai ga</p>

<p>sonna sonna<br />
hyoujou ga isshun boku no me ni wa<br />
utsukushiku utsuttemashita</p>

<p>zutto dokoka de anata ni akogare<br />
sono tabi jibun o ushinaikakete imashita<br />
honmono o koero<br />
bibireba kimi wa kyou mo sutei</p>

<p>doushita tte doushita tte<br />
susumenai mama da<br />
hippiina kono machi no saga ni<br />
dou yatte dou yatte riyuu o<br />
&quot;daiji nan da zenbu&quot;<br />
kikoe dake wa ii keredo</p>

<p>mukougawa kara totsujo<br />
arawarete kizukeba<br />
tsurete ikarete shimaisou na bokura<br />
tebanasu koto ni<br />
obiete kimi wa kyou mo sutei</p>

<p>zutto dokoka de anata ni akogare<br />
sono tabi jibun o ushinaikakete imashita<br />
honmono o koero<br />
bibireba kimi wa kyou mo sutei<br />
kimi wa kyou mo sutei<br />
kimi wa kyou mo sutei</p>
', 422, 141, N'20190521210512.mp3', 1, 14, 2082, 398, 405)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6075, N'Kimi No Na Wa (Sparkle)', N'<p>mada kono sekai wa boku o kainarashitetai mitai da<br />
nozomidoori darou? utsukushiku mogaku yo</p>

<p><br />
tagai no sunadokei nagamenagara kisu o shiyou yo<br />
&ldquo;sayonara&rdquo; kara ichiban tooi basho de machiawaseyou</p>

<p><br />
jisho ni aru kotoba de dekiagatta sekai o nikunda<br />
mangekyou no naka de hachigatsu no aru asa</p>

<p><br />
kimi wa boku no mae de hanikande wa sumashitemiseta<br />
kono sekai no kyoukasho no you na egao de</p>

<p><br />
tsui ni toki wa kita kinou made wa joshou no joshou de<br />
tobashiyomi de ii kara kokkara ga boku dayo<br />
keiken to chishiki to kabi no haekakatta yuuki o motte<br />
imada katsute nai supiido de kimi no moto e daibu o</p>

<p><br />
madoromi no naka de namanurui koora ni<br />
koko de nai dokka o yumemita yo<br />
kyoushitsu no mado no soto ni<br />
densha ni yurare hakobareru asa ni</p>

<p><br />
aishikata saemo kimi no nioi ga shita<br />
arukikata saemo sono waraigoe ga shita</p>

<p><br />
itsuka kiete nakunaru kimi no subete o<br />
kono me ni yakitsuketeoku koto wa<br />
mou kenri nanka janai gimu da to omounda</p>

<p><br />
unmei da toka mirai toka tte kotoba ga doredake te o nobasou to<br />
todokanai basho de bokura koi o suru<br />
tokei no hari mo futari o yokome ni minagara susumu<br />
sonna sekai o futari de isshou iya, nanshou demo</p>

<p><br />
ikinuiteyukou<br />
&nbsp;</p>
', 7866, 360, N'20190521211732.mp3', 1, 14, 2075, 167, 483)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6076, N'DuDduduDduduRemix', NULL, 9766, 370, N'20190521212256.mp3', 1, 15, 2076, 10, 54)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6077, N'Hope Not', NULL, 8323, 69, N'20190521212346.mp3', 1, 15, 2076, 297, 809)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6078, N'Kick It', NULL, 4946, 259, N'20190521212756.mp3', 1, 15, 2076, 459, 946)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6079, N'LoveShot', NULL, 4237, 230, N'20190521213343.mp3', 1, 16, 2077, 24, 89)
INSERT [dbo].[Song] ([ID], [Name], [Lyrics], [Views], [Likes], [FileName], [Status], [Album], [Composer], [ViewsPerWeek], [ViewsPerMonth]) VALUES (6080, N'Monster', NULL, 7929, 258, N'20190521213437.mp3', 1, 16, 2077, 92, 490)
SET IDENTITY_INSERT [dbo].[Song] OFF
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1, 2002)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1, 6031)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1, 6035)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1, 6038)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2, 2003)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2, 5003)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2, 5004)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1002, 2004)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1003, 2005)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1005, 2007)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1008, 2009)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1009, 2010)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1013, 6035)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1013, 6039)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1014, 2006)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1016, 6028)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1018, 6030)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1022, 5005)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1022, 5006)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1023, 2012)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1026, 6040)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1028, 2011)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1029, 6039)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (1030, 2008)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2043, 5007)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2043, 5008)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2043, 5009)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2044, 6031)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2047, 6036)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2047, 6037)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2048, 6039)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2049, 6038)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2049, 6049)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2050, 6049)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2051, 6040)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2053, 6029)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2053, 6040)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2055, 6051)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2056, 6051)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2057, 6043)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2058, 6044)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2059, 6041)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2060, 6041)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2061, 6042)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2061, 6045)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2064, 6046)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2064, 6048)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2067, 6047)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2068, 6054)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2068, 6055)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2068, 6056)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2069, 6052)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2069, 6069)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2070, 6053)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2070, 6059)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2071, 6057)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2071, 6058)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2072, 6060)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2072, 6061)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2072, 6062)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2073, 6063)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2074, 6064)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2075, 6065)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2076, 6066)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2077, 6066)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2078, 6067)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2078, 6068)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2079, 6069)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2080, 6070)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2080, 6071)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2081, 6072)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2081, 6073)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2082, 6074)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2083, 6075)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2084, 6076)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2084, 6077)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2084, 6078)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2085, 6079)
INSERT [dbo].[Song_Artist] ([Artist], [Song]) VALUES (2085, 6080)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2002, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2003, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2004, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2005, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2006, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2007, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2008, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2009, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2010, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2011, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (2012, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (5003, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (5005, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (5006, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (5007, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (5008, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (5009, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6028, 12)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6029, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6029, 10)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6030, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6031, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6035, 3)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6035, 5)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6036, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6037, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6038, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6039, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6040, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6040, 9)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6041, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6042, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6043, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6044, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6045, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6046, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6047, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6048, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6049, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6051, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6052, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6053, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6054, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6055, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6056, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6057, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6057, 3)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6058, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6058, 3)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6059, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6060, 3)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6061, 3)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6062, 3)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6063, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6063, 3)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6063, 7)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6064, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6065, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6066, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6067, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6068, 8)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6069, 1)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6070, 6)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6071, 6)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6072, 14)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6073, 14)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6074, 14)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6075, 14)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6076, 6)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6077, 6)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6078, 6)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6079, 6)
INSERT [dbo].[Song_Genre] ([Song], [Genre]) VALUES (6080, 6)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2003, 1, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2003, 1016, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2003, 1025, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2004, 1, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2005, 1016, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2006, 1, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2006, 1022, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2007, 1, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2007, 12, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2009, 9, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2011, 11, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2011, 1012, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (2012, 1027, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5003, 1, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5003, 11, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5005, 8, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5005, 1012, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5006, 1, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5006, 1014, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5007, 1, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5007, 1016, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (5007, 1018, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (6029, 1016, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (6029, 1021, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (6038, 1016, 1)
INSERT [dbo].[Song_PlayList] ([Song], [PlayList], [Status]) VALUES (6054, 1027, 1)
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'abc', N'd41d8cd98f00b204e9800998ecf8427e', 0, 0, N'0346354514', N'khoatd152@gmail.com', NULL, NULL, N'a', CAST(N'2019-05-18T07:16:51.470' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'ad', N'202cb962ac59075b964b07152d234b70', 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-21T16:52:42.090' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'ad2', N'202cb962ac59075b964b07152d234b70', 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-21T16:53:37.743' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'ad3', N'202cb962ac59075b964b07152d234b70', 1, 1, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-21T16:53:46.980' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'admin', N'202cb962ac59075b964b07152d234b70', 1, 1, N'0123456789', N'asds', NULL, NULL, N'Admin', CAST(N'2019-05-21T16:12:30.593' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'khoa', N'85be77a1cbcbd155c382613953f3add8', 0, 0, N'0346354516', N'khoatd152@gmail.com', NULL, NULL, N'Trà Đăng Khoa', CAST(N'2019-03-28T20:12:16.050' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'khoatd', N'd41d8cd98f00b204e9800998ecf8427e', 0, 1, N'0346354516', N'sdjfnjsdkj', NULL, NULL, N'Trà Đăng Khoa', CAST(N'2019-03-28T21:18:25.187' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N't', N'202cb962ac59075b964b07152d234b70', 0, 1, N'0346354516', N'khoatd@gmail.com', NULL, NULL, N'Trà Đăng Khoa', CAST(N'2019-05-18T19:41:42.967' AS DateTime))
INSERT [dbo].[User] ([UserName], [Password], [Role], [Status], [Phone], [Email], [Image], [Description], [Name], [CreatedDate]) VALUES (N'test', N'd41d8cd98f00b204e9800998ecf8427e', 0, 1, N'0346354515', N'khoatd@gmail.com', NULL, NULL, N'Trà Đăng Khoa', CAST(N'2019-05-18T19:39:13.703' AS DateTime))
ALTER TABLE [dbo].[Artist_Album]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Album_Album] FOREIGN KEY([Album])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[Artist_Album] CHECK CONSTRAINT [FK_Artist_Album_Album]
GO
ALTER TABLE [dbo].[Artist_Album]  WITH CHECK ADD  CONSTRAINT [FK_Artist_Album_Artist] FOREIGN KEY([Artist])
REFERENCES [dbo].[Artist] ([ID])
GO
ALTER TABLE [dbo].[Artist_Album] CHECK CONSTRAINT [FK_Artist_Album_Artist]
GO
ALTER TABLE [dbo].[Artist_User]  WITH CHECK ADD  CONSTRAINT [FK_Artist_User_Artist] FOREIGN KEY([Artist])
REFERENCES [dbo].[Artist] ([ID])
GO
ALTER TABLE [dbo].[Artist_User] CHECK CONSTRAINT [FK_Artist_User_Artist]
GO
ALTER TABLE [dbo].[Artist_User]  WITH CHECK ADD  CONSTRAINT [FK_Artist_User_User] FOREIGN KEY([User])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Artist_User] CHECK CONSTRAINT [FK_Artist_User_User]
GO
ALTER TABLE [dbo].[Playlist]  WITH CHECK ADD  CONSTRAINT [FK_Playlist_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[Playlist] CHECK CONSTRAINT [FK_Playlist_User]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Album] FOREIGN KEY([Album])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Album]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Artist] FOREIGN KEY([Composer])
REFERENCES [dbo].[Artist] ([ID])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Artist]
GO
ALTER TABLE [dbo].[Song_Artist]  WITH CHECK ADD  CONSTRAINT [FK_Song_Artist_Artist] FOREIGN KEY([Artist])
REFERENCES [dbo].[Artist] ([ID])
GO
ALTER TABLE [dbo].[Song_Artist] CHECK CONSTRAINT [FK_Song_Artist_Artist]
GO
ALTER TABLE [dbo].[Song_Artist]  WITH CHECK ADD  CONSTRAINT [FK_Song_Artist_Song] FOREIGN KEY([Song])
REFERENCES [dbo].[Song] ([ID])
GO
ALTER TABLE [dbo].[Song_Artist] CHECK CONSTRAINT [FK_Song_Artist_Song]
GO
ALTER TABLE [dbo].[Song_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Song_Genre_Genre] FOREIGN KEY([Genre])
REFERENCES [dbo].[Genre] ([ID])
GO
ALTER TABLE [dbo].[Song_Genre] CHECK CONSTRAINT [FK_Song_Genre_Genre]
GO
ALTER TABLE [dbo].[Song_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Song_Genre_Song] FOREIGN KEY([Song])
REFERENCES [dbo].[Song] ([ID])
GO
ALTER TABLE [dbo].[Song_Genre] CHECK CONSTRAINT [FK_Song_Genre_Song]
GO
ALTER TABLE [dbo].[Song_PlayList]  WITH CHECK ADD  CONSTRAINT [FK_Song_PlayList_Playlist] FOREIGN KEY([PlayList])
REFERENCES [dbo].[Playlist] ([ID])
GO
ALTER TABLE [dbo].[Song_PlayList] CHECK CONSTRAINT [FK_Song_PlayList_Playlist]
GO
ALTER TABLE [dbo].[Song_PlayList]  WITH CHECK ADD  CONSTRAINT [FK_Song_PlayList_Song] FOREIGN KEY([Song])
REFERENCES [dbo].[Song] ([ID])
GO
ALTER TABLE [dbo].[Song_PlayList] CHECK CONSTRAINT [FK_Song_PlayList_Song]
GO
/****** Object:  StoredProcedure [dbo].[getRankForMonth]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getRankForMonth]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	delete from RankForMonth 
	
	 insert RankForMonth select top 200 row_number() over(order by ViewsPerMonth desc) as Rank, 
	 id as Song from Song where Status =1
	
	update Song set ViewsPerMonth=0	
END

GO
/****** Object:  StoredProcedure [dbo].[getRankForWeek]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getRankForWeek]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	delete from RankForWeek 
	
	 insert RankForWeek select top 20 row_number() over(order by ViewsPerWeek desc) as Rank, 
	 id as Song from Song where Status =1
	
	update Song set ViewsPerWeek=0	
END
GO
/****** Object:  StoredProcedure [dbo].[GetRankMonthNotFormat]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRankMonthNotFormat]
AS
BEGIN

	DELETE 
		FROM RankForMonth
	
	INSERT RankForMonth 
		SELECT TOP 200 
			row_number() OVER(ORDER BY ViewsPerMonth DESC) AS Rank, 
			ID AS Song 
		FROM Song WHERE Status =1
END 

GO
/****** Object:  StoredProcedure [dbo].[GetRankWeekNotFormat]    Script Date: 22-May-19 8:21:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRankWeekNotFormat]
AS
BEGIN
	
	DELETE 
		FROM RankForWeek

	INSERT RankForWeek 
		SELECT TOP 200 
			row_number() OVER(ORDER BY ViewsPerWeek DESC) AS Rank, 
			ID AS Song 
		FROM Song WHERE Status =1
END 
GO
USE [master]
GO
ALTER DATABASE [QuanLyWebsiteNgheNhac] SET  READ_WRITE 
GO
