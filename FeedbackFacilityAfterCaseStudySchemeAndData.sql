USE [master]
GO
/****** Object:  Database [FeedbackFacility]    Script Date: 2/22/2017 3:55:39 PM ******/
CREATE DATABASE [FeedbackFacility]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FeedbackFacility', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FeedbackFacility.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FeedbackFacility_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FeedbackFacility_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FeedbackFacility] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FeedbackFacility].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FeedbackFacility] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FeedbackFacility] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FeedbackFacility] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FeedbackFacility] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FeedbackFacility] SET ARITHABORT OFF 
GO
ALTER DATABASE [FeedbackFacility] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FeedbackFacility] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FeedbackFacility] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FeedbackFacility] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FeedbackFacility] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FeedbackFacility] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FeedbackFacility] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FeedbackFacility] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FeedbackFacility] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FeedbackFacility] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FeedbackFacility] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FeedbackFacility] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FeedbackFacility] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FeedbackFacility] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FeedbackFacility] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FeedbackFacility] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FeedbackFacility] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FeedbackFacility] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FeedbackFacility] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FeedbackFacility] SET  MULTI_USER 
GO
ALTER DATABASE [FeedbackFacility] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FeedbackFacility] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FeedbackFacility] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FeedbackFacility] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FeedbackFacility]
GO

