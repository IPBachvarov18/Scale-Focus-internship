USE [master]
GO
/****** Object:  Database [Project Managment]    Script Date: 7/13/2021 10:44:35 AM ******/
CREATE DATABASE [Project Managment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project Managment', FILENAME = N'C:\Users\IPBachvarov18\Project Managment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project Managment_log', FILENAME = N'C:\Users\IPBachvarov18\Project Managment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project Managment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project Managment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project Managment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project Managment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project Managment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project Managment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project Managment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project Managment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project Managment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project Managment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project Managment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project Managment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project Managment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project Managment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project Managment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project Managment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project Managment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project Managment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project Managment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project Managment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project Managment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project Managment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project Managment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project Managment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project Managment] SET  MULTI_USER 
GO
ALTER DATABASE [Project Managment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project Managment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project Managment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project Managment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project Managment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Project Managment]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[OwnerId] [int] NOT NULL,
	[TasksID] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTeams]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTeams](
	[TeamId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[ProjectID] [int] NULL,
	[Assignee] [int] NOT NULL,
	[LastModifyedAt] [datetimeoffset](7) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Members] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamUsers]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamUsers](
	[UserId] [int] NOT NULL,
	[TeamId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nchar](10) NULL,
	[First_name] [nvarchar](50) NOT NULL,
	[Last_name] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedById] [int] NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedById] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Work log]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Work log](
	[UserId] [int] NOT NULL,
	[timeSpent] [datetime] NOT NULL,
	[date] [date] NOT NULL,
	[TaskIdWorkOn] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Team] ON 
GO
INSERT [dbo].[Team] ([Id], [Name], [Members]) VALUES (1, N'dasda', 1)
GO
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [First_name], [Last_name], [IsAdmin], [CreatedOn], [CreatedById], [UpdatedOn], [UpdatedById]) VALUES (1, N'u1', N'p1        ', N'ff1', N'll1', 0, CAST(N'2021-07-12T00:00:00.000' AS DateTime), NULL, CAST(N'2021-07-13T10:42:12.103' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_LastModifyedAt]  DEFAULT (getdate()) FOR [LastModifyedAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Tasks] FOREIGN KEY([TasksID])
REFERENCES [dbo].[Tasks] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Tasks]
GO
ALTER TABLE [dbo].[ProjectTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTeams_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectTeams] CHECK CONSTRAINT [FK_ProjectTeams_Project]
GO
ALTER TABLE [dbo].[ProjectTeams]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTeams_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[ProjectTeams] CHECK CONSTRAINT [FK_ProjectTeams_Team]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Project]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_User] FOREIGN KEY([Assignee])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_User]
GO
ALTER TABLE [dbo].[TeamUsers]  WITH CHECK ADD  CONSTRAINT [FK_TeamUsers_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TeamUsers] CHECK CONSTRAINT [FK_TeamUsers_Team]
GO
ALTER TABLE [dbo].[TeamUsers]  WITH CHECK ADD  CONSTRAINT [FK_TeamUsers_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TeamUsers] CHECK CONSTRAINT [FK_TeamUsers_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([UpdatedById])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User1] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User1]
GO
ALTER TABLE [dbo].[Work log]  WITH CHECK ADD  CONSTRAINT [FK_Work log_Tasks] FOREIGN KEY([TaskIdWorkOn])
REFERENCES [dbo].[Tasks] ([Id])
GO
ALTER TABLE [dbo].[Work log] CHECK CONSTRAINT [FK_Work log_Tasks]
GO
/****** Object:  StoredProcedure [dbo].[AssignTeamToProjectUser]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AssignTeamToProjectUser]
@teamId int,
@projectId int,
@createdById int
AS

IF EXISTS(SELECT Id FROM Project WHERE  Project.OwnerId = @createdById)
BEGIN
INSERT INTO ProjectTeams(TeamId,ProjectId)
VALUES(@teamId,@projectId)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateProject]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CreateProject]
@title nvarchar(50),
@description nvarchar(250),
@idOfCretor int ,
@idOfLastChange int 

AS 
INSERT INTO  Project([Name] ,[Description],OwnerId)
VALUES(@title,@description,@idOfCretor )
GO
/****** Object:  StoredProcedure [dbo].[deleteProjectById]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[deleteProjectById]
@projectId int,
@createdById int

AS
IF EXISTS(SELECT Id FROM Project WHERE Project.Id = @projectId AND Project.OwnerId = @createdById)
BEGIN
DELETE FROM Project WHERE @projectId=Project.Id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTeamById]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteTeamById]

@teamId int
AS
DELETE FROM Team
WHERE @teamId = Team.Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserById]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteUserById]

@userId int
AS
DELETE FROM [User]
WHERE @userId = [User].Id
GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[EditUser]
@UserId int,
@firstName nvarchar(50),
@lastName nvarchar(50),
@isAdmin bit,
@updatedById int
AS 
UPDATE   [User] SET 
First_name=@firstName,
Last_name=@lastName,
IsAdmin=@isAdmin,
UpdatedById=@updatedById,
UpdatedOn=GETDATE()

WHERE @UserId =[User].Id
GO
/****** Object:  StoredProcedure [dbo].[RegisterTeam]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterTeam]
@title nvarchar(50),
@idOfCretor int ,
@idOfLastChange int 

AS 
INSERT INTO  Team([Name] ,
Members)VALUES(@title,
@idOfCretor 
)
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterUser]
@username nvarchar(50),
@passowrd nvarchar(50),
@firstName nvarchar(50),
@lastName nvarchar(50),
@idOfCretor int,
@idOfLastChange int

AS 
INSERT INTO  [User] (Username,
[Password],
First_name,
Last_name,
IsAdmin)VALUES(@username ,
@passowrd ,
@firstName ,
@lastName ,
0
)
GO
/****** Object:  StoredProcedure [dbo].[RegisterUserInTeam]    Script Date: 7/13/2021 10:44:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RegisterUserInTeam]
@teamId int,
@userId int
AS
INSERT INTO TeamUsers(TeamId,UserId)
VALUES(@teamId,@userId)
GO
USE [master]
GO
ALTER DATABASE [Project Managment] SET  READ_WRITE 
GO
