USE [TraWell]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Bookings]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Buses]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[GuestUsers]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[PassengerDetails]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Places]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Routes]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Stops]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Trips]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[TripStops]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[UserLogs]    Script Date: 05-10-2020 09:01:45 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 05-10-2020 09:01:45 ******/
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
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (121, 0, NULL, 7, CAST(N'2020-10-03T17:31:28.727' AS DateTime), N'booked', 5, N'ANDV', N'SFTC', NULL, 732)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (122, 1, 1, NULL, CAST(N'2020-10-03T20:40:41.660' AS DateTime), N'cancelled', 6, N'KASH', N'SFTC', NULL, 622)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (123, 1, 1, NULL, CAST(N'2020-10-03T20:50:30.213' AS DateTime), N'cancelled', 6, N'KASH', N'SSVC', NULL, 622)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (124, 1, 1, NULL, CAST(N'2020-10-03T20:50:30.277' AS DateTime), N'cancelled', 4, N'SSVC', N'KASH', NULL, 610)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (125, 1, 1, NULL, CAST(N'2020-10-03T20:51:52.333' AS DateTime), N'cancelled', 6, N'ANDV', N'SFTC', NULL, 635)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (126, 1, 1, NULL, CAST(N'2020-10-03T21:26:53.093' AS DateTime), N'cancelled', 6, N'ANDV', N'SFTC', NULL, 635)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (127, 1, 1, NULL, CAST(N'2020-10-03T22:40:04.847' AS DateTime), N'cancelled', 6, N'KASH', N'AMBC', NULL, 507)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (128, 1, 1, NULL, CAST(N'2020-10-03T22:40:04.900' AS DateTime), N'cancelled', 4, N'AMBC', N'KASH', NULL, 498)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (129, 1, 1, NULL, CAST(N'2020-10-03T23:10:05.667' AS DateTime), N'cancelled', 6, N'AMBC', N'SFTC', NULL, 115)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (130, 1, 1, NULL, CAST(N'2020-10-04T23:34:35.580' AS DateTime), N'booked', 10, N'SHVJ', N'MRTL', NULL, 2075)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (131, 1, 1, NULL, CAST(N'2020-10-04T23:34:35.773' AS DateTime), N'booked', 12, N'MRTL', N'BNDR', NULL, 1842)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (132, 1, 6, NULL, CAST(N'2020-10-04T23:42:08.333' AS DateTime), N'booked', 6, N'KASH', N'SFTC', NULL, 611)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (133, 0, NULL, 8, CAST(N'2020-10-04T23:46:02.993' AS DateTime), N'booked', 6, N'ANDV', N'PNPT', NULL, 364)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (101, N'MH-TR0045', N'Queen Rangers', 25, 1, 1, 1, 0, N'2-3')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (102, N'KA-ZZ3004', N'Blue Coach', 10, 3, 1, 0, 0, N'1-1')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (103, N'MH-TW0007', N'Thunder Bolt', 30, 2, 0, 1, 1, N'3-3')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (104, N'PA-GO1010', N'SEA VIEW', 18, 1, 1, 0, 1, N'3-3')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (105, N'AP-TW6446', N'Deccan Throne', 20, 5, 0, 0, 1, N'2-3')
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner], [SeatMap]) VALUES (106, N'DL-245', N'Delux Power', 25, 1, 1, 1, 0, N'2-3')
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (1, 118, 103, 4, 4)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (2, 120, 101, 4, 4)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (3, 119, 102, 4, 4)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (4, 116, 101, 1, 1)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (5, 117, 101, 5, 5)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (6, 111, 101, 5, 5)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (7, 109, 102, 1, 1)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (8, 113, 101, 5, 5)
INSERT [dbo].[Feedback] ([Id], [BookingID], [BusID], [BookingFeedback], [BusFeedback]) VALUES (9, 112, 102, 5, 5)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[GuestUsers] ON 

INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (1, N'ritesh123@gmail.com', N'9638527410')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (2, N'dineshk889@xyz.com', N'6874598520')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (3, N'radhika1997@yahoo.com', N'7747889878')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (4, N'utsav@utsav.com', N'7878787878')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (6, N'varun@gmail.com', N'7788878747')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (7, N'sa@sa.com', N'7777777777')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (8, N'virat@gmail.com', N'7899877789')
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
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (121, 1, N'Utsav', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (122, 3, N'Sagar Mishra', 30, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (123, 4, N'Suyash', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (124, 4, N'Suyash', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (125, 4, N'Suyash', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (126, 13, N'Saraswati', 35, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (127, 14, N'Vivek', 42, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (128, 14, N'Vivek', 42, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (129, 8, N'Saraswati', 35, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (130, 11, N'Saraswati', 35, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (131, 11, N'Saraswati', 35, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (132, 8, N'Utsav', 22, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (133, 9, N'Virat', 26, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (133, 10, N'Neena', 26, N'Female')
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
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'AMBC', 196)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'ANDV', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'HUDA', 73)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KASH', 5)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KCAM', 200)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KRNL', 146)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'PNPT', 70)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'SFTC', 240)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'SSVC', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'AMBC', 48)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'ANDV', 244)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'HUDA', 172)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KASH', 239)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KCAM', 45)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'KRNL', 98)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'PNPT', 174)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'SFTC', 4)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (102, N'SSVC', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'ADNR', 216)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'ANDV', 261)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (103, N'DDNB', 5)
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
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'DDNB', 514)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'GRGN', 219)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'GZBD', 308)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'JAPR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'KASH', 275)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'MZFN', 372)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'PMNR', 519)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'RRKE', 449)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (104, N'RWRI', 109)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'AMRV', 709)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'ARBD', 391)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'BNDR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MNPA', 151)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MRTL', 840)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'MSRT', 148)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'NGPR', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'NVMB', 63)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'SHVJ', 10)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (105, N'TLKN', 25)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'AMRV', 138)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'ARBD', 456)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'BNDR', 847)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MNPA', 698)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MRTL', 10)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'MSRT', 701)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'NGPR', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'NVMB', 784)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'SHVJ', 836)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (106, N'TLKN', 828)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'BHIM', 230)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'DHRM', 232)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'MNNR', 532)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'SHVJ', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'SRNG', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'TLKN', 5)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (107, N'VDDR', 386)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'BHIM', 308)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'DHRM', 305)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'MNNR', 3)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'SHVJ', 538)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'SRNG', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (108, N'TLKN', 535)
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
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1027, CAST(732 AS Decimal(18, 0)), 121, N'Net Banking', N'Debit', CAST(N'2020-10-03T17:31:28.827' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1028, CAST(622 AS Decimal(18, 0)), 122, N'Wallet', N'Debit', CAST(N'2020-10-03T20:40:41.680' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1029, CAST(622 AS Decimal(18, 0)), 123, N'Wallet', N'Debit', CAST(N'2020-10-03T20:50:30.247' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1030, CAST(536 AS Decimal(18, 0)), 124, N'Wallet', N'Debit', CAST(N'2020-10-03T20:50:30.293' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1031, CAST(74 AS Decimal(18, 0)), 124, N'Card', N'Debit', CAST(N'2020-10-03T20:50:30.303' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1032, CAST(610 AS Decimal(18, 0)), 124, N'Wallet', N'Credit', CAST(N'2020-10-03T20:51:11.650' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1033, CAST(622 AS Decimal(18, 0)), 123, N'Wallet', N'Credit', CAST(N'2020-10-03T20:51:15.273' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1034, CAST(635 AS Decimal(18, 0)), 125, N'Wallet', N'Debit', CAST(N'2020-10-03T20:51:52.363' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1035, CAST(635 AS Decimal(18, 0)), 125, N'Wallet', N'Credit', CAST(N'2020-10-03T20:52:04.907' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1036, CAST(622 AS Decimal(18, 0)), 122, N'Wallet', N'Credit', CAST(N'2020-10-03T20:58:18.460' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1037, CAST(635 AS Decimal(18, 0)), 126, N'Wallet', N'Debit', CAST(N'2020-10-03T21:26:53.120' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1038, CAST(507 AS Decimal(18, 0)), 127, N'Wallet', N'Debit', CAST(N'2020-10-03T22:40:04.877' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1039, CAST(498 AS Decimal(18, 0)), 128, N'Wallet', N'Debit', CAST(N'2020-10-03T22:40:04.910' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1040, CAST(498 AS Decimal(18, 0)), 128, N'Wallet', N'Credit', CAST(N'2020-10-03T22:42:51.427' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1041, CAST(507 AS Decimal(18, 0)), 127, N'Wallet', N'Credit', CAST(N'2020-10-03T22:43:46.290' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1042, CAST(635 AS Decimal(18, 0)), 126, N'Wallet', N'Credit', CAST(N'2020-10-03T22:46:26.467' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1043, CAST(115 AS Decimal(18, 0)), 129, N'Wallet', N'Debit', CAST(N'2020-10-03T23:10:05.690' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1044, CAST(115 AS Decimal(18, 0)), 129, N'Wallet', N'Credit', CAST(N'2020-10-03T23:10:19.887' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1045, CAST(1854 AS Decimal(18, 0)), 130, N'Wallet', N'Debit', CAST(N'2020-10-04T23:34:35.747' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1046, CAST(221 AS Decimal(18, 0)), 130, N'Net Banking', N'Debit', CAST(N'2020-10-04T23:34:35.770' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1047, CAST(1842 AS Decimal(18, 0)), 131, N'Net Banking', N'Debit', CAST(N'2020-10-04T23:34:35.773' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1048, CAST(611 AS Decimal(18, 0)), 132, N'Paypal', N'Debit', CAST(N'2020-10-04T23:42:08.350' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1049, CAST(364 AS Decimal(18, 0)), 133, N'Paypal', N'Debit', CAST(N'2020-10-04T23:46:03.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (1, 103, 101, 1, 3, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (2, 101, 102, 2, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (3, 102, 101, 3, 2.4, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (4, 104, 102, 1, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (5, 105, 101, 1, 3, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (6, 101, 101, 1, 2.6, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (8, 103, 102, 1, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (9, 104, 105, 1, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (10, 105, 105, 1, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (11, 102, 106, 1, 2.2, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (12, 102, 106, 1, 2.2, N'Scheduled')
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
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (8, N'AMBC', CAST(N'2020-10-05T18:45:00.000' AS DateTime), CAST(N'2020-10-05T18:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (8, N'ANDV', CAST(N'2020-10-05T23:00:00.000' AS DateTime), CAST(N'2020-10-05T23:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (8, N'HUDA', CAST(N'2020-10-05T21:20:00.000' AS DateTime), CAST(N'2020-10-05T21:25:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (8, N'KRNL', CAST(N'2020-10-05T20:00:00.000' AS DateTime), CAST(N'2020-10-05T20:10:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (8, N'PNPT', CAST(N'2020-10-05T21:55:00.000' AS DateTime), CAST(N'2020-10-05T22:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (8, N'SFTC', CAST(N'2020-10-05T17:20:00.000' AS DateTime), CAST(N'2020-10-05T17:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (8, N'SSVC', CAST(N'2020-10-05T16:55:00.000' AS DateTime), CAST(N'2020-10-05T16:55:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'AMRV', CAST(N'2020-10-06T19:20:00.000' AS DateTime), CAST(N'2020-10-06T19:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'ARBD', CAST(N'2020-10-06T17:30:00.000' AS DateTime), CAST(N'2020-10-06T17:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'BNDR', CAST(N'2020-10-06T10:00:00.000' AS DateTime), CAST(N'2020-10-06T10:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'MNPA', CAST(N'2020-10-06T14:45:00.000' AS DateTime), CAST(N'2020-10-06T14:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'MRTL', CAST(N'2020-10-06T21:00:00.000' AS DateTime), CAST(N'2020-10-06T21:05:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'MSRT', CAST(N'2020-10-06T14:00:00.000' AS DateTime), CAST(N'2020-10-06T14:10:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'NGPR', CAST(N'2020-10-06T22:00:00.000' AS DateTime), CAST(N'2020-10-06T22:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'NVMB', CAST(N'2020-10-06T12:15:00.000' AS DateTime), CAST(N'2020-10-06T12:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'SHVJ', CAST(N'2020-10-06T10:45:00.000' AS DateTime), CAST(N'2020-10-06T10:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (9, N'TLKN', CAST(N'2020-10-06T11:30:00.000' AS DateTime), CAST(N'2020-10-06T11:35:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'AMRV', CAST(N'2020-10-05T19:20:00.000' AS DateTime), CAST(N'2020-10-05T19:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'ARBD', CAST(N'2020-10-05T17:30:00.000' AS DateTime), CAST(N'2020-10-05T17:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'BNDR', CAST(N'2020-10-05T10:00:00.000' AS DateTime), CAST(N'2020-10-05T10:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'MNPA', CAST(N'2020-10-05T14:45:00.000' AS DateTime), CAST(N'2020-10-05T14:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'MRTL', CAST(N'2020-10-05T21:00:00.000' AS DateTime), CAST(N'2020-10-05T21:05:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'MSRT', CAST(N'2020-10-05T14:00:00.000' AS DateTime), CAST(N'2020-10-05T14:10:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'NGPR', CAST(N'2020-10-05T22:00:00.000' AS DateTime), CAST(N'2020-10-05T22:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'NVMB', CAST(N'2020-10-05T12:15:00.000' AS DateTime), CAST(N'2020-10-05T12:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'SHVJ', CAST(N'2020-10-05T10:45:00.000' AS DateTime), CAST(N'2020-10-05T10:45:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (10, N'TLKN', CAST(N'2020-10-05T11:30:00.000' AS DateTime), CAST(N'2020-10-05T11:35:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'AMRV', CAST(N'2020-10-05T22:10:00.000' AS DateTime), CAST(N'2020-10-05T22:10:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'ARBD', CAST(N'2020-10-05T23:55:00.000' AS DateTime), CAST(N'2020-10-06T00:05:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'BNDR', CAST(N'2020-10-06T07:20:00.000' AS DateTime), CAST(N'2020-10-06T07:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'MNPA', CAST(N'2020-10-06T02:45:00.000' AS DateTime), CAST(N'2020-10-06T02:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'MRTL', CAST(N'2020-10-05T20:30:00.000' AS DateTime), CAST(N'2020-10-05T20:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'NGPR', CAST(N'2020-10-05T20:00:00.000' AS DateTime), CAST(N'2020-10-05T20:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'NVMB', CAST(N'2020-10-06T05:15:00.000' AS DateTime), CAST(N'2020-10-06T05:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'SHVJ', CAST(N'2020-10-06T06:45:00.000' AS DateTime), CAST(N'2020-10-06T06:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (11, N'TLKN', CAST(N'2020-10-06T06:00:00.000' AS DateTime), CAST(N'2020-10-06T06:10:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'AMRV', CAST(N'2020-10-06T22:10:00.000' AS DateTime), CAST(N'2020-10-06T22:10:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'ARBD', CAST(N'2020-10-06T23:55:00.000' AS DateTime), CAST(N'2020-10-07T00:05:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'BNDR', CAST(N'2020-10-07T07:20:00.000' AS DateTime), CAST(N'2020-10-07T07:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'MNPA', CAST(N'2020-10-07T02:45:00.000' AS DateTime), CAST(N'2020-10-07T02:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'MRTL', CAST(N'2020-10-06T20:30:00.000' AS DateTime), CAST(N'2020-10-06T20:30:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'NGPR', CAST(N'2020-10-06T20:00:00.000' AS DateTime), CAST(N'2020-10-06T20:00:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'NVMB', CAST(N'2020-10-07T05:15:00.000' AS DateTime), CAST(N'2020-10-07T05:20:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'SHVJ', CAST(N'2020-10-07T06:45:00.000' AS DateTime), CAST(N'2020-10-07T06:50:00.000' AS DateTime))
INSERT [dbo].[TripStops] ([TripId], [Stop], [ArrivalTime], [DepartureTime]) VALUES (12, N'TLKN', CAST(N'2020-10-07T06:00:00.000' AS DateTime), CAST(N'2020-10-07T06:10:00.000' AS DateTime))
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
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (10, N'b7d64ef798e0be0344bd7aadf912d10f', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (11, N'f21e80e2c69f15c3bdf6f0749fcf7fa0', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (12, N'99e2520e8c689fa018629c10c846281e', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (13, N'e8cb48345a185acc0520f1b2df9864d5', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (14, N'3a66f5f3e75e3884b9906e8409c56e9a', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (15, N'399ef53b551a0a9f1c94429ea5724b77', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (16, N'953d44348c92e2217eb0ef6dd83b3d87', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (17, N'77a5daa265afd3756a41fd36b9f66148', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (18, N'a318af764864018775dee15ffef5a4e1', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (19, N'1c66eea753d1a5a8bf30b788064470be', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (20, N'e71b74822d0068d470a1a14cf78aa6d7', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (21, N'17df70d13df65ef0290f7358cafc970b', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (22, N'b70d60bb9e1986c2bd9d02c6fd601dbb', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (23, N'6da735c2d0f2fc080ea261af8420be5b', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (24, N'7e8c7893f4cccac3030884340feed549', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (25, N'1dad70983c55e7fc7be61719e56b67ef', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (26, N'0bead2d916b373b493f9ffe4808765e6', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (27, N'4345b19be3402140814677ef3707e87e', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (28, N'485b49762dc5cdad19309511da07bfb5', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (29, N'061b1bf2b445f9840e631732a1dd669b', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (30, N'6bef23c404f56771d0db84d13639eb3c', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (31, N'a081626d8ffcac5dedff16d70dc17756', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (32, N'12a5d9ed4b60c56fdb3fcdfbca23983f', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (33, N'b419cbeb88df0cd6b80844d4bab8e93f', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (34, N'333a51b1b9722e41e08d2b2f98d0057c', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (35, N'3e43a8725593c7893bf04446b81e4828', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (36, N'feef8b8b467ed8a6b20d7ca2098d15a7', 6)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (37, N'6276e7f46fc75fd1797648299f4b8ff5', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (38, N'5ce5b3e61e95f0983e3ca85a49c266b0', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (39, N'fbda5b5b0cddb9fc663a227e314bfdcb', 2)
SET IDENTITY_INSERT [dbo].[UserLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (1, N'Saraswati', N'Desai', N'saras@gmail.com', N'Newuser@123', N'7899878988', 0, CAST(N'1985-01-09T00:00:00.000' AS DateTime), NULL, N'Female')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (2, N'Rahul', N'Mennon', N'raMen@gmail.com', N'Raser@123', N'9876342234', 1196, CAST(N'1996-06-09T00:00:00.000' AS DateTime), N'C255,Sector 63 Noida, UttarPradesh', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (3, N'Nitesh', N'Agarwal', N'nits@yahoo.com', N'Nittu@13', N'9768554563', 1250, NULL, N'149,Kalachowki Cotten Gress,Tank Road,Mumbai,Maharashtra', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (4, N'Dristi', N'Das', N'sird@gmail.com', N'123#dris', N'9687567533', 0, CAST(N'1989-03-08T00:00:00.000' AS DateTime), N'485,Shwetamansion,mumcircle,Bangalore,Karnataka', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (5, N'Shitala', N'Sharma', N'shital@gmail.com', N'shi@1234', N'9987612345', 150, CAST(N'1977-10-06T00:00:00.000' AS DateTime), NULL, N'Female')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (6, N'Utsav', N'Kejriwal', N'utsav@utsavkejriwal.com', N'Abcd@1234', N'7474747474', 0, CAST(N'1997-01-25T00:00:00.000' AS DateTime), N'Raipur', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (7, N'Vipashyana', N'Sharma', N'vipashyana@gmail.com', N'Vips@12345', N'7777788888', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__536C85E4555ADD5F]    Script Date: 05-10-2020 09:01:46 ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Buses__78A1A19DFE8C7F47]    Script Date: 05-10-2020 09:01:46 ******/
ALTER TABLE [dbo].[Buses] ADD UNIQUE NONCLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105348D3F2F90]    Script Date: 05-10-2020 09:01:46 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F7C046650C2BBC11]    Script Date: 05-10-2020 09:01:46 ******/
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
/****** Object:  StoredProcedure [dbo].[prc_feedback]    Script Date: 05-10-2020 09:01:46 ******/
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
/****** Object:  StoredProcedure [dbo].[prc_frequent_routes]    Script Date: 05-10-2020 09:01:46 ******/
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
/****** Object:  StoredProcedure [dbo].[prc_profit]    Script Date: 05-10-2020 09:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_profit]
as
begin
select BookingID,UserId,GuestId,month(BookingDate)LastMonth,year(BookingDate)PresentYear,Amount from Bookings
where month(BookingDate)=month(getdate())-1 and year(BookingDate)=year(getdate()) and Status = 'booked'
end
GO