/****** Object:  Table [dbo].[BaseSupervisors]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaseSupervisors](
	[UserID] [varchar](11) NOT NULL,
	[FloorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FloorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [varchar](100) NULL,
	[LocationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facilities](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Floors]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Floors](
	[FloorID] [int] IDENTITY(1,1) NOT NULL,
	[FloorName] [varchar](100) NULL,
	[BuildingID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Wings] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FloorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Level1Supervisors]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Level1Supervisors](
	[UserID] [varchar](11) NOT NULL,
	[BulidingID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[BulidingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Level2Supervisors]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Level2Supervisors](
	[UserID] [varchar](11) NOT NULL,
	[FacilityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Level3Supervisors]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Level3Supervisors](
	[UserID] [varchar](11) NOT NULL,
	[LocationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](100) NULL,
	[LocationCountry] [varchar](20) NOT NULL,
	[LocationCity] [varchar](20) NOT NULL,
	[LocationZipCode] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NOT NULL,
	[Question1] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[AssociateID] [varchar](11) NOT NULL,
	[Rating] [varchar](20) NULL,
	[Remark] [varchar](200) NULL,
	[UnitID] [int] NULL,
	[FacilityID] [int] NULL,
	[QuestionID] [int] NULL,
	[RatingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suggestions]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suggestions](
	[SuggestionID] [int] IDENTITY(1,1) NOT NULL,
	[SuggestionText] [varchar](1000) NOT NULL,
	[AssociateID] [varchar](11) NOT NULL,
	[UnitID] [int] NOT NULL,
	[SuggestionDate] [datetime] NOT NULL,
	[SuggestionStatus] [varchar](20) NOT NULL,
	[RejectionRemarks] [varchar](1000) NULL,
	[AcknowedgementDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SuggestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupervisorDetails]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupervisorDetails](
	[UserID] [varchar](11) NOT NULL,
	[SupervisorLevel] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Units]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Units](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](100) NULL,
	[Wing] [varchar](20) NOT NULL,
	[FacilityID] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
	[FloorID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[BaseSupervisorID] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [varchar](11) NOT NULL,
	[UserName] [varchar](100) NULL,
	[UserPhoneNo] [varchar](13) NULL,
	[UserRole] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [LocationID]) VALUES (2, N'ITC-1', 5)
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [LocationID]) VALUES (8, N'SDB-3', 4)
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [LocationID]) VALUES (9, N'ITC-5', 3)
GO
INSERT [dbo].[Buildings] ([BuildingID], [BuildingName], [LocationID]) VALUES (10, N'a', 6)
GO
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[Facilities] ON 

GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (1, N'HOUSE KEEPING')
GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (2, N'PANTRY')
GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (3, N'CONFERENCE')
GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (4, N'CAFETERIA')
GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (18, N'Security')
GO
INSERT [dbo].[Facilities] ([FacilityID], [FacilityName]) VALUES (19, N'Jango')
GO
SET IDENTITY_INSERT [dbo].[Facilities] OFF
GO
SET IDENTITY_INSERT [dbo].[Floors] ON 

GO
INSERT [dbo].[Floors] ([FloorID], [FloorName], [BuildingID], [LocationID], [Wings]) VALUES (2, N'Floor 6', 9, 3, N'["A","B","C"]')
GO
INSERT [dbo].[Floors] ([FloorID], [FloorName], [BuildingID], [LocationID], [Wings]) VALUES (3, N'Floor 1', 9, 3, N'["A","B","C"]')
GO
INSERT [dbo].[Floors] ([FloorID], [FloorName], [BuildingID], [LocationID], [Wings]) VALUES (5, N'a', 10, 6, N'a')
GO
INSERT [dbo].[Floors] ([FloorID], [FloorName], [BuildingID], [LocationID], [Wings]) VALUES (6, N'asd', 2, 3, N'a')
GO
INSERT [dbo].[Floors] ([FloorID], [FloorName], [BuildingID], [LocationID], [Wings]) VALUES (7, N'8-floor', 8, 4, N'["A","B"]')
GO
SET IDENTITY_INSERT [dbo].[Floors] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

GO
INSERT [dbo].[Locations] ([LocationID], [LocationName], [LocationCountry], [LocationCity], [LocationZipCode]) VALUES (3, N'Electronic City Campus', N'India', N'Bengalore', N'673032')
GO
INSERT [dbo].[Locations] ([LocationID], [LocationName], [LocationCountry], [LocationCity], [LocationZipCode]) VALUES (4, N'Chennai Campus', N'India', N'Chennai', N'673032')
GO
INSERT [dbo].[Locations] ([LocationID], [LocationName], [LocationCountry], [LocationCity], [LocationZipCode]) VALUES (5, N'Hyderabad Campus', N'India', N'Hyderabad', N'673032')
GO
INSERT [dbo].[Locations] ([LocationID], [LocationName], [LocationCountry], [LocationCity], [LocationZipCode]) VALUES (6, N'Gold Hill', N'India', N'Bengaluru', N'123456')
GO
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (36, 2, N'Availability of coffee/tea')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (37, 2, N'Vending machine in clean & hygienic')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (38, 2, N'Availability of cups')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (40, 2, N'availability of Drinking Water')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (41, 3, N'Arrangement made as per request')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (42, 3, N'Availability of marker pens/Dusters')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (43, 3, N'Conference room service')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (44, 3, N'Maintenance of chairs/wire management ')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (45, 3, N'Working of Infocus(Projector)')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (46, 3, N'Ambience of conference room')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (47, 1, N'Wash room is clean&hygienic')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (48, 1, N'Work station/chair/Dust bins are clean')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (49, 1, N'Carpet is clean')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (50, 1, N'General ambiance of office condusive')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (51, 1, N'Response to complaints & Suggestions')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (52, 18, N'Apperance and bearing of the security personnel')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (53, 18, N'Apperance and bearing of the security personnel')
GO
INSERT [dbo].[Questions] ([QuestionID], [FacilityID], [Question1]) VALUES (55, 19, N';)')
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (1, N'DG00485439', N'5', N'', 2, 1, 51, CAST(0x0000A722009E7764 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (2, N'DG00485439', N'5', N'', 2, 1, 49, CAST(0x0000A722009E7767 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (3, N'DG00485439', N'5', N'', 2, 1, 48, CAST(0x0000A722009E7764 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (4, N'DG00485439', N'4', N'Not Hygiene enough', 2, 1, 47, CAST(0x0000A722009E776B AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (5, N'DG00485439', N'1', N'Nope', 2, 1, 50, CAST(0x0000A722009E7764 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (6, N'DG00485439', N'5', N'', 4, 1, 47, CAST(0x0000A72200A029CE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (7, N'DG00485439', N'5', N'', 4, 1, 50, CAST(0x0000A72200A029CE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (8, N'DG00485439', N'5', N'', 4, 1, 51, CAST(0x0000A72200A029CE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (9, N'DG00485439', N'5', N'', 4, 1, 49, CAST(0x0000A72200A029CF AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (10, N'DG00485439', N'5', N'', 4, 1, 48, CAST(0x0000A72200A029CE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (11, N'DG00485439', N'5', N'', 10, 1, 49, CAST(0x0000A72200A0495F AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (12, N'DG00485439', N'5', N'', 10, 1, 47, CAST(0x0000A72200A0495F AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (13, N'DG00485439', N'1', N'Nope', 10, 1, 50, CAST(0x0000A72200A0495F AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (14, N'DG00485439', N'5', N'', 10, 1, 51, CAST(0x0000A72200A0495F AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (15, N'DG00485439', NULL, NULL, 10, 1, NULL, CAST(0x0000A72200A0495F AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (16, N'DG00485439', NULL, NULL, 10, 1, NULL, CAST(0x0000A72200A04965 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (17, N'DG00485439', N'1', N'No Chairs', 10, 1, 48, CAST(0x0000A72200A0495F AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (18, N'DG00485439', NULL, NULL, 10, 1, NULL, CAST(0x0000A72200A04964 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (19, N'DG00485439', NULL, NULL, 10, 1, NULL, CAST(0x0000A72200A04966 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (20, N'DG00485439', NULL, NULL, 10, 1, NULL, CAST(0x0000A72200A04964 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (21, N'DG00485439', N'5', N'', 2, 1, 48, CAST(0x0000A72200A06945 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (22, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A06945 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (23, N'DG00485439', N'1', N'No', 2, 1, 47, CAST(0x0000A72200A06945 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (24, N'DG00485439', N'1', N'No', 2, 1, 49, CAST(0x0000A72200A06946 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (25, N'DG00485439', N'5', N'', 2, 1, 51, CAST(0x0000A72200A06945 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (26, N'DG00485439', N'1', N'No', 2, 1, 50, CAST(0x0000A72200A06955 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (27, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A06959 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (28, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A0695A AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (29, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A0695A AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (30, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A0695A AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (31, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A0695B AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (32, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A06961 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (33, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A06960 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (34, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A06962 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (35, N'DG00485439', NULL, NULL, 2, 1, NULL, CAST(0x0000A72200A06964 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (36, N'JV00484277', N'5', N'', 4, 1, 49, CAST(0x0000A72200B1B934 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (37, N'JV00484277', N'5', N'', 4, 1, 48, CAST(0x0000A72200B1B934 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (38, N'JV00484277', N'5', N'', 4, 1, 47, CAST(0x0000A72200B1B934 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (39, N'JV00484277', N'5', N'', 4, 1, 51, CAST(0x0000A72200B1B936 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (40, N'JV00484277', N'5', N'', 4, 1, 50, CAST(0x0000A72200B1B93C AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (41, N'JV00484277', N'1', N'a', 4, 1, 48, CAST(0x0000A72200B554B9 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (42, N'JV00484277', N'1', N'a', 4, 1, 47, CAST(0x0000A72200B554B9 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (43, N'JV00484277', N'1', N'a', 4, 1, 51, CAST(0x0000A72200B554B9 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (44, N'JV00484277', N'1', N'a', 4, 1, 50, CAST(0x0000A72200B554BA AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (45, N'JV00484277', N'1', N'a', 4, 1, 49, CAST(0x0000A72200B554C2 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (46, N'JV00484277', N'1', N'a', 4, 1, 47, CAST(0x0000A72200B587E1 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (47, N'JV00484277', N'1', N'a', 4, 1, 51, CAST(0x0000A72200B587E2 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (48, N'JV00484277', N'1', N'a', 4, 1, 49, CAST(0x0000A72200B587E2 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (49, N'JV00484277', N'1', N'a', 4, 1, 48, CAST(0x0000A72200B587E1 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (50, N'JV00484277', NULL, NULL, 4, 1, NULL, CAST(0x0000A72200B587E7 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (51, N'JV00484277', NULL, NULL, 4, 1, NULL, CAST(0x0000A72200B587E5 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (52, N'JV00484277', N'1', N'a', 4, 1, 50, CAST(0x0000A72200B587E2 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (53, N'JV00484277', NULL, NULL, 4, 1, NULL, CAST(0x0000A72200B587EE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (54, N'JV00484277', NULL, NULL, 4, 1, NULL, CAST(0x0000A72200B587F0 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (55, N'JV00484277', NULL, NULL, 4, 1, NULL, CAST(0x0000A72200B587EE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (56, N'AR00484146', N'4', N'wrg', 4, 1, 49, CAST(0x0000A72200C01D1D AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (57, N'AR00484146', N'5', N'', 4, 1, 50, CAST(0x0000A72200C01D27 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (58, N'AR00484146', N'1', N'wtu', 4, 1, 51, CAST(0x0000A72200C01D1D AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (59, N'AR00484146', N'4', N'wtg', 4, 1, 48, CAST(0x0000A72200C01D1D AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (60, N'AR00484146', N'4', N'ef', 4, 1, 47, CAST(0x0000A72200C01D1D AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (61, N'AR00484146', N'5', N'', 9, 1, 47, CAST(0x0000A72200C0F2D5 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (62, N'AR00484146', N'3', N's', 9, 1, 49, CAST(0x0000A72200C0F2D5 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (63, N'AR00484146', N'2', N's', 9, 1, 51, CAST(0x0000A72200C0F2D5 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (64, N'AR00484146', NULL, NULL, 9, 1, NULL, CAST(0x0000A72200C0F2D5 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (65, N'AR00484146', N'1', N's', 9, 1, 48, CAST(0x0000A72200C0F2D5 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (66, N'AR00484146', N'4', N's', 9, 1, 50, CAST(0x0000A72200C0F2DA AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (67, N'AR00484146', NULL, NULL, 9, 1, NULL, CAST(0x0000A72200C0F2DE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (68, N'AR00484146', NULL, NULL, 9, 1, NULL, CAST(0x0000A72200C0F2DE AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (69, N'AR00484146', NULL, NULL, 9, 1, NULL, CAST(0x0000A72200C0F2DA AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (70, N'AR00484146', NULL, NULL, 9, 1, NULL, CAST(0x0000A72200C0F2E8 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (71, N'aa00484236', N'4', N'a', 4, 1, 47, CAST(0x0000A72200E44C5D AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (72, N'aa00484236', N'5', N'', 4, 1, 48, CAST(0x0000A72200E44C58 AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (73, N'aa00484236', N'5', N'', 4, 1, 49, CAST(0x0000A72200E44C5D AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (74, N'aa00484236', N'1', N'a', 4, 1, 51, CAST(0x0000A72200E44C5D AS DateTime))
GO
INSERT [dbo].[Ratings] ([RatingID], [AssociateID], [Rating], [Remark], [UnitID], [FacilityID], [QuestionID], [RatingDate]) VALUES (75, N'aa00484236', N'2', N'a', 4, 1, 50, CAST(0x0000A72200E44C91 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Suggestions] ON 

GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (1, N'aa', N'JV00484277', 0, CAST(0x0000A7210145D824 AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (2, N'asd', N'JV00484277', 0, CAST(0x0000A72101497287 AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (3, N'zzzzzzzzzzz', N'JV00484277', 0, CAST(0x0000A721014C8C2E AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (4, N'ads', N'JV00484277', 0, CAST(0x0000A721014F3EAE AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (5, N'5', N'JV00484277', 0, CAST(0x0000A721014FB133 AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (6, N'ghj', N'JV00484277', 0, CAST(0x0000A721014FECEB AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (7, N'jh', N'JV00484277', 0, CAST(0x0000A7210150EDC4 AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (8, N'j', N'JV00484277', 0, CAST(0x0000A72101527E6D AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (9, N'kk', N'JV00484277', 0, CAST(0x0000A7210152A15D AS DateTime), N'Unread', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (10, N'Lights problem', N'Admin', 2, CAST(0x0000A722008D6697 AS DateTime), N'Rejected', N'Fixed already', CAST(0x0000A722008E1BF6 AS DateTime))
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (11, N'Water not suffiecient', N'Admin', 4, CAST(0x0000A722008D8413 AS DateTime), N'Taken', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (12, N'not', N'Admin', 4, CAST(0x0000A722008DAA63 AS DateTime), N'Rejected', N'asd', CAST(0x0000A72200E62453 AS DateTime))
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (13, N'not working', N'Admin', 9, CAST(0x0000A722008DC273 AS DateTime), N'Taken', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (14, N'nice', N'DG00485439', 2, CAST(0x0000A722008F8AF3 AS DateTime), N'Taken', NULL, NULL)
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (15, N'this is my suggestio', N'JV00484277', 2, CAST(0x0000A72200B19142 AS DateTime), N'Rejected', N're', CAST(0x0000A72200B252C4 AS DateTime))
GO
INSERT [dbo].[Suggestions] ([SuggestionID], [SuggestionText], [AssociateID], [UnitID], [SuggestionDate], [SuggestionStatus], [RejectionRemarks], [AcknowedgementDate]) VALUES (16, N'jango', N'AR00484146', 2, CAST(0x0000A72200C13314 AS DateTime), N'Taken', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Suggestions] OFF
GO
INSERT [dbo].[SupervisorDetails] ([UserID], [SupervisorLevel]) VALUES (N'a', N'BaseSupervisor')
GO
INSERT [dbo].[SupervisorDetails] ([UserID], [SupervisorLevel]) VALUES (N'Admin', N'Admin')
GO
INSERT [dbo].[SupervisorDetails] ([UserID], [SupervisorLevel]) VALUES (N'AK00483849', N'BaseSupervisor')
GO
INSERT [dbo].[SupervisorDetails] ([UserID], [SupervisorLevel]) VALUES (N'DG00485439', N'BaseSupervisor')
GO
INSERT [dbo].[SupervisorDetails] ([UserID], [SupervisorLevel]) VALUES (N'ET00485457', N'BaseSupervisor')
GO
INSERT [dbo].[SupervisorDetails] ([UserID], [SupervisorLevel]) VALUES (N'JV00484277', N'BaseSupervisor')
GO
INSERT [dbo].[SupervisorDetails] ([UserID], [SupervisorLevel]) VALUES (N'VE00484120', N'BaseSupervisor')
GO
SET IDENTITY_INSERT [dbo].[Units] ON 

GO
INSERT [dbo].[Units] ([UnitID], [UnitName], [Wing], [FacilityID], [BuildingID], [FloorID], [LocationID], [BaseSupervisorID]) VALUES (2, N'Lab 4', N'A', 1, 9, 2, 3, N'DG00485439')
GO
INSERT [dbo].[Units] ([UnitID], [UnitName], [Wing], [FacilityID], [BuildingID], [FloorID], [LocationID], [BaseSupervisorID]) VALUES (4, N'Washroom', N'A', 1, 9, 2, 3, N'DG00485439')
GO
INSERT [dbo].[Units] ([UnitID], [UnitName], [Wing], [FacilityID], [BuildingID], [FloorID], [LocationID], [BaseSupervisorID]) VALUES (9, N'Coffee Machine', N'A', 1, 9, 2, 3, N'DG00485439')
GO
INSERT [dbo].[Units] ([UnitID], [UnitName], [Wing], [FacilityID], [BuildingID], [FloorID], [LocationID], [BaseSupervisorID]) VALUES (10, N'Lab 3', N'A', 1, 9, 2, 3, N'DG00485439')
GO
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'a', N'add', N'1234567890', N'BaseSupervisor')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'AA00484236', N'Asha Anna Antony', N'9562236402', N'Associate')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'Admin', N'Admin', N'9876543210', N'Admin')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'AK00483849', N'Abishek Kumar', N'7896541230', N'BaseSupervisor')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'AR00484146', N'Abilasha R', N'8056057412', N'Associate')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'DG00484275', N'ab', N'1234567890', N'Associate')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'DG00485439', N'Deeksha CG', N'9611493665', N'BaseSupervisor')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'ET00485457', N'Elizabeth Thomas', N'9986117139', N'BaseSupervisor')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'JV00484277', N'Josep V J', N'8891607826', N'BaseSupervisor')
GO
INSERT [dbo].[Users] ([UserID], [UserName], [UserPhoneNo], [UserRole]) VALUES (N'VE00484120', N'Vetrivel E', N'7402128074', N'BaseSupervisor')
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_UserRole]  DEFAULT ('Associate') FOR [UserRole]
GO
ALTER TABLE [dbo].[BaseSupervisors]  WITH CHECK ADD  CONSTRAINT [BaseSupervisors_fk0] FOREIGN KEY([UserID])
REFERENCES [dbo].[SupervisorDetails] ([UserID])
GO
ALTER TABLE [dbo].[BaseSupervisors] CHECK CONSTRAINT [BaseSupervisors_fk0]
GO
ALTER TABLE [dbo].[BaseSupervisors]  WITH CHECK ADD  CONSTRAINT [BaseSupervisors_fk1] FOREIGN KEY([FloorID])
REFERENCES [dbo].[Floors] ([FloorID])
GO
ALTER TABLE [dbo].[BaseSupervisors] CHECK CONSTRAINT [BaseSupervisors_fk1]
GO
ALTER TABLE [dbo].[Buildings]  WITH CHECK ADD  CONSTRAINT [bb00] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Buildings] CHECK CONSTRAINT [bb00]
GO
ALTER TABLE [dbo].[Floors]  WITH CHECK ADD  CONSTRAINT [thgf] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([BuildingID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Floors] CHECK CONSTRAINT [thgf]
GO
ALTER TABLE [dbo].[Floors]  WITH CHECK ADD  CONSTRAINT [thggf] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([BuildingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Floors] CHECK CONSTRAINT [thggf]
GO
ALTER TABLE [dbo].[Floors]  WITH CHECK ADD  CONSTRAINT [thghhgf] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Floors] CHECK CONSTRAINT [thghhgf]
GO
ALTER TABLE [dbo].[Floors]  WITH CHECK ADD  CONSTRAINT [thghhhhgf] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Floors] CHECK CONSTRAINT [thghhhhgf]
GO
ALTER TABLE [dbo].[Level1Supervisors]  WITH CHECK ADD  CONSTRAINT [Level1Supervisors_fk0] FOREIGN KEY([UserID])
REFERENCES [dbo].[SupervisorDetails] ([UserID])
GO
ALTER TABLE [dbo].[Level1Supervisors] CHECK CONSTRAINT [Level1Supervisors_fk0]
GO
ALTER TABLE [dbo].[Level1Supervisors]  WITH CHECK ADD  CONSTRAINT [Level1Supervisors_fk1] FOREIGN KEY([BulidingID])
REFERENCES [dbo].[Buildings] ([BuildingID])
GO
ALTER TABLE [dbo].[Level1Supervisors] CHECK CONSTRAINT [Level1Supervisors_fk1]
GO
ALTER TABLE [dbo].[Level2Supervisors]  WITH CHECK ADD  CONSTRAINT [Level2Supervisors_fk0] FOREIGN KEY([UserID])
REFERENCES [dbo].[SupervisorDetails] ([UserID])
GO
ALTER TABLE [dbo].[Level2Supervisors] CHECK CONSTRAINT [Level2Supervisors_fk0]
GO
ALTER TABLE [dbo].[Level2Supervisors]  WITH CHECK ADD  CONSTRAINT [Level2Supervisors_fk1] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
GO
ALTER TABLE [dbo].[Level2Supervisors] CHECK CONSTRAINT [Level2Supervisors_fk1]
GO
ALTER TABLE [dbo].[Level3Supervisors]  WITH CHECK ADD  CONSTRAINT [Level3Supervisors_fk0] FOREIGN KEY([UserID])
REFERENCES [dbo].[SupervisorDetails] ([UserID])
GO
ALTER TABLE [dbo].[Level3Supervisors] CHECK CONSTRAINT [Level3Supervisors_fk0]
GO
ALTER TABLE [dbo].[Level3Supervisors]  WITH CHECK ADD  CONSTRAINT [Level3Supervisors_fk1] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Level3Supervisors] CHECK CONSTRAINT [Level3Supervisors_fk1]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [Questions_fk0] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [Questions_fk0]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [Ratings_fk0] FOREIGN KEY([AssociateID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [Ratings_fk0]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [Ratings_fk1] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([UnitID])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [Ratings_fk1]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [Ratings_fk2] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [Ratings_fk2]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [Ratings_fk3] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [Ratings_fk3]
GO
ALTER TABLE [dbo].[SupervisorDetails]  WITH CHECK ADD  CONSTRAINT [SupervisorDetails_fk0] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[SupervisorDetails] CHECK CONSTRAINT [SupervisorDetails_fk0]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [bbhu00] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [bbhu00]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [bbhujj00] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [bbhujj00]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [Units_fk1] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Buildings] ([BuildingID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [Units_fk1]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [Units_fk2] FOREIGN KEY([FloorID])
REFERENCES [dbo].[Floors] ([FloorID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [Units_fk2]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [Units_fk3] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [Units_fk3]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [Units_fk4] FOREIGN KEY([BaseSupervisorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [Units_fk4]
GO
ALTER TABLE [dbo].[Units]  WITH CHECK ADD  CONSTRAINT [Units_fk5] FOREIGN KEY([FloorID])
REFERENCES [dbo].[Floors] ([FloorID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Units] CHECK CONSTRAINT [Units_fk5]
GO
USE [master]
GO
ALTER DATABASE [FeedbackFacility] SET  READ_WRITE 
GO

/****** Object:  StoredProcedure [dbo].[ProcCheckUser]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ProcCheckUser]
@uid varchar(11)
as
select * from Users where UserID=@uid

GO
/****** Object:  StoredProcedure [dbo].[ProcDisplayQus]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcDisplayQus]
@fid int
as
select Question1,QuestionID from Questions where FacilityID=@fid
GO
/****** Object:  StoredProcedure [dbo].[ProcDisplaySugDetails]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProcDisplaySugDetails]
@SugID int
as
select UserName,UnitName,SuggestionID,FloorName,BuildingName,FacilityName,LocationName,SuggestionText,SuggestionDate, Wing, SuggestionStatus, RejectionRemarks
from Suggestions s, Units u, Users,Buildings b,Facilities fac, Floors f, Locations l
where s.SuggestionID=@SugID and s.UnitID=u.UnitID and s.AssociateID=Users.UserID and u.BuildingID=b.BuildingID
and f.FloorID=u.FloorID and l.LocationID=u.LocationID and fac.FacilityID=u.FacilityID

GO
/****** Object:  StoredProcedure [dbo].[ProcDisplaySugSupervisor]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcDisplaySugSupervisor]
@uid varchar(11)
as
select AssociateID 'AssociateID',UnitName 'Unit Name',SuggestionDate 'Suggestion Date',SuggestionStatus 'Status of Suggestion',SuggestionID 'Suggestion ID'
from Units u join Suggestions s 
on u.UnitID=s.UnitID and u.BaseSupervisorID=@uid

GO
/****** Object:  StoredProcedure [dbo].[ProcInsertSuggestion]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProcInsertSuggestion]
@sText varchar(1000),
@aid varchar(11),
@uid int
as
insert into Suggestions(SuggestionText,AssociateID,UnitID,SuggestionDate)
Values(@sText,@aid,@uid,GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[ProcInsertUserDetails]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProcInsertUserDetails]
@uid varchar(11),
@uName varchar(20),
@uPhoneNumber varchar(13)
as
insert into Users(UserID,UserName,UserPhoneNo) values(@uid,@uName,@uPhoneNumber)

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectBuliding]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectBuliding]
@lID int
as
select BuildingName, BuildingID from Buildings b where b.LocationID=@lID

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectCity]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectCity]
as
select LocationCity from Locations

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectFacility]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectFacility]
as
select FacilityName,FacilityID from Facilities

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectFloor]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectFloor]
@bID int
as
select FloorID, FloorName from Floors f where f.BuildingID=@bID

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectLocation]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProcSelectLocation]
as
select LocationName,LocationID from Locations

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectUnit]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectUnit]
@fID int,
@Wing varchar(20)
as
select UnitName,UnitID from Units u where
u.FloorID=@fID and u.Wing=@Wing

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectWing]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectWing]
@fID int
as
select Wings from  Floors f where f.FloorID=@fID 

GO
/****** Object:  StoredProcedure [dbo].[ProcUpdateSugRead]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcUpdateSugRead]
@uid int
as
update Suggestions set SuggestionStatus='Read' where SuggestionID=@uid and SuggestionStatus='Unread'

GO
/****** Object:  StoredProcedure [dbo].[ProcUpdateSugRejected]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcUpdateSugRejected]
@uid int,
@remark varchar(100)
as
update Suggestions set SuggestionStatus='Rejected', RejectionRemarks=@remark, AcknowedgementDate=GETDATE()
where SuggestionID=@uid

GO
/****** Object:  StoredProcedure [dbo].[ProcUpdateSugTaken]    Script Date: 2/22/2017 3:55:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcUpdateSugTaken]
@uid int
as
update Suggestions set SuggestionStatus='Taken' where SuggestionID=@uid

GO