USE [master]
GO
/****** Object:  Database [dbFleetManagement]    Script Date: 09/08/2019 10:35:09 ******/
CREATE DATABASE [dbFleetManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbFleetManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbFleetManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbFleetManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbFleetManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbFleetManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbFleetManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbFleetManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbFleetManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbFleetManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbFleetManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbFleetManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbFleetManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbFleetManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbFleetManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbFleetManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbFleetManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbFleetManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbFleetManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbFleetManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbFleetManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbFleetManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbFleetManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbFleetManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbFleetManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbFleetManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbFleetManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbFleetManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbFleetManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbFleetManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbFleetManagement] SET  MULTI_USER 
GO
ALTER DATABASE [dbFleetManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbFleetManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbFleetManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbFleetManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbFleetManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbFleetManagement] SET QUERY_STORE = OFF
GO
USE [dbFleetManagement]
GO
/****** Object:  User [userDemo]    Script Date: 09/08/2019 10:35:09 ******/
CREATE USER [userDemo] FOR LOGIN [userDemo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [userDemo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [userDemo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [userDemo]
GO
/****** Object:  Table [dbo].[tblContacts]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContacts](
	[ContactID] [varchar](50) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[Job] [varchar](50) NULL,
	[Phone] [varchar](100) NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblContacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContactsOwner]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContactsOwner](
	[CO_RelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[ContactPersonID] [varchar](10) NOT NULL,
	[OwnerID] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tblContactsOwner] PRIMARY KEY CLUSTERED 
(
	[CO_RelationshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOwners]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOwners](
	[OwnerID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PostalCode] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Website] [varchar](100) NOT NULL,
	[PrimaryContactPersonID] [varchar](10) NOT NULL,
	[BusinessPhone] [varchar](50) NOT NULL,
	[BusinessEmail] [varchar](50) NOT NULL,
	[VATid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblOwners] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOwnersVessels]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOwnersVessels](
	[OW_RelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerID] [varchar](50) NOT NULL,
	[IMO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblOwnersVessels] PRIMARY KEY CLUSTERED 
(
	[OW_RelationshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayments]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayments](
	[PaymentRecordID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerID] [varchar](100) NOT NULL,
	[AccountIBANCode] [varchar](50) NOT NULL,
	[SWIFT] [varchar](50) NOT NULL,
	[BankName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblPayments] PRIMARY KEY CLUSTERED 
(
	[PaymentRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVessels]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVessels](
	[MMSI] [varchar](50) NULL,
	[IMO] [varchar](50) NOT NULL,
	[ShipName] [varchar](100) NULL,
	[CallSign] [varchar](50) NOT NULL,
	[Flag] [varchar](100) NULL,
	[VesselType] [varchar](100) NULL,
	[GrossTonnage] [int] NULL,
	[Deadweight] [int] NULL,
	[DateBuilt] [date] NULL,
	[IsActiveService] [bit] NOT NULL,
 CONSTRAINT [PK_tblVessel_1] PRIMARY KEY CLUSTERED 
(
	[IMO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblContacts] ([ContactID], [FullName], [Job], [Phone], [Email]) VALUES (N'CON000001', N'John Doe', N'Designated Person Ashore (DPO)', N'+33 343434', N'john.doe@cma.com')
INSERT [dbo].[tblContacts] ([ContactID], [FullName], [Job], [Phone], [Email]) VALUES (N'CON000002', N'Martin Scorsese', N'Purchase Officer', N'+44 45454 5454', N'martin.scorsese@maersk.com')
INSERT [dbo].[tblContacts] ([ContactID], [FullName], [Job], [Phone], [Email]) VALUES (N'CON000003', N'Paul White', N'Sales Representative', N'+65 4343 434343', N'paul.white@maersktankers.com')
INSERT [dbo].[tblContacts] ([ContactID], [FullName], [Job], [Phone], [Email]) VALUES (N'CON000004', N'Peter Mehr', N'Commercial Manager', N'', N'peter.mehr@carisbrooke.com')
INSERT [dbo].[tblContacts] ([ContactID], [FullName], [Job], [Phone], [Email]) VALUES (N'CON000005', N'Elena Seidl', N'Sales Representative', N'+44 343435 4343', N'elena.seidl@zodiac.net')
INSERT [dbo].[tblContacts] ([ContactID], [FullName], [Job], [Phone], [Email]) VALUES (N'CON000006', N'Ion Florea', N'Technical Superintendent', N'+33 32323 323 ', N'ionel.florea@cma.com')
INSERT [dbo].[tblContacts] ([ContactID], [FullName], [Job], [Phone], [Email]) VALUES (N'CON000007', N'Michael Novak', N'Technical Superintendent', N'+44 434343 545', N'michael.novak@maersk.com')
SET IDENTITY_INSERT [dbo].[tblContactsOwner] ON 

INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (1, N'CON000001', N'619D0B74-331E-45F6-98B3-494935390AA1')
INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (2, N'CON000002', N'07A2396C-DE4A-407D-A35C-4CE11650CC2E')
INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (3, N'CON000003', N'D5E95D4C-ECD1-49EA-AD69-82FC64032290')
INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (4, N'CON000004', N'10E7C617-03BC-4410-874A-FC845C173294')
INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (5, N'CON000005', N'E0B62038-FEED-466D-9D48-E76C3D5F5718')
INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (6, N'CON000006', N'619D0B74-331E-45F6-98B3-494935390AA1')
INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (7, N'CON000007', N'07A2396C-DE4A-407D-A35C-4CE11650CC2E')
INSERT [dbo].[tblContactsOwner] ([CO_RelationshipID], [ContactPersonID], [OwnerID]) VALUES (8, N'CON000007', N'D5E95D4C-ECD1-49EA-AD69-82FC64032290')
SET IDENTITY_INSERT [dbo].[tblContactsOwner] OFF
INSERT [dbo].[tblOwners] ([OwnerID], [Name], [Address], [City], [PostalCode], [Country], [Website], [PrimaryContactPersonID], [BusinessPhone], [BusinessEmail], [VATid]) VALUES (N'619d0b74-331e-45f6-98b3-494935390aa1', N'CMA-CGM', N'Address of CMA-CGM', N'Marseille', N'45454 W 2323', N'France ', N'www.cma.com', N'CON000002', N'+33 43434 43434', N'email@cma.com', N'32323 dd 232323')
INSERT [dbo].[tblOwners] ([OwnerID], [Name], [Address], [City], [PostalCode], [Country], [Website], [PrimaryContactPersonID], [BusinessPhone], [BusinessEmail], [VATid]) VALUES (N'07a2396c-de4a-407d-a35c-4ce11650cc2e', N'Maersk', N'Address of Maersk', N'London', N'8990 A 2323', N'United Kingdom', N'www.maersk.com', N'CON000001', N'+44-32323 323 ', N'email@maersk.com', N'43434 V  3232')
INSERT [dbo].[tblOwners] ([OwnerID], [Name], [Address], [City], [PostalCode], [Country], [Website], [PrimaryContactPersonID], [BusinessPhone], [BusinessEmail], [VATid]) VALUES (N'd5e95d4c-ecd1-49ea-ad69-82fc64032290', N'Maersk Tankers', N'Address of Maersk Tankers', N'Singapore', N'2323232 3', N'Singapore', N'www.maersktankers.com', N'CON000003', N'+65 43434 34343', N'email@maersktankers.com', N'32332 ee2')
INSERT [dbo].[tblOwners] ([OwnerID], [Name], [Address], [City], [PostalCode], [Country], [Website], [PrimaryContactPersonID], [BusinessPhone], [BusinessEmail], [VATid]) VALUES (N'e0b62038-feed-466d-9d48-e76c3d5f5718', N'Carisbrooke Shipping', N'Address of Carisbrooke Shipping', N' Saint Peter Port', N'323 3 ', N'Guernsey', N'www.carisbrooke.com', N'CON000005', N'+44 3434343 43', N'email@carisbrooke.com ', N'2333 dd')
INSERT [dbo].[tblOwners] ([OwnerID], [Name], [Address], [City], [PostalCode], [Country], [Website], [PrimaryContactPersonID], [BusinessPhone], [BusinessEmail], [VATid]) VALUES (N'10e7c617-03bc-4410-874a-fc845c173294', N'Zodiac Marine Services', N'Address of Zodiac Marine Services', N'Cowes', N'3232 323 ', N'United Kingdom', N'www.zodiac.com', N'CON000004', N'+44 677888 6677', N'email@zodiac.com', N'43434 d 4343')
SET IDENTITY_INSERT [dbo].[tblOwnersVessels] ON 

INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (1, N'E0B62038-FEED-466D-9D48-E76C3D5F5718', N'9267297')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (2, N'D5E95D4C-ECD1-49EA-AD69-82FC64032290', N'9299446')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (3, N'D5E95D4C-ECD1-49EA-AD69-82FC64032290', N'9299434')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (4, N'619D0B74-331E-45F6-98B3-494935390AA1', N'9706308
')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (5, N'619D0B74-331E-45F6-98B3-494935390AA1', N'9299812')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (6, N'10E7C617-03BC-4410-874A-FC845C173294', N'7800100')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (7, N'07A2396C-DE4A-407D-A35C-4CE11650CC2E', N'9116199')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (8, N'07A2396C-DE4A-407D-A35C-4CE11650CC2E', N'9403621')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (9, N'07A2396C-DE4A-407D-A35C-4CE11650CC2E', N'9299434')
INSERT [dbo].[tblOwnersVessels] ([OW_RelationshipID], [OwnerID], [IMO]) VALUES (10, N'07A2396C-DE4A-407D-A35C-4CE11650CC2E', N'9299446')
SET IDENTITY_INSERT [dbo].[tblOwnersVessels] OFF
SET IDENTITY_INSERT [dbo].[tblPayments] ON 

INSERT [dbo].[tblPayments] ([PaymentRecordID], [OwnerID], [AccountIBANCode], [SWIFT], [BankName]) VALUES (1, N'619D0B74-331E-45F6-98B3-494935390AA1', N'FR7630006000011234567890189', N'IFFIFR21', N'ABN AMRO COMMERCIAL FINANCE
')
INSERT [dbo].[tblPayments] ([PaymentRecordID], [OwnerID], [AccountIBANCode], [SWIFT], [BankName]) VALUES (2, N'619D0B74-331E-45F6-98B3-494935390AA1', N'FR7630006000011234567890190', N'AGFBFRCC', N'ALLIANZ BANQUE')
INSERT [dbo].[tblPayments] ([PaymentRecordID], [OwnerID], [AccountIBANCode], [SWIFT], [BankName]) VALUES (3, N'07A2396C-DE4A-407D-A35C-4CE11650CC2E', N'GB33BUKB20201555555555', N'FTSBGB2L', N'ABN AMRO BANK N.V')
INSERT [dbo].[tblPayments] ([PaymentRecordID], [OwnerID], [AccountIBANCode], [SWIFT], [BankName]) VALUES (4, N'D5E95D4C-ECD1-49EA-AD69-82FC64032290', N'GB33BUKB20201555555556', N'BKENGB2L', N'BANK OF ENGLAND')
INSERT [dbo].[tblPayments] ([PaymentRecordID], [OwnerID], [AccountIBANCode], [SWIFT], [BankName]) VALUES (5, N'D5E95D4C-ECD1-49EA-AD69-82FC64032290', N'GB33BUKB20201555555558', N'FTSBGB2L', N'ABN AMRO BANK N.V')
INSERT [dbo].[tblPayments] ([PaymentRecordID], [OwnerID], [AccountIBANCode], [SWIFT], [BankName]) VALUES (6, N'E0B62038-FEED-466D-9D48-E76C3D5F5718', N'GB33BUKB20201555555559', N'CITTGB2L', N'CITIBANK EUROPE PLC')
INSERT [dbo].[tblPayments] ([PaymentRecordID], [OwnerID], [AccountIBANCode], [SWIFT], [BankName]) VALUES (7, N'10E7C617-03BC-4410-874A-FC845C173294', N'GB33BUKB20201555555566', N'CRESGGSP', N'CREDIT SUISSE(GUERNSEY) LTD')
SET IDENTITY_INSERT [dbo].[tblPayments] OFF
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (NULL, N'7800100', N'VINLANDIA', N'H8RO', N'Panama [PA]', N'Chemical Tanker', 2808, 3847, CAST(N'1979-05-13' AS Date), 0)
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (N'246141000', N'9116199', N'VANQUISH', N'PHCU', N'Netherlands [NL]', N'Container Ship', 2997, 4624, CAST(N'2018-01-11' AS Date), 1)
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (N'273437510', N'9267297', N'BERING', N'UBHR6', N'Russia [RU]', N'Cargo Ship', 7752, 10649, CAST(N'2003-01-16' AS Date), 1)
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (N'219124000', N'9299434', N'MAERSK BRISTOL', N'OXPT2', N'Denmark [DK]', N'Oil/Chemical Tanker', 19758, 29050, CAST(N'2005-12-11' AS Date), 1)
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (N'566503000', N'9299446', N'MAERSK BELFAST', N'9V6969', N'Singapore [SG]', N'Oil/Chemical Tanker', 19758, 29032, CAST(N'2005-03-09' AS Date), 1)
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (N'228348900', N'9299812', N' CMA CGM NORMA', N'FMHQ', N'France [FR]', N'Container Ship', 107711, 113909, CAST(N'2006-08-05' AS Date), 1)
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (N'636013456', N'9403621', N'APL NORWAY
', N'A8NC4', N'Liberia [LR]', N'Container Ship', 71867, 72807, CAST(N'2007-10-01' AS Date), 0)
INSERT [dbo].[tblVessels] ([MMSI], [IMO], [ShipName], [CallSign], [Flag], [VesselType], [GrossTonnage], [Deadweight], [DateBuilt], [IsActiveService]) VALUES (N'636016984', N'9706308
', N'CMA CGM AMAZON ', N'D5IS5', N'Liberia [LR]', N'Container Ship', 96424, 115590, CAST(N'2015-09-11' AS Date), 1)
ALTER TABLE [dbo].[tblOwners] ADD  CONSTRAINT [DF_tblOwners_OwnerID]  DEFAULT (newid()) FOR [OwnerID]
GO
/****** Object:  StoredProcedure [dbo].[AddOwner]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddOwner]
	             @name NVARCHAR(100),
				 @address NVARCHAR(200),
				 @city NVARCHAR(50),
				 @postalCode VARCHAR(50),
				 @country VARCHAR(50),
				 @website VARCHAR(100),
				 @primaryContactID VARCHAR(10),
				 @businessPhone VARCHAR(50),
				 @businessEmail VARCHAR(50),
				 @VATid VARCHAR(50)

AS
BEGIN
	 INSERT INTO [dbo].[tblOwners]
	 (
	   [Name],
	   [Address],
	   [City],
	   [PostalCode],
	   [Country],
	   [Website],
	   [PrimaryContactPersonID],
	   [BusinessPhone],
	   [BusinessEmail],
	   [VATid]
	 )
	 VALUES 
	 (
	   @name,
	   @address,
	   @city,
	   @postalCode,
	   @country,
	   @website,
	   @primaryContactID,
	   @businessPhone,
	   @businessEmail,
	   @VATid
	 )
END
GO
/****** Object:  StoredProcedure [dbo].[AddOwnerVesselRelationship]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddOwnerVesselRelationship]
	             @ownerID VARCHAR(50),
				 @imo VARCHAR(50)			 
AS
BEGIN
	 INSERT INTO [dbo].[tblOwnersVessels]
	 (
	  [OwnerID],
	  [IMO]
	 )
	 VALUES 
	 (
	   @ownerID,
	   @imo
	 )
END
GO
/****** Object:  StoredProcedure [dbo].[AddVessel]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddVessel]
	             @mmsi VARCHAR(50),
				 @imo VARCHAR(50),
				 @shipName VARCHAR(100),
				 @callSign VARCHAR(50),
				 @flag VARCHAR(100),
				 @vesselType VARCHAR(100),
				 @grossTonnage int,
				 @deadwight int,
				 @dateBuilt date,
				 @isActiveService bit
AS
BEGIN
	 INSERT INTO [dbo].[tblVessels]
	 (
	  [MMSI],
	  [IMO],
	  [ShipName],
	  [CallSign],
	  [Flag],
	  [VesselType],
	  [GrossTonnage],
	  [Deadweight],
	  [DateBuilt],
	  [IsActiveService]
	 )
	 VALUES 
	 (
	   @mmsi,
	   @imo,
	   @shipName,
	   @callSign,
	   @flag,
	   @vesselType,
	   @grossTonnage,
	   @deadwight,
	   @dateBuilt,
	   @isActiveService
	 )
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOwner]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOwner]
                 @ownerID varchar(50)	            
AS
BEGIN
	DELETE FROM [dbo].[tblOwners]
	WHERE [OwnerID]=@ownerID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOwnerVesselRelationship]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOwnerVesselRelationship]  
				 @imo VARCHAR(50),  --IMO Number is a unique numbers that describes a given vessel, hence it can be used as the unique identifier of a given vessel			
				 @ownerId VARCHAR(50)
AS
BEGIN
	DELETE FROM [dbo].[tblOwnersVessels]
	WHERE [IMO]=@imo AND [OwnerID]=@ownerId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteVessel]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteVessel]  
				 @imo VARCHAR(50)  --IMO Number is a unique numbers that describes a given vessel, hence it can be used as the unique identifier of a given vessel			
AS
BEGIN
	DELETE FROM [dbo].[tblVessels]
	WHERE [IMO]=@imo
END
GO
/****** Object:  StoredProcedure [dbo].[GetOwnerDetailByID]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOwnerDetailByID]
				@ownerID VARCHAR(100)

AS
BEGIN
	SELECT [OwnerID]
      ,[Name]
      ,[Address]
      ,[City]
      ,[PostalCode]
      ,[Country]
      ,[Website]
      ,[PrimaryContactPersonID]
      ,[BusinessPhone]
      ,[BusinessEmail]
      ,[VATid]
    FROM [dbFleetManagement].[dbo].[tblOwners]
	  WHERE [OwnerID]=@ownerID
END
GO
/****** Object:  StoredProcedure [dbo].[GetOwners]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOwners]
AS
BEGIN
	SELECT 
	    [Name],
		[OwnerID],
        [Address],
        [City],
        [PostalCode],
        [Country],
        [Website],
        [PrimaryContactPersonID],
        [BusinessPhone],
        [BusinessEmail],
        [VATid]
     FROM [dbFleetManagement].[dbo].[tblOwners]
END
GO
/****** Object:  StoredProcedure [dbo].[GetOwnerVesselRelationship]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOwnerVesselRelationship]
AS
BEGIN
	SELECT 
	   [OW_RelationshipID],
       [OwnerID],
       [IMO]
  FROM [dbFleetManagement].[dbo].[tblOwnersVessels]
END
GO
/****** Object:  StoredProcedure [dbo].[GetOwnerVesselsRelationshipByOwnerID]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOwnerVesselsRelationshipByOwnerID]
                 @ownerID VARCHAR(100)
AS
BEGIN
	SELECT 
	   [OW_RelationshipID]
      ,[OwnerID]
      ,[IMO]
     FROM [dbFleetManagement].[dbo].[tblOwnersVessels]
	   WHERE [OwnerID]=@ownerID
END
GO
/****** Object:  StoredProcedure [dbo].[GetOwnerVesselsRelationshipByVesselIMO]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOwnerVesselsRelationshipByVesselIMO]
                 @vesselID VARCHAR(50)
AS
BEGIN
	SELECT 
	   [OW_RelationshipID]
      ,[OwnerID]
      ,[IMO]
     FROM [dbFleetManagement].[dbo].[tblOwnersVessels]
	   WHERE [IMO]=@vesselID
END
GO
/****** Object:  StoredProcedure [dbo].[GetVesselDetailByIMO]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetVesselDetailByIMO]
				@vesselID VARCHAR(50)
AS
BEGIN
	SELECT [MMSI]
      ,[IMO]
      ,[ShipName]
      ,[CallSign]
      ,[Flag]
      ,[VesselType]
      ,[GrossTonnage]
      ,[Deadweight]
      ,[DateBuilt]
      ,[IsActiveService]
    FROM [dbFleetManagement].[dbo].[tblVessels]
	  WHERE [IMO]=@vesselID
END
GO
/****** Object:  StoredProcedure [dbo].[GetVessels]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetVessels]
AS
BEGIN
	SELECT 
		[ShipName],
	    [MMSI],
        [IMO],
        [CallSign],
        [Flag],
        [VesselType],
        [GrossTonnage],
        [Deadweight],
        [DateBuilt],
        [IsActiveService]
    FROM [dbFleetManagement].[dbo].[tblVessels]
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOwner]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOwner]
                 @ownerID varchar(50),
	             @name NVARCHAR(100),
				 @address NVARCHAR(200),
				 @city NVARCHAR(50),
				 @postalCode VARCHAR(50),
				 @country VARCHAR(50),
				 @website VARCHAR(100),
				 @primaryContactID VARCHAR(10),
				 @businessPhone VARCHAR(50),
				 @businessEmail VARCHAR(50),
				 @vatID VARCHAR(50)

AS
BEGIN
	UPDATE [dbo].[tblOwners]
	SET
		 [Name]=@name,
		 [Address]=@address,
		 [City]=@city,
		 [PostalCode]=@postalCode,
		 [Country]=@country,
		 [Website]=@website,
		 [PrimaryContactPersonID]=@primaryContactID,
		 [BusinessPhone]=@businessPhone,
		 [BusinessEmail]=@businessEmail,
		 [VATid]=@vatID
	WHERE [OwnerID]=@ownerID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateVessel]    Script Date: 09/08/2019 10:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateVessel]
                 @mmsi VARCHAR(50),
				 @imo VARCHAR(50),
				 @shipName VARCHAR(100),
				 @callSign VARCHAR(50),
				 @flag VARCHAR(100),
				 @vesselType VARCHAR(100),
				 @grossTonnage INT,
				 @deadweight INT,
				 @dateBuilt DATE,
				 @isActiveService BIT
AS
BEGIN
	UPDATE[dbo].[tblVessels]
	SET
		[MMSI]=@mmsi,
		[IMO]=@imo,
		[ShipName]=@shipName,
		[CallSign]=@callSign,
		[Flag]=@flag,
		[VesselType]=@vesselType,
		[GrossTonnage]=@grossTonnage,
		[Deadweight]=@deadweight,
		[DateBuilt]=@dateBuilt,
		[IsActiveService]=@isActiveService
	WHERE [IMO]=@imo
END
GO
USE [master]
GO
ALTER DATABASE [dbFleetManagement] SET  READ_WRITE 
GO
