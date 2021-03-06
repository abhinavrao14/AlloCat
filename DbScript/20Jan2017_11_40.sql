USE [master]
GO
/****** Object:  Database [AllocatNowJan4_Old]    Script Date: 1/20/2017 11:40:58 AM ******/
CREATE DATABASE [AllocatNowJan4_Old]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AllocatNowJan4_Old', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\AllocatNowJan4_Old.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AllocatNowJan4_Old_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\AllocatNowJan4_Old_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AllocatNowJan4_Old] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AllocatNowJan4_Old].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AllocatNowJan4_Old] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET ARITHABORT OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET  MULTI_USER 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AllocatNowJan4_Old] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AllocatNowJan4_Old] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AllocatNowJan4_Old]
GO
/****** Object:  UserDefinedTableType [dbo].[tempTissueBankProduct_TissueBank]    Script Date: 1/20/2017 11:40:59 AM ******/
CREATE TYPE [dbo].[tempTissueBankProduct_TissueBank] AS TABLE(
	[TissueBankProductId] [int] NULL,
	[TissueBankId] [int] NULL,
	[ProductMasterId] [int] NULL,
	[ProductType] [nvarchar](200) NULL,
	[ProductCode] [varchar](20) NULL,
	[ProductSize] [nvarchar](500) NULL,
	[PreservationType] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](500) NULL,
	[Remark] [nvarchar](200) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[SourceId] [int] NULL,
	[IsAvailableForSale] [bit] NULL,
	[AvailabilityStartDate] [datetime] NULL,
	[AvailabilityEndDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedBy] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tempUser]    Script Date: 1/20/2017 11:40:59 AM ******/
CREATE TYPE [dbo].[tempUser] AS TABLE(
	[UserId] [int] NULL,
	[UserRoles] [varchar](200) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TempUser_CUD]    Script Date: 1/20/2017 11:40:59 AM ******/
