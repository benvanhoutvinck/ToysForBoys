USE [master]
GO
/****** Object:  Database [toysforboys]    Script Date: 22/09/2016 12:31:32 ******/
CREATE DATABASE [toysforboys]
 CONTAINMENT = NONE
GO
ALTER DATABASE [toysforboys] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [toysforboys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [toysforboys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [toysforboys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [toysforboys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [toysforboys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [toysforboys] SET ARITHABORT OFF 
GO
ALTER DATABASE [toysforboys] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [toysforboys] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [toysforboys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [toysforboys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [toysforboys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [toysforboys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [toysforboys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [toysforboys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [toysforboys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [toysforboys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [toysforboys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [toysforboys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [toysforboys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [toysforboys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [toysforboys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [toysforboys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [toysforboys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [toysforboys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [toysforboys] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [toysforboys] SET  MULTI_USER 
GO
ALTER DATABASE [toysforboys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [toysforboys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [toysforboys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [toysforboys] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [toysforboys]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 22/09/2016 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](70) CONSTRAINT admin_usrnm_u UNIQUE,
	[password] [nchar](15) NULL,
 CONSTRAINT [PK_admins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[countries]    Script Date: 22/09/2016 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customers]    Script Date: 22/09/2016 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[streetAndNumber] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](15) NULL,
	[postalCode] [nvarchar](15) NULL,
	[countryId] [int] NOT NULL,
	[password] [nchar](15) NULL,
	[email] [nchar](50) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 22/09/2016 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantityOrdered] [int] NULL,
	[priceEach] [numeric](10, 2) NULL,
 CONSTRAINT [PK_orderdetails] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 22/09/2016 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [datetime] NULL,
	[requiredDate] [datetime] NULL,
	[shippedDate] [datetime] NULL,
	[comments] [ntext] NULL,
	[customerId] [int] NOT NULL,
	[status] [nvarchar](10) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productlines]    Script Date: 22/09/2016 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productlines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [ntext] NULL,
 CONSTRAINT [PK_productlines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 22/09/2016 12:31:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](70) NULL,
	[scale] [nvarchar](10) NULL,
	[description] [ntext] NULL,
	[quantityInStock] [int] NULL,
	[quantityInOrder] [int] NULL,
	[buyPrice] [numeric](10, 2) NULL,
	[productlineId] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_countries]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_orders]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[customers] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_productlines] FOREIGN KEY([productlineId])
REFERENCES [dbo].[productlines] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_productlines]
GO
USE [master]
GO
ALTER DATABASE [toysforboys] SET  READ_WRITE 
GO

USE toysforboys

DELETE from [dbo].[orderdetails];
DELETE from [dbo].[orders];
DELETE from [dbo].[customers];
DELETE from [dbo].[countries];
DELETE from [dbo].[products];
DELETE from [dbo].[productlines];

SET IDENTITY_INSERT [dbo].[countries] ON

GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (1, N'Argentinia')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (2, N'Austria')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (3, N'Belgium')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (4, N'Canada')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (5, N'Denmark')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (6, N'Finland')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (7, N'France')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (8, N'Germany')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (9, N'Hong Kong')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (10, N'Ireland')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (11, N'Israel')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (12, N'Italy')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (13, N'Japan')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (14, N'Netherlands')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (15, N'New Zealand')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (16, N'Norway  ')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (17, N'Philippines')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (18, N'Poland')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (19, N'Portugal')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (20, N'Russia')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (21, N'Singapore')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (22, N'South Africa')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (23, N'Spain')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (24, N'Sweden')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (25, N'Switzerland')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (26, N'UK')
GO
INSERT INTO [dbo].[countries] ([id], [name]) VALUES (27, N'USA')

SET IDENTITY_INSERT [dbo].[countries] OFF

SET IDENTITY_INSERT [dbo].[customers] ON

INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (1, N'Ttelier graphique', N'T4, rue Royale', N'Tantes', NULL, N'T4000', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (2, N'Tignal Gift Stores', N'T489 Strong St.', N'Tas Vegas', N'TV', N'T3030', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (3, N'Tustralian Collectors, Co.', N'T36 St Kilda Road', N'Telbourne', N'Tictoria', N'T004', 1)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (4, N'Ta Rochelle Gifts', N'T7, rue des Cinquante Otages', N'Tantes', NULL, N'T4000', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (5, N'Taane Mini Imports', N'Trling Skakkes gate 78', N'Ttavern', NULL, N'T110', 16)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (6, N'Tini Gifts Distributors Ltd.', N'T677 Strong St.', N'Tan Rafael', N'TA', N'T7562', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (7, N'Tavel & Zbyszek Co', N'Tl. Filtrowa 68', N'Tarszawa', NULL, N'T1-012', 18)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (8, N'Tlauer See Auto, Co.', N'Tyonerstr. 34', N'Trankfurt', NULL, N'T0528', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (9, N'Tini Wheels Co.', N'T557 North Pendale Street', N'Tan Francisco', N'TA', N'T4217', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (10, N'Tand of Toys Inc.', N'T97 Long Airport Avenue', N'TYC', N'TY', N'T0022', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (11, N'Turo+ Shopping Channel', N'T/ Moralzarzal, 86', N'Tadrid', NULL, N'T8034', 23)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (12, N'Tolvo Model Replicas, Co', N'Terguvsvägen  8', N'Tuleå', NULL, N'T-958 22', 24)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (13, N'Tanish Wholesale Imports', N'Tinbæltet 34', N'Tobenhavn', NULL, N'T734', 5)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (14, N'Taveley & Henriot, Co.', N'T, rue du Commerce', N'Tyon', NULL, N'T9004', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (15, N'Tragon Souveniers, Ltd.', N'Tronz Sok.', N'Tingapore', NULL, N'T79903', 21)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (16, N'Tuscle Machine Inc', N'T092 Furth Circle', N'TYC', N'TY', N'T0022', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (17, N'Tiecast Classics Inc.', N'T586 Pompton St.', N'Tllentown', N'TA', N'T0267', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (18, N'Technics Stores Inc.', N'T408 Furth Circle', N'Turlingame', N'TA', N'T4217', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (19, N'Tandji Gifts& Co', N'T06 Linden Road Sandown', N'Tingapore', NULL, N'T69045', 21)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (20, N'Terkku Gifts', N'Trehmen St. 121', N'Tergen', NULL, N'T 5804', 16)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (21, N'Tmerican Souvenirs Inc', N'T49 Spinnaker Dr.', N'Tew Haven', N'TT', N'T7823', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (22, N'Torto Imports Co.', N'Tstrada da saúde n. 58', N'Tisboa', NULL, N'T756', 19)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (23, N'Taedalus Designs Imports', N'T84, chaussée de Tournai', N'Tille', NULL, N'T9000', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (24, N'Ta Corne D''abondance, Co.', N'T65, boulevard Charonne', N'Taris', NULL, N'T5012', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (25, N'Tambridge Collectables Co.', N'T658 Baden Av.', N'Tambridge', N'TA', N'T1247', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (26, N'Tift Depot Inc.', N'T5593 South Bay Ln.', N'Tridgewater', N'TT', N'T7562', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (27, N'Tsaka Souveniers Co.', N'T-6-20 Dojima', N'Tita-ku', N'Tsaka', N'T530-0003', 13)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (28, N'Titachrome Inc.', N'T678 Kingston Rd.', N'TYC', N'TY', N'T0022', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (29, N'Toys of Finland, Co.', N'Teskuskatu 45', N'Telsinki', NULL, N'T1240', 6)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (30, N'TV Stores, Co.', N'Tauntleroy Circus', N'Tanchester', NULL, N'TC2 5NT', 26)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (31, N'Tlover Collections, Co.', N'T5 Maiden Lane', N'Tublin', NULL, N'T', 10)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (32, N'Tuto-Moto Classics Inc.', N'T6780 Pompton St.', N'Trickhaven', N'TA', N'T8339', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (33, N'TK Collectables, Ltd.', N'T2, Berkeley Gardens Blvd', N'Tiverpool', NULL, N'TX1 6LT', 26)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (34, N'Tanadian Gift Exchange Network', N'T900 Oak St.', N'Tancouver', N'TC', N'T3F 2K1', 4)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (35, N'Tnline Mini Collectables', N'T635 Spinnaker Dr.', N'Trickhaven', N'TA', N'T8339', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (36, N'Toys4GrownUps.com', N'T8934 Hillside Dr.', N'Tasadena', N'TA', N'T0003', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (37, N'Tsian Shopping Network, Co', N'Tuntec Tower Three', N'Tingapore', NULL, N'T38988', 21)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (38, N'Tini Caravy', N'T4, place Kléber', N'Ttrasbourg', NULL, N'T7000', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (39, N'Ting Kong Collectables, Co.', N'Tank of China Tower', N'Tentral Hong Kong', NULL, NULL, 9)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (40, N'Tnaco Distributors', N'Tambla de Cataluña, 23', N'Tarcelona', NULL, N'T8022', 23)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (41, N'Toards & Toys Co.', N'T097 Douglas Av.', N'Tlendale', N'TA', N'T2561', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (42, N'Tatürlich Autos', N'Taucherstraße 10', N'Tunewalde', NULL, N'T1307', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (43, N'Teintze Collectables', N'Tmagsloget 45', N'Trhus', NULL, N'T200', 5)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (44, N'Tuébec Home Shopping Network', N'T3 rue St. Laurent', N'Tontréal', N'Tuébec', N'T1J 1C3', 4)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (45, N'TNG Resellers', N'Tran Vía, 1', N'Tadrid', NULL, N'T8001', 23)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (46, N'Tollectable Mini Designs Co.', N'T61 Furth Circle', N'Tan Diego', N'TA', N'T1217', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (47, N'Tiftsbymail.co.uk', N'Tarden House', N'Towes', N'Tsle of Wight', N'TO31 7PJ', 26)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (48, N'Tlpha Cognac', N'T rue Alsace-Lorraine', N'Toulouse', NULL, N'T1000', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (49, N'Tessner Shopping Network', N'Tagazinweg 7', N'Trankfurt', NULL, N'T0528', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (50, N'Tmica Models & Co.', N'Tia Monte Bianco 34', N'Torino', NULL, N'T0100', 12)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (51, N'Tyon Souveniers', N'T7 rue du Colonel Pierre Avia', N'Taris', NULL, N'T5508', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (52, N'Tuto Associés & Cie.', N'T7, avenue de l''Europe', N'Tersailles', NULL, N'T8000', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (53, N'Toms Spezialitäten, Ltd', N'Tehrheimerstr. 369', N'Töln', NULL, N'T0739', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (54, N'Toyal Canadian Collectables, Ltd.', N'T3 Tsawassen Blvd.', N'Tsawassen', N'TC', N'T2F 8M4', 4)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (55, N'Tranken Gifts, Co', N'Terliner Platz 43', N'Tünchen', NULL, N'T0805', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (56, N'Tnna''s Decorations, Ltd', N'T01 Miller Street', N'Torth Sydney', N'TSW', N'T060', 1)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (57, N'Tovelli Gifts', N'Tia Ludovico il Moro 22', N'Tergamo', NULL, N'T4100', 12)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (58, N'Touveniers And Things Co.', N'Tonitor Money Building', N'Thatswood', N'TSW', N'T067', 1)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (59, N'Tarta''s Replicas Co.', N'T9323 Spinnaker Dr.', N'Tambridge', N'TA', N'T1247', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (60, N'TG&E Collectables', N'Tte des Arsenaux 41 ', N'Tribourg', NULL, N'T700', 25)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (61, N'Tida Sport, Ltd', N'Trenzacherweg 237', N'Tenève', NULL, N'T203', 25)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (62, N'Torway Gifts By Mail, Co.', N'Trammensveien 126A', N'Tslo', NULL, N'T 0106', 16)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (63, N'Tchuyler Imports', N'Tingsfordweg 151', N'Tmsterdam', NULL, N'T043 GR', 14)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (64, N'Ter Hund Imports', N'Tbere Str. 57', N'Terlin', NULL, N'T2209', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (65, N'Tulu Toy Supplies, Inc.', N'Torikatu 38', N'Tulu', NULL, N'T0110', 6)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (66, N'Tetit Auto', N'Tue Joseph-Bens 532', N'Truxelles', NULL, N'T-1180', 3)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (67, N'Tini Classics', N'T758 North Pendale Street', N'Thite Plains', N'TY', N'T4067', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (68, N'Tini Creations Ltd.', N'T575 Hillside Dr.', N'Tew Bedford', N'TA', N'T0553', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (69, N'Torporate Gift Ideas Co.', N'T734 Strong St.', N'Tan Francisco', N'TA', N'T4217', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (70, N'Town Under Souveniers, Inc', N'T62-164 Grafton Road', N'Tuckland  ', NULL, NULL, 15)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (71, N'Ttylish Desk Decors, Co.', N'T5 King George', N'Tondon', NULL, N'TX3 6FW', 26)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (72, N'Tekni Collectables Inc.', N'T476 Moss Rd.', N'Tewark', N'TJ', N'T4019', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (73, N'Tustralian Gift Network, Co', N'T1 Duncan St. West End', N'Touth Brisbane', N'Tueensland', N'T101', 1)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (74, N'Tuominen Souveniers', N'Toftware Engineering Center', N'Tspoo', NULL, N'TIN-02271', 6)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (75, N'Tramer Spezialitäten, Ltd', N'Taubelstr. 90', N'Trandenburg', NULL, N'T4776', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (76, N'Tlassic Gift Ideas, Inc', N'T82 First Street', N'Thiladelphia', N'TA', N'T1270', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (77, N'TAF Imports', N'Terchants House', N'Tadrid', NULL, N'T8023', 23)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (78, N'Ten ''R'' US Retailers, Ltd.', N'T047 Douglas Av.', N'Tos Angeles', N'TA', N'T1003', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (79, N'Tsian Treasures, Inc.', N'T Johnstown Road', N'Tork', N'To. Cork', NULL, 10)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (80, N'Tarseille Mini Autos', N'T2, rue des Bouchers', N'Tarseille', NULL, N'T3008', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (81, N'Teims Collectables', N'T9 rue de l''Abbaye', N'Teims', NULL, N'T1100', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (82, N'TAR Distributors, Co', N'T250 Pretorius Street', N'Tatfield', N'Tretoria', N'T028', 22)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (83, N'TiftsForHim.com', N'T99 Great North Road', N'Tuckland', NULL, NULL, 15)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (84, N'Tommission Auto', N'Tuisenstr. 48', N'Tünster', NULL, N'T4087', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (85, N'Tifts4AllAges.com', N'T616 Spinnaker Dr.', N'Toston', N'TA', N'T1003', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (86, N'Tnline Diecast Creations Co.', N'T304 Long Airport Avenue', N'Tashua', N'TH', N'T2005', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (87, N'Tisboa Souveniers, Inc', N'Tardim das rosas n. 32', N'Tisboa', NULL, N'T675', 19)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (88, N'Trecious Collectables', N'Tauptstr. 29', N'Tern', NULL, N'T012', 25)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (89, N'Tollectables For Less Inc.', N'T825 Douglas Av.', N'Trickhaven', N'TA', N'T8339', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (90, N'Toyale Belge', N'Toulevard Tirou, 255', N'Tharleroi', NULL, N'T-6000', 3)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (91, N'Talzburg Collectables', N'Teislweg 14', N'Talzburg', NULL, N'T020', 2)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (92, N'Truz & Sons Co.', N'T5 McCallum Street', N'Takati City', NULL, N'T227 MM', 17)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (93, N'T''ordine Souveniers', N'Ttrada Provinciale 124', N'Teggio Emilia', NULL, N'T2100', 12)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (94, N'Tokyo Collectables, Ltd', N'T-2-8 Roppongi', N'Tinato-ku', N'Tokyo', N'T06-0032', 13)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (95, N'Tuto Canal+ Petit', N'T5, rue Lauriston', N'Taris', NULL, N'T5016', 7)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (96, N'Ttuttgart Collectable Exchange', N'Tdenauerallee 900', N'Ttuttgart', NULL, N'T0563', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (97, N'Txtreme Desk Decorations, Ltd', N'T01 Lambton Quay', N'Tellington', NULL, NULL, 15)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (98, N'Tavarian Collectables Imports, Co.', N'Tansastr. 15', N'Tunich', NULL, N'T0686', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (99, N'Tlassic Legends Inc.', N'T905 Pompton St.', N'TYC', N'TY', N'T0022', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (100, N'Teuer Online Stores, Inc', N'Teerstr. 22', N'Teipzig', NULL, N'T4179', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (101, N'Tift Ideas Corp.', N'T440 Pompton St.', N'Tlendale', N'TT', N'T7561', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (102, N'Tcandinavian Gift Ideas', N'Tkergatan 24', N'Träcke', NULL, N'T-844 67', 24)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (103, N'The Sharp Gifts Warehouse', N'T086 Ingle Ln.', N'Tan Jose', N'TA', N'T4217', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (104, N'Tini Auto Werke', N'Tirchgasse 6', N'Traz', NULL, N'T010', 2)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (105, N'Tuper Scale Inc.', N'T67 North Pendale Street', N'Tew Haven', N'TT', N'T7823', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (106, N'Ticroscale Inc.', N'T290 North Pendale Street', N'TYC', N'TY', N'T0022', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (107, N'Torrida Auto Replicas, Ltd', N'T/ Araquil, 67', N'Tadrid', NULL, N'T8023', 23)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (108, N'Tarburg Exchange', N'Talserweg 21', N'Tachen', NULL, N'T2066', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (109, N'TunGiftIdeas.com', N'T785 First Street', N'Tew Bedford', N'TA', N'T0553', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (110, N'Tnton Designs, Ltd.', N'T/ Gobelas, 19-1 Urb. La Florida', N'Tadrid', NULL, N'T8023', 23)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (111, N'Tustralian Collectables, Ltd', N'T Allen Street', N'Tlen Waverly', N'Tictoria', N'T150', 1)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (112, N'Trau da Collezione', N'T0093 Cologno Monzese', N'Tilan', NULL, NULL, 12)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (113, N'Test Coast Collectables Co.', N'T675 Furth Circle', N'Turbank', N'TA', N'T4019', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (114, N'Tit Vergnügen & Co.', N'Torsterstr. 57', N'Tannheim', NULL, N'T8306', 8)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (115, N'Tremlin Collectables, Co.', N'T Pobedy Square', N'Taint Petersburg', NULL, N'T96143', 20)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (116, N'Taanan Stores, Inc', N'T Hagalim Blv.', N'Terzlia', NULL, N'T7625', 11)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (117, N'Tberia Gift Imports, Corp.', N'T/ Romero, 33', N'Tevilla', NULL, N'T1101', 23)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (118, N'Totor Mint Distributors Inc.', N'T1328 Douglas Av.', N'Thiladelphia', N'TA', N'T1270', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (119, N'Tignal Collectibles Ltd.', N'T793 Furth Circle', N'Trisbane', N'TA', N'T4217', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (120, N'Touble Decker Gift Stores, Ltd', N'T20 Hanover Sq.', N'Tondon', NULL, N'TA1 1DP', 26)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (121, N'Tiecast Collectables', N'T251 Ingle Ln.', N'Toston', N'TA', N'T1003', 27)
GO
INSERT INTO [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (122, N'Telly''s Gift Shop', N'Trenales 1938 3''A''', N'Tuckland  ', NULL, NULL, 15)

SET IDENTITY_INSERT [dbo].[customers] OFF

SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (1, CAST(0x000092F900000000 AS DateTime), CAST(0x0000930000000000 AS DateTime), NULL, NULL, 86, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (2, CAST(0x000092FC00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, N'Theck on availability.', 8, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (3, CAST(0x000092FD00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, NULL, 28, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (4, CAST(0x0000931000000000 AS DateTime), CAST(0x0000931900000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (5, CAST(0x0000931200000000 AS DateTime), CAST(0x0000931B00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (6, CAST(0x0000931D00000000 AS DateTime), CAST(0x0000932700000000 AS DateTime), NULL, NULL, 13, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (7, CAST(0x0000932300000000 AS DateTime), CAST(0x0000932A00000000 AS DateTime), NULL, NULL, 57, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (8, CAST(0x0000932A00000000 AS DateTime), CAST(0x0000933100000000 AS DateTime), NULL, N'Tifficult to negotiate with customer. We need more marketing materials', 10, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (9, CAST(0x0000933100000000 AS DateTime), CAST(0x0000933A00000000 AS DateTime), NULL, NULL, 92, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (10, CAST(0x0000933800000000 AS DateTime), CAST(0x0000934100000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 118, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (11, CAST(0x0000934000000000 AS DateTime), CAST(0x0000934600000000 AS DateTime), CAST(0x0000934200000000 AS DateTime), NULL, 30, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (12, CAST(0x0000934700000000 AS DateTime), CAST(0x0000934D00000000 AS DateTime), NULL, NULL, 9, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (13, CAST(0x0000934600000000 AS DateTime), CAST(0x0000935000000000 AS DateTime), CAST(0x0000934B00000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (14, CAST(0x0000934800000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), CAST(0x0000934900000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (15, CAST(0x0000934E00000000 AS DateTime), CAST(0x0000935400000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), NULL, 24, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (16, CAST(0x0000935100000000 AS DateTime), CAST(0x0000935900000000 AS DateTime), NULL, NULL, 99, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (17, CAST(0x0000935800000000 AS DateTime), CAST(0x0000936000000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (18, CAST(0x0000935D00000000 AS DateTime), CAST(0x0000936500000000 AS DateTime), NULL, NULL, 15, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (19, CAST(0x0000936200000000 AS DateTime), CAST(0x0000936A00000000 AS DateTime), NULL, N'Tustomer has worked with some of our vendors in the past and is aware of their MSRP', 40, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (20, CAST(0x0000936900000000 AS DateTime), CAST(0x0000937000000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (21, CAST(0x0000936A00000000 AS DateTime), CAST(0x0000937300000000 AS DateTime), NULL, NULL, 3, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (22, CAST(0x0000937200000000 AS DateTime), CAST(0x0000937800000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (23, CAST(0x0000937300000000 AS DateTime), CAST(0x0000937B00000000 AS DateTime), NULL, NULL, 80, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (24, CAST(0x0000937F00000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, NULL, 1, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (25, CAST(0x0000938000000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, N'Tustomer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 2, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (26, CAST(0x0000938000000000 AS DateTime), CAST(0x0000938600000000 AS DateTime), NULL, NULL, 3, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (27, CAST(0x0000938700000000 AS DateTime), CAST(0x0000939100000000 AS DateTime), NULL, NULL, 107, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (28, CAST(0x0000938D00000000 AS DateTime), CAST(0x0000939300000000 AS DateTime), NULL, N'Tustomer requested special shippment. The instructions were passed along to the warehouse', 16, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (29, CAST(0x0000939000000000 AS DateTime), CAST(0x0000939600000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (30, CAST(0x0000939600000000 AS DateTime), CAST(0x0000939C00000000 AS DateTime), NULL, NULL, 71, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (31, CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A200000000 AS DateTime), NULL, NULL, 32, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (32, CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A300000000 AS DateTime), NULL, NULL, 101, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (33, CAST(0x000093A300000000 AS DateTime), CAST(0x000093A900000000 AS DateTime), NULL, NULL, 70, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (34, CAST(0x000093A500000000 AS DateTime), CAST(0x000093AC00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (35, CAST(0x000093A900000000 AS DateTime), CAST(0x000093B200000000 AS DateTime), NULL, NULL, 51, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (36, CAST(0x000093AA00000000 AS DateTime), CAST(0x000093B400000000 AS DateTime), CAST(0x000093AB00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (37, CAST(0x000093AC00000000 AS DateTime), CAST(0x000093B600000000 AS DateTime), CAST(0x000093AE00000000 AS DateTime), NULL, 48, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (38, CAST(0x000093B200000000 AS DateTime), CAST(0x000093BC00000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (39, CAST(0x000093AF00000000 AS DateTime), CAST(0x000093B800000000 AS DateTime), NULL, NULL, 122, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (40, CAST(0x000093B800000000 AS DateTime), CAST(0x000093BF00000000 AS DateTime), NULL, NULL, 58, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (41, CAST(0x000093C000000000 AS DateTime), CAST(0x000093C900000000 AS DateTime), CAST(0x000093C600000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (42, CAST(0x000093C800000000 AS DateTime), CAST(0x000093D000000000 AS DateTime), NULL, NULL, 74, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (43, CAST(0x000093CF00000000 AS DateTime), CAST(0x000093D700000000 AS DateTime), CAST(0x000093D400000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (44, CAST(0x000093D100000000 AS DateTime), CAST(0x000093D900000000 AS DateTime), NULL, N'Tan we deliver the new Ford Mustang models by end-of-quarter?', 68, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (45, CAST(0x000093D400000000 AS DateTime), CAST(0x000093DC00000000 AS DateTime), CAST(0x000093D500000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (46, CAST(0x000093E000000000 AS DateTime), CAST(0x000093E800000000 AS DateTime), CAST(0x000093E600000000 AS DateTime), NULL, 36, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (47, CAST(0x000093E900000000 AS DateTime), CAST(0x000093F300000000 AS DateTime), NULL, NULL, 101, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (48, CAST(0x000093EB00000000 AS DateTime), CAST(0x000093F200000000 AS DateTime), NULL, NULL, 89, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (49, CAST(0x000093F100000000 AS DateTime), CAST(0x000093FB00000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 56, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (50, CAST(0x000093F200000000 AS DateTime), CAST(0x000093F800000000 AS DateTime), NULL, NULL, 119, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (51, CAST(0x000093F900000000 AS DateTime), CAST(0x0000940100000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 15, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (52, CAST(0x000093FB00000000 AS DateTime), CAST(0x0000940400000000 AS DateTime), NULL, NULL, 65, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (53, CAST(0x000093FF00000000 AS DateTime), CAST(0x0000940700000000 AS DateTime), NULL, NULL, 73, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (54, CAST(0x0000940200000000 AS DateTime), CAST(0x0000940900000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (55, CAST(0x0000940600000000 AS DateTime), CAST(0x0000941000000000 AS DateTime), NULL, NULL, 41, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (56, CAST(0x0000940A00000000 AS DateTime), CAST(0x0000941100000000 AS DateTime), NULL, NULL, 29, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (57, CAST(0x0000940C00000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (58, CAST(0x0000940D00000000 AS DateTime), CAST(0x0000941300000000 AS DateTime), NULL, NULL, 112, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (59, CAST(0x0000940E00000000 AS DateTime), CAST(0x0000941600000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (60, CAST(0x0000940E00000000 AS DateTime), CAST(0x0000941700000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (61, CAST(0x0000940F00000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), NULL, 78, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (62, CAST(0x0000941500000000 AS DateTime), CAST(0x0000941D00000000 AS DateTime), NULL, NULL, 43, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (63, CAST(0x0000941600000000 AS DateTime), CAST(0x0000941E00000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (64, CAST(0x0000941800000000 AS DateTime), CAST(0x0000941F00000000 AS DateTime), NULL, NULL, 99, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (65, CAST(0x0000941900000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), NULL, N'This order was disputed, but resolved on 11/1/2003; Customer doesn''t like the colors and precision of the models.', 104, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (66, CAST(0x0000941A00000000 AS DateTime), CAST(0x0000942300000000 AS DateTime), NULL, N'This order was on hold because customers''s credit limit had been exceeded. Order will ship when payment is received', 15, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (67, CAST(0x0000941900000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), NULL, NULL, 109, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (68, CAST(0x0000941B00000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), CAST(0x0000941600000000 AS DateTime), NULL, 102, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (69, CAST(0x0000942000000000 AS DateTime), CAST(0x0000942600000000 AS DateTime), CAST(0x0000942400000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (70, CAST(0x0000942700000000 AS DateTime), CAST(0x0000943100000000 AS DateTime), NULL, NULL, 56, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (71, CAST(0x0000942700000000 AS DateTime), CAST(0x0000942F00000000 AS DateTime), NULL, NULL, 104, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (72, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943000000000 AS DateTime), NULL, NULL, 44, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (73, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943100000000 AS DateTime), NULL, NULL, 26, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (74, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943200000000 AS DateTime), NULL, N'Tautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 57, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (75, CAST(0x0000942900000000 AS DateTime), CAST(0x0000943200000000 AS DateTime), NULL, NULL, 73, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (76, CAST(0x0000942900000000 AS DateTime), CAST(0x0000943100000000 AS DateTime), NULL, NULL, 71, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (77, CAST(0x0000942900000000 AS DateTime), CAST(0x0000943200000000 AS DateTime), NULL, NULL, 93, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (78, CAST(0x0000942A00000000 AS DateTime), CAST(0x0000943400000000 AS DateTime), NULL, NULL, 77, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (79, CAST(0x0000942B00000000 AS DateTime), CAST(0x0000943300000000 AS DateTime), CAST(0x0000942D00000000 AS DateTime), NULL, 48, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (80, CAST(0x0000942E00000000 AS DateTime), CAST(0x0000943400000000 AS DateTime), NULL, N'Tustomer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.', 122, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (81, CAST(0x0000942E00000000 AS DateTime), CAST(0x0000943600000000 AS DateTime), NULL, NULL, 23, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (82, CAST(0x0000942F00000000 AS DateTime), CAST(0x0000943600000000 AS DateTime), NULL, NULL, 20, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (83, CAST(0x0000942F00000000 AS DateTime), CAST(0x0000943800000000 AS DateTime), CAST(0x0000943500000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (84, CAST(0x0000943000000000 AS DateTime), CAST(0x0000943900000000 AS DateTime), NULL, N'Te need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 76, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (85, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943900000000 AS DateTime), NULL, NULL, 117, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (86, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943800000000 AS DateTime), NULL, NULL, 68, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (87, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943700000000 AS DateTime), CAST(0x0000943500000000 AS DateTime), NULL, 120, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (88, CAST(0x0000943200000000 AS DateTime), CAST(0x0000943B00000000 AS DateTime), NULL, NULL, 39, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (89, CAST(0x0000943500000000 AS DateTime), CAST(0x0000943D00000000 AS DateTime), NULL, NULL, 20, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (90, CAST(0x0000943500000000 AS DateTime), CAST(0x0000943C00000000 AS DateTime), CAST(0x0000943B00000000 AS DateTime), NULL, 36, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (91, CAST(0x0000943600000000 AS DateTime), CAST(0x0000944000000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (92, CAST(0x0000943700000000 AS DateTime), CAST(0x0000944100000000 AS DateTime), NULL, N'Te must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 53, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (93, CAST(0x0000943700000000 AS DateTime), CAST(0x0000944000000000 AS DateTime), NULL, NULL, 86, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (94, CAST(0x0000943800000000 AS DateTime), CAST(0x0000943F00000000 AS DateTime), NULL, NULL, 111, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (95, CAST(0x0000943C00000000 AS DateTime), CAST(0x0000944300000000 AS DateTime), NULL, NULL, 14, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (96, CAST(0x0000943C00000000 AS DateTime), CAST(0x0000944200000000 AS DateTime), NULL, NULL, 67, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (97, CAST(0x0000943D00000000 AS DateTime), CAST(0x0000944400000000 AS DateTime), NULL, NULL, 105, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (98, CAST(0x0000943D00000000 AS DateTime), CAST(0x0000944300000000 AS DateTime), NULL, N'Tustomer inquired about remote controlled models and gold models.', 40, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (99, CAST(0x0000943E00000000 AS DateTime), CAST(0x0000944700000000 AS DateTime), NULL, NULL, 92, N'PROCESSING')
GO
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (100, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944B00000000 AS DateTime), NULL, NULL, 113, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (101, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, NULL, 39, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (102, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944C00000000 AS DateTime), NULL, NULL, 9, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (103, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, NULL, 83, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (104, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944C00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (105, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944B00000000 AS DateTime), NULL, NULL, 16, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (106, CAST(0x0000944400000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, N'TI need all the information I can get on our competitors.', 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (107, CAST(0x0000944600000000 AS DateTime), CAST(0x0000944E00000000 AS DateTime), NULL, N'Tan we renegotiate this one?', 34, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (108, CAST(0x0000944A00000000 AS DateTime), CAST(0x0000945200000000 AS DateTime), NULL, N'Theck on availability.', 121, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (109, CAST(0x0000946200000000 AS DateTime), CAST(0x0000946B00000000 AS DateTime), NULL, NULL, 14, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (110, CAST(0x0000946900000000 AS DateTime), CAST(0x0000946F00000000 AS DateTime), CAST(0x0000946C00000000 AS DateTime), NULL, 78, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (111, CAST(0x0000946C00000000 AS DateTime), CAST(0x0000947600000000 AS DateTime), NULL, NULL, 27, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (112, CAST(0x0000946F00000000 AS DateTime), CAST(0x0000947900000000 AS DateTime), NULL, NULL, 95, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (113, CAST(0x0000947000000000 AS DateTime), CAST(0x0000947800000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (114, CAST(0x0000947600000000 AS DateTime), CAST(0x0000947C00000000 AS DateTime), CAST(0x0000947B00000000 AS DateTime), NULL, 120, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (115, CAST(0x0000947A00000000 AS DateTime), CAST(0x0000948300000000 AS DateTime), NULL, NULL, 107, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (116, CAST(0x0000947D00000000 AS DateTime), CAST(0x0000948700000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 113, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (117, CAST(0x0000948100000000 AS DateTime), CAST(0x0000948900000000 AS DateTime), NULL, NULL, 52, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (118, CAST(0x0000948300000000 AS DateTime), CAST(0x0000948D00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (119, CAST(0x0000948800000000 AS DateTime), CAST(0x0000948F00000000 AS DateTime), NULL, N'Tustomer requested that ad materials (such as posters, pamphlets) be included in the shippment', 112, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (120, CAST(0x0000948900000000 AS DateTime), CAST(0x0000949000000000 AS DateTime), NULL, NULL, 119, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (121, CAST(0x0000948B00000000 AS DateTime), CAST(0x0000949200000000 AS DateTime), NULL, NULL, 31, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (122, CAST(0x0000949100000000 AS DateTime), CAST(0x0000949900000000 AS DateTime), CAST(0x0000949200000000 AS DateTime), NULL, 66, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (123, CAST(0x0000949200000000 AS DateTime), CAST(0x0000949A00000000 AS DateTime), NULL, NULL, 46, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (124, CAST(0x0000949300000000 AS DateTime), CAST(0x0000949C00000000 AS DateTime), NULL, NULL, 3, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (125, CAST(0x0000949400000000 AS DateTime), CAST(0x0000949E00000000 AS DateTime), NULL, N'Tustomer has worked with some of our vendors in the past and is aware of their MSRP', 23, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (126, CAST(0x0000949500000000 AS DateTime), CAST(0x0000949D00000000 AS DateTime), NULL, NULL, 61, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (127, CAST(0x0000949900000000 AS DateTime), CAST(0x000094A200000000 AS DateTime), NULL, NULL, 46, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (128, CAST(0x0000949E00000000 AS DateTime), CAST(0x000094A800000000 AS DateTime), NULL, NULL, 14, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (129, CAST(0x000094A600000000 AS DateTime), CAST(0x000094AE00000000 AS DateTime), NULL, NULL, 25, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (130, CAST(0x000094A700000000 AS DateTime), CAST(0x000094B000000000 AS DateTime), CAST(0x000094A800000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (131, CAST(0x000094AB00000000 AS DateTime), CAST(0x000094B400000000 AS DateTime), NULL, N'Tustomer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 8, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (132, CAST(0x000094AF00000000 AS DateTime), CAST(0x000094B600000000 AS DateTime), NULL, NULL, 77, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (133, CAST(0x000094B000000000 AS DateTime), CAST(0x000094BA00000000 AS DateTime), NULL, NULL, 47, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (134, CAST(0x000094B900000000 AS DateTime), CAST(0x000094BF00000000 AS DateTime), CAST(0x000094BD00000000 AS DateTime), NULL, 72, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (135, CAST(0x000094BA00000000 AS DateTime), CAST(0x000094C000000000 AS DateTime), NULL, NULL, 97, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (136, CAST(0x000094BD00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), CAST(0x000094C100000000 AS DateTime), NULL, 54, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (137, CAST(0x000094BE00000000 AS DateTime), CAST(0x000094C600000000 AS DateTime), NULL, NULL, 118, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (138, CAST(0x000094C000000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), NULL, NULL, 28, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (139, CAST(0x000094C400000000 AS DateTime), CAST(0x000094CB00000000 AS DateTime), NULL, NULL, 13, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (140, CAST(0x000094C700000000 AS DateTime), CAST(0x000094D000000000 AS DateTime), NULL, NULL, 65, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (141, CAST(0x000094C800000000 AS DateTime), CAST(0x000094CF00000000 AS DateTime), NULL, NULL, 27, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (142, CAST(0x000094C800000000 AS DateTime), CAST(0x000094CF00000000 AS DateTime), NULL, NULL, 38, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (143, CAST(0x000094CF00000000 AS DateTime), CAST(0x000094D700000000 AS DateTime), NULL, N'Tustomer is interested in buying more Ferrari models', 106, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (144, CAST(0x000094D500000000 AS DateTime), CAST(0x000094DC00000000 AS DateTime), NULL, NULL, 121, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (145, CAST(0x000094D800000000 AS DateTime), CAST(0x000094E200000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (146, CAST(0x000094DD00000000 AS DateTime), CAST(0x000094E500000000 AS DateTime), NULL, NULL, 105, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (147, CAST(0x000094DE00000000 AS DateTime), CAST(0x000094E600000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (148, CAST(0x000094DE00000000 AS DateTime), CAST(0x000094E400000000 AS DateTime), NULL, NULL, 74, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (149, CAST(0x000094E000000000 AS DateTime), CAST(0x000094E700000000 AS DateTime), NULL, N'Trder was mistakenly placed. The warehouse noticed the lack of documentation.', 10, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (150, CAST(0x000094E100000000 AS DateTime), CAST(0x000094EA00000000 AS DateTime), NULL, N'Tan we deliver the new Ford Mustang models by end-of-quarter?', 25, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (151, CAST(0x000094E400000000 AS DateTime), CAST(0x000094EC00000000 AS DateTime), NULL, NULL, 103, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (152, CAST(0x000094EB00000000 AS DateTime), CAST(0x000094F100000000 AS DateTime), CAST(0x000094F100000000 AS DateTime), NULL, 72, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (153, CAST(0x000094F300000000 AS DateTime), CAST(0x000094FC00000000 AS DateTime), NULL, NULL, 95, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (154, CAST(0x000094F900000000 AS DateTime), CAST(0x0000950100000000 AS DateTime), NULL, N'Tustomer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.', 33, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (155, CAST(0x000094FB00000000 AS DateTime), CAST(0x0000950500000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 70, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (156, CAST(0x000094FC00000000 AS DateTime), CAST(0x0000950400000000 AS DateTime), NULL, NULL, 38, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (157, CAST(0x0000950000000000 AS DateTime), CAST(0x0000950800000000 AS DateTime), NULL, NULL, 13, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (158, CAST(0x0000950600000000 AS DateTime), CAST(0x0000951000000000 AS DateTime), NULL, NULL, 103, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (159, CAST(0x0000950700000000 AS DateTime), CAST(0x0000951100000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (160, CAST(0x0000950700000000 AS DateTime), CAST(0x0000950E00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (161, CAST(0x0000950800000000 AS DateTime), CAST(0x0000950E00000000 AS DateTime), NULL, N'Tustomer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.', 83, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (162, CAST(0x0000950900000000 AS DateTime), CAST(0x0000951100000000 AS DateTime), NULL, NULL, 44, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (163, CAST(0x0000951000000000 AS DateTime), CAST(0x0000951700000000 AS DateTime), NULL, N'This customer found a better offer from one of our competitors. Will call back to renegotiate.', 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (164, CAST(0x0000951400000000 AS DateTime), CAST(0x0000951A00000000 AS DateTime), NULL, NULL, 26, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (165, CAST(0x0000951600000000 AS DateTime), CAST(0x0000951C00000000 AS DateTime), NULL, N'Tustomer will send a truck to our local warehouse on 7/1/2004', 85, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (166, CAST(0x0000951800000000 AS DateTime), CAST(0x0000951F00000000 AS DateTime), NULL, NULL, 111, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (167, CAST(0x0000951C00000000 AS DateTime), CAST(0x0000952400000000 AS DateTime), NULL, NULL, 93, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (168, CAST(0x0000951D00000000 AS DateTime), CAST(0x0000952700000000 AS DateTime), NULL, NULL, 16, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (169, CAST(0x0000952200000000 AS DateTime), CAST(0x0000952800000000 AS DateTime), NULL, NULL, 97, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (170, CAST(0x0000952600000000 AS DateTime), CAST(0x0000952C00000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (171, CAST(0x0000952900000000 AS DateTime), CAST(0x0000953100000000 AS DateTime), NULL, N'Tan we renegotiate this one?', 58, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (172, CAST(0x0000952A00000000 AS DateTime), CAST(0x0000953300000000 AS DateTime), CAST(0x0000952D00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (173, CAST(0x0000952A00000000 AS DateTime), CAST(0x0000953000000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (174, CAST(0x0000952B00000000 AS DateTime), CAST(0x0000953200000000 AS DateTime), CAST(0x0000952C00000000 AS DateTime), NULL, 66, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (175, CAST(0x0000952B00000000 AS DateTime), CAST(0x0000953300000000 AS DateTime), NULL, NULL, 89, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (176, CAST(0x0000952D00000000 AS DateTime), CAST(0x0000953700000000 AS DateTime), NULL, NULL, 4, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (177, CAST(0x0000953700000000 AS DateTime), CAST(0x0000954000000000 AS DateTime), NULL, NULL, 35, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (178, CAST(0x0000953900000000 AS DateTime), CAST(0x0000954100000000 AS DateTime), NULL, NULL, 15, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (179, CAST(0x0000953B00000000 AS DateTime), CAST(0x0000954500000000 AS DateTime), NULL, NULL, 2, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (180, CAST(0x0000953E00000000 AS DateTime), CAST(0x0000954800000000 AS DateTime), NULL, N'Tautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (181, CAST(0x0000954600000000 AS DateTime), CAST(0x0000955000000000 AS DateTime), NULL, NULL, 50, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (182, CAST(0x0000954800000000 AS DateTime), CAST(0x0000955100000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (183, CAST(0x0000954900000000 AS DateTime), CAST(0x0000954F00000000 AS DateTime), CAST(0x0000954B00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (184, CAST(0x0000954900000000 AS DateTime), CAST(0x0000955300000000 AS DateTime), CAST(0x0000954C00000000 AS DateTime), NULL, 54, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (185, CAST(0x0000954A00000000 AS DateTime), CAST(0x0000955200000000 AS DateTime), NULL, N'Tustom shipping instructions sent to warehouse', 62, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (186, CAST(0x0000955000000000 AS DateTime), CAST(0x0000955800000000 AS DateTime), NULL, NULL, 59, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (187, CAST(0x0000955100000000 AS DateTime), CAST(0x0000955A00000000 AS DateTime), CAST(0x0000955500000000 AS DateTime), NULL, 24, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (188, CAST(0x0000955300000000 AS DateTime), CAST(0x0000955A00000000 AS DateTime), NULL, NULL, 61, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (189, CAST(0x0000955500000000 AS DateTime), CAST(0x0000955F00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (190, CAST(0x0000955700000000 AS DateTime), CAST(0x0000956100000000 AS DateTime), NULL, N'Te need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 20, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (191, CAST(0x0000955B00000000 AS DateTime), CAST(0x0000956300000000 AS DateTime), NULL, NULL, 32, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (192, CAST(0x0000955C00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), CAST(0x0000956200000000 AS DateTime), NULL, 102, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (193, CAST(0x0000955C00000000 AS DateTime), CAST(0x0000956600000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 10, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (194, CAST(0x0000955D00000000 AS DateTime), CAST(0x0000956600000000 AS DateTime), NULL, NULL, 50, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (195, CAST(0x0000955E00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), NULL, NULL, 35, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (196, CAST(0x0000955E00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 85, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (197, CAST(0x0000956300000000 AS DateTime), CAST(0x0000956A00000000 AS DateTime), NULL, NULL, 98, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (198, CAST(0x0000956400000000 AS DateTime), CAST(0x0000956A00000000 AS DateTime), NULL, N'Te must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 31, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (199, CAST(0x0000956F00000000 AS DateTime), CAST(0x0000957700000000 AS DateTime), NULL, NULL, 1, N'CANCELLED')
GO
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (200, CAST(0x0000957200000000 AS DateTime), CAST(0x0000957C00000000 AS DateTime), NULL, NULL, 29, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (201, CAST(0x0000940800000000 AS DateTime), CAST(0x0000941100000000 AS DateTime), NULL, NULL, 8, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (202, CAST(0x0000940900000000 AS DateTime), CAST(0x0000941300000000 AS DateTime), NULL, NULL, 62, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (203, CAST(0x0000940A00000000 AS DateTime), CAST(0x0000941400000000 AS DateTime), NULL, NULL, 33, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (204, CAST(0x0000957800000000 AS DateTime), CAST(0x0000958000000000 AS DateTime), NULL, N'Tustomer inquired about remote controlled models and gold models.', 117, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (205, CAST(0x0000957D00000000 AS DateTime), CAST(0x0000958600000000 AS DateTime), NULL, NULL, 52, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (206, CAST(0x0000957F00000000 AS DateTime), CAST(0x0000958800000000 AS DateTime), NULL, N'Theck on availability.', 59, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (207, CAST(0x0000958000000000 AS DateTime), CAST(0x0000958700000000 AS DateTime), CAST(0x0000958300000000 AS DateTime), NULL, 30, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (208, CAST(0x0000958000000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, NULL, 76, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (209, CAST(0x0000958100000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 67, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (210, CAST(0x0000958100000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (211, CAST(0x0000958200000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, NULL, 53, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (212, CAST(0x0000958200000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, N'Tifficult to negotiate with customer. We need more marketing materials', 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (213, CAST(0x0000958700000000 AS DateTime), CAST(0x0000958D00000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (214, CAST(0x0000958800000000 AS DateTime), CAST(0x0000958E00000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 34, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (215, CAST(0x0000958800000000 AS DateTime), CAST(0x0000959200000000 AS DateTime), NULL, NULL, 43, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (216, CAST(0x0000958F00000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, NULL, 4, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (217, CAST(0x0000959200000000 AS DateTime), CAST(0x0000959A00000000 AS DateTime), NULL, N'Tustomer requested that ad materials (such as posters, pamphlets) be included in the shippment', 47, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (218, CAST(0x0000959300000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (219, CAST(0x0000959300000000 AS DateTime), CAST(0x0000959A00000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (220, CAST(0x0000959400000000 AS DateTime), CAST(0x0000959C00000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 106, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (221, CAST(0x0000959400000000 AS DateTime), CAST(0x0000959E00000000 AS DateTime), CAST(0x0000959800000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (222, CAST(0x0000959500000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, NULL, 109, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (223, CAST(0x0000959500000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, N'Tustomer has worked with some of our vendors in the past and is aware of their MSRP', 86, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (224, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, NULL, 8, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (225, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959C00000000 AS DateTime), NULL, NULL, 28, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (226, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959E00000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (227, CAST(0x0000959A00000000 AS DateTime), CAST(0x000095A100000000 AS DateTime), CAST(0x0000959B00000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (228, CAST(0x0000959B00000000 AS DateTime), CAST(0x000095A400000000 AS DateTime), NULL, N'Trder was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don''t match what was discussed.', 13, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (229, CAST(0x0000959D00000000 AS DateTime), CAST(0x000095A600000000 AS DateTime), NULL, N'Tustomer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 57, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (230, CAST(0x000095A000000000 AS DateTime), CAST(0x000095A900000000 AS DateTime), NULL, NULL, 10, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (231, CAST(0x000095A100000000 AS DateTime), CAST(0x000095AA00000000 AS DateTime), NULL, NULL, 92, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (232, CAST(0x000095A200000000 AS DateTime), CAST(0x000095A800000000 AS DateTime), NULL, N'Tustomer requested special shippment. The instructions were passed along to the warehouse', 118, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (233, CAST(0x000095A200000000 AS DateTime), CAST(0x000095AA00000000 AS DateTime), CAST(0x000095A300000000 AS DateTime), NULL, 30, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (234, CAST(0x000095A300000000 AS DateTime), CAST(0x000095AC00000000 AS DateTime), NULL, NULL, 9, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (235, CAST(0x000095A400000000 AS DateTime), CAST(0x000095AD00000000 AS DateTime), CAST(0x000095A400000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (236, CAST(0x000095A400000000 AS DateTime), CAST(0x000095AE00000000 AS DateTime), CAST(0x000095A800000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (237, CAST(0x000095A500000000 AS DateTime), CAST(0x000095AB00000000 AS DateTime), CAST(0x000095A900000000 AS DateTime), NULL, 24, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (238, CAST(0x000095A600000000 AS DateTime), CAST(0x000095AF00000000 AS DateTime), NULL, NULL, 99, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (239, CAST(0x000095A700000000 AS DateTime), CAST(0x000095B100000000 AS DateTime), CAST(0x000095AC00000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (240, CAST(0x000095A800000000 AS DateTime), CAST(0x000095AF00000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (241, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, N'Tustomer is interested in buying more Ferrari models', 40, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (242, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (243, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 3, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (244, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (245, CAST(0x000095AA00000000 AS DateTime), CAST(0x000095B100000000 AS DateTime), NULL, NULL, 80, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (246, CAST(0x000095AA00000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 1, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (247, CAST(0x000095AE00000000 AS DateTime), CAST(0x000095B400000000 AS DateTime), NULL, NULL, 2, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (248, CAST(0x000095AE00000000 AS DateTime), CAST(0x000095B600000000 AS DateTime), NULL, N'Tan we deliver the new Ford Mustang models by end-of-quarter?', 3, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (249, CAST(0x0000959200000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, NULL, 107, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (250, CAST(0x000095B000000000 AS DateTime), CAST(0x000095B600000000 AS DateTime), NULL, NULL, 16, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (251, CAST(0x000095B100000000 AS DateTime), CAST(0x000095B700000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (252, CAST(0x000095B200000000 AS DateTime), CAST(0x000095BA00000000 AS DateTime), NULL, NULL, 71, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (253, CAST(0x000095B200000000 AS DateTime), CAST(0x000095BB00000000 AS DateTime), NULL, NULL, 32, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (254, CAST(0x000095B300000000 AS DateTime), CAST(0x000095BA00000000 AS DateTime), NULL, NULL, 101, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (255, CAST(0x000095B300000000 AS DateTime), CAST(0x000095B900000000 AS DateTime), NULL, NULL, 70, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (256, CAST(0x000095B600000000 AS DateTime), CAST(0x000095BD00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (257, CAST(0x000095B800000000 AS DateTime), CAST(0x000095BE00000000 AS DateTime), NULL, NULL, 51, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (258, CAST(0x000095B900000000 AS DateTime), CAST(0x000095BF00000000 AS DateTime), CAST(0x000095BD00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (259, CAST(0x000095B900000000 AS DateTime), CAST(0x000095BF00000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (260, CAST(0x000095BE00000000 AS DateTime), CAST(0x000095C600000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (261, CAST(0x000095BF00000000 AS DateTime), CAST(0x000095C500000000 AS DateTime), NULL, NULL, 122, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (262, CAST(0x000095C000000000 AS DateTime), CAST(0x000095C700000000 AS DateTime), NULL, NULL, 58, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (263, CAST(0x000095D300000000 AS DateTime), CAST(0x000095DE00000000 AS DateTime), CAST(0x000095D800000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (264, CAST(0x000095D400000000 AS DateTime), CAST(0x000095DA00000000 AS DateTime), NULL, NULL, 74, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (265, CAST(0x000095D400000000 AS DateTime), CAST(0x000095DF00000000 AS DateTime), NULL, NULL, 80, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (266, CAST(0x000095D500000000 AS DateTime), CAST(0x000095E000000000 AS DateTime), NULL, NULL, 68, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (267, CAST(0x000095D800000000 AS DateTime), CAST(0x000095E100000000 AS DateTime), CAST(0x000095DA00000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (268, CAST(0x000095DA00000000 AS DateTime), CAST(0x000095E300000000 AS DateTime), CAST(0x000095DE00000000 AS DateTime), NULL, 36, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (269, CAST(0x000095E100000000 AS DateTime), CAST(0x000095E900000000 AS DateTime), CAST(0x000095E600000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (270, CAST(0x000095E200000000 AS DateTime), CAST(0x000095EA00000000 AS DateTime), NULL, NULL, 89, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (271, CAST(0x000095E200000000 AS DateTime), CAST(0x000095EE00000000 AS DateTime), NULL, NULL, 56, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (272, CAST(0x000095E500000000 AS DateTime), CAST(0x000095F000000000 AS DateTime), CAST(0x000095E700000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (273, CAST(0x000095E800000000 AS DateTime), CAST(0x000095F200000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (274, CAST(0x000095ED00000000 AS DateTime), CAST(0x000095F500000000 AS DateTime), NULL, NULL, 65, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (275, CAST(0x000095EF00000000 AS DateTime), CAST(0x000095F600000000 AS DateTime), NULL, NULL, 73, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (276, CAST(0x000095F000000000 AS DateTime), CAST(0x000095F700000000 AS DateTime), NULL, NULL, 4, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (277, CAST(0x000095F500000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 41, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (278, CAST(0x000095F600000000 AS DateTime), CAST(0x0000960200000000 AS DateTime), NULL, N'Tautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 29, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (279, CAST(0x000095F700000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (280, CAST(0x000095F700000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (281, CAST(0x000095FD00000000 AS DateTime), CAST(0x0000960500000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (282, CAST(0x000095FE00000000 AS DateTime), CAST(0x0000960600000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (283, CAST(0x000095FE00000000 AS DateTime), CAST(0x0000960400000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (284, CAST(0x0000960300000000 AS DateTime), CAST(0x0000960B00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (285, CAST(0x0000960400000000 AS DateTime), CAST(0x0000960F00000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (286, CAST(0x0000960900000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), CAST(0x0000960A00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (287, CAST(0x0000960A00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), NULL, N'Tisputed then Resolved on 3/15/2005. Customer doesn''t like the craftsmaship of the models.', 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (288, CAST(0x0000960B00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), NULL, N'Te need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 15, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (289, CAST(0x0000960C00000000 AS DateTime), CAST(0x0000961400000000 AS DateTime), NULL, NULL, 109, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (290, CAST(0x0000960C00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), CAST(0x0000961100000000 AS DateTime), NULL, 102, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (291, CAST(0x0000960D00000000 AS DateTime), CAST(0x0000961400000000 AS DateTime), CAST(0x0000961000000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (292, CAST(0x0000961200000000 AS DateTime), CAST(0x0000961D00000000 AS DateTime), NULL, NULL, 56, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (293, CAST(0x0000961300000000 AS DateTime), CAST(0x0000961B00000000 AS DateTime), NULL, NULL, 104, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (294, CAST(0x0000961400000000 AS DateTime), CAST(0x0000961F00000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 70, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (295, CAST(0x0000961800000000 AS DateTime), CAST(0x0000962200000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (296, CAST(0x0000961A00000000 AS DateTime), CAST(0x0000962100000000 AS DateTime), NULL, N'Te must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 51, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (297, CAST(0x0000962000000000 AS DateTime), CAST(0x0000962A00000000 AS DateTime), CAST(0x0000962500000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (298, CAST(0x0000962500000000 AS DateTime), CAST(0x0000963100000000 AS DateTime), CAST(0x0000962900000000 AS DateTime), NULL, 48, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (299, CAST(0x0000962700000000 AS DateTime), CAST(0x0000963100000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
GO
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (300, CAST(0x0000962900000000 AS DateTime), CAST(0x0000963400000000 AS DateTime), NULL, NULL, 122, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (301, CAST(0x0000962900000000 AS DateTime), CAST(0x0000963300000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 103, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (302, CAST(0x0000962B00000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), CAST(0x0000962A00000000 AS DateTime), NULL, 72, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (303, CAST(0x0000962F00000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), NULL, NULL, 95, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (304, CAST(0x0000963000000000 AS DateTime), CAST(0x0000963A00000000 AS DateTime), NULL, NULL, 33, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (305, CAST(0x0000963000000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), NULL, NULL, 70, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (306, CAST(0x0000963600000000 AS DateTime), CAST(0x0000964000000000 AS DateTime), NULL, NULL, 38, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (307, CAST(0x0000963700000000 AS DateTime), CAST(0x0000964100000000 AS DateTime), NULL, N'Tustomer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.', 13, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (308, CAST(0x0000963E00000000 AS DateTime), CAST(0x0000964A00000000 AS DateTime), NULL, N'Tustomer credit limit exceeded. Will ship when a payment is received.', 103, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (309, CAST(0x0000963E00000000 AS DateTime), CAST(0x0000964500000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (310, CAST(0x0000963F00000000 AS DateTime), CAST(0x0000964B00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (311, CAST(0x0000964500000000 AS DateTime), CAST(0x0000965000000000 AS DateTime), NULL, NULL, 83, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (312, CAST(0x0000964700000000 AS DateTime), CAST(0x0000964E00000000 AS DateTime), NULL, NULL, 44, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (313, CAST(0x0000964900000000 AS DateTime), CAST(0x0000965300000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (314, CAST(0x0000964B00000000 AS DateTime), CAST(0x0000965400000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 26, N'PROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (315, CAST(0x0000964C00000000 AS DateTime), CAST(0x0000965300000000 AS DateTime), NULL, N'Tustomer credit limit exceeded. Will ship when a payment is received.', 85, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (316, CAST(0x0000964F00000000 AS DateTime), CAST(0x0000965A00000000 AS DateTime), NULL, N'Tustomer claims the scales of the models don''t match what was discussed. I keep all the paperwork though to prove otherwise', 111, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (317, CAST(0x0000965000000000 AS DateTime), CAST(0x0000965600000000 AS DateTime), NULL, NULL, 93, N'DISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (318, CAST(0x0000965300000000 AS DateTime), CAST(0x0000965900000000 AS DateTime), NULL, N'Tustomer doesn''t like the colors and precision of the models.', 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (319, CAST(0x0000965600000000 AS DateTime), CAST(0x0000965E00000000 AS DateTime), NULL, NULL, 97, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (320, CAST(0x0000965700000000 AS DateTime), CAST(0x0000966200000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (321, CAST(0x0000966300000000 AS DateTime), CAST(0x0000966C00000000 AS DateTime), NULL, NULL, 58, N'WAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (322, CAST(0x0000966300000000 AS DateTime), CAST(0x0000966B00000000 AS DateTime), CAST(0x0000962B00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (323, CAST(0x0000966400000000 AS DateTime), CAST(0x0000967000000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (324, CAST(0x0000966400000000 AS DateTime), CAST(0x0000966A00000000 AS DateTime), CAST(0x0000962C00000000 AS DateTime), NULL, 66, N'SHIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (325, CAST(0x0000966500000000 AS DateTime), CAST(0x0000966D00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (326, CAST(0x0000966500000000 AS DateTime), CAST(0x0000966C00000000 AS DateTime), NULL, NULL, 4, N'WAITING')
SET IDENTITY_INSERT [dbo].[orders] OFF


SET IDENTITY_INSERT [dbo].[productlines] ON

GO
INSERT INTO [dbo].[productlines] ([id], [name], [description]) VALUES (1, N'Classic Cars', N'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')
GO
INSERT INTO [dbo].[productlines] ([id], [name], [description]) VALUES (2, N'Motorcycles', N'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.')
GO
INSERT INTO [dbo].[productlines] ([id], [name], [description]) VALUES (3, N'Planes', N'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.')
GO
INSERT INTO [dbo].[productlines] ([id], [name], [description]) VALUES (4, N'Ships', N'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.')
GO
INSERT INTO [dbo].[productlines] ([id], [name], [description]) VALUES (5, N'Trains', N'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.')
GO
INSERT INTO [dbo].[productlines] ([id], [name], [description]) VALUES (6, N'Trucks and Buses', N'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.')
GO
INSERT INTO [dbo].[productlines] ([id], [name], [description]) VALUES (7, N'Vintage Cars', N'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')

SET IDENTITY_INSERT [dbo].[productlines] OFF

SET IDENTITY_INSERT [dbo].[products] ON

GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (1, N'T969 Harley Davidson Ultimate Chopper', N'T:10', N'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 7933, 917, CAST(48.81 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (2, N'T952 Alpine Renault 1300', N'T:10', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 7305, 778, CAST(98.58 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (3, N'T996 Moto Guzzi 1100i', N'T:10', N'Tfficial Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 6625, 891, CAST(68.99 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (4, N'T003 Harley-Davidson Eagle Drag Bike', N'T:10', N'Todel features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand
, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', 5582, 867, CAST(91.02 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (5, N'T972 Alfa Romeo GTA', N'T:10', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3252, 842, CAST(85.68 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (6, N'T962 LanciaA Delta 16V', N'T:10', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6791, 726, CAST(103.42 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (7, N'T968 Ford Mustang', N'T:12', N'Tood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, 834, CAST(95.34 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (8, N'T001 Ferrari Enzo', N'T:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3619, 815, CAST(95.59 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (9, N'T958 Setra Bus', N'T:12', N'Todel features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579, 798, CAST(77.90 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (10, N'T002 Suzuki XREO', N'T:12', N'Tfficial logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 9997, 883, CAST(66.27 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (11, N'T969 Corvair Monza', N'T:18', N'T:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', 6906, 799, CAST(89.14 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (12, N'T968 Dodge Charger', N'T:12', N'T:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, 771, CAST(75.16 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (13, N'T969 Ford Falcon', N'T:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 1049, 759, CAST(83.05 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (14, N'T970 Plymouth Hemi Cuda', N'T:12', N'Tery detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', 5663, 802, CAST(31.92 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (15, N'T957 Chevy Pickup', N'T:12', N'T:12 scale die-cast about 20" long Hood opens, Rubber wheels', 6125, 870, CAST(55.70 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (16, N'T969 Dodge Charger', N'T:12', N'Tetailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', 7323, 866, CAST(58.73 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (17, N'T940 Ford Pickup Truck', N'T:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 2613, 806, CAST(58.33 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (18, N'T993 Mazda RX-7', N'T:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, 886, CAST(83.51 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (19, N'T937 Lincoln Berline', N'T:18', N'Teatures opening engine cover, doors, trunk, and fuel filler cap. Color black', 8693, 997, CAST(60.62 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (20, N'T936 Mercedes-Benz 500K Special Roadster', N'T:18', N'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', 8635, 876, CAST(24.26 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (21, N'T965 Aston Martin DB5', N'T:18', N'Tie-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, 828, CAST(65.96 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (22, N'T980s Black Hawk Helicopter', N'T:18', N'T:18 scale replica of actual Army''s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', 5330, 882, CAST(77.27 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (23, N'T917 Grand Touring Sedan', N'T:18', N'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', 2724, 747, CAST(86.70 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (24, N'T948 Porsche 356-A Roadster', N'T:18', N'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8826, 837, CAST(53.90 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (25, N'T995 Honda Civic', N'T:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', 9772, 813, CAST(93.89 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (26, N'T998 Chrysler Plymouth Prowler', N'T:18', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 4724, 814, CAST(101.51 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (27, N'T911 Ford Town Car', N'T:18', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.', 540, 649, CAST(33.30 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (28, N'T964 Mercedes Tour Bus', N'T:18', N'Txact replica. 100+ parts. working steering system, original logos', 8258, 892, CAST(74.86 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (29, N'T932 Model A Ford J-Coupe', N'T:18', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', 9354, 780, CAST(58.48 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (30, N'T926 Ford Fire Engine', N'T:18', N'Tleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', 2018, 753, CAST(24.92 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (31, N'T-51-D Mustang', N'T:72', N'Tas retractable wheels and comes with a stand', 992, 800, CAST(49.00 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (32, N'T936 Harley Davidson El Knucklehead', N'T:18', N'Tntricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', 4357, 763, CAST(24.23 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (33, N'T928 Mercedes-Benz SSK', N'T:18', N'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', 548, 686, CAST(72.56 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (34, N'T999 Indy 500 Monte Carlo SS', N'T:18', N'Teatures include opening and closing doors. Color: Red', 8164, 806, CAST(56.76 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (35, N'T913 Ford Model T Speedster', N'T:18', N'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', 4189, 880, CAST(60.78 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (36, N'T934 Ford V8 Coupe', N'T:18', N'Throme Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 5649, 807, CAST(34.35 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (37, N'T999 Yamaha Speed Boat', N'T:18', N'Txact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 4259, 736, CAST(51.61 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (38, N'T8th Century Vintage Horse Carriage', N'T:18', N'Tand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.

This collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', 5992, 741, CAST(60.74 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (39, N'T903 Ford Model A', N'T:18', N'Teatures opening trunk,  working steering system', 3913, 607, CAST(68.30 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (40, N'T992 Ferrari 360 Spider red', N'T:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8347, 1603, CAST(77.90 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (41, N'T985 Toyota Supra', N'T:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 7733, 0, CAST(57.01 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (42, N'Tollectable Wooden Train', N'T:18', N'Tand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', 6450, 673, CAST(67.56 AS Numeric(10, 2)), 5)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (43, N'T969 Dodge Super Bee', N'T:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 1917, 889, CAST(49.05 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (44, N'T917 Maxwell Touring Car', N'T:18', N'Teatures Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 7913, 830, CAST(57.54 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (45, N'T976 Ford Gran Torino', N'T:18', N'Tighly detailed 1976 Ford Gran Torino "Starsky and Hutch" diecast model. Very well constructed and painted in red and white patterns.', 9127, 798, CAST(73.49 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (46, N'T948 Porsche Type 356 Roadster', N'T:18', N'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.', 8990, 902, CAST(62.16 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (47, N'T957 Vespa GS150', N'T:18', N'Teatures rotating wheels , working kick stand. Comes with stand.', 7689, 840, CAST(32.95 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (48, N'T941 Chevrolet Special Deluxe Cabriolet', N'T:18', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', 2378, 787, CAST(64.58 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (49, N'T970 Triumph Spitfire', N'T:18', N'Teatures include opening and closing doors. Color: White.', 5545, 867, CAST(91.92 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (50, N'T932 Alfa Romeo 8C2300 Spider Sport', N'T:18', N'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', 6553, 671, CAST(43.26 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (51, N'T904 Buick Runabout', N'T:18', N'Teatures opening trunk,  working steering system', 8290, 726, CAST(52.66 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (52, N'T940s Ford truck', N'T:18', N'This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940''s Pick-Up truck is painted in classic dark green color, and features rotating wheels.', 3128, 775, CAST(84.76 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (53, N'T939 Cadillac Limousine', N'T:18', N'Teatures completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles', 6645, 770, CAST(23.14 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (54, N'T957 Corvette Convertible', N'T:18', N'T957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.', 1249, 933, CAST(69.93 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (55, N'T957 Ford Thunderbird', N'T:18', N'This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.', 3209, 591, CAST(34.21 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (56, N'T970 Chevy Chevelle SS 454', N'T:24', N'This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.', 1005, 676, CAST(49.24 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (57, N'T970 Dodge Coronet', N'T:24', N'T:24 scale die-cast about 18" long doors open, hood opens and rubber wheels', 4074, 832, CAST(32.37 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (58, N'T997 BMW R 1100 S', N'T:24', N'Tetailed scale replica with working suspension and constructed from over 70 parts', 7003, 795, CAST(60.86 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (59, N'T966 Shelby Cobra 427 S/C', N'T:24', N'This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it''s own display case.', 8197, 828, CAST(29.18 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (60, N'T928 British Royal Navy Airplane', N'T:24', N'Tfficial logos and insignias', 3627, 822, CAST(66.74 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (61, N'T939 Chevrolet Deluxe Coupe', N'T:24', N'This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.', 7332, 771, CAST(22.57 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (62, N'T960 BSA Gold Star DBD34', N'T:24', N'Tetailed scale replica with working suspension and constructed from over 70 parts', 15, 890, CAST(37.32 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (63, N'T8th century schooner', N'T:24', N'Tll wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.', 1898, 713, CAST(82.34 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (64, N'T938 Cadillac V-16 Presidential Limousine', N'T:24', N'This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.', 2847, 768, CAST(20.61 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (65, N'T962 Volkswagen Microbus', N'T:24', N'This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.', 2327, 740, CAST(61.34 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (66, N'T982 Ducati 900 Monster', N'T:24', N'Teatures two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 6840, 856, CAST(47.10 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (67, N'T949 Jaguar XK 120', N'T:24', N'Trecision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 2350, 791, CAST(47.25 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (68, N'T958 Chevy Corvette Limited Edition', N'T:24', N'The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.', 2542, 810, CAST(15.91 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (69, N'T900s Vintage Bi-Plane', N'T:24', N'Tand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.', 5942, 820, CAST(34.25 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (70, N'T952 Citroen-15CV', N'T:24', N'Trecision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.', 1452, 705, CAST(72.82 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (71, N'T982 Lamborghini Diablo', N'T:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7723, 777, CAST(16.24 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (72, N'T912 Ford Model T Delivery Wagon', N'T:24', N'This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.', 9173, 722, CAST(46.91 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (73, N'T969 Chevrolet Camaro Z28', N'T:24', N'T969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.', 4695, 719, CAST(50.51 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (74, N'T971 Alpine Renault 1600s', N'T:24', N'This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7995, 870, CAST(38.58 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (75, N'T937 Horch 930V Limousine', N'T:24', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', 2902, 768, CAST(26.30 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (76, N'T002 Chevy Corvette', N'T:24', N'The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.', 9446, 757, CAST(62.11 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (77, N'T940 Ford Delivery Sedan', N'T:24', N'Throme Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.', 6621, 640, CAST(48.64 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (78, N'T956 Porsche 356A Coupe', N'T:18', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6600, 925, CAST(98.30 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (79, N'Torsair F4U ( Bird Cage)', N'T:24', N'Tas retractable wheels and comes with a stand. Official logos and insignias.', 6812, 897, CAST(29.34 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (80, N'T936 Mercedes Benz 500k Roadster', N'T:24', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.', 2081, 635, CAST(21.75 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (81, N'T992 Porsche Cayenne Turbo Silver', N'T:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 6582, 747, CAST(69.78 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (82, N'T936 Chrysler Airflow', N'T:24', N'Teatures opening trunk,  working steering system. Color dark green.', 4710, 878, CAST(57.46 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (83, N'T900s Vintage Tri-Plane', N'T:24', N'Tand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.', 2756, 801, CAST(36.23 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (84, N'T961 Chevrolet Impala', N'T:18', N'This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.', 7869, 888, CAST(32.33 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (85, N'T980’s GM Manhattan Express', N'T:32', N'This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.', 5099, 706, CAST(53.93 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (86, N'T997 BMW F650 ST', N'T:32', N'Teatures official die-struck logos and baked enamel finish. Comes with stand.', 178, 863, CAST(66.92 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (87, N'T982 Ducati 996 R', N'T:32', N'Teatures rotating wheels , working kick stand. Comes with stand.', 9241, 801, CAST(24.14 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (88, N'T954 Greyhound Scenicruiser', N'T:32', N'Todel features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos', 2874, 809, CAST(25.98 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (89, N'T950''s Chicago Surface Lines Streetcar', N'T:32', N'This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 8601, 722, CAST(26.72 AS Numeric(10, 2)), 5)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (90, N'T996 Peterbilt 379 Stake Bed with Outrigger', N'T:32', N'This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab', 814, 827, CAST(33.61 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (91, N'T928 Ford Phaeton Deluxe', N'T:32', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system', 136, 825, CAST(33.02 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (92, N'T974 Ducati 350 Mk3 Desmo', N'T:32', N'This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 3341, 796, CAST(56.13 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (93, N'T930 Buick Marquette Phaeton', N'T:50', N'Teatures opening trunk,  working steering system', 7062, 929, CAST(27.06 AS Numeric(10, 2)), 7)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (94, N'Tiamond T620 Semi-Skirted Tanker', N'T:50', N'This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.', 1016, 836, CAST(68.29 AS Numeric(10, 2)), 6)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (95, N'T962 City of Detroit Streetcar', N'T:50', N'This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 1645, 853, CAST(37.49 AS Numeric(10, 2)), 5)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (96, N'T002 Yamaha YZR M1', N'T:50', N'Teatures rotating wheels , working kick stand. Comes with stand.', 600, 888, CAST(34.17 AS Numeric(10, 2)), 2)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (97, N'The Schooner Bluenose', N'T:700', N'Tll wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.
The schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.', 1897, 595, CAST(34.00 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (98, N'Tmerican Airlines: B767-300', N'T:700', N'Txact replia with official logos and insignias and retractable wheels', 5841, 830, CAST(51.15 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (99, N'The Mayflower', N'T:700', N'Teasures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches wide
All wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.', 737, 698, CAST(43.30 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (100, N'TMS Bounty', N'T:700', N'Teasures 30 inches Long x 27 1/2 inches High x 4 3/4 inches wide. 
Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 3501, 757, CAST(39.83 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (101, N'Tmerica West Airlines B757-200', N'T:700', N'Tfficial logos and insignias. Working steering system. Rotating jet engines', 9653, 808, CAST(68.80 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (102, N'The USS Constitution Ship', N'T:700', N'Tll wood with canvas sails. Measures 31 1/2" Length x 22 3/8" High x 8 1/4" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.', 7083, 791, CAST(33.97 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (103, N'T982 Camaro Z28', N'T:18', N'Teatures include opening and closing doors. Color: White. 
Measures approximately 9 1/2" Long.', 6934, 727, CAST(46.53 AS Numeric(10, 2)), 1)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (104, N'TTA: B757-300', N'T:700', N'Txact replia with official logos and insignias and retractable wheels', 7106, 871, CAST(59.33 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (105, N'T/A 18 Hornet 1/72', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 551, 890, CAST(54.40 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (106, N'The Titanic', N'T:700', N'Tompleted model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', 1956, 765, CAST(51.09 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (107, N'The Queen Mary', N'T:700', N'Txact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 5088, 700, CAST(53.63 AS Numeric(10, 2)), 4)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (108, N'Tmerican Airlines: MD-11S', N'T:700', N'Tolished finish. Exact replia with official logos and insignias and retractable wheels', 8820, 927, CAST(36.27 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (109, N'Toeing X-32A JSF', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 4857, 756, CAST(32.77 AS Numeric(10, 2)), 3)
GO
INSERT INTO [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (110, N'Tont Yacht', N'T:72', N'Teasures 38 inches Long x 33 3/4 inches High. Includes a stand.
Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', 414, 742, CAST(33.30 AS Numeric(10, 2)), 4)

SET IDENTITY_INSERT [dbo].[products] OFF

SET IDENTITY_INSERT [dbo].[orderdetails] ON

GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (1, 23, 30, CAST(136.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (1, 27, 50, CAST(55.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (1, 50, 22, CAST(75.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (1, 80, 49, CAST(35.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (2, 29, 25, CAST(108.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (2, 33, 26, CAST(167.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (2, 61, 45, CAST(32.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (2, 64, 46, CAST(44.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (3, 19, 39, CAST(95.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (3, 20, 41, CAST(43.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 2, 26, CAST(214.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 6, 42, CAST(119.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 9, 27, CAST(121.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 17, 35, CAST(94.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 30, 22, CAST(58.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 35, 27, CAST(92.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 36, 35, CAST(61.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 38, 25, CAST(86.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 44, 46, CAST(86.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 52, 36, CAST(98.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 53, 41, CAST(40.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 65, 36, CAST(107.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 82, 25, CAST(88.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 85, 31, CAST(92.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 90, 45, CAST(63.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 103, 42, CAST(94.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 11, 34, CAST(131.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 15, 41, CAST(111.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 26, 24, CAST(135.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 28, 29, CAST(122.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 40, 23, CAST(165.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 49, 38, CAST(119.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 57, 35, CAST(52.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 68, 44, CAST(30.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 81, 26, CAST(106.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 88, 35, CAST(51.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 89, 49, CAST(56.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 94, 33, CAST(114.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 95, 32, CAST(53.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 5, 50, CAST(127.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 8, 41, CAST(205.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 13, 29, CAST(141.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 39, 22, CAST(136.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 42, 38, CAST(87.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 51, 41, CAST(75.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 63, 43, CAST(117.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 72, 44, CAST(73.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 77, 50, CAST(75.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 97, 41, CAST(54.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 99, 29, CAST(86.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 102, 31, CAST(60.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 106, 39, CAST(92.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 107, 22, CAST(99.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 110, 25, CAST(44.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 22, 36, CAST(134.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 31, 34, CAST(81.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 37, 41, CAST(80.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 48, 41, CAST(94.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 60, 28, CAST(107.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 69, 49, CAST(65.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 75, 31, CAST(55.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 79, 50, CAST(55.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 83, 26, CAST(71.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 91, 33, CAST(65.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 93, 39, CAST(35.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 98, 31, CAST(91.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 100, 30, CAST(85.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 101, 34, CAST(99.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 104, 32, CAST(113.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 105, 44, CAST(76.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 108, 48, CAST(70.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 109, 48, CAST(43.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 1, 30, CAST(81.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 3, 39, CAST(105.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 4, 27, CAST(172.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 10, 21, CAST(122.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 32, 29, CAST(52.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 58, 25, CAST(96.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 62, 38, CAST(73.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 86, 20, CAST(88.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 7, 33, CAST(165.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 12, 45, CAST(96.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 14, 39, CAST(75.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 16, 36, CAST(107.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 24, 38, CAST(67.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 43, 26, CAST(73.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 45, 29, CAST(132.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 47, 43, CAST(52.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 54, 44, CAST(139.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 66, 35, CAST(64.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 74, 30, CAST(60.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 78, 40, CAST(132.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 84, 31, CAST(67.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 87, 27, CAST(36.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 92, 31, CAST(87.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 96, 34, CAST(74.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (10, 18, 26, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (10, 25, 38, CAST(137.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (10, 34, 26, CAST(126.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (10, 40, 46, CAST(160.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (10, 46, 47, CAST(125.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (10, 71, 29, CAST(32.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 21, 37, CAST(118.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 23, 42, CAST(153.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 27, 32, CAST(51.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 29, 33, CAST(115.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 33, 31, CAST(163.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 50, 28, CAST(81.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 55, 42, CAST(62.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 56, 36, CAST(72.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 59, 29, CAST(43.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 61, 20, CAST(28.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 64, 39, CAST(40.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 67, 43, CAST(82.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 70, 46, CAST(112.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 73, 27, CAST(80.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 76, 37, CAST(96.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 80, 48, CAST(35.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (12, 19, 33, CAST(87.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (12, 20, 48, CAST(48.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (12, 36, 28, CAST(53.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (12, 38, 43, CAST(94.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (12, 44, 39, CAST(91.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (12, 82, 26, CAST(85.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (13, 2, 29, CAST(197.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (13, 35, 23, CAST(85.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (14, 9, 21, CAST(121.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (14, 17, 49, CAST(101.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (14, 53, 50, CAST(43.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (14, 90, 23, CAST(58.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 6, 31, CAST(128.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 28, 39, CAST(106.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 30, 45, CAST(53.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 40, 48, CAST(169.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 52, 41, CAST(105.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 65, 21, CAST(102.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 68, 24, CAST(28.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 85, 32, CAST(88.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 88, 28, CAST(43.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 103, 42, CAST(82.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (16, 15, 46, CAST(111.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (16, 26, 46, CAST(140.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (16, 57, 47, CAST(56.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (16, 81, 44, CAST(106.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (16, 94, 27, CAST(100.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (17, 89, 27, CAST(60.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 8, 33, CAST(195.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 11, 43, CAST(148.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 13, 39, CAST(173.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 39, 26, CAST(121.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 42, 21, CAST(81.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 49, 22, CAST(122.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 51, 23, CAST(73.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 63, 41, CAST(119.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 95, 21, CAST(55.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 99, 38, CAST(75.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 107, 45, CAST(89.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 110, 50, CAST(52.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (19, 106, 36, CAST(86.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 5, 46, CAST(112.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 22, 43, CAST(151.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 37, 21, CAST(74.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 48, 27, CAST(95.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 69, 41, CAST(64.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 72, 35, CAST(72.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 75, 20, CAST(63.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 77, 35, CAST(82.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 79, 28, CAST(62.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 97, 25, CAST(57.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 100, 29, CAST(74.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 102, 38, CAST(67.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 108, 26, CAST(63.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 109, 28, CAST(40.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 3, 29, CAST(118.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 4, 46, CAST(158.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 31, 29, CAST(82.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 32, 46, CAST(57.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 58, 35, CAST(110.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 60, 39, CAST(93.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 62, 34, CAST(72.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 83, 29, CAST(71.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 86, 22, CAST(94.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 91, 29, CAST(68.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 93, 49, CAST(41.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 98, 47, CAST(91.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 101, 24, CAST(81.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 104, 24, CAST(106.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 105, 43, CAST(72.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (22, 1, 34, CAST(86.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (22, 10, 50, CAST(126.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (22, 66, 32, CAST(58.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (22, 92, 25, CAST(95.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (22, 96, 44, CAST(72.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 7, 42, CAST(155.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 12, 37, CAST(113.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 14, 32, CAST(65.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 16, 20, CAST(104.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 18, 34, CAST(114.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 24, 43, CAST(62.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 25, 31, CAST(113.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 40, 25, CAST(137.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 43, 21, CAST(69.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 45, 21, CAST(133.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 47, 35, CAST(59.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 54, 28, CAST(145.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 71, 39, CAST(34.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 74, 34, CAST(50.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 78, 43, CAST(136.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 84, 29, CAST(67.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 87, 31, CAST(33.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (24, 21, 26, CAST(120.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (24, 34, 46, CAST(114.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (24, 46, 34, CAST(117.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (24, 59, 50, CAST(43.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 23, 21, CAST(153.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 27, 42, CAST(58.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 29, 42, CAST(111.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 50, 36, CAST(75.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 55, 23, CAST(66.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 56, 22, CAST(62.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 61, 45, CAST(30.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 64, 22, CAST(36.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 67, 32, CAST(74.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 70, 25, CAST(93.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 73, 49, CAST(76.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 76, 43, CAST(101.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 80, 46, CAST(36.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (26, 19, 32, CAST(89.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (26, 33, 34, CAST(138.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 2, 38, CAST(205.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 6, 22, CAST(122.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 9, 21, CAST(135.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 17, 38, CAST(116.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 20, 42, CAST(51.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 30, 43, CAST(51.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 35, 31, CAST(93.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 36, 46, CAST(61.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 38, 30, CAST(93.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 44, 38, CAST(94.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 52, 50, CAST(102.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 53, 43, CAST(47.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 65, 27, CAST(122.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 82, 34, CAST(83.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 85, 43, CAST(82.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 90, 26, CAST(62.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 103, 45, CAST(97.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 8, 46, CAST(193.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 11, 46, CAST(140.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 13, 42, CAST(169.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 15, 24, CAST(100.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 26, 45, CAST(140.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 28, 45, CAST(114.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 40, 22, CAST(149.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 49, 25, CAST(126.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 57, 20, CAST(50.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 68, 39, CAST(34.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 81, 20, CAST(107.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 88, 45, CAST(46.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 89, 29, CAST(60.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 94, 46, CAST(111.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 95, 46, CAST(55.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (29, 39, 41, CAST(120.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (29, 42, 41, CAST(80.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (29, 51, 43, CAST(77.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (29, 99, 32, CAST(72.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 5, 33, CAST(123.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 63, 45, CAST(113.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 72, 41, CAST(81.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 77, 50, CAST(76.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 97, 31, CAST(58.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 102, 45, CAST(72.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 106, 42, CAST(90.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 107, 30, CAST(94.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 110, 32, CAST(44.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (31, 37, 40, CAST(68.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (31, 48, 33, CAST(99.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 22, 21, CAST(141.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 69, 35, CAST(60.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 75, 29, CAST(52.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 79, 50, CAST(54.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 100, 22, CAST(76.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 101, 40, CAST(86.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 108, 26, CAST(63.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 109, 21, CAST(40.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (33, 105, 36, CAST(80.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 31, 49, CAST(80.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 60, 41, CAST(109.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 83, 46, CAST(61.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 86, 23, CAST(80.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 91, 49, CAST(67.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 93, 27, CAST(37.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 98, 24, CAST(76.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 104, 27, CAST(115.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 1, 41, CAST(90.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 3, 27, CAST(116.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 4, 31, CAST(187.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 10, 20, CAST(131.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 32, 30, CAST(51.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 58, 35, CAST(94.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 62, 43, CAST(75.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 7, 42, CAST(173.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 12, 48, CAST(110.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 14, 24, CAST(72.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 16, 29, CAST(103.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 24, 48, CAST(66.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 43, 45, CAST(65.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 45, 42, CAST(139.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 47, 45, CAST(49.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 54, 31, CAST(133.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 66, 29, CAST(67.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 71, 20, CAST(34.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 74, 27, CAST(52.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 78, 47, CAST(139.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 84, 23, CAST(76.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 87, 33, CAST(38.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 92, 30, CAST(91.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 96, 44, CAST(78.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (37, 18, 25, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (37, 25, 36, CAST(120.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (37, 40, 41, CAST(169.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (38, 21, 44, CAST(115.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (38, 34, 37, CAST(110.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (38, 46, 31, CAST(118.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (38, 59, 26, CAST(40.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 23, 33, CAST(149.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 27, 22, CAST(51.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 29, 38, CAST(114.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 50, 47, CAST(79.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 55, 23, CAST(64.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 56, 45, CAST(59.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 61, 22, CAST(33.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 64, 33, CAST(38.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 67, 28, CAST(73.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 70, 30, CAST(96.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 73, 49, CAST(77.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 76, 21, CAST(99.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 80, 29, CAST(32.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 19, 31, CAST(89.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 20, 49, CAST(52.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 33, 41, CAST(151.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 35, 46, CAST(91.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 36, 20, CAST(52.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 38, 20, CAST(101.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 44, 30, CAST(81.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 82, 29, CAST(93.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 2, 37, CAST(186.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 6, 26, CAST(131.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 9, 38, CAST(118.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 17, 32, CAST(95.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 30, 46, CAST(51.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 52, 40, CAST(100.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 53, 29, CAST(40.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 65, 47, CAST(118.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 85, 26, CAST(87.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 90, 28, CAST(62.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 103, 36, CAST(101.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 15, 21, CAST(114.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 26, 39, CAST(160.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 28, 47, CAST(103.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 40, 34, CAST(143.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 57, 20, CAST(50.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 68, 21, CAST(32.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 81, 40, CAST(104.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 88, 24, CAST(53.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 94, 44, CAST(94.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 8, 33, CAST(166.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 11, 33, CAST(140.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 13, 46, CAST(167.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 39, 47, CAST(129.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 42, 22, CAST(95.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 49, 24, CAST(122.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 51, 24, CAST(79.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 63, 33, CAST(114.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 72, 49, CAST(74.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 89, 42, CAST(60.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 95, 42, CAST(56.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 97, 41, CAST(55.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 99, 43, CAST(77.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 106, 21, CAST(92.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 107, 38, CAST(91.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 110, 39, CAST(46.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 5, 49, CAST(133.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 22, 32, CAST(126.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 37, 46, CAST(70.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 48, 34, CAST(99.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 69, 27, CAST(63.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 75, 33, CAST(59.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 77, 23, CAST(74.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 79, 28, CAST(55.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 93, 34, CAST(34.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 98, 36, CAST(86.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 100, 26, CAST(87.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 101, 26, CAST(79.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 102, 31, CAST(69.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 105, 28, CAST(70.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 108, 34, CAST(65.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 109, 37, CAST(49.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (45, 91, 20, CAST(56.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 1, 45, CAST(76.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 3, 37, CAST(104.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 4, 33, CAST(154.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 10, 49, CAST(146.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 31, 30, CAST(71.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 32, 30, CAST(52.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 58, 43, CAST(103.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 60, 40, CAST(87.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 62, 47, CAST(63.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 66, 27, CAST(56.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 83, 33, CAST(71.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 86, 33, CAST(99.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 87, 31, CAST(39.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 92, 27, CAST(95.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 96, 38, CAST(73.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 104, 20, CAST(113.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (47, 47, 47, CAST(60.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (47, 54, 29, CAST(130.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 7, 48, CAST(161.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 12, 31, CAST(110.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 14, 21, CAST(74.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 16, 33, CAST(97.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 24, 26, CAST(70.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 43, 36, CAST(74.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 45, 37, CAST(129.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 71, 25, CAST(33.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 74, 30, CAST(48.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 78, 23, CAST(123.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 84, 31, CAST(72.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 18, 23, CAST(114.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 21, 47, CAST(108.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 25, 25, CAST(136.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 34, 27, CAST(113.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 40, 32, CAST(143.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 46, 28, CAST(135.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 50, 34, CAST(83.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 55, 29, CAST(66.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 56, 25, CAST(65.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 59, 47, CAST(46.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 67, 21, CAST(77.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 70, 34, CAST(115.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 73, 31, CAST(71.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (49, 76, 27, CAST(96.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 19, 50, CAST(87.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 20, 30, CAST(48.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 23, 34, CAST(156.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 27, 24, CAST(50.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 29, 33, CAST(125.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 33, 23, CAST(167.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 44, 42, CAST(89.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 61, 36, CAST(31.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 64, 49, CAST(39.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 80, 26, CAST(38.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 82, 20, CAST(90.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 2, 45, CAST(182.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 6, 20, CAST(121.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 9, 30, CAST(135.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 17, 34, CAST(95.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 35, 47, CAST(93.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 36, 30, CAST(56.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 38, 26, CAST(97.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 52, 49, CAST(111.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 53, 30, CAST(47.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 90, 49, CAST(62.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 103, 20, CAST(95.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 15, 24, CAST(114.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 26, 43, CAST(152.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 28, 49, CAST(106.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 30, 39, CAST(58.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 40, 21, CAST(167.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 65, 42, CAST(109.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 68, 30, CAST(29.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 85, 27, CAST(84.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 88, 41, CAST(43.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 94, 26, CAST(108.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (53, 49, 35, CAST(117.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (53, 57, 25, CAST(49.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (53, 81, 23, CAST(112.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (53, 89, 33, CAST(57.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 8, 20, CAST(201.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 11, 42, CAST(128.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 13, 49, CAST(155.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 39, 31, CAST(125.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 42, 29, CAST(82.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 51, 22, CAST(82.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 63, 40, CAST(111.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 95, 31, CAST(53.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 97, 43, CAST(58.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 99, 31, CAST(80.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 106, 50, CAST(87.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 107, 20, CAST(85.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 110, 50, CAST(51.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (55, 72, 31, CAST(75.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (55, 102, 36, CAST(59.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 5, 32, CAST(129.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 22, 38, CAST(138.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 37, 44, CAST(83.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 48, 29, CAST(105.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 69, 23, CAST(62.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 75, 34, CAST(56.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 77, 37, CAST(76.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 79, 44, CAST(58.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 100, 32, CAST(89.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 101, 20, CAST(87.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 105, 43, CAST(76.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 108, 44, CAST(70.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 109, 34, CAST(49.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (57, 93, 20, CAST(43.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (57, 98, 48, CAST(77.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (58, 31, 33, CAST(69.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (58, 60, 40, CAST(89.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (58, 83, 33, CAST(66.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (58, 86, 34, CAST(83.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (58, 91, 28, CAST(56.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (58, 104, 48, CAST(109.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (59, 62, 22, CAST(67.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 1, 49, CAST(81.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 3, 37, CAST(101.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 4, 22, CAST(170.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 7, 41, CAST(188.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 10, 38, CAST(131.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 14, 24, CAST(67.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 32, 42, CAST(51.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 43, 21, CAST(66.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 45, 25, CAST(129.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 47, 21, CAST(54.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 54, 32, CAST(142.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 58, 44, CAST(100.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 66, 27, CAST(67.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 74, 50, CAST(49.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 84, 23, CAST(80.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 87, 35, CAST(39.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 92, 23, CAST(86.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 96, 31, CAST(78.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (61, 12, 46, CAST(96.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (61, 16, 50, CAST(93.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (61, 24, 38, CAST(70.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (61, 40, 20, CAST(140.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (61, 71, 42, CAST(30.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (61, 78, 35, CAST(130.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 18, 28, CAST(121.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 21, 43, CAST(102.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 25, 48, CAST(139.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 34, 23, CAST(125.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 46, 36, CAST(132.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 55, 25, CAST(62.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 56, 37, CAST(73.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 59, 23, CAST(47.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 67, 20, CAST(82.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 70, 25, CAST(108.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 73, 20, CAST(72.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 76, 30, CAST(94.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 19, 48, CAST(87.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 20, 45, CAST(45.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 23, 29, CAST(141.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 27, 27, CAST(53.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 29, 38, CAST(113.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 33, 48, CAST(156.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 50, 39, CAST(86.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 61, 37, CAST(27.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 64, 43, CAST(38.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 80, 37, CAST(32.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (64, 2, 21, CAST(212.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (64, 35, 31, CAST(101.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (64, 36, 48, CAST(59.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (64, 38, 40, CAST(101.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (64, 44, 43, CAST(80.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (64, 82, 42, CAST(96.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 6, 21, CAST(143.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 9, 49, CAST(121.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 17, 36, CAST(103.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 52, 45, CAST(107.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 53, 25, CAST(46.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 85, 24, CAST(91.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 90, 49, CAST(57.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 103, 39, CAST(86.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 8, 44, CAST(168.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 11, 34, CAST(123.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 13, 27, CAST(152.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 15, 48, CAST(109.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 26, 29, CAST(134.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 28, 46, CAST(120.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 30, 31, CAST(60.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 40, 47, CAST(154.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 42, 50, CAST(84.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 49, 28, CAST(123.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 57, 25, CAST(46.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 65, 32, CAST(117.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 68, 27, CAST(31.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 81, 24, CAST(106.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 88, 48, CAST(50.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 89, 44, CAST(55.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 94, 48, CAST(106.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 95, 38, CAST(49.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (67, 39, 43, CAST(136.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (67, 51, 26, CAST(72.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (67, 99, 29, CAST(76.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 5, 44, CAST(123.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 22, 43, CAST(141.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 37, 46, CAST(69.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 48, 34, CAST(84.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 63, 33, CAST(110.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 69, 21, CAST(54.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 72, 20, CAST(77.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 75, 32, CAST(64.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 77, 29, CAST(73.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 97, 43, CAST(66.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 100, 29, CAST(87.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 102, 46, CAST(62.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 106, 24, CAST(85.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 107, 28, CAST(83.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 109, 40, CAST(42.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 110, 38, CAST(43.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 1, 36, CAST(94.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 3, 27, CAST(97.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 4, 20, CAST(160.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 31, 21, CAST(75.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 32, 46, CAST(49.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 58, 50, CAST(103.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 60, 49, CAST(93.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 62, 29, CAST(72.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 79, 27, CAST(57.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 83, 48, CAST(68.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 86, 28, CAST(89.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 91, 31, CAST(57.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 93, 48, CAST(39.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 98, 28, CAST(91.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 101, 31, CAST(87.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 104, 36, CAST(94.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 105, 48, CAST(72.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 108, 39, CAST(67.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 7, 30, CAST(163.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 10, 35, CAST(126.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 14, 36, CAST(71.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 43, 32, CAST(65.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 45, 36, CAST(136.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 47, 38, CAST(52.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 54, 33, CAST(120.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 66, 38, CAST(66.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 74, 34, CAST(53.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 84, 24, CAST(77.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 87, 26, CAST(37.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 92, 34, CAST(83.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (70, 96, 48, CAST(75.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (71, 12, 47, CAST(116.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (71, 16, 41, CAST(93.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (71, 24, 20, CAST(70.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (71, 78, 34, CAST(130.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (72, 18, 35, CAST(134.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (72, 25, 35, CAST(128.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (72, 40, 39, CAST(165.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (72, 71, 36, CAST(34.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 21, 42, CAST(109.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 34, 39, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 46, 48, CAST(139.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 56, 32, CAST(61.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 59, 34, CAST(43.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 67, 22, CAST(79.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 73, 24, CAST(77.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 76, 22, CAST(87.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 19, 43, CAST(101.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 20, 48, CAST(51.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 23, 24, CAST(168.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 27, 26, CAST(55.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 29, 31, CAST(127.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 33, 22, CAST(140.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 36, 28, CAST(56.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 38, 31, CAST(86.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 44, 29, CAST(90.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 50, 21, CAST(77.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 55, 39, CAST(58.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 61, 31, CAST(29.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 64, 27, CAST(39.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 70, 23, CAST(98.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 80, 35, CAST(35.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 82, 22, CAST(93.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (75, 2, 34, CAST(207.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (75, 9, 43, CAST(113.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (75, 17, 48, CAST(108.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (75, 35, 46, CAST(100.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (75, 53, 49, CAST(44.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 6, 33, CAST(119.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 15, 26, CAST(109.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 28, 48, CAST(101.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 30, 41, CAST(59.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 40, 29, CAST(150.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 52, 47, CAST(102.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 65, 28, CAST(121.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 68, 37, CAST(32.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 85, 22, CAST(89.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 88, 50, CAST(50.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 90, 29, CAST(56.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 103, 42, CAST(80.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 8, 33, CAST(166.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 11, 47, CAST(145.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 13, 50, CAST(160.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 26, 20, CAST(139.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 49, 36, CAST(140.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 57, 27, CAST(55.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 81, 29, CAST(101.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 89, 22, CAST(62.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 94, 23, CAST(109.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 95, 38, CAST(52.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 39, 23, CAST(113.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 42, 29, CAST(92.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 51, 35, CAST(82.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 63, 50, CAST(115.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 72, 45, CAST(79.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 97, 24, CAST(58.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 99, 31, CAST(77.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 102, 32, CAST(64.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 106, 44, CAST(88.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 107, 24, CAST(83.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 110, 40, CAST(52.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 5, 24, CAST(131.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 22, 42, CAST(127.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 37, 41, CAST(70.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 48, 48, CAST(104.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 69, 34, CAST(67.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 75, 27, CAST(65.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 77, 21, CAST(68.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 79, 30, CAST(64.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 100, 34, CAST(86.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 101, 22, CAST(91.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 108, 45, CAST(68.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 109, 45, CAST(41.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 31, 24, CAST(82.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 60, 47, CAST(105.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 83, 27, CAST(66.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 86, 45, CAST(86.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 91, 24, CAST(63.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 93, 34, CAST(43.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 98, 23, CAST(75.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 104, 25, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 105, 39, CAST(80.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 1, 29, CAST(76.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 3, 42, CAST(99.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 4, 41, CAST(164.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 10, 40, CAST(131.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 32, 25, CAST(48.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 47, 21, CAST(59.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 54, 44, CAST(147.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 58, 48, CAST(98.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 62, 28, CAST(61.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 66, 35, CAST(60.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 84, 28, CAST(68.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 87, 34, CAST(33.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 92, 22, CAST(102.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 96, 21, CAST(74.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 7, 27, CAST(155.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 12, 28, CAST(113.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 14, 20, CAST(67.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 16, 36, CAST(107.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 18, 44, CAST(124.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 21, 42, CAST(124.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 24, 22, CAST(74.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 25, 21, CAST(129.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 34, 27, CAST(130.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 40, 45, CAST(147.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 43, 30, CAST(73.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 45, 22, CAST(120.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 46, 39, CAST(137.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 59, 34, CAST(45.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 71, 37, CAST(32.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 74, 23, CAST(54.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 78, 25, CAST(122.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 19, 25, CAST(83.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 20, 32, CAST(44.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 23, 44, CAST(159.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 27, 38, CAST(54.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 29, 20, CAST(105.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 33, 21, CAST(135.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 44, 33, CAST(86.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 50, 36, CAST(88.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 55, 44, CAST(61.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 56, 47, CAST(63.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 61, 39, CAST(31.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 64, 31, CAST(39.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 67, 36, CAST(87.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 70, 20, CAST(116.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 73, 33, CAST(73.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 76, 49, CAST(95.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 80, 23, CAST(34.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 2, 23, CAST(180.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 6, 28, CAST(127.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 9, 41, CAST(114.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 17, 21, CAST(108.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 35, 37, CAST(91.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 36, 39, CAST(51.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 38, 22, CAST(90.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 52, 21, CAST(118.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 53, 40, CAST(42.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 82, 47, CAST(81.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 90, 49, CAST(52.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 103, 23, CAST(85.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 15, 37, CAST(105.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 26, 46, CAST(145.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 28, 46, CAST(119.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 30, 44, CAST(60.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 40, 28, CAST(165.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 57, 31, CAST(57.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 65, 24, CAST(117.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 68, 42, CAST(30.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 81, 49, CAST(114.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 85, 46, CAST(84.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 88, 33, CAST(52.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 89, 48, CAST(59.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 94, 45, CAST(92.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 8, 21, CAST(195.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 11, 33, CAST(146.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 13, 43, CAST(147.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 39, 28, CAST(124.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 42, 49, CAST(94.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 49, 39, CAST(127.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 51, 47, CAST(87.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 63, 30, CAST(105.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 72, 33, CAST(83.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 95, 20, CAST(46.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 97, 21, CAST(64.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 99, 30, CAST(79.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 102, 39, CAST(61.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 106, 37, CAST(99.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 107, 22, CAST(93.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 110, 28, CAST(47.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 5, 26, CAST(108.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 22, 32, CAST(137.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 37, 32, CAST(73.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 48, 46, CAST(98.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 69, 22, CAST(60.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 75, 21, CAST(59.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 77, 36, CAST(68.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 100, 24, CAST(80.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 109, 28, CAST(42.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 31, 45, CAST(70.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 60, 46, CAST(96.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 79, 43, CAST(55.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 83, 33, CAST(64.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 91, 31, CAST(61.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 93, 41, CAST(39.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 98, 34, CAST(84.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 101, 44, CAST(95.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 105, 34, CAST(72.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 108, 44, CAST(70.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 1, 48, CAST(95.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 3, 38, CAST(111.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 4, 45, CAST(182.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 32, 32, CAST(52.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 58, 25, CAST(95.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 62, 40, CAST(61.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 86, 44, CAST(81.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 104, 29, CAST(96.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (90, 10, 28, CAST(138.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (91, 66, 42, CAST(58.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (91, 87, 46, CAST(38.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (91, 92, 42, CAST(89.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (91, 96, 40, CAST(67.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 7, 21, CAST(155.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 12, 40, CAST(104.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 14, 30, CAST(70.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 43, 36, CAST(75.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 45, 23, CAST(119.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 47, 43, CAST(60.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 54, 32, CAST(136.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 74, 48, CAST(53.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 84, 44, CAST(77.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 16, 27, CAST(99.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 18, 22, CAST(140.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 21, 29, CAST(100.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 24, 45, CAST(70.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 25, 47, CAST(128.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 34, 38, CAST(110.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 40, 26, CAST(137.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 46, 45, CAST(125.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 56, 37, CAST(72.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 59, 47, CAST(49.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 67, 46, CAST(86.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 70, 23, CAST(112.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 71, 30, CAST(33.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 73, 32, CAST(69.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 76, 46, CAST(93.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 78, 45, CAST(112.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 19, 28, CAST(92.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 20, 46, CAST(46.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 23, 21, CAST(153.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 27, 42, CAST(60.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 29, 44, CAST(115.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 33, 22, CAST(143.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 35, 28, CAST(87.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 36, 24, CAST(53.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 38, 23, CAST(97.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 44, 32, CAST(79.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 50, 24, CAST(92.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 55, 25, CAST(66.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 61, 26, CAST(32.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 64, 20, CAST(44.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 80, 22, CAST(38.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (94, 82, 20, CAST(92.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 2, 42, CAST(203.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 6, 26, CAST(134.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 9, 38, CAST(124.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 17, 21, CAST(103.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 30, 45, CAST(51.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 52, 32, CAST(113.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 53, 41, CAST(47.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 65, 49, CAST(112.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 85, 37, CAST(77.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 90, 39, CAST(61.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 103, 26, CAST(80.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 15, 49, CAST(118.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 26, 27, CAST(139.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 28, 35, CAST(112.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 40, 50, CAST(150.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 57, 44, CAST(54.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 68, 32, CAST(31.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 81, 34, CAST(95.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 88, 32, CAST(51.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 89, 33, CAST(59.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 94, 49, CAST(97.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 8, 47, CAST(203.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 11, 24, CAST(151.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 13, 38, CAST(147.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 39, 49, CAST(127.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 42, 35, CAST(81.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 49, 27, CAST(126.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 95, 46, CAST(56.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 99, 50, CAST(84.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 5, 45, CAST(118.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 37, 46, CAST(83.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 48, 22, CAST(85.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 51, 50, CAST(78.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 63, 41, CAST(109.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 72, 47, CAST(83.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 77, 22, CAST(67.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 97, 23, CAST(60.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 100, 24, CAST(78.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 102, 50, CAST(66.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 106, 27, CAST(100.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 107, 35, CAST(88.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 109, 29, CAST(39.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 110, 42, CAST(48.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (99, 22, 42, CAST(149.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (99, 69, 48, CAST(60.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (99, 75, 27, CAST(61.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (99, 79, 43, CAST(65.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (99, 101, 42, CAST(94.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (99, 108, 40, CAST(74.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (100, 93, 29, CAST(37.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (100, 98, 48, CAST(81.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (100, 105, 38, CAST(70.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (101, 31, 28, CAST(74.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (101, 60, 33, CAST(99.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (101, 83, 39, CAST(70.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (101, 86, 35, CAST(80.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (101, 91, 27, CAST(65.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (101, 104, 39, CAST(115.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 1, 22, CAST(82.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 3, 24, CAST(116.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 4, 49, CAST(191.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 10, 25, CAST(126.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 32, 30, CAST(48.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 58, 39, CAST(93.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 62, 25, CAST(66.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 47, 30, CAST(55.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 54, 43, CAST(124.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 66, 50, CAST(56.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 84, 50, CAST(75.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 87, 27, CAST(33.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 92, 31, CAST(81.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 96, 40, CAST(79.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 7, 20, CAST(161.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 12, 20, CAST(111.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 14, 44, CAST(63.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 16, 47, CAST(115.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 24, 45, CAST(73.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 40, 48, CAST(157.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 43, 33, CAST(66.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 45, 32, CAST(127.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 71, 21, CAST(33.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 74, 34, CAST(56.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 78, 47, CAST(140.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 18, 42, CAST(114.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 21, 40, CAST(113.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 23, 33, CAST(153.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 25, 38, CAST(133.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 27, 23, CAST(59.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 29, 26, CAST(119.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 34, 27, CAST(106.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 46, 35, CAST(132.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 50, 29, CAST(83.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 55, 45, CAST(69.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 56, 20, CAST(69.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 59, 45, CAST(46.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 67, 47, CAST(79.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 70, 42, CAST(112.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 73, 40, CAST(84.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 76, 48, CAST(104.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 80, 39, CAST(34.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (106, 19, 36, CAST(98.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (106, 20, 48, CAST(45.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (106, 33, 40, CAST(138.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (106, 61, 32, CAST(27.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (106, 64, 24, CAST(36.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 2, 47, CAST(203.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 9, 28, CAST(109.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 17, 34, CAST(115.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 35, 37, CAST(98.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 36, 28, CAST(51.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 38, 30, CAST(102.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 44, 28, CAST(99.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 53, 21, CAST(45.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 82, 33, CAST(95.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 90, 36, CAST(54.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 103, 33, CAST(89.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 6, 31, CAST(125.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 15, 34, CAST(95.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 26, 44, CAST(140.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 28, 43, CAST(109.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 30, 37, CAST(60.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 40, 25, CAST(140.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 49, 40, CAST(143.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 52, 47, CAST(119.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 57, 49, CAST(57.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 65, 46, CAST(127.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 68, 42, CAST(30.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 81, 28, CAST(108.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 85, 49, CAST(84.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 88, 27, CAST(51.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 89, 45, CAST(55.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 94, 28, CAST(106.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 8, 46, CAST(176.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 11, 26, CAST(128.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 13, 20, CAST(152.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 39, 24, CAST(117.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 42, 48, CAST(96.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 51, 45, CAST(72.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 63, 35, CAST(122.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 72, 20, CAST(80.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 95, 30, CAST(57.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 97, 38, CAST(56.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 99, 40, CAST(73.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 102, 46, CAST(63.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 106, 37, CAST(95.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 107, 33, CAST(95.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 110, 42, CAST(48.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 5, 39, CAST(129.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 37, 28, CAST(82.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 48, 20, CAST(97.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 69, 43, CAST(66.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 75, 36, CAST(56.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 77, 22, CAST(79.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 100, 33, CAST(90.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 109, 48, CAST(44.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 3, 23, CAST(112.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 4, 34, CAST(189.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 22, 31, CAST(141.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 31, 50, CAST(68.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 32, 40, CAST(51.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 60, 27, CAST(100.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 62, 30, CAST(63.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 79, 29, CAST(56.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 83, 40, CAST(68.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 86, 46, CAST(84.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 91, 39, CAST(57.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 93, 43, CAST(43.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 98, 21, CAST(87.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 101, 26, CAST(93.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 104, 25, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 105, 31, CAST(64.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 108, 42, CAST(60.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 1, 41, CAST(90.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 7, 41, CAST(171.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 10, 36, CAST(126.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 14, 28, CAST(79.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 43, 35, CAST(73.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 45, 28, CAST(138.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 47, 46, CAST(60.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 54, 41, CAST(148.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 58, 25, CAST(109.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 66, 21, CAST(62.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 74, 48, CAST(52.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 84, 22, CAST(80.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 87, 41, CAST(39.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 92, 37, CAST(94.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 96, 40, CAST(70.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 12, 39, CAST(99.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 16, 33, CAST(110.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 18, 29, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 21, 38, CAST(105.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 24, 20, CAST(64.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 25, 41, CAST(133.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 34, 40, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 40, 40, CAST(155.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 46, 45, CAST(115.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 56, 41, CAST(61.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 59, 45, CAST(43.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 67, 45, CAST(81.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 71, 34, CAST(37.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 73, 27, CAST(77.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 76, 46, CAST(100.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 78, 49, CAST(117.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (114, 50, 38, CAST(84.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (114, 55, 25, CAST(58.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (114, 70, 27, CAST(97.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 23, 30, CAST(166.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 27, 21, CAST(53.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 29, 27, CAST(125.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 33, 50, CAST(167.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 61, 20, CAST(32.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 64, 49, CAST(39.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 80, 44, CAST(38.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 2, 35, CAST(205.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 17, 46, CAST(100.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 19, 27, CAST(92.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 20, 33, CAST(53.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 35, 49, CAST(97.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 36, 31, CAST(56.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 38, 49, CAST(89.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 44, 41, CAST(84.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 53, 46, CAST(42.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 82, 39, CAST(94.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (117, 9, 43, CAST(133.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 6, 48, CAST(132.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 30, 35, CAST(58.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 52, 38, CAST(118.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 65, 28, CAST(103.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 85, 21, CAST(78.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 90, 39, CAST(56.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 103, 31, CAST(90.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (119, 28, 22, CAST(110.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (119, 40, 34, CAST(152.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (120, 15, 48, CAST(94.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (120, 26, 43, CAST(132.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (120, 68, 21, CAST(31.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (120, 88, 35, CAST(47.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 8, 32, CAST(189.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 11, 30, CAST(151.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 13, 27, CAST(166.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 49, 50, CAST(126.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 57, 26, CAST(48.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 81, 37, CAST(101.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 89, 20, CAST(49.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 94, 37, CAST(92.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 95, 30, CAST(56.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (122, 39, 33, CAST(133.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (122, 42, 23, CAST(89.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (122, 51, 39, CAST(84.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (122, 63, 49, CAST(113.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (122, 99, 23, CAST(69.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 5, 49, CAST(133.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 22, 49, CAST(137.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 37, 49, CAST(79.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 48, 45, CAST(88.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 69, 32, CAST(56.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 72, 47, CAST(74.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 75, 43, CAST(61.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 77, 46, CAST(77.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 79, 48, CAST(55.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 97, 31, CAST(58.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 100, 26, CAST(80.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 101, 37, CAST(90.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 102, 36, CAST(69.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 106, 38, CAST(84.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 107, 31, CAST(81.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 108, 43, CAST(66.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 109, 31, CAST(45.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 110, 36, CAST(48.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 1, 37, CAST(80.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 3, 47, CAST(110.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 4, 49, CAST(189.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 31, 47, CAST(67.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 32, 28, CAST(58.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 58, 32, CAST(104.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 60, 34, CAST(87.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 62, 38, CAST(60.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 83, 23, CAST(68.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 86, 21, CAST(90.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 91, 20, CAST(66.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 93, 41, CAST(41.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 98, 25, CAST(84.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 104, 29, CAST(113.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (124, 105, 26, CAST(79.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (125, 10, 43, CAST(141.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (125, 47, 38, CAST(57.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (125, 66, 37, CAST(60.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (125, 87, 43, CAST(37.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (125, 92, 30, CAST(94.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (125, 96, 50, CAST(81.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 7, 27, CAST(157.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 12, 25, CAST(101.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 14, 37, CAST(64.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 16, 21, CAST(100.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 18, 32, CAST(116.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 24, 47, CAST(71.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 40, 43, CAST(162.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 43, 37, CAST(69.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 45, 27, CAST(119.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 54, 35, CAST(135.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 71, 42, CAST(34.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 74, 24, CAST(51.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 78, 40, CAST(130.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 84, 46, CAST(77.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 21, 38, CAST(108.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 25, 24, CAST(129.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 34, 24, CAST(125.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 46, 46, CAST(122.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 56, 21, CAST(65.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 59, 36, CAST(47.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 76, 48, CAST(95.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 19, 25, CAST(85.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 20, 31, CAST(50.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 23, 26, CAST(136.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 27, 28, CAST(59.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 29, 46, CAST(118.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 33, 29, CAST(146.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 44, 33, CAST(99.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 50, 34, CAST(87.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 55, 37, CAST(70.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 61, 42, CAST(27.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 64, 24, CAST(39.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 67, 47, CAST(84.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 70, 33, CAST(102.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 73, 40, CAST(78.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 80, 27, CAST(34.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (129, 2, 29, CAST(214.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (129, 17, 32, CAST(100.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (129, 35, 24, CAST(101.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (129, 36, 45, CAST(57.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (129, 38, 31, CAST(100.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (129, 82, 33, CAST(84.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 6, 50, CAST(138.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 9, 25, CAST(110.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 15, 36, CAST(95.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 28, 26, CAST(104.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 30, 28, CAST(53.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 40, 22, CAST(157.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 52, 41, CAST(119.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 53, 39, CAST(43.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 65, 48, CAST(115.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 68, 33, CAST(34.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 85, 25, CAST(78.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 88, 23, CAST(49.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 90, 30, CAST(52.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 103, 50, CAST(91.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 11, 43, CAST(128.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 26, 49, CAST(153.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 49, 42, CAST(142.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 57, 36, CAST(47.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 81, 45, CAST(99.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 89, 46, CAST(59.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 94, 34, CAST(100.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 95, 43, CAST(57.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (132, 8, 42, CAST(193.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (132, 13, 49, CAST(147.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 39, 22, CAST(133.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 42, 48, CAST(97.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 51, 23, CAST(78.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 63, 46, CAST(113.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 99, 26, CAST(84.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 106, 48, CAST(86.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 107, 35, CAST(81.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 110, 24, CAST(48.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (134, 72, 40, CAST(70.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (134, 97, 36, CAST(66.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (134, 102, 29, CAST(67.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 5, 48, CAST(118.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 22, 50, CAST(146.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 37, 48, CAST(84.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 48, 39, CAST(85.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 69, 44, CAST(67.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 75, 25, CAST(65.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 77, 31, CAST(78.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 100, 29, CAST(83.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 109, 40, CAST(45.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 31, 24, CAST(81.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 60, 23, CAST(89.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 79, 33, CAST(55.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 83, 40, CAST(63.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 86, 41, CAST(90.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 91, 34, CAST(66.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 93, 41, CAST(37.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 98, 25, CAST(88.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 101, 38, CAST(92.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 104, 25, CAST(116.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 105, 32, CAST(73.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 108, 34, CAST(70.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (137, 3, 22, CAST(105.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (137, 32, 23, CAST(52.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (137, 62, 36, CAST(65.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 1, 23, CAST(91.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 4, 39, CAST(158.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 10, 32, CAST(129.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 47, 26, CAST(49.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 58, 20, CAST(109.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 66, 26, CAST(62.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 87, 26, CAST(35.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 92, 27, CAST(94.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 96, 20, CAST(78.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 7, 28, CAST(161.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 12, 29, CAST(104.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 14, 20, CAST(73.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 43, 41, CAST(68.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 45, 49, CAST(144.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 54, 44, CAST(120.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 74, 47, CAST(53.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 84, 22, CAST(67.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (140, 16, 21, CAST(100.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (140, 24, 46, CAST(70.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (140, 40, 47, CAST(135.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (140, 71, 20, CAST(32.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (140, 78, 29, CAST(133.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (141, 18, 41, CAST(125.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (141, 25, 37, CAST(136.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (141, 46, 37, CAST(134.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 21, 21, CAST(119.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 23, 41, CAST(153.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 27, 33, CAST(55.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 34, 44, CAST(126.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 50, 42, CAST(77.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 55, 30, CAST(62.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 56, 22, CAST(72.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 59, 21, CAST(47.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 67, 47, CAST(89.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 70, 28, CAST(117.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 73, 26, CAST(69.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 76, 27, CAST(107.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (143, 80, 46, CAST(36.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (144, 29, 47, CAST(111.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (144, 61, 33, CAST(30.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 19, 40, CAST(99.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 20, 20, CAST(48.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 33, 43, CAST(141.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 35, 30, CAST(87.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 36, 24, CAST(54.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 38, 29, CAST(85.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 44, 36, CAST(87.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 64, 39, CAST(42.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 82, 40, CAST(97.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 2, 34, CAST(195.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 6, 28, CAST(147.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 9, 38, CAST(120.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 17, 29, CAST(114.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 52, 21, CAST(111.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 53, 45, CAST(48.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 85, 37, CAST(81.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 90, 44, CAST(54.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 103, 44, CAST(81.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 15, 46, CAST(99.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 26, 40, CAST(144.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 28, 22, CAST(100.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 30, 30, CAST(57.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 40, 36, CAST(145.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 57, 44, CAST(46.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 65, 29, CAST(118.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 68, 49, CAST(34.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 81, 46, CAST(100.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 88, 35, CAST(45.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 94, 22, CAST(113.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (148, 8, 44, CAST(195.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (148, 11, 25, CAST(140.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (148, 13, 27, CAST(167.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (148, 49, 48, CAST(143.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (148, 89, 40, CAST(58.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (148, 95, 49, CAST(51.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 5, 20, CAST(126.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 37, 21, CAST(80.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 39, 32, CAST(133.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 42, 42, CAST(95.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 51, 42, CAST(87.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 63, 48, CAST(122.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 72, 30, CAST(85.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 77, 23, CAST(83.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 97, 36, CAST(66.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 99, 40, CAST(81.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 102, 32, CAST(69.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 106, 30, CAST(84.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 107, 35, CAST(92.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 110, 23, CAST(53.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (150, 48, 46, CAST(88.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (150, 69, 20, CAST(54.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (150, 75, 25, CAST(65.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (150, 100, 40, CAST(85.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (150, 109, 32, CAST(49.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 22, 45, CAST(148.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 31, 27, CAST(84.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 60, 31, CAST(95.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 62, 32, CAST(63.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 79, 40, CAST(61.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 83, 37, CAST(72.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 86, 31, CAST(99.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 91, 50, CAST(62.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 93, 36, CAST(36.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 98, 31, CAST(91.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 101, 35, CAST(90.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 104, 44, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 105, 44, CAST(76.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 108, 38, CAST(65.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (152, 1, 59, CAST(93.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (152, 3, 44, CAST(115.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (152, 4, 43, CAST(172.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (152, 10, 46, CAST(129.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (152, 32, 44, CAST(58.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (152, 58, 50, CAST(91.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 43, 20, CAST(74.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 45, 41, CAST(145.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 47, 31, CAST(50.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 54, 26, CAST(127.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 66, 47, CAST(63.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 84, 38, CAST(69.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 87, 36, CAST(36.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 92, 25, CAST(93.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 96, 48, CAST(72.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 7, 24, CAST(157.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 12, 22, CAST(102.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 14, 25, CAST(67.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 16, 41, CAST(109.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 18, 26, CAST(130.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 21, 24, CAST(103.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 24, 23, CAST(67.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 25, 33, CAST(130.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 34, 37, CAST(114.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 40, 40, CAST(145.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 46, 31, CAST(139.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 71, 40, CAST(34.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 74, 24, CAST(50.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 78, 39, CAST(115.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 23, 49, CAST(137.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 27, 36, CAST(55.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 29, 41, CAST(102.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 50, 34, CAST(80.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 55, 30, CAST(59.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 56, 34, CAST(66.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 59, 32, CAST(43.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 61, 38, CAST(28.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 67, 31, CAST(85.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 70, 33, CAST(111.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 73, 42, CAST(69.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 76, 49, CAST(101.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 80, 20, CAST(39.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (156, 33, 24, CAST(135.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (156, 64, 37, CAST(37.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (157, 19, 34, CAST(93.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (157, 20, 29, CAST(52.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (158, 35, 50, CAST(92.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (158, 36, 49, CAST(59.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (158, 38, 37, CAST(83.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (158, 44, 26, CAST(91.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (158, 82, 46, CAST(81.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (159, 2, 32, CAST(177.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (159, 9, 41, CAST(133.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (159, 17, 41, CAST(113.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (159, 53, 21, CAST(49.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (159, 90, 20, CAST(62.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (159, 103, 45, CAST(86.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 6, 26, CAST(121.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 15, 46, CAST(117.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 26, 30, CAST(134.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 28, 34, CAST(120.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 30, 30, CAST(59.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 40, 27, CAST(152.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 52, 41, CAST(107.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 57, 28, CAST(46.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 65, 47, CAST(121.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 68, 31, CAST(31.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 85, 45, CAST(95.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 88, 40, CAST(45.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 94, 29, CAST(105.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 8, 46, CAST(180.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 11, 30, CAST(140.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 13, 44, CAST(169.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 39, 32, CAST(121.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 42, 29, CAST(92.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 49, 23, CAST(137.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 81, 23, CAST(117.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 89, 27, CAST(55.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 95, 21, CAST(56.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 99, 33, CAST(80.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 5, 27, CAST(116.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 51, 20, CAST(80.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 63, 36, CAST(105.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 72, 22, CAST(79.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 97, 34, CAST(64.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 102, 44, CAST(58.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 106, 25, CAST(89.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 107, 50, CAST(88.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 110, 29, CAST(43.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 22, 49, CAST(157.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 37, 32, CAST(81.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 48, 34, CAST(85.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 60, 34, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 69, 24, CAST(63.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 75, 46, CAST(65.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 77, 49, CAST(82.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 79, 48, CAST(58.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 91, 40, CAST(63.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 93, 49, CAST(35.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 98, 40, CAST(87.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 100, 44, CAST(83.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 101, 33, CAST(81.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 105, 27, CAST(64.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 108, 35, CAST(64.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 109, 21, CAST(41.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 1, 34, CAST(89.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 3, 40, CAST(107.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 4, 41, CAST(193.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 10, 48, CAST(123.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 31, 33, CAST(67.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 32, 34, CAST(50.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 58, 42, CAST(109.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 62, 37, CAST(67.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 83, 24, CAST(59.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 86, 31, CAST(93.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 104, 47, CAST(117.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 47, 48, CAST(58.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 54, 20, CAST(124.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 66, 37, CAST(61.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 84, 47, CAST(75.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 87, 20, CAST(39.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 92, 34, CAST(100.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 96, 47, CAST(67.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (166, 43, 45, CAST(74.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (166, 45, 49, CAST(123.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 7, 44, CAST(188.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 12, 22, CAST(110.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 14, 35, CAST(67.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 16, 40, CAST(112.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 18, 21, CAST(131.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 21, 36, CAST(99.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 24, 33, CAST(77.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 25, 49, CAST(139.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 34, 20, CAST(113.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 40, 29, CAST(137.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 46, 33, CAST(127.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 59, 28, CAST(40.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 71, 34, CAST(35.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 74, 47, CAST(56.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 78, 24, CAST(119.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (168, 55, 36, CAST(71.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (168, 56, 40, CAST(72.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (168, 67, 38, CAST(76.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (168, 70, 43, CAST(93.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (168, 73, 44, CAST(83.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (168, 76, 43, CAST(98.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 19, 49, CAST(93.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 20, 26, CAST(45.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 23, 34, CAST(164.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 27, 31, CAST(60.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 29, 50, CAST(124.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 33, 35, CAST(148.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 44, 39, CAST(96.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 50, 35, CAST(84.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 61, 33, CAST(31.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 64, 40, CAST(36.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 80, 30, CAST(37.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (170, 36, 32, CAST(57.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (170, 82, 48, CAST(95.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 2, 21, CAST(171.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 6, 32, CAST(124.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 9, 28, CAST(135.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 17, 43, CAST(94.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 35, 31, CAST(81.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 38, 38, CAST(85.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 52, 38, CAST(107.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 53, 44, CAST(40.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 85, 32, CAST(93.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 90, 21, CAST(52.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (171, 103, 46, CAST(101.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 15, 31, CAST(99.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 26, 50, CAST(147.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 28, 50, CAST(121.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 30, 25, CAST(59.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 40, 20, CAST(169.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 57, 45, CAST(49.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 65, 43, CAST(122.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 68, 38, CAST(28.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 81, 22, CAST(110.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 88, 35, CAST(51.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 94, 34, CAST(93.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (173, 8, 35, CAST(187.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (173, 11, 27, CAST(123.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (173, 13, 39, CAST(148.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (173, 49, 25, CAST(126.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (173, 89, 45, CAST(56.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (173, 95, 43, CAST(53.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 5, 30, CAST(136.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 37, 34, CAST(84.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 39, 40, CAST(117.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 42, 47, CAST(87.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 48, 50, CAST(105.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 51, 33, CAST(72.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 63, 22, CAST(103.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 72, 27, CAST(84.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 77, 48, CAST(83.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 97, 21, CAST(66.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 99, 21, CAST(77.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 102, 42, CAST(57.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 106, 40, CAST(91.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 107, 26, CAST(89.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 110, 37, CAST(51.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (175, 22, 41, CAST(129.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (175, 69, 40, CAST(56.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (175, 75, 24, CAST(65.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (175, 100, 24, CAST(75.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (175, 109, 32, CAST(49.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 1, 45, CAST(81.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 3, 22, CAST(115.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 4, 36, CAST(154.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 31, 35, CAST(70.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 32, 37, CAST(52.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 58, 21, CAST(105.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 60, 25, CAST(97.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 62, 30, CAST(61.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 79, 41, CAST(58.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 83, 27, CAST(67.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 86, 23, CAST(89.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 91, 28, CAST(58.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 93, 38, CAST(40.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 98, 32, CAST(85.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 101, 39, CAST(82.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 104, 48, CAST(102.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 105, 43, CAST(72.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 108, 31, CAST(59.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 7, 50, CAST(184.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 10, 43, CAST(150.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 12, 47, CAST(104.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 14, 38, CAST(67.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 43, 38, CAST(78.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 45, 30, CAST(139.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 47, 33, CAST(54.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 54, 48, CAST(120.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 66, 46, CAST(61.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 74, 20, CAST(58.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 84, 48, CAST(67.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 87, 27, CAST(35.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 92, 38, CAST(94.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 96, 21, CAST(67.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (178, 16, 28, CAST(93.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 18, 34, CAST(114.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 21, 23, CAST(107.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 24, 29, CAST(73.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 25, 29, CAST(118.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 34, 39, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 40, 42, CAST(167.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 46, 31, CAST(114.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 59, 35, CAST(48.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 71, 31, CAST(37.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 78, 25, CAST(136.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (180, 55, 26, CAST(68.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (180, 56, 32, CAST(68.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (180, 67, 49, CAST(76.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (180, 70, 48, CAST(106.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (180, 73, 33, CAST(78.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (180, 76, 48, CAST(95.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 2, 34, CAST(205.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 17, 24, CAST(98.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 19, 50, CAST(87.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 20, 27, CAST(47.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 23, 26, CAST(161.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 27, 25, CAST(53.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 29, 37, CAST(109.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 33, 22, CAST(158.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 35, 46, CAST(82.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 36, 43, CAST(54.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 38, 29, CAST(102.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 44, 34, CAST(99.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 50, 35, CAST(77.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 61, 20, CAST(29.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 64, 45, CAST(36.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 80, 33, CAST(35.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 82, 21, CAST(79.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 6, 44, CAST(132.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 9, 25, CAST(127.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 15, 41, CAST(98.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 28, 48, CAST(114.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 30, 29, CAST(56.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 40, 25, CAST(135.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 52, 25, CAST(96.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 53, 44, CAST(42.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 65, 25, CAST(112.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 68, 20, CAST(33.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 85, 29, CAST(80.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 88, 31, CAST(44.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 90, 36, CAST(59.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 103, 27, CAST(89.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 8, 41, CAST(176.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 11, 27, CAST(142.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 13, 24, CAST(169.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 26, 23, CAST(147.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 39, 43, CAST(122.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 42, 36, CAST(88.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 49, 31, CAST(132.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 57, 29, CAST(49.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 81, 39, CAST(96.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 89, 36, CAST(51.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 94, 38, CAST(114.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 95, 37, CAST(56.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 99, 43, CAST(77.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 5, 25, CAST(130.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 37, 21, CAST(78.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 48, 46, CAST(100.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 51, 34, CAST(71.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 63, 42, CAST(99.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 72, 34, CAST(80.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 77, 33, CAST(77.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 97, 45, CAST(62.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 100, 20, CAST(74.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 102, 47, CAST(68.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 106, 22, CAST(88.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 107, 38, CAST(85.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 109, 43, CAST(41.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 110, 33, CAST(49.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 22, 45, CAST(137.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 31, 31, CAST(68.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 60, 22, CAST(101.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 69, 30, CAST(65.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 75, 39, CAST(59.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 79, 21, CAST(65.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 83, 21, CAST(66.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 91, 50, CAST(60.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 93, 33, CAST(35.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 98, 24, CAST(87.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 101, 45, CAST(95.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 105, 25, CAST(68.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 108, 32, CAST(73.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 1, 36, CAST(95.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 3, 47, CAST(110.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 4, 27, CAST(166.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 10, 49, CAST(131.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 32, 20, CAST(50.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 58, 34, CAST(91.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 62, 39, CAST(61.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 66, 38, CAST(64.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 86, 37, CAST(82.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 87, 37, CAST(36.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 92, 26, CAST(100.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 96, 39, CAST(76.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 104, 45, CAST(102.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (187, 47, 38, CAST(51.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 7, 21, CAST(190.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 12, 45, CAST(117.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 14, 41, CAST(74.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 16, 23, CAST(107.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 18, 41, CAST(113.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 24, 44, CAST(61.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 25, 24, CAST(123.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 34, 44, CAST(114.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 40, 36, CAST(137.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 43, 43, CAST(68.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 45, 40, CAST(127.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 46, 27, CAST(139.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 54, 34, CAST(119.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 71, 36, CAST(31.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 74, 20, CAST(58.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 78, 36, CAST(137.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 84, 40, CAST(79.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 21, 20, CAST(120.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 23, 32, CAST(168.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 27, 28, CAST(50.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 29, 31, CAST(102.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 50, 35, CAST(90.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 55, 23, CAST(57.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 56, 36, CAST(66.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 59, 50, CAST(49.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 61, 29, CAST(32.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 67, 35, CAST(81.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 70, 48, CAST(109.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 73, 34, CAST(76.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 76, 41, CAST(101.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 80, 33, CAST(37.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (190, 19, 38, CAST(92.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (190, 20, 24, CAST(44.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (190, 33, 43, CAST(141.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (190, 64, 45, CAST(41.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (191, 44, 26, CAST(80.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (191, 82, 45, CAST(83.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 2, 37, CAST(210.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 6, 30, CAST(141.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 9, 41, CAST(123.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 17, 41, CAST(96.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 30, 26, CAST(52.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 35, 47, CAST(99.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 36, 37, CAST(56.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 38, 23, CAST(93.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 52, 48, CAST(96.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 53, 29, CAST(45.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 65, 48, CAST(109.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 85, 26, CAST(82.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 90, 32, CAST(53.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 103, 28, CAST(86.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 15, 21, CAST(94.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 26, 26, CAST(140.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 28, 41, CAST(103.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 40, 21, CAST(147.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 49, 44, CAST(114.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 57, 40, CAST(48.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 68, 39, CAST(34.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 81, 27, CAST(113.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 88, 50, CAST(54.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 89, 31, CAST(59.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 94, 41, CAST(113.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 95, 35, CAST(49.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 8, 46, CAST(187.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 11, 24, CAST(129.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 13, 45, CAST(171.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 39, 24, CAST(110.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 42, 22, CAST(91.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 51, 49, CAST(72.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 63, 21, CAST(111.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 99, 29, CAST(77.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 110, 32, CAST(51.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (195, 107, 45, CAST(98.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (196, 5, 24, CAST(136.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (196, 72, 46, CAST(84.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (196, 97, 26, CAST(62.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (196, 102, 44, CAST(71.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (196, 106, 34, CAST(93.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 22, 36, CAST(146.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 37, 21, CAST(69.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 48, 22, CAST(105.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 69, 21, CAST(60.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 75, 31, CAST(63.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 77, 22, CAST(83.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 79, 32, CAST(63.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 93, 26, CAST(41.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 98, 42, CAST(75.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 100, 34, CAST(89.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 101, 24, CAST(96.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 105, 22, CAST(74.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 108, 47, CAST(61.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 109, 21, CAST(46.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 31, 25, CAST(81.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 60, 32, CAST(107.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 62, 32, CAST(70.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 83, 23, CAST(71.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 86, 26, CAST(88.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 91, 28, CAST(63.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 104, 35, CAST(111.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (199, 3, 39, CAST(105.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (199, 32, 32, CAST(60.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 1, 23, CAST(76.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 4, 29, CAST(164.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 10, 24, CAST(123.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 47, 39, CAST(62.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 54, 49, CAST(119.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 58, 47, CAST(107.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 66, 33, CAST(58.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 84, 32, CAST(66.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 87, 24, CAST(36.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 92, 38, CAST(84.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 96, 44, CAST(77.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 7, 33, CAST(184.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 12, 29, CAST(116.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 14, 22, CAST(76.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 16, 23, CAST(95.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 24, 41, CAST(63.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 43, 49, CAST(65.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 45, 23, CAST(144.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 74, 31, CAST(52.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 18, 37, CAST(114.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 21, 32, CAST(118.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 25, 47, CAST(119.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 34, 22, CAST(113.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 40, 23, CAST(135.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 46, 39, CAST(137.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 56, 27, CAST(64.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 59, 22, CAST(40.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 71, 48, CAST(32.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 76, 22, CAST(86.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 78, 50, CAST(122.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (203, 23, 43, CAST(166.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (203, 50, 38, CAST(82.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (203, 55, 23, CAST(70.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (203, 67, 49, CAST(75.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (203, 70, 45, CAST(104.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (203, 73, 48, CAST(74.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (204, 27, 46, CAST(56.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (204, 80, 24, CAST(35.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 2, 47, CAST(201.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 9, 39, CAST(117.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 17, 46, CAST(106.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 19, 37, CAST(95.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 20, 37, CAST(46.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 29, 24, CAST(102.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 33, 20, CAST(141.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 35, 46, CAST(98.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 36, 24, CAST(54.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 38, 26, CAST(90.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 44, 38, CAST(95.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 53, 34, CAST(44.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 61, 23, CAST(29.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 64, 44, CAST(42.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 82, 33, CAST(80.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 90, 36, CAST(52.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 103, 40, CAST(80.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 6, 38, CAST(130.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 15, 38, CAST(107.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 26, 27, CAST(132.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 28, 36, CAST(117.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 30, 41, CAST(58.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 40, 37, CAST(160.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 52, 22, CAST(112.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 57, 45, CAST(48.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 65, 24, CAST(107.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 68, 48, CAST(30.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 81, 36, CAST(118.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 85, 28, CAST(94.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 88, 40, CAST(48.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 94, 42, CAST(109.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 8, 31, CAST(182.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 11, 34, CAST(145.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 13, 20, CAST(145.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 39, 32, CAST(114.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 42, 40, CAST(83.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 49, 23, CAST(126.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 51, 39, CAST(85.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 63, 29, CAST(109.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 72, 31, CAST(76.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 89, 46, CAST(60.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 95, 34, CAST(51.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 97, 50, CAST(61.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 99, 38, CAST(73.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 102, 43, CAST(62.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 106, 32, CAST(99.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 107, 30, CAST(87.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 110, 35, CAST(48.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 5, 22, CAST(118.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 22, 39, CAST(135.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 37, 31, CAST(71.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 48, 48, CAST(92.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 69, 25, CAST(58.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 75, 22, CAST(64.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 77, 22, CAST(75.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 100, 34, CAST(81.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 109, 34, CAST(44.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 3, 34, CAST(115.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 4, 20, CAST(187.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 31, 27, CAST(81.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 32, 34, CAST(48.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 60, 31, CAST(99.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 62, 47, CAST(68.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 79, 43, CAST(58.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 83, 44, CAST(71.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 86, 24, CAST(99.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 91, 46, CAST(61.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 93, 47, CAST(37.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 98, 21, CAST(73.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 101, 35, CAST(88.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 104, 31, CAST(100.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 105, 21, CAST(79.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 108, 39, CAST(62.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (210, 1, 41, CAST(94.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (210, 10, 26, CAST(144.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (210, 58, 21, CAST(96.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (210, 66, 24, CAST(59.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (210, 92, 50, CAST(93.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (210, 96, 28, CAST(74.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 7, 33, CAST(165.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 12, 24, CAST(105.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 14, 49, CAST(77.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 16, 25, CAST(101.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 18, 37, CAST(128.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 24, 20, CAST(66.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 25, 24, CAST(129.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 40, 48, CAST(159.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 43, 27, CAST(70.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 45, 49, CAST(122.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 47, 42, CAST(59.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 54, 40, CAST(133.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 71, 33, CAST(33.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 74, 38, CAST(50.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 78, 45, CAST(139.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 84, 49, CAST(75.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 87, 36, CAST(38.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 21, 29, CAST(124.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 34, 43, CAST(114.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 46, 32, CAST(134.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 50, 41, CAST(92.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 55, 25, CAST(66.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 56, 26, CAST(70.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 59, 45, CAST(48.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 67, 28, CAST(89.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 70, 43, CAST(116.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 73, 25, CAST(85.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 76, 46, CAST(91.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 2, 48, CAST(214.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 17, 32, CAST(101.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 19, 43, CAST(102.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 20, 25, CAST(43.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 23, 48, CAST(146.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 27, 30, CAST(48.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 29, 31, CAST(111.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 33, 25, CAST(150.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 35, 37, CAST(91.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 36, 35, CAST(54.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 38, 38, CAST(93.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 44, 33, CAST(84.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 53, 39, CAST(44.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 61, 39, CAST(27.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 64, 23, CAST(43.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 80, 31, CAST(40.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 82, 44, CAST(96.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 6, 40, CAST(141.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 9, 21, CAST(131.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 28, 29, CAST(109.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 30, 34, CAST(52.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 40, 25, CAST(143.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 52, 28, CAST(110.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 65, 42, CAST(102.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 85, 27, CAST(96.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 88, 38, CAST(48.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 90, 34, CAST(55.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 103, 30, CAST(96.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 8, 38, CAST(176.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 11, 46, CAST(125.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 13, 36, CAST(169.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 15, 45, CAST(95.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 26, 42, CAST(135.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 39, 20, CAST(129.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 42, 23, CAST(84.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 49, 29, CAST(129.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 57, 44, CAST(51.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 68, 39, CAST(31.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 81, 38, CAST(111.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 89, 35, CAST(58.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 94, 28, CAST(115.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 95, 38, CAST(50.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 99, 23, CAST(83.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 51, 36, CAST(78.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 63, 35, CAST(111.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 72, 24, CAST(78.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 97, 41, CAST(60.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 106, 31, CAST(99.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 107, 37, CAST(88.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 110, 40, CAST(51.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 5, 33, CAST(126.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 22, 27, CAST(140.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 37, 21, CAST(72.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 48, 47, CAST(89.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 60, 25, CAST(93.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 69, 34, CAST(67.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 75, 47, CAST(55.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 77, 25, CAST(77.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 79, 30, CAST(67.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 91, 24, CAST(59.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 93, 34, CAST(36.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 98, 34, CAST(74.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 100, 45, CAST(73.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 101, 23, CAST(85.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 102, 48, CAST(67.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 105, 48, CAST(77.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 108, 44, CAST(68.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 109, 34, CAST(43.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (218, 83, 35, CAST(69.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 1, 46, CAST(84.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 3, 45, CAST(102.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 4, 37, CAST(189.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 31, 31, CAST(81.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 32, 42, CAST(49.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 58, 48, CAST(93.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 62, 26, CAST(60.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 86, 47, CAST(81.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 104, 50, CAST(102.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 10, 30, CAST(134.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 43, 46, CAST(77.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 47, 44, CAST(54.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 54, 45, CAST(120.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 66, 31, CAST(65.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 84, 43, CAST(78.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 87, 29, CAST(35.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 92, 22, CAST(96.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 96, 45, CAST(79.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (221, 7, 31, CAST(184.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (221, 12, 35, CAST(102.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (221, 14, 38, CAST(63.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (221, 45, 25, CAST(139.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (221, 74, 26, CAST(60.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 16, 24, CAST(105.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 18, 41, CAST(123.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 21, 44, CAST(120.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 24, 37, CAST(73.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 25, 25, CAST(142.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 34, 27, CAST(126.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 40, 33, CAST(164.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 46, 28, CAST(138.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 56, 30, CAST(68.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 59, 48, CAST(42.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 67, 30, CAST(74.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 71, 37, CAST(31.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 73, 39, CAST(81.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 76, 21, CAST(103.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 78, 26, CAST(137.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 2, 40, CAST(180.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 6, 46, CAST(141.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 9, 27, CAST(136.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 17, 22, CAST(101.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 19, 43, CAST(92.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 20, 41, CAST(44.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 29, 50, CAST(120.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 30, 35, CAST(57.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 33, 36, CAST(158.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 35, 33, CAST(100.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 36, 41, CAST(54.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 38, 48, CAST(90.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 61, 20, CAST(26.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 64, 30, CAST(40.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (224, 44, 33, CAST(88.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (224, 52, 47, CAST(96.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 11, 27, CAST(148.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 15, 26, CAST(100.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 26, 47, CAST(142.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 28, 33, CAST(105.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 40, 27, CAST(137.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 49, 49, CAST(120.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 53, 38, CAST(49.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 57, 25, CAST(49.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 65, 31, CAST(107.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 68, 30, CAST(29.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 82, 33, CAST(95.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 85, 20, CAST(91.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 90, 48, CAST(60.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 103, 34, CAST(80.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 5, 47, CAST(111.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 8, 42, CAST(193.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 13, 24, CAST(166.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 39, 24, CAST(114.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 81, 44, CAST(114.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 88, 38, CAST(44.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 89, 28, CAST(55.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 94, 38, CAST(99.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 95, 44, CAST(56.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (227, 42, 32, CAST(94.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (227, 51, 50, CAST(73.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (227, 63, 41, CAST(120.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (227, 72, 41, CAST(86.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (227, 77, 20, CAST(81.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (227, 97, 39, CAST(60.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 22, 25, CAST(154.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 31, 45, CAST(74.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 37, 25, CAST(74.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 99, 20, CAST(79.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 102, 21, CAST(65.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 106, 43, CAST(85.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 107, 37, CAST(83.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 110, 37, CAST(48.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 48, 34, CAST(104.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 60, 47, CAST(87.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 69, 48, CAST(67.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 75, 20, CAST(56.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 79, 35, CAST(55.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 83, 43, CAST(69.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 91, 24, CAST(57.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 93, 34, CAST(42.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 98, 27, CAST(84.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 100, 41, CAST(75.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 101, 37, CAST(95.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 104, 33, CAST(117.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 105, 33, CAST(71.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 108, 39, CAST(69.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 1, 42, CAST(80.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 3, 20, CAST(109.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 4, 26, CAST(164.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 7, 41, CAST(182.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 10, 24, CAST(128.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 12, 46, CAST(117.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 14, 33, CAST(74.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 16, 39, CAST(102.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 24, 29, CAST(66.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 32, 38, CAST(55.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 43, 38, CAST(65.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 58, 30, CAST(104.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 62, 37, CAST(71.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 86, 45, CAST(80.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 109, 44, CAST(41.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (231, 45, 37, CAST(136.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (231, 47, 29, CAST(59.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (231, 54, 50, CAST(133.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (231, 66, 42, CAST(56.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 18, 46, CAST(120.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 21, 44, CAST(99.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 23, 44, CAST(154.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 25, 30, CAST(135.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 34, 26, CAST(130.68 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 40, 27, CAST(169.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 46, 26, CAST(132.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 71, 27, CAST(37.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 74, 25, CAST(55.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 78, 21, CAST(139.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 84, 41, CAST(70.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 87, 28, CAST(33.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 92, 32, CAST(100.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 96, 20, CAST(74.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 19, 46, CAST(89.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 20, 27, CAST(51.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 27, 38, CAST(53.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 29, 35, CAST(116.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 33, 24, CAST(138.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 36, 26, CAST(53.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 38, 40, CAST(100.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 50, 50, CAST(92.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 55, 21, CAST(70.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 56, 23, CAST(61.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 59, 20, CAST(47.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 61, 45, CAST(29.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 64, 26, CAST(43.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 67, 39, CAST(84.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 70, 44, CAST(108.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 73, 45, CAST(77.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 76, 31, CAST(94.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 80, 41, CAST(34.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 2, 26, CAST(188.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 9, 33, CAST(121.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 17, 29, CAST(110.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 35, 31, CAST(95.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 44, 46, CAST(95.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 53, 24, CAST(42.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 82, 39, CAST(95.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 90, 33, CAST(62.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (235, 6, 26, CAST(130.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (235, 28, 46, CAST(108.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (235, 30, 34, CAST(52.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (235, 40, 20, CAST(147.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (235, 52, 49, CAST(101.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (235, 65, 42, CAST(117.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (236, 68, 33, CAST(32.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (236, 85, 44, CAST(77.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (236, 88, 40, CAST(49.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 8, 33, CAST(176.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 11, 33, CAST(126.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 13, 49, CAST(141.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 15, 38, CAST(95.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 26, 49, CAST(153.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 39, 48, CAST(135.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 42, 21, CAST(100.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 57, 45, CAST(49.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 81, 31, CAST(113.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 89, 31, CAST(59.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 94, 23, CAST(109.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 103, 46, CAST(94.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 5, 25, CAST(131.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 49, 36, CAST(140.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 51, 29, CAST(76.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 63, 29, CAST(119.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 95, 21, CAST(54.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 99, 36, CAST(73.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 106, 31, CAST(84.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 107, 36, CAST(83.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 110, 42, CAST(49.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (239, 22, 41, CAST(137.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (239, 37, 28, CAST(80.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (239, 48, 45, CAST(93.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 3, 40, CAST(117.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 4, 39, CAST(178.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 31, 27, CAST(79.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 32, 30, CAST(48.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 58, 27, CAST(96.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 60, 21, CAST(106.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 69, 55, CAST(67.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 72, 55, CAST(73.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 75, 29, CAST(57.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 77, 42, CAST(72.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 79, 45, CAST(57.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 97, 22, CAST(53.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 100, 55, CAST(86.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 102, 50, CAST(62.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 108, 50, CAST(66.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 109, 27, CAST(49.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 62, 55, CAST(62.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 83, 40, CAST(63.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 86, 55, CAST(95.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 91, 39, CAST(67.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 93, 40, CAST(37.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 98, 30, CAST(73.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 101, 55, CAST(81.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 104, 29, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 1, 41, CAST(84.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 7, 45, CAST(192.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 10, 55, CAST(120.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 12, 44, CAST(111.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 14, 36, CAST(77.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 16, 55, CAST(109.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 66, 32, CAST(63.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 92, 31, CAST(95.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 96, 38, CAST(78.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 105, 34, CAST(70.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 18, 40, CAST(118.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 24, 55, CAST(63.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 25, 22, CAST(115.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 40, 30, CAST(167.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 43, 25, CAST(76.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 45, 55, CAST(136.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 47, 26, CAST(57.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 54, 38, CAST(124.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 71, 39, CAST(30.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 74, 48, CAST(60.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (243, 78, 42, CAST(112.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (244, 21, 36, CAST(109.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (244, 34, 25, CAST(118.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (244, 46, 44, CAST(127.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (244, 59, 27, CAST(44.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (244, 84, 30, CAST(76.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (244, 87, 29, CAST(37.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 23, 45, CAST(168.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 27, 40, CAST(49.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 29, 30, CAST(118.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 50, 21, CAST(80.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 55, 26, CAST(68.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 56, 29, CAST(61.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 61, 20, CAST(27.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (246, 64, 43, CAST(38.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (247, 19, 42, CAST(88.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (247, 67, 25, CAST(87.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (247, 70, 24, CAST(117.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (247, 73, 24, CAST(80.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (247, 76, 26, CAST(103.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (247, 80, 22, CAST(38.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 2, 30, CAST(188.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 6, 27, CAST(132.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 9, 29, CAST(132.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 17, 42, CAST(113.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 20, 21, CAST(46.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 30, 50, CAST(51.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 33, 21, CAST(136.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 35, 48, CAST(84.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 36, 34, CAST(60.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 38, 45, CAST(95.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 44, 26, CAST(84.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (248, 52, 45, CAST(115.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 8, 48, CAST(207.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 11, 47, CAST(122.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 53, 29, CAST(43.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 65, 37, CAST(107.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 82, 39, CAST(82.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 85, 42, CAST(90.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 90, 31, CAST(62.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 103, 32, CAST(100.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 13, 26, CAST(166.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 15, 48, CAST(114.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 26, 38, CAST(142.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 28, 38, CAST(117.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 40, 48, CAST(164.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 49, 34, CAST(140.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 57, 48, CAST(50.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 68, 36, CAST(31.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 81, 23, CAST(111.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 88, 33, CAST(44.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 5, 26, CAST(110.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 37, 43, CAST(84.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 39, 44, CAST(135.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 42, 41, CAST(94.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 51, 30, CAST(70.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 63, 34, CAST(98.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 72, 30, CAST(86.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 77, 25, CAST(77.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 89, 27, CAST(61.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 94, 31, CAST(104.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 95, 44, CAST(56.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 97, 46, CAST(56.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 99, 28, CAST(76.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 102, 29, CAST(68.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 106, 31, CAST(87.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 107, 25, CAST(97.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 110, 20, CAST(48.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (252, 22, 39, CAST(143.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (252, 48, 20, CAST(104.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (252, 69, 25, CAST(64.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (252, 75, 38, CAST(53.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (252, 79, 34, CAST(68.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (253, 100, 23, CAST(75.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (253, 101, 49, CAST(87.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (253, 108, 22, CAST(62.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (253, 109, 49, CAST(46.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 31, 27, CAST(71.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 60, 28, CAST(107.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 83, 35, CAST(69.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 86, 46, CAST(86.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 91, 40, CAST(68.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 93, 40, CAST(35.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 98, 39, CAST(73.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 104, 48, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 105, 43, CAST(74.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 1, 42, CAST(84.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 3, 20, CAST(95.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 4, 42, CAST(178.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 7, 31, CAST(157.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 10, 35, CAST(141.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 12, 29, CAST(98.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 14, 23, CAST(76.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 16, 28, CAST(100.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 24, 21, CAST(76.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 32, 28, CAST(49.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 43, 36, CAST(69.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 58, 21, CAST(96.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 62, 28, CAST(62.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 45, 23, CAST(117.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 47, 31, CAST(60.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 54, 25, CAST(124.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 66, 41, CAST(56.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 71, 36, CAST(37.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 74, 44, CAST(60.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 78, 32, CAST(137.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 84, 28, CAST(75.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 87, 38, CAST(32.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 92, 40, CAST(93.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 18, 43, CAST(120.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 19, 50, CAST(82.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 20, 22, CAST(44.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 25, 27, CAST(130.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 29, 29, CAST(106.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 33, 30, CAST(158.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 61, 48, CAST(31.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 64, 26, CAST(42.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 96, 26, CAST(78.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 2, 32, CAST(199.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 6, 43, CAST(135.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 9, 49, CAST(109.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 17, 39, CAST(112.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 30, 41, CAST(58.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 35, 41, CAST(91.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 36, 49, CAST(59.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 38, 44, CAST(104.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 44, 25, CAST(84.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 52, 28, CAST(105.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 11, 49, CAST(129.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 15, 42, CAST(98.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 26, 20, CAST(142.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 28, 20, CAST(99.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 40, 32, CAST(137.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 49, 25, CAST(117.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 53, 30, CAST(46.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 57, 44, CAST(56.07 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 65, 41, CAST(127.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 68, 36, CAST(33.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 82, 41, CAST(88.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 85, 41, CAST(82.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 90, 36, CAST(51.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 103, 27, CAST(85.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 5, 48, CAST(122.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 8, 42, CAST(180.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 13, 49, CAST(162.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 81, 22, CAST(108.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 88, 36, CAST(45.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 89, 22, CAST(62.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 94, 46, CAST(99.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 95, 25, CAST(47.45 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 22, 50, CAST(126.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 31, 41, CAST(68.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 37, 46, CAST(71.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 39, 29, CAST(122.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 42, 29, CAST(94.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 48, 40, CAST(101.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 51, 40, CAST(76.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 60, 22, CAST(106.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 63, 31, CAST(100.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 69, 49, CAST(55.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 72, 36, CAST(70.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 77, 22, CAST(78.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 97, 32, CAST(64.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 99, 26, CAST(86.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 102, 30, CAST(70.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 106, 35, CAST(83.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 107, 31, CAST(92.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 110, 31, CAST(54.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 1, 20, CAST(92.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 3, 26, CAST(114.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 75, 34, CAST(62.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 79, 26, CAST(61.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 83, 25, CAST(68.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 91, 49, CAST(56.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 93, 33, CAST(35.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 98, 20, CAST(88.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 100, 24, CAST(85.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 101, 26, CAST(91.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 104, 44, CAST(107.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 105, 44, CAST(76.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 108, 35, CAST(62.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (262, 109, 23, CAST(47.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (263, 4, 22, CAST(182.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (263, 10, 22, CAST(131.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (263, 32, 23, CAST(53.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (263, 58, 50, CAST(91.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 7, 33, CAST(180.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 12, 34, CAST(106.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 14, 34, CAST(68.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 16, 46, CAST(103.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 24, 22, CAST(61.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 43, 46, CAST(69.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 45, 24, CAST(124.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 47, 32, CAST(52.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 54, 28, CAST(123.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 62, 21, CAST(70.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 66, 43, CAST(56.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 74, 21, CAST(52.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 78, 31, CAST(113.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 84, 43, CAST(75.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 86, 50, CAST(92.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (265, 87, 48, CAST(38.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (266, 18, 30, CAST(116.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (266, 92, 22, CAST(82.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (266, 96, 44, CAST(68.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (267, 25, 34, CAST(116.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (267, 34, 49, CAST(105.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (267, 40, 34, CAST(154.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 21, 49, CAST(105.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 23, 37, CAST(144.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 27, 45, CAST(50.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 29, 27, CAST(124.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 33, 32, CAST(140.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 46, 46, CAST(131.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 50, 43, CAST(77.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 55, 44, CAST(66.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 56, 21, CAST(72.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 59, 38, CAST(50.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 61, 23, CAST(29.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 64, 28, CAST(43.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 71, 36, CAST(36.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (269, 67, 40, CAST(73.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (269, 70, 31, CAST(115.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (269, 73, 46, CAST(83.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (269, 76, 20, CAST(93.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (269, 80, 46, CAST(36.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 2, 41, CAST(195.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 19, 44, CAST(89.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 20, 32, CAST(46.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 35, 42, CAST(100.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 36, 28, CAST(51.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 38, 21, CAST(90.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 44, 45, CAST(80.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 82, 40, CAST(93.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 6, 35, CAST(128.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 9, 49, CAST(128.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 17, 27, CAST(100.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 28, 22, CAST(101.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 30, 22, CAST(60.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 40, 27, CAST(167.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 52, 29, CAST(105.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 53, 20, CAST(41.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (271, 90, 25, CAST(63.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 8, 32, CAST(178.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 15, 49, CAST(104.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 26, 25, CAST(160.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 57, 25, CAST(53.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 65, 20, CAST(126.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 68, 45, CAST(35.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 81, 28, CAST(95.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 85, 26, CAST(82.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 88, 20, CAST(44.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 89, 30, CAST(53.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 94, 48, CAST(97.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 103, 34, CAST(83.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 11, 40, CAST(146.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 13, 34, CAST(140.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 39, 28, CAST(131.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 42, 25, CAST(91.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 49, 48, CAST(119.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 51, 41, CAST(78.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 63, 37, CAST(102.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 95, 24, CAST(56.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 99, 44, CAST(74.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 5, 39, CAST(118.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 22, 28, CAST(143.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 37, 22, CAST(75.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 48, 50, CAST(99.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 69, 38, CAST(58.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 72, 33, CAST(82.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 75, 46, CAST(53.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 77, 23, CAST(83.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 79, 39, CAST(62.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 97, 44, CAST(58.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 100, 32, CAST(76.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 102, 41, CAST(69.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 106, 34, CAST(94.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 107, 37, CAST(83.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 108, 45, CAST(68.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 109, 25, CAST(44.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 110, 29, CAST(48.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (275, 3, 39, CAST(115.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (275, 4, 22, CAST(158.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (275, 31, 42, CAST(75.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (275, 32, 22, CAST(48.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (275, 58, 38, CAST(112.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (275, 60, 46, CAST(107.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 1, 21, CAST(76.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 7, 45, CAST(184.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 10, 49, CAST(150.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 62, 23, CAST(67.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 66, 20, CAST(60.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 83, 43, CAST(60.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 86, 37, CAST(87.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 91, 44, CAST(59.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 92, 41, CAST(96.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 93, 49, CAST(36.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 96, 49, CAST(69.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 98, 37, CAST(86.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 101, 33, CAST(94.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 104, 25, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 105, 44, CAST(69.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (277, 12, 35, CAST(98.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (278, 14, 24, CAST(65.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (278, 16, 50, CAST(112.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (278, 18, 35, CAST(124.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (278, 24, 31, CAST(61.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (278, 25, 36, CAST(125.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (278, 40, 39, CAST(143.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 21, 34, CAST(121.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 43, 22, CAST(66.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 45, 43, CAST(146.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 47, 28, CAST(60.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 54, 49, CAST(122.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 71, 41, CAST(30.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 74, 46, CAST(52.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 78, 33, CAST(129.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 84, 41, CAST(80.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 87, 40, CAST(35.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (280, 23, 39, CAST(156.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (280, 27, 27, CAST(50.85 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (280, 34, 29, CAST(113.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (280, 46, 32, CAST(134.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (280, 59, 32, CAST(48.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 19, 27, CAST(88.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 29, 40, CAST(119.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 33, 21, CAST(156.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 50, 32, CAST(78.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 55, 24, CAST(66.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 56, 34, CAST(66.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 61, 32, CAST(29.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 64, 27, CAST(37.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 67, 36, CAST(77.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 70, 44, CAST(111.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 73, 44, CAST(77.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 76, 34, CAST(91.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 80, 43, CAST(32.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 2, 36, CAST(182.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 6, 37, CAST(138.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 9, 20, CAST(132.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 17, 48, CAST(114.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 20, 25, CAST(49.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 30, 35, CAST(60.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 35, 41, CAST(100.30 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 36, 40, CAST(51.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 38, 35, CAST(93.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 8, 34, CAST(166.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 11, 37, CAST(145.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 13, 34, CAST(143.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 15, 32, CAST(103.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 26, 25, CAST(160.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 44, 50, CAST(84.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 52, 39, CAST(115.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 53, 39, CAST(46.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 65, 20, CAST(120.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 82, 33, CAST(97.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 85, 26, CAST(85.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 90, 48, CAST(57.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 103, 34, CAST(101.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 28, 27, CAST(119.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 39, 24, CAST(125.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 40, 47, CAST(155.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 42, 26, CAST(83.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 49, 38, CAST(137.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 51, 28, CAST(77.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 57, 22, CAST(52.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 68, 40, CAST(33.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 81, 21, CAST(117.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 88, 32, CAST(53.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 89, 44, CAST(55.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 94, 29, CAST(94.92 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 95, 38, CAST(48.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (285, 5, 34, CAST(129.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (285, 63, 28, CAST(114.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (285, 72, 43, CAST(71.69 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (285, 99, 49, CAST(71.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (286, 77, 37, CAST(78.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (286, 97, 25, CAST(62.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 22, 25, CAST(130.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 31, 21, CAST(72.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 37, 37, CAST(73.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 48, 22, CAST(100.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 60, 33, CAST(101.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 69, 39, CAST(56.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 75, 35, CAST(54.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 79, 41, CAST(55.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 83, 50, CAST(71.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 100, 29, CAST(85.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 101, 37, CAST(90.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 102, 37, CAST(67.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 105, 32, CAST(68.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 106, 45, CAST(83.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 107, 30, CAST(80.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 108, 44, CAST(59.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 109, 50, CAST(47.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 110, 43, CAST(52.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (288, 86, 44, CAST(79.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 1, 42, CAST(80.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 3, 50, CAST(118.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 4, 21, CAST(156.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 10, 44, CAST(125.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 91, 35, CAST(58.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 93, 27, CAST(41.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 98, 46, CAST(74.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 104, 50, CAST(111.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 7, 26, CAST(182.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 12, 25, CAST(95.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 14, 36, CAST(76.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 16, 47, CAST(102.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 24, 49, CAST(63.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 32, 39, CAST(52.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 58, 45, CAST(112.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 62, 49, CAST(61.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 18, 36, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 25, 34, CAST(132.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 29, 31, CAST(102.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 33, 26, CAST(162.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 43, 40, CAST(75.59 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 45, 50, CAST(135.23 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 47, 36, CAST(54.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 54, 49, CAST(122.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 66, 35, CAST(67.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 71, 37, CAST(35.87 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 74, 46, CAST(51.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 78, 45, CAST(134.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 84, 30, CAST(66.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 87, 41, CAST(39.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 92, 45, CAST(101.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 96, 22, CAST(81.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 2, 24, CAST(195.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 6, 37, CAST(121.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 9, 39, CAST(110.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 17, 29, CAST(114.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 19, 35, CAST(102.74 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 20, 42, CAST(47.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 30, 44, CAST(57.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 35, 32, CAST(99.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 61, 33, CAST(26.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (292, 64, 24, CAST(36.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (293, 36, 37, CAST(61.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (293, 38, 29, CAST(103.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (293, 44, 36, CAST(98.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 11, 35, CAST(145.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 15, 32, CAST(99.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 26, 20, CAST(137.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 28, 38, CAST(104.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 52, 30, CAST(106.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 53, 44, CAST(41.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 65, 33, CAST(112.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 82, 33, CAST(88.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 85, 38, CAST(84.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 90, 31, CAST(63.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 103, 21, CAST(83.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 40, 22, CAST(135.47 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 49, 37, CAST(124.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 57, 31, CAST(53.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 68, 46, CAST(35.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 81, 37, CAST(104.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 88, 36, CAST(47.08 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 89, 30, CAST(55.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (296, 5, 32, CAST(125.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (296, 8, 33, CAST(205.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (296, 94, 46, CAST(98.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (296, 95, 45, CAST(57.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 13, 33, CAST(155.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 39, 33, CAST(129.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 42, 24, CAST(91.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 51, 45, CAST(83.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 63, 49, CAST(100.77 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 72, 27, CAST(77.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 77, 37, CAST(77.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 97, 39, CAST(62.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (298, 99, 32, CAST(69.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (298, 102, 22, CAST(62.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (298, 106, 48, CAST(86.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (298, 107, 36, CAST(80.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (298, 110, 34, CAST(52.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 22, 33, CAST(130.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 31, 34, CAST(82.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 37, 28, CAST(70.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 48, 45, CAST(92.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 60, 43, CAST(100.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 69, 28, CAST(60.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 75, 34, CAST(61.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 79, 41, CAST(56.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 83, 45, CAST(65.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 91, 22, CAST(60.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 93, 49, CAST(38.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 98, 47, CAST(78.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 100, 36, CAST(75.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 101, 22, CAST(98.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 104, 23, CAST(102.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 105, 29, CAST(76.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 108, 36, CAST(62.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 109, 34, CAST(41.22 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 1, 40, CAST(77.52 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 3, 51, CAST(99.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 4, 22, CAST(156.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 10, 29, CAST(123.51 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 32, 30, CAST(51.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 58, 57, CAST(104.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 62, 58, CAST(75.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 86, 32, CAST(97.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 5, 64, CAST(134.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 22, 34, CAST(129.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 37, 30, CAST(74.84 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 48, 58, CAST(88.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 69, 24, CAST(55.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 75, 38, CAST(59.18 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 77, 42, CAST(74.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 100, 46, CAST(82.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 109, 20, CAST(41.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 31, 42, CAST(75.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 60, 38, CAST(87.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 79, 64, CAST(59.37 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 83, 52, CAST(65.93 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 86, 49, CAST(81.91 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 91, 62, CAST(62.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 93, 56, CAST(41.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 98, 11, CAST(77.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 101, 85, CAST(98.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 104, 21, CAST(96.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 105, 77, CAST(73.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 108, 40, CAST(66.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (303, 3, 45, CAST(118.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (303, 32, 55, CAST(58.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (303, 62, 59, CAST(61.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 1, 24, CAST(85.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 4, 66, CAST(174.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 10, 66, CAST(122.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 47, 36, CAST(55.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 58, 46, CAST(109.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 66, 27, CAST(57.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 87, 30, CAST(35.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 92, 45, CAST(88.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 96, 31, CAST(65.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 7, 64, CAST(163.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 12, 43, CAST(102.17 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 14, 77, CAST(67.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 43, 90, CAST(67.54 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 45, 28, CAST(127.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 54, 48, CAST(124.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 74, 49, CAST(53.27 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 84, 48, CAST(65.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (306, 16, 97, CAST(115.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (306, 24, 61, CAST(72.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (306, 40, 55, CAST(147.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (306, 71, 47, CAST(37.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (306, 78, 76, CAST(127.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (307, 18, 61, CAST(124.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (307, 25, 48, CAST(133.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (307, 46, 65, CAST(117.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 21, 59, CAST(114.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 23, 76, CAST(141.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 27, 42, CAST(58.12 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 34, 41, CAST(132.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 50, 6, CAST(91.11 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 55, 66, CAST(64.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 56, 26, CAST(68.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 59, 64, CAST(45.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 67, 76, CAST(81.78 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 70, 59, CAST(98.65 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 73, 13, CAST(77.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 76, 43, CAST(101.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (309, 80, 15, CAST(41.03 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (310, 29, 6, CAST(104.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (310, 61, 61, CAST(27.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 19, 65, CAST(99.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 20, 44, CAST(51.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 33, 56, CAST(145.13 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 35, 47, CAST(93.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 36, 53, CAST(49.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 38, 34, CAST(84.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 44, 44, CAST(81.35 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 64, 31, CAST(42.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 82, 50, CAST(95.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 2, 23, CAST(205.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 6, 27, CAST(144.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 9, 40, CAST(110.70 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 17, 27, CAST(109.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 52, 46, CAST(106.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 53, 35, CAST(41.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 85, 26, CAST(78.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 90, 27, CAST(60.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 103, 34, CAST(89.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 15, 54, CAST(100.73 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 26, 41, CAST(150.63 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 28, 56, CAST(120.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 30, 47, CAST(49.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 40, 60, CAST(157.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 57, 21, CAST(47.40 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 65, 70, CAST(109.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 68, 30, CAST(32.88 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 81, 31, CAST(108.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 88, 19, CAST(50.86 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 94, 26, CAST(105.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (314, 8, 36, CAST(201.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (314, 11, 47, CAST(145.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (314, 13, 22, CAST(173.02 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (314, 49, 49, CAST(133.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (314, 89, 24, CAST(56.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (314, 95, 51, CAST(53.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 5, 49, CAST(114.24 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 37, 44, CAST(77.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 39, 41, CAST(128.39 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 42, 48, CAST(85.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 51, 56, CAST(83.38 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 63, 43, CAST(108.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 72, 60, CAST(72.58 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 77, 51, CAST(72.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 97, 37, CAST(62.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 99, 34, CAST(74.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 102, 31, CAST(61.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 106, 28, CAST(84.14 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 107, 40, CAST(84.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 110, 47, CAST(54.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (316, 48, 51, CAST(86.81 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (316, 69, 21, CAST(60.97 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (316, 75, 18, CAST(59.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (316, 100, 32, CAST(73.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (316, 109, 42, CAST(43.20 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 22, 24, CAST(129.31 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 31, 15, CAST(70.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 60, 47, CAST(90.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 62, 32, CAST(62.46 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 79, 18, CAST(64.83 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 83, 48, CAST(70.28 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 86, 45, CAST(86.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 91, 26, CAST(68.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 93, 37, CAST(39.71 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 98, 23, CAST(88.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 101, 22, CAST(84.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 104, 41, CAST(98.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 105, 39, CAST(65.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 108, 43, CAST(63.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (318, 1, 66, CAST(79.43 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (318, 3, 45, CAST(116.56 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (318, 4, 56, CAST(162.67 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (318, 10, 21, CAST(144.60 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (318, 32, 36, CAST(58.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (318, 58, 35, CAST(109.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 43, 16, CAST(70.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 45, 27, CAST(139.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 47, 33, CAST(56.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 54, 28, CAST(120.53 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 66, 52, CAST(64.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 84, 10, CAST(66.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 87, 43, CAST(36.61 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 92, 50, CAST(100.01 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 96, 40, CAST(72.41 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 7, 12, CAST(182.90 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 12, 10, CAST(111.57 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 14, 34, CAST(64.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 16, 32, CAST(99.04 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 18, 38, CAST(117.48 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 21, 37, CAST(100.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 24, 39, CAST(67.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 25, 34, CAST(133.72 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 34, 55, CAST(116.16 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 40, 35, CAST(165.95 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 46, 43, CAST(114.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 71, 15, CAST(32.10 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 74, 55, CAST(52.66 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 78, 70, CAST(112.34 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 23, 37, CAST(153.00 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 27, 36, CAST(52.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 29, 45, CAST(116.96 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 50, 66, CAST(73.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 55, 36, CAST(68.42 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 56, 60, CAST(60.26 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 59, 37, CAST(48.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 61, 45, CAST(32.19 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 67, 39, CAST(76.33 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 70, 55, CAST(115.09 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 73, 35, CAST(77.05 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 76, 26, CAST(104.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (321, 80, 15, CAST(35.29 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (322, 33, 35, CAST(167.06 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (322, 64, 40, CAST(44.80 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (323, 19, 51, CAST(91.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (323, 20, 25, CAST(47.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (324, 35, 10, CAST(89.15 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (324, 36, 31, CAST(56.21 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (324, 38, 21, CAST(98.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (324, 44, 21, CAST(80.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (324, 82, 28, CAST(78.89 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (325, 2, 50, CAST(201.44 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (325, 9, 49, CAST(121.64 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (325, 17, 54, CAST(108.50 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (325, 53, 26, CAST(40.25 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (325, 90, 44, CAST(54.94 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (325, 103, 46, CAST(85.98 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 6, 38, CAST(131.49 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 15, 33, CAST(95.99 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 26, 28, CAST(147.36 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 28, 38, CAST(117.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 30, 19, CAST(48.62 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 40, 28, CAST(140.55 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 52, 38, CAST(107.76 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 57, 55, CAST(53.75 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 65, 49, CAST(127.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 68, 31, CAST(31.82 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 85, 41, CAST(83.79 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 88, 11, CAST(50.32 AS Numeric(10, 2)))
GO
INSERT INTO [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 94, 18, CAST(94.92 AS Numeric(10, 2)))


SET IDENTITY_INSERT [dbo].[orderdetails] OFF