USE [TraWellDummy]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (1, N'utsav', N'utsav1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (2, N'pranav', N'pranav1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (3, N'vipashyana', N'vipashyana1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (4, N'bhanu', N'bhanu1234', 1)
INSERT [dbo].[Admin] ([Id], [Username], [Password], [isActive]) VALUES (5, N'akash', N'akash1234', 0)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (101, N'MH-TR0045', N'Queen Ranger', 25, 4, 1, 1, 1)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (102, N'KA-ZZ3004', N'Blue Coach', 10, 3, 1, 0, 0)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (103, N'MH-TW0007', N'Thunder Bolt', 30, 2, 0, 1, 1)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (104, N'PA-GO1010', N'SEA VIEW', 30, 1, 1, 0, 1)
INSERT [dbo].[Buses] ([Id], [Number], [Name], [Seats], [Admin], [hasAc], [hasWifi], [isRecliner]) VALUES (105, N'AP-TW6446', N'Deccan Throne', 20, 5, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Buses] OFF
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
SET IDENTITY_INSERT [dbo].[Trips] ON 

INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (1, 103, 101, 1, 3, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (2, 101, 102, 2, 2.5, N'Scheduled')
INSERT [dbo].[Trips] ([Id], [BusID], [RouteID], [Admin], [CostPerKm], [Status]) VALUES (3, 102, 101, 3, 2.4, N'Scheduled')
SET IDENTITY_INSERT [dbo].[Trips] OFF
GO
SET IDENTITY_INSERT [dbo].[GuestUsers] ON 

INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (1, N'ritesh123@gmail.com', N'9638527410')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (2, N'dineshk889@xyz.com', N'6874598520')
INSERT [dbo].[GuestUsers] ([Id], [Email], [Contact]) VALUES (3, N'radhika1997@yahoo.com', N'7747889878')
SET IDENTITY_INSERT [dbo].[GuestUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (1, N'Saraswati', N'Desai', N'saras@gmail.com', N'Newuser@123', N'9877665543', 0, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (2, N'Rahul', N'Mennon', N'raMen@gmail.com', N'Raser@123', N'9876342234', 1500, CAST(N'1996-06-09T00:00:00.000' AS DateTime), N'C255,Sector 63 Noida, UttarPradesh', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (3, N'Nitesh', N'Agarwal', N'nits@yahoo.com', N'Nittu@13', N'9768554563', 1250, NULL, N'149,Kalachowki Cotten Gress,Tank Road,Mumbai,Maharashtra', N'Male')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (4, N'Dristi', N'Das', N'sird@gmail.com', N'123#dris', N'9687567533', 0, CAST(N'1989-03-08T00:00:00.000' AS DateTime), N'485,Shwetamansion,mumcircle,Bangalore,Karnataka', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Contact], [Wallet], [DOB], [Address], [Gender]) VALUES (5, N'Shitala', N'Sharma', N'shital@gmail.com', N'shi@1234', N'9987612345', 150, CAST(N'1977-10-06T00:00:00.000' AS DateTime), NULL, N'Female')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (104, 1, 1, NULL, CAST(N'2020-09-20T12:00:00.000' AS DateTime), N'booked', 1, N'ANDV', N'KRNL', NULL, 438)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (105, 1, 3, NULL, CAST(N'2020-09-20T12:00:01.000' AS DateTime), N'cancelled', 2, N'SSVC', N'KASH', NULL, 575)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (106, 1, 5, NULL, CAST(N'2020-09-20T12:00:02.000' AS DateTime), N'booked', 2, N'AMBC', N'KASH', NULL, 472.5)
INSERT [dbo].[Bookings] ([BookingID], [UserRegistered], [UserId], [GuestId], [BookingDate], [Status], [TripId], [Boarding], [Arrival], [Feedback], [Amount]) VALUES (107, 0, NULL, 3, CAST(N'2020-09-20T12:00:03.000' AS DateTime), N'booked', 1, N'KRNL', N'SFTC', NULL, 294)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (104, 5, N'Rohan Desai', 26, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (104, 6, N'Saraswati Desai', 50, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (105, 3, N'Rahul Raj', 35, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (105, 4, N'Anshuman Kumar', 40, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (106, 5, N'Prachi Agarwal', 24, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (106, 6, N'Ruchi Agarwal', 55, N'Female')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (107, 7, N'Vaibhav Thakur', 23, N'Male')
INSERT [dbo].[PassengerDetails] ([BookingID], [Seat], [Name], [Age], [Gender]) VALUES (107, 8, N'Swapnil Singh', 23, N'Male')
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1004, CAST(438 AS Decimal(18, 0)), 104, N'Card', N'Credit', CAST(N'2020-09-20T12:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1005, CAST(575 AS Decimal(18, 0)), 105, N'Card', N'Credit', CAST(N'2020-09-20T12:00:01.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1006, CAST(473 AS Decimal(18, 0)), 106, N'Net Banking', N'Credit', CAST(N'2020-09-20T12:00:02.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1007, CAST(294 AS Decimal(18, 0)), 107, N'Card', N'Credit', CAST(N'2020-09-20T12:00:03.000' AS DateTime))
INSERT [dbo].[Transactions] ([id], [amount], [BookingID], [Mode], [TransType], [TransactionDate]) VALUES (1008, CAST(575 AS Decimal(18, 0)), 105, N'Wallet', N'Debit', CAST(N'2020-09-21T15:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'AMBC', 200)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'ANDV', 0)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'HUDA', 73)
INSERT [dbo].[Stops] ([RouteID], [Stop], [DistanceFromOrigin]) VALUES (101, N'KASH', 0)
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
GO
SET IDENTITY_INSERT [dbo].[UserLogs] ON 

INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (1, N'd6c82a2f26515c9ddbb715abc47a4787', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (2, N'967663be64b1934b94b489c32d71584f', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (3, N'63d6950af68f93e0f3198890d18dd59a', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (4, N'acf402ac7a3f3bd0d85d44b8ea417c33', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (6, N'7fa298fe0fdb0c5e5994bc551f038af5', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (7, N'e4ca9ab59417fcabd4dba4888ce1c5fe', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (8, N'518e9e54278f98131b92f6bdc8a01bda', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (9, N'b84734e9fba348a77ab78e7728566193', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (10, N'4d4f455f466d681b3e50b8cf6dd771a1', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (11, N'e279ec129933f5b17ef3a95f70726efe', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (12, N'51840236068e166869d27eafcc2946a3', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (13, N'394283ad5eea5d0d92e1eb2c9701191e', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (14, N'b9c80ed52c1b63034d0eacadd028c1d1', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (15, N'3e43a8725593c7893bf04446b81e4828', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (16, N'1479300a69a21725d8daa679cd90a90c', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (17, N'4ded94a1d273d91e33fac3eed8d429d6', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (18, N'c63b681322bdf61a8023add2862d3cf9', 1)
INSERT [dbo].[UserLogs] ([Id], [EncData], [UserId]) VALUES (19, N'2c453e72f1b0fe903f02a752794f0483', 1)
SET IDENTITY_INSERT [dbo].[UserLogs] OFF
GO
