USE [AppMVC]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](200) NULL,
	[Link] [nvarchar](250) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Position] [int] NOT NULL,
	[SeoTitle] [nvarchar](200) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](250) NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[Rating] [int] NOT NULL,
	[AppUserIdFK] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Message] [ntext] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Detail] [ntext] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[SeoTitle] [nvarchar](200) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[CategoryId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Type] [nvarchar](250) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](200) NOT NULL,
	[CustomerName] [nvarchar](200) NOT NULL,
	[PhoneNumber] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CustomerEmail] [nvarchar](200) NOT NULL,
	[MethodPay] [int] NOT NULL,
	[IsConfirmByUser] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[IsConfirmByShop] [bit] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[AppUserIdFK] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Icon] [nvarchar](200) NULL,
	[SeoTitle] [nvarchar](200) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Detail] [ntext] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[SeoTitle] [nvarchar](200) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[CategoryId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [ntext] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[Detail] [ntext] NOT NULL,
	[Image] [nvarchar](250) NULL,
	[IsDeleted] [bit] NULL,
	[IsNew] [bit] NOT NULL,
	[IsHome] [bit] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsSale] [bit] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PriceSale] [decimal](18, 2) NOT NULL,
	[ProductCategoryId] [uniqueidentifier] NOT NULL,
	[ProductCode] [nvarchar](200) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](200) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[ViewCount] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Icon] [nvarchar](max) NULL,
	[SeoTitle] [nvarchar](200) NULL,
	[SeoDescription] [nvarchar](250) NULL,
	[SeoKeywords] [nvarchar](250) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Image] [nvarchar](250) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statisticals]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statisticals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[TotalOrderComplicated] [int] NOT NULL,
	[TotalQuantity] [int] NOT NULL,
	[Time] [datetime2](7) NULL,
 CONSTRAINT [PK_Statisticals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriber]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriber](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Subcribe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemSetting]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSetting](
	[SettingKey] [uniqueidentifier] NOT NULL,
	[SettingValue] [nvarchar](200) NULL,
	[SettingDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_SystemSetting] PRIMARY KEY CLUSTERED 
(
	[SettingKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Image] [ntext] NULL,
	[BirthDay] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FbLink] [nvarchar](max) NULL,
	[IgLink] [nvarchar](max) NULL,
	[Job] [nvarchar](max) NULL,
	[OtherLink] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithList]    Script Date: 6/13/2024 1:49:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](200) NOT NULL,
	[ProductId] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_WithList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240304040042_Initial', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240307031702_add', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240318025319_add-all-db', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240319155004_Update-New-and-Post', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240319160746_Add-IsActive', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240319164127_update-isActive', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240325024833_Update-Product-ProductImage', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240403092258_Product-IsFeature-to-IsNew', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240403101744_Add-Policy', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240403150144_Update-Advertisement', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406131811_delete-tyoe-advertisement', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240416085809_Update-product-detail', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240417085625_Add_Comment', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240417094406_update-cmt', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240418035201_update-cmt-fk', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240429135905_update-order', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240429145043_add-product-view', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240430153500_add-order-status-confirm', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240501115135_update-order-db', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240501130809_fix-db', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240501131324_fix-order-2', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240506100304_add-relation-user-order', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240507034603_add-model-notifi', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240515100540_add-wishList', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240613044600_add-statical-model', N'6.0.26')