CREATE TYPE [dbo].[TempUser_CUD] AS TABLE(
	[RoleID] [int] NULL,
	[UserID] [int] NULL
)
GO
/****** Object:  Table [dbo].[City]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
	[ZipCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DomainScope]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DomainScope](
	[DomainScopeId] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [nvarchar](100) NULL,
 CONSTRAINT [PK_DomainScope] PRIMARY KEY CLUSTERED 
(
	[DomainScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entity]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityId] [int] IDENTITY(1,1) NOT NULL,
	[EntityTypeId] [int] NULL,
	[InfoId] [int] NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EntityType]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityType](
	[EntityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EntityTypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_EntityType] PRIMARY KEY CLUSTERED 
(
	[EntityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[HospitalId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [nvarchar](100) NULL,
	[DomainScopeID] [int] NULL,
	[HospitalTypeID] [int] NULL,
	[HospitalAddress] [nvarchar](300) NULL,
	[HospitalCityId] [int] NULL,
	[BusinessURL] [nvarchar](100) NULL,
	[FaxNumber] [nvarchar](20) NULL,
	[HospitalLandLineNo] [nvarchar](20) NULL,
	[RegistrationNumber] [nvarchar](20) NULL,
	[ContactPersonName] [nvarchar](100) NULL,
	[ContactPersonNumber] [nvarchar](20) NULL,
	[IsContactNumberVerified] [bit] NULL,
	[IsEmailVerified] [bit] NULL,
	[HospitalEmailId] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_Hospital_modifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HospitalAddress]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalAddress](
	[HospitalAddressId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalId] [int] NULL,
	[HospitalAddress] [nvarchar](150) NULL,
	[CityId] [int] NULL,
	[ContactPersonName] [nvarchar](100) NULL,
	[ContactPersonNumber] [nvarchar](10) NULL,
	[ContactPersonEmailId] [nvarchar](50) NULL,
	[FaxNumber] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_HospitalAddress_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_HospitalAddress] PRIMARY KEY CLUSTERED 
(
	[HospitalAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HospitalType]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalType](
	[HospitalTypeID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalTypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_HospitalType] PRIMARY KEY CLUSTERED 
(
	[HospitalTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] NOT NULL,
	[EntityTypeID] [int] NULL,
	[NotificationBody] [nvarchar](200) NULL,
	[IsSeen] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificationTag]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NotificationTag](
	[NotificationTagId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTagName] [varchar](50) NULL,
 CONSTRAINT [PK_NotificationTag] PRIMARY KEY CLUSTERED 
(
	[NotificationTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [nvarchar](100) NULL,
	[OrderDate] [datetime] NULL,
	[OrderLineTotal] [numeric](18, 2) NULL,
	[PurchaseRequestId] [int] NULL,
	[RFQId] [int] NULL,
	[AlloCATFees] [nchar](10) NULL,
	[HospitalPoNumber] [nvarchar](20) NULL,
	[StatusId] [int] NULL,
	[DeclineRemark] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_Order_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductEntityId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_OrderDetail_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductEntity]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductEntity](
	[ProductEntityId] [int] IDENTITY(1,1) NOT NULL,
	[TissueBankProductId] [int] NULL,
	[TissueBankId] [int] NULL,
	[HospitalId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[LineTotal] [numeric](18, 2) NULL,
	[SalesTax] [numeric](18, 2) NULL,
	[Total] [numeric](18, 2) NULL,
	[NeedByDate] [date] NULL,
	[TissueBankSendByDate] [date] NULL,
	[ShippingDetailId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_ProductEntity_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_ProductEntity] PRIMARY KEY CLUSTERED 
(
	[ProductEntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ProductMasterId] [int] IDENTITY(1,1) NOT NULL,
	[ProductMasterName] [nvarchar](100) NULL,
	[ProductMasterDescription] [nvarchar](300) NULL,
	[ProductMasterFeatures] [nvarchar](300) NULL,
	[ProductMasterImageName] [nvarchar](50) NULL,
	[ProductMasterThumbnailImageName] [nvarchar](50) NULL,
	[DomainScopeId] [int] NULL,
	[FamilyId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_ProductMaster_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseRequest]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseRequest](
	[PurchaseRequestId] [int] IDENTITY(1,1) NOT NULL,
	[ParentRequestForQuoteId] [int] NULL,
	[ProductEntityId] [int] NULL,
	[AssignedToUserId] [int] NULL,
	[AssignedByUserId] [int] NULL,
	[Remark] [nvarchar](200) NULL,
	[StatusId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_Purchaserequest] PRIMARY KEY CLUSTERED 
(
	[PurchaseRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[ReportTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ReportTypeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_ReportType] PRIMARY KEY CLUSTERED 
(
	[ReportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalId] [int] NULL,
	[RequestForQuoteId] [int] NULL,
	[RequestBody] [nvarchar](max) NULL,
	[AttachmentName] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_Request_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestForQuote]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestForQuote](
	[RequestForQuoteId] [int] IDENTITY(1,1) NOT NULL,
	[ProductEntityId] [int] NULL,
	[StatusId] [int] NULL,
	[DeclineRemark] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_RequestForQuote_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_RequestForQuote] PRIMARY KEY CLUSTERED 
(
	[RequestForQuoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Response]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[ResponseId] [int] IDENTITY(1,1) NOT NULL,
	[TissueBankId] [int] NULL,
	[RequestID] [int] NULL,
	[ResponseBody] [nvarchar](max) NULL,
	[AttachmentName] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_Response_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_Response] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[EntityTypeID] [int] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingDetail]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetail](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ShippingMethod] [nvarchar](100) NULL,
	[HospitalAddressId] [int] NULL,
	[ShippedDate] [datetime] NULL,
	[ReceivedDate] [datetime] NULL,
 CONSTRAINT [PK_ShippingDetail] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Source]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source](
	[SourceId] [int] IDENTITY(1,1) NOT NULL,
	[SourceName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Source] PRIMARY KEY CLUSTERED 
(
	[SourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [nvarchar](50) NULL,
	[StatusName] [nvarchar](100) NULL,
	[ReportTypeId] [int] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaggedNotification]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaggedNotification](
	[TaggedNotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NULL,
	[NotificationTagId] [int] NULL,
 CONSTRAINT [PK_TaggedNotification] PRIMARY KEY CLUSTERED 
(
	[TaggedNotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TissueBank]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TissueBank](
	[TissueBankId] [int] IDENTITY(1,1) NOT NULL,
	[TissueBankName] [nvarchar](100) NULL,
	[ContactPersonName] [nvarchar](100) NULL,
	[ContactPersonNumber] [nvarchar](20) NULL,
	[TissueBankEmailId] [nvarchar](50) NULL,
	[BusinessURL] [nvarchar](100) NULL,
	[IsMobileVerified] [bit] NULL,
	[IsEmailVerified] [bit] NULL,
	[TissueBankAddress] [nvarchar](300) NULL,
	[CityId] [int] NULL,
	[TissueBankStateLicense] [nvarchar](50) NULL,
	[CustomerServiceLandLineNumber] [nvarchar](30) NULL,
	[FaxNumber] [nvarchar](50) NULL,
	[TaxPayerId] [nvarchar](50) NULL,
	[AATBLicenseNumber] [nvarchar](30) NULL,
	[AATBExpirationDate] [date] NULL,
	[AATBAccredationDate] [date] NULL,
	[IsAllocatMember] [bit] NULL,
	[IsAccountVerified] [bit] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_TissueBank_IsActive]  DEFAULT ((1)),
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_TissueBank_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_TissueBank] PRIMARY KEY CLUSTERED 
(
	[TissueBankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TissueBankProduct]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TissueBankProduct](
	[TissueBankProductId] [int] IDENTITY(1,1) NOT NULL,
	[TissueBankId] [int] NULL,
	[ProductMasterId] [int] NULL,
	[ProductType] [nvarchar](200) NULL,
	[ProductCode] [varchar](20) NULL,
	[ProductSize] [nvarchar](500) NULL,
	[PreservationType] [nvarchar](100) NULL,
	[ProductDescription] [nvarchar](500) NULL,
	[Remark] [nvarchar](200) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[SourceId] [int] NULL,
	[IsAvailableForSale] [bit] NULL CONSTRAINT [DF_TissueBankProduct_IsAvailableForSale]  DEFAULT ((0)),
	[AvailabilityStartDate] [datetime] NULL,
	[AvailabilityEndDate] [datetime] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_TissueBankProduct_IsActive]  DEFAULT ((1)),
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_TbProduct] PRIMARY KEY CLUSTERED 
(
	[TissueBankProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](200) NULL,
	[EntityID] [int] NULL,
	[DomainScopeID] [int] NULL CONSTRAINT [DF_User_DomainScopeID]  DEFAULT (NULL),
	[MobileNumber] [varchar](20) NULL,
	[EmailId] [nvarchar](100) NULL,
	[IsMobileVerified] [bit] NULL CONSTRAINT [DF_User_IsMobileVerified]  DEFAULT ((0)),
	[IsEmailVerified] [bit] NULL CONSTRAINT [DF_User_IsEmailVerified]  DEFAULT ((0)),
	[IsLockedOut] [bit] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NULL,
	[FailedPasswordAttemptCount] [int] NULL,
	[FailedPasswordAnswerAttemptCount] [int] NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[SecurityQuestion] [varchar](100) NULL,
	[SecurityAnswer] [varchar](100) NULL,
	[AllowLogin] [bit] NULL CONSTRAINT [DF_User_AllowLogin]  DEFAULT ((1)),
	[IsActive] [bit] NULL CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)),
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[LastModifiedDate] [datetime] NULL CONSTRAINT [DF_User_LastModifiedDate]  DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_UserRoleID] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [StateId], [ZipCode]) VALUES (4, N'HUNTSVILLE', 1, N'12345')
INSERT [dbo].[City] ([CityID], [CityName], [StateId], [ZipCode]) VALUES (6, N'DOTHAN', 1, N'32145')
INSERT [dbo].[City] ([CityID], [CityName], [StateId], [ZipCode]) VALUES (7, N'AUBURN', 1, N'12345')
INSERT [dbo].[City] ([CityID], [CityName], [StateId], [ZipCode]) VALUES (8, N'SAN FRANCISCO', 3, N'12345')
INSERT [dbo].[City] ([CityID], [CityName], [StateId], [ZipCode]) VALUES (9, N'SAN RAFAEL', 3, N'12345')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [CompanyName]) VALUES (1, N'Allocat')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[DomainScope] ON 

INSERT [dbo].[DomainScope] ([DomainScopeId], [DomainName]) VALUES (1, N'DENTAL')
SET IDENTITY_INSERT [dbo].[DomainScope] OFF
SET IDENTITY_INSERT [dbo].[Entity] ON 

INSERT [dbo].[Entity] ([EntityId], [EntityTypeId], [InfoId]) VALUES (1, 1, 3)
INSERT [dbo].[Entity] ([EntityId], [EntityTypeId], [InfoId]) VALUES (2, 2, 28)
INSERT [dbo].[Entity] ([EntityId], [EntityTypeId], [InfoId]) VALUES (3, 3, 1)
INSERT [dbo].[Entity] ([EntityId], [EntityTypeId], [InfoId]) VALUES (8, 1, 3)
INSERT [dbo].[Entity] ([EntityId], [EntityTypeId], [InfoId]) VALUES (9, 2, 28)
INSERT [dbo].[Entity] ([EntityId], [EntityTypeId], [InfoId]) VALUES (10, 2, 28)
INSERT [dbo].[Entity] ([EntityId], [EntityTypeId], [InfoId]) VALUES (11, 2, 35)
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[EntityType] ON 

INSERT [dbo].[EntityType] ([EntityTypeId], [EntityTypeName]) VALUES (1, N'HOSPITAL')
INSERT [dbo].[EntityType] ([EntityTypeId], [EntityTypeName]) VALUES (2, N'TISSUEBANK')
INSERT [dbo].[EntityType] ([EntityTypeId], [EntityTypeName]) VALUES (3, N'ALLOCAT STAFF')
SET IDENTITY_INSERT [dbo].[EntityType] OFF
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([HospitalId], [HospitalName], [DomainScopeID], [HospitalTypeID], [HospitalAddress], [HospitalCityId], [BusinessURL], [FaxNumber], [HospitalLandLineNo], [RegistrationNumber], [ContactPersonName], [ContactPersonNumber], [IsContactNumberVerified], [IsEmailVerified], [HospitalEmailId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, N'St. Rafeals', 1, 2, N'California, US', 4, NULL, N'1234567890', N'1234567890', N'FR4587', N'James', N'8085202993', 1, 1, N'admin@gmail.com', 1, CAST(N'2016-11-23 00:00:00.000' AS DateTime), 1, CAST(N'2016-11-23 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Hospital] OFF
SET IDENTITY_INSERT [dbo].[HospitalAddress] ON 

INSERT [dbo].[HospitalAddress] ([HospitalAddressId], [HospitalId], [HospitalAddress], [CityId], [ContactPersonName], [ContactPersonNumber], [ContactPersonEmailId], [FaxNumber], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, 3, N'11/2 California, US', 4, N'JAMES', N'8085202993', N'aditya.shrivastava@returnonweb.com', N'4589632654', 1, CAST(N'2016-11-23 00:00:00.000' AS DateTime), 8, CAST(N'2016-11-23 00:00:00.000' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[HospitalAddress] OFF
SET IDENTITY_INSERT [dbo].[HospitalType] ON 

INSERT [dbo].[HospitalType] ([HospitalTypeID], [HospitalTypeName]) VALUES (1, N'LARGE')
INSERT [dbo].[HospitalType] ([HospitalTypeID], [HospitalTypeName]) VALUES (2, N'SMALL')
SET IDENTITY_INSERT [dbo].[HospitalType] OFF
SET IDENTITY_INSERT [dbo].[NotificationTag] ON 

INSERT [dbo].[NotificationTag] ([NotificationTagId], [NotificationTagName]) VALUES (1, N'RFQ')
INSERT [dbo].[NotificationTag] ([NotificationTagId], [NotificationTagName]) VALUES (2, N'TissueBankUser')
INSERT [dbo].[NotificationTag] ([NotificationTagId], [NotificationTagName]) VALUES (3, N'AllocatAdminUser')
INSERT [dbo].[NotificationTag] ([NotificationTagId], [NotificationTagName]) VALUES (4, N'HospitalUser')
INSERT [dbo].[NotificationTag] ([NotificationTagId], [NotificationTagName]) VALUES (5, N'PO')
INSERT [dbo].[NotificationTag] ([NotificationTagId], [NotificationTagName]) VALUES (6, N'PR')
SET IDENTITY_INSERT [dbo].[NotificationTag] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [TransactionNumber], [OrderDate], [OrderLineTotal], [PurchaseRequestId], [RFQId], [AlloCATFees], [HospitalPoNumber], [StatusId], [DeclineRemark], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, NULL, CAST(N'2017-01-06 11:30:16.373' AS DateTime), CAST(760.00 AS Numeric(18, 2)), NULL, NULL, N'14        ', NULL, 1008, NULL, 1, CAST(N'2017-01-06 11:30:16.373' AS DateTime), 11, CAST(N'2017-01-09 14:06:30.653' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderId], [TransactionNumber], [OrderDate], [OrderLineTotal], [PurchaseRequestId], [RFQId], [AlloCATFees], [HospitalPoNumber], [StatusId], [DeclineRemark], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, NULL, CAST(N'2017-01-06 14:56:59.017' AS DateTime), CAST(79.00 AS Numeric(18, 2)), NULL, NULL, N'5         ', NULL, 1008, NULL, 1, CAST(N'2017-01-06 14:56:59.017' AS DateTime), 8, CAST(N'2017-01-06 14:56:59.017' AS DateTime), 8)
INSERT [dbo].[Order] ([OrderId], [TransactionNumber], [OrderDate], [OrderLineTotal], [PurchaseRequestId], [RFQId], [AlloCATFees], [HospitalPoNumber], [StatusId], [DeclineRemark], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, NULL, CAST(N'2017-01-10 19:20:16.323' AS DateTime), CAST(79.00 AS Numeric(18, 2)), NULL, NULL, N'5         ', NULL, 5, N'i dont like it', 1, CAST(N'2017-01-10 19:20:16.323' AS DateTime), 8, CAST(N'2017-01-10 19:28:11.383' AS DateTime), 9)
INSERT [dbo].[Order] ([OrderId], [TransactionNumber], [OrderDate], [OrderLineTotal], [PurchaseRequestId], [RFQId], [AlloCATFees], [HospitalPoNumber], [StatusId], [DeclineRemark], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (4, NULL, CAST(N'2017-01-10 19:32:41.350' AS DateTime), CAST(79.00 AS Numeric(18, 2)), NULL, NULL, N'5         ', NULL, 1008, NULL, 1, CAST(N'2017-01-10 19:32:41.350' AS DateTime), 8, CAST(N'2017-01-12 16:20:19.697' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductEntityId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, 1, 1059, CAST(N'2017-01-06 11:30:16.373' AS DateTime), 8, CAST(N'2017-01-06 11:30:16.373' AS DateTime), 8)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductEntityId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, 2, 1060, CAST(N'2017-01-06 14:56:59.017' AS DateTime), 8, CAST(N'2017-01-06 14:56:59.017' AS DateTime), 8)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductEntityId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, 3, 1061, CAST(N'2017-01-10 19:20:16.323' AS DateTime), 8, CAST(N'2017-01-10 19:20:16.323' AS DateTime), 8)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductEntityId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (4, 4, 1062, CAST(N'2017-01-10 19:32:41.350' AS DateTime), 8, CAST(N'2017-01-10 19:32:41.350' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[ProductEntity] ON 

INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 1, 28, 3, 1, CAST(250.00 AS Numeric(18, 2)), CAST(250.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(260.00 AS Numeric(18, 2)), CAST(N'2016-12-29' AS Date), CAST(N'2017-01-24' AS Date), 1, CAST(N'2016-12-28 12:55:19.967' AS DateTime), 8, CAST(N'2017-01-12 16:15:36.563' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 2, 28, 3, 1, CAST(4522.00 AS Numeric(18, 2)), CAST(4522.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(4532.00 AS Numeric(18, 2)), CAST(N'2017-01-01' AS Date), NULL, 2, CAST(N'2016-12-28 18:32:27.853' AS DateTime), 8, CAST(N'2017-01-04 15:56:43.313' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 3, 28, 3, 1, CAST(250.00 AS Numeric(18, 2)), CAST(250.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(260.00 AS Numeric(18, 2)), CAST(N'2017-01-12' AS Date), CAST(N'2017-01-20' AS Date), 3, CAST(N'2016-12-28 18:32:36.067' AS DateTime), 8, CAST(N'2017-01-04 15:34:06.100' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 1006, 28, 3, 1, CAST(500.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)), CAST(12.00 AS Numeric(18, 2)), CAST(512.00 AS Numeric(18, 2)), CAST(N'2016-01-12' AS Date), NULL, 4, CAST(N'2017-01-04 16:47:56.707' AS DateTime), 8, CAST(N'2017-01-04 18:32:49.417' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 1007, 28, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), NULL, 5, CAST(N'2017-01-05 16:04:54.560' AS DateTime), 8, CAST(N'2017-01-05 16:04:54.560' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 1008, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 6, CAST(N'2017-01-05 14:00:43.253' AS DateTime), 8, CAST(N'2017-01-05 14:00:43.253' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1009, 1009, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 7, CAST(N'2017-01-05 14:00:43.860' AS DateTime), 8, CAST(N'2017-01-05 14:00:43.860' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1010, 1010, 28, 3, 1, CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(N'2016-12-23' AS Date), NULL, 8, CAST(N'2017-01-05 14:00:44.413' AS DateTime), 8, CAST(N'2017-01-05 17:09:15.260' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1011, 1011, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 9, CAST(N'2017-01-05 14:00:44.757' AS DateTime), 8, CAST(N'2017-01-05 14:00:44.757' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1012, 1012, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 10, CAST(N'2017-01-05 14:00:45.043' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.043' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1013, 1013, 28, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), NULL, 11, CAST(N'2017-01-05 16:06:19.010' AS DateTime), 8, CAST(N'2017-01-05 16:06:19.010' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1014, 1014, 28, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), NULL, 12, CAST(N'2017-01-05 16:06:14.453' AS DateTime), 8, CAST(N'2017-01-05 16:06:14.453' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1015, 1015, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 13, CAST(N'2017-01-05 14:00:45.990' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.990' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1016, 1016, 28, 3, 1, CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(N'2016-12-23' AS Date), NULL, 14, CAST(N'2017-01-05 14:00:46.190' AS DateTime), 8, CAST(N'2017-01-05 17:09:39.357' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1019, 1017, 30, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 17, CAST(N'2017-01-05 14:01:56.477' AS DateTime), 8, CAST(N'2017-01-05 14:01:56.477' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1020, 1018, 30, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 18, CAST(N'2017-01-05 14:01:57.293' AS DateTime), 8, CAST(N'2017-01-05 14:01:57.293' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1021, 1, 30, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), NULL, 19, CAST(N'2017-01-05 16:06:23.937' AS DateTime), 8, CAST(N'2017-01-05 16:06:23.937' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1022, 2, 30, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 20, CAST(N'2017-01-05 14:02:17.873' AS DateTime), 8, CAST(N'2017-01-05 14:02:17.873' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1023, 3, 30, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 21, CAST(N'2017-01-05 14:02:22.640' AS DateTime), 8, CAST(N'2017-01-05 14:02:22.640' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1024, 1006, 30, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 22, CAST(N'2017-01-05 14:02:25.943' AS DateTime), 8, CAST(N'2017-01-05 14:02:25.943' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1025, 1007, 27, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 23, CAST(N'2017-01-05 14:02:43.307' AS DateTime), 8, CAST(N'2017-01-05 14:02:43.307' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1026, 1008, 27, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 24, CAST(N'2017-01-05 14:02:50.427' AS DateTime), 8, CAST(N'2017-01-05 14:02:50.427' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1027, 1009, 27, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 25, CAST(N'2017-01-05 14:02:53.873' AS DateTime), 8, CAST(N'2017-01-05 14:02:53.873' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1028, 1010, 27, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 26, CAST(N'2017-01-05 14:02:57.030' AS DateTime), 8, CAST(N'2017-01-05 14:02:57.030' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1029, 1011, 29, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), NULL, 27, CAST(N'2017-01-05 16:06:29.353' AS DateTime), 8, CAST(N'2017-01-05 16:06:29.353' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1030, 1012, 29, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 28, CAST(N'2017-01-05 14:03:16.803' AS DateTime), 8, CAST(N'2017-01-05 14:03:16.803' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1031, 1013, 29, 3, 1, CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(N'2016-12-23' AS Date), NULL, 29, CAST(N'2017-01-05 14:03:19.073' AS DateTime), 8, CAST(N'2017-01-05 14:15:54.577' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1032, 1014, 29, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), NULL, 30, CAST(N'2017-01-05 16:06:34.590' AS DateTime), 8, CAST(N'2017-01-05 16:06:34.590' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1033, 1015, 26, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 31, CAST(N'2017-01-05 14:03:59.910' AS DateTime), 8, CAST(N'2017-01-05 14:03:59.910' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1035, 1016, 27, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), NULL, 33, CAST(N'2017-01-05 14:04:39.413' AS DateTime), 8, CAST(N'2017-01-05 14:04:39.413' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1036, 1017, 28, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 34, CAST(N'2017-01-05 16:06:38.247' AS DateTime), 8, CAST(N'2017-01-05 16:06:38.247' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1037, 1018, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 35, CAST(N'2017-01-05 14:05:00.770' AS DateTime), 8, CAST(N'2017-01-05 14:05:00.770' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1038, 1, 30, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 36, CAST(N'2017-01-05 16:06:41.893' AS DateTime), 8, CAST(N'2017-01-05 16:06:41.893' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1040, 2, 26, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 38, CAST(N'2017-01-05 14:05:21.953' AS DateTime), 8, CAST(N'2017-01-05 14:05:21.953' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1041, 3, 26, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 39, CAST(N'2017-01-05 16:06:57.497' AS DateTime), 8, CAST(N'2017-01-05 16:06:57.497' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1042, 1006, 26, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 40, CAST(N'2017-01-05 16:07:01.407' AS DateTime), 8, CAST(N'2017-01-05 16:07:01.407' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1043, 1007, 30, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 41, CAST(N'2017-01-05 14:05:37.330' AS DateTime), 8, CAST(N'2017-01-05 14:05:37.330' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1044, 1008, 30, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 42, CAST(N'2017-01-05 16:07:25.023' AS DateTime), 8, CAST(N'2017-01-05 16:07:25.023' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1045, 1009, 26, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 43, CAST(N'2017-01-05 14:06:04.687' AS DateTime), 8, CAST(N'2017-01-05 14:06:04.687' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1046, 1010, 26, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 44, CAST(N'2017-01-05 14:06:07.240' AS DateTime), 8, CAST(N'2017-01-05 14:06:07.240' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1047, 1011, 26, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 45, CAST(N'2017-01-05 16:06:48.980' AS DateTime), 8, CAST(N'2017-01-05 16:06:48.980' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1048, 1012, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 46, CAST(N'2017-01-05 14:06:15.600' AS DateTime), 8, CAST(N'2017-01-05 14:06:15.600' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1049, 1013, 28, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 47, CAST(N'2017-01-05 16:07:04.190' AS DateTime), 8, CAST(N'2017-01-05 16:07:04.190' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1050, 1014, 28, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 48, CAST(N'2017-01-05 14:06:22.583' AS DateTime), 8, CAST(N'2017-01-05 14:06:22.583' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1051, 1015, 29, 3, 2, CAST(350.00 AS Numeric(18, 2)), CAST(700.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(715.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-01-06' AS Date), 49, CAST(N'2017-01-05 16:07:07.297' AS DateTime), 8, CAST(N'2017-01-05 20:29:09.647' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1052, 1016, 29, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 50, CAST(N'2017-01-05 14:06:35.727' AS DateTime), 8, CAST(N'2017-01-05 14:06:35.727' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1053, 1017, 29, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 51, CAST(N'2017-01-05 16:07:09.937' AS DateTime), 8, CAST(N'2017-01-05 16:07:09.937' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1054, 1018, 29, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 52, CAST(N'2017-01-05 14:06:41.570' AS DateTime), 8, CAST(N'2017-01-05 14:06:41.570' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1055, 1, 30, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 53, CAST(N'2017-01-05 16:07:12.180' AS DateTime), 8, CAST(N'2017-01-05 19:20:40.420' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1056, 2, 30, 3, 1, NULL, NULL, NULL, NULL, CAST(N'2016-12-23' AS Date), CAST(N'2017-12-24' AS Date), 54, CAST(N'2017-01-05 14:06:50.433' AS DateTime), 8, CAST(N'2017-01-05 14:06:50.433' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1057, 3, 30, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 55, CAST(N'2017-01-05 16:07:14.117' AS DateTime), 8, CAST(N'2017-01-05 17:13:31.120' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1058, 1006, 30, 3, 2, CAST(510.00 AS Numeric(18, 2)), CAST(1020.00 AS Numeric(18, 2)), CAST(15.00 AS Numeric(18, 2)), CAST(1035.00 AS Numeric(18, 2)), CAST(N'2016-01-29' AS Date), CAST(N'2017-12-24' AS Date), 56, CAST(N'2017-01-05 16:07:18.683' AS DateTime), 8, CAST(N'2017-01-05 16:07:18.683' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1059, 1006, 28, 3, 1, CAST(750.00 AS Numeric(18, 2)), CAST(750.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(760.00 AS Numeric(18, 2)), CAST(N'2016-12-23' AS Date), CAST(N'2017-01-31' AS Date), 57, CAST(N'2017-01-06 11:30:16.373' AS DateTime), 8, CAST(N'2017-01-09 14:06:30.670' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1060, 1007, 28, 3, 1, CAST(69.00 AS Numeric(18, 2)), CAST(69.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(79.00 AS Numeric(18, 2)), CAST(N'2016-01-08' AS Date), NULL, 58, CAST(N'2017-01-06 14:56:59.017' AS DateTime), 8, CAST(N'2017-01-06 14:56:59.017' AS DateTime), 8)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1061, 1010, 28, 3, 1, CAST(695.00 AS Numeric(18, 2)), CAST(695.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(705.00 AS Numeric(18, 2)), CAST(N'2016-01-14' AS Date), NULL, 59, CAST(N'2017-01-10 19:20:16.323' AS DateTime), 8, CAST(N'2017-01-10 19:28:11.383' AS DateTime), 9)
INSERT [dbo].[ProductEntity] ([ProductEntityId], [TissueBankProductId], [TissueBankId], [HospitalId], [Quantity], [UnitPrice], [LineTotal], [SalesTax], [Total], [NeedByDate], [TissueBankSendByDate], [ShippingDetailId], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1062, 1011, 28, 3, 1, CAST(452.00 AS Numeric(18, 2)), CAST(452.00 AS Numeric(18, 2)), CAST(10.00 AS Numeric(18, 2)), CAST(462.00 AS Numeric(18, 2)), CAST(N'2016-02-01' AS Date), CAST(N'2017-01-04' AS Date), 60, CAST(N'2017-01-10 19:32:41.350' AS DateTime), 8, CAST(N'2017-01-12 16:20:19.697' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[ProductEntity] OFF
SET IDENTITY_INSERT [dbo].[ProductMaster] ON 

INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'AdMatrix
', N'AdMatrix supports tissue regeneration by allowing rapid revascularization, white cell migration and cell population, ultimately being transformed into host tissue for natural repair.
', NULL, N'product.jpg', NULL, 1, NULL, 1, CAST(N'2016-12-09 00:00:00.000' AS DateTime), 1, CAST(N'2016-12-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Bone Pin
', N'Cortical bone pins are long, thin pieces of cortical bone
', NULL, N'product.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-09 10:50:45.023' AS DateTime), NULL)
INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, N'Bone Wrap
', N'Cortical bone wraps are thin sheets of cortical bone
', NULL, N'product.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-09 10:50:54.087' AS DateTime), NULL)
INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (4, N'Cancellous
', N'Cancellous for dental is cut, milled cancellous bone particulate
', NULL, N'product.jpg', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-09 10:51:01.393' AS DateTime), NULL)
INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (5, N'Cancellous Cubes', N'Cancellous cubes are milled and sieved pieces of cancellous bone', NULL, N'product.jpg', NULL, 1, NULL, 1, CAST(N'2016-12-12 00:00:00.000' AS DateTime), 1, CAST(N'2016-12-14 17:44:20.803' AS DateTime), 1)
INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (6, N'Cancellous Crushed', N'Proximal and distal ends of long bones, ilium, calcaneus or talus', NULL, N'product.jpg', NULL, 1, NULL, 1, CAST(N'2016-12-12 00:00:00.000' AS DateTime), 1, CAST(N'2016-12-14 17:45:03.187' AS DateTime), 1)
INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (7, N'Unicortical Cancellous Platform', NULL, NULL, N'product.jpg', NULL, 1, NULL, 1, CAST(N'2016-12-12 00:00:00.000' AS DateTime), 1, CAST(N'2016-12-14 18:13:42.587' AS DateTime), 1)
INSERT [dbo].[ProductMaster] ([ProductMasterId], [ProductMasterName], [ProductMasterDescription], [ProductMasterFeatures], [ProductMasterImageName], [ProductMasterThumbnailImageName], [DomainScopeId], [FamilyId], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (8, N'AdMatrix', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-28 11:21:43.247' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ProductMaster] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (5, 3, 1002, N'Please let me know more about this product measurement.', NULL, CAST(N'2016-12-28 12:55:19.967' AS DateTime), 8, CAST(N'2016-12-28 12:55:19.967' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (6, 3, 1003, N'Please let me know more about this product measurement. 11', NULL, CAST(N'2016-12-28 18:32:27.853' AS DateTime), 8, CAST(N'2016-12-28 18:32:27.853' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (7, 3, 1004, N'Please let me know more about this product measurement. 12', NULL, CAST(N'2016-12-28 18:32:36.067' AS DateTime), 8, CAST(N'2016-12-28 18:32:36.067' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1005, 3, 2002, N'Do you have size 100 cc?', NULL, CAST(N'2017-01-04 16:47:56.707' AS DateTime), 8, CAST(N'2017-01-04 16:47:56.707' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 3, 2003, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:42.567' AS DateTime), 8, CAST(N'2017-01-05 14:00:42.567' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 3, 2004, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:43.253' AS DateTime), 8, CAST(N'2017-01-05 14:00:43.253' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 3, 2005, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:43.860' AS DateTime), 8, CAST(N'2017-01-05 14:00:43.860' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1009, 3, 2006, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:44.413' AS DateTime), 8, CAST(N'2017-01-05 14:00:44.413' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1010, 3, 2007, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:44.757' AS DateTime), 8, CAST(N'2017-01-05 14:00:44.757' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1011, 3, 2008, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:45.043' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.043' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1012, 3, 2009, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:45.243' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.243' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1013, 3, 2010, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:45.610' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.610' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1014, 3, 2011, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:45.990' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.990' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1015, 3, 2012, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:00:46.190' AS DateTime), 8, CAST(N'2017-01-05 14:00:46.190' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1016, 3, 2013, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:01:56.477' AS DateTime), 8, CAST(N'2017-01-05 14:01:56.477' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1017, 3, 2014, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:01:57.293' AS DateTime), 8, CAST(N'2017-01-05 14:01:57.293' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1018, 3, 2015, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:01:57.763' AS DateTime), 8, CAST(N'2017-01-05 14:01:57.763' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1019, 3, 2016, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:02:17.873' AS DateTime), 8, CAST(N'2017-01-05 14:02:17.873' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1020, 3, 2017, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:02:22.640' AS DateTime), 8, CAST(N'2017-01-05 14:02:22.640' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1021, 3, 2018, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:02:25.943' AS DateTime), 8, CAST(N'2017-01-05 14:02:25.943' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1022, 3, 2019, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:02:43.307' AS DateTime), 8, CAST(N'2017-01-05 14:02:43.307' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1023, 3, 2020, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:02:50.427' AS DateTime), 8, CAST(N'2017-01-05 14:02:50.427' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1024, 3, 2021, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:02:53.873' AS DateTime), 8, CAST(N'2017-01-05 14:02:53.873' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1025, 3, 2022, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:02:57.030' AS DateTime), 8, CAST(N'2017-01-05 14:02:57.030' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1026, 3, 2023, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:03:12.507' AS DateTime), 8, CAST(N'2017-01-05 14:03:12.507' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1027, 3, 2024, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:03:16.803' AS DateTime), 8, CAST(N'2017-01-05 14:03:16.803' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1028, 3, 2025, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:03:19.073' AS DateTime), 8, CAST(N'2017-01-05 14:03:19.073' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1029, 3, 2026, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:03:21.937' AS DateTime), 8, CAST(N'2017-01-05 14:03:21.937' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1030, 3, 2027, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:03:59.910' AS DateTime), 8, CAST(N'2017-01-05 14:03:59.910' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1031, 3, 2028, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:04:39.413' AS DateTime), 8, CAST(N'2017-01-05 14:04:39.413' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1032, 3, 2029, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:04:45.783' AS DateTime), 8, CAST(N'2017-01-05 14:04:45.783' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1033, 3, 2030, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:05:00.770' AS DateTime), 8, CAST(N'2017-01-05 14:05:00.770' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1034, 3, 2031, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:05:05.227' AS DateTime), 8, CAST(N'2017-01-05 14:05:05.227' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1035, 3, 2032, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:05:21.953' AS DateTime), 8, CAST(N'2017-01-05 14:05:21.953' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1036, 3, 2033, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:05:25.940' AS DateTime), 8, CAST(N'2017-01-05 14:05:25.940' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1037, 3, 2034, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:05:30.020' AS DateTime), 8, CAST(N'2017-01-05 14:05:30.020' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1038, 3, 2035, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:05:37.330' AS DateTime), 8, CAST(N'2017-01-05 14:05:37.330' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1039, 3, 2036, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:05:40.793' AS DateTime), 8, CAST(N'2017-01-05 14:05:40.793' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1040, 3, 2037, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:04.687' AS DateTime), 8, CAST(N'2017-01-05 14:06:04.687' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1041, 3, 2038, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:07.240' AS DateTime), 8, CAST(N'2017-01-05 14:06:07.240' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1042, 3, 2039, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:10.303' AS DateTime), 8, CAST(N'2017-01-05 14:06:10.303' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1043, 3, 2040, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:15.600' AS DateTime), 8, CAST(N'2017-01-05 14:06:15.600' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1044, 3, 2041, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:19.280' AS DateTime), 8, CAST(N'2017-01-05 14:06:19.280' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1045, 3, 2042, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:22.583' AS DateTime), 8, CAST(N'2017-01-05 14:06:22.583' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1046, 3, 2043, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:33.237' AS DateTime), 8, CAST(N'2017-01-05 14:06:33.237' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1047, 3, 2044, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:35.727' AS DateTime), 8, CAST(N'2017-01-05 14:06:35.727' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1048, 3, 2045, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:38.543' AS DateTime), 8, CAST(N'2017-01-05 14:06:38.543' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1049, 3, 2046, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:41.570' AS DateTime), 8, CAST(N'2017-01-05 14:06:41.570' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1050, 3, 2047, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:48.183' AS DateTime), 8, CAST(N'2017-01-05 14:06:48.183' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1051, 3, 2048, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:50.433' AS DateTime), 8, CAST(N'2017-01-05 14:06:50.433' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1052, 3, 2049, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:53.093' AS DateTime), 8, CAST(N'2017-01-05 14:06:53.093' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1053, 3, 2050, N'Please let me know more about this product', NULL, CAST(N'2017-01-05 14:06:56.527' AS DateTime), 8, CAST(N'2017-01-05 14:06:56.527' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1054, 3, 2003, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:04:54.560' AS DateTime), 8, CAST(N'2017-01-05 16:04:54.560' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1055, 3, 2010, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:14.453' AS DateTime), 8, CAST(N'2017-01-05 16:06:14.453' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1056, 3, 2009, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:19.010' AS DateTime), 8, CAST(N'2017-01-05 16:06:19.010' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1057, 3, 2015, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:23.937' AS DateTime), 8, CAST(N'2017-01-05 16:06:23.937' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1058, 3, 2023, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:29.353' AS DateTime), 8, CAST(N'2017-01-05 16:06:29.353' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1059, 3, 2026, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:34.590' AS DateTime), 8, CAST(N'2017-01-05 16:06:34.590' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1060, 3, 2029, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:38.247' AS DateTime), 8, CAST(N'2017-01-05 16:06:38.247' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1061, 3, 2031, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:41.893' AS DateTime), 8, CAST(N'2017-01-05 16:06:41.893' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1062, 3, 2034, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:45.017' AS DateTime), 8, CAST(N'2017-01-05 16:06:45.017' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1063, 3, 2039, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:48.980' AS DateTime), 8, CAST(N'2017-01-05 16:06:48.980' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1064, 3, 2033, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:06:57.497' AS DateTime), 8, CAST(N'2017-01-05 16:06:57.497' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1065, 3, 2034, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:01.407' AS DateTime), 8, CAST(N'2017-01-05 16:07:01.407' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1066, 3, 2041, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:04.190' AS DateTime), 8, CAST(N'2017-01-05 16:07:04.190' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1067, 3, 2043, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:07.297' AS DateTime), 8, CAST(N'2017-01-05 16:07:07.297' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1068, 3, 2045, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:09.937' AS DateTime), 8, CAST(N'2017-01-05 16:07:09.937' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1069, 3, 2047, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:12.180' AS DateTime), 8, CAST(N'2017-01-05 16:07:12.180' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1070, 3, 2049, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:14.117' AS DateTime), 8, CAST(N'2017-01-05 16:07:14.117' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1071, 3, 2050, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:18.683' AS DateTime), 8, CAST(N'2017-01-05 16:07:18.683' AS DateTime), 8)
INSERT [dbo].[Request] ([RequestID], [HospitalId], [RequestForQuoteId], [RequestBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1072, 3, 2036, N'Ok. But I need to have it by tomorrow only.', NULL, CAST(N'2017-01-05 16:07:25.023' AS DateTime), 8, CAST(N'2017-01-05 16:07:25.023' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[RequestForQuote] ON 

INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1002, 1003, 5, N'I am not liking this deal', CAST(N'2016-12-28 12:55:19.967' AS DateTime), 8, CAST(N'2017-01-12 16:15:36.563' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1003, 1004, 3, NULL, CAST(N'2016-12-28 18:32:27.853' AS DateTime), 8, CAST(N'2017-01-04 15:56:43.313' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1004, 1005, 4, N'dd', CAST(N'2016-12-28 18:32:36.067' AS DateTime), 8, CAST(N'2017-01-04 15:34:06.100' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2002, 1006, 5, NULL, CAST(N'2017-01-04 16:47:56.707' AS DateTime), 8, CAST(N'2017-01-04 18:32:49.417' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2003, 1007, 2, NULL, CAST(N'2017-01-05 14:00:42.567' AS DateTime), 8, CAST(N'2017-01-05 16:04:54.560' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2004, 1008, 2, NULL, CAST(N'2017-01-05 14:00:43.253' AS DateTime), 8, CAST(N'2017-01-05 14:00:43.253' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2005, 1009, 2, NULL, CAST(N'2017-01-05 14:00:43.860' AS DateTime), 8, CAST(N'2017-01-05 14:00:43.860' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2006, 1010, 3, NULL, CAST(N'2017-01-05 14:00:44.413' AS DateTime), 8, CAST(N'2017-01-05 17:09:15.260' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2007, 1011, 2, NULL, CAST(N'2017-01-05 14:00:44.757' AS DateTime), 8, CAST(N'2017-01-05 14:00:44.757' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2008, 1012, 2, NULL, CAST(N'2017-01-05 14:00:45.043' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.043' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2009, 1013, 2, NULL, CAST(N'2017-01-05 14:00:45.243' AS DateTime), 8, CAST(N'2017-01-05 16:06:19.010' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2010, 1014, 2, NULL, CAST(N'2017-01-05 14:00:45.610' AS DateTime), 8, CAST(N'2017-01-05 16:06:14.453' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2011, 1015, 2, NULL, CAST(N'2017-01-05 14:00:45.990' AS DateTime), 8, CAST(N'2017-01-05 14:00:45.990' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2012, 1016, 3, NULL, CAST(N'2017-01-05 14:00:46.190' AS DateTime), 8, CAST(N'2017-01-05 17:09:39.357' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2013, 1019, 2, NULL, CAST(N'2017-01-05 14:01:56.477' AS DateTime), 8, CAST(N'2017-01-05 14:01:56.477' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2014, 1020, 2, NULL, CAST(N'2017-01-05 14:01:57.293' AS DateTime), 8, CAST(N'2017-01-05 14:01:57.293' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2015, 1021, 2, NULL, CAST(N'2017-01-05 14:01:57.763' AS DateTime), 8, CAST(N'2017-01-05 16:06:23.937' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2016, 1022, 3, NULL, CAST(N'2017-01-05 14:02:17.873' AS DateTime), 8, CAST(N'2017-01-05 14:02:17.873' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2017, 1023, 4, NULL, CAST(N'2017-01-05 14:02:22.640' AS DateTime), 8, CAST(N'2017-01-05 14:02:22.640' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2018, 1024, 5, NULL, CAST(N'2017-01-05 14:02:25.943' AS DateTime), 8, CAST(N'2017-01-05 14:02:25.943' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2019, 1025, 5, NULL, CAST(N'2017-01-05 14:02:43.307' AS DateTime), 8, CAST(N'2017-01-05 14:02:43.307' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2020, 1026, 4, NULL, CAST(N'2017-01-05 14:02:50.427' AS DateTime), 8, CAST(N'2017-01-05 14:02:50.427' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2021, 1027, 3, NULL, CAST(N'2017-01-05 14:02:53.873' AS DateTime), 8, CAST(N'2017-01-05 14:02:53.873' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2022, 1028, 2, NULL, CAST(N'2017-01-05 14:02:57.030' AS DateTime), 8, CAST(N'2017-01-05 14:02:57.030' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2023, 1029, 2, NULL, CAST(N'2017-01-05 14:03:12.507' AS DateTime), 8, CAST(N'2017-01-05 16:06:29.353' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2024, 1030, 3, NULL, CAST(N'2017-01-05 14:03:16.803' AS DateTime), 8, CAST(N'2017-01-05 14:03:16.803' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2025, 1031, 4, NULL, CAST(N'2017-01-05 14:03:19.073' AS DateTime), 8, CAST(N'2017-01-05 14:15:54.573' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2026, 1032, 5, NULL, CAST(N'2017-01-05 14:03:21.937' AS DateTime), 8, CAST(N'2017-01-05 16:06:34.590' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2027, 1033, 5, NULL, CAST(N'2017-01-05 14:03:59.910' AS DateTime), 8, CAST(N'2017-01-05 14:03:59.910' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2028, 1035, 4, NULL, CAST(N'2017-01-05 14:04:39.413' AS DateTime), 8, CAST(N'2017-01-05 14:04:39.413' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2029, 1036, 4, NULL, CAST(N'2017-01-05 14:04:45.783' AS DateTime), 8, CAST(N'2017-01-05 16:06:38.247' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2030, 1037, 2, NULL, CAST(N'2017-01-05 14:05:00.770' AS DateTime), 8, CAST(N'2017-01-05 14:05:00.770' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2031, 1038, 2, NULL, CAST(N'2017-01-05 14:05:05.227' AS DateTime), 8, CAST(N'2017-01-05 16:06:41.893' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2032, 1040, 3, NULL, CAST(N'2017-01-05 14:05:21.953' AS DateTime), 8, CAST(N'2017-01-05 14:05:21.953' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2033, 1041, 4, NULL, CAST(N'2017-01-05 14:05:25.940' AS DateTime), 8, CAST(N'2017-01-05 16:06:57.497' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2034, 1042, 5, NULL, CAST(N'2017-01-05 14:05:30.020' AS DateTime), 8, CAST(N'2017-01-05 16:07:01.407' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2035, 1043, 5, NULL, CAST(N'2017-01-05 14:05:37.330' AS DateTime), 8, CAST(N'2017-01-05 14:05:37.330' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2036, 1044, 4, NULL, CAST(N'2017-01-05 14:05:40.793' AS DateTime), 8, CAST(N'2017-01-05 16:07:25.023' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2037, 1045, 2, NULL, CAST(N'2017-01-05 14:06:04.687' AS DateTime), 8, CAST(N'2017-01-05 14:06:04.687' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2038, 1046, 3, NULL, CAST(N'2017-01-05 14:06:07.240' AS DateTime), 8, CAST(N'2017-01-05 14:06:07.240' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2039, 1047, 4, NULL, CAST(N'2017-01-05 14:06:10.303' AS DateTime), 8, CAST(N'2017-01-05 16:06:48.980' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2040, 1048, 4, NULL, CAST(N'2017-01-05 14:06:15.600' AS DateTime), 8, CAST(N'2017-01-05 14:06:15.600' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2041, 1049, 4, NULL, CAST(N'2017-01-05 14:06:19.280' AS DateTime), 8, CAST(N'2017-01-05 16:07:04.190' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2042, 1050, 5, NULL, CAST(N'2017-01-05 14:06:22.583' AS DateTime), 8, CAST(N'2017-01-05 14:06:22.583' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2043, 1051, 3, NULL, CAST(N'2017-01-05 14:06:33.237' AS DateTime), 8, CAST(N'2017-01-05 20:29:09.647' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2044, 1052, 3, NULL, CAST(N'2017-01-05 14:06:35.727' AS DateTime), 8, CAST(N'2017-01-05 14:06:35.727' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2045, 1053, 4, NULL, CAST(N'2017-01-05 14:06:38.543' AS DateTime), 8, CAST(N'2017-01-05 16:07:09.937' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2046, 1054, 5, NULL, CAST(N'2017-01-05 14:06:41.570' AS DateTime), 8, CAST(N'2017-01-05 14:06:41.570' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2047, 1055, 4, NULL, CAST(N'2017-01-05 14:06:48.183' AS DateTime), 8, CAST(N'2017-01-05 19:20:40.410' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2048, 1056, 3, NULL, CAST(N'2017-01-05 14:06:50.433' AS DateTime), 8, CAST(N'2017-01-05 14:06:50.433' AS DateTime), 8)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2049, 1057, 5, N'I am closing it now', CAST(N'2017-01-05 14:06:53.093' AS DateTime), 8, CAST(N'2017-01-05 17:13:31.120' AS DateTime), 9)
INSERT [dbo].[RequestForQuote] ([RequestForQuoteId], [ProductEntityId], [StatusId], [DeclineRemark], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2050, 1058, 5, NULL, CAST(N'2017-01-05 14:06:56.527' AS DateTime), 8, CAST(N'2017-01-05 16:07:18.683' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[RequestForQuote] OFF
SET IDENTITY_INSERT [dbo].[Response] ON 

INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (6, 28, 5, N'''sure''', NULL, CAST(N'2017-01-02 17:44:12.070' AS DateTime), 9, CAST(N'2017-01-02 17:44:12.070' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (7, 28, 7, N'sdfd
', N'', CAST(N'2017-01-03 17:44:20.683' AS DateTime), 9, CAST(N'2017-01-03 17:44:20.683' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (8, 28, 7, N'adi
', NULL, CAST(N'2017-01-03 20:32:26.680' AS DateTime), 9, CAST(N'2017-01-03 20:32:26.680' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (9, 28, 7, N'whats ahappeingin
', NULL, CAST(N'2017-01-03 20:33:21.237' AS DateTime), 9, CAST(N'2017-01-03 20:33:21.237' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (10, 28, 7, N'whats ahappeingin
', NULL, CAST(N'2017-01-03 20:39:13.687' AS DateTime), 9, CAST(N'2017-01-03 20:39:13.687' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (11, 28, 7, N'sdfasdfasdfsdafs
', NULL, CAST(N'2017-01-03 20:46:26.390' AS DateTime), 9, CAST(N'2017-01-03 20:46:26.390' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (12, 28, 7, N'sdfasdfasdfsdafs
', NULL, CAST(N'2017-01-03 20:46:44.323' AS DateTime), 9, CAST(N'2017-01-03 20:46:44.323' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (13, 28, 7, N'sdfasdfasdfsdafs
', NULL, CAST(N'2017-01-03 20:46:52.753' AS DateTime), 9, CAST(N'2017-01-03 20:46:52.753' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (14, 28, 7, N'sdfasdfasdfsdafs
', NULL, CAST(N'2017-01-03 20:48:13.247' AS DateTime), 9, CAST(N'2017-01-03 20:48:13.247' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (15, 28, 7, N'sdfasdfasdfsdafs
', NULL, CAST(N'2017-01-03 20:49:16.663' AS DateTime), 9, CAST(N'2017-01-03 20:49:16.663' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (16, 28, 7, N'sdfasdfasdfsdafs
', NULL, CAST(N'2017-01-03 20:49:50.227' AS DateTime), 9, CAST(N'2017-01-03 20:49:50.227' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (17, 28, 7, N'ad
', NULL, CAST(N'2017-01-03 20:50:03.590' AS DateTime), 9, CAST(N'2017-01-03 20:50:03.590' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (18, 28, 7, N'ad
', NULL, CAST(N'2017-01-03 20:50:12.383' AS DateTime), 9, CAST(N'2017-01-03 20:50:12.383' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (19, 28, 7, N'some
', NULL, CAST(N'2017-01-03 20:51:17.657' AS DateTime), 9, CAST(N'2017-01-03 20:51:17.657' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (20, 28, 5, N'i am waiting
', NULL, CAST(N'2017-01-04 16:08:11.283' AS DateTime), 9, CAST(N'2017-01-04 16:08:11.283' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (21, 28, 1005, N'yes i do have
', NULL, CAST(N'2017-01-04 17:38:15.980' AS DateTime), 9, CAST(N'2017-01-04 17:38:15.980' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (22, 28, 1005, N'why are you not replying?
', NULL, CAST(N'2017-01-04 17:59:24.090' AS DateTime), 9, CAST(N'2017-01-04 17:59:24.090' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (23, 28, 1005, N'man!!
', NULL, CAST(N'2017-01-04 18:23:28.717' AS DateTime), 9, CAST(N'2017-01-04 18:23:28.717' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (24, 28, 1028, N'yes
', NULL, CAST(N'2017-01-05 14:15:54.573' AS DateTime), 9, CAST(N'2017-01-05 14:15:54.573' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (25, 28, 1050, N'Yes for sure', NULL, CAST(N'2017-01-05 14:18:00.060' AS DateTime), 9, CAST(N'2017-01-05 14:18:00.060' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (26, 28, 1050, N'I will send you an attachment to your mail', NULL, CAST(N'2017-01-05 14:29:56.020' AS DateTime), 9, CAST(N'2017-01-05 14:29:56.020' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (27, 28, 1052, N'i can understand but because of some reasons i will get delivered on day after tomorrow ', NULL, CAST(N'2017-01-05 16:28:59.363' AS DateTime), 9, CAST(N'2017-01-05 16:28:59.363' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (28, 28, 1009, N'hi
', NULL, CAST(N'2017-01-05 17:09:15.260' AS DateTime), 9, CAST(N'2017-01-05 17:09:15.260' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (29, 28, 1015, N'hi
', NULL, CAST(N'2017-01-05 17:09:39.357' AS DateTime), 9, CAST(N'2017-01-05 17:09:39.357' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (30, 28, 1050, N'Ok . i will try
', NULL, CAST(N'2017-01-05 19:20:40.360' AS DateTime), 9, CAST(N'2017-01-05 19:20:40.360' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (31, 28, 1046, N'We have this product available,& i can able to send it by tomorrow
', NULL, CAST(N'2017-01-05 20:27:54.223' AS DateTime), 9, CAST(N'2017-01-05 20:27:54.223' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (32, 28, 1046, N'By the way when u find that?
', NULL, CAST(N'2017-01-05 20:29:09.647' AS DateTime), 9, CAST(N'2017-01-05 20:29:09.647' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (33, 28, 5, N'Give me some more information
', N'1484057114_RFQ_Hospit', CAST(N'2017-01-10 19:35:34.000' AS DateTime), 9, CAST(N'2017-01-10 19:35:34.000' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (34, 28, 5, N'give me some more information
', N'anti virus.png', CAST(N'2017-01-10 19:36:33.080' AS DateTime), 9, CAST(N'2017-01-10 19:36:33.080' AS DateTime), 9)
INSERT [dbo].[Response] ([ResponseId], [TissueBankId], [RequestID], [ResponseBody], [AttachmentName], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1033, 28, 5, N'I am waiting, buddy..
', NULL, CAST(N'2017-01-12 15:11:49.517' AS DateTime), 9, CAST(N'2017-01-12 15:11:49.517' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[Response] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [EntityTypeID]) VALUES (1, N'HOSPITAL SUPER ADMIN', 1)
INSERT [dbo].[Role] ([RoleID], [RoleName], [EntityTypeID]) VALUES (2, N'HOSPITAL PURCHASING AGENT', 1)
INSERT [dbo].[Role] ([RoleID], [RoleName], [EntityTypeID]) VALUES (3, N'HOSPITAL CLINICAL USER', 1)
INSERT [dbo].[Role] ([RoleID], [RoleName], [EntityTypeID]) VALUES (4, N'TISSUE BANK SUPER ADMIN', 2)
INSERT [dbo].[Role] ([RoleID], [RoleName], [EntityTypeID]) VALUES (5, N'TISSUE BANK FULFILMENT MANAGER', 2)
INSERT [dbo].[Role] ([RoleID], [RoleName], [EntityTypeID]) VALUES (6, N'ALLOCAT ADMIN', 3)
INSERT [dbo].[Role] ([RoleID], [RoleName], [EntityTypeID]) VALUES (7, N'TISSUE BANK INVENTORY MANAGER', 2)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[ShippingDetail] ON 

INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (1, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (2, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (3, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (4, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (5, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (6, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (7, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (8, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (9, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (10, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (11, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (12, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (13, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (14, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (17, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (18, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (19, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (20, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (21, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (22, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (23, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (24, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (25, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (26, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (27, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (28, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (29, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (30, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (31, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (33, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (34, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (35, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (36, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (38, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (39, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (40, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (41, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (42, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (43, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (44, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (45, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (46, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (47, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (48, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (49, N'FEDEX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (50, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (51, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (52, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (53, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (54, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (55, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (56, N'FEDX', NULL, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (57, N'FEDX', 1, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (58, N'FEDX', 1, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (59, NULL, 1, NULL, NULL)
INSERT [dbo].[ShippingDetail] ([ShippingDetailId], [ShippingMethod], [HospitalAddressId], [ShippedDate], [ReceivedDate]) VALUES (60, N'FEDX', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShippingDetail] OFF
SET IDENTITY_INSERT [dbo].[Source] ON 

INSERT [dbo].[Source] ([SourceId], [SourceName]) VALUES (1, N'Synthetic')
INSERT [dbo].[Source] ([SourceId], [SourceName]) VALUES (2, N'Allograft')
INSERT [dbo].[Source] ([SourceId], [SourceName]) VALUES (3, N'Genograft')
SET IDENTITY_INSERT [dbo].[Source] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateId], [StateName]) VALUES (1, N'ALABAMA')
INSERT [dbo].[State] ([StateId], [StateName]) VALUES (2, N'ALASKA')
INSERT [dbo].[State] ([StateId], [StateName]) VALUES (3, N'CALIFORNIA')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (2, N'200', N'Sent to TissueBank', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (3, N'200', N'Sent to Hospital', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (4, N'200', N'In-Negotiation', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (5, N'400', N'Declined By TissueBank', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (6, N'400', N'Declined By Hospital', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (7, N'400', N'Declined By AllocatStaff', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (1005, N'200', N'Placed PR', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (1006, N'200', N'Placed PO', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (1007, NULL, N'Pending', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (1008, NULL, N'Acknowledged', NULL)
INSERT [dbo].[Status] ([StatusId], [StatusCode], [StatusName], [ReportTypeId]) VALUES (1009, NULL, N'Closed', NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[TissueBank] ON 

INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (26, N'Alamo
', N'Aditya', N'8085202993', N'aditya.shrivastava@returnonweb.com', NULL, NULL, NULL, N'7th Street', 8, N'HKKN-423434', N'8085202993', N'8085202993', N'123456789', NULL, NULL, CAST(N'2020-12-16' AS Date), NULL, NULL, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (27, N'BoneBack
', N'Adi', N'8085202993', N'aditya.shrivastava@returnonweb.com', NULL, NULL, NULL, N'56 Inward', 9, N'GHFKJD-94758', N'8085202993', N'8085202993', N'123456789', NULL, NULL, CAST(N'2020-09-16' AS Date), NULL, NULL, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (28, N'International
', N'Abhinav', N'5675675676', N'abhinav.rao@returnonweb.com', NULL, NULL, 1, N'768 Cross Street', 9, N'1234', N'3423243242', N'4158474735', N'123345454', NULL, NULL, CAST(N'2019-11-20' AS Date), 1, NULL, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (29, N'LifeNet
', N'harry hobes', N'4152352345', N'orders@ace.com', N'http://www.acesurgical.com/bone-grafting/bone-graft-allografts/allooss-particulates.html', NULL, NULL, N'1034 Pearl Street,', 8, N'asc12345', NULL, NULL, N'558747337', NULL, NULL, CAST(N'2016-11-11' AS Date), NULL, NULL, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (30, N'UMTB
', N'sindhu priya', N'7675007971', N'sindhu@gmail.com', N'http://www.sampleurl.com/', 1, 1, N'bandar', 9, N'ABC0123', N'8605201295', N'1234567890', N'123456789', NULL, NULL, CAST(N'2016-10-12' AS Date), 1, 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (31, N'CTA
', N'james', N'1234567890', N'international@gmail.com', N'http://www.sampleurl.com/', 1, 1, N'7th Street', 9, N'ABC7689', N'1236456789', N'8569875465', N'123456789', NULL, NULL, CAST(N'2016-11-09' AS Date), 1, 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (32, N'Lattice Biologics', N'Willson', N'1234567890', N'lattice@gmail.com', N'http://www.sampleurl.com/', 1, 1, N'7th Street', 8, N'ABC98534', N'1234567890', N'1234567890', N'123456789', NULL, NULL, CAST(N'2016-11-10' AS Date), 1, 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (33, N'CTA', N'Dave', N'1234567890', N'cta@gmail.com', N'http://www.sampleurl.com/', 1, 1, N'7th Street', 8, N'ABC9213', N'1234567890', N'1234567890', N'123456789', NULL, NULL, CAST(N'2016-11-11' AS Date), 1, 1, 1, NULL, 1, NULL, 1)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (34, N'ad', N'a', N'8085202993', N'a@a.com', N'a', NULL, NULL, N'a', 4, N'a', NULL, NULL, NULL, N'asd', CAST(N'2016-12-27' AS Date), CAST(N'2016-12-26' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TissueBank] ([TissueBankId], [TissueBankName], [ContactPersonName], [ContactPersonNumber], [TissueBankEmailId], [BusinessURL], [IsMobileVerified], [IsEmailVerified], [TissueBankAddress], [CityId], [TissueBankStateLicense], [CustomerServiceLandLineNumber], [FaxNumber], [TaxPayerId], [AATBLicenseNumber], [AATBExpirationDate], [AATBAccredationDate], [IsAllocatMember], [IsAccountVerified], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (35, N'ADS TB', N'aditya', N'8085202993', N'adi@gmail.com', N'www.row.com', 0, 0, N'pune', 4, N'KDFH35345', NULL, NULL, NULL, N'JDFKSK8394', CAST(N'2019-12-12' AS Date), CAST(N'2013-08-06' AS Date), 0, 0, 1, NULL, NULL, CAST(N'2017-01-18 18:28:01.573' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TissueBank] OFF
SET IDENTITY_INSERT [dbo].[TissueBankProduct] ON 

INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, 29, 1, N'5 mm', N'FD521', NULL, N'FREEZED', NULL, NULL, CAST(500.00 AS Numeric(18, 2)), 1, 1, NULL, NULL, 1, CAST(N'2016-11-23 00:00:00.000' AS DateTime), 8, CAST(N'2016-11-23 00:00:00.000' AS DateTime), 8)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, 29, 2, N'4-5mm', N'PP121', NULL, N'DEEP', NULL, NULL, CAST(650.00 AS Numeric(18, 2)), 1, 1, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 8, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 8)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, 29, 2, N'5-6mm', N'PP122', NULL, N'DEEP', NULL, NULL, CAST(750.00 AS Numeric(18, 2)), 1, 1, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 8, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 8)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1006, 28, 5, N'Cancellous Cubes', N'AT103', N'10cc', N'sterile', NULL, NULL, CAST(4522.00 AS Numeric(18, 2)), 2, 1, CAST(N'2016-12-29 11:15:00.000' AS DateTime), CAST(N'2016-12-27 03:15:00.000' AS DateTime), 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1007, 28, 5, N'Cancellous Cubes', N'AT102', N'15cc', N'sterile', NULL, NULL, CAST(69.00 AS Numeric(18, 2)), 1, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1008, 28, 5, N'Cancellous Cubes', N'AT1056', N'30cc', N'sterile', NULL, NULL, CAST(63.00 AS Numeric(18, 2)), 2, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1009, 28, 5, N'Cancellous Cubes', N'AT1034', N'60cc', N'sterile', NULL, NULL, CAST(562.00 AS Numeric(18, 2)), 1, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1010, 28, 5, N'5mm', N'AT1012', N'10cc', N'Lyophilized', NULL, NULL, CAST(695.00 AS Numeric(18, 2)), 3, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1011, 28, 5, N'5mm', N'AT1021', N'15cc', N'Lyophilized', NULL, NULL, CAST(452.00 AS Numeric(18, 2)), 1, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1012, 28, 5, N'5mm', N'AT107', N'30cc', N'Lyophilized', N'my data', NULL, CAST(126.00 AS Numeric(18, 2)), 2, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1013, 28, 5, N'5mm', N'AT105', N'60cc', N'Lyophilized', NULL, NULL, CAST(658.00 AS Numeric(18, 2)), 3, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1014, 28, 5, N'3-5mm', N'AT555', N'15cc', N'Lyophilized', N'It is best for small sizes', NULL, CAST(350.00 AS Numeric(18, 2)), 2, 1, CAST(N'2016-12-15 12:08:00.000' AS DateTime), NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1015, 28, 5, N'3-5mm', N'AT1018', N'30cc', N'Lyophilized', NULL, NULL, CAST(987.00 AS Numeric(18, 2)), 1, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1016, 28, 5, N'3-5mm', N'AT106', N'45cc', N'Lyophilized', NULL, NULL, CAST(452.00 AS Numeric(18, 2)), 3, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1017, 28, 5, N'3-5mm', N'AT104', N'60cc', N'Lyophilized', NULL, NULL, CAST(126.00 AS Numeric(18, 2)), 2, 0, NULL, NULL, 1, CAST(N'2016-11-23 11:15:00.000' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
INSERT [dbo].[TissueBankProduct] ([TissueBankProductId], [TissueBankId], [ProductMasterId], [ProductType], [ProductCode], [ProductSize], [PreservationType], [ProductDescription], [Remark], [UnitPrice], [SourceId], [IsAvailableForSale], [AvailabilityStartDate], [AvailabilityEndDate], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1018, 28, 5, N'5mm', N'RF5676', N'45cc', N'FREEZED', N'', NULL, CAST(560.00 AS Numeric(18, 2)), 1, 1, CAST(N'2016-12-28 10:14:00.000' AS DateTime), NULL, 1, CAST(N'2016-12-26 18:14:56.587' AS DateTime), 9, CAST(N'2017-01-12 15:05:07.100' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[TissueBankProduct] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [EntityID], [DomainScopeID], [MobileNumber], [EmailId], [IsMobileVerified], [IsEmailVerified], [IsLockedOut], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [PasswordQuestion], [PasswordAnswer], [SecurityQuestion], [SecurityAnswer], [AllowLogin], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (8, N'aditya', N'123', N'Aditya Shrivastava', 1, 1, N'8085202993', N'ab@ab.com', 0, 0, 0, CAST(N'2016-11-10 00:00:00.000' AS DateTime), CAST(N'2016-11-10 00:00:00.000' AS DateTime), CAST(N'2016-11-10 00:00:00.000' AS DateTime), 0, 0, N'Mother', N'Kalpana', N'Mother', N'Kalpana', 1, 1, CAST(N'2016-11-10 00:00:00.000' AS DateTime), 1, CAST(N'2016-11-10 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [EntityID], [DomainScopeID], [MobileNumber], [EmailId], [IsMobileVerified], [IsEmailVerified], [IsLockedOut], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [PasswordQuestion], [PasswordAnswer], [SecurityQuestion], [SecurityAnswer], [AllowLogin], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (9, N'aman', N'123', N'Aman Shrivastava', 2, 1, N'7389242565', N'am@am.com', 0, 0, 0, CAST(N'2017-01-17 15:32:54.777' AS DateTime), CAST(N'2017-01-17 15:32:54.777' AS DateTime), CAST(N'2016-11-10 00:00:00.000' AS DateTime), 0, 0, N'Mother', N'Kalpana', N'Mother', N'Kalpana', 1, 1, CAST(N'2016-11-10 00:00:00.000' AS DateTime), 1, CAST(N'2017-01-17 15:32:54.777' AS DateTime), 9)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [EntityID], [DomainScopeID], [MobileNumber], [EmailId], [IsMobileVerified], [IsEmailVerified], [IsLockedOut], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [PasswordQuestion], [PasswordAnswer], [SecurityQuestion], [SecurityAnswer], [AllowLogin], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (11, N'admin', N'admin', N'Administrator', 3, 1, N'8085202993', N'admin@admin.com', 1, 1, 0, CAST(N'2016-11-11 00:00:00.000' AS DateTime), CAST(N'2016-11-11 00:00:00.000' AS DateTime), CAST(N'2016-11-11 00:00:00.000' AS DateTime), 0, 0, N'Mother', N'Kalpana', N'Mother', N'Kalpana', 1, 1, CAST(N'2016-11-11 00:00:00.000' AS DateTime), 1, CAST(N'2016-11-11 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [EntityID], [DomainScopeID], [MobileNumber], [EmailId], [IsMobileVerified], [IsEmailVerified], [IsLockedOut], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [PasswordQuestion], [PasswordAnswer], [SecurityQuestion], [SecurityAnswer], [AllowLogin], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (16, N'NewUser', N'pass', N'New User', 8, 1, N'8085202993', N'a@a.com', 0, 0, 0, CAST(N'2017-01-11 15:33:41.143' AS DateTime), CAST(N'2017-01-11 15:33:41.143' AS DateTime), NULL, 0, 0, N'what is  your mother name', N'Kalpana', NULL, NULL, 1, 1, CAST(N'2017-01-11 15:33:43.347' AS DateTime), 11, CAST(N'2017-01-11 15:33:43.347' AS DateTime), 11)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [EntityID], [DomainScopeID], [MobileNumber], [EmailId], [IsMobileVerified], [IsEmailVerified], [IsLockedOut], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [PasswordQuestion], [PasswordAnswer], [SecurityQuestion], [SecurityAnswer], [AllowLogin], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (17, N'adishri', NULL, N'aditya shrivastava', 9, NULL, N'80852029944', N'aditya2.shrivastava@returnonweb.com', 0, 0, 0, CAST(N'2017-01-18 17:40:09.507' AS DateTime), CAST(N'2017-01-18 17:40:09.507' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-01-17 16:11:20.150' AS DateTime), 9, CAST(N'2017-01-18 17:40:09.507' AS DateTime), 9)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [EntityID], [DomainScopeID], [MobileNumber], [EmailId], [IsMobileVerified], [IsEmailVerified], [IsLockedOut], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [PasswordQuestion], [PasswordAnswer], [SecurityQuestion], [SecurityAnswer], [AllowLogin], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (18, N'sneha', N'TH4JBP', N'Sneha Shukla', 10, NULL, N'8085202993', N'sneha.shukla@returnonweb.com', 0, 0, 0, CAST(N'2017-01-17 18:26:31.547' AS DateTime), CAST(N'2017-01-17 18:26:31.547' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-01-17 18:21:04.077' AS DateTime), 9, CAST(N'2017-01-17 18:26:31.547' AS DateTime), 9)
INSERT [dbo].[User] ([UserId], [UserName], [Password], [FullName], [EntityID], [DomainScopeID], [MobileNumber], [EmailId], [IsMobileVerified], [IsEmailVerified], [IsLockedOut], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [PasswordQuestion], [PasswordAnswer], [SecurityQuestion], [SecurityAnswer], [AllowLogin], [IsActive], [CreatedDate], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (19, N'adityas', N'2DRK2B', N'aditya', 11, NULL, N'8085202993', N'adi@gmail.com', 0, 0, 0, CAST(N'2017-01-18 18:28:01.573' AS DateTime), CAST(N'2017-01-18 18:28:01.573' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-01-18 18:28:01.573' AS DateTime), 19, CAST(N'2017-01-18 18:28:01.573' AS DateTime), 19)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (7, 11, 6)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (8, 8, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (10, 8, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (15, 16, 1)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (16, 16, 2)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (28, 9, 4)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (29, 9, 5)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (39, 18, 7)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (41, 17, 5)
INSERT [dbo].[UserRole] ([UserRoleID], [UserID], [RoleID]) VALUES (42, 19, 4)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [DF_Notification_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
ALTER TABLE [dbo].[PurchaseRequest] ADD  CONSTRAINT [DF_Purchaserequest_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_EntityType] FOREIGN KEY([EntityTypeId])
REFERENCES [dbo].[EntityType] ([EntityTypeId])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_EntityType]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_City] FOREIGN KEY([HospitalCityId])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [FK_Hospital_City]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_DomainScope] FOREIGN KEY([DomainScopeID])
REFERENCES [dbo].[DomainScope] ([DomainScopeId])
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [FK_Hospital_DomainScope]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_HospitalType] FOREIGN KEY([HospitalTypeID])
REFERENCES [dbo].[HospitalType] ([HospitalTypeID])
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [FK_Hospital_HospitalType]
GO
ALTER TABLE [dbo].[HospitalAddress]  WITH CHECK ADD  CONSTRAINT [FK_HospitalAddress_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[HospitalAddress] CHECK CONSTRAINT [FK_HospitalAddress_City]
GO
ALTER TABLE [dbo].[HospitalAddress]  WITH CHECK ADD  CONSTRAINT [FK_HospitalAddress_Hospital] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospital] ([HospitalId])
GO
ALTER TABLE [dbo].[HospitalAddress] CHECK CONSTRAINT [FK_HospitalAddress_Hospital]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_EntityType] FOREIGN KEY([EntityTypeID])
REFERENCES [dbo].[EntityType] ([EntityTypeId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_EntityType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PurchaseRequest] FOREIGN KEY([PurchaseRequestId])
REFERENCES [dbo].[PurchaseRequest] ([PurchaseRequestId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PurchaseRequest]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductEntity] FOREIGN KEY([ProductEntityId])
REFERENCES [dbo].[ProductEntity] ([ProductEntityId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductEntity]
GO
ALTER TABLE [dbo].[ProductEntity]  WITH CHECK ADD  CONSTRAINT [FK_ProductEntity_Hospital] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospital] ([HospitalId])
GO
ALTER TABLE [dbo].[ProductEntity] CHECK CONSTRAINT [FK_ProductEntity_Hospital]
GO
ALTER TABLE [dbo].[ProductEntity]  WITH CHECK ADD  CONSTRAINT [FK_ProductEntity_ShippingDetail] FOREIGN KEY([ShippingDetailId])
REFERENCES [dbo].[ShippingDetail] ([ShippingDetailId])
GO
ALTER TABLE [dbo].[ProductEntity] CHECK CONSTRAINT [FK_ProductEntity_ShippingDetail]
GO
ALTER TABLE [dbo].[ProductEntity]  WITH CHECK ADD  CONSTRAINT [FK_ProductEntity_TissueBank] FOREIGN KEY([TissueBankId])
REFERENCES [dbo].[TissueBank] ([TissueBankId])
GO
ALTER TABLE [dbo].[ProductEntity] CHECK CONSTRAINT [FK_ProductEntity_TissueBank]
GO
ALTER TABLE [dbo].[ProductEntity]  WITH CHECK ADD  CONSTRAINT [FK_ProductEntity_TissueBankProduct] FOREIGN KEY([TissueBankProductId])
REFERENCES [dbo].[TissueBankProduct] ([TissueBankProductId])
GO
ALTER TABLE [dbo].[ProductEntity] CHECK CONSTRAINT [FK_ProductEntity_TissueBankProduct]
GO
ALTER TABLE [dbo].[ProductMaster]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaster_DomainScope] FOREIGN KEY([DomainScopeId])
REFERENCES [dbo].[DomainScope] ([DomainScopeId])
GO
ALTER TABLE [dbo].[ProductMaster] CHECK CONSTRAINT [FK_ProductMaster_DomainScope]
GO
ALTER TABLE [dbo].[ProductMaster]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaster_ProductMaster] FOREIGN KEY([FamilyId])
REFERENCES [dbo].[ProductMaster] ([ProductMasterId])
GO
ALTER TABLE [dbo].[ProductMaster] CHECK CONSTRAINT [FK_ProductMaster_ProductMaster]
GO
ALTER TABLE [dbo].[PurchaseRequest]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseRequest_ProductEntity] FOREIGN KEY([ProductEntityId])
REFERENCES [dbo].[ProductEntity] ([ProductEntityId])
GO
ALTER TABLE [dbo].[PurchaseRequest] CHECK CONSTRAINT [FK_PurchaseRequest_ProductEntity]
GO
ALTER TABLE [dbo].[PurchaseRequest]  WITH CHECK ADD  CONSTRAINT [FK_Purchaserequest_RequestForQuote] FOREIGN KEY([ParentRequestForQuoteId])
REFERENCES [dbo].[RequestForQuote] ([RequestForQuoteId])
GO
ALTER TABLE [dbo].[PurchaseRequest] CHECK CONSTRAINT [FK_Purchaserequest_RequestForQuote]
GO
ALTER TABLE [dbo].[PurchaseRequest]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseRequest_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[PurchaseRequest] CHECK CONSTRAINT [FK_PurchaseRequest_Status]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Hospital] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospital] ([HospitalId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Hospital]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_RequestForQuote] FOREIGN KEY([RequestForQuoteId])
REFERENCES [dbo].[RequestForQuote] ([RequestForQuoteId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_RequestForQuote]
GO
ALTER TABLE [dbo].[RequestForQuote]  WITH CHECK ADD  CONSTRAINT [FK_RequestForQuote_ProductEntity] FOREIGN KEY([ProductEntityId])
REFERENCES [dbo].[ProductEntity] ([ProductEntityId])
GO
ALTER TABLE [dbo].[RequestForQuote] CHECK CONSTRAINT [FK_RequestForQuote_ProductEntity]
GO
ALTER TABLE [dbo].[RequestForQuote]  WITH CHECK ADD  CONSTRAINT [FK_RequestForQuote_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[RequestForQuote] CHECK CONSTRAINT [FK_RequestForQuote_Status]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Request]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_TissueBank] FOREIGN KEY([TissueBankId])
REFERENCES [dbo].[TissueBank] ([TissueBankId])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_TissueBank]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_EntityType] FOREIGN KEY([EntityTypeID])
REFERENCES [dbo].[EntityType] ([EntityTypeId])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_UserRole_EntityType]
GO
ALTER TABLE [dbo].[ShippingDetail]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetail_ShippingDetail] FOREIGN KEY([HospitalAddressId])
REFERENCES [dbo].[HospitalAddress] ([HospitalAddressId])
GO
ALTER TABLE [dbo].[ShippingDetail] CHECK CONSTRAINT [FK_ShippingDetail_ShippingDetail]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_ReportType] FOREIGN KEY([ReportTypeId])
REFERENCES [dbo].[ReportType] ([ReportTypeId])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_ReportType]
GO
ALTER TABLE [dbo].[TaggedNotification]  WITH CHECK ADD  CONSTRAINT [FK_TaggedNotification_Notification] FOREIGN KEY([NotificationId])
REFERENCES [dbo].[Notification] ([NotificationId])
GO
ALTER TABLE [dbo].[TaggedNotification] CHECK CONSTRAINT [FK_TaggedNotification_Notification]
GO
ALTER TABLE [dbo].[TaggedNotification]  WITH CHECK ADD  CONSTRAINT [FK_TaggedNotification_NotificationTag] FOREIGN KEY([NotificationTagId])
REFERENCES [dbo].[NotificationTag] ([NotificationTagId])
GO
ALTER TABLE [dbo].[TaggedNotification] CHECK CONSTRAINT [FK_TaggedNotification_NotificationTag]
GO
ALTER TABLE [dbo].[TissueBank]  WITH CHECK ADD  CONSTRAINT [FK_TissueBank_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[TissueBank] CHECK CONSTRAINT [FK_TissueBank_City]
GO
ALTER TABLE [dbo].[TissueBankProduct]  WITH CHECK ADD  CONSTRAINT [FK_TissueBankProduct_ProductMaster] FOREIGN KEY([ProductMasterId])
REFERENCES [dbo].[ProductMaster] ([ProductMasterId])
GO
ALTER TABLE [dbo].[TissueBankProduct] CHECK CONSTRAINT [FK_TissueBankProduct_ProductMaster]
GO
ALTER TABLE [dbo].[TissueBankProduct]  WITH CHECK ADD  CONSTRAINT [FK_TissueBankProduct_Source] FOREIGN KEY([SourceId])
REFERENCES [dbo].[Source] ([SourceId])
GO
ALTER TABLE [dbo].[TissueBankProduct] CHECK CONSTRAINT [FK_TissueBankProduct_Source]
GO
ALTER TABLE [dbo].[TissueBankProduct]  WITH CHECK ADD  CONSTRAINT [FK_TissueBankProduct_TissueBank] FOREIGN KEY([TissueBankId])
REFERENCES [dbo].[TissueBank] ([TissueBankId])
GO
ALTER TABLE [dbo].[TissueBankProduct] CHECK CONSTRAINT [FK_TissueBankProduct_TissueBank]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_DomainScope] FOREIGN KEY([DomainScopeID])
REFERENCES [dbo].[DomainScope] ([DomainScopeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_DomainScope]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Entity] FOREIGN KEY([EntityID])
REFERENCES [dbo].[Entity] ([EntityId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Entity]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleID_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRoleID_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleID_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRoleID_User]
GO
/****** Object:  StoredProcedure [dbo].[sp_Order_TissueBank_Ack_Decline]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Order_TissueBank_Ack_Decline]
(
@OrderId int
,@StatusId int
,@DeclineRemark nvarchar(200)
,@ShippingMethod nvarchar(100)
,@TissueBankSendByDate date
,@LastModifiedBy int
)
as
BEGIN TRANSACTION trans
BEGIN TRY
update dbo.[Order]
set StatusId=@StatusId
, DeclineRemark=@DeclineRemark
,LastModifiedDate=GETDATE()
,LastModifiedBy=@LastModifiedBy
where OrderId=@OrderId

declare @ShippingDetailId int =(select ShippingDetailId from ProductEntity as pe,OrderDetail as od
								where pe.ProductEntityId=od.ProductEntityId and 
								OrderId=@OrderId);

declare @ProductEntityId int =(select ProductEntityId from OrderDetail 
								where OrderId=@OrderId);

update ShippingDetail
set ShippingMethod=@ShippingMethod
where ShippingDetailId=@ShippingDetailId

update ProductEntity
set TissueBankSendByDate=@TissueBankSendByDate
,LastModifiedDate=GETDATE()
,LastModifiedBy=@LastModifiedBy
where ProductEntityId=@ProductEntityId


 BEGIN COMMIT TRANSACTION trans
 END
END TRY
BEGIN CATCH
 print 'Error Occured'
 BEGIN ROLLBACK TRANSACTION trans 
 END
END CATCH 

GO
/****** Object:  StoredProcedure [dbo].[sp_Order_TissueBank_GetByTissueBankId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Order_TissueBank_GetByTissueBankId]
(
@TissueBankId int,
@SearchBy varchar(30),
@CurrentPage int,
@PageSize int,
@SortDirection varchar(10),
@SortExpression varchar(30)
)
as
begin
declare @StartLimit int=(@CurrentPage-1)*@PageSize+1;
declare @EndLimit int=@StartLimit+@PageSize-1;

WITH CTE_Results
    AS (
select ROW_NUMBER() OVER (ORDER BY case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end DESC,
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end DESC,
case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then o.CreatedDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then o.CreatedDate
        end DESC
		,case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'NeedByDate' then NeedByDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'NeedByDate' then NeedByDate
        end DESC) Sno,
 o. OrderId
 ,rfq.RequestForQuoteId
, Quantity
,pe.UnitPrice
,NeedByDate
,TissueBankSendByDate
,o.OrderLineTotal
,o.StatusId
,o.CreatedDate
,ProductMasterName
,tbp.ProductCode
,s.StatusName
from dbo.[Order] as o
inner join OrderDetail as od on od.OrderId=o.OrderId
inner join ProductEntity as pe on pe.ProductEntityId=od.ProductEntityId
inner join dbo.[Status] as s on s.StatusId=o.StatusId
inner join dbo.[User] as uCreated on uCreated.UserId=o.CreatedBy
inner join dbo.[User] as uModified on uModified.UserId=o.LastModifiedBy
inner join TissueBankProduct as tbp on pe.TissueBankProductId=tbp.TissueBankProductId
inner join ProductMaster as pm on tbp.ProductMasterId=pm.ProductMasterId
left join RequestForQuote as rfq on rfq.RequestForQuoteId=o.RFQId
where (RequestForQuoteId like @SearchBy+'%'
or ProductCode like @SearchBy+'%'
or ProductMasterName like  @SearchBy+'%'
or StatusName like @SearchBy+'%'))
select * from CTE_Results 
where Sno between @StartLimit and @EndLimit 
order by 
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end DESC,
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end DESC,
case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then CreatedDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then CreatedDate
        end DESC
		,case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'NeedByDate' then NeedByDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'NeedByDate' then NeedByDate
        end DESC
		
end





GO
/****** Object:  StoredProcedure [dbo].[sp_OrderDetail_TissueBank_GetByOrderId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_OrderDetail_TissueBank_GetByOrderId]
 (
 @OrderId int
 )
 as
 begin
	 select
 o.OrderId
,o.OrderDate
,o.OrderLineTotal
,o.RFQId
,o.AlloCATFees
,o.HospitalPoNumber
,o.StatusId
,o.DeclineRemark
,o.CreatedDate
,pe.ProductEntityId
,pe.TissueBankProductId
,pe.HospitalId
,pe.Quantity
,pe.UnitPrice
,pe.LineTotal
,pe.SalesTax
,pe.Total
,pe.NeedByDate
,pe.TissueBankSendByDate

,h.HospitalName
,h.HospitalAddress as billingHospitalAddress
,h.FaxNumber as billingFaxNumber
,h.HospitalLandLineNo
,h.RegistrationNumber 
,h.ContactPersonName as billingContactPersonName
,h.ContactPersonNumber as billingContactPersonNumber
,h.HospitalEmailId

,ha.HospitalAddress as shippingHospitalAddress
,ha.ContactPersonName as shippingContactPersonName
,ha.ContactPersonNumber as shippingContactPersonNumber
,ha.ContactPersonNumber as shippingContactPersonNumber
,ha.FaxNumber as shippingFaxNumber


,DomainName
,shippingCity.CityName as shippingCityName
,shippingCity.ZipCode as shippingZipCode
,shippingCity.ZipCode as shippingZipCode


,billingCity.CityName as billingCityName
,billingCity.ZipCode as shippingZipCode
,billingCity.ZipCode as billingZipCode

,billingState.StateName as billingStateName
,shippingState.StateName as shippingStateName


,rfq.RequestForQuoteId

,StatusName

,ProductMasterName
,ShippingMethod

	from dbo.[Order] as o
	inner join OrderDetail as od on o.OrderId=od.OrderId
	inner join ProductEntity as pe on pe.ProductEntityId=od.ProductEntityId
	inner join TissueBankProduct as tbp on pe.TissueBankProductId=tbp.TissueBankProductId
	inner join ProductMaster as pm on tbp.ProductMasterId=pm.ProductMasterId
	left join Hospital as h on h.HospitalId=pe.HospitalId
	left join HospitalAddress as ha on ha.HospitalId=h.HospitalId
	left join DomainScope as ds on ds.DomainScopeId=pm.DomainScopeId
	inner join city as shippingCity on shippingCity.CityID=ha.CityId
	inner join city as billingCity on billingCity.CityID=h.HospitalCityId
	inner join dbo.[State] as shippingState on shippingCity.StateId=shippingState.StateId
	inner join dbo.[State] as billingState on billingCity.StateId=billingState.StateId
	left join ShippingDetail as sd on sd.ShippingDetailId=pe.ShippingDetailId
	left join RequestForQuote as rfq on rfq.RequestForQuoteId=o.RFQId
	inner join dbo.[Status] as s on s.StatusId=o.StatusId

	where o.OrderId=@OrderId
end





GO
/****** Object:  StoredProcedure [dbo].[sp_RequestForQuote_TissueBank_Edit]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_RequestForQuote_TissueBank_Edit]
(
 @TissueBankId	int
,@ResponseBody	nvarchar(MAX) null
,@AttachmentName	nvarchar(100) null
,@CreatedBy	int
,@LastModifiedBy	int
,@RequestForQuoteId	int
,@StatusId	int
,@DeclineRemark	nvarchar(200) null
,@Quantity	int
,@UnitPrice	numeric(18, 2)
,@LineTotal	numeric(18, 2)
,@SalesTax	numeric(18, 2)
,@Total	numeric(18, 2)
,@TissueBankSendByDate	date null
,@ShippingMethod	nvarchar(100)
)
as
begin
BEGIN TRANSACTION trans
BEGIN TRY
	declare @RequestID	int,@ProductEntityId	int
	
	set @RequestID=(select top 1 RequestID from Request where RequestForQuoteId=@RequestForQuoteId)
	
	if(@ResponseBody!='')
	begin
		insert into Response
		(
		 TissueBankId,RequestID,ResponseBody,AttachmentName
		,CreatedDate,CreatedBy,LastModifiedDate,LastModifiedBy
		)
		values
		(
		 @TissueBankId,@RequestID,@ResponseBody,@AttachmentName
		,GETDATE(),@CreatedBy,GETDATE(),@LastModifiedBy
		)
	end
	
	
	if(@StatusId!=5)
	begin

	set @StatusId=(select StatusId from RequestForQuote where RequestForQuoteId=@RequestForQuoteId)

		if (@StatusId=2)
			begin
				set @StatusId=3
			end
		else if (@StatusId=3)
		begin
			set @StatusId=3
		end
		else if (@StatusId=4)
		begin
			set @StatusId=4
		end
	end
	
	update RequestForQuote set 
	 StatusId=@StatusId 
	 ,DeclineRemark=@DeclineRemark 
	,LastModifiedDate=GETDATE() 
	,LastModifiedBy=@LastModifiedBy 
	where RequestForQuoteId=@RequestForQuoteId
	
	set @ProductEntityId=(select ProductEntityId from RequestForQuote WHERE RequestForQuoteId=@RequestForQuoteId)

	update ProductEntity
	set 
	 Quantity=@Quantity
	 ,UnitPrice=@UnitPrice
	,LineTotal=@LineTotal
	,SalesTax=@SalesTax
	,Total=@Total
	,TissueBankSendByDate=@TissueBankSendByDate
	,LastModifiedDate=GETDATE()
	,LastModifiedBy=@LastModifiedBy
	where ProductEntityId=@ProductEntityId


	declare @ShippingDetailId int=(select ShippingDetailId from ProductEntity WHERE ProductEntityId=@ProductEntityId)

	update ShippingDetail
	set ShippingMethod=@ShippingMethod
	where ShippingDetailId=@ShippingDetailId

	BEGIN COMMIT TRANSACTION trans
 END
END TRY
BEGIN CATCH
 print 'Error Occured'
 BEGIN ROLLBACK TRANSACTION trans 
 END
END CATCH 
end





GO
/****** Object:  StoredProcedure [dbo].[sp_RequestForQuote_TissueBank_GetByTissueBankId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_RequestForQuote_TissueBank_GetByTissueBankId]
(
@TissueBankId int,
@SearchBy varchar(30),
@CurrentPage int,
@PageSize int,
@SortDirection varchar(10),
@SortExpression varchar(30)
)
as
begin
declare @StartLimit int=(@CurrentPage-1)*@PageSize+1;
declare @EndLimit int=@StartLimit+@PageSize-1;

WITH CTE_Results
    AS (
select ROW_NUMBER() OVER (ORDER BY 
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end DESC,
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end DESC,
case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then rfq.CreatedDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then rfq.CreatedDate
        end DESC
		,
case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'LastModifiedDate' then rfq.LastModifiedDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'LastModifiedDate' then rfq.LastModifiedDate
        end DESC


) Sno,
 RequestForQuoteId
,rfq.CreatedDate
,rfq.LastModifiedDate
,ProductMasterName
,tbp.ProductCode
,s.StatusName
from RequestForQuote as rfq
inner join ProductEntity as pe on pe.ProductEntityId=rfq.ProductEntityId
inner join Status as s on s.StatusId=rfq.StatusId
inner join dbo.[User] as uCreated on uCreated.UserId=rfq.CreatedBy
inner join dbo.[User] as uModified on uModified.UserId=rfq.LastModifiedBy
inner join TissueBankProduct as tbp on pe.TissueBankProductId=tbp.TissueBankProductId
inner join ProductMaster as pm on tbp.ProductMasterId=pm.ProductMasterId
where (RequestForQuoteId like @SearchBy+'%'
or ProductCode like @SearchBy+'%'
or ProductMasterName like  @SearchBy+'%'
or StatusName like @SearchBy+'%'))
select * from CTE_Results 
where Sno between @StartLimit and @EndLimit 
order by 
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'RequestForQuoteId' then RequestForQuoteId
        end DESC,
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end DESC,
case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'StatusName' then StatusName
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then CreatedDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'CreatedDate' then CreatedDate
        end DESC
		,
case		 when @SortDirection <> 'ASC' then cast(null as date)
        when @SortExpression = 'LastModifiedDate' then LastModifiedDate
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as date)
        when @SortExpression = 'LastModifiedDate' then LastModifiedDate
        end DESC
end





GO
/****** Object:  StoredProcedure [dbo].[sp_RequestForQuoteDetail_TissueBank_GetByRequestForQuoteId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[sp_RequestForQuoteDetail_TissueBank_GetByRequestForQuoteId]
 (
 @RequestForQuoteId int
 )
 as
 begin
	 select
	 rfq.RequestForQuoteId
	,rfq.CreatedDate
	,rfq.LastModifiedDate
	,pe.Quantity
	,pe.UnitPrice
	,pe.LineTotal
	,pe.SalesTax
	,pe.Total
	,pe.NeedByDate
	,pe.TissueBankSendByDate
	,StatusName
	,rfq.StatusId
	,ProductCode
	,ProductMasterName
	,HospitalName
	,CityName
	,ShippingMethod
	,DeclineRemark
	from RequestForQuote as rfq
	inner join ProductEntity as pe on pe.ProductEntityId=rfq.ProductEntityId
	inner join Status as s on s.StatusId=rfq.StatusId
	inner join TissueBankProduct as tbp on pe.TissueBankProductId=tbp.TissueBankProductId
	inner join ProductMaster as pm on tbp.ProductMasterId=pm.ProductMasterId
	left join Hospital as h on h.HospitalId=pe.HospitalId
	left join DomainScope as ds on ds.DomainScopeId=pm.DomainScopeId
	left join City as c on c.CityID=h.HospitalCityId 
	left join ShippingDetail as sd on sd.ShippingDetailId=pe.ShippingDetailId
	where rfq.RequestForQuoteId=@RequestForQuoteId
end





GO
/****** Object:  StoredProcedure [dbo].[sp_RequestResponse_TissueBank_GetByTissueBankId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_RequestResponse_TissueBank_GetByTissueBankId]
(
@RequestForQuoteId int
)
as
begin
WITH CTE_Results
    AS (
select 'Request' as BodyType
,substring(HospitalName,1,1) as Initial
,r.RequestBody as Body
,r.LastModifiedDate 
,r.AttachmentName
from Request as r
left join hospital as h on r.HospitalId=h.HospitalId
 where RequestForQuoteId=@RequestForQuoteId
union
select 'Response' as BodyType
,substring(TissueBankName,1,1) as Initial
 ,r.ResponseBody as Body
,r.LastModifiedDate 
,r.AttachmentName
from Response as r
left join TissueBank as tb on r.TissueBankId=tb.TissueBankId

where RequestID in (select RequestId from Request where RequestForQuoteId=@RequestForQuoteId)
)
select * from CTE_Results 
order by LastModifiedDate ASC
end

--select 
-- rfq.RequestForQuoteId
--,rfq.Remark
--,rfq.CreatedDate
--,rfq.CreatedBy
--,rfq.LastModifiedDate
--,rfq.LastModifiedBy
--,pe.Quantity
--,pe.NeedByDate
--,tbp.ProductCode
--,pm.ProductMasterName
--,c.CityName
--,s.StatusName
--from RequestForQuote as rfq
--inner join ProductEntity as pe on pe.ProductEntityId=rfq.ProductEntityId
--inner join Status as s on s.StatusId=rfq.StatusId
--inner join dbo.[User] as uCreated on uCreated.UserId=rfq.CreatedBy
--inner join dbo.[User] as uModified on uModified.UserId=rfq.LastModifiedBy
--inner join TissueBankProduct as tbp on pe.TissueBankProductId=tbp.TissueBankProductId
--inner join ProductMaster as pm on tbp.ProductMasterId=pm.ProductMasterId
--inner join Request as r on rfq.RequestForQuoteId=r.RequestForQuoteId
--inner join Hospital as h on h.HospitalId=pe.HospitalId
--inner join City as c on h.HospitalCityId=c.CityID
--where rfq.RequestForQuoteId=1






GO
/****** Object:  StoredProcedure [dbo].[sp_TissueBank_Add]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Name: sp_TissueBank_Add
Sproc Description: It adds Tissue Bank into system and creates a super admin for it to access it.
Date of Creation: 18 Jan 2017
Authored By: Aditya Shrivastava
Date of Modification : 19 Jan 2017
Comments:
Modified by: Aditya Shrivastava
*/

