USE [StockManagement]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 27.12.2018 14:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneCases]    Script Date: 27.12.2018 14:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneCases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](150) NULL,
	[Price] [decimal](18, 2) NULL,
	[CaseColor] [int] NULL,
 CONSTRAINT [PK_PhoneCases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 27.12.2018 14:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[ProductName] [nvarchar](150) NULL,
	[IMEI1] [nvarchar](50) NULL,
	[IMEI2] [nvarchar](50) NULL,
	[BrandID] [int] NULL,
	[ModelCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBrand]    Script Date: 27.12.2018 14:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteBrand] 
@ID int 
AS
BEGIN
	DELETE FROM Brands WHERE ID = @ID
END

exec DeleteBrand 1
GO
/****** Object:  StoredProcedure [dbo].[DeletePhone]    Script Date: 27.12.2018 14:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePhone]
@ID int
AS
BEGIN
	DELETE FROM Phones WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetPhones]    Script Date: 27.12.2018 14:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPhones]
AS
BEGIN
	SELECT p.*, b.ID AS BID, b.BrandName 
	FROM Phones p
	INNER JOIN Brands b
	ON p.BrandID = b.ID
	ORDER BY BrandID,ProductName
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPhone]    Script Date: 27.12.2018 14:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertPhone]
@productName nvarchar(150), @price decimal,
@IMEI1 nvarchar(50), @IMEI2 nvarchar(50),
@modelCode nvarchar(50), @brandId int
AS
BEGIN
	INSERT INTO Phones (ProductName, Price, IMEI1, IMEI2, ModelCode, BrandID)
	VALUES (@productName, @price, @IMEI1, @IMEI2, @modelCode, @brandId)
END
GO