GO
INSERT [dbo].[Advertisement] ([Id], [Title], [Description], [Image], [Link], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive], [Position]) VALUES (N'33608391-89c6-44cd-ad51-5546d574e5f9', NULL, NULL, N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712413327/.Net-MVC/Green_Simple_Fashion_Sale_Promotion_Banner_Landscape.png', NULL, CAST(N'2024-04-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-06T21:22:09.3191693' AS DateTime2), N'Admin', N'Admin', NULL, 1, 2)
INSERT [dbo].[Advertisement] ([Id], [Title], [Description], [Image], [Link], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive], [Position]) VALUES (N'599ff364-6d92-4abf-a4f4-d3149d3564a4', NULL, NULL, N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712413758/.Net-MVC/black_-white-and-orange-typographic-and-modern-black-friday-sale-banner_optimized.png', NULL, CAST(N'2024-04-06T21:29:18.4339236' AS DateTime2), CAST(N'2024-04-06T21:29:18.4339254' AS DateTime2), N'Admin', N'Admin', NULL, 1, 3)
INSERT [dbo].[Advertisement] ([Id], [Title], [Description], [Image], [Link], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive], [Position]) VALUES (N'01fc2d2f-a27c-4cb9-a657-e911c118ceda', N'SPRING / SUMMER COLLECTION 2017', N'Get up to 30% Off New Arrivals', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712410135/.Net-MVC/slider_1.jpg', N'#', CAST(N'2024-04-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-06T21:32:01.2513754' AS DateTime2), N'Admin', N'Admin', NULL, 1, 1)
GO
INSERT [dbo].[Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'beb19ade-0b22-4e87-8b2e-2dfe2a8b9a09', N'About', N'About Page', 2, NULL, NULL, NULL, NULL, CAST(N'2024-03-19T23:46:19.3495463' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'53c635dc-90ae-4270-a540-31d9e109c4f1', N'Contact', N'contact', 6, NULL, NULL, NULL, CAST(N'2024-04-02T21:23:26.1807780' AS DateTime2), CAST(N'2024-04-02T21:23:26.1807788' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'ee958fee-6c54-4e8d-b18e-82f239e9432c', N'Home', N'Home Page Updated', 1, NULL, NULL, NULL, NULL, CAST(N'2024-03-20T10:38:59.5528572' AS DateTime2), NULL, N'Admin', NULL, 1)
INSERT [dbo].[Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'2e2a42d1-c261-4b03-8039-d959dffaae9e', N'Blog', N'Blog Page', 3, NULL, NULL, NULL, CAST(N'2024-03-19T23:46:30.2473310' AS DateTime2), CAST(N'2024-03-19T23:46:30.2473352' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[Category] ([Id], [Title], [Description], [Position], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'0bc1209e-d083-4241-aa10-e552041ca020', N'Shop', N'blabal', 4, NULL, NULL, NULL, CAST(N'2024-04-02T21:20:00.6139600' AS DateTime2), CAST(N'2024-04-02T21:20:00.6139612' AS DateTime2), N'Admin', N'Admin', NULL, 1)
GO
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'9eb9b93e-075e-4e57-9c20-11a835b6563d', N'YESSSS', N'41897599-8ff3-4561-8649-ddfd24457cde', CAST(N'2024-06-12T16:04:07.1701850' AS DateTime2), NULL, N'Admin', NULL, NULL, 5, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'21dc345b-3fdb-453b-b708-4dd4b869d9d8', N'fdsfsdfsdfsdfsd', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-18T11:05:31.4543816' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'9281fc7f-f035-458b-8802-5e0c5a812236', N'this ok
', N'82561316-c93b-47c1-8211-799cbc18c85f', CAST(N'2024-04-30T20:51:35.3004966' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'0141dee9-18d6-44c1-aeaa-6f96d2325251', N'fdsfsdfsdfsdfsdsdfdsf', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-18T11:05:33.4934314' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'26b018de-c69d-4e60-9f48-727d6035ab87', N'fdsfsdf', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-18T11:05:29.2401401' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'16b1e530-8522-49aa-b2ca-b0bb8dfb0809', N'fdsfsdf', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-18T11:05:26.4383967' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'98f77c40-62bb-48fa-9b0f-c6863e94ad1f', N'Its very ok', N'9cdf9565-cd71-4c33-b362-2f47444b7d87', CAST(N'2024-06-12T09:39:29.7625525' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'20b7a96b-feda-4f34-a056-c918bf9bc051', N'kkkkk', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-18T11:12:45.3525713' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'4e8a5777-555e-43ca-9f74-d627accce276', N'okok', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-21T10:54:07.0452525' AS DateTime2), NULL, N'quancuco27012004@gmail.com', NULL, NULL, 4, N'a9858088-f95c-4c37-a7b2-ae46a61672a5')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'537ec8c3-9e5a-4cde-84ac-ea0b46a9eb5d', N'okok', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-18T11:04:25.3374913' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Comment] ([Id], [Content], [ProductId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [Rating], [AppUserIdFK]) VALUES (N'4eb31f6a-e956-4327-be99-f9f2b4abfb67', N'blabal', N'5e67c88e-7012-4629-9c78-48b46077b91f', CAST(N'2024-04-18T10:57:55.8210331' AS DateTime2), NULL, N'Admin', NULL, NULL, 4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
GO
INSERT [dbo].[Contacts] ([Id], [UserName], [Email], [PhoneNumber], [Message], [CreatedAt], [CreatedBy], [IsRead]) VALUES (N'9745f2d8-57b0-4465-937a-2481e7a450cd', N'Admin', N'admin@gmail.com', N'0338455991', N'HELLO', CAST(N'2024-05-07T10:00:48.1799171' AS DateTime2), NULL, 0)
INSERT [dbo].[Contacts] ([Id], [UserName], [Email], [PhoneNumber], [Message], [CreatedAt], [CreatedBy], [IsRead]) VALUES (N'fb578427-4301-42a8-9246-874f190437c0', N'dsd', N'ds@gmail.com', N'', N'ádasd', CAST(N'2024-04-15T09:58:34.3878247' AS DateTime2), NULL, 0)
INSERT [dbo].[Contacts] ([Id], [UserName], [Email], [PhoneNumber], [Message], [CreatedAt], [CreatedBy], [IsRead]) VALUES (N'eaab18c9-efdd-4c78-b480-9629652fa9b6', N'Quan', N'quancuco27012004@gmail.com', N'0338455991', N'okokokok', CAST(N'2024-03-04T13:00:19.7428771' AS DateTime2), N'Quan', 0)
INSERT [dbo].[Contacts] ([Id], [UserName], [Email], [PhoneNumber], [Message], [CreatedAt], [CreatedBy], [IsRead]) VALUES (N'951c749e-7e19-4ba1-99a2-9644654ac449', N'Mail', N'mail@gmai.com', N'11111', N'I am a mail', CAST(N'2024-03-19T10:46:49.3168661' AS DateTime2), N'Mail', 0)
INSERT [dbo].[Contacts] ([Id], [UserName], [Email], [PhoneNumber], [Message], [CreatedAt], [CreatedBy], [IsRead]) VALUES (N'5b30724a-56bb-4ac5-a83e-c6d4f74fb880', N'LTA', N'LTA@gmail.com', N'', N'OKOKOK', CAST(N'2024-04-10T11:44:51.7029895' AS DateTime2), NULL, 0)
INSERT [dbo].[Contacts] ([Id], [UserName], [Email], [PhoneNumber], [Message], [CreatedAt], [CreatedBy], [IsRead]) VALUES (N'01c75866-ec78-476c-a3a6-e4de9791733f', N'Manager', N'manager@gmail.com', N'11223312312313', N'Hello Im Manager', CAST(N'2024-03-05T18:26:48.5081775' AS DateTime2), N'Manager', 0)
INSERT [dbo].[Contacts] ([Id], [UserName], [Email], [PhoneNumber], [Message], [CreatedAt], [CreatedBy], [IsRead]) VALUES (N'f59a56af-7f10-4bd9-9b41-ed2817aaf763', N'Admin', N'admin@gmail.com', N'1221111211', N'Hello Im Admin', CAST(N'2024-03-05T18:26:20.1188714' AS DateTime2), N'Admin', 0)
GO
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'cb14ebfd-20fa-45db-baa2-19fe922f9bc9', N'Harper & Harley', N'Fans of the minimalist aesthetic will love Australian blogger Sara Crampton’s website Harper & Harley.', N'<h2><strong>6. </strong><a href="http://harperandharley.com/"><strong>Harper &amp; Harley</strong></a></h2><figure class="image"><img style="aspect-ratio:810/373;" src="https://influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-1024x472.jpg.webp" alt="Fashion Blogs Harper &amp; Harley home design" srcset="//influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-1024x472.jpg.webp 1024w, //influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-300x138.jpg.webp 300w, //influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-768x354.jpg.webp 768w, //influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-1536x708.jpg.webp 1536w, //influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-810x373.jpg.webp 810w, //influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-1140x525.jpg.webp 1140w, //influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2-150x69.jpg.webp 150w, //influencermarketinghub.com/wp-content/uploads/2018/06/Home-Harper-and-Harley-Google-Chrome-2022-07-2.jpg.webp 1893w" sizes="100vw" width="810" height="373"></figure><p>Fans of the minimalist aesthetic will love Australian blogger Sara Crampton’s website Harper &amp; Harley. Her “less is more” philosophy is unmistakable in her posts, from her fashion to her home design. Since starting the blog in 2008, Sara has made a name for herself as the go-to brand for the classic, timeless, and minimalist wardrobe.</p><p>Sara has appeared on the Australian reality show&nbsp;<i>Fashion Bloggers.</i>&nbsp;She has also worked with global fashion brands such as Gucci, Estée Lauder, Uniqlo, and Nike. Sara’s influence has also extended to non-fashion brands, and she has also been tapped by Jaguar, YSL Beauté, L’Oreal, and Dyson.</p><p>If you love whites, blacks, and grays, head on over to Harper &amp; Harley for a look at Sara’s minimalist but super trendy fashion style. Some of her posts include:</p><ul><li>That Blazer Life</li><li>A Summer Staple</li><li>White Shirts and Blue Jeans Never Go Out of Fashion</li><li>My Pregnancy Style</li></ul>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1715764089/.Net-MVC/Home-Harper-and-Harley-Google-Chrome-2022-07-2-1024x472.jpg.webp', NULL, NULL, NULL, NULL, CAST(N'2024-05-15T16:08:08.5352644' AS DateTime2), CAST(N'2024-05-15T16:08:08.5352666' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'fc09c3ef-98d8-4913-8e8e-3357ae9b1f29', N'Girl With Curves', N'In 2021, they launched the Girl With Curves at QVC collection, featuring pieces with true size inclusivity.', N'<h2><strong>5. </strong><a href="https://girlwithcurves.com/"><strong>Girl With Curves</strong></a></h2><figure class="image"><img style="aspect-ratio:800/385;" src="https://influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-1024x493.jpg.webp" alt="Girl With Curves plus-sized fashion" srcset="//influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-1024x493.jpg.webp 1024w, //influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-300x144.jpg.webp 300w, //influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-768x370.jpg.webp 768w, //influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-1536x739.jpg.webp 1536w, //influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-810x390.jpg.webp 810w, //influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-1140x549.jpg.webp 1140w, //influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27-150x72.jpg.webp 150w, //influencermarketinghub.com/wp-content/uploads/2018/06/Girl-With-Curves-home-Google-Chrome-2022-07-27.jpg.webp 1839w" sizes="100vw" width="800" height="385"></figure><p>Let’s face it—the body type of models is far from reality. Slim people do exist in real life, but there are women with bigger sizes who can look just as good. People come in all shapes and sizes, but many of us have been conditioned to believe that only one body type is ideal for fashion.</p><p>This is the mindset that Girl With Curves hopes to shatter. Tanesha Awasthi created Girl With Curves in 2011 to represent everyday people who aren’t a size 0 or 2. The blog describes itself as an “award-winning blog made possible by people who believe women deserve to look and feel beautiful, regardless of weight, shape or size.”</p><p>Since starting the blog, Tanesha has become a favorite plus-sized fashion blogger in the industry. She hopes to help women—particularly bigger sized women—build their confidence and self-esteem through fashion.</p><p>The blog includes trends, style tips, beauty advice, plus parenting and wellness. Their hashtag #StyleHasNoSize emphasizes their belief that fashion and style are for everyone, regardless of their body type.</p><p>In 2021, they launched the Girl With Curves at QVC collection, featuring pieces with true size inclusivity.</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1715764049/.Net-MVC/Girl-With-Curves-home-Google-Chrome-2022-07-27-1024x493.jpg.webp', NULL, NULL, NULL, NULL, CAST(N'2024-05-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T16:07:28.3224000' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'1b84d666-fb35-4939-9960-5b2311727f9f', N'Hello Fashion', N'Hello Fashion by Colombian-American blogger Christine Andrew features posts covering everything from fashion to beauty, family, lifestyle, and travel. ', N'<h2><strong>7. </strong><a href="https://www.hellofashionblog.com/"><strong>Hello Fashion</strong></a></h2><figure class="image"><img style="aspect-ratio:800/362;" src="https://influencermarketinghub.com/wp-content/uploads/2018/06/hello-fashion.jpg.webp" alt="hello fashion blog about fashion and beauty" srcset="//influencermarketinghub.com/wp-content/uploads/2018/06/hello-fashion.jpg.webp 800w, //influencermarketinghub.com/wp-content/uploads/2018/06/hello-fashion-300x136.jpg.webp 300w, //influencermarketinghub.com/wp-content/uploads/2018/06/hello-fashion-768x348.jpg.webp 768w, //influencermarketinghub.com/wp-content/uploads/2018/06/hello-fashion-150x68.jpg.webp 150w" sizes="100vw" width="800" height="362"></figure><p>Hello Fashion by Colombian-American blogger Christine Andrew features posts covering everything from fashion to beauty, family, lifestyle, and travel.&nbsp;</p><p>Christine created her own fashion brand called ILY Couture in 2011. In the same year, she started Hello Fashion, initially as an online diary where she shared her favorite fashion finds as well as helped customers wear and style their ILY Couture buys.&nbsp;</p><p>Christine is a true style icon, having appeared on Vanity Fair’s Best-Dressed List. Ironically, she was rejected from a fashion design school—it was this rejection that drove her to strive in the fashion industry.</p><p>Some recent posts in Hello Fashion include:</p><ul><li>The Secret to Making Your Athleisure Look More Luxe</li><li>4 Ways to Wear a Button-Up Shirt</li><li>Casual Valentine Looks</li></ul>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1715764137/.Net-MVC/hello-fashion.jpg.webp', NULL, NULL, NULL, NULL, CAST(N'2024-05-15T16:08:56.2711170' AS DateTime2), CAST(N'2024-05-15T16:08:56.2711189' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'b41c9f77-3b5e-4eda-a9d2-8bce07b804a9', N'5 VACATION ISLANDS NEAR SYDNEY', N'I travel to unique pockets of the world and write about them to spur your wanderlust.', N'<p><a href="https://thebeachlifeblog.com/2023/07/27/5-vacation-islands-near-sydney/"><img src="https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/Airloft-aerial-beach-with-lilo-and-person-1-1.jpg?resize=400%2C600&amp;ssl=1" alt="" srcset="https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/Airloft-aerial-beach-with-lilo-and-person-1-1.jpg?resize=400%2C600&amp;ssl=1 400w, https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/Airloft-aerial-beach-with-lilo-and-person-1-1.jpg?zoom=2&amp;resize=400%2C600&amp;ssl=1 800w" sizes="100vw" width="400" height="600"><i>5 VACATION ISLANDS NEAR SYDNEY</i></a></p><p><i>27JUL</i></p><p>Lord Howe Island NSW has so much to offer, including dreamy tropical and native bush islands that are an easy hop from Sydney. So let''s take a look at the top 5 most unique islands from lux to a budget for a mini vacation. LORD HOWE ISLAND A tranquil paradise,&nbsp;Lord Howe ...<br>&nbsp;</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712720747/.Net-MVC/blog_2.jpg', NULL, NULL, NULL, NULL, CAST(N'2024-04-10T10:45:48.2960666' AS DateTime2), CAST(N'2024-04-10T10:45:48.2960680' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'b3a3a1dc-d162-491a-bd4c-b029f84e973b', N'Maximum Style', N'Welcome to Minimalist Sophistication with Maximum Style', N'<h2><strong>How to Style a Camel Blazer | Outfit Ideas For Any Occasion</strong></h2><p>Camel blazers for fall and camel coats for winter have been two of my personal wardrobe staples for years now, so when I sat down with my team to design <a href="https://www.maysonthelabel.com/"><strong>MAYSON </strong><i><strong>the label’s</strong></i></a> Fall ‘23 collection, a camel blazer was at the very top of the list! Today I’m featuring my very own MAYSON <i>the label</i> <a href="https://www.maysonthelabel.com/collections/outerwear/products/twill-boyfriend-blazer"><strong>Camel Twill Boyfriend Blazer</strong></a>, which is a total pinch-me moment. Of course I’m biased, but this is the best camel blazer I’ve owned (and I’ve owned A LOT). Wear it with the three-piece camel suit by MAYSON the label, or pair it with comfy jeans, a simple tee, and sneakers for a more casual, on-the-go look. The possibilities with a piece like this are truly endless! Now, let’s break down what’s so perfect about this blazer.</p><p><i><strong>Editor''s Note: This blazer is meant to be oversized. Its menswear inspired, so the shoulders are going to be slightly extended &amp; sleeves a little longer. I would take your true size, or size down. I''m wearing a small.</strong></i></p><figure class="image"><img style="aspect-ratio:520/520;" src="https://fashionjackson.com/wp-content/uploads/2023/09/CAMEL-BOYFRIEND-BLAZER.jpg" width="520" height="520"></figure><p>MAYSON THE LABEL</p><h2><strong>Twill Boyfriend Blazer</strong></h2><p>First, the fit. This blazer has a relaxed, boyfriend-inspired silhouette with internal shoulder pads for structure. It’s also made with a mid-weight, stretchy fabric so this camel blazer is never restrictive. It feels great to wear as you normally would or draped over your shoulders for a different kind of look! While this blazer has a single button fastening at the front, it also has functional front pockets that aren’t just for show. The super-luxe, fluid fabric immediately deems this camel blazer as a key building block for every fall/winter wardrobe, especially because of its versatility!</p><p><a href="https://www.maysonthelabel.com/collections/outerwear/products/twill-boyfriend-blazer">shop</a></p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712720827/.Net-MVC/blog_3.jpg', NULL, NULL, NULL, NULL, CAST(N'2024-04-10T10:47:08.3141534' AS DateTime2), CAST(N'2024-04-10T10:47:08.3141558' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'8acf80c3-1edd-4efc-b911-ced2fd28001e', N'The Fashion Guitar', N'The Fashion Guitar is the online blog of Dutch-born Charlotte Groeneveld-Van Haren. Now based in New York, she is a mother of two and runs her blog full-time.', N'<h2><strong>4. </strong><a href="https://thefashionguitar.com/"><strong>The Fashion Guitar</strong></a></h2><figure class="image"><img style="aspect-ratio:810/594;" src="https://influencermarketinghub.com/wp-content/uploads/2018/06/image6-1024x751.jpg" alt="The Fashion Guitar fashion blog" srcset="//influencermarketinghub.com/wp-content/uploads/2018/06/image6-1024x751.jpg 1024w, //influencermarketinghub.com/wp-content/uploads/2018/06/image6-300x220.jpg 300w, //influencermarketinghub.com/wp-content/uploads/2018/06/image6-768x563.jpg 768w, //influencermarketinghub.com/wp-content/uploads/2018/06/image6-810x594.jpg 810w, //influencermarketinghub.com/wp-content/uploads/2018/06/image6.jpg 1130w" sizes="100vw" width="810" height="594"></figure><p>The Fashion Guitar is the online blog of Dutch-born Charlotte Groeneveld-Van Haren. Now based in New York, she is a mother of two and runs her blog full-time.</p><p>Charlotte had worked with fashion blogs in one of her former jobs until she decided to create one herself. As a personal style blog, The Fashion Guitar showcases Charlotte’s own fashion sense. When she became a mother, the posts naturally featured her maternity and motherhood style, and it became a significant part of the website. Charlotte has worked with her favorite brands and designers, and loves collaborating with them.</p><p>The Fashion Guitar splits its posts into nine categories:</p><ul><li>Brand Collaborations</li><li>Beauty</li><li>Editorial Shoots</li><li>Fashion Week</li><li>Inspiration</li><li>Mamma Fashion</li><li>Outfit</li><li>Travel</li><li>5 Days 5 Ways</li></ul>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1715763935/.Net-MVC/image6-1024x751.jpg', NULL, NULL, NULL, NULL, CAST(N'2024-05-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-15T16:05:35.2551508' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'b3ab6f5b-b839-4179-aa28-e0b7bcac63f5', N'My Fash Diary', N'Blog creator and editor Tala Samman defines fashion as “what others declare is in,” while style is more personal—“what you declare is in', N'<h2><a href="https://myfashdiary.com/"><strong>My Fash Diary</strong></a></h2><figure class="image"><img style="aspect-ratio:800/416;" src="https://influencermarketinghub.com/wp-content/uploads/2018/06/myfash-diary.jpg.webp" alt="myfashdiary blog" srcset="//influencermarketinghub.com/wp-content/uploads/2018/06/myfash-diary.jpg.webp 800w, //influencermarketinghub.com/wp-content/uploads/2018/06/myfash-diary-300x156.jpg.webp 300w, //influencermarketinghub.com/wp-content/uploads/2018/06/myfash-diary-768x399.jpg.webp 768w, //influencermarketinghub.com/wp-content/uploads/2018/06/myfash-diary-150x78.jpg.webp 150w" sizes="100vw" width="800" height="416"></figure><p>Blog creator and editor Tala Samman defines fashion as “what <i>others</i> declare is in,” while style is more personal—“what <i>you</i> declare is in.” My Fash Diary is Tala’s personal style diary, often posting about the things that she loves, what she wears, the hottest trends in Dubai and in cities where she travels, and others.&nbsp;</p><p>Dubai-based Tala, who was born in Chicago and has Syrian roots, gives us a glimpse of the fashion and styles in the Middle East. Although the blog’s name implies a heavy leaning toward fashion, Tala also posts about beauty, food, and travel.</p><p>My Fash Diary has gained international recognition, receiving nominations for Marie Claire, Twitter, UK Blog, and Ahlan! Magazine’s Best at the Dubai awards. She was cited in 2011 as one of Dubai’s Hot 100, and has been recognized in prestigious publications like Grazia UK, Grazia Middle East, Harper’s Bazaar Arabia, and Marie Claire Middle East.</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1715764199/.Net-MVC/myfash-diary.jpg.webp', NULL, NULL, NULL, NULL, CAST(N'2024-05-15T16:09:59.1532076' AS DateTime2), CAST(N'2024-05-15T16:09:59.1532092' AS DateTime2), N'Admin', N'Admin', NULL, 1)
INSERT [dbo].[News] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'ea82040c-77f2-448f-af75-ef9ca6fa90aa', N'SUMMER VACATION', N'This is the first time i had coming Blue Beach with my husband', N'<p><a href="https://thebeachlifeblog.com/2023/08/03/the-gold-coast/"><img src="https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/GOLD-COAST-PELICAN.jpg?resize=400%2C600&amp;ssl=1" alt="" srcset="https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/GOLD-COAST-PELICAN.jpg?resize=199%2C300&amp;ssl=1 199w, https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/GOLD-COAST-PELICAN.jpg?resize=400%2C600&amp;ssl=1 400w, https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/GOLD-COAST-PELICAN.jpg?resize=40%2C60&amp;ssl=1 40w, https://i0.wp.com/thebeachlifeblog.com/wp-content/uploads/2021/07/GOLD-COAST-PELICAN.jpg?resize=60%2C90&amp;ssl=1 60w" sizes="100vw" width="400" height="600"><i>THE GOLD COAST</i></a></p><p><i>3AUG</i></p><p>For many of us, the Gold Coast is the jewel in Australia''s glittering crown. It has an incredible 300 days of sunshine per year and endless natural beauty. Set along the Pacific Ocean, this iconic region spans 57 kilometers of sun-kissed coastline. Famous for its wide sandy beaches and ...<br>&nbsp;</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712720708/.Net-MVC/blog_1.jpg', NULL, NULL, NULL, NULL, CAST(N'2024-04-10T10:45:08.9321315' AS DateTime2), CAST(N'2024-04-10T10:45:08.9321508' AS DateTime2), N'Admin', N'Admin', NULL, 1)
GO
INSERT [dbo].[Notification] ([Id], [Description], [Type], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'50adf046-9d10-47ab-4eaf-08dc6e4e6370', N'User Admin has created an order with code Order-dc8850bc-af49-4a30-b653-7a0e375b0ddc', N'info', CAST(N'2024-05-07T11:30:13.4418526' AS DateTime2), CAST(N'2024-05-07T11:30:13.4418538' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[Notification] ([Id], [Description], [Type], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'd6ccaf87-f04f-4ecb-4eb0-08dc6e4e6370', N'User Admin has cancelled an order with code Order-dc8850bc-af49-4a30-b653-7a0e375b0ddc', N'warning', CAST(N'2024-05-07T11:30:49.4642754' AS DateTime2), CAST(N'2024-05-07T11:30:49.4642757' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[Notification] ([Id], [Description], [Type], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'e2c2e890-e392-428a-aa8e-08dc8b658af4', N'User Adminxxx22233x4x4 has created an order with code Order-063dc708-066c-4bc6-843f-c15ea0a56e2c', N'info', CAST(N'2024-06-13T11:59:01.8870737' AS DateTime2), CAST(N'2024-06-13T11:59:01.8870742' AS DateTime2), N'Adminxxx22233x4x4', N'Adminxxx22233x4x4', NULL)
INSERT [dbo].[Notification] ([Id], [Description], [Type], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'e27bef21-66c9-436b-aa8f-08dc8b658af4', N'User Admindd has created an order with code Order-e3030e31-662b-4051-9193-790f71add940', N'info', CAST(N'2024-06-13T11:59:44.8090672' AS DateTime2), CAST(N'2024-06-13T11:59:44.8090675' AS DateTime2), N'Admindd', N'Admindd', NULL)
INSERT [dbo].[Notification] ([Id], [Description], [Type], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'365380d1-17d4-4d9c-aa90-08dc8b658af4', N'User Adminzzzz has created an order with code Order-0d16c330-e85f-42c4-ab0c-76daff50a4c6', N'info', CAST(N'2024-06-13T12:00:36.2074503' AS DateTime2), CAST(N'2024-06-13T12:00:36.2074504' AS DateTime2), N'Adminzzzz', N'Adminzzzz', NULL)
GO
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'd246d2c7-e1b3-40ce-4242-08dc692c49ec', N'Orderd08292a5-4a8a-426d-ab98-1ad686b8293b', N'Admin', N'+111111111111', N'HN', CAST(1499.99 AS Decimal(18, 2)), 3, CAST(N'2024-04-30T22:44:24.5574648' AS DateTime2), CAST(N'2024-05-07T09:26:19.3888669' AS DateTime2), N'Admin', N'Admin', NULL, N'quancuco27012004@gmail.com', 1, 0, 0, 0, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'683d7db1-cc8f-4576-526d-08dc69335e12', N'Order0ad666ed-87dd-4c50-8b40-ad84bc8fe052', N'Admin', N'+111111111111', N'HN', CAST(1929.99 AS Decimal(18, 2)), 3, CAST(N'2024-04-30T23:34:12.2125354' AS DateTime2), CAST(N'2024-05-01T21:38:30.6575611' AS DateTime2), N'Admin', N'Admin', NULL, N'quancuco27012004@gmail.com', 0, 0, 3, 0, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'c8396764-8d71-4f43-8429-08dc69340d5a', N'Order07245bb9-c0ef-4f2f-82d9-adfb163fb282', N'Admin', N'+111111111111', N'HN', CAST(1929.99 AS Decimal(18, 2)), 3, CAST(N'2024-04-30T23:39:06.2865439' AS DateTime2), CAST(N'2024-05-01T21:38:23.6576783' AS DateTime2), N'Admin', N'Admin', NULL, N'quancuco27012004@gmail.com', 1, 1, 4, 1, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'eacbd377-73c2-4ae0-842a-08dc69340d5a', N'Orderba3c84fd-3cb7-4443-91f5-5980f6a7927f', N'Admin', N'+111111111111', N'HN', CAST(2928.99 AS Decimal(18, 2)), 5, CAST(N'2024-04-30T23:39:49.9619896' AS DateTime2), CAST(N'2024-05-01T21:34:17.4889311' AS DateTime2), N'Admin', N'Admin', NULL, N'quancuco27012004@gmail.com', 0, 1, 0, 1, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'2e998258-dfcb-4418-6cc3-08dc69d53f33', N'Order-743de3fb-647e-4901-b2a8-88201e5ec5df', N'Admin', N'+111111111111', N'HN', CAST(1929.99 AS Decimal(18, 2)), 3, CAST(N'2024-05-01T18:52:58.8911883' AS DateTime2), CAST(N'2024-05-07T10:09:49.7538143' AS DateTime2), N'Admin', N'Admin', NULL, N'admin@gmail.com', 1, 1, 2, 1, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'a37ef7c2-9df8-4713-6cc4-08dc69d53f33', N'Order-7f420bc2-aba8-4f19-ba85-8259ed0c6637', N'Admin', N'+0909098', N'HN', CAST(2049.99 AS Decimal(18, 2)), 4, CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-01T23:38:14.1009371' AS DateTime2), N'Admin', N'Admin', NULL, N'quancuco27012004@gmail.com', 0, 0, 5, 0, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'7ef5c19c-2fa0-4b62-3445-08dc6dab39a6', N'Order-77523063-0e08-49e9-b74b-d2685bff574f', N'Admin', N'+111111111111', N'HN', CAST(1280.00 AS Decimal(18, 2)), 4, CAST(N'2024-05-06T16:02:15.3657822' AS DateTime2), CAST(N'2024-05-07T10:00:01.8446556' AS DateTime2), N'Admin', N'Admin', NULL, N'quancuco27012004@gmail.com', 0, 1, 1, 0, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'9b5298c0-a16a-4e39-142e-08dc6e4e6373', N'Order-dc8850bc-af49-4a30-b653-7a0e375b0ddc', N'Admin', N'+111111111111', N'HN', CAST(870.00 AS Decimal(18, 2)), 2, CAST(N'2024-05-07T11:30:13.4411704' AS DateTime2), CAST(N'2024-05-07T14:41:51.3162802' AS DateTime2), N'Admin', N'Admin', NULL, N'admin@gmail.com', 0, 1, 4, 1, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'4e86f0e0-06f7-4a16-0d7d-08dc8b658af6', N'Order-063dc708-066c-4bc6-843f-c15ea0a56e2c', N'Adminxxx22233x4x4', N'+111111111111', N'HN', CAST(990.00 AS Decimal(18, 2)), 2, CAST(N'2024-06-13T11:59:01.8866179' AS DateTime2), CAST(N'2024-06-13T12:56:03.4958096' AS DateTime2), N'Adminxxx22233x4x4', N'Admin', NULL, N'quancuco27012004@gmail.com', 1, 1, 4, 1, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'd432c624-1d92-4206-0d7e-08dc8b658af6', N'Order-e3030e31-662b-4051-9193-790f71add940', N'Admindd', N'+111111111111', N'HN', CAST(629.99 AS Decimal(18, 2)), 1, CAST(N'2024-06-13T11:59:44.8090255' AS DateTime2), CAST(N'2024-06-13T12:56:06.9670570' AS DateTime2), N'Admindd', N'Admin', NULL, N'quancuco27012004@gmail.com', 0, 1, 4, 1, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
INSERT [dbo].[Order] ([Id], [Code], [CustomerName], [PhoneNumber], [Address], [TotalAmount], [Quantity], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [CustomerEmail], [MethodPay], [IsConfirmByUser], [Status], [IsConfirmByShop], [AppUserId], [AppUserIdFK]) VALUES (N'2bc3ee79-9408-4b37-0d7f-08dc8b658af6', N'Order-0d16c330-e85f-42c4-ab0c-76daff50a4c6', N'Adminzzzz', N'+111111111111', N'HN', CAST(929.99 AS Decimal(18, 2)), 3, CAST(N'2024-06-13T12:00:36.2074385' AS DateTime2), CAST(N'2024-06-13T12:56:11.2388217' AS DateTime2), N'Adminzzzz', N'Admin', NULL, N'quancuco27012004@gmail.com', 0, 1, 4, 1, NULL, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3')
GO
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'8c67477c-e17e-402b-4e2e-08dc692c49f1', N'd246d2c7-e1b3-40ce-4242-08dc692c49ec', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'4b31dbe5-c6fa-41ad-4e2f-08dc692c49f1', N'd246d2c7-e1b3-40ce-4242-08dc692c49ec', N'357da802-5553-4c8e-8e6b-e55ec5851e34', 1, CAST(690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'0ab2d5ea-099d-449d-4e30-08dc692c49f1', N'd246d2c7-e1b3-40ce-4242-08dc692c49ec', N'1267ebdd-f6a4-432b-a9dc-edfe8a4b8cb0', 1, CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'db7e7341-94fb-41bb-b7e3-08dc69335e16', N'683d7db1-cc8f-4576-526d-08dc69335e12', N'41897599-8ff3-4561-8649-ddfd24457cde', 1, CAST(610.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'dd8476cb-5158-40e7-b7e4-08dc69335e16', N'683d7db1-cc8f-4576-526d-08dc69335e12', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'2cf06fa1-6c8a-4e74-b7e5-08dc69335e16', N'683d7db1-cc8f-4576-526d-08dc69335e12', N'357da802-5553-4c8e-8e6b-e55ec5851e34', 1, CAST(690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'efeb1c85-6238-4b04-1ef5-08dc69340d5f', N'c8396764-8d71-4f43-8429-08dc69340d5a', N'41897599-8ff3-4561-8649-ddfd24457cde', 1, CAST(610.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'2f67bcd1-237e-442f-1ef6-08dc69340d5f', N'c8396764-8d71-4f43-8429-08dc69340d5a', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'ecad1c64-5795-491e-1ef7-08dc69340d5f', N'c8396764-8d71-4f43-8429-08dc69340d5a', N'357da802-5553-4c8e-8e6b-e55ec5851e34', 1, CAST(690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'b8d5466a-2c34-425b-1ef8-08dc69340d5f', N'eacbd377-73c2-4ae0-842a-08dc69340d5a', N'41897599-8ff3-4561-8649-ddfd24457cde', 1, CAST(610.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'3028ee1b-b811-4c9c-1ef9-08dc69340d5f', N'eacbd377-73c2-4ae0-842a-08dc69340d5a', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'2a256f6b-75ce-4f68-1efa-08dc69340d5f', N'eacbd377-73c2-4ae0-842a-08dc69340d5a', N'357da802-5553-4c8e-8e6b-e55ec5851e34', 1, CAST(690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'ddbca1c6-2dfd-4dc6-1efb-08dc69340d5f', N'eacbd377-73c2-4ae0-842a-08dc69340d5a', N'41b3f28a-ee1d-48cb-8d95-97baa877adf8', 1, CAST(504.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'b2125245-5e18-4889-1efc-08dc69340d5f', N'eacbd377-73c2-4ae0-842a-08dc69340d5a', N'ad418b70-8692-47eb-a32f-b07115b23e72', 1, CAST(495.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'473b3875-fcf0-449b-fcd4-08dc69d53f37', N'2e998258-dfcb-4418-6cc3-08dc69d53f33', N'41897599-8ff3-4561-8649-ddfd24457cde', 1, CAST(610.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'c31f23e7-7af9-41a9-fcd5-08dc69d53f37', N'2e998258-dfcb-4418-6cc3-08dc69d53f33', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'd0cb5ab1-211c-4d04-fcd6-08dc69d53f37', N'2e998258-dfcb-4418-6cc3-08dc69d53f33', N'357da802-5553-4c8e-8e6b-e55ec5851e34', 1, CAST(690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'3d9ce9cd-e485-48f0-fcd7-08dc69d53f37', N'a37ef7c2-9df8-4713-6cc4-08dc69d53f33', N'41897599-8ff3-4561-8649-ddfd24457cde', 1, CAST(610.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'2616679e-e07c-4273-fcd8-08dc69d53f37', N'a37ef7c2-9df8-4713-6cc4-08dc69d53f33', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'2ff13a9a-3047-422e-fcd9-08dc69d53f37', N'a37ef7c2-9df8-4713-6cc4-08dc69d53f33', N'357da802-5553-4c8e-8e6b-e55ec5851e34', 1, CAST(690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'fceb8baa-9743-44cb-fcda-08dc69d53f37', N'a37ef7c2-9df8-4713-6cc4-08dc69d53f33', N'5e67c88e-7012-4629-9c78-48b46077b91f', 1, CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'4b1b2ab2-25a4-4d8a-2543-08dc6dab39ab', N'7ef5c19c-2fa0-4b62-3445-08dc6dab39a6', N'5e67c88e-7012-4629-9c78-48b46077b91f', 2, CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'195bd195-babe-4561-2544-08dc6dab39ab', N'7ef5c19c-2fa0-4b62-3445-08dc6dab39a6', N'82561316-c93b-47c1-8211-799cbc18c85f', 2, CAST(520.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'e795ffb0-8ded-4438-636f-08dc6e4e6376', N'9b5298c0-a16a-4e39-142e-08dc6e4e6373', N'1267ebdd-f6a4-432b-a9dc-edfe8a4b8cb0', 1, CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'd0b6ddc7-00b1-4191-6370-08dc6e4e6376', N'9b5298c0-a16a-4e39-142e-08dc6e4e6373', N'357da802-5553-4c8e-8e6b-e55ec5851e34', 1, CAST(690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'4cb1db94-3f8e-4e4c-67ec-08dc8b658af6', N'4e86f0e0-06f7-4a16-0d7d-08dc8b658af6', N'ad418b70-8692-47eb-a32f-b07115b23e72', 2, CAST(495.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'3a5b8459-f136-42c5-67ed-08dc8b658af6', N'd432c624-1d92-4206-0d7e-08dc8b658af6', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'1cfd5c1a-cb6b-44a3-67ee-08dc8b658af6', N'2bc3ee79-9408-4b37-0d7f-08dc8b658af6', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', 1, CAST(629.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'1563763b-0ac2-4207-67ef-08dc8b658af6', N'2bc3ee79-9408-4b37-0d7f-08dc8b658af6', N'1267ebdd-f6a4-432b-a9dc-edfe8a4b8cb0', 1, CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [Price]) VALUES (N'566a6f8e-01ef-4d79-67f0-08dc8b658af6', N'2bc3ee79-9408-4b37-0d7f-08dc8b658af6', N'9e536afc-b87b-449d-ad90-fbc39ad3a9f1', 1, CAST(120.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Policy] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [IsActive], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'7f654d36-6198-4cf7-9a6b-0092b387586d', N'OPENING ALL WEEK', N'8AM - 09PM', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712545775/.Net-MVC/Screenshot_2024-04-08_100528.png', NULL, NULL, NULL, 1, CAST(N'2024-04-08T10:09:33.9201780' AS DateTime2), CAST(N'2024-04-08T10:09:33.9201794' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[Policy] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [IsActive], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'c922e252-ce4b-446b-9140-910a0178b700', N'FREE SHIPPING', N'Suffered Alteration in Some Form', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712545639/.Net-MVC/Screenshot_2024-04-08_100330.png', NULL, NULL, NULL, 1, CAST(N'2024-04-08T10:07:18.0439518' AS DateTime2), CAST(N'2024-04-08T10:07:18.0440462' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[Policy] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [IsActive], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'53e5b8e5-2fd7-429b-8f52-a05910e2df3e', N'45 DAYS RETURN', N'Making it Look Like Readable', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712545749/.Net-MVC/Screenshot_2024-04-08_100501.png', NULL, NULL, NULL, 1, CAST(N'2024-04-08T10:09:08.4321322' AS DateTime2), CAST(N'2024-04-08T10:09:08.4321341' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[Policy] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [IsActive], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'c9c50eb2-8055-4a1b-8233-ee31dbfc5ce1', N'CACH ON DELIVERY', N'The Internet Tend To Repeat', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712545731/.Net-MVC/Screenshot_2024-04-08_100425.png', NULL, NULL, NULL, 1, CAST(N'2024-04-08T10:08:50.2019257' AS DateTime2), CAST(N'2024-04-08T10:08:50.2019276' AS DateTime2), N'Admin', N'Admin', NULL)
GO
INSERT [dbo].[Post] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'1efadd87-6ee8-41da-bdca-498f6b233ad6', N'ttttt', N'ttttt', N'<p>tttttt</p>', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-05-07T13:18:09.8008271' AS DateTime2), CAST(N'2024-05-07T13:18:09.8008296' AS DateTime2), N'Admin', N'Admin', NULL, 0)
INSERT [dbo].[Post] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'fa3d0ce9-b083-4775-9c33-92c729a4fad6', N'sa', N'sa', N'<p>á</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712131070/.Net-MVC/map_marker.png', N'á', NULL, NULL, NULL, CAST(N'2024-04-03T14:57:50.1254815' AS DateTime2), CAST(N'2024-04-03T14:57:50.1255159' AS DateTime2), N'Admin', N'Admin', NULL, 0)
INSERT [dbo].[Post] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'4e858482-88be-440d-b128-ab2da7804862', N'ttt', N'ttt', N'<p>ttt</p>', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-05-07T13:18:04.4881761' AS DateTime2), CAST(N'2024-05-07T13:18:04.4881784' AS DateTime2), N'Admin', N'Admin', NULL, 0)
INSERT [dbo].[Post] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'7f0e219b-6e88-4b47-b1d6-b45bcdee11f9', N'tt', N'tt', N'<p>tt</p>', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-05-07T13:17:59.6894335' AS DateTime2), CAST(N'2024-05-07T13:17:59.6894354' AS DateTime2), N'Admin', N'Admin', NULL, 0)
INSERT [dbo].[Post] ([Id], [Title], [Description], [Detail], [Image], [SeoTitle], [SeoDescription], [SeoKeywords], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [IsActive]) VALUES (N'944940de-d3b1-4c3e-b0ab-fc408cc85548', N't', N't', N'<p>t</p>', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-05-07T13:17:53.7962469' AS DateTime2), CAST(N'2024-05-07T13:17:53.7962487' AS DateTime2), N'Admin', N'Admin', NULL, 0)
GO
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'161594a3-02d4-46fb-9efa-2a1d0c450cc1', N'Printed Bike Set', N'What you''ll need: Ganni Lurex Pedal Pusher, $160, Need Supply Co.', CAST(N'2024-04-16T16:09:13.8017606' AS DateTime2), N'Admin', N'<h2><strong>Printed Bike Set</strong></h2><p>Workout with a matching sports bra/bike shorts set, then make it street style ready with a sleek blazer. Add a pair of vintage frames and kitten heels for a retro vibe that somehow still feels totally 2019.</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713258553/.Net-MVC/gettyimages-1166694372.jpg', NULL, 0, 0, 0, 1, CAST(300.00 AS Decimal(18, 2)), CAST(290.00 AS Decimal(18, 2)), N'19c1e4ee-9b87-44b2-bab3-2e4c7e8f4891', N'XX112', 22, NULL, NULL, NULL, CAST(N'2024-04-16T16:09:13.8017822' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'9cdf9565-cd71-4c33-b362-2f47444b7d87', N'DYMO LabelWriter 450 Turbo Thermal Label Printer', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T00:00:00.0000000' AS DateTime2), N'Admin', N'<h2>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066166/.Net-MVC/product_4.png', NULL, 0, 1, 0, 0, CAST(410.34 AS Decimal(18, 2)), CAST(410.22 AS Decimal(18, 2)), N'be5d035b-e1ef-4b16-ad8d-90d0fe35fb59', N'A4', 23, NULL, NULL, NULL, CAST(N'2024-04-28T21:51:11.2230491' AS DateTime2), N'Admin', 1, 3)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'5e67c88e-7012-4629-9c78-48b46077b91f', N'Blue Yeti USB Microphone Blackout Edition', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T00:00:00.0000000' AS DateTime2), N'Admin', N'<figure class="image"><img style="aspect-ratio:810/513;" src="https://influencermarketinghub.com/wp-content/uploads/2018/06/image4-1024x649.jpg" alt="The Daileigh fashion industry" srcset="//influencermarketinghub.com/wp-content/uploads/2018/06/image4-1024x649.jpg 1024w, //influencermarketinghub.com/wp-content/uploads/2018/06/image4-300x190.jpg 300w, //influencermarketinghub.com/wp-content/uploads/2018/06/image4-768x487.jpg 768w, //influencermarketinghub.com/wp-content/uploads/2018/06/image4-810x514.jpg 810w, //influencermarketinghub.com/wp-content/uploads/2018/06/image4-1140x723.jpg 1140w, //influencermarketinghub.com/wp-content/uploads/2018/06/image4.jpg 1334w" sizes="100vw" width="810" height="513"></figure><p>The Daileigh’s Ashleigh Hutchinson wants her readers to build their perfect closet. She aims to help women of all ages find or create a style they love. In particular, Ashleigh wants older women to feel confident in their own style. She wants to break the assumption that some trends are suited only to a particular age group. Ashleigh’s philosophy centers around the notion that “age is only a number.”</p><p>Ashleigh’s blog is full of advice for the regular woman to make better fashion choices, whether it’s “Dressing Better With the Clothes You Have” or starting a capsule wardrobe. Along with her blog posts, she has also published e-books and has even held online webinars to help people improve their fashion sense.</p><p>Ashleigh frequently posts “How To” articles, often adapted to target a particular segment of her audience. She has written posts that are aimed at women of varying ages:</p><ul><li>How to Wear Shorts in Your 40s</li><li>How to Wear Shorts in Your 50s</li><li>How to Wear Shorts in Your 60s</li></ul><p><br>&nbsp;</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713342488/.Net-MVC/Bl9Per.jpg', NULL, 0, 1, 1, 1, CAST(120.00 AS Decimal(18, 2)), CAST(110.00 AS Decimal(18, 2)), N'66752e2c-76de-467c-a451-a0ac2e7d87f5', N'A3', 33, NULL, NULL, NULL, CAST(N'2024-05-06T16:01:26.2653794' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'82561316-c93b-47c1-8211-799cbc18c85f', N'Fujifilm X100T 16 MP Digital Camera (Silver)', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T21:00:22.8318001' AS DateTime2), N'Admin', N'<h2><br>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066420/.Net-MVC/product_6.png', NULL, 1, 1, 1, 1, CAST(520.00 AS Decimal(18, 2)), CAST(390.20 AS Decimal(18, 2)), N'be5d035b-e1ef-4b16-ad8d-90d0fe35fb59', N'A6', 75, NULL, NULL, NULL, CAST(N'2024-04-02T21:00:22.8318017' AS DateTime2), N'Admin', 1, 7)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'41b3f28a-ee1d-48cb-8d95-97baa877adf8', N'Pryma Headphones, Rose Gold & Grey', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T21:06:39.0798293' AS DateTime2), N'Admin', N'<h2>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066797/.Net-MVC/product_10.png', NULL, 0, 1, 0, 1, CAST(504.00 AS Decimal(18, 2)), CAST(409.00 AS Decimal(18, 2)), N'2fb6589e-98c8-4c28-9ed7-d4d994f75c45', N'A10', 43, NULL, NULL, NULL, CAST(N'2024-04-02T21:06:39.0798304' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'ad418b70-8692-47eb-a32f-b07115b23e72', N'Pocket cotton sweatshirt', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T21:05:25.1119982' AS DateTime2), N'Admin', N'<h2><br>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066716/.Net-MVC/single_3_thumb.jpg', NULL, 1, 1, 1, 1, CAST(495.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), N'2fb6589e-98c8-4c28-9ed7-d4d994f75c45', N'A9', 100, N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', N'sweatshirt', N'Pocket cotton sweatshirt', CAST(N'2024-04-02T21:05:25.1119992' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'291d06d7-c63b-4251-a802-b21d57663fc0', N'Adorably Sporty Outfits', N'That''ll Make You Love Your Sweatpants Even More', CAST(N'2024-04-16T00:00:00.0000000' AS DateTime2), N'Admin', N'<h2><strong>Chic Sweatsuit</strong></h2><p>How cute is this highlighter set? Reach for a sporty-chic set like this for a weekend brunch date with your roomie or for afterschool loungewear. Style it up with athletic-inspired shades and slides.</p><p><strong>What you''ll need:</strong> <i>Womens Velour Track Jacket, $31, Amazon</i></p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713258345/.Net-MVC/gettyimages-1159696862.jpg', NULL, 0, 0, 1, 0, CAST(130.00 AS Decimal(18, 2)), CAST(68.00 AS Decimal(18, 2)), N'6b03f4a1-477a-4a48-bc74-5fc91bc2cbe6', N'AB1234', 23, NULL, NULL, NULL, CAST(N'2024-04-16T16:05:45.2252717' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'fab51a34-5bf4-4024-9c15-c366e7fa1920', N'Sleek Sporty', N'What you''ll need: Long Sleeve Modal Bodysuit, $44, Intimissimi', CAST(N'2024-04-16T16:10:15.0105540' AS DateTime2), N'Admin', N'<p>ROY ROCHLIN</p><h2><strong>Sleek Sporty</strong></h2><p>Elevate your favorite track pants with a glam red cateye and a sleek bodysuit to streamline the outfit. Trust, this fierce look will pass any dress code.</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713258615/.Net-MVC/gettyimages-1160881911.jpg', NULL, 0, 0, 1, 1, CAST(208.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), N'6b03f4a1-477a-4a48-bc74-5fc91bc2cbe6', N'RRRT23', 11, NULL, NULL, NULL, CAST(N'2024-04-16T16:10:15.0105556' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'41897599-8ff3-4561-8649-ddfd24457cde', N'Samsung CF591 Series Curved 27-Inch FHD Monitor', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T00:00:00.0000000' AS DateTime2), N'Admin', N'<h2>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712065952/.Net-MVC/product_2.png', NULL, 0, 1, 1, 0, CAST(610.00 AS Decimal(18, 2)), CAST(610.00 AS Decimal(18, 2)), N'66752e2c-76de-467c-a451-a0ac2e7d87f5', N'A2', 33, NULL, NULL, N'Samsung CF591 Series Curved 27-Inch FHD Monitor', CAST(N'2024-04-03T16:38:26.3452391' AS DateTime2), N'Admin', 1, 2)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', N'Fujifilm X100T 16 MP Digital Camera (Silver)', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T20:50:39.1085456' AS DateTime2), N'Admin', N'<h2>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712065839/.Net-MVC/product_1.png', NULL, 1, 1, 1, 1, CAST(629.99 AS Decimal(18, 2)), CAST(495.00 AS Decimal(18, 2)), N'2fb6589e-98c8-4c28-9ed7-d4d994f75c45', N'A1', 40, NULL, NULL, N'Fujifilm X100T 16 MP Digital Camera (Silver)', CAST(N'2024-04-02T20:50:39.1086921' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'357da802-5553-4c8e-8e6b-e55ec5851e34', N'Samsung CF591 Series Curved 27-Inch FHD Monitor', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T21:01:37.5174238' AS DateTime2), N'Admin', N'<h2>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066494/.Net-MVC/product_7.png', NULL, 1, 1, 1, 1, CAST(690.00 AS Decimal(18, 2)), CAST(430.10 AS Decimal(18, 2)), N'66752e2c-76de-467c-a451-a0ac2e7d87f5', N'A7', 65, NULL, NULL, NULL, CAST(N'2024-04-02T21:01:37.5174248' AS DateTime2), N'Admin', 1, 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'1267ebdd-f6a4-432b-a9dc-edfe8a4b8cb0', N'Pryma Headphones, Rose Gold & Grey', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T20:58:27.2380659' AS DateTime2), N'Admin', N'<h2>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066305/.Net-MVC/product_5.png', NULL, 0, 1, 0, 1, CAST(180.00 AS Decimal(18, 2)), CAST(169.21 AS Decimal(18, 2)), N'2fb6589e-98c8-4c28-9ed7-d4d994f75c45', N'A5', 45, NULL, NULL, NULL, CAST(N'2024-04-02T20:58:27.2380681' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'c8df4fb2-ea47-43d0-9fb5-f80b293710a4', N'Tie Dye Wonder', N'What you''ll need: Dream Slim Tie Dye Crew Socks, $10.99, Amazon', CAST(N'2024-04-16T16:11:29.5796071' AS DateTime2), N'Admin', N'<h2><strong>Tie Dye Wonder</strong></h2><p>Get groovy by adding something (literally, <i>anything</i>) tie dye to your sporty outfit. Mish-mash multiple prints for a total psychedelic effect or stick to one color scheme, like this chic look.</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713258689/.Net-MVC/gettyimages-1163304707.jpg', NULL, 0, 0, 0, 0, CAST(550.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), N'19c1e4ee-9b87-44b2-bab3-2e4c7e8f4891', N'ĐSD12', 22, NULL, NULL, NULL, CAST(N'2024-04-16T16:11:29.5796089' AS DateTime2), N'Admin', 1, 0)
INSERT [dbo].[Product] ([Id], [Title], [Description], [CreatedAt], [CreatedBy], [Detail], [Image], [IsDeleted], [IsNew], [IsHome], [IsHot], [IsSale], [Price], [PriceSale], [ProductCategoryId], [ProductCode], [Quantity], [SeoDescription], [SeoKeywords], [SeoTitle], [UpdatedAt], [UpdatedBy], [IsActive], [ViewCount]) VALUES (N'9e536afc-b87b-449d-ad90-fbc39ad3a9f1', N'Blue Yeti USB Microphone Blackout Edition', N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', CAST(N'2024-04-02T00:00:00.0000000' AS DateTime2), N'Admin', N'<h2><br>Pocket cotton sweatshirt</h2><p>Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...</p>', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066547/.Net-MVC/product_8.png', NULL, 0, 1, 1, 0, CAST(120.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), N'be5d035b-e1ef-4b16-ad8d-90d0fe35fb59', N'A8', 43, NULL, NULL, NULL, CAST(N'2024-04-03T16:36:13.3701138' AS DateTime2), N'Admin', 1, 0)
GO
INSERT [dbo].[ProductCategory] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'19c1e4ee-9b87-44b2-bab3-2e4c7e8f4891', N'New Arrivals', N'New Arrivals', NULL, NULL, NULL, NULL, CAST(N'2024-04-14T11:41:49.8039548' AS DateTime2), CAST(N'2024-04-14T11:41:49.8039780' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'c0cccc17-a271-41dd-b4a9-5f9eda272aaa', N'Collection', N'Collection', NULL, NULL, NULL, NULL, CAST(N'2024-04-14T11:42:02.1165639' AS DateTime2), CAST(N'2024-04-14T11:42:02.1165692' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'6b03f4a1-477a-4a48-bc74-5fc91bc2cbe6', N'Sporty', N'Sporty', NULL, NULL, NULL, NULL, CAST(N'2024-04-14T11:42:26.8708344' AS DateTime2), CAST(N'2024-04-14T11:42:26.8708367' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'be5d035b-e1ef-4b16-ad8d-90d0fe35fb59', N'Accessory', N'Accessory', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712130538/.Net-MVC/banner_2.jpg', N'Accessory', NULL, N'Accessory', CAST(N'2024-03-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-03T14:48:59.1514182' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'66752e2c-76de-467c-a451-a0ac2e7d87f5', N'Women''s', N'Women''s', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712130522/.Net-MVC/banner_1.jpg', N'Women''s', NULL, N'Women''s', CAST(N'2024-03-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-03T14:48:42.4889826' AS DateTime2), N'Admin', N'Admin', NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Description], [Icon], [SeoTitle], [SeoDescription], [SeoKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'2fb6589e-98c8-4c28-9ed7-d4d994f75c45', N'Men''s', N'Men''s', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066718/.Net-MVC/banner_3.jpg', N'Men''s', NULL, N'Men''s', CAST(N'2024-03-24T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-03T14:48:16.8783162' AS DateTime2), N'Admin', N'Admin', NULL)
GO
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'e5250959-8f83-43ab-9558-03cf69218ed8', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066722/.Net-MVC/desc_3.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'6325cc76-bce0-497c-9a4d-1c241a2d534d', N'82561316-c93b-47c1-8211-799cbc18c85f', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066420/.Net-MVC/product_6.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'ccf43b26-4569-44e2-b3cb-230af2e93169', N'357da802-5553-4c8e-8e6b-e55ec5851e34', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066494/.Net-MVC/product_7.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'5e5f6b5c-ab29-4bd0-84c8-270a6a944957', N'41897599-8ff3-4561-8649-ddfd24457cde', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712065952/.Net-MVC/product_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'35399614-a9c3-4a1a-b428-5bfffdaba504', N'1267ebdd-f6a4-432b-a9dc-edfe8a4b8cb0', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066305/.Net-MVC/product_5.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'99ca3c83-712b-4958-bbd5-618be12dba45', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066723/.Net-MVC/single_2.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'94b15ad0-a045-4bc5-9d42-6a9ed84be574', N'41b3f28a-ee1d-48cb-8d95-97baa877adf8', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066797/.Net-MVC/product_10.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'17679fb4-58a9-434b-9cef-72218c60ee80', N'5e67c88e-7012-4629-9c78-48b46077b91f', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713342487/.Net-MVC/ao-len-nu-whoau-r-steve-co-tron-whkad4901f-mau-vang1-jpg-1697615840-18102023145720.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'5641f605-5c43-45f7-a7a9-7f88297f7324', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066721/.Net-MVC/desc_2_-_Copy.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'eab2ef2c-96bb-4060-9efb-98671876ebca', N'9cdf9565-cd71-4c33-b362-2f47444b7d87', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066166/.Net-MVC/product_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'43fd5c9e-614a-4faf-a270-996c922957a3', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066724/.Net-MVC/single_2_thumb.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'd42d0a4e-a1a7-49ed-bdab-af4dc2d582dd', N'9e536afc-b87b-449d-ad90-fbc39ad3a9f1', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066547/.Net-MVC/product_8.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'f0935bb5-ce69-47a0-ba24-bb5959efc279', N'2d31368f-f1ad-4b5c-b633-e11e03c2092c', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712065839/.Net-MVC/product_1.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'22d67401-2ba4-45d3-8469-c2b7f0cc19bc', N'5e67c88e-7012-4629-9c78-48b46077b91f', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713342488/.Net-MVC/Bl9Per.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'611fe828-8966-466c-b8ad-ced17d1897b0', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066723/.Net-MVC/single_1.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'dae3b8cb-07f1-4742-87a0-d301c0bb997a', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066720/.Net-MVC/desc_1.jpg', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'682ea2c4-b5f2-41fd-9c48-d42553cc59dc', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066719/.Net-MVC/deal_ofthe_week.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'577e2ae6-7ebb-4f41-b7d7-f26be9e13a80', N'ad418b70-8692-47eb-a32f-b07115b23e72', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1712066718/.Net-MVC/banner_3.jpg', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Image], [IsDefault]) VALUES (N'1c31d46d-528b-4f88-b3a0-fd72c9093727', N'5e67c88e-7012-4629-9c78-48b46077b91f', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1713342489/.Net-MVC/images.jpg', 0)
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'074f9358-21b5-44e1-9687-c1bc4a10f0d9', N'User', N'USER', N'd30e8ab4-8071-498e-9b6a-365dce8273b4')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'08442018-0897-4d29-9e03-6c76f11ee891', N'Business', N'BUSINESS', N'231fc276-b47c-4243-96af-420e37e4b388')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'24cbd229-0e88-4f56-98be-50f8aaea5080', N'Subcriber', N'SUBCRIBER', N'8993247b-3b60-425e-8eca-84afc0a39706')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'59a47acd-7e94-406e-a173-5ee30bcb092d', N'Manager', N'MANAGER', N'89f1e4c1-3f01-4c26-9aa0-a847b2066da1')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8021318f-d289-4f99-a26a-c19784fb0822', N'Admin', N'ADMIN', N'f5866cf3-78b2-431f-89b6-079e0c7b13b5')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'995f388e-1635-4a92-b76b-d3b97ce33e09', N'Buyer', N'BUYER', N'a8dcc8bf-a25d-417a-b68c-dff726cbd52f')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'df6e22ba-36d8-49ba-84ab-47f83fee3688', N'Seller', N'SELLER', N'd427ba30-606c-4740-a47d-b894c494f016')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f9debd77-15a9-4229-9446-6b014acf8060', N'Test', N'TEST', N'5013e750-a05b-4835-9f94-cda8b26f978c')
GO
SET IDENTITY_INSERT [dbo].[Statisticals] ON 

INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (1, CAST(929.99 AS Decimal(18, 2)), 1, 3, CAST(N'2024-06-13T12:55:48.9276123' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (2, CAST(629.99 AS Decimal(18, 2)), 1, 1, CAST(N'2024-06-13T12:55:56.1217815' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (3, CAST(990.00 AS Decimal(18, 2)), 1, 2, CAST(N'2024-06-13T12:56:03.4985397' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (4, CAST(629.99 AS Decimal(18, 2)), 1, 1, CAST(N'2024-06-13T12:56:06.9698849' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (5, CAST(929.99 AS Decimal(18, 2)), 1, 3, CAST(N'2024-06-13T12:56:11.2413298' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (6, CAST(1501.88 AS Decimal(18, 2)), 8, 25, CAST(N'2024-04-22T00:39:28.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (7, CAST(9181.78 AS Decimal(18, 2)), 2, 42, CAST(N'2024-05-07T22:54:52.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (8, CAST(7934.64 AS Decimal(18, 2)), 14, 38, CAST(N'2024-03-05T15:35:53.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (9, CAST(9584.51 AS Decimal(18, 2)), 16, 2, CAST(N'2024-02-10T09:48:06.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (10, CAST(1705.04 AS Decimal(18, 2)), 13, 44, CAST(N'2024-06-04T08:32:21.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (11, CAST(9278.85 AS Decimal(18, 2)), 0, 15, CAST(N'2024-11-08T23:39:49.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (12, CAST(7088.09 AS Decimal(18, 2)), 0, 35, CAST(N'2024-01-30T15:39:53.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (13, CAST(8430.29 AS Decimal(18, 2)), 19, 26, CAST(N'2024-11-23T04:31:52.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (14, CAST(7401.49 AS Decimal(18, 2)), 14, 11, CAST(N'2024-07-05T23:41:17.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (15, CAST(3687.84 AS Decimal(18, 2)), 4, 4, CAST(N'2024-11-01T10:26:38.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (16, CAST(2472.22 AS Decimal(18, 2)), 1, 17, CAST(N'2024-10-07T04:31:37.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (17, CAST(2507.76 AS Decimal(18, 2)), 8, 30, CAST(N'2024-11-01T03:36:22.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (18, CAST(3958.93 AS Decimal(18, 2)), 9, 16, CAST(N'2024-06-07T01:42:16.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (19, CAST(8319.43 AS Decimal(18, 2)), 13, 27, CAST(N'2024-04-09T22:20:18.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (20, CAST(4672.61 AS Decimal(18, 2)), 9, 21, CAST(N'2024-03-08T10:22:40.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (21, CAST(9532.42 AS Decimal(18, 2)), 11, 38, CAST(N'2024-03-13T19:57:13.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (22, CAST(1614.10 AS Decimal(18, 2)), 11, 28, CAST(N'2024-02-01T06:54:20.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (23, CAST(7251.90 AS Decimal(18, 2)), 9, 0, CAST(N'2024-07-05T23:07:34.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (24, CAST(3450.90 AS Decimal(18, 2)), 4, 4, CAST(N'2024-07-24T01:47:16.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (25, CAST(1174.27 AS Decimal(18, 2)), 11, 14, CAST(N'2024-11-24T03:59:01.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (26, CAST(826.83 AS Decimal(18, 2)), 19, 11, CAST(N'2024-01-19T11:03:34.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (27, CAST(7150.97 AS Decimal(18, 2)), 13, 19, CAST(N'2024-03-12T04:17:28.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (28, CAST(721.98 AS Decimal(18, 2)), 18, 38, CAST(N'2024-08-28T12:12:16.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (29, CAST(3297.18 AS Decimal(18, 2)), 11, 40, CAST(N'2024-12-25T16:10:14.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (30, CAST(5864.19 AS Decimal(18, 2)), 4, 31, CAST(N'2024-09-04T05:43:47.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (31, CAST(3677.77 AS Decimal(18, 2)), 16, 14, CAST(N'2024-12-26T20:49:13.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (32, CAST(7450.92 AS Decimal(18, 2)), 0, 7, CAST(N'2024-03-15T14:16:12.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (33, CAST(3314.73 AS Decimal(18, 2)), 13, 30, CAST(N'2024-12-10T14:27:26.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (34, CAST(8490.09 AS Decimal(18, 2)), 17, 29, CAST(N'2024-11-08T09:07:56.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (35, CAST(4150.78 AS Decimal(18, 2)), 18, 33, CAST(N'2024-07-08T07:50:58.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (36, CAST(4930.53 AS Decimal(18, 2)), 17, 11, CAST(N'2024-12-15T13:01:47.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (37, CAST(6042.05 AS Decimal(18, 2)), 4, 44, CAST(N'2024-07-30T21:13:38.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (38, CAST(6889.65 AS Decimal(18, 2)), 16, 17, CAST(N'2024-01-29T17:39:39.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (39, CAST(8964.45 AS Decimal(18, 2)), 18, 0, CAST(N'2024-10-17T13:47:09.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (40, CAST(5625.11 AS Decimal(18, 2)), 18, 9, CAST(N'2024-01-07T15:57:05.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (41, CAST(4480.84 AS Decimal(18, 2)), 7, 10, CAST(N'2024-09-26T13:57:02.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (42, CAST(6088.31 AS Decimal(18, 2)), 12, 28, CAST(N'2024-10-04T18:54:25.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (43, CAST(9079.43 AS Decimal(18, 2)), 14, 27, CAST(N'2024-10-29T04:18:58.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (44, CAST(2645.32 AS Decimal(18, 2)), 3, 34, CAST(N'2024-03-09T20:47:52.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (45, CAST(4177.92 AS Decimal(18, 2)), 1, 33, CAST(N'2024-07-06T00:21:24.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (46, CAST(8579.07 AS Decimal(18, 2)), 5, 8, CAST(N'2024-05-05T04:03:57.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (47, CAST(1551.12 AS Decimal(18, 2)), 15, 41, CAST(N'2024-09-07T12:29:18.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (48, CAST(784.32 AS Decimal(18, 2)), 12, 34, CAST(N'2024-02-19T17:44:28.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (49, CAST(7284.04 AS Decimal(18, 2)), 14, 3, CAST(N'2024-12-30T19:11:44.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (50, CAST(2966.67 AS Decimal(18, 2)), 9, 22, CAST(N'2024-06-28T16:17:50.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (51, CAST(7243.35 AS Decimal(18, 2)), 8, 16, CAST(N'2024-06-02T05:55:42.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (52, CAST(160.07 AS Decimal(18, 2)), 17, 43, CAST(N'2024-07-26T14:54:18.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (53, CAST(1384.83 AS Decimal(18, 2)), 19, 36, CAST(N'2024-02-27T11:34:46.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (54, CAST(1102.88 AS Decimal(18, 2)), 9, 14, CAST(N'2024-01-24T13:35:11.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (55, CAST(7044.92 AS Decimal(18, 2)), 16, 31, CAST(N'2024-01-20T18:18:48.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (56, CAST(3243.83 AS Decimal(18, 2)), 6, 4, CAST(N'2024-05-08T21:12:15.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (57, CAST(6389.07 AS Decimal(18, 2)), 15, 45, CAST(N'2024-11-12T06:26:52.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (58, CAST(9538.10 AS Decimal(18, 2)), 10, 32, CAST(N'2024-06-13T14:39:43.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (59, CAST(6872.18 AS Decimal(18, 2)), 11, 10, CAST(N'2024-07-15T12:33:59.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (60, CAST(7302.02 AS Decimal(18, 2)), 19, 47, CAST(N'2024-06-16T15:46:47.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (61, CAST(3204.42 AS Decimal(18, 2)), 9, 38, CAST(N'2024-10-24T01:33:37.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (62, CAST(3848.25 AS Decimal(18, 2)), 18, 33, CAST(N'2024-12-11T19:19:21.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (63, CAST(961.40 AS Decimal(18, 2)), 4, 22, CAST(N'2024-07-24T06:56:48.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (64, CAST(3630.67 AS Decimal(18, 2)), 8, 16, CAST(N'2024-12-12T21:12:39.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (65, CAST(926.90 AS Decimal(18, 2)), 9, 7, CAST(N'2024-05-14T07:41:31.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (66, CAST(4463.06 AS Decimal(18, 2)), 8, 30, CAST(N'2024-05-14T01:59:05.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (67, CAST(7613.00 AS Decimal(18, 2)), 6, 48, CAST(N'2024-04-11T12:47:37.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (68, CAST(9452.49 AS Decimal(18, 2)), 16, 27, CAST(N'2024-01-15T00:47:38.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (69, CAST(5076.15 AS Decimal(18, 2)), 9, 12, CAST(N'2024-12-04T03:20:05.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (70, CAST(8866.67 AS Decimal(18, 2)), 1, 29, CAST(N'2024-09-13T14:54:14.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (71, CAST(4861.17 AS Decimal(18, 2)), 19, 5, CAST(N'2024-08-01T16:48:00.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (72, CAST(8075.31 AS Decimal(18, 2)), 8, 47, CAST(N'2024-03-28T14:45:02.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (73, CAST(8405.12 AS Decimal(18, 2)), 19, 48, CAST(N'2024-09-25T11:27:34.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (74, CAST(1515.47 AS Decimal(18, 2)), 1, 25, CAST(N'2024-12-09T07:06:25.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (75, CAST(8414.25 AS Decimal(18, 2)), 11, 15, CAST(N'2024-11-17T06:44:18.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (76, CAST(482.27 AS Decimal(18, 2)), 9, 8, CAST(N'2024-01-09T10:35:28.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (77, CAST(6977.38 AS Decimal(18, 2)), 17, 42, CAST(N'2024-10-12T23:43:04.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (78, CAST(2243.24 AS Decimal(18, 2)), 18, 42, CAST(N'2024-10-30T03:30:56.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (79, CAST(3783.09 AS Decimal(18, 2)), 16, 4, CAST(N'2024-06-15T12:40:28.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (80, CAST(4592.36 AS Decimal(18, 2)), 4, 12, CAST(N'2024-06-09T23:26:32.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (81, CAST(9230.21 AS Decimal(18, 2)), 6, 24, CAST(N'2024-08-11T15:57:37.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (82, CAST(6197.88 AS Decimal(18, 2)), 2, 42, CAST(N'2024-10-18T16:00:29.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (83, CAST(4093.63 AS Decimal(18, 2)), 3, 18, CAST(N'2024-08-02T23:05:23.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (84, CAST(6348.17 AS Decimal(18, 2)), 10, 22, CAST(N'2024-01-13T16:12:21.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (85, CAST(7634.84 AS Decimal(18, 2)), 19, 48, CAST(N'2024-09-28T14:54:26.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (86, CAST(8170.96 AS Decimal(18, 2)), 19, 43, CAST(N'2024-09-11T19:52:14.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (87, CAST(7695.85 AS Decimal(18, 2)), 2, 20, CAST(N'2024-12-05T03:38:00.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (88, CAST(6096.89 AS Decimal(18, 2)), 7, 9, CAST(N'2024-02-08T11:30:29.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (89, CAST(2855.01 AS Decimal(18, 2)), 9, 14, CAST(N'2024-01-22T16:44:20.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (90, CAST(9929.52 AS Decimal(18, 2)), 8, 36, CAST(N'2024-02-17T12:27:16.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (91, CAST(2664.24 AS Decimal(18, 2)), 19, 24, CAST(N'2024-03-26T08:18:30.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (92, CAST(3318.23 AS Decimal(18, 2)), 16, 45, CAST(N'2024-05-07T07:53:11.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (93, CAST(2672.73 AS Decimal(18, 2)), 19, 43, CAST(N'2024-02-23T10:49:36.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (94, CAST(3932.54 AS Decimal(18, 2)), 5, 43, CAST(N'2024-08-18T23:36:08.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (95, CAST(1669.67 AS Decimal(18, 2)), 12, 28, CAST(N'2024-04-02T04:47:59.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (96, CAST(7171.96 AS Decimal(18, 2)), 2, 28, CAST(N'2024-06-22T04:34:11.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (97, CAST(3452.65 AS Decimal(18, 2)), 13, 14, CAST(N'2024-12-30T07:48:53.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (98, CAST(7922.48 AS Decimal(18, 2)), 18, 10, CAST(N'2024-12-13T13:14:42.0000000' AS DateTime2))
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (99, CAST(7427.71 AS Decimal(18, 2)), 2, 10, CAST(N'2024-12-01T07:53:10.0000000' AS DateTime2))
GO
INSERT [dbo].[Statisticals] ([Id], [TotalAmount], [TotalOrderComplicated], [TotalQuantity], [Time]) VALUES (100, CAST(1173.47 AS Decimal(18, 2)), 15, 34, CAST(N'2024-12-14T19:03:58.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Statisticals] OFF
GO
INSERT [dbo].[Subscriber] ([Id], [Email], [CreatedAt]) VALUES (N'74c8867f-5eb3-4f7c-9ad8-52d2ad5ba43f', N'quancuco27012004@gmail.com', CAST(N'2024-04-09T16:19:55.5218650' AS DateTime2))
INSERT [dbo].[Subscriber] ([Id], [Email], [CreatedAt]) VALUES (N'9d6e13e9-e3ee-42ec-9015-b2ec2b92640e', N'xxx@gmail.com', CAST(N'2024-04-09T16:20:56.6198181' AS DateTime2))
INSERT [dbo].[Subscriber] ([Id], [Email], [CreatedAt]) VALUES (N'2c60f72d-0c2e-450b-8a6a-e667d5ca8ef5', N'LTA@gmail.com', CAST(N'2024-04-09T16:47:27.5683990' AS DateTime2))
GO
INSERT [dbo].[UserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Facebook', N'1914468418951137', N'Facebook', N'a9858088-f95c-4c37-a7b2-ae46a61672a5')
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'0ce2c5a9-2082-42c8-a482-02e4f323b3b0', N'074f9358-21b5-44e1-9687-c1bc4a10f0d9')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'8a6d5570-7459-4b7c-be82-1d8f830c52f7', N'074f9358-21b5-44e1-9687-c1bc4a10f0d9')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'a9858088-f95c-4c37-a7b2-ae46a61672a5', N'074f9358-21b5-44e1-9687-c1bc4a10f0d9')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'd0f5d09a-2238-4dda-81d4-d07e1bd2adaa', N'074f9358-21b5-44e1-9687-c1bc4a10f0d9')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'fd6665d0-152d-4bae-8897-9189c92bba9b', N'074f9358-21b5-44e1-9687-c1bc4a10f0d9')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'8a6d5570-7459-4b7c-be82-1d8f830c52f7', N'08442018-0897-4d29-9e03-6c76f11ee891')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'8a6d5570-7459-4b7c-be82-1d8f830c52f7', N'24cbd229-0e88-4f56-98be-50f8aaea5080')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'aa867de0-af9b-4da9-a6fd-828a9da9318f', N'59a47acd-7e94-406e-a173-5ee30bcb092d')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'd0f5d09a-2238-4dda-81d4-d07e1bd2adaa', N'59a47acd-7e94-406e-a173-5ee30bcb092d')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'd0f5d09a-2238-4dda-81d4-d07e1bd2adaa', N'8021318f-d289-4f99-a26a-c19784fb0822')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'8021318f-d289-4f99-a26a-c19784fb0822')
GO
INSERT [dbo].[Users] ([Id], [Address], [Image], [BirthDay], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FbLink], [IgLink], [Job], [OtherLink]) VALUES (N'0ce2c5a9-2082-42c8-a482-02e4f323b3b0', N'Hn', N'https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png', CAST(N'2024-03-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-03-12T10:47:28.8777042' AS DateTime2), CAST(N'2024-03-12T10:47:28.8777058' AS DateTime2), N'Admin', N'Admin', NULL, N'Test', N'TEST', N'xxx@gmail.com', N'XXX@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEE/NVPqg2Fh9cOfY0/oFpE9Uu8IqoYzKmi290E5U4y2/I1YvgfbqevEI8Uc+18pRig==', N'OKZVVJWZYTD7SADTBAQEFXZR7HFGRNAS', N'b5eb04c9-b972-453a-8773-d80611d12f4f', N'11223312312313', 0, 0, NULL, 1, 0, N'https://www.facebook.com/', N'https://www.instagram.com/', N'Freelancer', N'Is not updated')
INSERT [dbo].[Users] ([Id], [Address], [Image], [BirthDay], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FbLink], [IgLink], [Job], [OtherLink]) VALUES (N'8a6d5570-7459-4b7c-be82-1d8f830c52f7', N'HN', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1710821771/.Net-MVC/macos.jpg', NULL, CAST(N'2024-03-09T10:46:17.7922189' AS DateTime2), CAST(N'2024-03-19T11:16:14.3807110' AS DateTime2), N'Admin', N'Admin', 0, N'User', N'USER', N'user@gmail.com', N'USER@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAELaej45AQIBPTjmDCdezoLqrBQs7tabRtcc/ZneBwAWjJVrXUkT87IfZIQ/t7n8C1w==', N'dfa8a183-1a6b-4965-862b-eb5b10b221d9', N'21898630-7515-4ec3-aad2-c0501ebacd93', N'+111111111111', 0, 1, NULL, 0, 0, N'https://www.facebook.com/', N'https://www.instagram.com/', N'FreeLancer', N'Is not updated')
INSERT [dbo].[Users] ([Id], [Address], [Image], [BirthDay], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FbLink], [IgLink], [Job], [OtherLink]) VALUES (N'a9858088-f95c-4c37-a7b2-ae46a61672a5', N'HCM city', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1710150006/.Net-MVC/hacker.png', CAST(N'2024-05-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-10T10:03:17.2609978' AS DateTime2), CAST(N'2024-05-06T16:07:03.8125943' AS DateTime2), NULL, N'QuanFB', NULL, N'QuanFB', N'QUANCUCO27012004@GMAIL.COM', N'quancuco27012004@gmail.com', N'QUANCUCO27012004@GMAIL.COM', 1, NULL, N'WIC7MZYHB7RPJGKCT324CW67VVB6GFFU', N'35ed16be-f728-4d03-be44-3034f299f996', N'03384', 0, 0, NULL, 1, 0, N'https://www.facebook.com/', N'https://www.instagram.com/', N'FreeLancer', N'Updated')
INSERT [dbo].[Users] ([Id], [Address], [Image], [BirthDay], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FbLink], [IgLink], [Job], [OtherLink]) VALUES (N'aa867de0-af9b-4da9-a6fd-828a9da9318f', N'HN', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1710148977/.Net-MVC/Hacker_1.png', NULL, CAST(N'2024-03-07T10:22:03.7399023' AS DateTime2), CAST(N'2024-03-11T16:22:58.2726018' AS DateTime2), N'Admin', N'Admin', 0, N'Manager', N'MANAGER', N'manager@gmail.com', N'MANAGER@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEAgApFgQrKrukFjE3RXIK83PIPA9lIbRmmKMAIHZqdwuXdIBHmbawAZCIJL0VTFN/g==', N'7d0d8167-c652-4335-b468-52aec88b2b5f', N'd8dd7bdb-1997-4b9f-85b8-c6d6845b2708', N'+111111111111', 1, 1, NULL, 0, 0, N'https://www.facebook.com/', N'https://www.instagram.com/', N'FreeLancer', N'Is not updated')
INSERT [dbo].[Users] ([Id], [Address], [Image], [BirthDay], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FbLink], [IgLink], [Job], [OtherLink]) VALUES (N'd0f5d09a-2238-4dda-81d4-d07e1bd2adaa', N'Hn', N'https://res.cloudinary.com/djanqnhdm/image/upload/v1710150006/.Net-MVC/hacker.png', CAST(N'2024-03-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-03-10T10:48:37.9926132' AS DateTime2), CAST(N'2024-03-11T16:40:08.0886197' AS DateTime2), N'Admin', N'Admin', NULL, N'LTA', N'LTA', N'LTA@gmail.com', N'LTA@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAECYF+ossh4TtCU8RrNp/5FzD8FtuY117+lS9kyWgDIUDDL2kSXz2xtfrLHtpXG4WXA==', N'YMREM4UPRLBLAR6XSJJUSGC6ODJDVM2W', N'4c61e93f-32a8-4aa3-8ff6-9e7dbc22b8de', N'01234', 0, 0, CAST(N'2024-03-10T14:34:06.1285870+00:00' AS DateTimeOffset), 1, 0, N'https://www.facebook.com/', N'https://www.instagram.com/', N'Freelancer', N'updated')
INSERT [dbo].[Users] ([Id], [Address], [Image], [BirthDay], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FbLink], [IgLink], [Job], [OtherLink]) VALUES (N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'HN', N'https://i.pinimg.com/originals/2a/44/dd/2a44ddddb03ab7f755db5c5c4379404e.png', CAST(N'2024-05-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-03-07T10:22:03.7383056' AS DateTime2), CAST(N'2024-05-01T20:25:46.2157263' AS DateTime2), N'Admin', N'Admin', 0, N'Admin', N'ADMIN', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJIke66xYj3eYVhd62IN9cqJHnO56HAOyFsf7HjkaDhEhQXK6IdWHODKhEtH+wMxjg==', N'0b64b870-a0c0-491b-ba1d-7c3b7e97d7b8', N'acbfd507-7dc3-48a1-a5be-1eb63d269426', N'+111111111111', 1, 0, CAST(N'2024-04-10T02:45:52.7640126+00:00' AS DateTimeOffset), 0, 0, N'https://www.facebook.com/', N'https://www.instagram.com/', N'FreeLancer', N'Is not updated')
INSERT [dbo].[Users] ([Id], [Address], [Image], [BirthDay], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FbLink], [IgLink], [Job], [OtherLink]) VALUES (N'fd6665d0-152d-4bae-8897-9189c92bba9b', NULL, N'https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png', NULL, CAST(N'2024-04-10T09:52:30.8195045' AS DateTime2), CAST(N'2024-04-10T09:52:30.8195062' AS DateTime2), N'QuanDao', N'QuanDao', NULL, N'QuanDao', N'QUANDAO', N'quanstory27222@gmail.com', N'QUANSTORY27222@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBaPjbeHzYR2APW9rCuEPyzd1L8jhre+h4oPj/psbae4ryRM+sr8BOTyPMXoMmmxXg==', N'BVAVWYGYV45JT4UJHPNEWRICHZPAOBWS', N'1d51c9c5-5769-43fa-a0da-c69188316670', NULL, 0, 0, NULL, 1, 0, N'https://www.facebook.com/', N'https://www.instagram.com/', N'Freelancer', N'Is not updated')
GO
SET IDENTITY_INSERT [dbo].[WithList] ON 

INSERT [dbo].[WithList] ([Id], [UserId], [ProductId]) VALUES (1, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'161594a3-02d4-46fb-9efa-2a1d0c450cc1')
INSERT [dbo].[WithList] ([Id], [UserId], [ProductId]) VALUES (2, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'82561316-c93b-47c1-8211-799cbc18c85f')
INSERT [dbo].[WithList] ([Id], [UserId], [ProductId]) VALUES (3, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'9cdf9565-cd71-4c33-b362-2f47444b7d87')
INSERT [dbo].[WithList] ([Id], [UserId], [ProductId]) VALUES (4, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'5e67c88e-7012-4629-9c78-48b46077b91f')
INSERT [dbo].[WithList] ([Id], [UserId], [ProductId]) VALUES (1003, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'41b3f28a-ee1d-48cb-8d95-97baa877adf8')
INSERT [dbo].[WithList] ([Id], [UserId], [ProductId]) VALUES (1005, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'41897599-8ff3-4561-8649-ddfd24457cde')
INSERT [dbo].[WithList] ([Id], [UserId], [ProductId]) VALUES (1006, N'f53b0210-58dc-44d4-a7ac-86bf416bc4b3', N'ad418b70-8692-47eb-a32f-b07115b23e72')
SET IDENTITY_INSERT [dbo].[WithList] OFF
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Advertisement] ADD  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (N'') FOR [AppUserIdFK]
GO
ALTER TABLE [dbo].[Contacts] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsRead]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (N'') FOR [Detail]
GO
ALTER TABLE [dbo].[News] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (N'') FOR [CustomerEmail]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [MethodPay]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsConfirmByUser]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsConfirmByShop]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (N'') FOR [AppUserIdFK]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (N'') FOR [Detail]
GO
ALTER TABLE [dbo].[Post] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsNew]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsHome]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsHot]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsSale]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0.0)) FOR [PriceSale]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ProductCategoryId]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (N'') FOR [ProductCode]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductImage] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDefault]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png') FOR [Image]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'https://www.facebook.com/') FOR [FbLink]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'https://www.instagram.com/') FOR [IgLink]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'FreeLancer') FOR [Job]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'Is not updated') FOR [OtherLink]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product_ProductId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users_AppUserIdFK] FOREIGN KEY([AppUserIdFK])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users_AppUserIdFK]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Category_CategoryId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users_AppUserId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product_ProductId]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category_CategoryId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory_ProductCategoryId]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product_ProductId]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