CREATE proc [dbo].[sp_TissueBank_Add]
(
 @TissueBankName	nvarchar(100)
,@ContactPersonName	nvarchar(100)
,@ContactPersonNumber	nvarchar(20)
,@TissueBankEmailId	nvarchar(50)
,@BusinessURL	nvarchar(100)
,@TissueBankAddress	nvarchar(300)
,@CityId	int
,@TissueBankStateLicense	nvarchar(50)
,@AATBLicenseNumber	nvarchar(30)
,@AATBExpirationDate	date
,@AATBAccredationDate	date
,@UserName nvarchar(100)
,@Password	nvarchar(50)
)
as
begin
	BEGIN TRANSACTION trans
	BEGIN TRY

	begin --default value START
	
	declare @date DateTime=getdate();
	declare @AllowLogin bit= 1;
	declare @IsLockedOut bit =0,@CreatedBy int=0,@LastModifiedBy int=0;
	declare @IsEmailVerified bit =0,@IsMobileVerified bit=0,@IsAllocatMember bit=0,@IsAccountVerified bit=0,@IsActive bit=1;

	declare @EntityTypeId int =(select EntityTypeId from EntityType  where EntityTypeName like 'TISSUEBANK')
	declare @RoleID int =(select RoleID from Role  where RoleName like 'TISSUE BANK SUPER ADMIN')
	--default value END
	end

	--Creates a tissue bank
	insert into TissueBank(
		TissueBankName,ContactPersonName,ContactPersonNumber,TissueBankEmailId,BusinessURL,IsMobileVerified,IsEmailVerified,TissueBankAddress
		,CityId,TissueBankStateLicense,AATBLicenseNumber,AATBExpirationDate,AATBAccredationDate,IsAllocatMember
		,IsAccountVerified,IsActive
		)
	values
		( @TissueBankName,@ContactPersonName,@ContactPersonNumber,@TissueBankEmailId,@BusinessURL,@IsMobileVerified,@IsEmailVerified
		,@TissueBankAddress,@CityId,@TissueBankStateLicense,@AATBLicenseNumber,@AATBExpirationDate,@AATBAccredationDate
		,@IsAllocatMember,@IsAccountVerified,@IsActive
		)
	
	--Gets latest inserted Tissue bank Id to insert into Entity as info id
	declare @TissueBankId int=(select @@IDENTITY);

	--Creates an entity to create a user
	insert into Entity (EntityTypeId,InfoId) values (@EntityTypeId,@TissueBankId)
	--Gets latest inserted Entity Id
	declare @EntityId int=(select @@IDENTITY);

	--Creates a user
	insert into dbo.[User]
		(
			UserName,Password,FullName,EntityID,MobileNumber,EmailId,IsLockedOut,LastLoginDate,LastPasswordChangedDate
			,CreatedDate,CreatedBy,LastModifiedDate,LastModifiedBy,AllowLogin
		)
		values
		(	@UserName,@Password,@ContactPersonName,@EntityID,@ContactPersonNumber,@TissueBankEmailId,
			@IsLockedOut,@date,@date,@date,@CreatedBy,@date,@LastModifiedBy,@AllowLogin
		)
	
	--Gets latest inserted user id to create role for this user
	declare @UserId int=(select @@IDENTITY);

	-- Update CreatedBy and LastModifiedBy in user so that he himself have Modified and Created this entry
	update dbo.[User]
	set CreatedBy=@UserId,
	LastModifiedBy=@UserId
	where UserId=@UserId

	--Insert into user role with role 'TISSUE BANK SUPER ADMIN'
	insert into UserRole (UserID,RoleID) values (@UserId,@RoleID)

	BEGIN 
		COMMIT TRANSACTION trans
	 END
	END TRY
	BEGIN CATCH
		 print error_message()
			 BEGIN ROLLBACK TRANSACTION trans 
			 END
	END CATCH 

