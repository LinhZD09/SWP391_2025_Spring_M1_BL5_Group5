USE [master]
GO
CREATE DATABASE [ShopYouAndMeVersionFinal]

ALTER DATABASE [ShopYouAndMeVersionFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET  MULTI_USER 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopYouAndMeVersionFinal]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[AboutId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ImageURL] [varchar](255) NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[total] [money] NOT NULL,
	[payment] [varchar](250) NOT NULL,
	[address] [ntext] NOT NULL,
	[date] [date] NOT NULL,
	[phone] [bigint] NOT NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[size] [nchar](10) NOT NULL,
	[color] [nvarchar](150) NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cart_id] [bigint] NOT NULL,
	[product_id] [varchar](100) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_img] [varchar](255) NOT NULL,
	[product_price] [float] NOT NULL,
	[total] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_describe] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_active](
	[product_id] [varchar](100) NOT NULL,
	[active] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [varchar](100) NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [varchar](100) NULL,
	[user_id] [bigint] NULL,
	[created_at] [datetime] NULL,
	[Rating] [int] NULL,
	[comment] [nvarchar](255) NULL,
	[user_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_saleOFF](
	[sale_id] [int] NOT NULL,
	[product_id] [varchar](100) NULL,
	[discount_percentage] [decimal](5, 2) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[id_report] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[content_report] [nvarchar](max) NULL,
	[subject_report] [nvarchar](255) NULL,
	[user_email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [nvarchar](50) NULL,
	[dateOfBirth] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[phoneNumber] [varchar](10) NULL,
	[banned] [bit] NULL,
	[adminReason] [nvarchar](50) NULL,
	[isStoreStaff] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutId], [Title], [ImageURL], [Content]) VALUES (10, N'dongc', N'images/about2.jpg', N'<p>dđsssss</p>')
SET IDENTITY_INSERT [dbo].[About] OFF
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (45, 5, 648000.0000, N'MOMO', N'Tiền Hải,Thái Bình', CAST(N'2024-05-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (46, 5, 298000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (47, 5, 378000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (48, 5, 270000.0000, N'Chua thanh toán (VNPAY)', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (49, 5, 417000.0000, N'Chua thanh toán (VNPAY)', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (50, 5, 567000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (51, 5, 278000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-04' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (52, 5, 189000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (53, 5, 259000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (54, 5, 270000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (55, 5, 259000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (56, 5, 810000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (57, 5, 149000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (58, 5, 417000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (59, 5, 149000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (60, 5, 517000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (61, 5, 139000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (62, 13, 2750000.0000, N'MOMO', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (63, 13, 2880000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (64, 1, 240000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (65, 1, 169000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (66, 1, 210000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (67, 1, 1450000.0000, N'VNPAY', N'Thái Bình', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (68, 16, 600000.0000, N'COD', N'Thái Bình', CAST(N'2024-06-05' AS Date), 98272722)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (69, 1, 150000.0000, N'MOMO', N'daihocfpt', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (70, 17, 298000.0000, N'MOMO', N'daihocfpt', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (71, 17, 1240000.0000, N'COD', N'daihocfpt', CAST(N'2024-06-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (73, 17, 100000.0000, N'COD', N'Ha Noi', CAST(N'2024-05-05' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (74, 14, 120000.0000, N'MOMO', N'Thai Binh', CAST(N'2024-06-14' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (75, 5, 150000.0000, N'MOMO', N'Thai Binh', CAST(N'2024-06-14' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (76, 5, 60000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-14' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (77, 8, 398000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-19' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (78, 1, 25000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-22' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (79, 1, 420000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-23' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (80, 1, 300000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-23' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (81, 1, 644000.0000, N'COD', N'hhhh', CAST(N'2024-06-23' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (82, 1, 199000.0000, N'VNPAY', N'hhhh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (83, 1, 250000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (84, 1, 349000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (85, 1, 420000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (86, 1, 290000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (87, 1, 544000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (88, 1, 259000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (89, 1, 877000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-25' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (90, 1, 300000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-26' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (91, 1, 60000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-26' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (92, 1, 60000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-26' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (93, 1, 300000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-26' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (94, 1, 300000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-26' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (95, 1, 300000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-26' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (96, 10, 300000.0000, N'VNPAY', N'Thai Binh', CAST(N'2024-06-26' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (97, 13, 300000.0000, N'COD', N'Thai Binh', CAST(N'2024-06-28' AS Date), 348956373)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (98, 10, 599000.0000, N'COD', N'ha noi', CAST(N'2024-07-01' AS Date), 348956375)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (99, 10, 99000.0000, N'VNPAY', N'ha noi', CAST(N'2024-07-01' AS Date), 348956375)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (100, 10, 290000.0000, N'VNPAY', N'thai binh', CAST(N'2024-07-01' AS Date), 348956375)
INSERT [dbo].[bill] ([bill_id], [user_id], [total], [payment], [address], [date], [phone]) VALUES (101, 10, 169000.0000, N'VNPAY', N'thai binh', CAST(N'2024-07-01' AS Date), 348956375)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[bill_detail] ON 

INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (40, 45, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (41, 45, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (42, 46, N'AT533', 2, N'S         ', N'White', 298000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (43, 47, N'T2099', 2, N'L         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (44, 48, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (45, 49, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (46, 50, N'T2099', 3, N'S         ', N'Purple', 567000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (47, 51, N'AT536', 2, N'S         ', N'Red', 278000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (48, 52, N'T2099', 1, N'S         ', N'Purple', 189000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (49, 53, N'T2127', 1, N'L         ', N'Black', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (50, 54, N'T2129', 1, N'XS        ', N'White', 270000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (51, 55, N'T2128', 1, N'XS        ', N'White', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (52, 56, N'T2129', 3, N'XS        ', N'White', 810000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (53, 57, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (54, 58, N'AT536', 3, N'S         ', N'Red', 417000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (55, 59, N'AT533', 1, N'S         ', N'White', 149000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (56, 60, N'T2099', 2, N'S         ', N'Purple', 378000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (57, 60, N'AT536', 1, N'L         ', N'Red', 139000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (58, 61, N'AT536', 1, N'S         ', N'Red', 139000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (59, 62, N'H1004', 3, N'S         ', N'Brown', 510000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (60, 62, N'S1203', 4, N'S         ', N'White', 2240000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (61, 63, N'T2130', 12, N'S         ', N'Grey', 2880000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (62, 64, N'T2130', 1, N'S         ', N'Grey', 240000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (63, 65, N'TD509', 1, N'S         ', N'Purple', 169000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (64, 66, N'SW6002', 1, N'S         ', N'Black', 210000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (65, 67, N'T3000', 5, N'S         ', N'Black', 1450000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (66, 68, N'AS8004', 10, N'S         ', N'White', 600000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (67, 69, N'AS8000', 1, N'S         ', N'Green', 150000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (68, 70, N'AT533', 2, N'S         ', N'Black', 298000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (69, 71, N'SW6000', 2, N'S         ', N'Red', 340000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (70, 71, N'AS8001', 3, N'S         ', N'Black', 900000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (71, 74, N'AS8004', 2, N'S         ', N'White', 120000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (72, 75, N'AS8000', 1, N'S         ', N'Green', 150000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (73, 76, N'AS8004', 1, N'S         ', N'White', 60000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (74, 77, N'S1201', 2, N'S         ', N'White', 398000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (75, 78, N'T2130', 1, N'S         ', N'Grey', 25000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (76, 79, N'SW6003', 1, N'S         ', N'Yellow', 420000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (77, 80, N'AS8001', 1, N'S         ', N'Black', 300000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (78, 81, N'SW6009', 1, N'S         ', N'Blue', 644000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (79, 82, N'S1201', 1, N'S         ', N'White', 199000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (80, 83, N'T2131', 1, N'L         ', N'Grey', 250000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (81, 84, N'S4007', 1, N'S         ', N'White', 349000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (82, 85, N'SW6003', 1, N'S         ', N'Yellow', 420000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (83, 86, N'T3000', 1, N'S         ', N'Black', 290000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (84, 87, N'SW6007', 1, N'S         ', N'Blue', 544000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (85, 88, N'T2127', 1, N'L         ', N'Black', 259000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (86, 89, N'SW6008', 1, N'S         ', N'Blue', 544000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (87, 89, N'SA7002', 1, N'S         ', N'Blue', 333000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (88, 90, N'AS8001', 1, N'S         ', N'Black', 300000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (89, 91, N'AS8004', 1, N'S         ', N'White', 60000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (90, 92, N'AS8004', 1, N'S         ', N'White', 60000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (91, 93, N'AS8001', 1, N'S         ', N'Black', 300000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (92, 94, N'AS8001', 1, N'S         ', N'Black', 300000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (93, 95, N'AS8001', 1, N'S         ', N'Black', 300000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (94, 96, N'AS8001', 1, N'S         ', N'Black', 300000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (95, 97, N'AS8001', 1, N'S         ', N'Black', 300000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (96, 98, N'H1002', 1, N'S         ', N'Green', 599000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (97, 99, N'PL1', 1, N'S         ', N'PINK', 99000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (98, 100, N'L1', 1, N'M         ', N'Black', 290000.0000)
INSERT [dbo].[bill_detail] ([detail_id], [bill_id], [product_id], [quantity], [size], [color], [price]) VALUES (99, 101, N'TD509', 1, N'S         ', N'Purple', 169000.0000)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'ÁO SƠ MI')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'ÁO THUN')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'ÁO KHOÁC')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'ÁO HOODIES')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'QUẦN SHORT')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'GIÀY')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (14, N'ÁO LEN')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (15, N'ÁO POLO')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (16, N'QUẦN BÒ')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (17, N'ÁO VEST')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (18, N'ÁO BA LỖ')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AS8000', 6, N'Giầy Lười Cảnh đồ Du Lịch', 150000.0000, N'<p>Gi&agrave;y thể thao nam Mulgati Leather Sneaker - F23305 được l&agrave;m từ chất liệu da cao cấp. - Thiết kế form gi&agrave;y chuẩn đẹp, đường kh&acirc;u tinh tế, chắc chắn</p>
', 101, N'images/null')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AS8001', 6, N'SNAKE', 300003.0000, N'<p>Gi&agrave;y thể thao nam Mulgati Leather Sneaker - F23305 được l&agrave;m từ chất liệu da cao cấp. - Thiết kế form gi&agrave;y chuẩn đẹp, đường kh&acirc;u tinh tế, chắc chắn - Đế gi&agrave;y được l&agrave;m từ cao su lưu h&oacute;a, độ bền cao - L&oacute;t gi&agrave;y &ecirc;m &aacute;i, gi&uacute;p ch&acirc;n lu&ocirc;n thoải m&aacute;i.</p>
', 94, N'images/AS8001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AS8004', 6, N'Dép unisex ', 60000.0000, N'<p>chất liệu da tho&aacute;ng m&aacute;t, &ecirc;m ch&acirc;n v&agrave; c&oacute; thể đi được nước. 🔸Form slim fit c&oacute; phần viền &ocirc;m dọc theo chiều d&agrave;i của ch&acirc;n gi&uacute;p t&ocirc;n d&aacute;ng v&agrave; thoải m&aacute;i</p>
', 186, N'images/AS8004.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AT533', 2, N'Champion Graphic Big Logo T-Shirt', 149000.0000, N'<p>Cổ Tr&ograve;nVạt NgangTay NgắnH&igrave;nh In Trướ</p>
', 184, N'images/AT533.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'AT536', 2, N'Champion Change The World', 139000.0000, N'<p>Cổ Tr&ograve;nVạt NgangTay NgắnH&igrave;nh Th&ecirc;u Trước</p>
', 449, N'images/AT536.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1', 4, N'hoodies 1', 350000.0000, N'hoodies 1', 700, N'images/hoodie1.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H10', 4, N'hoodies 10', 350000.0000, N'hoodies 10', 700, N'images/hoodie10.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1001', 4, N'Áo hoodie động vật Bluza cắt dạ dày, nhân sư, động vật', 190000.0000, N'<p>Thiết kế trẻ trung,chất liệu vải si&ecirc;u mềm</p>
', 40, N'images/H1001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1002', 4, N'Áo hoodie đôi Navy ', 599000.0000, N'<p>&Aacute;o đ&ocirc;i gi&agrave;nh cho c&aacute;c cặp đ&ocirc;i,thiết kế thon gọn,trẻ trung,chất liệu vải cotton mang đến cho kh&aacute;ch h&agrave;ng cảm gi&aacute;c &ecirc;m &aacute;i</p>
', 499, N'images/H1002.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1004', 4, N'Áo hoodie Loose Fit', 170000.0000, N'<p>In h&igrave;nh Loose Fit mang tới cảm gi&aacute;c trẻ trung</p>
', 273, N'images/H1004.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1005', 4, N'Áo hoodie in hình Loose Fit', 249000.0000, N'<p>Phong c&aacute;ch thời thượng</p>
', 166, N'images/H1005.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H1006', 4, N'Áo hoodie Regular Fit', 299000.0000, N'<p>Thiết kế trẻ trung,ấm &aacute;p</p>
', 675, N'images/H1006.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H2', 4, N'hoodies 2', 350000.0000, N'hoodies 2', 700, N'images/hoodie2.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H3', 4, N'hoodies 3', 350000.0000, N'hoodies 3', 700, N'images/hoodie3.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H4', 4, N'hoodies 4', 350000.0000, N'hoodies 4', 700, N'images/hoodie4.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H5', 4, N'hoodies 5', 350000.0000, N'hoodies 5', 700, N'images/hoodie5.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H6', 4, N'hoodies 6', 350000.0000, N'hoodies 6', 700, N'images/hoodie6.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H7', 4, N'hoodies 7', 350000.0000, N'hoodies 7', 700, N'images/hoodie7.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H8', 4, N'hoodies 8', 350000.0000, N'hoodies 8', 700, N'images/hoodie8.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'H9', 4, N'hoodies 9', 350000.0000, N'hoodies 9', 700, N'images/hoodie9.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L1', 14, N'len1', 290000.0000, N'len 1', 499, N'images/len1.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L10', 14, N'len10', 290000.0000, N'len 10', 500, N'images/len10.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L11', 14, N'len11', 290000.0000, N'len 11', 500, N'images/len11.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L2', 14, N'len2', 290000.0000, N'len 2', 500, N'images/len2.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L3', 14, N'len3', 290000.0000, N'len 3', 500, N'images/len3.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L4', 14, N'len4', 290000.0000, N'len 4', 500, N'images/len4.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L5', 14, N'len5', 290000.0000, N'len 5', 500, N'images/len5.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L6', 14, N'len6', 290000.0000, N'len 6', 500, N'images/len6.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L7', 14, N'len7', 290000.0000, N'len 7', 500, N'images/len7.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L8', 14, N'len8', 290000.0000, N'len 8', 500, N'images/len8.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'L9', 14, N'len9', 290000.0000, N'len 9', 500, N'images/len9.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL1', 15, N'Áo polo nam Bird', 99000.0000, N'<ul>
	<li><strong>Chất liệu:</strong>&nbsp;Thun c&aacute; sấu cotton lục gi&aacute;c. Chất mềm m&aacute;t, thấm mồ h&ocirc;i tốt, co gi&atilde;n 4 chiều</li>
</ul>
', 99, N'images/PL1.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL10', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL10.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL2', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL2.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL3', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL3.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL4', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL4.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL5', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL5.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL6', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL6.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL7', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL7.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL8', 15, N'Ok1', 120000.0000, N'SSS', 101, N'images/PL8.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'PL9', 15, N'Ok1', 120000.0000, N'<p>SSS</p>
', 101, N'images/PL9.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S1201', 5, N'Quần Short Kaki Big Size Navy', 199000.0000, N'<p>Sản phẩm c&oacute; đủ size từ 50kg-160kg. Form &ocirc;m. Chất vải Kaki th&agrave;nh phần cotton cao n&ecirc;n thoải m&aacute;i khi sử dụng</p>
', 263, N'images/S1200.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S1202', 5, N'QUẦN SHORT JEANS BIG SIZE LƯNG THUN NAVY', 430000.0000, N'<p>l&agrave;m từ chất liệu jeans, c&oacute; độ co gi&atilde;n tốt v&agrave; c&oacute; lưng thun rộng</p>
', 454, N'images/S1203.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S1203', 5, N'QUẦN JOGGER MLB BASIC', 560000.0000, N'Thiết kế độc đáo,trẻ trung', 440, N'images/S1204.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4000', 15, N'DRACO POLO SHIRT', 250000.0000, N'<p>Chất liệu: Thun c&aacute; sấu 2 chiều, định lượng 230gsm. &Aacute;o thun polo cổ dệt m&agrave;u xanh tiffany, chất liệu d&agrave;y vừa phải kh&ocirc;ng cứng. Chi tiết rồng th&ecirc;u n&eacute;t nổi, chi tiết chữ LD th&ecirc;u x&ugrave; hoạ tiết. &Aacute;o phom rộng vừa, thiết kế unisex.</p>
', 456, N'images/S4000.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4001', 1, N'LIDERISM CUBAN SHIRT', 690000.0000, N'<p>Chất liệu: Cotton polyester xốp.&Aacute;o sơ mi cổ ve lật, d&aacute;ng boxy, chất liệu đứng d&aacute;ng.Chi tiết t&uacute;i &aacute;o c&oacute; th&ecirc;u chữ nổi. &Aacute;o c&oacute; thiết kế unisex.</p>
', 6, N'images/S4001.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4002', 1, N'LIDERISM CUBAN SHIRT', 500000.0000, N'<p>Chất liệu: Cotton polyester xốp. &Aacute;o sơ mi cổ ve lật, d&aacute;ng boxy, chất liệu đứng d&aacute;ng. Chi tiết t&uacute;i &aacute;o c&oacute; th&ecirc;u chữ nổi. &Aacute;o c&oacute; thiết kế unisex.</p>
', 8, N'images/S4002.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4004', 1, N'NINTH SAREALM SHIRT', 700000.0000, N'<p>Chất liệu: Denim định lượng 12OZ d&agrave;y dặn. &Aacute;o sơ mi d&aacute;ng rộng, thiết kế unisex. &Aacute;o c&oacute; chi tiết tay &aacute;o c&oacute; thể th&aacute;o rời, được cố định bằng kho&aacute; zip -&gt; C&oacute; thể kết hợp như sơ mi tay ngắn hoặc tay d&agrave;i. Chi tiết n&oacute;n c&oacute; thể th&aacute;o rời, c&oacute; thể kết hợp c&ugrave;ng &aacute;o hoặc đội ri&ecirc;ng lẻ.</p>
', 9, N'images/S4004.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4005', 1, N'LINEN CLASSIC SHIRT ', 215000.0000, N'<p>Chất liệu: Linen Bamboo - kết hợp sợi lanh v&agrave; sợi dệt từ c&acirc;y tre.&Aacute;o c&oacute; độ mềm, rũ, tho&aacute;ng m&aacute;t v&agrave; thấm h&uacute;t mồ h&ocirc;i tốt.&Aacute;o sơ mi tay d&agrave;i thiết kế unisex, d&aacute;ng d&agrave;i rộng.Chi tiết logo th&ecirc;u nổi th&acirc;n trước v&agrave; th&acirc;n sau &aacute;o.</p>
', 600, N'images/S4005.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4006', 1, N'THEEIGHTH JERSEY SHIRT', 299000.0000, N'<p>Chất liệu: Polyester 2 da. &Aacute;o thun cổ ve lật, tay d&agrave;i raglan c&oacute; r&atilde; phối viền vải trắng. C&aacute;c chi tiết trước v&agrave; sau được in phồng. Cổ &aacute;o v&agrave; cổ tay bo dệt d&agrave;y dặn. &Aacute;o gồm size XS (d&aacute;ng cropped) v&agrave; size S-M-L (d&aacute;ng rộng oversized).</p>
', 700, N'images/S4006.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'S4007', 1, N'NECKLINE ZIPPED CROPPED SHIRT ', 349000.0000, N'<p>Chất liệu: Nỉ ch&acirc;n cua định lượng 400gsm d&agrave;y vừa.&Aacute;o sweatshirt d&aacute;ng ngắn, thiết kế unisex.Chi tiết cổ cao c&oacute; kho&aacute; k&eacute;o, c&oacute; thể tuỳ chỉnh cổ &aacute;o th&agrave;nh cổ lật hoặc cổ lọ.Gấu &aacute;o c&oacute; bo dệt bản 6cm d&agrave;y dặn.</p>
', 297, N'images/S4007.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SA7001', 15, N'Polo Basic 1', 233000.0000, N'<p>&Aacute;o polo đen trắng đẹp lắm</p>
', 600, N'images/SA7001.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SA7002', 15, N'Polo Basic 2', 333000.0000, N'<p>Polo X&aacute;m tho&aacute;ng m&aacute;t ph&ugrave; hợp với mọi hoạt động&nbsp;</p>
', 599, N'images/SA7002.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SA7003', 15, N'Polo Basic 3', 353000.0000, N'<p>&Aacute;o polo kẻ chất lượng cao&nbsp;</p>
', 600, N'images/SA7003.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SA7004', 15, N'Polo Basic 4', 153000.0000, N'<p>&Aacute;o polo đen cơ bản ph&ugrave; hợp mọi lứa tuổi&nbsp;</p>
', 600, N'images/SA7004.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SA7005', 15, N'Polo Basic 5', 264000.0000, N'<p>&Aacute;o polo trắng sang trọng&nbsp;</p>
', 600, N'images/SA7005.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SA7006', 15, N'Polo Basic 6', 244000.0000, N'<p>&Aacute;o polo x&aacute;m đầy nam t&iacute;nh&nbsp;</p>
', 600, N'images/SA7006.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'ST300', 2, N'Ao ST1', 300000.0000, N'<p>&Aacute;o d&agrave;i tay</p>
', 600, N'images/SW6001.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6000', 3, N'Áo Gió Red', 170000.0000, N'<p>Thiết kế sang trọng</p>
', 797, N'images/SW6000.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6001', 3, N'áo gió DEST', 400000.0000, N'<p>chất liệu da,ấm &aacute;p</p>
', 677, N'images/SW6001.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6002', 3, N'Áo phông Blazer ', 210000.0000, N'<p>Sang trọng</p>
', 699, N'images/SW6002.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6003', 3, N'Áo Khoác Màu Vàng', 420000.0000, N'<p>Thiết kế m&agrave;u sắc,y&ecirc;u đời</p>
', 653, N'images/SW6003.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6004', 3, N'Áo gió nam Uniqlo', 130000.0000, N'<p>Thiết kế đơn giản</p>
', 100, N'images/SW6004.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6005', 14, N'Áo len cơ bản 1', 444000.0000, N'<p>&Aacute;o l&ecirc;n d&agrave;y m&agrave; xanh dương với hoạt tiết bắt mắt</p>
', 600, N'images/SW6005.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6006', 14, N'Áo len cơ bản 2', 344000.0000, N'<p>&Aacute;o len đỏ đẹp nhở</p>
', 600, N'images/SW6006.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6007', 14, N'Áo len cơ bản 3', 544000.0000, N'<p>&Aacute;o len trắng với nhiều hoạt tiết đẹp</p>
', 199, N'images/SW6007.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6008', 14, N'Áo len cơ bản 4', 544000.0000, N'<p>&Aacute;o m&agrave;u xanh trời</p>
', 199, N'images/SW6008.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'SW6009', 14, N'Áo len cơ bản 5', 644000.0000, N'<p>&Aacute;o l&ecirc;n m&agrave;u xanh lục&nbsp;</p>
', 199, N'images/SW6009.JPG')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2099', 2, N'Áo Thun Polo Tay Ngắn Valentino Creations', 189000.0000, N'Chất liệu: thun cao cấp.Sản phẩm nhẹ, thoáng mát giúp người mặc luôn cảm thấy thoải mái.Thiết kế sang trọng, lịch lãm, dễ phối theo nhiều phong cách khác nhau', 69, N'images/T2099.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2106', 2, N'Shin-chan Tee', 229000.0000, N'<p>Chất liệu: thun cao cấp. Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 95, N'images/T2106.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2109', 2, N'Tie Dye Orange Mint Tee', 290000.0000, N'<p>Chất liệu: thun cao cấp. Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 75, N'images/T2109.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2119', 2, N'The Sun Tie Dye', 280000.0000, N'<p>Chất liệu: thun cao cấp. Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 82, N'images/T2119.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2127', 2, N'Fucking Awesome Tee In Black', 259000.0000, N'<p>Chất liệu: thun cao cấp. Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 93, N'images/T2127.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2128', 2, N'Fucking Awesome Tee', 259000.0000, N'<p>Chất liệu: thun cao cấp. Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 62, N'images/T2128.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2129', 2, N'I''m Not Psycho Tee', 270000.0000, N'<p>Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 102, N'images/T2129.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2130', 2, N'Acid Washed Dark', 25000.0000, N'<p>Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 286, N'images/T2130.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T2131', 2, N'Exceptional Tee With Distressed', 250000.0000, N'<p>Sản phẩm nhẹ, tho&aacute;ng m&aacute;t gi&uacute;p người mặc lu&ocirc;n cảm thấy thoải m&aacute;i. Thiết kế sang trọng, lịch l&atilde;m, dễ phối theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>
', 197, N'images/T2131.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T3000', 2, N'T-shirt black', 290000.0000, N'<p>Thiết kế m&aacute;t mẻ,trẻ trung</p>
', 137, N'images/T3000.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'T3132', 2, N'Ao T1', 300000.0000, N'<p>&Aacute;o Xịn N&egrave;</p>
', 600, N'images/T2132.jpg')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'TD481', 14, N'''''Sinner'''' Sweater', 360000.0000, N'<p>Cổ Tr&ograve;n Vạt Ngang Tay D&agrave;i Bo H&igrave;nh In Mặt Trước V&agrave; Sau</p>
', 29, N'images/TD481.png')
INSERT [dbo].[product] ([product_id], [category_id], [product_name], [product_price], [product_describe], [quantity], [img]) VALUES (N'TD509', 14, N'Champion Sweater', 169000.0000, N'<p>Cổ Tr&ograve;n Vạt Ngang Tay D&agrave;i Bo H&igrave;nh Th&ecirc;u Trước</p>
', 445, N'images/TD509.png')
GO
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'AS8001', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'AT533', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'AT536', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H1', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H10', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H1001', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H1002', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H1004', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H1005', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H1006', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H2', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H3', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H4', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H5', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H6', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H7', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H8', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'H9', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L1', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L10', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L11', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L2', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L3', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L4', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L5', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L6', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L7', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L8', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'L9', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL1', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL10', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL2', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL3', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL4', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL5', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL6', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL7', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL8', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'PL9', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S1201', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S1202', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S4000', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S4001', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S4002', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S4004', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S4005', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S4006', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'S4007', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'SA7001', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'SA7002', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'SA7005', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'SA7006', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'ST300', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'SW6000', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2106', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2109', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2119', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2127', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2128', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2129', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2130', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T2131', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T3000', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'T3132', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'TD481', N'True')
INSERT [dbo].[product_active] ([product_id], [active]) VALUES (N'TD509', N'True')
GO
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2130', N'Grey')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2129', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT536', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2109', N'Orange')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7006', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1001', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1001', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6000', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6000', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7006', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4006', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T3132', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T3132', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T3132', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T3000', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7006', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'ST300', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'ST300', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'ST300', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2099', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7002', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6003', N'Yellow')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1004', N'Brown')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1201', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1201', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1005', N'Brown')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1005', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1006', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1006', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1006', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7002', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4004', N'Brown')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4002', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4002', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4002', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7002', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7001', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1203', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1203', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1203', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7001', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AT533', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7001', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL1', N'PINK')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL2', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6006', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6006', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6006', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6007', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL4', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL5', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6007', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6007', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6007', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6008', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6008', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6008', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6008', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6009', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6009', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6009', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6009', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6001', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6002', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6004', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6004', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6004', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7003', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7003', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7003', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7004', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7004', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7004', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6005', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6005', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SW6005', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL10', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L3', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L4', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L7', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L8', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L9', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L10', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H3', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H4', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H7', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H8', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL8', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L2', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L6', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H2', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H6', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL3', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL6', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL7', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L1', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L5', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H5', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H9', N'Black')
GO
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H10', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'L11', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1002', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'H1002', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'PL9', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S1202', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4005', N'Orange')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4005', N'Yelllow')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4001', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD481', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2128', N'Green')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'Pink')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2119', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4007', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7005', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7005', N'Red')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'SA7005', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'S4000', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Purple')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'TD509', N'White')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Grey')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2131', N'Blue')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2127', N'Black')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'T2106', N'Yellow')
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (N'AS8001', N'Black')
GO
SET IDENTITY_INSERT [dbo].[product_comment] ON 

INSERT [dbo].[product_comment] ([id], [product_id], [user_id], [created_at], [Rating], [comment], [user_name]) VALUES (2, N'AS8004', 1, CAST(N'2024-06-28T08:43:10.670' AS DateTime), 5, N'ok nhé', NULL)
INSERT [dbo].[product_comment] ([id], [product_id], [user_id], [created_at], [Rating], [comment], [user_name]) VALUES (4, N'H1002', 10, CAST(N'2024-07-01T14:06:09.260' AS DateTime), 5, N'đã mua áo đẹp lắm', N'test8')
SET IDENTITY_INSERT [dbo].[product_comment] OFF
GO
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1006', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1006', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2109', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1001', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T3000', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6000', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6000', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7006', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T3132', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T3132', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T3132', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2130', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2129', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7006', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7006', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2099', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6000', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1001', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'ST300', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'ST300', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'ST300', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7002', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7002', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7002', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6003', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6003', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1004', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1004', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1203', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1203', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4006', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4004', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4004', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4006', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT536', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1201', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1201', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1005', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1005', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL1', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL1', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4002', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4002', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL1', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7001', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7001', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7003', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL2', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL3', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL5', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL10', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L3', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L4', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7003', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7003', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L7', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6006', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6006', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6006', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6002', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6002', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7004', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7004', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6005', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6005', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6005', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6007', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6007', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6007', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6008', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6008', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6008', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6009', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6009', N'L')
GO
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6009', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6004', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SW6004', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L8', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L9', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L10', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H3', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H4', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H7', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H8', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AT533', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL8', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L2', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L6', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H2', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H6', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL7', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL6', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL4', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L1', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L5', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H5', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H9', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H10', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'L11', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1002', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1002', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'H1002', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'PL9', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S1202', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4005', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4005', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4005', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4001', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD481', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XS')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2128', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2119', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4007', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4007', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4007', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7005', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7005', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'SA7005', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'S4000', N'M')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'TD509', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2131', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2127', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'S')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'L')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'XXL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'T2106', N'3XL')
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (N'AS8001', N'S')
GO
SET IDENTITY_INSERT [dbo].[report] ON 

INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (1, 30, N'tôi muốn biết rõ ràng kích thước sản phẩm', N'Vấn đề về tư vấn sản phẩm ', N'anpgkhe172101@fpt.edu.vn')
INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (2, 30, N'kiem tra report', N'toi khong report duoc', N'anpgkhe172101@fpt.edu.vn')
INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (3, 30, N'Tôi không thể đổi mật khẩu trong tài khoản của tôi được', N'Vấn đề về đổi mật khẩu', N'anpgkhe172101@fpt.edu.vn')
INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (4, 30, N'Tôi không thể đổi mật khẩu trong tài khoản của tôi được', N'Vấn đề về đổi mật khẩu', N'anpgkhe172101@fpt.edu.vn')
INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (5, 30, N'Tôi không hiện thông báo gửi phản hồi thành công', N'Vấn đề về thông báo', N'anpgkhe172101@fpt.edu.vn')
INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (6, 30, N'Tôi không hiện thông báo gửi phản hồi thành công lần thứ 2', N'Vấn đề về thông báo', N'anpgkhe172101@fpt.edu.vn')
INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (7, 1, N'áo đẹp lắm', N'Sản phẩm', N'doanhtnhe172637@fpt.edu.vn')
INSERT [dbo].[report] ([id_report], [user_id], [content_report], [subject_report], [user_email]) VALUES (9, 10, N'xau', N'san pham', N'test8@gmail.com')
SET IDENTITY_INSERT [dbo].[report] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (1, N'ADMIN', N'linhndhe170592@fpt.edu.vn', N'LinhND1906', N'TRUE', N'2003-06-19', N'Ha Noi', N'0393314726', 0, NULL, NULL)
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (4, N'Duc', N'duc@gmail.com', N'1423', N'TRUE', N'2003-12-02', N'Ha Noi', N'0999999999', 0, N'Good', NULL)
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (5, N'Hoang', N'hoang@gmail.com', N'123', N'FALSE', N'2003-04-03', N'Thai Binh', N'0999999999', 0, N'tốt', N'TRUE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (7, N'test5', N'test5@gmail.com', N'Dtran4673', N'FALSE', N'2003-04-03', N'Thai Binh', N'0999999999', 1, N'ok', N'FALSE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (8, N'test6', N'test6@gmaii.com', N'123', N'False', N'2003-04-03', N'Thai Binh', N'0999999999', 0, NULL, NULL)
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (9, N'test7', N'test7@gmail.com', N'', N'False', N'2003-04-03', N'Thai Binh', N'0999999999', 1, NULL, NULL)
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (10, N'test8', N'test8@gmail.com', N'Dtran4673', N'FALSE', N'2003-04-03', N'Thai Binhh', N'0999999999', 0, N'', N'TRUE')
INSERT [dbo].[users] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [dateOfBirth], [address], [phoneNumber], [banned], [adminReason], [isStoreStaff]) VALUES (12, N'DucAnh', N'DucAnh@gmail.com', N'Ducanh123', N'TRUE', N'2003-04-03', N'Nam Dinh', N'0999999999', 0, N'chăm chỉ', N'FALSE')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[product_comment] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [banned]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([bill_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product_active]  WITH CHECK ADD  CONSTRAINT [FK_ProductActive_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_active] CHECK CONSTRAINT [FK_ProductActive_Product]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK_product_color_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK_product_color_product]
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[product_saleOFF]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK_product_size_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK_product_size_product]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_user_id]
GO
USE [master]
GO
ALTER DATABASE [ShopYouAndMeVersionFinal] SET  READ_WRITE 
GO
