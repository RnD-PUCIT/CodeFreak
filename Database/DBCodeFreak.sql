USE [master]
GO
/****** Object:  Database [DBCodeFreak]    Script Date: 5/11/2019 12:12:41 PM ******/
CREATE DATABASE [DBCodeFreak]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCodeFreak', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DBCodeFreak.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBCodeFreak_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DBCodeFreak_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBCodeFreak] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCodeFreak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCodeFreak] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCodeFreak] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCodeFreak] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCodeFreak] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCodeFreak] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCodeFreak] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBCodeFreak] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBCodeFreak] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCodeFreak] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCodeFreak] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCodeFreak] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCodeFreak] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCodeFreak] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCodeFreak] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCodeFreak] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCodeFreak] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBCodeFreak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCodeFreak] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCodeFreak] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCodeFreak] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCodeFreak] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCodeFreak] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCodeFreak] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCodeFreak] SET RECOVERY FULL 
GO
ALTER DATABASE [DBCodeFreak] SET  MULTI_USER 
GO
ALTER DATABASE [DBCodeFreak] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCodeFreak] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCodeFreak] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCodeFreak] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBCodeFreak', N'ON'
GO
USE [DBCodeFreak]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ProblemId] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) NULL,
	[CommentDateTime] [datetime] NOT NULL,
	[IsReply] [bit] NOT NULL,
	[ReplyId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Connection]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Connection](
	[ConnectionID] [varchar](100) NOT NULL,
	[Connected] [bit] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConnectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Difficulty]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Difficulty](
	[DifficultyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Difficulty] PRIMARY KEY CLUSTERED 
(
	[DifficultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[EditorialId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[ProblemId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Editorial] PRIMARY KEY CLUSTERED 
(
	[EditorialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NOT NULL,
	[ApplyingLastDate] [date] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventProblems]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventProblems](
	[EventProblemId] [uniqueidentifier] NOT NULL,
	[EventId] [int] NOT NULL,
	[ProblemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EventProblems] PRIMARY KEY CLUSTERED 
(
	[EventProblemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventUserRoles]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventUserRoles](
	[EventUserRoleId] [uniqueidentifier] NOT NULL,
	[EventUserId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_EventUserRoles] PRIMARY KEY CLUSTERED 
(
	[EventUserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventUsers]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventUsers](
	[EventUserId] [uniqueidentifier] NOT NULL,
	[EventId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EventUsers] PRIMARY KEY CLUSTERED 
(
	[EventUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[FileId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[Size] [int] NULL,
	[Extention] [nvarchar](50) NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[LoginHistoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[LoginID] [varchar](50) NOT NULL,
	[MachineIP] [varchar](20) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[LoginHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [uniqueidentifier] NOT NULL,
	[MessageText] [varchar](500) NULL,
	[SenderId] [uniqueidentifier] NULL,
	[RecieverId] [uniqueidentifier] NULL,
	[DateOfText] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Modifiedby] [uniqueidentifier] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PermissionsMapping]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionsMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_PermissionsMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Problem]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problem](
	[ProblemId] [uniqueidentifier] NOT NULL,
	[AuthorId] [uniqueidentifier] NOT NULL,
	[ProblemTypeId] [int] NOT NULL,
	[DifficultyId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MaxScore] [int] NULL,
	[NoOfSubmission] [int] NOT NULL,
	[PostDateTime] [datetime] NULL,
	[NoOfTestCaseFiles] [int] NULL,
	[Title] [nvarchar](max) NOT NULL,
	[IsPublic] [bit] NOT NULL,
 CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
(
	[ProblemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProblemTestCase]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemTestCase](
	[ProblemTestCaseId] [uniqueidentifier] NOT NULL,
	[ProblemId] [uniqueidentifier] NOT NULL,
	[InputFilePath] [nvarchar](max) NOT NULL,
	[OutputFilePath] [nvarchar](max) NOT NULL,
	[SizeInputFile] [int] NULL,
	[SizeOutputFile] [int] NULL,
 CONSTRAINT [PK_ProblemTestCase] PRIMARY KEY CLUSTERED 
(
	[ProblemTestCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProblemType]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemType](
	[ProblemTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProblemType] PRIMARY KEY CLUSTERED 
(
	[ProblemTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgrammingLanguage]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrammingLanguage](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProgrammingLanguage] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ProblemId] [uniqueidentifier] NOT NULL,
	[Rate] [int] NOT NULL,
	[TotalRate] [int] NOT NULL,
	[RateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Submission]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Submission](
	[SubmissionId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ProblemId] [uniqueidentifier] NOT NULL,
	[Score] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[SubmissionDateTime] [datetime] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[EventId] [int] NULL,
 CONSTRAINT [PK_Submission] PRIMARY KEY CLUSTERED 
(
	[SubmissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubmissionProblemTestCase]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmissionProblemTestCase](
	[SubmissionProblemTestCaseId] [uniqueidentifier] NOT NULL,
	[SubmissionId] [uniqueidentifier] NOT NULL,
	[ProblemTestCaseId] [uniqueidentifier] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[UserOutputFilePath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SubmissionProblemTestCase] PRIMARY KEY CLUSTERED 
(
	[SubmissionProblemTestCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/11/2019 12:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifieBy] [uniqueidentifier] NULL,
	[DateOfBirth] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'-EVQ7_bvkFofjcZEv-XhVg', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'_-thHmEFVjxLXvjr4ZCgcw', 1, N'5df02e31-74bc-499c-9208-e4b9211fbf95')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'0f6J89y6WY5fzh9zLqAD6A', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'15jK5CdALM_BXXzqwBxA6w', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'5oejbUnjt6BG2HsOYhj2WA', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'6lhTTXWn3Ot-VtgUtN5Vtw', 1, N'5df02e31-74bc-499c-9208-e4b9211fbf95')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'9fmSQN9s8vglIRiAjJgNyA', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'acHBCcJKrx7YTOmtNoiDYA', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'NHXi_Buxp_p_xCvntEB8_g', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'o9YP7sJgCz_sDsApUmE1cQ', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'rnLIe7V1tFX-fDHNB3CPSQ', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'ryqAnkf0AvCn8IxoafRl0A', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'up9qdKFB4OQ5VW0q4mEtHg', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'XuKtgM9UKpVLcGEaukUhew', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Connection] ([ConnectionID], [Connected], [UserId]) VALUES (N'ZS1d26b0EmgzNJ5KYR92Og', 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
SET IDENTITY_INSERT [dbo].[Difficulty] ON 

INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (1, N'Easy', N'Every one can solve it also.')
INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (2, N'Medium', N'Medium')
INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (3, N'Hard', N'Hard')
INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (4, N'Extraorddinary Hard', N'Very Difficult')
SET IDENTITY_INSERT [dbo].[Difficulty] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (5, N'Testing 1', N'<p>test1</p>', CAST(0x0000AA3300737058 AS DateTime), CAST(0x0000AA3300A4E9F8 AS DateTime), CAST(0x8D3F0B00 AS Date), CAST(0x0000AA3100DF13E8 AS DateTime), N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (6, N'testing event', N'<p>test</p>', CAST(0x0000AA3F007366F8 AS DateTime), CAST(0x0000AA3F00A4E9F8 AS DateTime), CAST(0x993F0B00 AS Date), CAST(0x0000AA3C016D47B1 AS DateTime), N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (7, N'last test', N'<p>testing</p>', CAST(0x0000AA4400B57AFC AS DateTime), CAST(0x0000AA4401182C9C AS DateTime), CAST(0x9F3F0B00 AS Date), CAST(0x0000AA4401005854 AS DateTime), N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (8, N'Our first event', N'<p>description about event</p>', CAST(0x0000AA4900736CD4 AS DateTime), CAST(0x0000AA4900A4E548 AS DateTime), CAST(0xA33F0B00 AS Date), CAST(0x0000AA4500C49FB8 AS DateTime), N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (9, N'right now start', N'<p>description</p>', CAST(0x0000AA450074D6F0 AS DateTime), CAST(0x0000AA4500A4FCB8 AS DateTime), CAST(0xA03F0B00 AS Date), CAST(0x0000AA4500C6FC91 AS DateTime), N'1d5e37a3-709b-437a-9778-753c0b433b3c', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (10, N'video event', N'<p><strong>Description</strong></p><p>this is my first event. any one can join this event</p>', CAST(0x0000AA4B00736A7C AS DateTime), CAST(0x0000AA4B00A4F5B0 AS DateTime), CAST(0xA43F0B00 AS Date), CAST(0x0000AA48012A76A2 AS DateTime), N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (11, N'AIMRL Lab', N'<p>AimRl event.</p>', CAST(0x0000AA4800E14C2C AS DateTime), CAST(0x0000AA480137DD80 AS DateTime), CAST(0xA33F0B00 AS Date), CAST(0x0000AA4801334BA0 AS DateTime), N'1d5e37a3-709b-437a-9778-753c0b433b3c', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (12, N'Aimrl lab live event', N'<p>Description...</p>', CAST(0x0000AA4A00736A7C AS DateTime), CAST(0x0000AA4A00A4EC50 AS DateTime), CAST(0xA43F0B00 AS Date), CAST(0x0000AA48016D84DC AS DateTime), N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (13, N'designing', N'<p><input name="name" placeholder="Enter Event Name" required="" value=""><label for="name">Enter Event Name&nbsp;*</label></p><p><img height="100px" width="100px" src="blob:https://localhost:44387/ec8e6232-12a4-4797-9c0b-cc1967a0147a" class="fr-fic fr-dii"><img height="100px" width="100px" src="blob:https://localhost:44387/514685c3-0047-4131-8d61-06915342985a" class="fr-fic fr-dii"><img height="100px" width="100px" src="blob:https://localhost:44387/e70231d1-1f68-4c7c-988c-00ac6b82def3" class="fr-fic fr-dii"><img height="100px" width="100px" src="blob:https://localhost:44387/75950547-4aa0-4140-8d34-9f271c939583" class="fr-fic fr-dii"><img height="100px" width="100px" src="blob:https://localhost:44387/ae4e08f7-147d-43fd-8421-e1d8810edd00" class="fr-fic fr-dii"></p><h1>Create Event</h1>', CAST(0x0000AA4A0056C610 AS DateTime), CAST(0x0000AA4C00720060 AS DateTime), CAST(0xA43F0B00 AS Date), CAST(0x0000AA48017F805D AS DateTime), N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1)
INSERT [dbo].[Event] ([EventId], [Name], [Description], [StartDateTime], [EndDateTime], [ApplyingLastDate], [CreatedOn], [CreatedBy], [IsActive]) VALUES (14, N'Arslan''s first event', N'<p>this is one day competition. you have to solve all problems.</p>', CAST(0x0000AA4E0149A894 AS DateTime), CAST(0x0000AA4F0138AE18 AS DateTime), CAST(0xA93F0B00 AS Date), CAST(0x0000AA4A00C7F206 AS DateTime), N'5df02e31-74bc-499c-9208-e4b9211fbf95', 1)
SET IDENTITY_INSERT [dbo].[Event] OFF
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'de1c9a7b-5061-4d50-97a0-0b4bdbf31588', 12, N'e14e23c2-7378-4a39-a86e-6c4b30f54373')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'cdc46a99-2eb2-4864-9cc5-21a555e8f98b', 11, N'0e984725-c51c-4bf4-9960-e1c80e27aba1')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'4a2b8a53-2547-4dc2-b564-2d6037600da4', 11, N'457d0878-d93b-4e50-a366-732d2357e9e8')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'01ed6581-f58e-4659-9162-2e9bfb981b8d', 11, N'c10d98be-e6bb-41f9-a917-59b36febe3cc')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'd5268786-0991-48f4-a1dc-321d53090101', 12, N'c10d98be-e6bb-41f9-a917-59b36febe3cc')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'9f38d370-fffa-4afe-a662-3d3a9fd66c8c', 12, N'457d0878-d93b-4e50-a366-732d2357e9e8')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'9b222b27-b069-44e1-8238-9cebad3938fa', 9, N'359084c5-4752-42e3-b136-c458d40606f8')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'69cae48b-3790-413a-ba5a-9f347972ba4a', 8, N'0e984725-c51c-4bf4-9960-e1c80e27aba1')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'2cff2a2b-945e-47d0-b364-ad5861f30324', 7, N'0e984725-c51c-4bf4-9960-e1c80e27aba1')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'501b3aa8-02cc-4e49-986f-bc944a184547', 10, N'457d0878-d93b-4e50-a366-732d2357e9e8')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'a64b9bbb-4a62-4d51-b5c6-c2829706408d', 5, N'0e984725-c51c-4bf4-9960-e1c80e27aba1')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'2a83f5b2-2e50-40cc-baac-de937a7052f9', 9, N'0e984725-c51c-4bf4-9960-e1c80e27aba1')
INSERT [dbo].[EventProblems] ([EventProblemId], [EventId], [ProblemId]) VALUES (N'7bfecccd-53c0-4c5b-b8b8-edf8e9cd5544', 10, N'e14e23c2-7378-4a39-a86e-6c4b30f54373')
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'a30d2e12-b56f-41d6-ba3e-1b955386734a', N'1a1e6378-7d6f-4eda-a35a-317cd53e7935', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'7824428d-3f27-48a0-a214-22867ea8152b', N'60e60a76-05f9-4847-9198-1bc6446003a2', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'e0ee30fe-86cb-48f9-bc81-2b988b908122', N'5b8122c7-ada8-4253-859a-867bad92a9c8', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'7f5579d0-8b29-4d2e-9917-3070c0224e32', N'2cde76ed-91cd-4b11-84a5-875ef0c053cc', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'8776cbe6-781e-4a31-8876-3bce49f8b25c', N'fc8f8406-19fa-41a0-9080-580f7a6759dd', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'ebc57dc7-dfa8-4dc4-92b0-3ff89c5f2cef', N'6bf96864-8c88-4665-b702-2371867db6a7', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'20db5454-92f9-4ab2-9075-5438f916e280', N'0c0b0755-623f-4bd8-ae7a-aad6d4b92ec6', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'9df925cd-0e62-4fb9-8a4c-58b85f462be4', N'0b257e18-0025-40ce-ac32-ee9cd119605b', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'c4227c19-2dbc-4542-84f6-593ed5079121', N'dbb04106-3fd0-4c99-a51f-7fc8ea2507d3', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'40235ba2-55d3-4102-8abb-6a04a8b9d934', N'a332fbab-33de-4cc9-b890-b1f3f213846d', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'a062ca65-fe18-4faf-bbce-7a0dca945845', N'49da71e5-bf50-4387-b986-c2efb79ef348', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'178dfb61-0c1b-49c5-8bd9-830d4bb76848', N'd66cb3ad-8603-489a-952d-fd8c693806bc', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'a8b18703-0c43-4088-88cd-9a6cba6ade7c', N'878dd4d2-7ddb-49c1-9b4c-8f1f274995ce', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'8d643703-3e4f-47ff-9af4-bc2912090762', N'a9996b51-e2f7-4750-8ba0-ae8a549499ef', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'647ad633-484b-4f38-84c7-be7ff700223d', N'2350ec02-3479-4fec-8d10-ece5fbad8a82', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'668452ae-d2c6-437c-bcc8-c8d9b8f42d46', N'39125dba-9918-4492-88e1-b98cc4549041', 6)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'18947d0d-2faf-4b6e-8de6-ce1ab9441ef9', N'591d96a9-808a-4bcb-a48d-7b277939e728', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'92b0b16f-f93f-426d-8ba6-cfe74a3b840e', N'c985ccbc-db0b-4121-92c8-df7f9af57287', 5)
INSERT [dbo].[EventUserRoles] ([EventUserRoleId], [EventUserId], [RoleId]) VALUES (N'e52e8d98-9f08-4a83-9877-f59b67ddc307', N'2ac4aab4-4353-49b7-8e5b-909d86742eb3', 5)
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'60e60a76-05f9-4847-9198-1bc6446003a2', 12, N'0e984725-c51c-4bf4-9960-e1c80e27aba0')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'6bf96864-8c88-4665-b702-2371867db6a7', 11, N'1d5e37a3-709b-437a-9778-753c0b433b3c')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'1a1e6378-7d6f-4eda-a35a-317cd53e7935', 10, N'0e984725-c51c-4bf4-9960-e1c80e27aba0')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'fc8f8406-19fa-41a0-9080-580f7a6759dd', 7, N'1d5e37a3-709b-437a-9778-753c0b433b3c')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'591d96a9-808a-4bcb-a48d-7b277939e728', 9, N'1d5e37a3-709b-437a-9778-753c0b433b3c')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'dbb04106-3fd0-4c99-a51f-7fc8ea2507d3', 10, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'5b8122c7-ada8-4253-859a-867bad92a9c8', 13, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'2cde76ed-91cd-4b11-84a5-875ef0c053cc', 8, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'878dd4d2-7ddb-49c1-9b4c-8f1f274995ce', 14, N'1d5e37a3-709b-437a-9778-753c0b433b3c')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'2ac4aab4-4353-49b7-8e5b-909d86742eb3', 14, N'5df02e31-74bc-499c-9208-e4b9211fbf95')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'0c0b0755-623f-4bd8-ae7a-aad6d4b92ec6', 11, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'a9996b51-e2f7-4750-8ba0-ae8a549499ef', 6, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'a332fbab-33de-4cc9-b890-b1f3f213846d', 8, N'1d5e37a3-709b-437a-9778-753c0b433b3c')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'39125dba-9918-4492-88e1-b98cc4549041', 12, N'1d5e37a3-709b-437a-9778-753c0b433b3c')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'49da71e5-bf50-4387-b986-c2efb79ef348', 6, N'1d5e37a3-709b-437a-9778-753c0b433b3c')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'c985ccbc-db0b-4121-92c8-df7f9af57287', 12, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'2350ec02-3479-4fec-8d10-ece5fbad8a82', 5, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'0b257e18-0025-40ce-ac32-ee9cd119605b', 7, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[EventUsers] ([EventUserId], [EventId], [UserId]) VALUES (N'd66cb3ad-8603-489a-952d-fd8c693806bc', 9, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1')
INSERT [dbo].[Files] ([FileId], [UserId], [FilePath], [Size], [Extention]) VALUES (N'611010c0-c518-4b20-8ca1-7183a325ad56', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'7cf27cf3-279b-4419-881c-bba517b32329.jpg', NULL, N'.jpg')
INSERT [dbo].[Files] ([FileId], [UserId], [FilePath], [Size], [Extention]) VALUES (N'cad48ebf-80fb-4081-ba45-d923eead4984', N'5df02e31-74bc-499c-9208-e4b9211fbf95', N'e2cad1b5-e3ba-4923-b9bb-6b034234e007.jpg', NULL, N'.jpg')
INSERT [dbo].[Messages] ([Id], [MessageText], [SenderId], [RecieverId], [DateOfText]) VALUES (N'efa43ba7-6e32-46d8-9a93-059b5ea78321', N'hi', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'1d5e37a3-709b-437a-9778-753c0b433b3c', CAST(0x0000AA32017E63E3 AS DateTime))
INSERT [dbo].[Messages] ([Id], [MessageText], [SenderId], [RecieverId], [DateOfText]) VALUES (N'89561502-5699-4cad-a968-c057647bae28', N'hi', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'1d5e37a3-709b-437a-9778-753c0b433b3c', CAST(0x0000AA4500C444DD AS DateTime))
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionId], [Name], [Description], [CreatedBy], [CreatedOn], [Modifiedby], [ModifiedOn], [IsActive]) VALUES (1, N'perCanLoginAsOtherUser', N'', 0, CAST(0x0000A96C00E3890B AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Permissions] ([PermissionId], [Name], [Description], [CreatedBy], [CreatedOn], [Modifiedby], [ModifiedOn], [IsActive]) VALUES (2, N'perManageSecurityUsers', N'', 0, CAST(0x0000A96C00E3890B AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Permissions] ([PermissionId], [Name], [Description], [CreatedBy], [CreatedOn], [Modifiedby], [ModifiedOn], [IsActive]) VALUES (3, N'perManageSecurityRoles', N'', 0, CAST(0x0000A96C00E3890B AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Permissions] ([PermissionId], [Name], [Description], [CreatedBy], [CreatedOn], [Modifiedby], [ModifiedOn], [IsActive]) VALUES (4, N'perManageSecurityPermissions', N'', 0, CAST(0x0000A96C00E3890B AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Permissions] ([PermissionId], [Name], [Description], [CreatedBy], [CreatedOn], [Modifiedby], [ModifiedOn], [IsActive]) VALUES (5, N'perViewLoginHistoryReport', N'', 0, CAST(0x0000A96C00E3890B AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
SET IDENTITY_INSERT [dbo].[PermissionsMapping] ON 

INSERT [dbo].[PermissionsMapping] ([Id], [RoleId], [PermissionId]) VALUES (1, 2, 1)
INSERT [dbo].[PermissionsMapping] ([Id], [RoleId], [PermissionId]) VALUES (2, 2, 2)
INSERT [dbo].[PermissionsMapping] ([Id], [RoleId], [PermissionId]) VALUES (3, 2, 3)
INSERT [dbo].[PermissionsMapping] ([Id], [RoleId], [PermissionId]) VALUES (4, 2, 4)
INSERT [dbo].[PermissionsMapping] ([Id], [RoleId], [PermissionId]) VALUES (5, 2, 5)
SET IDENTITY_INSERT [dbo].[PermissionsMapping] OFF
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title], [IsPublic]) VALUES (N'c10d98be-e6bb-41f9-a917-59b36febe3cc', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 3, 1, N'<p><strong>Description</strong></p><p>In this Problem , You will be given a weekday number ,</p><p>You have to print weekday name.</p><p>for input 1 , print &#39;Monday&#39; , for input 2 , print &#39;Tuesday&#39; and so on.</p><p>First Line of Input will denote the number of Test cases.</p><p>than in the next lines , there will be first input denoting weekday</p><p>for each input output its weekday name.</p><p><strong>Sample Input</strong></p><p>2</p><p>1</p><p>7</p><p><strong>Sample output</strong></p><p>Monday</p><p>Sunday</p><p><br></p>', 30, 0, CAST(0x0000AA040116E0C3 AS DateTime), NULL, N'Print WeekDay Name', 0)
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title], [IsPublic]) VALUES (N'e14e23c2-7378-4a39-a86e-6c4b30f54373', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 1, 1, N'<p>ulknsdlkskd</p>', 154, 0, CAST(0x0000A9FB00FA04A3 AS DateTime), NULL, N'just dummy', 0)
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title], [IsPublic]) VALUES (N'457d0878-d93b-4e50-a366-732d2357e9e8', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 3, 1, N'<p><strong>Input Format</strong></p><p>take three input like : 3 , 4, 3</p><p><strong>Output Format</strong></p><p>10</p><p><br></p>', 10, 0, CAST(0x0000A9FB00DF69A2 AS DateTime), NULL, N'Add three numbers', 0)
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title], [IsPublic]) VALUES (N'359084c5-4752-42e3-b136-c458d40606f8', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 3, 1, N'<p><strong>Description:</strong></p><p>In this Problem , You will be given a weekday number ,</p><p>You have to print weekday name.</p><p>for input 1 , print &#39;Monday&#39; , for input 2 , print &#39;Tuesday&#39; and so on.</p><p>First Line of Input will denote the number of Test cases.</p><p>than in the next lines , there will be first input denoting weekday</p><p>for each input output its weekday name.</p><p><strong>Constraints:</strong></p><p>1 &lt;= test Case &lt;= 10</p><p>1 &lt;= weekday &lt;= 7</p><p><strong>Sample Input:</strong></p><p>2</p><p>1</p><p>7</p><p><strong>Sample Output:</strong></p><p>Monday</p><p>Sunday</p><p><br></p>', 30, 0, CAST(0x0000AA04011B704F AS DateTime), NULL, N'Print Week Day Name', 0)
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title], [IsPublic]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 1, 1, N'"<section><p><strong>Objective</strong>&nbsp;<br>In this challenge, we&#39;re practicing reading input from stdin and printing output to stdout.</p><hr><p>In C++, you can read a single whitespace-separated token of input using <a href="http://www.cplusplus.com/cin">cin</a>, and print output to stdout using&nbsp;<a href="http://www.cplusplus.com/printf">cout</a>. For example, let&#39;s say we declare the following variables:</p><pre>string s;
int n;</pre><p>and we want to use&nbsp;<em>cin</em> to read the input &quot;High 5&quot; from stdin. We can do this with the following code:</p><pre>cin &gt;&gt; s &gt;&gt; n;</pre><p>The above code reads the first word (&quot;High&quot;) from stdin and saves it as string&nbsp;, then reads the second word (&quot;&quot;) from stdin and saves it as integer&nbsp;. If we want to print these values to stdout, we write the following code:</p><pre>cout &lt;&lt; s &lt;&lt; &quot; &quot; &lt;&lt; n &lt;&lt; endl;</pre><p>The above code prints the contents of string&nbsp;, which is the word &quot;High&quot;. Then it prints a single space (), followed by the contents of integer&nbsp;. Because we also want to ensure that nothing else is printed on this line, we end our line of output with a newline via&nbsp;<a href="http://www.cplusplus.com/endl">endl</a>. This results in the following output:</p><pre><code>High 5
</code></pre><p><strong>Task</strong>&nbsp;<br>Read&nbsp;&nbsp;numbers from stdin and print their sum to stdout.</p><p><strong>Note:</strong> If you plan on completing this challenge in&nbsp;<em>C</em> instead of&nbsp;<em>C++</em>, you&#39;ll need to use format specifiers with&nbsp;<em>printf</em> and&nbsp;<em>scanf</em>.</p><p><strong>Input Format</strong></p><p>A single line containing&nbsp;&nbsp;space-separated integers:&nbsp;,&nbsp;, and&nbsp;.</p><p><strong>Constraints</strong></p><ul><li><br></li></ul><p><strong>Output Format</strong></p><p>Print the sum of the three numbers on a single line.</p><p><strong>Sample Input</strong></p><pre><code>1 2 7
</code></pre><p><strong>Sample Output</strong></p><pre><code>10
</code></pre><p><strong>Explanation</strong></p><p>The sum of the three numbers is&nbsp;.</p></section><section><br></section>"', 10, 0, CAST(0x0000A97500000000 AS DateTime), 1, N'Input and Output', 0)
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title], [IsPublic]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 3, 3, N'<section><section><section><p>Calculate and print the sum of the elements in an array, keeping in mind that some of those integers may be quite large.</p><p><strong>Function Description</strong></p><p>Complete the&nbsp;<em>aVeryBigSum</em> function in the editor below. It must return the sum of all array elements.</p><p>aVeryBigSum has the following parameter(s):</p><ul><li><em>ar</em>: an array of integers .</li></ul><p><strong>Input Format</strong></p><p>The first line of the input consists of an integer&nbsp;.&nbsp;<br>The next line contains&nbsp;&nbsp;space-separated integers contained in the array.</p><p><strong>Output Format</strong></p><p>Print the integer sum of the elements in the array.</p><p><strong>Constraints</strong>&nbsp;<br>&nbsp;</p><p><strong>Sample Input</strong></p><pre><code>5 1000000001 1000000002 1000000003 1000000004 1000000005
</code></pre><p><strong>Output</strong></p><pre><code>5000000015
</code></pre><p><strong>Note:</strong></p><p>The range of the 32-bit integer is&nbsp;.</p><p>When we add several integer values, the resulting sum might exceed the above range. You might need to use long long int in C/C++ or long data type in Java to store such sums.</p></section><section><br></section></section></section>', 10, 0, CAST(0x0000A97700000000 AS DateTime), 1, N'Big Sum', 0)
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title], [IsPublic]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 1, 2, N'<section><section><section><p>Given a square matrix, calculate the absolute difference between the sums of its diagonals.</p><p>For example, the square matrix&nbsp;&nbsp;is shown below:</p><pre><code>1 2 3 4 5 6 9 8 9  </code></pre><p>The left-to-right diagonal =&nbsp;. The right to left diagonal =&nbsp;. Their absolute difference is&nbsp;.</p><p><strong>Function description</strong></p><p>Complete the&nbsp;&nbsp;function in the editor below. It must return an integer representing the absolute diagonal difference.</p><p>diagonalDifference takes the following parameter:</p><ul><li><em>arr</em>: an array of integers .</li></ul><p><strong>Input Format</strong></p><p>The first line contains a single integer,&nbsp;, the number of rows and columns in the matrix&nbsp;.&nbsp;<br>Each of the next&nbsp;&nbsp;lines describes a row,&nbsp;, and consists of&nbsp;&nbsp;space-separated integers&nbsp;.</p><p><strong>Constraints</strong></p><ul><li><br></li></ul><p><strong>Output Format</strong></p><p>Print the absolute difference between the sums of the matrix&#39;s two diagonals as a single integer.</p><p><strong>Sample Input</strong></p><pre><code>3 11 2 4 4 5 6 10 8 -12
</code></pre><p><strong>Sample Output</strong></p><pre><code>15
</code></pre><p><strong>Explanation</strong></p><p>The primary diagonal is:</p><pre><code>11   5     -12
</code></pre><p>Sum across the primary diagonal: 11 + 5 - 12 = 4</p><p>The secondary diagonal is:</p><pre><code>     4   5 10
</code></pre><p>Sum across the secondary diagonal: 4 + 5 + 10 = 19&nbsp;<br>Difference: |4 - 19| = 15</p><p><strong>Note:</strong> |x| is the&nbsp;<a href="https://www.mathsisfun.com/numbers/absolute-value.html">absolute value</a> of x</p></section></section></section>', 20, 0, CAST(0x0000A9B300000000 AS DateTime), 1, N'Diagonal Difference', 0)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'c3bb0659-21a8-468c-816e-2326d22e75cf', N'c10d98be-e6bb-41f9-a917-59b36febe3cc', N'Test Input 3atxt2d045f99-ce84-4d94-93cc-382eb0fef4a4.txt', N'Test Output 3atxtce10de53-d5ae-4801-9e3e-93c9ba9a9ac0.txt', 14, 24)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'6cc57085-e1d5-47e4-ae2d-2e0832ba0cf3', N'359084c5-4752-42e3-b136-c458d40606f8', N'Test Input 2atxtd27153e9-9ced-4a54-9b10-8415da066688.txt', N'Test Output 2atxte3723600-8c26-43e6-8247-e08a3f4dc23c.txt', 10, 25)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'eebfb10d-4fcf-4865-bb66-87270820c196', N'359084c5-4752-42e3-b136-c458d40606f8', N'Test Input 3atxtd4c2eaf3-9bc3-4850-98fd-cff661a98b35.txt', N'Test Output 3atxtd502f34c-b8bd-4a55-ba9e-5f5b7155029e.txt', 14, 24)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'a7c68d94-893e-41ad-8ce2-a63f0a42b796', N'c10d98be-e6bb-41f9-a917-59b36febe3cc', N'Test Input 2atxt29f2e23a-0279-4830-b4a7-dc8494929160.txt', N'Test Output 2atxt5c94ed52-696f-4994-b845-76ce12ada2c9.txt', 10, 25)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'3d3f6905-0180-4ee6-a22a-c993a4ca4e19', N'c10d98be-e6bb-41f9-a917-59b36febe3cc', N'Test Input 1atxt85007ebc-f72e-4344-ba71-fa3150643601.txt', N'Test Output 1atxt8cb1f7db-594d-44cf-a1a4-0b1e5cebfeeb.txt', 14, 26)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'aa5b4335-eb24-4109-ad10-df0b3742d12b', N'457d0878-d93b-4e50-a366-732d2357e9e8', N'input02atxtbba46bb4-a777-4430-accd-c5093b1df2c5.txt', N'output02atxtdd80d033-066f-4752-98a8-025f57c7bc8e.txt', 8, 2)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'17336198-4359-4927-814b-e0bb1c8003cf', N'359084c5-4752-42e3-b136-c458d40606f8', N'Test Input 1atxtca4a8f39-c546-451a-b32b-5c807572b10b.txt', N'Test Output 1atxt55da9a88-a1c0-4163-bc41-b64c15cb47ab.txt', 14, 26)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input02.txt', N'output02.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input03.txt', N'output03.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input04.txt', N'output04.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input05.txt', N'output05.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba6', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'input01.txt', N'output01.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba7', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'input02.txt', N'output02.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba8', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'input00.txt', N'output00.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba9', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'input00.txt', N'output00.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27abb1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input01.txt', N'output01.txt', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'a093be52-8520-42c6-947a-e81ebb274638', N'e14e23c2-7378-4a39-a86e-6c4b30f54373', N'input02atxt15bac956-b580-47b7-aab8-babc11237752.txt', N'output02atxt406608ce-bdd1-4d01-89e7-41256445a0b4.txt', 8, 2)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'1f48ec23-a81f-46ed-a693-f95d100c112e', N'457d0878-d93b-4e50-a366-732d2357e9e8', N'input03atxt2caf268e-b5d9-457b-8dec-c97be0410177.txt', N'output03atxta31f82fd-e2a5-4c66-8bbd-6ea4295618ac.txt', 5, 2)
SET IDENTITY_INSERT [dbo].[ProblemType] ON 

INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (1, N'Data Structure', N'Data Structure', 1)
INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (2, N'Algo', N'Algo', 1)
INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (3, N'pf', N'Pf', 1)
INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (4, N'Advannced Programming', N'Advanced', 1)
SET IDENTITY_INSERT [dbo].[ProblemType] OFF
SET IDENTITY_INSERT [dbo].[ProgrammingLanguage] ON 

INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (1, N'C++', N'C++', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (2, N'Java', N'java', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (4, N'Python', N'Python', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (7, N'C#', N'C#', 1)
SET IDENTITY_INSERT [dbo].[ProgrammingLanguage] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (2, N'Admin', N'System Admin', CAST(0x0000A96B011F3762 AS DateTime), NULL, 1, NULL, N'0e984725-c51c-4bf4-9960-e1c80e27aba0')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (3, N'User', N'Just User', CAST(0x0000A9C700F8C5C8 AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (4, N'AppSuperAdmin', N'Have access of everything', CAST(0x0000AA0B00000000 AS DateTime), NULL, 1, NULL, N'0e984725-c51c-4bf4-9960-e1c80e27aba0')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (5, N'Event Creator', N'User who create an event', CAST(0x0000AA0B00000000 AS DateTime), NULL, 1, NULL, N'0e984725-c51c-4bf4-9960-e1c80e27aba0')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (6, N'Event User', N'User of an event', CAST(0x0000AA0B00000000 AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (7, N'Event Roles Modifier', N'User of an specific event who can modified roles', CAST(0x0000AA0B00000000 AS DateTime), NULL, 1, NULL, NULL)
INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (8, N'Event Modifier', N'User of an event who can modified event functions except roles management', CAST(0x0000AA0B00000000 AS DateTime), NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'7da46d55-f2ae-4b19-9e11-12f888dc112c', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E1013D9B41 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'6187c2a4-01ab-44ba-a346-1a6763435df9', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA3E01336810 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'8bc7185c-dcec-415f-93a8-238a8b1811f5', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA440122E1B0 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'02012b69-2b27-406d-8ceb-2ca79314aa81', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA3E01318B31 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'bf908b57-f8f8-4c95-a684-39e44944aa29', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', 0, N'failed', CAST(0x0000AA450005668A AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int n;
    cin>>n;
    int sum=0;
    for(int i=;i<n;i++){
        int a;
        cin>>a;
        sum=sum+a;
    }
    cout<<sum;
    return 0;
}
', 1, 0)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'a71ec9b7-763c-477c-9444-55ac030b82a2', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA450004735A AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, 0)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'5d19dc5a-8c64-4de6-a1ef-573aaf6247f4', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E10112B30A AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'2e2accc0-5af6-4e60-a92d-5f89f837f2b9', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 10, N'passed', CAST(0x0000AA4801352EEB AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, 11)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'41b5942c-f762-4873-a581-6a49eb77cd01', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E101028655 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'479a3431-d095-4ca0-aed7-6d449b87a613', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E101191E51 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'989d1203-1ca7-4e06-a7ee-70d43782368a', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA4500CD3642 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, 9)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'01c9cc1c-665c-4b6e-af4e-72f251ce28fd', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E1014D7079 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'5e60f091-b272-452a-b4bb-801233d360b0', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA4401127D4B AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, 7)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'03c786ea-1a0a-4d92-a41b-8a6035e4a5b2', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E101163105 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'212d78ae-e500-4615-a299-8b5380ec3bcd', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E10144411C AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,s,d;
    cin>>a>>s>>d;
    cout<<a+s+d;
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'e622081b-ed9f-4fa5-b8ce-8e6a9ae227ac', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 10, N'passed', CAST(0x0000AA4500D167C0 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, 9)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'1b203c38-2e16-4d9e-a051-96b5cc8796ca', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E10102F59F AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'ed7b1b36-3a43-4730-ae9c-aa000e316eda', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA4500CEF635 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    return 0;
}
', 1, 9)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'ec2b15bb-7a60-4678-8721-b1f9fbc68c4a', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000AA440129DB21 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a,b,c;
    cin>>a>>b>>c;
    cout<<a+b+c;
    
    return 0;
}
', 1, 7)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'ac99fbe8-13d7-440d-b16c-d141b77b721a', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E1014A0446 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'785d7c84-d6b3-4666-bd2f-ec95da2e057d', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', 0, N'failed', CAST(0x0000A9E1011E5871 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    int a;
    cin>>a;
    int sum=0;
    for(int i=0;i<a;i++){
        int b;
        cin>>b;
        sum=sum+b;
    }
    cout<<sum;
    
    return 0;
}
', 1, NULL)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'28e9a2b7-8918-45ea-9039-f38c58b3f0e3', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', 20, N'passed', CAST(0x0000A9DB01231ED4 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1, 1)
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId], [EventId]) VALUES (N'db9f64f8-6336-40de-912f-fab3cd53a8f3', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', 0, N'failed', CAST(0x0000A9E101448268 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1, 1)
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'64081265-1374-4aae-8bb7-030212c54767', N'1b203c38-2e16-4d9e-a051-96b5cc8796ca', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_53be772d-f6db-42ed-b474-ff996b76be4c.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'd82d1140-ab06-4a6c-b152-05acd369c604', N'ac99fbe8-13d7-440d-b16c-d141b77b721a', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_9c68dcb9-9d47-40f5-9313-0545ff3b56c4.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'0af004fc-fb7f-4473-950f-0683e249e455', N'479a3431-d095-4ca0-aed7-6d449b87a613', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_4893845f-21d6-4731-811f-014f1d6854fc.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'3c600dd8-cd22-42d3-b654-084fcd2fc0ff', N'6187c2a4-01ab-44ba-a346-1a6763435df9', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_c7f65a98-87c5-4e82-9059-1c4ba02d1b14.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'4e61abb9-3892-4d6f-974a-0e1b53b9655f', N'a71ec9b7-763c-477c-9444-55ac030b82a2', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 0', N'')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'cd6620ab-67ba-4b2d-aab2-0ed9f61feedf', N'db9f64f8-6336-40de-912f-fab3cd53a8f3', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_c84332a4-483f-46d7-a9a0-2f8b293d6365.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'4c59ac28-b820-4e26-bebf-0f5ea2771acf', N'5e60f091-b272-452a-b4bb-801233d360b0', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_8a30d23d-f2a8-4b68-8407-28b1863ba62b.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'0f76eec5-5a1f-479c-90e3-182d630d0d2d', N'7da46d55-f2ae-4b19-9e11-12f888dc112c', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_420a4654-7baf-4f11-874e-3feb9abc2a2d.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'5f3c113c-308e-4919-952c-1929cea05eab', N'212d78ae-e500-4615-a299-8b5380ec3bcd', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_32cd3d5f-f8c1-4f46-965c-0634d21b095b.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'52df5843-8577-4395-bbe5-23299f040ce5', N'ec2b15bb-7a60-4678-8721-b1f9fbc68c4a', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_5b13b430-7ef0-4bed-aeba-e34d7b083037.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'e644b0f1-39d5-48d0-8f2d-2825977cf613', N'e622081b-ed9f-4fa5-b8ce-8e6a9ae227ac', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_c90bbd0b-9bbd-4eb3-99da-e8ceab30da6d.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'2cb5ea2f-f82c-4805-968e-28e9dd28a1d2', N'212d78ae-e500-4615-a299-8b5380ec3bcd', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_7c38843e-4d8c-4557-a4b7-2a233f574015.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'7bc2f163-a408-4f9a-bdc6-2ec304bc18ee', N'5e60f091-b272-452a-b4bb-801233d360b0', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_d010bb3d-cc5f-47ca-8d34-929f94bb699c.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'c124705e-ac31-4aa9-8b05-2f01e477fdb7', N'ed7b1b36-3a43-4730-ae9c-aa000e316eda', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 0', N'')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'0994b29f-17f1-4e87-ab8f-2f3e5bce272c', N'5e60f091-b272-452a-b4bb-801233d360b0', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_d4da9fed-3a67-4fb5-baa7-c558dc14cc9e.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'6cbbabc4-c9ed-44ef-92ec-2ffb60041138', N'01c9cc1c-665c-4b6e-af4e-72f251ce28fd', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_1621e98a-be73-4509-ba4e-efa5e5324a35.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'2e04ef28-5332-4aea-b89d-321f9d510e5a', N'212d78ae-e500-4615-a299-8b5380ec3bcd', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_e454232a-7198-4771-8507-2cbb00d5df11.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'b9703b31-83f3-44d0-95cf-33bce267b45e', N'01c9cc1c-665c-4b6e-af4e-72f251ce28fd', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_548d9d4d-eadd-4a5f-9d6f-959238a7a6d5.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'14c3b4c1-d115-40fa-9c35-344bdac09a60', N'ac99fbe8-13d7-440d-b16c-d141b77b721a', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_d7b6740c-4f40-4fc4-9aab-04072b6a3a9c.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'64acada4-0a12-442d-abe6-3aeae8dda1e5', N'6187c2a4-01ab-44ba-a346-1a6763435df9', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_91b4486f-6a6f-4706-a48f-e1a0a1c8fd96.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'c1f17b3c-68cf-4ddb-9fb0-3b298a37f4f6', N'212d78ae-e500-4615-a299-8b5380ec3bcd', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_b2334d5a-815c-4f70-bd2c-d5fefee947af.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'643b27bd-a637-4395-99bd-3d89ac5e39e5', N'1b203c38-2e16-4d9e-a051-96b5cc8796ca', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_9a5cf9b6-ebb1-432b-b3c4-e801f25a015b.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'e46f3060-d13f-498f-a9d9-402fc8356727', N'785d7c84-d6b3-4666-bd2f-ec95da2e057d', N'0e984725-c51c-4bf4-9960-e1c80e27aba8', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 2', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba3_0e984725-c51c-4bf4-9960-e1c80e27aba8_59fbf662-9767-4455-9e6e-975d5a8c048c.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'528418e1-813e-407f-a2f6-4232f3e8691b', N'5d19dc5a-8c64-4de6-a1ef-573aaf6247f4', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_0a21e8f6-7730-43bf-8eec-4ddb9dcf10f1.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'74fc4190-2abd-4cd5-87a7-434802f179f1', N'6187c2a4-01ab-44ba-a346-1a6763435df9', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_13a2588a-d092-407b-b38d-e7a909a85143.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'7db9164d-c2fa-4f04-8d78-4811c725759e', N'7da46d55-f2ae-4b19-9e11-12f888dc112c', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_1dac8866-ac5f-47ed-ab18-8948d67100ef.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'dd0636e8-5971-493c-9bb7-4f70efb42bf7', N'41b5942c-f762-4873-a581-6a49eb77cd01', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_dd2c7f9a-61a3-4965-8bbf-ce7a7efdd34b.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'cda729e8-cecc-43ec-a85d-574050d03a40', N'db9f64f8-6336-40de-912f-fab3cd53a8f3', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_8875afe6-6de9-4430-99c0-60044b8e7266.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'bc393eff-2bb0-4084-b62f-599e7f94da32', N'8bc7185c-dcec-415f-93a8-238a8b1811f5', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_0af4de1f-4727-436c-95b2-5794146128d1.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'77aa1d5c-871d-455d-881d-5fc3f8d77438', N'479a3431-d095-4ca0-aed7-6d449b87a613', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_0087b302-3fd0-4d22-a942-ffda5fdf7bfa.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'ed7e142b-2f3c-4370-b2bc-61a9ec0349de', N'8bc7185c-dcec-415f-93a8-238a8b1811f5', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_9110973e-feb3-4916-a88b-c599e5afbc85.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'd159ca36-9ece-4294-bfa4-63b19ad1fd0a', N'03c786ea-1a0a-4d92-a41b-8a6035e4a5b2', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_cb3cee9e-8923-4340-98a5-b675fbac6d0e.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'6843baac-bd47-4a0e-8201-659741a87218', N'03c786ea-1a0a-4d92-a41b-8a6035e4a5b2', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_dbca859f-434e-483b-a817-9f830a49d74c.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'eed1da30-e9dd-4f53-b764-665bead29671', N'785d7c84-d6b3-4666-bd2f-ec95da2e057d', N'0e984725-c51c-4bf4-9960-e1c80e27aba7', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 2', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba3_0e984725-c51c-4bf4-9960-e1c80e27aba7_7ac2651b-8c00-48b7-a82c-715f8b3b43a1.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'80089ed1-aaf5-4e67-9acb-6b4cf68cc54d', N'2e2accc0-5af6-4e60-a92d-5f89f837f2b9', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_669707ff-d883-410e-b0bc-132d41f53f80.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'afc6599f-eb8e-4e91-9e3c-763a4ce295ed', N'5d19dc5a-8c64-4de6-a1ef-573aaf6247f4', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_0fb0d61a-4e7a-42c8-a424-8965a0d9035f.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'66b41164-09ad-458d-bfe0-76ad643fc589', N'ac99fbe8-13d7-440d-b16c-d141b77b721a', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_9895e574-f137-4a8a-b7d2-6f08163d606b.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'2d74a2b0-0f30-46ee-9d17-82316c83ea64', N'ec2b15bb-7a60-4678-8721-b1f9fbc68c4a', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_3ef6477b-4fe4-4f98-b896-808f69204da5.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'c89c40c0-9d7d-4988-aed4-83bceef2fdbf', N'7da46d55-f2ae-4b19-9e11-12f888dc112c', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_b34d09f6-35cb-43a1-9fdf-d14f00504e51.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'33bf074d-e495-4d7f-b06d-848290d52924', N'41b5942c-f762-4873-a581-6a49eb77cd01', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_085e4f3a-2c86-4d7e-a48f-ad282ef2991e.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'2c5a5938-4e46-4f87-8a26-879d1d331614', N'5e60f091-b272-452a-b4bb-801233d360b0', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_c8f0fdc4-133a-490d-9569-43ef722daf48.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'ff258838-9aad-4013-b574-8845e2384133', N'ec2b15bb-7a60-4678-8721-b1f9fbc68c4a', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_5c1d0892-aa0f-4c93-ac86-14f804279da4.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'd3561338-125c-45af-a3db-88d206bc9c52', N'1b203c38-2e16-4d9e-a051-96b5cc8796ca', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_c588ad57-f5c0-4444-8ef5-eaff282c3200.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'89f3bcae-c01b-4821-97ec-896d560cc9fe', N'03c786ea-1a0a-4d92-a41b-8a6035e4a5b2', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_80168a26-ee77-4c00-9f59-713b54596a3e.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'66af1fdc-2a4d-4533-95bf-8da31f629c30', N'e622081b-ed9f-4fa5-b8ce-8e6a9ae227ac', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_453eb3c4-6d33-4f59-8277-8223808483ad.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'46198ed5-b59f-48e6-a158-8ee27adfcf60', N'e622081b-ed9f-4fa5-b8ce-8e6a9ae227ac', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_28545671-445f-4c7c-8ebd-119e1981f280.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'b253b161-0879-4ff6-b8b6-9248633ba2ad', N'989d1203-1ca7-4e06-a7ee-70d43782368a', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 0', N'')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'c0c9169f-0fd7-475d-8490-92a14cbe1107', N'01c9cc1c-665c-4b6e-af4e-72f251ce28fd', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_75165d67-2b32-4a50-b599-66479a544ce8.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'7f3e31d9-da1c-4fed-aba0-95c80bef6eda', N'db9f64f8-6336-40de-912f-fab3cd53a8f3', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_8f08d6bf-7923-451c-a251-f19b8824d592.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'3e166051-d07f-4534-8ae8-99602de176af', N'ec2b15bb-7a60-4678-8721-b1f9fbc68c4a', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_ff5061ad-345b-49c9-bec5-e4e487f8b92a.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'22ae2284-6dc1-4cd5-9295-99dffef9f86b', N'6187c2a4-01ab-44ba-a346-1a6763435df9', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_02aaca69-2704-42e7-9193-fc0d94277938.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'06dee67f-a54b-4717-9b75-a30f8fb5687c', N'41b5942c-f762-4873-a581-6a49eb77cd01', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_bf165d26-694b-4c12-b90e-75a25beb6b7d.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'455f86d2-2952-4532-8ce9-a4345d3ed922', N'8bc7185c-dcec-415f-93a8-238a8b1811f5', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_2ed57f46-9c49-422a-9b70-bdc38e0e1fe6.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'931acc7c-08b4-4d6c-a350-abe7218f6f37', N'01c9cc1c-665c-4b6e-af4e-72f251ce28fd', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_68a9b2a1-8351-4cd4-a0ba-fc6a35480253.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'a837effb-78f1-47e6-b479-b0804dfae3b8', N'5d19dc5a-8c64-4de6-a1ef-573aaf6247f4', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_1dd71825-120d-415f-9a81-07fb3da950f6.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'897efa7c-63b9-46ba-9ff6-b61d344532dd', N'479a3431-d095-4ca0-aed7-6d449b87a613', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_e6493911-5cc4-42ef-bd99-933e2e95b31a.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'440fb113-943a-4c58-a023-bba97dcf5c67', N'5d19dc5a-8c64-4de6-a1ef-573aaf6247f4', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_e7947ed9-da2c-40f1-9f54-31d3509f3252.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'45e6d632-c90e-4f1a-a005-be88be1a094e', N'2e2accc0-5af6-4e60-a92d-5f89f837f2b9', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_85409a0e-20b7-45b9-b712-f2b3685809a1.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'a2670390-48a8-48db-a37b-c4c339504901', N'41b5942c-f762-4873-a581-6a49eb77cd01', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_30b3dc16-bf47-43f5-ae5b-1a3ad5eba6f6.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'f34e2541-346d-4dbe-aad4-ccb1bacd1eb3', N'479a3431-d095-4ca0-aed7-6d449b87a613', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_e773cd66-313d-4fe8-b39a-af914626bc4c.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'e62de9cf-bd78-4818-8eab-d097d4d0f7fb', N'1b203c38-2e16-4d9e-a051-96b5cc8796ca', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_81e6c1d9-5528-474f-9d05-7a6c3ecd95b0.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'72380295-3a11-4a0c-bf9f-d15eddc598ad', N'8bc7185c-dcec-415f-93a8-238a8b1811f5', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba4_0bdfec3d-e363-433b-b158-51ea4887ca51.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'319eaca4-cefc-42e3-845d-d1a9600198e5', N'785d7c84-d6b3-4666-bd2f-ec95da2e057d', N'0e984725-c51c-4bf4-9960-e1c80e27aba6', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 2', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba3_0e984725-c51c-4bf4-9960-e1c80e27aba6_7355aff9-4d12-4b0d-9599-5f06c5992e0c.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'8c82d79e-5d82-48fe-a9b8-d5765bafab56', N'03c786ea-1a0a-4d92-a41b-8a6035e4a5b2', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_86cbb6d8-49db-4f00-9686-ae0916254c95.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'da4c56c1-1c67-4872-aa3d-d8be05513301', N'db9f64f8-6336-40de-912f-fab3cd53a8f3', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_be671d20-0294-4729-9237-87cc4d20ec65.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'4d83902a-71c8-4938-a07d-e61d109d8812', N'bf908b57-f8f8-4c95-a684-39e44944aa29', N'0e984725-c51c-4bf4-9960-e1c80e27aba6', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 0', N'')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'9d5b84ba-8a23-4550-b361-e8c7ed863790', N'2e2accc0-5af6-4e60-a92d-5f89f837f2b9', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_bfab804a-63fd-4a18-9ff9-6951cb834533.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'ba343d9a-3498-4fc8-af23-ec8c682c5516', N'2e2accc0-5af6-4e60-a92d-5f89f837f2b9', N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba5_88cd045e-0f9a-47b5-9259-7dfba4c75808.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'518d9d9d-fed7-492d-bc52-f05eafaa6855', N'e622081b-ed9f-4fa5-b8ce-8e6a9ae227ac', N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'SuccessTestCaseCount: 1
FailedTestCaseCount: 0', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba2_df64ab3e-9e9d-4c7e-82ec-d5e189e12450.txt')
INSERT [dbo].[SubmissionProblemTestCase] ([SubmissionProblemTestCaseId], [SubmissionId], [ProblemTestCaseId], [Status], [UserOutputFilePath]) VALUES (N'6d9ff524-905a-42dd-bb2d-f655e621ca27', N'ac99fbe8-13d7-440d-b16c-d141b77b721a', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'SuccessTestCaseCount: 0
FailedTestCaseCount: 1', N'1d5e37a3-709b-437a-9778-753c0b433b3c_0e984725-c51c-4bf4-9960-e1c80e27aba1_0e984725-c51c-4bf4-9960-e1c80e27aba3_c6bc72a3-df41-4f16-80fa-ae1067da8662.txt')
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (2, N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 2)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (4, N'1d5e37a3-709b-437a-9778-753c0b433b3c', 3)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (1004, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 3)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (1005, N'5df02e31-74bc-499c-9208-e4b9211fbf95', 3)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'Usman', N'123', N'Muhammad Usman Saleem', N'tomusaleem@gmail.com', CAST(0x0000A9DB00CC8A7F AS DateTime), CAST(0x0000A9DB00CC8A7F AS DateTime), 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', NULL)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'Usman', N'123', N'Muhammad Usman', N'musaleem@gmail.com', CAST(0x0000A9D600BE6612 AS DateTime), CAST(0x0000A9D600BE6612 AS DateTime), 1, N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'1d5e37a3-709b-437a-9778-753c0b433b3c', NULL)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba0', N'Admin', N'123', N'Admin', N'abc@yahoo.com', CAST(0x0000A96B011E4520 AS DateTime), NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'5df02e31-74bc-499c-9208-e4b9211fbf95', N'Arslan', N'arslan', N'Arslan Aslam', N'arslan@gmail.com', CAST(0x0000AA4A00C7203F AS DateTime), CAST(0x0000AA4A00C7203F AS DateTime), 1, N'5df02e31-74bc-499c-9208-e4b9211fbf95', N'5df02e31-74bc-499c-9208-e4b9211fbf95', NULL)
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Problem] ADD  CONSTRAINT [DF_Problem_IsPublic]  DEFAULT ((0)) FOR [IsPublic]
GO
ALTER TABLE [dbo].[ProblemType] ADD  CONSTRAINT [DF_ProblemType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF__Roles__CreatedOn__398D8EEE]  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF__Roles__IsActive__3A81B327]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Problem] FOREIGN KEY([ProblemId])
REFERENCES [dbo].[Problem] ([ProblemId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Problem]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[Connection]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Editorial]  WITH CHECK ADD  CONSTRAINT [FK_Editorial_Problem] FOREIGN KEY([ProblemId])
REFERENCES [dbo].[Problem] ([ProblemId])
GO
ALTER TABLE [dbo].[Editorial] CHECK CONSTRAINT [FK_Editorial_Problem]
GO
ALTER TABLE [dbo].[Editorial]  WITH CHECK ADD  CONSTRAINT [FK_Editorial_ProgrammingLanguage] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[ProgrammingLanguage] ([LanguageId])
GO
ALTER TABLE [dbo].[Editorial] CHECK CONSTRAINT [FK_Editorial_ProgrammingLanguage]
GO
ALTER TABLE [dbo].[Editorial]  WITH CHECK ADD  CONSTRAINT [FK_Editorial_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Editorial] CHECK CONSTRAINT [FK_Editorial_Users]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Users]
GO
ALTER TABLE [dbo].[EventProblems]  WITH CHECK ADD  CONSTRAINT [FK_EventProblems_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[EventProblems] CHECK CONSTRAINT [FK_EventProblems_Event]
GO
ALTER TABLE [dbo].[EventProblems]  WITH CHECK ADD  CONSTRAINT [FK_EventProblems_Problem] FOREIGN KEY([ProblemId])
REFERENCES [dbo].[Problem] ([ProblemId])
GO
ALTER TABLE [dbo].[EventProblems] CHECK CONSTRAINT [FK_EventProblems_Problem]
GO
ALTER TABLE [dbo].[EventUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_EventUserRoles_EventUsers] FOREIGN KEY([EventUserId])
REFERENCES [dbo].[EventUsers] ([EventUserId])
GO
ALTER TABLE [dbo].[EventUserRoles] CHECK CONSTRAINT [FK_EventUserRoles_EventUsers]
GO
ALTER TABLE [dbo].[EventUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_EventUserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[EventUserRoles] CHECK CONSTRAINT [FK_EventUserRoles_Roles]
GO
ALTER TABLE [dbo].[EventUsers]  WITH CHECK ADD  CONSTRAINT [FK_EventUsers_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[EventUsers] CHECK CONSTRAINT [FK_EventUsers_Event]
GO
ALTER TABLE [dbo].[EventUsers]  WITH CHECK ADD  CONSTRAINT [FK_EventUsers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[EventUsers] CHECK CONSTRAINT [FK_EventUsers_Users]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([RecieverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([SenderId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users] FOREIGN KEY([Modifiedby])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Users]
GO
ALTER TABLE [dbo].[PermissionsMapping]  WITH CHECK ADD  CONSTRAINT [FK_PermissionsMapping_Permissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([PermissionId])
GO
ALTER TABLE [dbo].[PermissionsMapping] CHECK CONSTRAINT [FK_PermissionsMapping_Permissions]
GO
ALTER TABLE [dbo].[PermissionsMapping]  WITH CHECK ADD  CONSTRAINT [FK_PermissionsMapping_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[PermissionsMapping] CHECK CONSTRAINT [FK_PermissionsMapping_Roles]
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD  CONSTRAINT [FK_Problem_Difficulty] FOREIGN KEY([DifficultyId])
REFERENCES [dbo].[Difficulty] ([DifficultyId])
GO
ALTER TABLE [dbo].[Problem] CHECK CONSTRAINT [FK_Problem_Difficulty]
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD  CONSTRAINT [FK_Problem_ProblemType] FOREIGN KEY([ProblemTypeId])
REFERENCES [dbo].[ProblemType] ([ProblemTypeId])
GO
ALTER TABLE [dbo].[Problem] CHECK CONSTRAINT [FK_Problem_ProblemType]
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD  CONSTRAINT [FK_Problem_Users] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Problem] CHECK CONSTRAINT [FK_Problem_Users]
GO
ALTER TABLE [dbo].[ProblemTestCase]  WITH CHECK ADD  CONSTRAINT [FK_ProblemTestCase_Problem] FOREIGN KEY([ProblemId])
REFERENCES [dbo].[Problem] ([ProblemId])
GO
ALTER TABLE [dbo].[ProblemTestCase] CHECK CONSTRAINT [FK_ProblemTestCase_Problem]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Problem] FOREIGN KEY([ProblemId])
REFERENCES [dbo].[Problem] ([ProblemId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Problem]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Users]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Users] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Users]
GO
ALTER TABLE [dbo].[Submission]  WITH CHECK ADD  CONSTRAINT [FK_Submission_Problem] FOREIGN KEY([ProblemId])
REFERENCES [dbo].[Problem] ([ProblemId])
GO
ALTER TABLE [dbo].[Submission] CHECK CONSTRAINT [FK_Submission_Problem]
GO
ALTER TABLE [dbo].[Submission]  WITH CHECK ADD  CONSTRAINT [FK_Submission_ProgrammingLanguage] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[ProgrammingLanguage] ([LanguageId])
GO
ALTER TABLE [dbo].[Submission] CHECK CONSTRAINT [FK_Submission_ProgrammingLanguage]
GO
ALTER TABLE [dbo].[Submission]  WITH CHECK ADD  CONSTRAINT [FK_Submission_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Submission] CHECK CONSTRAINT [FK_Submission_Users]
GO
ALTER TABLE [dbo].[SubmissionProblemTestCase]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionProblemTestCase_ProblemTestCase] FOREIGN KEY([ProblemTestCaseId])
REFERENCES [dbo].[ProblemTestCase] ([ProblemTestCaseId])
GO
ALTER TABLE [dbo].[SubmissionProblemTestCase] CHECK CONSTRAINT [FK_SubmissionProblemTestCase_ProblemTestCase]
GO
ALTER TABLE [dbo].[SubmissionProblemTestCase]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionProblemTestCase_Submission] FOREIGN KEY([SubmissionId])
REFERENCES [dbo].[Submission] ([SubmissionId])
GO
ALTER TABLE [dbo].[SubmissionProblemTestCase] CHECK CONSTRAINT [FK_SubmissionProblemTestCase_Submission]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users1]
GO
USE [master]
GO
ALTER DATABASE [DBCodeFreak] SET  READ_WRITE 
GO
