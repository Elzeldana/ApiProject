USE [master]
GO
/****** Object:  Database [HOTEL_Managment]    Script Date: 1/30/2020 14:03:34 ******/
CREATE DATABASE [HOTEL_Managment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOTEL_Managment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HOTEL_Managment.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HOTEL_Managment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HOTEL_Managment_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HOTEL_Managment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOTEL_Managment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOTEL_Managment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HOTEL_Managment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOTEL_Managment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOTEL_Managment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HOTEL_Managment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOTEL_Managment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HOTEL_Managment] SET  MULTI_USER 
GO
ALTER DATABASE [HOTEL_Managment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOTEL_Managment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOTEL_Managment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOTEL_Managment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HOTEL_Managment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HOTEL_Managment]
GO
/****** Object:  Table [dbo].[BOARDING_TYPESERVICE]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOARDING_TYPESERVICE](
	[b_serviceID] [int] IDENTITY(1,1) NOT NULL,
	[b_servicename] [varchar](50) NULL,
	[b_servicecost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[b_serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BOARDING_USESEDSERVICE]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOARDING_USESEDSERVICE](
	[used_service_id] [int] IDENTITY(1,1) NOT NULL,
	[Booking_id] [int] NULL,
	[board_serv_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[used_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOKINGS]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOOKINGS](
	[booking_ID] [int] IDENTITY(1,1) NOT NULL,
	[booking_date] [date] NULL,
	[duration_ofstay] [varchar](10) NULL,
	[check_in_date] [date] NOT NULL,
	[check_out_date] [date] NULL,
	[Num_persons] [int] NULL,
	[Guest_id] [int] NOT NULL,
	[Total_amount] [decimal](10, 2) NULL,
 CONSTRAINT [PK__BOOKINGS__5DE2B9A9C405D187] PRIMARY KEY CLUSTERED 
(
	[booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GUESTS_INFO]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GUESTS_INFO](
	[Guest_ID] [int] IDENTITY(1,1) NOT NULL,
	[Guest_FirstName] [varchar](50) NULL,
	[Guest_LastName] [varchar](50) NULL,
	[Guest_ContactNumber] [varchar](50) NULL,
	[Gust_Email] [varchar](45) NULL,
	[Guest_adress] [varchar](45) NULL,
	[Guest_PlaceOfBirth] [varchar](45) NULL,
	[Guest_Country] [varchar](45) NULL,
	[Guest_idcardNo] [varchar](15) NULL,
 CONSTRAINT [PK__GUESTS_I__CB8B0D53D9EF5FBC] PRIMARY KEY CLUSTERED 
(
	[Guest_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginData]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginData](
	[Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](10) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Role] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NONBOARDING_SERVICES]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NONBOARDING_SERVICES](
	[Service_ID] [int] IDENTITY(1,1) NOT NULL,
	[Service_name] [varchar](30) NULL,
	[Service_description] [varchar](50) NULL,
	[Service_cost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROOM_TYPE]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROOM_TYPE](
	[roomtype_ID] [int] IDENTITY(1,1) NOT NULL,
	[roomtype_name] [varchar](20) NULL,
	[room_rate] [decimal](10, 2) NULL,
	[room_description] [varchar](100) NULL,
	[pets_alowed] [tinyint] NULL,
	[AC] [tinyint] NULL,
	[WiFi] [tinyint] NULL,
	[CableTV] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomtype_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROOMS]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOMS](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_number] [int] NULL,
	[roomtype_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ROOMS_BOOKED]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOMS_BOOKED](
	[BookedRoooms_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NULL,
	[room_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookedRoooms_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[used_NONBOARDING_SERVICES]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[used_NONBOARDING_SERVICES](
	[UsedService_ID] [int] IDENTITY(1,1) NOT NULL,
	[Booking_id] [int] NULL,
	[hotelservice_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UsedService_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BOARDING_TYPESERVICE] ON 

INSERT [dbo].[BOARDING_TYPESERVICE] ([b_serviceID], [b_servicename], [b_servicecost]) VALUES (1, N'Breakfast', CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[BOARDING_TYPESERVICE] ([b_serviceID], [b_servicename], [b_servicecost]) VALUES (2, N'Half board', CAST(7.00 AS Decimal(10, 2)))
INSERT [dbo].[BOARDING_TYPESERVICE] ([b_serviceID], [b_servicename], [b_servicecost]) VALUES (3, N'Full board Startup Lunch', CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[BOARDING_TYPESERVICE] ([b_serviceID], [b_servicename], [b_servicecost]) VALUES (4, N'Full board Startup Dinner', CAST(10.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[BOARDING_TYPESERVICE] OFF
SET IDENTITY_INSERT [dbo].[BOOKINGS] ON 

INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (1, CAST(N'2020-01-11' AS Date), NULL, CAST(N'2020-06-21' AS Date), CAST(N'2020-07-13' AS Date), 3, 9, NULL)
INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (2, CAST(N'2020-01-11' AS Date), NULL, CAST(N'2020-02-28' AS Date), CAST(N'2020-06-24' AS Date), 1, 7, NULL)
INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (3, CAST(N'2020-01-12' AS Date), NULL, CAST(N'2020-06-28' AS Date), CAST(N'2020-06-30' AS Date), 2, 8, NULL)
INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (4, CAST(N'2020-01-12' AS Date), NULL, CAST(N'2020-07-05' AS Date), CAST(N'2020-07-09' AS Date), 3, 9, NULL)
INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (5, CAST(N'2020-01-12' AS Date), NULL, CAST(N'2020-09-28' AS Date), CAST(N'2020-08-23' AS Date), 2, 7, NULL)
INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (6, CAST(N'2020-02-02' AS Date), NULL, CAST(N'2020-08-30' AS Date), CAST(N'2020-09-18' AS Date), 4, 5, NULL)
INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (7, CAST(N'2020-01-27' AS Date), N'4', CAST(N'2020-08-28' AS Date), CAST(N'2020-02-02' AS Date), 2, 7, NULL)
INSERT [dbo].[BOOKINGS] ([booking_ID], [booking_date], [duration_ofstay], [check_in_date], [check_out_date], [Num_persons], [Guest_id], [Total_amount]) VALUES (9, CAST(N'2020-01-29' AS Date), N'1', CAST(N'2020-06-29' AS Date), CAST(N'2020-07-19' AS Date), 3, 7, NULL)
SET IDENTITY_INSERT [dbo].[BOOKINGS] OFF
SET IDENTITY_INSERT [dbo].[GUESTS_INFO] ON 

INSERT [dbo].[GUESTS_INFO] ([Guest_ID], [Guest_FirstName], [Guest_LastName], [Guest_ContactNumber], [Gust_Email], [Guest_adress], [Guest_PlaceOfBirth], [Guest_Country], [Guest_idcardNo]) VALUES (5, N'Jane', N'Doe', N'003587-9687-44', N'janedoe@gmail.com', N'5th Avenue', N'New York', N'NY', N'AC93002')
INSERT [dbo].[GUESTS_INFO] ([Guest_ID], [Guest_FirstName], [Guest_LastName], [Guest_ContactNumber], [Gust_Email], [Guest_adress], [Guest_PlaceOfBirth], [Guest_Country], [Guest_idcardNo]) VALUES (7, N'Bob', N'Woltz', N'896-784-366', N'BobW@gmai.com', N'Brookfield road', N'Boston', N'MA', N'EF04053')
INSERT [dbo].[GUESTS_INFO] ([Guest_ID], [Guest_FirstName], [Guest_LastName], [Guest_ContactNumber], [Gust_Email], [Guest_adress], [Guest_PlaceOfBirth], [Guest_Country], [Guest_idcardNo]) VALUES (8, N'Lilly', N'Agnes', N'003587-9687-44', N'lillyan@mail.com', N'S Mango Street', N'Orlando', N'FL', N'30000022')
INSERT [dbo].[GUESTS_INFO] ([Guest_ID], [Guest_FirstName], [Guest_LastName], [Guest_ContactNumber], [Gust_Email], [Guest_adress], [Guest_PlaceOfBirth], [Guest_Country], [Guest_idcardNo]) VALUES (9, N'John', N'Doe', N'048-984-545', N'johndo@email.com', N'Washing.str', N'Boston', N'MA', N'EF04875')
INSERT [dbo].[GUESTS_INFO] ([Guest_ID], [Guest_FirstName], [Guest_LastName], [Guest_ContactNumber], [Gust_Email], [Guest_adress], [Guest_PlaceOfBirth], [Guest_Country], [Guest_idcardNo]) VALUES (10, N'Zlatko', N'Dom', N'555-9687-44', N'zlatko@gmail.com', N'Slavko Ave', N'Ljublana', N'Slovenia', N'SL090101')
SET IDENTITY_INSERT [dbo].[GUESTS_INFO] OFF
SET IDENTITY_INSERT [dbo].[LoginData] ON 

INSERT [dbo].[LoginData] ([Log_ID], [Username], [Password], [Email], [Role]) VALUES (1, N'Manager', N'manager', N'managment@mail.com', N'admin')
INSERT [dbo].[LoginData] ([Log_ID], [Username], [Password], [Email], [Role]) VALUES (2, N'User1', N'user1', N'user@mail.com', N'user')
SET IDENTITY_INSERT [dbo].[LoginData] OFF
SET IDENTITY_INSERT [dbo].[NONBOARDING_SERVICES] ON 

INSERT [dbo].[NONBOARDING_SERVICES] ([Service_ID], [Service_name], [Service_description], [Service_cost]) VALUES (1, N'Laundry', N' Available Dry Cleaning per day', CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[NONBOARDING_SERVICES] ([Service_ID], [Service_name], [Service_description], [Service_cost]) VALUES (2, N'24Service', N'Available room service at any time', CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[NONBOARDING_SERVICES] ([Service_ID], [Service_name], [Service_description], [Service_cost]) VALUES (3, N'Pool', N' Shared pool access for the guests per day', CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[NONBOARDING_SERVICES] ([Service_ID], [Service_name], [Service_description], [Service_cost]) VALUES (4, N'Gym', N' Shared fitness fascility access  per day', CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[NONBOARDING_SERVICES] ([Service_ID], [Service_name], [Service_description], [Service_cost]) VALUES (5, N'Ironing', N'Ironing guests clothes in an hour', CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[NONBOARDING_SERVICES] ([Service_ID], [Service_name], [Service_description], [Service_cost]) VALUES (6, N'Sauna', N'Daily access in steam bath fascilities', CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[NONBOARDING_SERVICES] ([Service_ID], [Service_name], [Service_description], [Service_cost]) VALUES (7, N'Childcare', N'Hourly child care and entertainment rooms', CAST(2.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[NONBOARDING_SERVICES] OFF
SET IDENTITY_INSERT [dbo].[ROOM_TYPE] ON 

INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (1, N'Single', CAST(15.00 AS Decimal(10, 2)), N'Single bed, shared balcony', 1, 1, 1, 1)
INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (2, N'Twin', CAST(25.00 AS Decimal(10, 2)), N'Two single beds', 1, 1, 1, 1)
INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (3, N'Double', CAST(25.00 AS Decimal(10, 2)), N'Standard double bed', 1, 1, 1, 1)
INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (4, N'Triple', CAST(35.00 AS Decimal(10, 2)), N'Three single beds, balcony', 1, 1, 1, 0)
INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (5, N'Quad', CAST(40.00 AS Decimal(10, 2)), N'Four Single Beds', 1, 1, 1, 0)
INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (6, N'King', CAST(30.00 AS Decimal(10, 2)), N'(150cm × 200cm)Large double bed, balcony', 1, 1, 1, 1)
INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (7, N'Mini Suite', CAST(80.00 AS Decimal(10, 2)), N'queen & two twin beds, balcony,sofa bed & coffee table', 0, 1, 1, 1)
INSERT [dbo].[ROOM_TYPE] ([roomtype_ID], [roomtype_name], [room_rate], [room_description], [pets_alowed], [AC], [WiFi], [CableTV]) VALUES (8, N'Presidential Suite', CAST(100.00 AS Decimal(10, 2)), N'bedroom, living room  with balconies', 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ROOM_TYPE] OFF
SET IDENTITY_INSERT [dbo].[ROOMS] ON 

INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (1, 101, 1)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (2, 102, 1)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (3, 103, 1)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (4, 104, 2)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (5, 105, 2)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (6, 106, 3)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (7, 107, 3)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (8, 108, 4)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (9, 109, 4)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (10, 110, 5)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (11, 111, 5)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (12, 112, 6)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (13, 113, 6)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (14, 114, 7)
INSERT [dbo].[ROOMS] ([room_id], [room_number], [roomtype_id]) VALUES (15, 100, 8)
SET IDENTITY_INSERT [dbo].[ROOMS] OFF
SET IDENTITY_INSERT [dbo].[ROOMS_BOOKED] ON 

INSERT [dbo].[ROOMS_BOOKED] ([BookedRoooms_id], [booking_id], [room_id]) VALUES (1, 1, 3)
INSERT [dbo].[ROOMS_BOOKED] ([BookedRoooms_id], [booking_id], [room_id]) VALUES (2, 2, 1)
INSERT [dbo].[ROOMS_BOOKED] ([BookedRoooms_id], [booking_id], [room_id]) VALUES (3, 3, 3)
INSERT [dbo].[ROOMS_BOOKED] ([BookedRoooms_id], [booking_id], [room_id]) VALUES (4, 4, 4)
INSERT [dbo].[ROOMS_BOOKED] ([BookedRoooms_id], [booking_id], [room_id]) VALUES (5, 5, 3)
INSERT [dbo].[ROOMS_BOOKED] ([BookedRoooms_id], [booking_id], [room_id]) VALUES (6, 6, 5)
SET IDENTITY_INSERT [dbo].[ROOMS_BOOKED] OFF
ALTER TABLE [dbo].[BOARDING_USESEDSERVICE]  WITH CHECK ADD  CONSTRAINT [FK_BoardingBookings] FOREIGN KEY([Booking_id])
REFERENCES [dbo].[BOOKINGS] ([booking_ID])
GO
ALTER TABLE [dbo].[BOARDING_USESEDSERVICE] CHECK CONSTRAINT [FK_BoardingBookings]
GO
ALTER TABLE [dbo].[BOARDING_USESEDSERVICE]  WITH CHECK ADD  CONSTRAINT [FK_BoardingType] FOREIGN KEY([board_serv_id])
REFERENCES [dbo].[BOARDING_TYPESERVICE] ([b_serviceID])
GO
ALTER TABLE [dbo].[BOARDING_USESEDSERVICE] CHECK CONSTRAINT [FK_BoardingType]
GO
ALTER TABLE [dbo].[BOOKINGS]  WITH CHECK ADD  CONSTRAINT [FK_BookingsGuests] FOREIGN KEY([Guest_id])
REFERENCES [dbo].[GUESTS_INFO] ([Guest_ID])
GO
ALTER TABLE [dbo].[BOOKINGS] CHECK CONSTRAINT [FK_BookingsGuests]
GO
ALTER TABLE [dbo].[ROOMS]  WITH CHECK ADD  CONSTRAINT [FK_ROOMSTYPE] FOREIGN KEY([roomtype_id])
REFERENCES [dbo].[ROOM_TYPE] ([roomtype_ID])
GO
ALTER TABLE [dbo].[ROOMS] CHECK CONSTRAINT [FK_ROOMSTYPE]
GO
ALTER TABLE [dbo].[ROOMS_BOOKED]  WITH CHECK ADD  CONSTRAINT [FK_ROOMS] FOREIGN KEY([room_id])
REFERENCES [dbo].[ROOMS] ([room_id])
GO
ALTER TABLE [dbo].[ROOMS_BOOKED] CHECK CONSTRAINT [FK_ROOMS]
GO
ALTER TABLE [dbo].[ROOMS_BOOKED]  WITH CHECK ADD  CONSTRAINT [FK_ROOMSBOOKINGS] FOREIGN KEY([booking_id])
REFERENCES [dbo].[BOOKINGS] ([booking_ID])
GO
ALTER TABLE [dbo].[ROOMS_BOOKED] CHECK CONSTRAINT [FK_ROOMSBOOKINGS]
GO
ALTER TABLE [dbo].[used_NONBOARDING_SERVICES]  WITH CHECK ADD  CONSTRAINT [FK_ServicesBookings] FOREIGN KEY([Booking_id])
REFERENCES [dbo].[BOOKINGS] ([booking_ID])
GO
ALTER TABLE [dbo].[used_NONBOARDING_SERVICES] CHECK CONSTRAINT [FK_ServicesBookings]
GO
ALTER TABLE [dbo].[used_NONBOARDING_SERVICES]  WITH CHECK ADD  CONSTRAINT [FK_USEDSERVICES] FOREIGN KEY([hotelservice_id])
REFERENCES [dbo].[NONBOARDING_SERVICES] ([Service_ID])
GO
ALTER TABLE [dbo].[used_NONBOARDING_SERVICES] CHECK CONSTRAINT [FK_USEDSERVICES]
GO
/****** Object:  StoredProcedure [dbo].[GetRoomTypeByID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRoomTypeByID]
@id INT
AS

SELECT*
FROM ROOM_TYPE
WHERE roomtype_id = @id;

GO
/****** Object:  StoredProcedure [dbo].[spAddNewRoom]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddNewRoom]
@room_number int,
@room_typeID int
AS
INSERT INTO ROOMS (room_number, roomtype_ID)
values (@room_number, @room_typeID)


GO
/****** Object:  StoredProcedure [dbo].[spBookingByGuestID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBookingByGuestID]
@guestid int
as
select*from bookings
where Guest_id=@guestid;
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCustomer]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteCustomer]
@id int
AS 
DELETE FROM GUESTS_INFO
WHERE Guest_ID= @id;

GO
/****** Object:  StoredProcedure [dbo].[spDeleteRoomByID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteRoomByID]
@id int
AS
delete from rooms
where @id=room_id
GO
/****** Object:  StoredProcedure [dbo].[spDeleteRoomTypeByID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteRoomTypeByID]
@id int
as
delete from ROOM_TYPE
where @id=roomtype_ID
GO
/****** Object:  StoredProcedure [dbo].[spGeReservationsByGuestID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGeReservationsByGuestID]
@guestid int
AS
SELECT g.Guest_FirstName, g.Guest_LastName, g.Guest_Country, b.booking_ID, check_in_date, check_out_date
FROM  GUESTS_INFO g INNER JOIN BOOKINGS b on b.Guest_id= g.guest_id
WHERE g.Guest_ID= @guestid;

GO
/****** Object:  StoredProcedure [dbo].[spGetAllBookins]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spGetAllBookins]
AS
SELECT*FROM BOOKINGS

GO
/****** Object:  StoredProcedure [dbo].[spGetAllCustomers]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllCustomers]
AS
SELECT
Guest_ID, Guest_FirstName, Guest_LastName, Guest_ContactNumber,
Gust_Email, Guest_adress, Guest_PlaceOfBirth, Guest_Country,Guest_idcardNo
FROM 
GUESTS_INFO;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllReservations]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAllReservations] 
AS
SELECT g.Guest_FirstName, g.Guest_LastName, g.Guest_Country, b.booking_ID, check_in_date, check_out_date
FROM  GUESTS_INFO g INNER JOIN BOOKINGS b on b.Guest_id= g.guest_id
GO
/****** Object:  StoredProcedure [dbo].[spGetAllRooms]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllRooms]
as
select*from rooms
GO
/****** Object:  StoredProcedure [dbo].[spGetAllRoomTypes]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAllRoomTypes]
AS
SELECT
roomtype_ID, roomtype_name, room_rate, room_description
FROM ROOM_TYPE;

GO
/****** Object:  StoredProcedure [dbo].[spGetBookingByID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbo].[spGetBookingByID]
 @bookingid int
 AS
 Select* from BOOKINGS
 Where @bookingid=booking_ID;
GO
/****** Object:  StoredProcedure [dbo].[spGetCustomer]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCustomer]
@id int
AS
SELECT
Guest_ID, Guest_FirstName, Guest_LastName, Guest_ContactNumber,
Gust_Email, Guest_adress, Guest_PlaceOfBirth, Guest_Country,Guest_idcardNo
FROM 
GUESTS_INFO
WHERE
Guest_ID= @id;

GO
/****** Object:  StoredProcedure [dbo].[spGetReservByResID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetReservByResID]
@id int
AS
SELECT *
FROM BOOKINGS
WHERE  @id=booking_ID
GO
/****** Object:  StoredProcedure [dbo].[spInsertCustomer]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertCustomer]

@Guest_FirstName varchar(50),
@Guest_LastName varchar (50),
@Guest_ContactNumber varchar(50),
@Gust_Email varchar(45),
@Guest_adress varchar(45),
@Guest_PlaceOfBirth varchar(45),
@Guest_Country varchar(45),
@Guest_idcardNo varchar(15)
AS
INSERT INTO GUESTS_INFO
(Guest_FirstName, Guest_LastName, Guest_ContactNumber, Gust_Email,Guest_adress, Guest_PlaceOfBirth, 
Guest_Country,Guest_idcardNo)
VALUES 
(@Guest_FirstName, @Guest_LastName, @Guest_ContactNumber, @Gust_Email, @Guest_adress, @Guest_PlaceOfBirth, 
@Guest_Country, @Guest_idcardNo);

GO
/****** Object:  StoredProcedure [dbo].[spInsertNewBooking]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spInsertNewBooking]
  @checkin date,
  @checkout date,
  @persons int,
  @guestid int
  AS
  INSERT INTO BOOKINGS (booking_date, duration_ofstay, check_in_date, check_out_date, Num_persons, Guest_id)
  VALUES (GETDATE(), DATEDIFF(DAY, @checkin, @checkout), @checkin, @checkout, @persons, @guestid);

GO
/****** Object:  StoredProcedure [dbo].[spInsertNewRoomType]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertNewRoomType]

@roomtype_name varchar,
@room_rate decimal,
@room_description varchar
as
INSERT INTO ROOM_TYPE(roomtype_name,room_rate,room_description)
values( @roomtype_name,@room_rate,@room_description)
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogin]
    @username varchar(50)=null,  
    @password varchar(50)=null  
AS  
BEGIN  
      
    SET NOCOUNT ON;  
         
    SELECT  Username, Password, Email, Role from LoginData where Username=@username and Password=@password  
END  


GO
/****** Object:  StoredProcedure [dbo].[spRemoveReservation]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveReservation]
@id int
AS
DELETE FROM BOOKINGS
WHERE booking_ID=@id;

GO
/****** Object:  StoredProcedure [dbo].[spUpdateResCheckInDateByResID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateResCheckInDateByResID]
@id int, 
@checkin date
AS UPDATE BOOKINGS
SET @checkin= check_in_date
WHERE booking_id=@id
GO
/****** Object:  StoredProcedure [dbo].[spUpdateRoomIDtype]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spUpdateRoomIDtype]
@id int,
@typeid int
as
UPDATE ROOMS
SET @typeid= roomtype_id
WHERE room_id=@id;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateRoomPriceByRoomId]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateRoomPriceByRoomId]
@id int,
@price decimal
AS 
UPDATE ROOM_TYPE
set 
@price=room_rate
WHERE @id=roomtype_ID
GO
/****** Object:  StoredProcedure [dbo].[spUpdateRoomTypeRate]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateRoomTypeRate]
@id int,
@rate decimal
AS
UPDATE ROOM_TYPE
set  @rate= room_rate
WHERE @id=roomtype_ID
GO
/****** Object:  StoredProcedure [dbo].[UpdateCheckOut]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCheckOut]
@id int,
@checkout date
AS UPDATE BOOKINGS
SET check_out_date=@checkout
WHERE booking_id=@id

GO
/****** Object:  StoredProcedure [dbo].[UpdatePhone]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdatePhone]
@id int,
@phone varchar(50)
AS
UPDATE GUESTS_INFO
SET Guest_ContactNumber= @phone
WHERE Guest_ID=@id;
GO
/****** Object:  StoredProcedure [dbo].[UpdatePhoneNumber]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdatePhoneNumber]
@id int,
@phone varchar
AS
UPDATE GUESTS_INFO
SET Guest_ContactNumber= @phone
WHERE Guest_ID=@id;

GO
/****** Object:  StoredProcedure [dbo].[UpdateResCheckOutDateByResID]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateResCheckOutDateByResID]
@id int,
@checkout date
AS UPDATE BOOKINGS
SET @checkout=check_out_date
WHERE @id=booking_id
GO
/****** Object:  StoredProcedure [dbo].[UpdtateArrivalDate]    Script Date: 1/30/2020 14:03:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdtateArrivalDate]
@id int, 
@checkin date
AS 
UPDATE BOOKINGS
SET  check_in_date=@checkin
WHERE booking_id=@id

GO
USE [master]
GO
ALTER DATABASE [HOTEL_Managment] SET  READ_WRITE 
GO