end
GO
/****** Object:  StoredProcedure [dbo].[sp_TissueBankProduct_TissueBank_AddUpdate]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TissueBankProduct_TissueBank_AddUpdate]
(
@temp tempTissueBankProduct_TissueBank readonly
)
as
begin
	BEGIN TRANSACTION trans
	BEGIN TRY
	  MERGE INTO TissueBankProduct tbp
      USING @temp temp
      ON tbp.TissueBankProductId=temp.TissueBankProductId 
      WHEN MATCHED THEN
			update set 
		tbp.ProductType=temp.ProductType
		,tbp.ProductCode=temp.ProductCode
		,tbp.ProductSize=temp.ProductSize
		,tbp.PreservationType=temp.PreservationType
		,tbp.ProductDescription=temp.ProductDescription
		,tbp.Remark=temp.Remark
		,tbp.UnitPrice=temp.UnitPrice
		,tbp.SourceId=temp.SourceId
		,tbp.IsAvailableForSale=temp.IsAvailableForSale
		,tbp.AvailabilityStartDate=temp.AvailabilityStartDate
		,tbp.AvailabilityEndDate=temp.AvailabilityEndDate
		,tbp.LastModifiedDate=getdate()
		,tbp.LastModifiedBy=temp.LastModifiedBy
		WHEN NOT MATCHED THEN
		  INSERT
		   VALUES(temp.TissueBankId,temp.ProductMasterId,temp.ProductType,temp.ProductCode,temp.ProductSize,temp.PreservationType,temp.ProductDescription
			,temp.Remark,temp.UnitPrice,temp.SourceId,temp.IsAvailableForSale,temp.AvailabilityStartDate,temp.AvailabilityEndDate
			,1,getdate(),temp.CreatedBy,getdate(),temp.LastModifiedBy);
		 BEGIN COMMIT TRANSACTION trans
		 END
	END TRY
	BEGIN CATCH
		BEGIN ROLLBACK TRANSACTION trans 
		END
	END CATCH 
end





GO
/****** Object:  StoredProcedure [dbo].[sp_TissueBankProduct_TissueBank_GetByTissueBankId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TissueBankProduct_TissueBank_GetByTissueBankId]
(
@TissueBankId int,
@SearchBy varchar(30),
@CurrentPage int,
@PageSize int,
@SortDirection varchar(10),
@SortExpression varchar(30)
)
as
begin
declare @StartLimit int=(@CurrentPage-1)*@PageSize+1;
declare @EndLimit int=@StartLimit+@PageSize-1;

declare @productCount int=(select count(distinct ProductMasterId) from TissueBankProduct);
WITH CTE_Results
    AS (
select ROW_NUMBER() OVER (ORDER BY case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductType' then ProductType
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductType' then ProductType
        end DESC,
case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'PreservationType' then PreservationType
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'PreservationType' then PreservationType
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then cast(null as numeric(18,2))
        when @SortExpression = 'UnitPrice' then UnitPrice
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as numeric(18,2))
        when @SortExpression = 'UnitPrice' then UnitPrice
        end DESC) Sno,
ProductMasterName,ProductType,ProductCode,ProductSize,PreservationType,UnitPrice,
(case when IsAvailableForSale=1 then 'Yes' else 'No' end) as IsAvailableForSale,
TissueBankProductId,tbp.ProductMasterId
from TissueBankProduct as tbp, ProductMaster as pm
where pm.ProductMasterId=tbp.ProductMasterId  and TissueBankId=28 and tbp.IsActive=1 and pm.IsActive=1
and (ProductType like @SearchBy+'%'
or ProductMasterName like @SearchBy+'%'
or ProductCode like  @SearchBy+'%'
or PreservationType like  @SearchBy+'%'
or UnitPrice like  @SearchBy+'%'
or ProductSize like @SearchBy+'%')
)

select @StartLimit as StartLimit,
ProductMasterName,ProductType,ProductCode,ProductSize,PreservationType,UnitPrice,
IsAvailableForSale,
TissueBankProductId,ProductMasterId
 from CTE_Results 
where Sno between @StartLimit and @EndLimit 
order by 
case
        when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductType' then ProductType
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductType' then ProductType
        end DESC,
case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductMasterName' then ProductMasterName
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'ProductCode' then ProductCode
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then ''
        when @SortExpression = 'PreservationType' then PreservationType
        end ASC
,       case
        when @SortDirection <> 'DESC' then ''
        when @SortExpression = 'PreservationType' then PreservationType
        end DESC
		,
		case		 when @SortDirection <> 'ASC' then cast(null as numeric(18,2))
        when @SortExpression = 'UnitPrice' then UnitPrice
        end ASC
,       case
        when @SortDirection <> 'DESC' then cast(null as numeric(18,2))
        when @SortExpression = 'UnitPrice' then UnitPrice
        end DESC
end





GO
/****** Object:  StoredProcedure [dbo].[sp_TissueBankProduct_TissueBank_GetTissueBankProductsByProductMasterId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TissueBankProduct_TissueBank_GetTissueBankProductsByProductMasterId]
(
@TissueBankId int,
@ProductMasterId int
)
as
begin
select
 TissueBankProductId
,tbp.TissueBankId
,tbp.ProductMasterId
,tbp.ProductType
,tbp.ProductCode
,tbp.ProductSize
,tbp.PreservationType
,tbp.ProductDescription
,tbp.UnitPrice
,tbp.SourceId
,s.SourceName
,case when tbp.IsAvailableForSale=1 then 'Yes' else 'No' end as IsAvailableForSale
,tbp.AvailabilityStartDate
,tbp.AvailabilityEndDate
,tbp.CreatedBy
,tbp.LastModifiedBy
from 
ProductMaster as pmChild left join  ProductMaster as pmParent on pmChild.FamilyId=pmParent.ProductMasterId
,TissueBankProduct as tbp left join dbo.[Source] as s on s.SourceId=tbp.SourceId,DomainScope as ds
where tbp.ProductMasterId=@ProductMasterId and tbp.TissueBankId=@TissueBankId 
and pmChild.ProductMasterId=tbp.ProductMasterId and pmChild.IsActive=1 and tbp.IsActive=1
and ds.DomainScopeId=pmChild.DomainScopeId order by ProductType asc
end






GO
/****** Object:  StoredProcedure [dbo].[sp_User_CUD]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_User_CUD]
(
 @UserId	int
,@UserName	nvarchar(100)
,@Password	nvarchar(50)
,@FullName	nvarchar(200)
,@EntityID	int
,@DomainScopeID	int
,@MobileNumber	varchar(20)
,@EmailId	nvarchar(100)
,@IsMobileVerified	bit
,@IsEmailVerified	bit
,@IsLockedOut	bit
,@LastLoginDate	datetime
,@LastPasswordChangedDate	datetime
,@LastLockoutDate	datetime
,@FailedPasswordAttemptCount	int
,@FailedPasswordAnswerAttemptCount	int
,@PasswordQuestion	nvarchar(256)
,@PasswordAnswer	nvarchar(128)
,@SecurityQuestion	varchar(100)
,@SecurityAnswer	varchar(100)
,@IsActive	bit
,@CreatedBy	int
,@LastModifiedBy	int
,@EntityTypeId int
,@InfoId int
,@TempUser_CUD TempUser_CUD readonly
,@OperationType varchar(10) 
)
as
begin
BEGIN TRANSACTION trans
BEGIN TRY
	declare @date datetime=getdate();

	if(@OperationType='insert')
	begin
		
		declare @TempUser_CUD2 TempUser_CUD
		
		insert into @TempUser_CUD2
		select * from @TempUser_CUD

		insert into Entity values(@EntityTypeId,@InfoId)

		set @EntityID =(select @@IDENTITY);

		insert into dbo.[User]
		values
		(@UserName,@Password,@FullName,@EntityID,@DomainScopeID,@MobileNumber,@EmailId,@IsMobileVerified,@IsEmailVerified
		,@IsLockedOut,@LastLoginDate,@LastPasswordChangedDate,@LastLockoutDate,@FailedPasswordAttemptCount,@FailedPasswordAnswerAttemptCount
		,@PasswordQuestion,@PasswordAnswer,@SecurityQuestion,@SecurityAnswer,@IsActive,@date,@CreatedBy,@date,@LastModifiedBy
		)

		set @UserId=(select @@IDENTITY);
		
		update @TempUser_CUD2
		set UserId=@UserId

		insert into UserRole
		select * from @TempUser_CUD2
	end
	else if (@OperationType='update')
	begin
		update dbo.[user]
		set 
			 UserName							  =@UserName
			,Password								=@Password
			,FullName								=@FullName
			,EntityID							  =@EntityID
			,DomainScopeID						  =@DomainScopeID
			,MobileNumber						  =@MobileNumber
			,EmailId							  =@EmailId
			,IsMobileVerified					  =@IsMobileVerified
			,IsEmailVerified					  =@IsEmailVerified
			,IsLockedOut						  =@IsLockedOut
			,LastLoginDate						  =@LastLoginDate
			,LastPasswordChangedDate			  =@LastPasswordChangedDate
			,LastLockoutDate					  =@LastLockoutDate
			,FailedPasswordAttemptCount			  =@FailedPasswordAttemptCount
			,FailedPasswordAnswerAttemptCount	  =@FailedPasswordAnswerAttemptCount
			,PasswordQuestion					  =@PasswordQuestion
			,PasswordAnswer						  =@PasswordAnswer
			,SecurityQuestion					  =@SecurityQuestion
			,SecurityAnswer						  =@SecurityAnswer
			,IsActive							  =@IsActive
			,LastModifiedDate					  =@date
			,LastModifiedBy						  =@LastModifiedBy
			where UserId=@UserId

			delete from UserRole where UserID=@UserId

			insert into UserRole
			select * from @TempUser_CUD

	end
	else if(@OperationType='delete')
	begin
			update dbo.[User]
			set IsActive=0
				,LastModifiedDate=@date
				,LastModifiedBy=@LastModifiedBy
			where UserId=@UserId
	end
BEGIN COMMIT TRANSACTION trans
 END
END TRY
BEGIN CATCH
 print error_message()
 BEGIN ROLLBACK TRANSACTION trans 
 END
END CATCH 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_User_Get]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_User_Get]
(
@RoleName varchar(100)
,@GetType varchar(20)
,@SearchBy varchar(30),
@CurrentPage int,
@PageSize int,
@SortDirection varchar(10),
@SortExpression varchar(30)
)
as
begin
		declare @tempUser tempUser;
		declare @StartLimit int=(@CurrentPage-1)*@PageSize+1;
		declare @EndLimit int=@StartLimit+@PageSize-1;

		WITH CTE_Results
			AS (
			select UserID,RoleName from dbo.[Role] as r, UserRole as ur
			where ur.RoleID=r.RoleID
		)

		insert into @tempUser
			SELECT UserID
					, STUFF((SELECT ', ' + RoleName FROM CTE_Results A
					Where A.UserID=B.UserID FOR XML PATH('')),1,1,'') As UserRoles
					From CTE_Results B
					Group By UserID

if(@RoleName='ALLOCAT ADMIN')
begin
		if(@GetType='TB_Hospital')
		begin
				WITH CTE_Results
			AS (
			select UserID,RoleName from dbo.[Role] as r, UserRole as ur
			where ur.RoleID=r.RoleID
		)

		insert into @tempUser
			SELECT UserID
					, STUFF((SELECT ', ' + RoleName FROM CTE_Results A
					Where A.UserID=B.UserID FOR XML PATH('')),1,1,'') As UserRoles
					From CTE_Results B
					Group By UserID;

				WITH CTE_Results2
				AS (
					select ROW_NUMBER() OVER (ORDER BY 
					case
					when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'FullName' then FullName
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'FullName' then FullName
					end DESC,
			case
					when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'IsLockedOut' then IsLockedOut
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'IsLockedOut' then IsLockedOut
					end DESC,
			case		 when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'IsActive' then u.IsActive
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'IsActive' then u.IsActive
					end DESC
					,
					case		 when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'DomainName' then DomainName
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'DomainName' then DomainName
					end DESC
					
				) Sno,
				 u.UserId,u.UserName,u.FullName,u.MobileNumber,u.EmailId
				,case when u.IsLockedOut=0 then 'No' else 'Yes' end as IsLockedOut
				,u.LastLoginDate
				,case when u.IsActive=0 then 'No' else 'Yes' end as IsActive
				,UserRoles,DomainName,'Hospital' as InfoType
			 from dbo.[User] as u,
					@tempuser as tu, Entity as e, DomainScope as ds, Hospital as h
			 where tu.UserId=u.UserId and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID 
					and e.EntityTypeId=1 and e.InfoId=h.HospitalId
					and (	UserName like @SearchBy+'%'
							or FullName like @SearchBy+'%'
							or MobileNumber like  @SearchBy+'%'
							or EmailId like @SearchBy+'%'
							or LastLoginDate like  @SearchBy+'%'
							or UserRoles like  @SearchBy+'%'
							or DomainName like  @SearchBy+'%'
						)

			 union

					select ROW_NUMBER() OVER (ORDER BY 
					case
					when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'FullName' then FullName
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'FullName' then FullName
					end DESC,
			case
					when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'IsLockedOut' then IsLockedOut
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'IsLockedOut' then IsLockedOut
					end DESC,
			case		 when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'IsActive' then u.IsActive
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'IsActive' then u.IsActive
					end DESC
					,
					case		 when @SortDirection <> 'ASC' then ''
					when @SortExpression = 'DomainName' then DomainName
					end ASC
			,       case
					when @SortDirection <> 'DESC' then ''
					when @SortExpression = 'DomainName' then DomainName
					end DESC
					
				) Sno, 
				 u.UserId,u.UserName,u.FullName,u.MobileNumber,u.EmailId
				,case when u.IsLockedOut=0 then 'No' else 'Yes' end as IsLockedOut
				,u.LastLoginDate
				,case when u.IsActive=0 then 'No' else 'Yes' end as IsActive
				,UserRoles,DomainName,'Hospital' as InfoType
				 from dbo.[User] as u,
						@tempuser as tu, Entity as e, DomainScope as ds, TissueBank as tb
				where tu.UserId=u.UserId and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID 
						and e.EntityTypeId=2 and e.InfoId=tb.TissueBankId
						and (	UserName like @SearchBy+'%'
							or FullName like @SearchBy+'%'
							or MobileNumber like  @SearchBy+'%'
							or EmailId like @SearchBy+'%'
							or LastLoginDate like  @SearchBy+'%'
							or UserRoles like  @SearchBy+'%'
							or DomainName like  @SearchBy+'%'
						)
			 )

			 select * from CTE_Results2 
			where Sno between @StartLimit and @EndLimit 
			order by 
				case
						when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'FullName' then FullName
						end ASC
				,case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'FullName' then FullName
						end DESC,
				case
						when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'IsLockedOut' then IsLockedOut
						end ASC
				,case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'IsLockedOut' then IsLockedOut
						end DESC,
				case		 when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'IsActive' then IsActive
						end ASC
				,case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'IsActive' then IsActive
						end DESC
						,
				case		 when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'DomainName' then DomainName
						end ASC
				,case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'DomainName' then DomainName
						end DESC
		 end
		 else if(@GetType='Allocat')
		begin
			 WITH CTE_Results2
    AS (
		select ROW_NUMBER() OVER (ORDER BY 
			case
			when @SortDirection <> 'ASC' then ''
			when @SortExpression = 'FullName' then FullName
			end ASC
	,       case
			when @SortDirection <> 'DESC' then ''
			when @SortExpression = 'FullName' then FullName
			end DESC,
	case
			when @SortDirection <> 'ASC' then ''
			when @SortExpression = 'IsLockedOut' then IsLockedOut
			end ASC
	,       case
			when @SortDirection <> 'DESC' then ''
			when @SortExpression = 'IsLockedOut' then IsLockedOut
			end DESC,
	case		 when @SortDirection <> 'ASC' then ''
			when @SortExpression = 'IsActive' then IsActive
			end ASC
	,       case
			when @SortDirection <> 'DESC' then ''
			when @SortExpression = 'IsActive' then IsActive
			end DESC
			,
			case		 when @SortDirection <> 'ASC' then ''
			when @SortExpression = 'DomainName' then DomainName
			end ASC
	,       case
			when @SortDirection <> 'DESC' then ''
			when @SortExpression = 'DomainName' then DomainName
			end DESC
			) Sno,
			 u.UserId,u.UserName,u.FullName,u.MobileNumber,u.EmailId
				,case when u.IsLockedOut=0 then 'No' else 'Yes' end as IsLockedOut
				,u.LastLoginDate
				,case when u.IsActive=0 then 'No' else 'Yes' end as IsActive
				,UserRoles,DomainName,'Hospital' as InfoType
			 from dbo.[User] as u,
					@tempuser as tu, Entity as e, DomainScope as ds, company as c
			  where tu.UserId=u.UserId and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID 
					and e.EntityTypeId=3 and e.InfoId=c.companyid
					and (	UserName like @SearchBy+'%'
							or FullName like @SearchBy+'%'
							or MobileNumber like  @SearchBy+'%'
							or EmailId like @SearchBy+'%'
							or LastLoginDate like  @SearchBy+'%'
							or UserRoles like  @SearchBy+'%'
							or DomainName like  @SearchBy+'%'
						)
			 )

			 select * from CTE_Results2 
				where Sno between @StartLimit and @EndLimit 
				order by 
					case
							when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'FullName' then FullName
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'FullName' then FullName
							end DESC,
					case
							when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'IsLockedOut' then IsLockedOut
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'IsLockedOut' then IsLockedOut
							end DESC,
					case		 when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'IsActive' then IsActive
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'IsActive' then IsActive
							end DESC
							,
							case		 when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'DomainName' then DomainName
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'DomainName' then DomainName
							end DESC
		 end

end
else if(@RoleName='HOSPITAL SUPER ADMIN')
begin
		WITH CTE_Results2
    AS (
		select ROW_NUMBER() OVER (ORDER BY 
				case
				when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'FullName' then FullName
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'FullName' then FullName
				end DESC,
		case
				when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'IsLockedOut' then IsLockedOut
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'IsLockedOut' then IsLockedOut
				end DESC,
		case		 when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'IsActive' then u.IsActive
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'IsActive' then u.IsActive
				end DESC
				,
				case		 when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'DomainName' then DomainName
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'DomainName' then DomainName
				end DESC
				
				) Sno, 
				 u.UserId,u.UserName,u.FullName,u.MobileNumber,u.EmailId
				,case when u.IsLockedOut=0 then 'No' else 'Yes' end as IsLockedOut
				,u.LastLoginDate
				,case when u.IsActive=0 then 'No' else 'Yes' end as IsActive
				,UserRoles,DomainName,'Hospital' as InfoType
				 from dbo.[User] as u,
						@tempuser as tu, Entity as e, DomainScope as ds, Hospital as h
				 where tu.UserId=u.UserId and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID 
						and e.EntityTypeId=1 and e.InfoId=h.HospitalId
						and (	UserName like @SearchBy+'%'
							or FullName like @SearchBy+'%'
							or MobileNumber like  @SearchBy+'%'
							or EmailId like @SearchBy+'%'
							or LastLoginDate like  @SearchBy+'%'
							or UserRoles like  @SearchBy+'%'
							or DomainName like  @SearchBy+'%'
						)
						 )

			 select * from CTE_Results2 
				where Sno between @StartLimit and @EndLimit 
				order by 
					case
							when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'FullName' then FullName
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'FullName' then FullName
							end DESC,
					case
							when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'IsLockedOut' then IsLockedOut
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'IsLockedOut' then IsLockedOut
							end DESC,
					case		 when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'IsActive' then IsActive
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'IsActive' then IsActive
							end DESC
							,
							case		 when @SortDirection <> 'ASC' then ''
							when @SortExpression = 'DomainName' then DomainName
							end ASC
					,       case
							when @SortDirection <> 'DESC' then ''
							when @SortExpression = 'DomainName' then DomainName
							end DESC
end
else if(@RoleName='TISSUE BANK SUPER ADMIN')
begin
		 WITH CTE_Results2
    AS (
		select ROW_NUMBER() OVER (ORDER BY 
				case
				when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'FullName' then FullName
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'FullName' then FullName
				end DESC,
		case
				when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'IsLockedOut' then IsLockedOut
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'IsLockedOut' then IsLockedOut
				end DESC,
		case		 when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'IsActive' then u.IsActive
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'IsActive' then u.IsActive
				end DESC
				,
				case		 when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'DomainName' then DomainName
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'DomainName' then DomainName
				end DESC
				
				) Sno,  
				 u.UserId,u.UserName,u.FullName,u.MobileNumber,u.EmailId
				,case when u.IsLockedOut=0 then 'No' else 'Yes' end as IsLockedOut
				,u.LastLoginDate
				,case when u.IsActive=0 then 'No' else 'Yes' end as IsActive
				,UserRoles,DomainName,'Hospital' as InfoType
				 from dbo.[User] as u,
						@tempuser as tu, Entity as e, DomainScope as ds, TissueBank as tb
				  where tu.UserId=u.UserId and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID 
						and e.EntityTypeId=2 and e.InfoId=tb.TissueBankId
						and (	UserName like @SearchBy+'%'
							or FullName like @SearchBy+'%'
							or MobileNumber like  @SearchBy+'%'
							or EmailId like @SearchBy+'%'
							or LastLoginDate like  @SearchBy+'%'
							or UserRoles like  @SearchBy+'%'
							or DomainName like  @SearchBy+'%'
						)
				 )
			 select * from CTE_Results2 
				where Sno between @StartLimit and @EndLimit 
				order by 
				case
						when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'FullName' then FullName
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'FullName' then FullName
						end DESC,
				case
						when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'IsLockedOut' then IsLockedOut
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'IsLockedOut' then IsLockedOut
						end DESC,
				case		 when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'IsActive' then IsActive
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'IsActive' then IsActive
						end DESC
						,
						case		 when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'DomainName' then DomainName
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'DomainName' then DomainName
						end DESC
						,
						case		 when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'InfoType' then InfoType
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'InfoType' then InfoType
						end DESC
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetEntityInfoByUserName]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_User_GetEntityInfoByUserName]
(
@UserName varchar(100)
)
as
begin

declare @EntitytypeId int=(Select EntitytypeId from Entity where entityId =(Select entityID from dbo.[User] where UserName = @UserName))
declare @infoID int=(Select InfoId from Entity where entityId =(Select entityID from dbo.[User] where UserName = @UserName))

if(@EntitytypeId=1)
begin
	select 'HOSPITAL' as InfoType,HospitalName as InfoName,@infoID as InfoId from Hospital where HospitalId=@infoID 
end
else if(@EntitytypeId=2)
begin
	select 'TISSUEBANK' as InfoType,TissueBankName as InfoName,@infoID as InfoId from TissueBank where TissueBankId=@infoID 
end
else if(@EntitytypeId=3)
begin
	select 'ALLOCAT STAFF' as InfoType,companyName as InfoName,@infoID as InfoId from company where companyId=@infoID
end
end







GO
/****** Object:  StoredProcedure [dbo].[sp_User_GetRoleByUserName]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_User_GetRoleByUserName]
(
@UserName varchar(100)
)
as
begin
SELECT RoleName
FROM dbo.[User] as u, UserRole as ur, Role as r
 where UserName =@UserName and ur.userid=u.UserId and r.RoleID=ur.RoleID
 end



GO
/****** Object:  StoredProcedure [dbo].[sp_UserDetail_GetByUserId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UserDetail_GetByUserId]
(
 @UserId int
,@InfoType varchar(10)
)
as
begin
if(@InfoType='HOSPITAL')
begin
	select 
	 u.UserId
	,u.UserName	
	,u.Password	
	,u.FullName	
	,u.EntityID	
	,u.DomainScopeID
	,u.MobileNumber
	,u.EmailId
	,u.IsMobileVerified
	,u.IsEmailVerified
	,u.IsLockedOut
	,u.LastLoginDate
	,u.LastPasswordChangedDate
	,u.LastLockoutDate
	,u.FailedPasswordAttemptCount
	,u.FailedPasswordAnswerAttemptCount
	,u.PasswordQuestion
	,u.PasswordAnswer
	,u.SecurityQuestion
	,u.SecurityAnswer
	,u.IsActive
	,u.CreatedBy
	,u.LastModifiedBy
	,e.EntityTypeId
	,InfoId
	from dbo.[User] as u,UserRole as ur, dbo.[Role] as r,Hospital as h,Entity as e,DomainScope as ds
	 where u.UserId=@UserId and ur.UserID=u.UserId and r.RoleID=ur.RoleID and h.HospitalId=e.InfoId
	 and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID
	 end
else if(@InfoType='TISSUEBANK')
begin
	select 
	 u.UserId
	,u.UserName	
	,u.Password	
	,u.FullName	
	,u.EntityID	
	,u.DomainScopeID
	,u.MobileNumber
	,u.EmailId
	,u.IsMobileVerified
	,u.IsEmailVerified
	,u.IsLockedOut
	,u.LastLoginDate
	,u.LastPasswordChangedDate
	,u.LastLockoutDate
	,u.FailedPasswordAttemptCount
	,u.FailedPasswordAnswerAttemptCount
	,u.PasswordQuestion
	,u.PasswordAnswer
	,u.SecurityQuestion
	,u.SecurityAnswer
	,u.IsActive
	,u.CreatedBy
	,u.LastModifiedBy
	,e.EntityTypeId
	,InfoId
	from dbo.[User] as u,UserRole as ur, dbo.[Role] as r,TissueBank as tb,Entity as e,DomainScope as ds
	 where u.UserId=@UserId and ur.UserID=u.UserId and r.RoleID=ur.RoleID and tb.TissueBankId=e.InfoId
	 and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID
	 end
else if(@InfoType='ALLOCAT STAFF')
begin
	select 
	 u.UserId
	,u.UserName	
	,u.Password	
	,u.FullName	
	,u.EntityID	
	,u.DomainScopeID
	,u.MobileNumber
	,u.EmailId
	,u.IsMobileVerified
	,u.IsEmailVerified
	,u.IsLockedOut
	,u.LastLoginDate
	,u.LastPasswordChangedDate
	,u.LastLockoutDate
	,u.FailedPasswordAttemptCount
	,u.FailedPasswordAnswerAttemptCount
	,u.PasswordQuestion
	,u.PasswordAnswer
	,u.SecurityQuestion
	,u.SecurityAnswer
	,u.IsActive
	,u.CreatedBy
	,u.LastModifiedBy
	,e.EntityTypeId
	,InfoId
	from dbo.[User] as u,UserRole as ur, dbo.[Role] as r,company as c,Entity as e,DomainScope as ds
	 where u.UserId=@UserId and ur.UserID=u.UserId and r.RoleID=ur.RoleID and c.companyid=e.InfoId
	 and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID
	 end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_UserMngmt_GetUserRoleByUserId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UserMngmt_GetUserRoleByUserId]
(
@UserId int
)
as
begin
	select  ur.RoleId, RoleName
	from UserRole as ur ,dbo.[role] as r
	where r.roleid=ur.roleid 
	and UserID=@UserId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMngmt_TissueBank_CreateUpdateDelete]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UserMngmt_TissueBank_CreateUpdateDelete]
(
 @UserId	int
,@UserName	nvarchar(100)
,@Password	nvarchar(50)
,@FullName	nvarchar(200)
,@MobileNumber	varchar(20)
,@EmailId	nvarchar(100)
,@CreatedBy	int
,@LastModifiedBy	int
,@InfoId int
,@AllowLogin bit
,@OperationType varchar(10) 
,@TempUser_CUD TempUser_CUD readonly

)
as
begin
BEGIN TRANSACTION trans
BEGIN TRY
	declare @date datetime=getdate();

	if(@OperationType='insert')
	begin
		
		declare @TempUser_CUD2 TempUser_CUD
		
		insert into @TempUser_CUD2
		select * from @TempUser_CUD

		insert into Entity values(2,@InfoId)

		declare @EntityID int=(select @@IDENTITY);

		insert into dbo.[User]
		(
			UserName,Password,FullName,EntityID,MobileNumber,EmailId,IsLockedOut,LastLoginDate,LastPasswordChangedDate
			,CreatedDate,CreatedBy,LastModifiedDate,LastModifiedBy,AllowLogin
		)
		values
		(	@UserName,@Password,@FullName,@EntityID,@MobileNumber,@EmailId,
			0,@date,@date,@date,@CreatedBy,@date,@LastModifiedBy,@AllowLogin
		)

		set @UserId=(select @@IDENTITY);
		
		update @TempUser_CUD2
		set UserId=@UserId

		insert into UserRole
		select UserID,RoleID from @TempUser_CUD2
	end

	else if (@OperationType='update')
	begin
		update dbo.[user]
		set 
			 UserName							  =@UserName
			,FullName								=@FullName
			,MobileNumber						  =@MobileNumber
			,EmailId							  =@EmailId
			,IsLockedOut						  =0
			,LastLoginDate						  =@date
			,LastPasswordChangedDate			  =@date
			,LastModifiedDate					  =@date
			,LastModifiedBy						  =@LastModifiedBy
			,AllowLogin						  =@AllowLogin
			where UserId=@UserId

			delete from UserRole where UserID=@UserId

			insert into UserRole
			select UserID,RoleID  from @TempUser_CUD

	end
	else if(@OperationType='delete')
	begin
			update dbo.[User]
				set IsActive=0
				,LastModifiedDate=@date
				,LastModifiedBy=@LastModifiedBy
			where UserId=@UserId
	end
	BEGIN 
		COMMIT TRANSACTION trans
	 END
	END TRY
	BEGIN CATCH
		 print error_message()
			 BEGIN ROLLBACK TRANSACTION trans 
			 END
	END CATCH 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMngmt_TissueBank_GetByTissueBankId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UserMngmt_TissueBank_GetByTissueBankId]
(
 @TissueBankId int
,@SearchBy varchar(30),
@CurrentPage int,
@PageSize int,
@SortDirection varchar(10),
@SortExpression varchar(30)
)
as
begin
		declare @tempUser tempUser;
		declare @StartLimit int=(@CurrentPage-1)*@PageSize+1;
		declare @EndLimit int=@StartLimit+@PageSize-1;

		WITH CTE_Results
			AS (
			select UserID,RoleName from dbo.[Role] as r, UserRole as ur
			where ur.RoleID=r.RoleID
		)

		insert into @tempUser
			SELECT UserID
					, STUFF((SELECT ', ' + RoleName FROM CTE_Results A
					Where A.UserID=B.UserID FOR XML PATH('')),1,1,'') As UserRoles
					From CTE_Results B
					Group By UserID;


		 WITH CTE_Results2
    AS (
		select ROW_NUMBER() OVER (ORDER BY 
				case
				when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'FullName' then FullName
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'FullName' then FullName
				end DESC,
		case
				when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'IsLockedOut' then IsLockedOut
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'IsLockedOut' then IsLockedOut
				end DESC,
		case		 when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'IsActive' then u.IsActive
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'IsActive' then u.IsActive
				end DESC
				,
				case		 when @SortDirection <> 'ASC' then ''
				when @SortExpression = 'DomainName' then DomainName
				end ASC
		,       case
				when @SortDirection <> 'DESC' then ''
				when @SortExpression = 'DomainName' then DomainName
				end DESC
				
				) Sno,  
				 u.UserId,u.UserName,u.FullName,u.MobileNumber,u.EmailId
				,case when u.IsLockedOut=0 then 'No' else 'Yes' end as IsLockedOut
				,u.LastLoginDate
				,case when u.IsActive=1 then 'Yes' else 'No' end as IsActive
				,case when u.AllowLogin=1 then 'Yes' else 'No' end as AllowLogin
				,UserRoles,DomainName
				 from dbo.[User] as u,@tempuser as tu, Entity as e, TissueBank as tb
				 left join DomainScope as ds on ds.DomainScopeId=DomainScopeId
				  where tu.UserId=u.UserId and e.EntityId=u.EntityID  
						and e.EntityTypeId=2 and e.InfoId=tb.TissueBankId and tb.TissueBankId=@TissueBankId
						and (	UserName like @SearchBy+'%'
							or FullName like @SearchBy+'%'
							or MobileNumber like  @SearchBy+'%'
							or EmailId like @SearchBy+'%'
							or LastLoginDate like  @SearchBy+'%'
							or UserRoles like  @SearchBy+'%'
							or DomainName like  @SearchBy+'%'
						)
				 )
			 select * from CTE_Results2 
				where Sno between @StartLimit and @EndLimit 
				order by 
				case
						when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'FullName' then FullName
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'FullName' then FullName
						end DESC,
				case
						when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'IsLockedOut' then IsLockedOut
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'IsLockedOut' then IsLockedOut
						end DESC,
				case		 when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'IsActive' then IsActive
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'IsActive' then IsActive
						end DESC
						,
						case		 when @SortDirection <> 'ASC' then ''
						when @SortExpression = 'DomainName' then DomainName
						end ASC
				,       case
						when @SortDirection <> 'DESC' then ''
						when @SortExpression = 'DomainName' then DomainName
						end DESC
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMngmt_TissueBank_GetByUserId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UserMngmt_TissueBank_GetByUserId]
(
 @UserId int
)
as
begin
	select 
		 u.UserId
		,u.UserName
		,u.FullName
		,u.MobileNumber
		,u.EmailId
		,u.IsMobileVerified
		,u.IsEmailVerified
		,u.IsLockedOut
		,u.LastLoginDate
		,u.LastPasswordChangedDate
		,u.LastLockoutDate
		,u.FailedPasswordAttemptCount
		,u.FailedPasswordAnswerAttemptCount
		,u.PasswordQuestion
		,u.PasswordAnswer
		,u.SecurityQuestion
		,u.SecurityAnswer
		,u.LastModifiedDate
		,u.AllowLogin
		,InfoId
		,DomainName
	from dbo.[User] as u,UserRole as ur, dbo.[Role] as r,TissueBank as tb,Entity as e
	left join DomainScope as ds on ds.DomainScopeId=DomainScopeId
	where u.UserId=@UserId and ur.UserID=u.UserId and r.RoleID=ur.RoleID and tb.TissueBankId=e.InfoId
		 and e.EntityId=u.EntityID and u.IsActive=1 and tb.IsActive=1
end	 
GO
/****** Object:  StoredProcedure [dbo].[sp_UserMngmt_TissueBank_GetCountByTissueBankId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UserMngmt_TissueBank_GetCountByTissueBankId]
(
 @TissueBankId int
,@SearchBy varchar(30)
)
as
begin
		declare @tempUser tempUser;

		WITH CTE_Results
			AS (
			select UserID,RoleName from dbo.[Role] as r, UserRole as ur
			where ur.RoleID=r.RoleID
		)

		insert into @tempUser
			SELECT UserID
					, STUFF((SELECT ', ' + RoleName FROM CTE_Results A
					Where A.UserID=B.UserID FOR XML PATH('')),1,1,'') As UserRoles
					From CTE_Results B
					Group By UserID;


		 WITH CTE_Results2
    AS (
		select 
				 u.UserId,u.UserName,u.FullName,u.MobileNumber,u.EmailId
				,case when u.IsLockedOut=0 then 'No' else 'Yes' end as IsLockedOut
				,u.LastLoginDate
				,case when u.IsActive=1 then 'Yes' else 'No' end as IsActive
				,case when u.AllowLogin=1 then 'Yes' else 'No' end as AllowLogin
				,UserRoles,DomainName
				 from dbo.[User] as u,@tempuser as tu, Entity as e, TissueBank as tb
				 left join DomainScope as ds on ds.DomainScopeId=DomainScopeId
				  where tu.UserId=u.UserId and e.EntityId=u.EntityID  
						and e.EntityTypeId=2 and e.InfoId=tb.TissueBankId and tb.TissueBankId=@TissueBankId
						and (	UserName like @SearchBy+'%'
							or FullName like @SearchBy+'%'
							or MobileNumber like  @SearchBy+'%'
							or EmailId like @SearchBy+'%'
							or LastLoginDate like  @SearchBy+'%'
							or UserRoles like  @SearchBy+'%'
							or DomainName like  @SearchBy+'%'
						)
				 )
			 select count(*) from CTE_Results2 
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProfile_TissueBank_UpdateByUserId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UserProfile_TissueBank_UpdateByUserId]
(
 @UserId	int
,@UserName	nvarchar(100)
,@FullName	nvarchar(200)
,@MobileNumber	varchar(20)
,@EmailId	nvarchar(100)
,@IsMobileVerified	bit
,@IsEmailVerified	bit	
,@LastLoginDate	datetime
,@PasswordQuestion	nvarchar(256)
,@PasswordAnswer	nvarchar(128)
,@SecurityQuestion	varchar(100)
,@SecurityAnswer	varchar(100)
)
as
begin
		declare @date datetime=getdate();

		update dbo.[user]
		set 
			 UserName							  =@UserName
			,FullName							  =@FullName
			,MobileNumber						  =@MobileNumber
			,EmailId							  =@EmailId
			,IsMobileVerified					  =@IsMobileVerified
			,IsEmailVerified					  =@IsEmailVerified
			,LastLoginDate						  =@date
			,PasswordQuestion					  =@PasswordQuestion
			,PasswordAnswer						  =@PasswordAnswer
			,SecurityQuestion					  =@SecurityQuestion
			,SecurityAnswer						  =@SecurityAnswer
			,LastModifiedDate					  =@date
			,LastModifiedBy						  =@UserId
			where UserId=@UserId
end
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProfileDetail_TissueBank_GetByUserId]    Script Date: 1/20/2017 11:40:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UserProfileDetail_TissueBank_GetByUserId]
(
 @UserId int
)
as
begin
	select 
	 u.UserId
	,u.UserName	
	,u.FullName	
	,u.MobileNumber
	,u.EmailId
	,u.IsMobileVerified
	,u.IsEmailVerified
	,u.IsLockedOut
	,u.LastLoginDate
	,u.LastPasswordChangedDate
	,u.LastLockoutDate
	,u.FailedPasswordAttemptCount
	,u.FailedPasswordAnswerAttemptCount
	,u.CreatedBy
	,u.LastModifiedBy
	,InfoId
	,DomainName
	from dbo.[User] as u,UserRole as ur, dbo.[Role] as r,Hospital as h,Entity as e,DomainScope as ds
	 where u.UserId=@UserId and ur.UserID=u.UserId and r.RoleID=ur.RoleID and h.HospitalId=e.InfoId
	 and e.EntityId=u.EntityID and ds.DomainScopeId=u.DomainScopeID and u.IsActive=1 and h.IsActive=1
end	 
GO
USE [master]
GO
ALTER DATABASE [AllocatNowJan4_Old] SET  READ_WRITE 
GO
