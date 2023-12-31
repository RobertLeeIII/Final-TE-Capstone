USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END
/****** Object:  Database [final_capstone]    Script Date: 12/8/2023 9:09:03 AM ******/
CREATE DATABASE [final_capstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'final_capstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final_capstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'final_capstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\final_capstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [final_capstone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [final_capstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [final_capstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [final_capstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [final_capstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [final_capstone] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [final_capstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [final_capstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [final_capstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [final_capstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [final_capstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [final_capstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [final_capstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [final_capstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [final_capstone] SET  ENABLE_BROKER 
GO
ALTER DATABASE [final_capstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [final_capstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [final_capstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [final_capstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [final_capstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [final_capstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [final_capstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [final_capstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [final_capstone] SET  MULTI_USER 
GO
ALTER DATABASE [final_capstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [final_capstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [final_capstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [final_capstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [final_capstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [final_capstone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [final_capstone] SET QUERY_STORE = OFF
GO
USE [final_capstone]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diet_ingredient]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diet_ingredient](
	[diet_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[diet_id] ASC,
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diets]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diets](
	[diet_id] [int] IDENTITY(601,1) NOT NULL,
	[diet_name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[diet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_diet]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_diet](
	[dish_id] [int] NOT NULL,
	[diet_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC,
	[diet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dish_rating]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dish_rating](
	[dish_id] [int] NOT NULL,
	[rater] [int] NOT NULL,
	[rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC,
	[rater] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dishes]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dishes](
	[dish_id] [int] IDENTITY(1501,1) NOT NULL,
	[dish_name] [nvarchar](50) NOT NULL,
	[recipe] [nvarchar](max) NOT NULL,
	[rating] [numeric](2, 1) NULL,
	[course_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[friends_list]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friends_list](
	[self_id] [int] NOT NULL,
	[friend_id] [int] NOT NULL,
	[friend_start] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[self_id] ASC,
	[friend_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredient_dish]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredient_dish](
	[ingredient_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
	[quantity] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[ingredient_id] [int] IDENTITY(201,1) NOT NULL,
	[ingredient_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_course]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_course](
	[potluck_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[how_many] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_diet]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_diet](
	[potluck_id] [int] NOT NULL,
	[diet_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[diet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_dish]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_dish](
	[potluck_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potluck_user]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potluck_user](
	[potluck_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[potlucks]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[potlucks](
	[potluck_id] [int] IDENTITY(1001,1) NOT NULL,
	[host_id] [int] NOT NULL,
	[potluck_name] [nvarchar](100) NOT NULL,
	[summary] [nvarchar](max) NULL,
	[location] [nvarchar](100) NOT NULL,
	[time] [datetime] NOT NULL,
	[theme] [nvarchar](100) NULL,
	[is_recurring] [bit] NULL,
	[repeat_interval] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[potluck_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titles]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titles](
	[title_id] [int] IDENTITY(401,1) NOT NULL,
	[title_name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_allergies]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_allergies](
	[user_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ingredient_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_diet]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_diet](
	[user_id] [int] NOT NULL,
	[diet_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[diet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_dish]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_dish](
	[user_id] [int] NOT NULL,
	[dish_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[dish_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_title]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_title](
	[user_id] [int] NOT NULL,
	[title_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/8/2023 9:09:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NOT NULL,
	[password_hash] [nvarchar](100) NOT NULL,
	[salt] [nvarchar](50) NOT NULL,
	[user_role] [nvarchar](20) NOT NULL,
	[user_summary] [nvarchar](max) NULL,
	[diet_rest] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (1, N'apps')
INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (2, N'main')
INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (3, N'side')
INSERT [dbo].[courses] ([course_id], [course_name]) VALUES (4, N'dessert')
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[diets] ON 

INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (601, N'Gluten Free')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (602, N'Vegetarian')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (603, N'Vegan')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (604, N'Tree Nut Allergy')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (605, N'Seafood Allergy')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (606, N'Nut Allergy')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (607, N'Lactose Intolerant')
INSERT [dbo].[diets] ([diet_id], [diet_name]) VALUES (608, N'Soy Allergy')
SET IDENTITY_INSERT [dbo].[diets] OFF
GO
SET IDENTITY_INSERT [dbo].[dishes] ON 

INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1504, N'Matt''s Lunch', N'Rotini, Red Sauce, Chicken, Broccoli', CAST(3.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1505, N'Matt''s Dinner', N'3 eggs, 4 egg whites, 2 english muffins, salsa, apple', CAST(3.5 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1506, N'Matt''s Breakfast', N'80 grams of quick oats, 1 scoop of whey protein, 15g walnuts, 1 banana', CAST(4.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1507, N'Matt''s Midnight Snack', N'Pint of Ben & Jerry''s', CAST(5.0 AS Numeric(2, 1)), 2)
INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1508, N'Ted''s Chili', N'Idk ask his wife', CAST(5.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1509, N'Ted''s Soup', N'Idk ask him', CAST(5.0 AS Numeric(2, 1)), 1)
INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1510, N'Aseel''s Tiramisu Cheesecake', N'...ask him', CAST(5.0 AS Numeric(2, 1)), 2)
INSERT [dbo].[dishes] ([dish_id], [dish_name], [recipe], [rating], [course_id]) VALUES (1511, N'This is an Appetizer', N'who cares', CAST(3.0 AS Numeric(2, 1)), 3)
SET IDENTITY_INSERT [dbo].[dishes] OFF
GO
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 1, 3)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 3, 5)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1002, 4, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 1, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 3, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1003, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 1, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 3, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1004, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 1, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 2, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 3, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1011, 4, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 1, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 2, 5)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 3, 4)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1012, 4, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 1, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 2, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 3, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1013, 4, 2)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 1, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 2, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 3, 1)
INSERT [dbo].[potluck_course] ([potluck_id], [course_id], [how_many]) VALUES (1014, 4, 1)
GO
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1504)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1505)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1506)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1507)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1508)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1509)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1510)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1002, 1511)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1505)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1507)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1509)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1003, 1511)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1004, 1504)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1004, 1506)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1005, 1508)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1005, 1510)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1006, 1504)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1006, 1505)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1006, 1506)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1006, 1507)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1007, 1510)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1007, 1511)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1008, 1508)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1008, 1509)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1009, 1509)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1009, 1510)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1009, 1511)
INSERT [dbo].[potluck_dish] ([potluck_id], [dish_id]) VALUES (1010, 1505)
GO
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1002, 7, N'inactive')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1003, 7, N'inactive')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1004, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1005, 6, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1006, 6, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1007, 6, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1008, 4, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1009, 4, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1010, 4, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1011, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1012, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1013, 7, N'Active')
INSERT [dbo].[potluck_user] ([potluck_id], [user_id], [status]) VALUES (1014, 6, N'Active')
GO
SET IDENTITY_INSERT [dbo].[potlucks] ON 

INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1002, 7, N'Matt''s Potluck', N'dig it', N'My House', CAST(N'2023-12-10T14:00:00.000' AS DateTime), N'Winter', 0, 0, N'inactive')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1003, 7, N'Mott''s Patluck', N'come eat', N'Under a Bridge', CAST(N'2023-12-12T16:00:00.000' AS DateTime), N'Winter', 0, 0, N'inactive')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1004, 7, N'Patt''s Motluck', N'I am fine with you people', N'Under the earth', CAST(N'2023-12-15T12:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1005, 6, N'Kyle''s Potluck', N'food moment', N'His Place', CAST(N'2023-12-08T11:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1006, 6, N'Kyle loves potlucks', N'It''s true.', N'His Place', CAST(N'2023-12-09T17:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1007, 6, N'Enough is enough, Kyle.', N'The final Hootinany', N'His Garage', CAST(N'2023-12-17T18:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1008, 4, N'Kelsey''s Potluck', N'We eatin out here', N'Her House', CAST(N'2023-12-08T14:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1009, 4, N'Kelsey''s other potluck', N'Bring cigs', N'Her porch', CAST(N'2023-12-16T16:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1010, 4, N'Cigarette Caseroles Only', N'I''m not joking', N'Dahn the block', CAST(N'2023-12-25T06:00:00.000' AS DateTime), N'Winter', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1011, 7, N'Newest Potluck', N'asdf', N'Wherever I want', CAST(N'2023-12-08T16:17:00.000' AS DateTime), N'Spring', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1012, 7, N'aa', N'a', N'asdf', CAST(N'2023-12-12T16:18:00.000' AS DateTime), N'Fall', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1013, 7, N'asdf', N'asdf', N'asdf', CAST(N'2023-12-20T19:09:00.000' AS DateTime), N'Summer', 0, 0, N'active')
INSERT [dbo].[potlucks] ([potluck_id], [host_id], [potluck_name], [summary], [location], [time], [theme], [is_recurring], [repeat_interval], [status]) VALUES (1014, 6, N'Testing!', N'summary', N'wherever I''m not picky', CAST(N'2023-12-13T08:11:00.000' AS DateTime), N'Summer', 0, 0, N'active')
SET IDENTITY_INSERT [dbo].[potlucks] OFF
GO
SET IDENTITY_INSERT [dbo].[titles] ON 

INSERT [dbo].[titles] ([title_id], [title_name]) VALUES (401, N'host')
INSERT [dbo].[titles] ([title_id], [title_name]) VALUES (402, N'guest')
SET IDENTITY_INSERT [dbo].[titles] OFF
GO
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (3, 1508)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (3, 1509)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (4, 1510)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (4, 1511)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (5, 1511)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1504)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1505)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1506)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (6, 1507)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1504)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1505)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1506)
INSERT [dbo].[user_dish] ([user_id], [dish_id]) VALUES (7, 1507)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (1, N'user', NULL, NULL, N'', N'Jg45HuwT7PZkfuKTz6IB90CtWY4=', N'LHxP4Xh7bN0=', N'user', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (2, N'admin', NULL, NULL, N'', N'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', N'Ar/aB2thQTI=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (3, N'ted', NULL, NULL, N'', N'tH8BvtmnyMcS5Q9Oxlyiup5IqUQ=', N'yA4lHw0idGs=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (4, N'kelsey', NULL, NULL, N'', N'IscjyGodaIc9xNhASbt+fSnxgtI=', N'XdiczNYbBno=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (5, N'robert', NULL, NULL, N'', N'pfA+TsxwG1V0u7AE7Tqagl1fT1A=', N'4L75U8vaKT0=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (6, N'kyle', NULL, NULL, N'', N'Fjhd4G3BwUgJ4SYdtL1oWk8eFPo=', N'xWO2yPBd7Sg=', N'admin', NULL, 0)
INSERT [dbo].[users] ([user_id], [username], [first_name], [last_name], [email], [password_hash], [salt], [user_role], [user_summary], [diet_rest]) VALUES (7, N'matt', NULL, NULL, N'', N'XrITqHZWKG4kOj1U95ema/cbb20=', N'8Vsd/EnDrOM=', N'admin', NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572CA77361B]    Script Date: 12/8/2023 9:09:03 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[potluck_user] ADD  DEFAULT ('Invited') FOR [status]
GO
ALTER TABLE [dbo].[potlucks] ADD  DEFAULT ((0)) FOR [is_recurring]
GO
ALTER TABLE [dbo].[potlucks] ADD  DEFAULT ((0)) FOR [repeat_interval]
GO
ALTER TABLE [dbo].[potlucks] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('user') FOR [user_role]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [diet_rest]
GO
ALTER TABLE [dbo].[diet_ingredient]  WITH CHECK ADD FOREIGN KEY([diet_id])
REFERENCES [dbo].[diets] ([diet_id])
GO
ALTER TABLE [dbo].[diet_ingredient]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[dish_diet]  WITH CHECK ADD FOREIGN KEY([diet_id])
REFERENCES [dbo].[diets] ([diet_id])
GO
ALTER TABLE [dbo].[dish_diet]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[dish_rating]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[dish_rating]  WITH CHECK ADD FOREIGN KEY([rater])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[dishes]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[friends_list]  WITH CHECK ADD FOREIGN KEY([friend_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[friends_list]  WITH CHECK ADD FOREIGN KEY([self_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[ingredient_dish]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[ingredient_dish]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[potluck_course]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([course_id])
GO
ALTER TABLE [dbo].[potluck_course]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_diet]  WITH CHECK ADD FOREIGN KEY([diet_id])
REFERENCES [dbo].[diets] ([diet_id])
GO
ALTER TABLE [dbo].[potluck_diet]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_dish]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[potluck_dish]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_user]  WITH CHECK ADD FOREIGN KEY([potluck_id])
REFERENCES [dbo].[potlucks] ([potluck_id])
GO
ALTER TABLE [dbo].[potluck_user]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[potlucks]  WITH CHECK ADD FOREIGN KEY([host_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_allergies]  WITH CHECK ADD FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([ingredient_id])
GO
ALTER TABLE [dbo].[user_allergies]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_diet]  WITH CHECK ADD FOREIGN KEY([diet_id])
REFERENCES [dbo].[diets] ([diet_id])
GO
ALTER TABLE [dbo].[user_diet]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_dish]  WITH CHECK ADD FOREIGN KEY([dish_id])
REFERENCES [dbo].[dishes] ([dish_id])
GO
ALTER TABLE [dbo].[user_dish]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_title]  WITH CHECK ADD FOREIGN KEY([title_id])
REFERENCES [dbo].[titles] ([title_id])
GO
ALTER TABLE [dbo].[user_title]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
USE [master]
GO
ALTER DATABASE [final_capstone] SET  READ_WRITE 
GO
