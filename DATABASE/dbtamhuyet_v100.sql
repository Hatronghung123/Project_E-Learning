create database Project_Online_Learning
go
USE Project_Online_Learning
GO
/****** Object:  Table [dbo].[tbl_account]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](64) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[role_id] [int] NOT NULL,
	[is_active] [bit] NULL,
	[managed_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_content_type]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_content_type](
	[content_type_id] [int] IDENTITY(1,1) NOT NULL,
	[content_type_name] [varchar](64) NULL,
	[course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_course]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [varchar](64) NOT NULL,
	[description] [text] NULL,
	[image] [text] NULL,
	[price] [float] NULL,
	[course_category_id] [int] NULL,
	[create_by] [int] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_course_category]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_course_category](
	[course_category_id] [int] IDENTITY(1,1) NOT NULL,
	[course_category_name] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_enrollment]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_enrollment](
	[enrollment_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[enrollment_date] [date] NULL,
	[completion_status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[enrollment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_feedback]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
 CONSTRAINT [PK__tbl_rati__D35B278B31266DE4] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lesson]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lesson](
	[lesson_id] [int] IDENTITY(1,1) NOT NULL,
	[content_type_id] [int] NULL,
	[lesson_title] [varchar](64) NULL,
	[lesson_detail] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[lesson_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lesson_QnA]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lesson_QnA](
	[qna_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NULL,
	[lesson_id] [int] NULL,
	[message_text] [text] NULL,
	[timestamp] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[qna_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_mentor_approval]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_mentor_approval](
	[approval_id] [int] IDENTITY(1,1) NOT NULL,
	[mentor_id] [int] NULL,
	[approved_by] [int] NULL,
	[status_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[approval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_messages_private]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_messages_private](
	[messages_private_id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NULL,
	[receiver_id] [int] NULL,
	[message_text] [text] NULL,
	[timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[messages_private_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_payment_method]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_payment_method](
	[payment_method_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_method_name] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_payments]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[course_id] [int] NULL,
	[amount] [float] NULL,
	[payment_method_id] [int] NULL,
	[payment_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_profile]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_profile](
	[profile_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](64) NOT NULL,
	[gender] [bit] NULL,
	[account_id] [int] NULL,
	[avatar] [text] NULL,
	[money] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_quiz_content]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_quiz_content](
	[quiz_content_id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_question] [varchar](64) NULL,
	[quiz_option] [varchar](64) NULL,
	[quiz_id] [int] NULL,
	[quiz_number] [int] NULL,
	[is_correct] [bit] NULL,
 CONSTRAINT [PK__tbl_quiz__A9340C8DDB0258CF] PRIMARY KEY CLUSTERED 
(
	[quiz_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_quiz_responses]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_quiz_responses](
	[response_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[response_content] [int] NULL,
	[is_correct] [bit] NULL,
	[quiz_number] [int] NULL,
	[quiz_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[response_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_quizzes]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_quizzes](
	[quiz_id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_title] [varchar](64) NULL,
	[content_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_role]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_status_mentor]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_status_mentor](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_wishlist]    Script Date: 6/6/2024 2:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_wishlist](
	[wishlist_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[tbl_role] ([role_id])
GO
ALTER TABLE [dbo].[tbl_account]  WITH CHECK ADD  CONSTRAINT [FK_tbl_account_tbl_account] FOREIGN KEY([managed_by])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_account] CHECK CONSTRAINT [FK_tbl_account_tbl_account]
GO
ALTER TABLE [dbo].[tbl_content_type]  WITH CHECK ADD  CONSTRAINT [FK_tbl_content_type_tbl_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_content_type] CHECK CONSTRAINT [FK_tbl_content_type_tbl_course]
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD FOREIGN KEY([course_category_id])
REFERENCES [dbo].[tbl_course_category] ([course_category_id])
GO
ALTER TABLE [dbo].[tbl_course]  WITH CHECK ADD FOREIGN KEY([create_by])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_enrollment]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_enrollment]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_feedback]  WITH CHECK ADD  CONSTRAINT [FK_tbl_feedback_tbl_course] FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_feedback] CHECK CONSTRAINT [FK_tbl_feedback_tbl_course]
GO
ALTER TABLE [dbo].[tbl_feedback]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ratings_tbl_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_feedback] CHECK CONSTRAINT [FK_tbl_ratings_tbl_account]
GO
ALTER TABLE [dbo].[tbl_lesson]  WITH CHECK ADD  CONSTRAINT [FK_tbl_course_content_tbl_content_type1] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[tbl_content_type] ([content_type_id])
GO
ALTER TABLE [dbo].[tbl_lesson] CHECK CONSTRAINT [FK_tbl_course_content_tbl_content_type1]
GO
ALTER TABLE [dbo].[tbl_lesson_QnA]  WITH CHECK ADD  CONSTRAINT [FK_tbl_lesson_QnA_tbl_account] FOREIGN KEY([sender_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_lesson_QnA] CHECK CONSTRAINT [FK_tbl_lesson_QnA_tbl_account]
GO
ALTER TABLE [dbo].[tbl_lesson_QnA]  WITH CHECK ADD  CONSTRAINT [FK_tbl_lesson_QnA_tbl_lesson] FOREIGN KEY([lesson_id])
REFERENCES [dbo].[tbl_lesson] ([lesson_id])
GO
ALTER TABLE [dbo].[tbl_lesson_QnA] CHECK CONSTRAINT [FK_tbl_lesson_QnA_tbl_lesson]
GO
ALTER TABLE [dbo].[tbl_mentor_approval]  WITH CHECK ADD FOREIGN KEY([approved_by])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_mentor_approval]  WITH CHECK ADD FOREIGN KEY([mentor_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_mentor_approval]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[tbl_status_mentor] ([status_id])
GO
ALTER TABLE [dbo].[tbl_messages_private]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_messages_private]  WITH CHECK ADD  CONSTRAINT [FK_tbl_messages_private_tbl_account] FOREIGN KEY([sender_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_messages_private] CHECK CONSTRAINT [FK_tbl_messages_private_tbl_account]
GO
ALTER TABLE [dbo].[tbl_messages_private]  WITH CHECK ADD  CONSTRAINT [FK_tbl_messages_private_tbl_account1] FOREIGN KEY([receiver_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_messages_private] CHECK CONSTRAINT [FK_tbl_messages_private_tbl_account1]
GO
ALTER TABLE [dbo].[tbl_payments]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_payments]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
ALTER TABLE [dbo].[tbl_payments]  WITH CHECK ADD FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[tbl_payment_method] ([payment_method_id])
GO
ALTER TABLE [dbo].[tbl_profile]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_quiz_content]  WITH CHECK ADD  CONSTRAINT [FK__tbl_quiz___quiz___02FC7413] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[tbl_quizzes] ([quiz_id])
GO
ALTER TABLE [dbo].[tbl_quiz_content] CHECK CONSTRAINT [FK__tbl_quiz___quiz___02FC7413]
GO
ALTER TABLE [dbo].[tbl_quiz_responses]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_quiz_responses]  WITH CHECK ADD  CONSTRAINT [FK_tbl_quiz_responses_tbl_quizzes] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[tbl_quizzes] ([quiz_id])
GO
ALTER TABLE [dbo].[tbl_quiz_responses] CHECK CONSTRAINT [FK_tbl_quiz_responses_tbl_quizzes]
GO
ALTER TABLE [dbo].[tbl_quizzes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_quizzes_tbl_content_type] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[tbl_content_type] ([content_type_id])
GO
ALTER TABLE [dbo].[tbl_quizzes] CHECK CONSTRAINT [FK_tbl_quizzes_tbl_content_type]
GO
ALTER TABLE [dbo].[tbl_wishlist]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[tbl_account] ([account_id])
GO
ALTER TABLE [dbo].[tbl_wishlist]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[tbl_course] ([course_id])
GO
USE [master]
GO
ALTER DATABASE [Project_Online_Learning] SET  READ_WRITE 
GO
