USE [master]
GO
/****** Object:  Database [FeedbackFacility]    Script Date: 2/22/2017 4:00:08 PM ******/
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

/****** Object:  Table [dbo].[Buildings]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Facilities]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Floors]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Level1Supervisors]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Level2Supervisors]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Level3Supervisors]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Ratings]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Suggestions]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[SupervisorDetails]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Units]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2/22/2017 4:00:08 PM ******/
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


/****** Object:  StoredProcedure [dbo].[ProcCheckUser]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ProcCheckUser]
@uid varchar(11)
as
select * from Users where UserID=@uid

GO
/****** Object:  StoredProcedure [dbo].[ProcDisplayQus]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcDisplayQus]
@fid int
as
select Question1,QuestionID from Questions where FacilityID=@fid
GO
/****** Object:  StoredProcedure [dbo].[ProcDisplaySugDetails]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProcDisplaySugSupervisor]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProcInsertSuggestion]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProcInsertUserDetails]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProcSelectBuliding]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectBuliding]
@lID int
as
select BuildingName, BuildingID from Buildings b where b.LocationID=@lID

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectCity]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectCity]
as
select LocationCity from Locations

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectFacility]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectFacility]
as
select FacilityName,FacilityID from Facilities

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectFloor]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectFloor]
@bID int
as
select FloorID, FloorName from Floors f where f.BuildingID=@bID

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectLocation]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProcSelectLocation]
as
select LocationName,LocationID from Locations

GO
/****** Object:  StoredProcedure [dbo].[ProcSelectUnit]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProcSelectWing]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcSelectWing]
@fID int
as
select Wings from  Floors f where f.FloorID=@fID 

GO
/****** Object:  StoredProcedure [dbo].[ProcUpdateSugRead]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcUpdateSugRead]
@uid int
as
update Suggestions set SuggestionStatus='Read' where SuggestionID=@uid and SuggestionStatus='Unread'

GO
/****** Object:  StoredProcedure [dbo].[ProcUpdateSugRejected]    Script Date: 2/22/2017 4:00:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProcUpdateSugTaken]    Script Date: 2/22/2017 4:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ProcUpdateSugTaken]
@uid int
as
update Suggestions set SuggestionStatus='Taken' where SuggestionID=@uid

GO
/****** Object:  Table [dbo].[BaseSupervisors]    Script Date: 2/22/2017 4:00:08 PM ******/
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