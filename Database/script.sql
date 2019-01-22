Drop database DBCodeFreak
Go

CREATE DATABASE [DBCodeFreak]
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
/****** Object:  Table [dbo].[Comment]    Script Date: 1/22/2019 6:37:56 PM ******/
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
/****** Object:  Table [dbo].[Difficulty]    Script Date: 1/22/2019 6:37:56 PM ******/
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
/****** Object:  Table [dbo].[Editorial]    Script Date: 1/22/2019 6:37:56 PM ******/
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
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 1/22/2019 6:37:56 PM ******/
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
/****** Object:  Table [dbo].[Permissions]    Script Date: 1/22/2019 6:37:56 PM ******/
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
/****** Object:  Table [dbo].[PermissionsMapping]    Script Date: 1/22/2019 6:37:56 PM ******/
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
/****** Object:  Table [dbo].[Problem]    Script Date: 1/22/2019 6:37:57 PM ******/
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
 CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
(
	[ProblemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProblemTestCase]    Script Date: 1/22/2019 6:37:57 PM ******/
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
/****** Object:  Table [dbo].[ProblemType]    Script Date: 1/22/2019 6:37:57 PM ******/
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
/****** Object:  Table [dbo].[ProgrammingLanguage]    Script Date: 1/22/2019 6:37:57 PM ******/
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
/****** Object:  Table [dbo].[Rating]    Script Date: 1/22/2019 6:37:57 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 1/22/2019 6:37:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Submission]    Script Date: 1/22/2019 6:37:57 PM ******/
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
 CONSTRAINT [PK_Submission] PRIMARY KEY CLUSTERED 
(
	[SubmissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubmissionProblemTestCase]    Script Date: 1/22/2019 6:37:57 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 1/22/2019 6:37:57 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/22/2019 6:37:57 PM ******/
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
SET IDENTITY_INSERT [dbo].[Difficulty] ON 

INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (1, N'Easy', N'Every one can solve it also.')
INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (2, N'Medium', N'Medium')
INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (3, N'Hard', N'Hard')
INSERT [dbo].[Difficulty] ([DifficultyId], [Name], [Description]) VALUES (4, N'Extraorddinary Hard', N'Very Difficult')
SET IDENTITY_INSERT [dbo].[Difficulty] OFF
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
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 1, 1, N'"<section><p><strong>Objective</strong>&nbsp;<br>In this challenge, we&#39;re practicing reading input from stdin and printing output to stdout.</p><hr><p>In C++, you can read a single whitespace-separated token of input using <a href="http://www.cplusplus.com/cin">cin</a>, and print output to stdout using&nbsp;<a href="http://www.cplusplus.com/printf">cout</a>. For example, let&#39;s say we declare the following variables:</p><pre>string s;
int n;</pre><p>and we want to use&nbsp;<em>cin</em> to read the input &quot;High 5&quot; from stdin. We can do this with the following code:</p><pre>cin &gt;&gt; s &gt;&gt; n;</pre><p>The above code reads the first word (&quot;High&quot;) from stdin and saves it as string&nbsp;, then reads the second word (&quot;&quot;) from stdin and saves it as integer&nbsp;. If we want to print these values to stdout, we write the following code:</p><pre>cout &lt;&lt; s &lt;&lt; &quot; &quot; &lt;&lt; n &lt;&lt; endl;</pre><p>The above code prints the contents of string&nbsp;, which is the word &quot;High&quot;. Then it prints a single space (), followed by the contents of integer&nbsp;. Because we also want to ensure that nothing else is printed on this line, we end our line of output with a newline via&nbsp;<a href="http://www.cplusplus.com/endl">endl</a>. This results in the following output:</p><pre><code>High 5
</code></pre><p><strong>Task</strong>&nbsp;<br>Read&nbsp;&nbsp;numbers from stdin and print their sum to stdout.</p><p><strong>Note:</strong> If you plan on completing this challenge in&nbsp;<em>C</em> instead of&nbsp;<em>C++</em>, you&#39;ll need to use format specifiers with&nbsp;<em>printf</em> and&nbsp;<em>scanf</em>.</p><p><strong>Input Format</strong></p><p>A single line containing&nbsp;&nbsp;space-separated integers:&nbsp;,&nbsp;, and&nbsp;.</p><p><strong>Constraints</strong></p><ul><li><br></li></ul><p><strong>Output Format</strong></p><p>Print the sum of the three numbers on a single line.</p><p><strong>Sample Input</strong></p><pre><code>1 2 7
</code></pre><p><strong>Sample Output</strong></p><pre><code>10
</code></pre><p><strong>Explanation</strong></p><p>The sum of the three numbers is&nbsp;.</p></section><section><br></section>"', 10, 0, CAST(0x0000A97500000000 AS DateTime), 1, N'Input and Output')
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 3, 3, N'<section><section><section><p>Calculate and print the sum of the elements in an array, keeping in mind that some of those integers may be quite large.</p><p><strong>Function Description</strong></p><p>Complete the&nbsp;<em>aVeryBigSum</em> function in the editor below. It must return the sum of all array elements.</p><p>aVeryBigSum has the following parameter(s):</p><ul><li><em>ar</em>: an array of integers .</li></ul><p><strong>Input Format</strong></p><p>The first line of the input consists of an integer&nbsp;.&nbsp;<br>The next line contains&nbsp;&nbsp;space-separated integers contained in the array.</p><p><strong>Output Format</strong></p><p>Print the integer sum of the elements in the array.</p><p><strong>Constraints</strong>&nbsp;<br>&nbsp;</p><p><strong>Sample Input</strong></p><pre><code>5 1000000001 1000000002 1000000003 1000000004 1000000005
</code></pre><p><strong>Output</strong></p><pre><code>5000000015
</code></pre><p><strong>Note:</strong></p><p>The range of the 32-bit integer is&nbsp;.</p><p>When we add several integer values, the resulting sum might exceed the above range. You might need to use long long int in C/C++ or long data type in Java to store such sums.</p></section><section><br></section></section></section>', 10, 0, CAST(0x0000A97700000000 AS DateTime), 1, N'Big Sum')
INSERT [dbo].[Problem] ([ProblemId], [AuthorId], [ProblemTypeId], [DifficultyId], [Description], [MaxScore], [NoOfSubmission], [PostDateTime], [NoOfTestCaseFiles], [Title]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 1, 2, N'<section><section><section><p>Given a square matrix, calculate the absolute difference between the sums of its diagonals.</p><p>For example, the square matrix&nbsp;&nbsp;is shown below:</p><pre><code>1 2 3 4 5 6 9 8 9  </code></pre><p>The left-to-right diagonal =&nbsp;. The right to left diagonal =&nbsp;. Their absolute difference is&nbsp;.</p><p><strong>Function description</strong></p><p>Complete the&nbsp;&nbsp;function in the editor below. It must return an integer representing the absolute diagonal difference.</p><p>diagonalDifference takes the following parameter:</p><ul><li><em>arr</em>: an array of integers .</li></ul><p><strong>Input Format</strong></p><p>The first line contains a single integer,&nbsp;, the number of rows and columns in the matrix&nbsp;.&nbsp;<br>Each of the next&nbsp;&nbsp;lines describes a row,&nbsp;, and consists of&nbsp;&nbsp;space-separated integers&nbsp;.</p><p><strong>Constraints</strong></p><ul><li><br></li></ul><p><strong>Output Format</strong></p><p>Print the absolute difference between the sums of the matrix&#39;s two diagonals as a single integer.</p><p><strong>Sample Input</strong></p><pre><code>3 11 2 4 4 5 6 10 8 -12
</code></pre><p><strong>Sample Output</strong></p><pre><code>15
</code></pre><p><strong>Explanation</strong></p><p>The primary diagonal is:</p><pre><code>11   5     -12
</code></pre><p>Sum across the primary diagonal: 11 + 5 - 12 = 4</p><p>The secondary diagonal is:</p><pre><code>     4   5 10
</code></pre><p>Sum across the secondary diagonal: 4 + 5 + 10 = 19&nbsp;<br>Difference: |4 - 19| = 15</p><p><strong>Note:</strong> |x| is the&nbsp;<a href="https://www.mathsisfun.com/numbers/absolute-value.html">absolute value</a> of x</p></section></section></section>', 20, 0, CAST(0x0000A9B300000000 AS DateTime), 1, N'Diagonal Difference')
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba2', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input02', N'output02', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input03', N'output03', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input04', N'output04', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba5', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input05', N'output05', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba6', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'input01', N'output01', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba7', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'input02', N'output02', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba8', N'0e984725-c51c-4bf4-9960-e1c80e27aba3', N'input and output\input00', N'input and output\output00', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba9', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', N'input and output\input00', N'input and output\output00', 1, 1)
INSERT [dbo].[ProblemTestCase] ([ProblemTestCaseId], [ProblemId], [InputFilePath], [OutputFilePath], [SizeInputFile], [SizeOutputFile]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27abb1', N'0e984725-c51c-4bf4-9960-e1c80e27aba1', N'input01', N'output01', 1, 1)
SET IDENTITY_INSERT [dbo].[ProblemType] ON 

INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (1, N'Data Structure', N'Data Structure', 1)
INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (2, N'Algo', N'Algo', 1)
INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (3, N'pf', N'Pf', 1)
INSERT [dbo].[ProblemType] ([ProblemTypeId], [Name], [Description], [IsActive]) VALUES (4, N'Advannced Programming', N'Advanced', 1)
SET IDENTITY_INSERT [dbo].[ProblemType] OFF
SET IDENTITY_INSERT [dbo].[ProgrammingLanguage] ON 

INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (1, N'C++', N'C++', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (2, N'Java', N'java', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (3, N'C', N'C', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (4, N'Python', N'Python', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (5, N'Php', N'Php', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (6, N'Angular', N'Angular', 1)
INSERT [dbo].[ProgrammingLanguage] ([LanguageId], [Name], [Description], [IsActive]) VALUES (7, N'C#', N'C#', 1)
SET IDENTITY_INSERT [dbo].[ProgrammingLanguage] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (2, N'Admin', N'System Admin', CAST(0x0000A96B011F3762 AS DateTime), NULL, 1, NULL, N'0e984725-c51c-4bf4-9960-e1c80e27aba0')
INSERT [dbo].[Roles] ([RoleId], [Name], [Description], [CreatedOn], [ModifiedOn], [IsActive], [ModifiedBy], [CreatedBy]) VALUES (3, N'User', N'Just User', CAST(0x0000A9C700F8C5C8 AS DateTime), NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[Submission] ([SubmissionId], [UserId], [ProblemId], [Score], [Status], [SubmissionDateTime], [Code], [LanguageId]) VALUES (N'28e9a2b7-8918-45ea-9039-f38c58b3f0e3', N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'0e984725-c51c-4bf4-9960-e1c80e27aba4', 20, N'passed', CAST(0x0000A9DB01231ED4 AS DateTime), N'#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    printf("Hello, World!");
    return 0;
}
', 1)
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (2, N'0e984725-c51c-4bf4-9960-e1c80e27aba0', 2)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (3, N'f36f3360-f999-41ec-aabd-8bbb14c1a98c', 3)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (4, N'1d5e37a3-709b-437a-9778-753c0b433b3c', 3)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserId], [RoleId]) VALUES (1004, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', 3)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'Usman', N'123', N'Usman', N'saleem@gmail.com', CAST(0x0000A9DB00CC8A7F AS DateTime), CAST(0x0000A9DB00CC8A7F AS DateTime), 1, N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', N'ed683a37-5571-4eb0-9ae1-48204e76d1b1', NULL)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'Usman', N'123', N'Muhammad Usman', N'musaleem@gmail.com', CAST(0x0000A9D600BE6612 AS DateTime), CAST(0x0000A9D600BE6612 AS DateTime), 1, N'1d5e37a3-709b-437a-9778-753c0b433b3c', N'1d5e37a3-709b-437a-9778-753c0b433b3c', NULL)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'f36f3360-f999-41ec-aabd-8bbb14c1a98c', N'Usman', N'123', N'Muhammad Usman', N'tomusaleem@gmail.com', CAST(0x0000A9C7014B86C5 AS DateTime), CAST(0x0000A9C7014B86C5 AS DateTime), 1, N'f36f3360-f999-41ec-aabd-8bbb14c1a98c', N'f36f3360-f999-41ec-aabd-8bbb14c1a98c', NULL)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [Name], [Email], [CreatedOn], [ModifiedOn], [IsActive], [CreatedBy], [ModifieBy], [DateOfBirth]) VALUES (N'0e984725-c51c-4bf4-9960-e1c80e27aba0', N'Admin', N'123', N'Admin', N'abc@yahoo.com', CAST(0x0000A96B011E4520 AS DateTime), NULL, 1, NULL, NULL, NULL)
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Permissions] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProblemType] ADD  CONSTRAINT [DF_ProblemType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((1)) FOR [IsActive]
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
