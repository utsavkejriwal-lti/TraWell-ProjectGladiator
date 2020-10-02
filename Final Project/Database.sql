USE [master]
GO
/****** Object:  Database [TraWell]    Script Date: 02-10-2020 21:46:36 ******/
CREATE DATABASE [TraWell]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TraWell', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TraWell.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TraWell_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TraWell_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TraWell] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TraWell].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TraWell] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TraWell] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TraWell] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TraWell] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TraWell] SET ARITHABORT OFF 
GO
ALTER DATABASE [TraWell] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TraWell] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TraWell] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TraWell] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TraWell] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TraWell] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TraWell] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TraWell] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TraWell] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TraWell] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TraWell] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TraWell] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TraWell] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TraWell] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TraWell] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TraWell] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TraWell] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TraWell] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TraWell] SET  MULTI_USER 
GO
ALTER DATABASE [TraWell] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TraWell] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TraWell] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TraWell] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TraWell] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TraWell] SET QUERY_STORE = OFF
GO
USE [TraWell]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[isActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(101,1) NOT NULL,
	[UserRegistered] [int] NOT NULL,
	[UserId] [int] NULL,
	[GuestId] [int] NULL,
	[BookingDate] [datetime] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[TripId] [int] NOT NULL,
	[Boarding] [varchar](5) NOT NULL,
	[Arrival] [varchar](5) NOT NULL,
	[Feedback] [varchar](100) NULL,
	[Amount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[Id] [int] IDENTITY(101,1) NOT NULL,
	[Number] [varchar](10) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Seats] [int] NOT NULL,
	[Admin] [int] NOT NULL,
	[hasAc] [int] NOT NULL,
	[hasWifi] [int] NOT NULL,
	[isRecliner] [int] NOT NULL,
	[SeatMap] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[BusID] [int] NOT NULL,
	[BookingFeedback] [int] NULL,
	[BusFeedback] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestUsers]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contact] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassengerDetails]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassengerDetails](
	[BookingID] [int] NOT NULL,
	[Seat] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](6) NOT NULL,
 CONSTRAINT [PassengerDetails_pk] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[Seat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[Code] [varchar](5) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[Id] [int] IDENTITY(101,1) NOT NULL,
	[Source] [varchar](5) NOT NULL,
	[Destination] [varchar](5) NOT NULL,
	[Admin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stops]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stops](
	[RouteID] [int] NOT NULL,
	[Stop] [varchar](5) NOT NULL,
	[DistanceFromOrigin] [float] NOT NULL,
 CONSTRAINT [PK_STOPS] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC,
	[Stop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [int] IDENTITY(1001,1) NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[BookingID] [int] NOT NULL,
	[Mode] [varchar](20) NOT NULL,
	[TransType] [varchar](6) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trips]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusID] [int] NOT NULL,
	[RouteID] [int] NOT NULL,
	[Admin] [int] NOT NULL,
	[CostPerKm] [float] NOT NULL,
	[Status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripStops]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripStops](
	[TripId] [int] NOT NULL,
	[Stop] [varchar](5) NOT NULL,
	[ArrivalTime] [datetime] NOT NULL,
	[DepartureTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TRIPSTOPS] PRIMARY KEY CLUSTERED 
(
	[TripId] ASC,
	[Stop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogs]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EncData] [varchar](100) NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02-10-2020 21:46:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Contact] [varchar](30) NOT NULL,
	[Wallet] [int] NOT NULL,
	[DOB] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Gender] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (1, N'utsav', N'utsav1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (2, N'pranav', N'pranav1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (3, N'vipashyana', N'vipashyana1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (4, N'bhanu', N'bhanu1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (5, N'akash', N'akash1234', 0)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (104, 1, 1, NULL, CAST(N'2020-09-20T12:00:00.000' AS DateTime), N'cancelled', 1, N'ANDV', N'KRNL', NULL, 438)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (105, 1, 3, NULL, CAST(N'2020-09-20T12:00:01.000' AS DateTime), N'cancelled', 2, N'SSVC', N'KASH', NULL, 575)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (106, 1, 5, NULL, CAST(N'2020-09-20T12:00:02.000' AS DateTime), N'booked', 2, N'AMBC', N'KASH', NULL, 472.5)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (107, 0, NULL, 3, CAST(N'2020-09-20T12:00:03.000' AS DateTime), N'booked', 1, N'KRNL', N'SFTC', NULL, 294)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (108, 0, NULL, 4, CAST(N'2020-09-29T23:15:21.277' AS DateTime), N'booked', 1, N'ANDV', N'SFTC', NULL, 732)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (109, 1, 1, NULL, CAST(N'2020-09-29T23:29:09.167' AS DateTime), N'booked', 3, N'KASH', N'SSVC', NULL, 1172)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (110, 1, 1, NULL, CAST(N'2020-09-29T23:54:35.643' AS DateTime), N'booked', 3, N'KASH', N'SSVC', NULL, 586)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (111, 1, 1, NULL, CAST(N'2020-09-29T23:54:35.747' AS DateTime), N'booked', 2, N'SSVC', N'KASH', NULL, 610)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (112, 1, 6, NULL, CAST(N'2020-09-30T09:41:23.823' AS DateTime), N'booked', 3, N'KASH', N'SSVC', NULL, 586)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (113, 1, 6, NULL, CAST(N'2020-09-30T09:41:23.970' AS DateTime), N'booked', 2, N'SSVC', N'KASH', NULL, 610)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (114, 0, NULL, 6, CAST(N'2020-09-30T09:44:16.653' AS DateTime), N'booked', 1, N'ANDV', N'SSVC', NULL, 1464)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (115, 0, NULL, 6, CAST(N'2020-09-30T09:44:16.693' AS DateTime), N'booked', 2, N'SSVC', N'KASH', NULL, 1220)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (116, 1, 1, NULL, CAST(N'2020-09-30T13:31:12.660' AS DateTime), N'cancelled', 2, N'SSVC', N'KASH', NULL, 610)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (117, 1, 1, NULL, CAST(N'2020-09-30T13:33:04.213' AS DateTime), N'cancelled', 2, N'SSVC', N'KASH', NULL, 610)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (118, 1, 1, NULL, CAST(N'2020-09-30T17:29:14.673' AS DateTime), N'cancelled', 1, N'ANDV', N'SFTC', NULL, 732)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (119, 1, 1, NULL, CAST(N'2020-09-30T20:36:44.810' AS DateTime), N'cancelled', 3, N'KASH', N'SFTC', NULL, 586)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (120, 1, 1, NULL, CAST(N'2020-10-01T09:23:22.917' AS DateTime), N'booked', 2, N'SSVC', N'KASH', NULL, 610)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (101, N'MH-TR0045', N'Queen Rangers', 25, 1, 1, 1, 0, N'2-3')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (102, N'KA-ZZ3004', N'Blue Coach', 10, 3, 1, 0, 0, N'1-1')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (103, N'MH-TW0007', N'Thunder Bolt', 30, 2, 0, 1, 1, N'3-3')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (104, N'PA-GO1010', N'SEA VIEW', 18, 1, 1, 0, 1, N'3-3')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (105, N'AP-TW6446', N'Deccan Throne', 20, 5, 0, 0, 1, N'2-3')
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (1, 118, 103, 4, 4)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (2, 120, 101, 4, 4)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (3, 119, 102, 4, 4)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (4, 116, 101, 1, 1)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[GuestUsers] ON 

INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (1, N'ritesh123@gmail.com', N'9638527410')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (2, N'dineshk889@xyz.com', N'6874598520')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (3, N'radhika1997@yahoo.com', N'7747889878')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (4, N'utsav@utsav.com', N'7878787878')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (6, N'varun@gmail.com', N'7788878747')
SET IDENTITY_INSERT [dbo].[GuestUsers] OFF
GO
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (104, 5, N'Rohan Desai', 26, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (104, 6, N'Saraswati Desai', 50, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (105, 3, N'Rahul Raj', 35, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (105, 4, N'Anshuman Kumar', 40, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (106, 5, N'Prachi Agarwal', 24, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (106, 6, N'Ruchi Agarwal', 55, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (107, 7, N'Vaibhav Thakur', 23, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (107, 8, N'Swapnil Singh', 23, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (108, 10, N'Utsav', 45, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (109, 3, N'Saraswati', 35, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (109, 4, N'Anshuman', 10, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (110, 5, N'Suraj', 30, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (111, 5, N'Suraj', 30, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (112, 6, N'Utsav', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (113, 6, N'Utsav', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (114, 11, N'Vishal Agarwal', 45, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (114, 12, N'Varun Agarwal', 25, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (115, 11, N'Vishal Agarwal', 45, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (115, 12, N'Varun Agarwal', 25, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (116, 8, N'Ajay', 40, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (117, 9, N'Neena', 36, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (118, 30, N'Sanjay', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (119, 8, N'Saras', 36, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (120, 15, N'Shekhar Desai', 50, N'Male')
GO
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'ADNR', N'Adarsh Nagar', N'Ghaziabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'AMBC', N'Ambala City Bus Stand', N'Ambala')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'AMRV', N'Amravati Isbt', N'Amravati')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'ANDV', N'Anand Vihar Isbt', N'Delhi')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'ARBD', N'Aurangabad Bus Stand', N'Aurangabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'BHIM', N'Bhim Nagar Bus Stand', N'Surat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'BNDR', N'Bandra Bus Stand', N'Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'DDNB', N'Dehradun Isbt', N'Dehradun')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'DHRM', N'Dharam Nagar Bus Stand', N'Surat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'GRGN', N'Gurgaon Isbt', N'Gurgaon')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'GZBD', N'Ghaziabad Isbt', N'Ghaziabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'HUDA', N'Huda Bus Stand', N'Panipat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'JAPR', N'Jaipur Isbt', N'Jaipur')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'KASH', N'Kashmere Gate Isbt', N'Delhi')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'KCAM', N'Kalka Chowk Bus Stop', N'Ambala')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'KRNL', N'Karnal Bus Stand', N'Karnal')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MNNR', N'Mani Nagar Bus Stand', N'Ahmedabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MNPA', N'Manapa Bus Stand', N'Pune')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MRTL', N'Maratoli Bus Stand', N'Nagpur')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MSRT', N'Msrtc', N'Pune')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'MZFN', N'Muzaffar Nagar Bus Stand', N'Muzzaffarnagar')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'NGPR', N'Nagpur Isbt', N'Nagpur')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'NVMB', N'Navi Mumbai Bus Stand', N'Navi Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'PMNR', N'Prem Nagar', N'Dehradun')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'PNPT', N'Panipat Bus Stand', N'Panipat')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'RRKE', N'Roorkee Bus Stand', N'Roorkee')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'RWRI', N'Rewari Isbt', N'Rewari')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SFTC', N'Sector 43 Isbt', N'Chandigarh')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SHVJ', N'Shivaji Bus Terminal', N'Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SRNG', N'Sarangpur Isbt', N'Ahmedabad')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'SSVC', N'Sector 17 Isbt', N'Chandigarh')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'TLKN', N'Tilak Nagar Bus Stand', N'Mumbai')
INSERT [dbo].[Places] ([Code], [Name], [City]) VALUES (N'VDDR', N'Vadodara Bus Stand', N'Vadodara')
GO
SET IDENTITY_INSERT [dbo].[Routes] ON 

INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (101, N'ANDV', N'SFTC', 1)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (102, N'SFTC', N'ANDV', 1)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (103, N'PMNR', N'JAPR', 2)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (104, N'JAPR', N'PMNR', 2)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (105, N'BNDR', N'NGPR', 3)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (106, N'NGPR', N'BNDR', 3)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (107, N'SHVJ', N'SRNG', 4)
INSERT [dbo].[Routes] ([Id], [Source], [Destination], [Admin]) VALUES (108, N'SRNG', N'SHVJ', 4)
SET IDENTITY_INSERT [dbo].[Routes] OFF
GO
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'AMBC', 200)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'ANDV', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'HUDA', 73)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KASH', 5)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KCAM', 200)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KRNL', 146)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'PNPT', 73)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'SFTC', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'SSVC', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'AMBC', 45)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'ANDV', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'HUDA', 174)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KASH', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KCAM', 45)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KRNL', 98)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'PNPT', 174)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'SFTC', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'SSVC', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'ADNR', 212)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'ANDV', 257)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'DDNB', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'GRGN', 300)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'GZBD', 212)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'JAPR', 519)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'KASH', 257)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'MZFN', 147)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'PMNR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'RRKE', 70)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'RWRI', 410)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'ADNR', 304)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'ANDV', 272)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'DDNB', 519)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'GRGN', 219)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'GZBD', 304)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'JAPR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'KASH', 272)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'MZFN', 372)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'PMNR', 519)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'RRKE', 449)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'RWRI', 109)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'AMRV', 709)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'ARBD', 391)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'BNDR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MNPA', 151)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MRTL', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MSRT', 151)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'NGPR', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'NVMB', 63)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'SHVJ', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'TLKN', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'AMRV', 138)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'ARBD', 456)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'BNDR', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MNPA', 701)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MRTL', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MSRT', 701)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'NGPR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'NVMB', 784)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'SHVJ', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'TLKN', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'BHIM', 230)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'DHRM', 230)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'MNNR', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'SHVJ', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'SRNG', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'TLKN', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'VDDR', 386)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'BHIM', 308)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'DHRM', 308)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'MNNR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'SHVJ', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'SRNG', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'TLKN', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'VDDR', 152)
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1004, CAST(438 AS Decimal(18, 0)), 104, N'Card', N'Debit', CAST(N'2020-09-20T12:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1005, CAST(575 AS Decimal(18, 0)), 105, N'Card', N'Debit', CAST(N'2020-09-20T12:00:01.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1006, CAST(473 AS Decimal(18, 0)), 106, N'Net Banking', N'Debit', CAST(N'2020-09-20T12:00:02.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1007, CAST(294 AS Decimal(18, 0)), 107, N'Card', N'Debit', CAST(N'2020-09-20T12:00:03.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1008, CAST(575 AS Decimal(18, 0)), 105, N'Wallet', N'Credit', CAST(N'2020-09-21T15:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1009, CAST(732 AS Decimal(18, 0)), 108, N'Card', N'Debit', CAST(N'2020-09-29T23:17:49.833' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1010, CAST(586 AS Decimal(18, 0)), 110, N'Wallet', N'Debit', CAST(N'2020-09-29T23:54:35.697' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1011, CAST(610 AS Decimal(18, 0)), 111, N'Wallet', N'Debit', CAST(N'2020-09-29T23:54:35.760' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1012, CAST(586 AS Decimal(18, 0)), 112, N'Card', N'Debit', CAST(N'2020-09-30T09:41:23.940' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1013, CAST(610 AS Decimal(18, 0)), 113, N'Card', N'Debit', CAST(N'2020-09-30T09:41:24.003' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1014, CAST(1464 AS Decimal(18, 0)), 114, N'Paypal', N'Debit', CAST(N'2020-09-30T09:44:16.683' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1015, CAST(1220 AS Decimal(18, 0)), 115, N'Paypal', N'Debit', CAST(N'2020-09-30T09:44:16.713' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1016, CAST(610 AS Decimal(18, 0)), 116, N'Card', N'Debit', CAST(N'2020-09-30T13:31:12.687' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1017, CAST(610 AS Decimal(18, 0)), 117, N'Net Banking', N'Debit', CAST(N'2020-09-30T13:33:04.233' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1018, CAST(610 AS Decimal(18, 0)), 117, N'Wallet', N'Credit', CAST(N'2020-09-30T13:39:04.403' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1019, CAST(610 AS Decimal(18, 0)), 118, N'Wallet', N'Debit', CAST(N'2020-09-30T17:29:14.703' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1020, CAST(122 AS Decimal(18, 0)), 118, N'Net Banking', N'Debit', CAST(N'2020-09-30T17:29:14.747' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1021, CAST(438 AS Decimal(18, 0)), 104, N'Wallet', N'Credit', CAST(N'2020-09-30T18:27:10.007' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1022, CAST(732 AS Decimal(18, 0)), 118, N'Wallet', N'Credit', CAST(N'2020-09-30T18:28:40.927' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1023, CAST(610 AS Decimal(18, 0)), 116, N'Wallet', N'Credit', CAST(N'2020-09-30T18:29:39.337' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1024, CAST(586 AS Decimal(18, 0)), 119, N'Wallet', N'Debit', CAST(N'2020-09-30T20:36:44.833' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1025, CAST(586 AS Decimal(18, 0)), 119, N'Wallet', N'Credit', CAST(N'2020-09-30T20:37:06.593' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1026, CAST(610 AS Decimal(18, 0)), 120, N'Paypal', N'Debit', CAST(N'2020-10-01T09:23:22.973' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (1, 103, 101, 1, 3, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (2, 101, 102, 2, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (3, 102, 101, 3, 2.4, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (4, 104, 102, 1, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (5, 105, 101, 1, 3, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (6, 101, 101, 1, 2.6, N'Scheduled')
SET IDENTITY_INSERT [dbo].[Trips] OFF
GO
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'AMBC', CAST(N'2020-09-30T15:45:00.000' AS DateTime), CAST(N'2020-09-30T15:55:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'ANDV', CAST(N'2020-09-30T10:00:00.000' AS DateTime), CAST(N'2020-09-30T10:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'HUDA', CAST(N'2020-09-30T12:30:00.000' AS DateTime), CAST(N'2020-09-30T12:35:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'KASH', CAST(N'2020-09-30T10:30:00.000' AS DateTime), CAST(N'2020-09-30T10:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'KRNL', CAST(N'2020-09-30T14:05:00.000' AS DateTime), CAST(N'2020-09-30T14:15:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'SFTC', CAST(N'2020-09-30T17:40:00.000' AS DateTime), CAST(N'2020-09-30T17:40:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (1, N'SSVC', CAST(N'2020-09-30T17:15:00.000' AS DateTime), CAST(N'2020-09-30T17:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'AMBC', CAST(N'2020-10-01T20:30:00.000' AS DateTime), CAST(N'2020-10-01T21:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'KASH', CAST(N'2020-10-02T01:30:00.000' AS DateTime), CAST(N'2020-10-02T01:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'KCAM', CAST(N'2020-10-01T19:50:00.000' AS DateTime), CAST(N'2020-10-01T20:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'KRNL', CAST(N'2020-10-01T23:30:00.000' AS DateTime), CAST(N'2020-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (2, N'SSVC', CAST(N'2020-10-01T18:30:00.000' AS DateTime), CAST(N'2020-10-01T18:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (3, N'AMBC', CAST(N'2020-09-30T17:55:00.000' AS DateTime), CAST(N'2020-09-30T18:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (3, N'HUDA', CAST(N'2020-09-30T14:05:00.000' AS DateTime), CAST(N'2020-09-30T14:15:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (3, N'KASH', CAST(N'2020-09-30T12:30:00.000' AS DateTime), CAST(N'2020-09-30T12:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (3, N'SFTC', CAST(N'2020-09-30T19:45:00.000' AS DateTime), CAST(N'2020-09-30T19:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (3, N'SSVC', CAST(N'2020-09-30T19:10:00.000' AS DateTime), CAST(N'2020-09-30T19:15:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (4, N'AMBC', CAST(N'2020-10-05T20:30:00.000' AS DateTime), CAST(N'2020-10-05T21:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (4, N'KASH', CAST(N'2020-10-06T01:30:00.000' AS DateTime), CAST(N'2020-10-06T01:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (4, N'KCAM', CAST(N'2020-10-05T19:50:00.000' AS DateTime), CAST(N'2020-10-05T20:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (4, N'KRNL', CAST(N'2020-10-05T23:30:00.000' AS DateTime), CAST(N'2020-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (4, N'SSVC', CAST(N'2020-10-05T18:30:00.000' AS DateTime), CAST(N'2020-10-05T18:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (5, N'AMBC', CAST(N'2020-10-05T15:45:00.000' AS DateTime), CAST(N'2020-10-05T15:55:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (5, N'ANDV', CAST(N'2020-10-05T10:00:00.000' AS DateTime), CAST(N'2020-10-05T10:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (5, N'HUDA', CAST(N'2020-10-05T12:30:00.000' AS DateTime), CAST(N'2020-10-05T12:35:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (5, N'KASH', CAST(N'2020-10-05T10:30:00.000' AS DateTime), CAST(N'2020-10-05T10:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (5, N'KRNL', CAST(N'2020-10-05T14:05:00.000' AS DateTime), CAST(N'2020-10-05T14:15:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (5, N'SFTC', CAST(N'2020-10-05T17:40:00.000' AS DateTime), CAST(N'2020-10-05T17:40:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (5, N'SSVC', CAST(N'2020-10-05T17:15:00.000' AS DateTime), CAST(N'2020-10-05T17:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'AMBC', CAST(N'2020-10-05T18:15:00.000' AS DateTime), CAST(N'2020-10-05T18:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'ANDV', CAST(N'2020-10-05T11:00:00.000' AS DateTime), CAST(N'2020-10-05T11:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'HUDA', CAST(N'2020-10-05T14:05:00.000' AS DateTime), CAST(N'2020-10-05T15:15:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'KASH', CAST(N'2020-10-05T11:30:00.000' AS DateTime), CAST(N'2020-10-05T11:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'KCAM', CAST(N'2020-10-05T18:40:00.000' AS DateTime), CAST(N'2020-10-05T18:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'KRNL', CAST(N'2020-10-05T16:45:00.000' AS DateTime), CAST(N'2020-10-05T16:55:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'PNPT', CAST(N'2020-10-05T13:30:00.000' AS DateTime), CAST(N'2020-10-05T13:35:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'SFTC', CAST(N'2020-10-05T19:40:00.000' AS DateTime), CAST(N'2020-10-05T19:40:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (6, N'SSVC', CAST(N'2020-10-05T19:15:00.000' AS DateTime), CAST(N'2020-10-05T19:20:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserLogs] ON 

INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (1, N'7ae570171cc51ca37b42c5776130b355', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (2, N'68233a1b2eeec4b5bbb33c10d27bbbe6', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (3, N'8e963565d9904863291f5ddb0f7c95b0', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (4, N'9ebfb403e62096cbfb3d93931e0a8507', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (5, N'f6de8f9c84598774ea5eca670e242a39', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (6, N'25deabe2960d819defb7ef1efb0078fd', 6)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (7, N'4ef920b78a22b6b64678012aa2d5707c', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (8, N'dd463ae91f1eab8607ce01420b56c192', 6)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (9, N'807b19bcc99ba8a47a10b1a5e667e16e', 1)
SET IDENTITY_INSERT [dbo].[UserLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (1, N'Saraswati', N'Desai', N'saras@gmail.com', N'Newuser@123', N'7899878988', 1780, CAST(N'1985-01-09T00:00:00.000' AS DateTime), NULL, N'Female')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (2, N'Rahul', N'Mennon', N'raMen@gmail.com', N'Raser@123', N'9876342234', 1196, CAST(N'1996-06-09T00:00:00.000' AS DateTime), N'C255,Sector 63 Noida, UttarPradesh', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (3, N'Nitesh', N'Agarwal', N'nits@yahoo.com', N'Nittu@13', N'9768554563', 1250, NULL, N'149,Kalachowki Cotten Gress,Tank Road,Mumbai,Maharashtra', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (4, N'Dristi', N'Das', N'sird@gmail.com', N'123#dris', N'9687567533', 0, CAST(N'1989-03-08T00:00:00.000' AS DateTime), N'485,Shwetamansion,mumcircle,Bangalore,Karnataka', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (5, N'Shitala', N'Sharma', N'shital@gmail.com', N'shi@1234', N'9987612345', 150, CAST(N'1977-10-06T00:00:00.000' AS DateTime), NULL, N'Female')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (6, N'Utsav', N'Kejriwal', N'utsav@utsavkejriwal.com', N'Abcd@1234', N'7474747474', 0, CAST(N'1998-10-25T00:00:00.000' AS DateTime), NULL, N'Male')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__536C85E4555ADD5F]    Script Date: 02-10-2020 21:46:37 ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Buses__78A1A19DFE8C7F47]    Script Date: 02-10-2020 21:46:37 ******/
ALTER TABLE [dbo].[Buses] ADD UNIQUE NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105348D3F2F90]    Script Date: 02-10-2020 21:46:37 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F7C046650C2BBC11]    Script Date: 02-10-2020 21:46:37 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((1)) FOR [UserRegistered]
GO
ALTER TABLE [dbo].[Buses] ADD  DEFAULT ('2-3') FOR [SeatMap]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([GuestId])
REFERENCES [dbo].[GuestUsers] ([Id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Buses]  WITH CHECK ADD FOREIGN KEY([Admin])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([BusID])
REFERENCES [dbo].[Buses] ([Id])
GO
ALTER TABLE [dbo].[PassengerDetails]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([Admin])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([Destination])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([Source])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[Stops]  WITH CHECK ADD FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[Stops]  WITH CHECK ADD FOREIGN KEY([Stop])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD FOREIGN KEY([Admin])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD FOREIGN KEY([BusID])
REFERENCES [dbo].[Buses] ([Id])
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([Id])
GO
ALTER TABLE [dbo].[TripStops]  WITH CHECK ADD FOREIGN KEY([Stop])
REFERENCES [dbo].[Places] ([Code])
GO
ALTER TABLE [dbo].[TripStops]  WITH CHECK ADD FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
GO
ALTER TABLE [dbo].[UserLogs]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD CHECK  (([isActive]=(1) OR [isActive]=(0)))
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD CHECK  (([UserRegistered]=(0) OR [UserRegistered]=(1)))
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD CHECK  (([TransType]='Credit' OR [TransType]='Debit'))
GO
ALTER TABLE [dbo].[Trips]  WITH CHECK ADD CHECK  (([CostPerkm]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[prc_feedback]    Script Date: 02-10-2020 21:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_feedback]
as
begin 
select f.busid,avg(f.busfeedback) as feedbackBus, b.Name, b.Number  from feedback f
LEFT JOIN Buses b
ON f.BusID = b.Id
group by f.busid, b.Name, b.Number
order by feedbackBus desc
end
GO
/****** Object:  StoredProcedure [dbo].[prc_frequent_routes]    Script Date: 02-10-2020 21:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_frequent_routes]
as 
begin
select routeid,count(*) TotalTrips  from trips
group by RouteID
end
GO
/****** Object:  StoredProcedure [dbo].[prc_profit]    Script Date: 02-10-2020 21:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_profit]
as
begin
select BookingID,UserId,GuestId,month(BookingDate)LastMonth,year(BookingDate)PresentYear,Amount from Bookings
where month(BookingDate)=month(getdate())-1 and year(BookingDate)=year(getdate())
end
GO
USE [master]
GO
ALTER DATABASE [TraWell] SET  READ_WRITE 
GO
