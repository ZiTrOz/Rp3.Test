USE [Rp3Test]
GO
/****** Object:  Table [dbo].[tbCategory]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbCategory](
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tbCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbTransaction]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbTransaction](
	[TransactionId] [int] NOT NULL,
	[TransactionTypeId] [smallint] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[ShortDescription] [varchar](100) NOT NULL,
	[Amount] [numeric](18, 6) NOT NULL,
	[Notes] [varchar](max) NULL,
	[DateUpdate] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_tbTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbTransactionType]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbTransactionType](
	[TransactionTypeId] [smallint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbTransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbUser]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbUser](
	[UserId] [int] NOT NULL,
	[PersonName] [varchar](250) NULL,
	[AccountNumber] [varchar](50) NULL,
	[RegisterDate] [datetime] NULL,
	[DateUpdate] [datetime] NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](max) NULL,
 CONSTRAINT [PK_tbUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (1, N'Alimentación', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (2, N'Transporte', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (3, N'Educación', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (4, N'Salud', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (5, N'Vestuario', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (6, N'Remuneración', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (7, N'Vivienda', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (8, N'Servicios Básicos', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (9, N'Luz', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (10, N'Agua', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (11, N'Teléfono', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (12, N'Renta', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (13, N'Hipoteca', 1)
GO
INSERT [dbo].[tbCategory] ([CategoryId], [Name], [Active]) VALUES (14, N'Alícuota', 1)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (1, 1, 9, CAST(N'2019-08-06 00:00:00.000' AS DateTime), N'Luz del 03/07/2019', CAST(71.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (2, 2, 1, CAST(N'2019-06-16 00:50:18.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(98.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (3, 2, 8, CAST(N'2019-06-12 21:36:53.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(6.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (4, 2, 4, CAST(N'2019-06-23 14:25:56.347' AS DateTime), N'Salud del 03/07/2019', CAST(59.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (5, 2, 9, CAST(N'2019-06-18 01:48:13.347' AS DateTime), N'Luz del 03/07/2019', CAST(73.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (6, 2, 1, CAST(N'2019-06-26 22:13:35.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(35.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (7, 2, 5, CAST(N'2019-06-27 20:40:00.347' AS DateTime), N'Vestuario del 03/07/2019', CAST(45.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (8, 2, 5, CAST(N'2019-06-20 06:19:12.347' AS DateTime), N'Vestuario del 03/07/2019', CAST(39.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (9, 2, 8, CAST(N'2019-06-07 09:39:31.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(29.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (10, 2, 9, CAST(N'2019-06-09 13:13:13.347' AS DateTime), N'Luz del 03/07/2019', CAST(10.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (11, 2, 7, CAST(N'2019-06-15 17:04:59.347' AS DateTime), N'Vivienda del 03/07/2019', CAST(86.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (12, 1, 1, CAST(N'2019-07-01 18:22:39.000' AS DateTime), N'Vivienda del 03/07/2019', CAST(44.000000 AS Numeric(18, 6)), N'fgfg', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (13, 1, 6, CAST(N'2019-06-08 14:01:49.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(235.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (14, 2, 1, CAST(N'2019-06-19 10:57:30.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(18.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (15, 1, 6, CAST(N'2019-06-11 21:19:32.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(470.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (16, 2, 4, CAST(N'2019-06-08 02:41:00.347' AS DateTime), N'Salud del 03/07/2019', CAST(98.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (17, 1, 6, CAST(N'2019-06-06 11:12:55.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(365.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (18, 2, 2, CAST(N'2019-06-25 06:12:05.347' AS DateTime), N'Transporte del 03/07/2019', CAST(8.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (19, 2, 2, CAST(N'2019-06-16 15:08:15.347' AS DateTime), N'Transporte del 03/07/2019', CAST(37.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (20, 2, 8, CAST(N'2019-06-14 08:44:01.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(41.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (21, 2, 1, CAST(N'2019-06-28 19:40:10.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(53.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (22, 2, 1, CAST(N'2019-06-07 22:36:57.347' AS DateTime), N'Alimentación del 03/07/2019', CAST(74.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (23, 2, 2, CAST(N'2019-06-10 12:32:54.347' AS DateTime), N'Transporte del 03/07/2019', CAST(3.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (24, 2, 3, CAST(N'2019-06-12 09:01:53.347' AS DateTime), N'Educación del 03/07/2019', CAST(72.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (25, 2, 5, CAST(N'2019-06-08 16:25:39.347' AS DateTime), N'Vestuario del 03/07/2019', CAST(83.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (26, 1, 6, CAST(N'2019-06-25 15:16:22.347' AS DateTime), N'Remuneración del 03/07/2019', CAST(115.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (27, 2, 8, CAST(N'2019-06-17 09:14:30.347' AS DateTime), N'Servicios Básicos del 03/07/2019', CAST(83.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (28, 2, 3, CAST(N'2019-08-05 00:00:00.000' AS DateTime), N'Educación del 03/07/2019', CAST(12.000000 AS Numeric(18, 6)), N'Nuevo', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (29, 2, 3, CAST(N'2019-06-29 15:04:55.347' AS DateTime), N'Educación del 03/07/2019', CAST(72.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (30, 2, 4, CAST(N'2019-06-17 16:57:57.347' AS DateTime), N'Salud del 03/07/2019', CAST(30.000000 AS Numeric(18, 6)), NULL, NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (31, 2, 13, CAST(N'2019-08-04 16:06:14.153' AS DateTime), N'Hipoteca', CAST(100.000000 AS Numeric(18, 6)), N'100', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (32, 2, 13, CAST(N'2019-08-04 16:06:56.000' AS DateTime), N'Hipoteca', CAST(100.000000 AS Numeric(18, 6)), N'100', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (33, 1, 14, CAST(N'2019-08-04 22:28:39.473' AS DateTime), N'Vivienda del 03/07/2019', CAST(44.000000 AS Numeric(18, 6)), N'100', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (34, 1, 4, CAST(N'2019-08-04 22:31:04.327' AS DateTime), N'Salud', CAST(44.000000 AS Numeric(18, 6)), N'100', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (35, 2, 14, CAST(N'2019-08-04 22:33:35.627' AS DateTime), N'Gasto 100', CAST(200.000000 AS Numeric(18, 6)), N'docientos', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (36, 1, 12, CAST(N'2019-08-04 22:37:40.790' AS DateTime), N'Gasto 100', CAST(200.000000 AS Numeric(18, 6)), N'docientos', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (37, 1, 2, CAST(N'2019-08-04 22:44:33.127' AS DateTime), N'Nuevo', CAST(10.000000 AS Numeric(18, 6)), N'Nuevo', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (38, 1, 2, CAST(N'2019-08-04 22:45:52.523' AS DateTime), N'Hipoteca', CAST(44.000000 AS Numeric(18, 6)), N'fgfg', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (39, 2, 1, CAST(N'2019-08-14 15:00:00.000' AS DateTime), N'Vivienda del 03/07/2019', CAST(1000.000000 AS Numeric(18, 6)), N'1111', CAST(N'2019-08-05 10:44:39.167' AS DateTime), 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (40, 2, 5, CAST(N'2019-08-05 02:11:45.087' AS DateTime), N'Nuevo', CAST(1000.000000 AS Numeric(18, 6)), N'1111', NULL, 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (41, 1, 5, CAST(N'2019-08-05 15:47:02.560' AS DateTime), N'Hipoteca3', CAST(10.000000 AS Numeric(18, 6)), N'100', CAST(N'2019-08-05 10:47:22.447' AS DateTime), 2)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (42, 1, 13, CAST(N'2019-08-05 17:37:42.020' AS DateTime), N'Renta', CAST(1200.000000 AS Numeric(18, 6)), N'Renta', CAST(N'2019-08-05 12:37:54.923' AS DateTime), 3)
GO
INSERT [dbo].[tbTransaction] ([TransactionId], [TransactionTypeId], [CategoryId], [RegisterDate], [ShortDescription], [Amount], [Notes], [DateUpdate], [UserId]) VALUES (43, 2, 1, CAST(N'2019-08-05 12:39:17.733' AS DateTime), N'Comida', CAST(200.000000 AS Numeric(18, 6)), N'Comida', NULL, 3)
GO
INSERT [dbo].[tbTransactionType] ([TransactionTypeId], [Name]) VALUES (1, N'INGRESOS')
GO
INSERT [dbo].[tbTransactionType] ([TransactionTypeId], [Name]) VALUES (2, N'GASTOS')
GO
INSERT [dbo].[tbUser] ([UserId], [PersonName], [AccountNumber], [RegisterDate], [DateUpdate], [UserName], [Password]) VALUES (1, N'Test1', N'12345', CAST(N'2019-08-04 14:18:51.377' AS DateTime), NULL, N'test1', N'test1')
GO
INSERT [dbo].[tbUser] ([UserId], [PersonName], [AccountNumber], [RegisterDate], [DateUpdate], [UserName], [Password]) VALUES (2, N'Test2', N'43434', CAST(N'2019-08-04 14:18:51.377' AS DateTime), NULL, N'test2', N'test2')
GO
INSERT [dbo].[tbUser] ([UserId], [PersonName], [AccountNumber], [RegisterDate], [DateUpdate], [UserName], [Password]) VALUES (3, N'Test3', N'Test3', CAST(N'2019-08-04 14:18:51.377' AS DateTime), NULL, N'test3', N'test3')
GO
ALTER TABLE [dbo].[tbTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tbTransaction_tbCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[tbTransaction] CHECK CONSTRAINT [FK_tbTransaction_tbCategory]
GO
ALTER TABLE [dbo].[tbTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tbTransaction_tbTransactionType] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[tbTransactionType] ([TransactionTypeId])
GO
ALTER TABLE [dbo].[tbTransaction] CHECK CONSTRAINT [FK_tbTransaction_tbTransactionType]
GO
ALTER TABLE [dbo].[tbTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tbTransaction_tbUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbUser] ([UserId])
GO
ALTER TABLE [dbo].[tbTransaction] CHECK CONSTRAINT [FK_tbTransaction_tbUser]
GO
/****** Object:  StoredProcedure [dbo].[FillRandomData]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillRandomData]
AS

TRUNCATE TABLE dbo.tbTransaction;

DECLARE @FechaInicial DATETIME;
DECLARE @FechaFinal DATETIME;

DECLARE @FechaProceso DATETIME;
DECLARE @CategoryId INT;
DECLARE @TypeId INT;
DECLARE @Description VARCHAR(500);

SET @FechaInicial = DATEADD(DAY, -30, GETDATE());
SET @FechaFinal = GETDATE() - 1;

SET @FechaProceso = @FechaInicial;

DECLARE @Amount MONEY;

DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT;

DECLARE @Id INT;
SET @Id = 1;

DECLARE @Contador INT;
DECLARE @Limite INT;

SET @Contador = 0;
SET @Limite = 30;

WHILE (@Contador < @Limite)
BEGIN

    ---- This will create a random number between 1 and 999
    SET @Lower = 1; ---- The lowest random number
    SET @Upper = 10; ---- The highest random number
    SELECT @Random = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower), 0);

    SET @CategoryId = @Random;

    SELECT @Description = Name + ' del ' + CONVERT(VARCHAR, GETDATE(), 103)
    FROM dbo.tbCategory
    WHERE CategoryId = @CategoryId;

    SET @Lower = 100; ---- The lowest random number
    SET @Upper = 200; ---- The highest random number
    SELECT @Random = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower) / 100, 0);

    SET @TypeId = @Random;


    SET @Lower = 2; ---- The lowest random number
    SET @Upper = 100; ---- The highest random number
    SELECT @Random = ROUND(((@Upper - @Lower - 1) * RAND() + @Lower), 0);

    SET @Amount = @Random;

    DECLARE @Seconds INT = DATEDIFF(SECOND, @FechaInicial, @FechaFinal);
    SET @Random = ROUND(((@Seconds - 1) * RAND()), 0);

    SELECT @FechaProceso = DATEADD(SECOND, @Random, @FechaInicial);


	IF @CategoryId = 6
	BEGIN
		SET @TypeId = 1
		SET @Amount = @Amount * 5
	END
	ELSE
		SET @TypeId = 2


    INSERT INTO dbo.tbTransaction
    (
        TransactionId,
        TransactionTypeId,
        CategoryId,
        RegisterDate,
        ShortDescription,
        Amount,
        Notes
    )
    VALUES
    (   @Id,           -- TransactionId - int
        @TypeId,       -- TransactionTypeId - smallint
        @CategoryId,   -- CategoryId - int
        @FechaProceso, -- RegisterDate - datetime
        @Description,  -- ShortDescription - varchar(100)
        @Amount,       -- Amount - numeric(18, 6)
        NULL);

    SET @Id = @Id + 1;
    SET @Contador = @Contador + 1;

END;

GO
/****** Object:  StoredProcedure [dbo].[spBalance]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spBalance]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @tbIngresos TABLE (Name varchar(50), total float, categoryId int)
	DECLARE @tbGastos TABLE (Name varchar(50), total float, categoryId int)

	INSERT INTO @tbGastos
		SELECT Name, 0, CategoryId FROM tbCategory
	--SELECT Name, SUM(Amount), c.categoryId FROM tbTransaction t LEFT JOIN tbCategory c on c.CategoryId=t.CategoryId where TransactionTypeId = 2 group by Name, c.categoryId
	INSERT INTO @tbIngresos
		SELECT Name, 0,CategoryId FROM tbCategory
	--SELECT Name, SUM(Amount), c.categoryId FROM tbTransaction t LEFT JOIN tbCategory c on c.CategoryId=t.CategoryId where TransactionTypeId = 1 group by Name, c.categoryId

	UPDATE g SET g.total = T.Amount FROM @tbGastos g JOIN
		(SELECT Name, SUM(Amount) as Amount, c.categoryId FROM tbTransaction t LEFT JOIN tbCategory c on c.CategoryId=t.CategoryId where TransactionTypeId = 2 and UserId = @userId group by Name, c.categoryId) 
			T ON g.categoryId = t.CategoryId 

	UPDATE g SET g.total = T.Amount FROM @tbIngresos g JOIN
		(SELECT Name, SUM(Amount) as Amount, c.categoryId FROM tbTransaction t LEFT JOIN tbCategory c on c.CategoryId=t.CategoryId where TransactionTypeId = 1 and UserId = @userId group by Name, c.categoryId) 
		T ON g.categoryId = t.CategoryId 

	UPDATE g SET g.total = i.total - g.total FROM @tbGastos g JOIN @tbIngresos i on g.categoryId = i.categoryId
	SELECT * FROM @tbGastos order by total desc
END

GO
/****** Object:  StoredProcedure [dbo].[spTransactionInsert]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransactionInsert]
@infoXml XML
AS
BEGIN

	/*
	Complete the code for Insert to dbo.tbTransaction Table

	Code XML SELECT EXAMPLE:

	SELECT 
	TransactionId = T.info.value('@ TransactionId','int'),
	TransactionTypeId = T.info.value('@ TransactionTypeId','smallint'),
	CategoryId = T.info.value('@ CategoryId','int'),
	RegisterDate = T.info.value('@ RegisterDate','datetime'),
	ShortDescription = T.info.value('@ ShortDescription','varchar(100)'),
	Notes = T.info.value('@ Notes','varchar(max)')
    FROM    @infoXml.nodes('Transaction')
                        AS T ( info ); 
	*/

	RETURN 0;

END

GO
/****** Object:  StoredProcedure [dbo].[spTransactionUpdate]    Script Date: 8/5/2019 12:48:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransactionUpdate]
@infoXml XML
AS
BEGIN
	
	/*
	Complete the code for Update to dbo.tbTransaction Table

	Code XML SELECT EXAMPLE:

	SELECT 
	TransactionId = T.info.value('@ TransactionId','int'),
	TransactionTypeId = T.info.value('@ TransactionTypeId','smallint'),
	CategoryId = T.info.value('@ CategoryId','int'),
	RegisterDate = T.info.value('@ RegisterDate','datetime'),
	ShortDescription = T.info.value('@ ShortDescription','varchar(100)'),
	Notes = T.info.value('@ Notes','varchar(max)')
    FROM    @infoXml.nodes('Transaction')
                        AS T ( info ); 
	*/
	RETURN 0;
END

GO
