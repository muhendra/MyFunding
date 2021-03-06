USE [SQL_FUNDING]
GO
/****** Object:  User [dataWarehouse]    Script Date: 2020-11-26 09:28:56 ******/
CREATE USER [dataWarehouse] FOR LOGIN [dataWarehouse] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dbaetllogin]    Script Date: 2020-11-26 09:28:56 ******/
CREATE USER [dbaetllogin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [dbaetlloginbdev]    Script Date: 2020-11-26 09:28:56 ******/
CREATE USER [dbaetlloginbdev] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [dataWarehouse]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [dbaetlloginbdev]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [dbaetlloginbdev]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_FND_ControlChar]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_FND_ControlChar]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Mengambil Parameter jenis Varchar dari Control table

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
*/
	
(
	-- Function Parameter
	@pControlName		varchar(30)
)
RETURNS varchar(200)

AS

BEGIN	-- Function harus ada begin

	-- Declare variable 
	DECLARE
		@CharValue			varchar(max)

	-- Mulai
	select @CharValue = CharValue
	from FND_Parameter_Control_TR
	where ControlName = @pControlName
				
	-- Return the result of the function
	RETURN @CharValue

END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_FND_ControlDatetime]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_FND_ControlDatetime]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Mengambil Parameter jenis Datetime dari Control table

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
*/
	
(
	-- Function Parameter
	@pControlName		varchar(30)
)
RETURNS datetime

AS

BEGIN	-- Function harus ada begin

	-- Declare variable 
	DECLARE
		@DatetimeValue			datetime

	-- Mulai
	select @DatetimeValue = DatetimeValue
	from FND_Parameter_Control_TR
	where ControlName = @pControlName
				
	-- Return the result of the function
	RETURN @DatetimeValue

END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_FND_ControlFloat]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_FND_ControlFloat]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Mengambil Parameter jenis Float dari Control table

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
*/
	
(
	-- Function Parameter
	@pControlName		varchar(30)
)
RETURNS float

AS

BEGIN	-- Function harus ada begin

	-- Declare variable 
	DECLARE
		@FloatValue			float

	-- Mulai
	select @FloatValue = FloatValue
	from FND_Parameter_Control_TR
	where ControlName = @pControlName
				
	-- Return the result of the function
	RETURN @FloatValue

END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_FND_ControlGuid]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_FND_ControlGuid]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Mengambil Parameter jenis Guid dari Control table

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
*/
	
(
	-- Function Parameter
	@pControlName		varchar(30)
)
RETURNS uniqueidentifier

AS

BEGIN	-- Function harus ada begin

	-- Declare variable 
	DECLARE
		@GuidValue			uniqueidentifier

	-- Mulai
	select @GuidValue = GuidValue
	from FND_Parameter_Control_TR
	where ControlName = @pControlName
				
	-- Return the result of the function
	RETURN @GuidValue

END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_FND_ControlInteger]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_FND_ControlInteger]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Mengambil Parameter jenis Integer dari Control table

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
*/
	
(
	-- Function Parameter
	@pControlName		varchar(30)
)
RETURNS bigint

AS

BEGIN	-- Function harus ada begin

	-- Declare variable 
	DECLARE
		@IntegerValue			bigint

	-- Mulai
	select @IntegerValue = IntegerValue
	from FND_Parameter_Control_TR
	where ControlName = @pControlName
				
	-- Return the result of the function
	RETURN @IntegerValue

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnConvertIntToRoman]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnConvertIntToRoman] 
(
	-- Add the parameters for the function here
	@i INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	-- Declare the return variable here
	RETURN    Replicate('M', @i/1000)
            + REPLACE(REPLACE(REPLACE(
                  Replicate('C', @i%1000/100),
                  Replicate('C', 9), 'CM'),
                  Replicate('C', 5), 'D'),
                  Replicate('C', 4), 'CD')
             + REPLACE(REPLACE(REPLACE(
                  Replicate('X', @i%100 / 10),
                  Replicate('X', 9),'XC'),
                  Replicate('X', 5), 'L'),
                  Replicate('X', 4), 'XL')
             + REPLACE(REPLACE(REPLACE(
                  Replicate('I', @i%10),
                  Replicate('I', 9),'IX'),
                  Replicate('I', 5), 'V'),
                  Replicate('I', 4),'IV')

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnGenerateFilenameReward]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- select dbo.fnGenerateFilenameReward()
-- =============================================
CREATE FUNCTION [dbo].[fnGenerateFilenameReward] 
(
)
RETURNS VARCHAR(15) 
AS
BEGIN

DECLARE @Nomor VARCHAR(4)
DECLARE @Tanggal VARCHAR(2)
DECLARE @Bulan VARCHAR(2)
DECLARE @Tahun VARCHAR(4)
DECLARE @NomorKwitansi VARCHAR(4)
DECLARE @Return VARCHAR(15)
     
SET	@NomorKwitansi = (SELECT TOP 1 SUBSTRING([filename],14,2) FROM [SQL_AUTHORIZE].[dbo].[AUTH_DATATRX]    
		  WHERE SUBSTRING([filename],1,5) = 'MYRWD'
				AND SUBSTRING([filename],6,4) = RIGHT('0000' + CONVERT(VARCHAR(4),YEAR(GETDATE())), 4)
				AND SUBSTRING([filename],10,2) = RIGHT('00' + CONVERT(VARCHAR(2),MONTH(GETDATE())), 2)
				AND SUBSTRING([filename],12,2) = RIGHT('00' + CONVERT(VARCHAR(2),DAY(GETDATE())), 2)
		  ORDER BY [filename] DESC)

--select @NomorKwitansi

SET @Nomor = ISNULL(@NomorKwitansi+1,'1')
SET @Tanggal = RIGHT('00' + CONVERT(VARCHAR(2),DAY(GETDATE())), 2)
SET @Bulan = RIGHT('00' + CONVERT(VARCHAR(2),MONTH(GETDATE())), 2)
SET @Tahun = RIGHT('0000' + CONVERT(VARCHAR(4),YEAR(GETDATE())), 4)
	
SET @Return = 'MYRWD'+@Tahun+@Bulan+@Tanggal+RIGHT('00' + @Nomor,2)

RETURN @Return

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnRomanToNumerals]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnRomanToNumerals] 
(
	-- Add the parameters for the function here
	@RomanNumeral NVarchar(100)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @RomanSystem TABLE (symbol NVARCHAR(20) 
                                  COLLATE SQL_Latin1_General_Cp437_BIN,
                              DecimalValue INT PRIMARY key)
  DECLARE @Numeral INT
  DECLARE @Rowcount int
  DECLARE @InString int
  SELECT  @inString=LEN(@RomanNumeral),@rowcount=100
IF @RomanNumeral='nulla' return 0
  INSERT  INTO @RomanSystem (symbol, DecimalValue)
    VALUES('I', 1),
          ('IV', 4),
          ('V', 5),
          ('IX', 9),
          ('X', 10),
          ('XL', 40),
          ('L', 50),
          ('XC', 90),
          ('C', 100),
          ('CD', 400),
          ('D', 500),
          ('CM', 900),
          ('M', 1000),
          (N'|ↄↄ', 5000),
          (N'cc|ↄↄ', 10000),
          (N'|ↄↄↄ', 50000),
          (N'ccc|ↄↄↄ', 100000),
          (N'ccc|ↄↄↄↄↄↄ', 150000)
 
WHILE @instring>0 AND @RowCount>0
    BEGIN
    SELECT TOP 1 @Numeral=COALESCE(@Numeral,0)+ DecimalValue,
                @InString=@Instring-LEN(symbol) FROM
    @RomanSystem 
    Where RIGHT(@RomanNumeral,@InString) LIKE symbol+'%'
          COLLATE SQL_Latin1_General_CP850_Bin
    AND @Instring-LEN(symbol)>=0
    ORDER BY DecimalValue DESC
    SELECT @Rowcount=@@Rowcount
    end
 RETURN CASE WHEN @RowCount=0 THEN NULL ELSE @Numeral END

END

GO
/****** Object:  UserDefinedFunction [dbo].[FullMonthsSeparation]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FullMonthsSeparation] 
(
    @DateA DATETIME,
    @DateB DATETIME
)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT

    DECLARE @DateX DATETIME
    DECLARE @DateY DATETIME

    IF(@DateA < @DateB)
    BEGIN
    	SET @DateX = @DateA
    	SET @DateY = @DateB
    END
    ELSE
    BEGIN
    	SET @DateX = @DateB
    	SET @DateY = @DateA
    END

    SET @Result = (
    				SELECT 
    				CASE 
    					WHEN DATEPART(DAY, @DateX) > DATEPART(DAY, @DateY)
    					THEN DATEDIFF(MONTH, @DateX, @DateY) - 1
    					ELSE DATEDIFF(MONTH, @DateX, @DateY)
    				END
    				)

    RETURN @Result
END

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AmortisasiRequest]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmortisasiRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [nvarchar](max) NULL,
	[RequestDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DOid] [int] NULL DEFAULT ((0)),
	[IsBreak] [bit] NOT NULL DEFAULT ((0)),
	[POId] [int] NULL,
 CONSTRAINT [PK_dbo.AmortisasiRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AmortisasiRequest_bc]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmortisasiRequest_bc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [nvarchar](max) NULL,
	[RequestDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DOid] [int] NULL,
	[IsBreak] [bit] NOT NULL,
	[POId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AmortisasiRequestDetail]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmortisasiRequestDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AmortisasiRequestId] [int] NOT NULL,
	[Value_date] [datetime] NOT NULL,
	[BranchId] [nvarchar](max) NULL,
	[BranchName] [nvarchar](max) NULL,
	[DebitKredit] [int] NOT NULL,
	[Narative] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IntAccCategoryId] [nvarchar](max) NULL,
	[IntAccCategoryName] [nvarchar](max) NULL,
	[ref_code] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AmortisasiRequestDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BreakAmortisasiRequest]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BreakAmortisasiRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [nvarchar](max) NULL,
	[TTid] [int] NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[TransactionCode] [nvarchar](max) NULL,
	[JurnalName] [nvarchar](max) NULL,
	[Memo] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.BreakAmortisasiRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BreakAmortisasiRequestDetail]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BreakAmortisasiRequestDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BreakAmortisasiRequestId] [int] NOT NULL,
	[Value_date] [datetime] NOT NULL,
	[BranchId] [nvarchar](max) NULL,
	[BranchName] [nvarchar](max) NULL,
	[IntAccCategoryId] [nvarchar](max) NULL,
	[IntAccCategoryName] [nvarchar](max) NULL,
	[DebitKredit] [int] NOT NULL,
	[Narative] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[ref_code] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.BreakAmortisasiRequestDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryOrder]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[DeliveryOrderId] [nvarchar](max) NULL,
	[DeliveryOrderDate] [datetime] NULL,
	[StatusBarang] [int] NOT NULL,
	[Receiver] [nvarchar](max) NULL,
	[Condition] [int] NOT NULL,
	[attachmentTandaTerima] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.DeliveryOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetailBarang]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBarang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnquiryId] [int] NULL,
	[PromotionCode] [nvarchar](max) NULL,
	[KategoriBarang] [int] NOT NULL,
	[TypeBarang] [nvarchar](max) NULL,
	[Penalty] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NULL,
	[Warna] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[Merek] [nvarchar](max) NULL,
	[Keterangan] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnquiryTabunganInput]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryTabunganInput](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TglBukaRekening] [datetime] NULL,
	[JenisTabungan] [int] NOT NULL,
	[NoRekening] [nvarchar](max) NULL,
	[NoCif] [nvarchar](max) NULL,
	[NamaNasabah] [nvarchar](max) NULL,
	[KodePromosi] [nvarchar](max) NULL,
	[Cabang] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[MaturityDate] [datetime] NULL,
	[Nominal] [decimal](18, 2) NOT NULL,
	[PRId] [nvarchar](max) NULL,
	[PRDate] [datetime] NULL,
	[DraftPRId] [nvarchar](max) NULL,
	[DraftPRDate] [datetime] NULL,
	[AttachmentSPNasabah] [nvarchar](max) NULL,
	[RewardBudget] [decimal](18, 2) NOT NULL,
	[AttachmentMemoDireksi] [nvarchar](max) NULL,
	[CatatanCabang] [nvarchar](max) NULL,
	[CatatanFProduct] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DetailBarangId] [int] NULL,
	[ApproveBy2] [nvarchar](max) NULL,
	[ApproveDate2] [datetime] NULL,
	[StatusData2] [int] NOT NULL CONSTRAINT [DF__EnquiryTa__Statu__09DE7BCC]  DEFAULT ((0)),
	[Requester] [nvarchar](max) NULL,
	[RejectBy2] [nvarchar](max) NULL,
	[RejectDate2] [datetime] NULL,
	[RejectReason2] [nvarchar](max) NULL,
	[PenyimpanganProgram] [int] NULL,
	[AttachmentPenyimpangan] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.EnquiryTabunganInput] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnquiryTabunganInput_20200713]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryTabunganInput_20200713](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TglBukaRekening] [datetime] NULL,
	[JenisTabungan] [int] NOT NULL,
	[NoRekening] [nvarchar](max) NULL,
	[NoCif] [nvarchar](max) NULL,
	[NamaNasabah] [nvarchar](max) NULL,
	[KodePromosi] [nvarchar](max) NULL,
	[Cabang] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[MaturityDate] [datetime] NULL,
	[Nominal] [decimal](18, 2) NOT NULL,
	[PRId] [nvarchar](max) NULL,
	[PRDate] [datetime] NULL,
	[DraftPRId] [nvarchar](max) NULL,
	[DraftPRDate] [datetime] NULL,
	[AttachmentSPNasabah] [nvarchar](max) NULL,
	[RewardBudget] [decimal](18, 2) NOT NULL,
	[AttachmentMemoDireksi] [nvarchar](max) NULL,
	[CatatanCabang] [nvarchar](max) NULL,
	[CatatanFProduct] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DetailBarangId] [int] NULL,
	[ApproveBy2] [nvarchar](max) NULL,
	[ApproveDate2] [datetime] NULL,
	[StatusData2] [int] NOT NULL,
	[Requester] [nvarchar](max) NULL,
	[RejectBy2] [nvarchar](max) NULL,
	[RejectDate2] [datetime] NULL,
	[RejectReason2] [nvarchar](max) NULL,
	[PenyimpanganProgram] [int] NULL,
	[AttachmentPenyimpangan] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnquiryTabunganInput_test]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryTabunganInput_test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TglBukaRekening] [datetime] NULL,
	[JenisTabungan] [int] NOT NULL,
	[NoRekening] [nvarchar](max) NULL,
	[NoCif] [nvarchar](max) NULL,
	[NamaNasabah] [nvarchar](max) NULL,
	[KodePromosi] [nvarchar](max) NULL,
	[Cabang] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[MaturityDate] [datetime] NULL,
	[Nominal] [decimal](18, 2) NOT NULL,
	[PRId] [nvarchar](max) NULL,
	[PRDate] [datetime] NULL,
	[DraftPRId] [nvarchar](max) NULL,
	[DraftPRDate] [datetime] NULL,
	[AttachmentSPNasabah] [nvarchar](max) NULL,
	[RewardBudget] [decimal](18, 2) NOT NULL,
	[AttachmentMemoDireksi] [nvarchar](max) NULL,
	[CatatanCabang] [nvarchar](max) NULL,
	[CatatanFProduct] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DetailBarangId] [int] NULL,
	[ApproveBy2] [nvarchar](max) NULL,
	[ApproveDate2] [datetime] NULL,
	[StatusData2] [int] NOT NULL,
	[Requester] [nvarchar](max) NULL,
	[RejectBy2] [nvarchar](max) NULL,
	[RejectDate2] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FND_Parameter_Control_TR]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FND_Parameter_Control_TR](
	[ControlName] [varchar](30) NULL,
	[IntegerValue] [bigint] NULL,
	[CharValue] [varchar](100) NULL,
	[DatetimeValue] [datetime] NULL,
	[FloatValue] [float] NULL,
	[GuidValue] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FND_Parameter_List_TR]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FND_Parameter_List_TR](
	[ListName] [varchar](30) NULL,
	[ListGroup] [smallint] NULL,
	[ItemCode] [smallint] NULL,
	[ItemName] [varchar](30) NULL,
	[AdditionalCode] [smallint] NULL,
	[AlphabeticalCode] [varchar](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FND_Point_TM]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FND_Point_TM](
	[CIFNumber] [varchar](20) NULL,
	[CIFName] [varchar](50) NULL,
	[PointBalance] [int] NULL DEFAULT ((0)),
	[ReferenceStartDate] [date] NULL DEFAULT (getdate()),
	[ReferenceBalance] [int] NULL DEFAULT ((0)),
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
	[CIFStatus] [char](1) NULL DEFAULT ('A'),
	[TerminateDate] [date] NULL,
	[NextExpiredDate] [date] NULL,
	[NextExpiredAmount] [int] NULL,
	[LastTopUpDate] [date] NULL,
	[LastRedeemDate] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FND_Point_Transaction_TT]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FND_Point_Transaction_TT](
	[PointId] [bigint] IDENTITY(1,1) NOT NULL,
	[CIFNumber] [varchar](20) NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionType] [smallint] NULL,
	[TransactionRemark] [varchar](100) NULL,
	[TransactionAmount] [int] NULL,
	[TransactionBalance] [int] NULL,
	[IsTopUp] [bit] NULL,
	[SourceSystem] [varchar](20) NULL,
	[SprocName] [varchar](50) NULL,
	[ExpiredDate] [date] NULL,
	[RedeemAmount] [int] NULL,
	[AvailableAmount] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FND_ProcessList_TR]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FND_ProcessList_TR](
	[ProcessId] [smallint] NULL,
	[SprocName] [varchar](50) NULL,
	[DependenceProcessId] [smallint] NOT NULL,
	[ProcessBatchGroup] [tinyint] NULL,
	[ProcessDailyType] [tinyint] NULL,
	[IsOnceInADay] [bit] NULL,
	[IsProcessing] [tinyint] NULL,
	[IsFinished] [tinyint] NULL,
	[ProcessStart] [datetime] NULL,
	[ProcessEnd] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GenerateNoPurchaseOrder]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenerateNoPurchaseOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bulan] [int] NULL,
	[tahun] [int] NULL,
	[nomor] [int] NULL,
 CONSTRAINT [PK_GenerateNoPurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InternalAccount]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomorIA] [nvarchar](max) NULL,
	[Deskripsi] [nvarchar](max) NULL,
	[Category] [int] NOT NULL,
	[MataUang] [nvarchar](max) NULL,
	[NamaCabang] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.InternalAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JurnalCashback]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JurnalCashback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnquiryId] [int] NULL,
	[POId] [nvarchar](max) NULL,
	[POGroupId] [nvarchar](max) NULL,
	[KodeCabang] [nvarchar](max) NULL,
	[AccountDebet] [nvarchar](max) NULL,
	[AccountKredit] [nvarchar](max) NULL,
	[Nominal] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JurnalPelunasan]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JurnalPelunasan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[POId] [int] NULL,
	[PCRId] [int] NULL,
	[ValueDate] [datetime] NULL,
	[BranchId] [nvarchar](max) NULL,
	[BranchName] [nvarchar](max) NULL,
	[InternalAccount] [nvarchar](max) NULL,
	[InternalAccountName] [nvarchar](max) NULL,
	[DebetKredit] [int] NOT NULL,
	[Narrative] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[NamaCabang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.JurnalPelunasan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JurnalPembayaran]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JurnalPembayaran](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValueDate] [datetime] NULL,
	[BranchId] [nvarchar](max) NULL,
	[BranchName] [nvarchar](max) NULL,
	[InternalAccount] [nvarchar](max) NULL,
	[InternalAccountName] [nvarchar](max) NULL,
	[DebetKredit] [int] NOT NULL,
	[Narrative] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[PaymentRequestId] [int] NULL,
	[NamaCabang] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.JurnalPembayaran] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KartuAmortisasi]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KartuAmortisasi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AmortisasiRequestId] [int] NOT NULL,
	[Periode] [int] NOT NULL,
	[ValueDate] [datetime] NOT NULL,
	[AmortizeAmount] [decimal](18, 2) NOT NULL,
	[IsProceed] [bit] NOT NULL DEFAULT ((0)),
	[ProceedDateTime] [datetime] NULL,
	[ProceedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.KartuAmortisasi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Katalog]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katalog](
	[Id] [int] NOT NULL,
	[Kode_Promo] [nvarchar](max) NULL,
	[Kategory] [int] NOT NULL,
	[Merk] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[JangkaWaktu] [int] NOT NULL,
	[MonthsYears] [int] NOT NULL,
	[NominalHold] [numeric](18, 2) NOT NULL,
	[Penalty] [numeric](18, 2) NOT NULL,
	[ProgramName] [int] NOT NULL,
	[AttachmentKatalog] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IDKode_Promo2] [nvarchar](max) NULL,
	[Keterangan] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Katalog_2]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katalog_2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kode_Promo] [nvarchar](max) NULL,
	[Kategory] [int] NOT NULL,
	[Merk] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[JangkaWaktu] [int] NOT NULL,
	[MonthsYears] [int] NOT NULL,
	[NominalHold] [decimal](18, 2) NOT NULL,
	[Penalty] [decimal](18, 2) NOT NULL,
	[ProgramName] [int] NOT NULL,
	[AttachmentKatalog] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IDKode_Promo2] [nvarchar](max) NULL,
	[Keterangan] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Katalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Katalog_20200722]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katalog_20200722](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kode_Promo] [nvarchar](max) NULL,
	[Kategory] [int] NOT NULL,
	[Merk] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[JangkaWaktu] [int] NOT NULL,
	[MonthsYears] [int] NOT NULL,
	[NominalHold] [decimal](18, 2) NOT NULL,
	[Penalty] [decimal](18, 2) NOT NULL,
	[ProgramName] [int] NOT NULL,
	[AttachmentKatalog] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IDKode_Promo2] [nvarchar](max) NULL,
	[Keterangan] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MasterJurnalOtomatis]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterJurnalOtomatis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Transaksi] [nvarchar](max) NULL,
	[JurnalType] [nvarchar](max) NULL,
	[DebetKredit] [int] NOT NULL,
	[InternalAccountName] [nvarchar](max) NULL,
	[InternalAccount] [nvarchar](max) NULL,
	[UangMuka] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[FPBeforeReceive] [nvarchar](max) NULL,
	[FPAfterReceive] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MasterJurnalOtomatis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NEWID_TEST]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NEWID_TEST](
	[ID] [uniqueidentifier] NOT NULL,
	[TESTCOLUMN] [char](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NEWSEQUENTIALID_TEST]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NEWSEQUENTIALID_TEST](
	[ID] [uniqueidentifier] NOT NULL,
	[TESTCOLUMN] [char](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParameterEmail]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParameterEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Group] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL DEFAULT ((0)),
	[IsDelete] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.ParameterEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParameterEmail_bc]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParameterEmail_bc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Group] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentRequest]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[PaymentRequestId] [nvarchar](max) NULL,
	[PaymentRequestDate] [datetime] NULL,
	[JurnalValueDate] [datetime] NULL,
	[JurnalName] [nvarchar](max) NULL,
	[TransactionCode] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[VendorInvoiceNo] [nvarchar](max) NULL,
	[VendorInvoiceDate] [datetime] NULL,
	[VendorInvoiceAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[PaymentRequestType] [int] NULL,
 CONSTRAINT [PK_dbo.PaymentRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pencadangan]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pencadangan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [nvarchar](max) NULL,
	[POId] [int] NULL,
	[JPId] [nvarchar](max) NULL,
	[PecadanganDate] [datetime] NULL,
	[PembalikanDate] [datetime] NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NULL,
	[IsDelete] [bit] NULL,
	[NominalPencadangan] [decimal](18, 2) NULL CONSTRAINT [DF__Pencadang__Nomin__59063A47]  DEFAULT ((0)),
	[startDate] [datetime] NULL CONSTRAINT [DF__Pencadang__start__59FA5E80]  DEFAULT ('1900-01-01T00:00:00.000'),
	[maturityDate] [datetime] NULL CONSTRAINT [DF__Pencadang__matur__5AEE82B9]  DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.Pencadangan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PencadanganTransaksi]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PencadanganTransaksi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PencadanganId] [int] NOT NULL,
	[Value_date] [datetime] NOT NULL,
	[ref_code] [nvarchar](max) NULL,
	[BranchId] [nvarchar](max) NULL,
	[BranchName] [nvarchar](max) NULL,
	[IntAccCategoryId] [nvarchar](max) NULL,
	[IntAccCategoryName] [nvarchar](max) NULL,
	[DebitKredit] [int] NOT NULL,
	[Narative] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PencadanganTransaksi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnquiryId] [int] NOT NULL,
	[DetailBarangId] [int] NULL,
	[POId] [nvarchar](max) NULL,
	[PODate] [datetime] NULL,
	[POGroupId] [nvarchar](max) NULL,
	[CategoryId] [nvarchar](max) NULL,
	[PolaId] [nvarchar](max) NULL,
	[UnitId] [int] NOT NULL,
	[TypeId] [nvarchar](max) NULL,
	[PaymentMethod] [int] NOT NULL,
	[PaymentType] [int] NOT NULL,
	[DPAmount] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NULL,
	[Currency] [int] NOT NULL,
	[NominalBarang] [decimal](18, 2) NOT NULL,
	[NominalPurchase] [decimal](18, 2) NOT NULL,
	[TotalPurchase] [decimal](18, 2) NOT NULL,
	[SupplierId] [nvarchar](max) NULL,
	[NilaiBuku] [decimal](18, 2) NULL,
	[NikEmp] [nvarchar](max) NULL,
	[DeptId] [nvarchar](max) NULL,
	[VendorQuotationNo] [nvarchar](max) NULL,
	[VendorQuotationDate] [datetime] NULL,
	[VendorQuotationAmount] [decimal](18, 2) NOT NULL,
	[VendorInvoiceNo] [nvarchar](max) NULL,
	[VendorInvoiceDate] [datetime] NULL,
	[VendorInvoiceAmount] [decimal](18, 2) NOT NULL,
	[PODescription] [nvarchar](max) NULL,
	[ApproveBy2] [nvarchar](max) NULL,
	[ApproveDate2] [datetime] NULL,
	[StatusData2] [int] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[UploadPO] [nvarchar](max) NULL,
	[Pajak] [decimal](18, 2) NULL DEFAULT ((0)),
	[AdditionalInfoDetailItem] [nvarchar](max) NULL,
	[NamaBank] [nvarchar](max) NULL,
	[NomorRekeningVendor] [nvarchar](max) NULL,
	[PurchaseReceiveBy] [nvarchar](max) NULL,
	[CCYKredit] [int] NULL,
	[CCYDebet] [int] NULL,
	[CostCenter] [varchar](10) NULL,
	[CatatanPO] [varchar](255) NULL,
 CONSTRAINT [PK_dbo.PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrder_20190326]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder_20190326](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnquiryId] [int] NOT NULL,
	[DetailBarangId] [int] NULL,
	[POId] [nvarchar](max) NULL,
	[PODate] [datetime] NULL,
	[POGroupId] [nvarchar](max) NULL,
	[CategoryId] [nvarchar](max) NULL,
	[PolaId] [nvarchar](max) NULL,
	[UnitId] [int] NOT NULL,
	[TypeId] [nvarchar](max) NULL,
	[PaymentMethod] [int] NOT NULL,
	[PaymentType] [int] NOT NULL,
	[DPAmount] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NULL,
	[Currency] [int] NOT NULL,
	[NominalBarang] [decimal](18, 2) NOT NULL,
	[NominalPurchase] [decimal](18, 2) NOT NULL,
	[TotalPurchase] [decimal](18, 2) NOT NULL,
	[SupplierId] [nvarchar](max) NULL,
	[NilaiBuku] [decimal](18, 2) NULL,
	[NikEmp] [nvarchar](max) NULL,
	[DeptId] [nvarchar](max) NULL,
	[VendorQuotationNo] [nvarchar](max) NULL,
	[VendorQuotationDate] [datetime] NULL,
	[VendorQuotationAmount] [decimal](18, 2) NOT NULL,
	[VendorInvoiceNo] [nvarchar](max) NULL,
	[VendorInvoiceDate] [datetime] NULL,
	[VendorInvoiceAmount] [decimal](18, 2) NOT NULL,
	[PODescription] [nvarchar](max) NULL,
	[ApproveBy2] [nvarchar](max) NULL,
	[ApproveDate2] [datetime] NULL,
	[StatusData2] [int] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[UploadPO] [nvarchar](max) NULL,
	[Pajak] [decimal](18, 2) NULL,
	[AdditionalInfoDetailItem] [nvarchar](max) NULL,
	[NamaBank] [nvarchar](max) NULL,
	[NomorRekeningVendor] [nvarchar](max) NULL,
	[PurchaseReceiveBy] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder_20190610]    Script Date: 2020-11-26 09:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder_20190610](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnquiryId] [int] NOT NULL,
	[DetailBarangId] [int] NULL,
	[POId] [nvarchar](max) NULL,
	[PODate] [datetime] NULL,
	[POGroupId] [nvarchar](max) NULL,
	[CategoryId] [nvarchar](max) NULL,
	[PolaId] [nvarchar](max) NULL,
	[UnitId] [int] NOT NULL,
	[TypeId] [nvarchar](max) NULL,
	[PaymentMethod] [int] NOT NULL,
	[PaymentType] [int] NOT NULL,
	[DPAmount] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NULL,
	[Currency] [int] NOT NULL,
	[NominalBarang] [decimal](18, 2) NOT NULL,
	[NominalPurchase] [decimal](18, 2) NOT NULL,
	[TotalPurchase] [decimal](18, 2) NOT NULL,
	[SupplierId] [nvarchar](max) NULL,
	[NilaiBuku] [decimal](18, 2) NULL,
	[NikEmp] [nvarchar](max) NULL,
	[DeptId] [nvarchar](max) NULL,
	[VendorQuotationNo] [nvarchar](max) NULL,
	[VendorQuotationDate] [datetime] NULL,
	[VendorQuotationAmount] [decimal](18, 2) NOT NULL,
	[VendorInvoiceNo] [nvarchar](max) NULL,
	[VendorInvoiceDate] [datetime] NULL,
	[VendorInvoiceAmount] [decimal](18, 2) NOT NULL,
	[PODescription] [nvarchar](max) NULL,
	[ApproveBy2] [nvarchar](max) NULL,
	[ApproveDate2] [datetime] NULL,
	[StatusData2] [int] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[UploadPO] [nvarchar](max) NULL,
	[Pajak] [decimal](18, 2) NULL,
	[AdditionalInfoDetailItem] [nvarchar](max) NULL,
	[NamaBank] [nvarchar](max) NULL,
	[NomorRekeningVendor] [nvarchar](max) NULL,
	[PurchaseReceiveBy] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseReceive]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReceive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[PurchaseReceiveId] [nvarchar](max) NULL,
	[PurchaseReceiveDate] [datetime] NULL,
	[Receiver] [nvarchar](max) NULL,
	[Condition] [int] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[PelunasanId] [nvarchar](max) NULL,
	[JurnalValueDate] [datetime] NULL,
	[ApproveReceiveDateTime] [datetime] NULL,
	[ApproveReceiveBy] [nvarchar](max) NULL,
	[JurnalName] [nvarchar](max) NULL,
	[VendorInvoiceNo] [nvarchar](max) NULL,
	[VendorInvoiceDate] [datetime] NULL,
	[VendorInvoiceAmount] [decimal](18, 2) NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.PurchaseReceive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[test]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test](
	[profile_name] [varchar](1000) NULL,
	[recipients] [varchar](1000) NULL,
	[copy_recipients] [varchar](1000) NULL,
	[subject] [varchar](1000) NULL,
	[body] [varchar](1000) NULL,
	[body_format] [varchar](1000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UploadNasabah]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadNasabah](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoRekening] [nvarchar](max) NULL,
	[AttachmentSPNasabah] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[StatusData] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ApproveBy] [nvarchar](max) NULL,
	[ApproveDate] [datetime] NULL,
	[RejectBy] [nvarchar](max) NULL,
	[RejectDate] [datetime] NULL,
	[RejectReason] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_dbo.UploadNasabah] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ListAccountPencadangan]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Achmad Ichwan Yasir
-- Create date: 2016 11 14
-- Description:	Function Untuk Pencadangan
-- Select *from fn_ListAccountPencadangan('BiayaBunga')
-- =============================================
CREATE FUNCTION [dbo].[fn_ListAccountPencadangan]
(	
	-- Param
	-- BddPromosi, KspHutang, KewPajak, RekPerantara, BiayaBunga
	@key varchar(20) 
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT Number = a.account_no, Deskripsi = account_title_1 
	from SQL_TEMENOS.dbo.ACCOUNT a 
	Where (@key = 'BddPromosi' and a.account_no = 'IDR1212300010100')
	OR (@key = 'KspHutang' and a.account_no = 'IDR1505100010100')
	OR (@key = 'KewPajak' and a.account_no = 'IDR1501100010100')
	OR (@key = 'RekPerantara' and a.account_no = 'IDR1508100200100')
	UNION ALL
	Select Number = c.system_ind+ c.[@ID] Collate Database_Default, Deskripsi = C.[description]  Collate Database_Default
	From SQL_TEMENOS.dbo.CATEGORY C 
	Where (C.[@ID] = '66552' and @key = 'BiayaBunga')
)

GO
/****** Object:  View [dbo].[V_Data_LLG_RTGS]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_Data_LLG_RTGS]
AS
SELECT
	[No. Rekening] = account_number
	, LLG = SUM(isLLG)
	, RTGS = SUM(isRTGS)
FROM
(
	SELECT
		account_number 
		, value_date
		, amount_lcy
		, isLLG = CASE WHEN amount_lcy BETWEEN -100000000 AND 0 THEN 1 ELSE 0 END
		, isRTGS = CASE WHEN amount_lcy < -100000000 THEN 1 ELSE 0 END
		, transaction_code
		, narrative
	FROM SQL_TEMENOS.dbo.STMT_ENTRY 
	WHERE transaction_code = 201
	AND value_date BETWEEN '1 May 2018' AND '31 May 2018'
	AND account_number IN(
		SELECT 
			account_no 
		FROM SQL_TEMENOS.dbo.ACCOUNT acc
		WHERE category IN (SELECT [@ID] COLLATE DATABASE_DEFAULT FROM SQL_TEMENOS.dbo.CATEGORY 
		WHERE [description] LIKE 'Giro%')
	)
) data
GROUP BY account_number
--ORDER BY account_number
GO
/****** Object:  View [dbo].[V_Data_LLG_RTGS_DETAIL]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SELECT * FROM V_DATA_LLG_RTGS
CREATE VIEW [dbo].[V_Data_LLG_RTGS_DETAIL]
AS

	SELECT
		account_number 
		, value_date
		, amount_lcy
		--, isLLG = CASE WHEN amount_lcy BETWEEN -100000000 AND 0 THEN 1 ELSE 0 END
		--, isRTGS = CASE WHEN amount_lcy < -100000000 THEN 1 ELSE 0 END
		, transaction_code
		, narrative
	FROM SQL_TEMENOS.dbo.STMT_ENTRY 
	WHERE transaction_code = 201
	AND value_date BETWEEN '1 May 2018' AND '31 May 2018'
	AND account_number IN(
		SELECT 
			account_no 
		FROM SQL_TEMENOS.dbo.ACCOUNT acc
		WHERE category IN (SELECT [@ID] COLLATE DATABASE_DEFAULT FROM SQL_TEMENOS.dbo.CATEGORY 
		WHERE [description] LIKE 'Giro%')
	)
--ORDER BY account_number
GO
/****** Object:  View [dbo].[View_MappingPl]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_MappingPl]
AS
	SELECT 'PL'+[@ID] COLLATE DATABASE_DEFAULT AS Id, 
			KodeCabang = co_code COLLATE DATABASE_DEFAULT, 
			[description] COLLATE DATABASE_DEFAULT AS [description]
	FROM SQL_TEMENOS.dbo.CATEGORY
	WHERE system_ind = 'PL'
	UNION ALL
	SELECT [@ID] COLLATE DATABASE_DEFAULT AS Id, 
			KodeCabang = co_code COLLATE DATABASE_DEFAULT, 
			account_title_1 COLLATE DATABASE_DEFAULT AS [description]
	FROM SQL_TEMENOS.dbo.ACCOUNT
	WHERE customer_no IS NULL


GO
ALTER TABLE [dbo].[NEWID_TEST] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[NEWID_TEST] ADD  DEFAULT (replicate('X',(2000))) FOR [TESTCOLUMN]
GO
ALTER TABLE [dbo].[NEWSEQUENTIALID_TEST] ADD  DEFAULT (newsequentialid()) FOR [ID]
GO
ALTER TABLE [dbo].[NEWSEQUENTIALID_TEST] ADD  DEFAULT (replicate('X',(2000))) FOR [TESTCOLUMN]
GO
ALTER TABLE [dbo].[AmortisasiRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AmortisasiRequest_dbo.DeliveryOrder_DOid] FOREIGN KEY([DOid])
REFERENCES [dbo].[DeliveryOrder] ([Id])
GO
ALTER TABLE [dbo].[AmortisasiRequest] CHECK CONSTRAINT [FK_dbo.AmortisasiRequest_dbo.DeliveryOrder_DOid]
GO
ALTER TABLE [dbo].[AmortisasiRequest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AmortisasiRequest_dbo.PurchaseOrder_POId] FOREIGN KEY([POId])
REFERENCES [dbo].[PurchaseOrder] ([Id])
GO
ALTER TABLE [dbo].[AmortisasiRequest] CHECK CONSTRAINT [FK_dbo.AmortisasiRequest_dbo.PurchaseOrder_POId]
GO
ALTER TABLE [dbo].[KartuAmortisasi]  WITH CHECK ADD  CONSTRAINT [FK_dbo.KartuAmortisasi_dbo.AmortisasiRequest_AmortisasiRequestId] FOREIGN KEY([AmortisasiRequestId])
REFERENCES [dbo].[AmortisasiRequest] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KartuAmortisasi] CHECK CONSTRAINT [FK_dbo.KartuAmortisasi_dbo.AmortisasiRequest_AmortisasiRequestId]
GO
/****** Object:  StoredProcedure [dbo].[FND_Process_Finalize]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[FND_Process_Finalize]
/*
	CreateBy	: Hannar
	CreateDate	: 20200611
	Objective	: Finalize setelah Proses berjalan

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
*/

@pSprocName					varchar(50),
@pErrMsg					varchar(200) output
	
as 

set nocount on

--- Variable
declare
	@ProcessDate			datetime,
	@Today					datetime,
	@Tomorrow				datetime,
	@DependenceProcessId			smallint,
	@ProcessBatchGroup				tinyint,
	@ProcessDailyType				tinyint,
	@IsOnceInADay					bit,
	@IsProcessing					tinyint,
	@IsFinished						tinyint,
	@DependenceSprocName			varchar(50),
	@DependenceIsFinished			tinyint

--- Mulai
set @ProcessDate	= getdate()
--set @Today = dbo.fn_KPNS_ControlDatetime('CurrentSystemDate')
set @Today = dbo.fn_FND_ControlDatetime('DateCurrent')
set	@Tomorrow		= dateadd(dd,1,@Today)

--- Validasi
select 
	@DependenceProcessId	= DependenceProcessId,
	@ProcessBatchGroup		= ProcessBatchGroup,
	@ProcessDailyType		= ProcessDailyType,
	@IsOnceInADay			= IsOnceInADay,
	@IsProcessing			= IsProcessing,
	@IsFinished				= IsFinished
from dbo.FND_ProcessList_TR
where SprocName = @pSprocName

if @DependenceProcessId is null
begin
	select @pErrMsg = 'Sproc Tidak Dikenal'
	goto APPERR
end

if @IsProcessing = 0
begin
	select @pErrMsg = 'Proses Belum Berjalan'
	goto APPERR
end


--- Simpan
	update dbo.FND_ProcessList_TR
	set IsProcessing = 0, IsFinished = 1, ProcessEnd = @ProcessDate
	where SprocName = @pSprocName

	if @@error <> 0
	begin
		select @pErrMsg = 'Gagal Update KPNS_ProcessList_TR'
		goto SYSERR
	end

return 0
----------------------------------------
	
APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '[Finalize:'+@pSprocName+']'+char(10)+isnull(@pErrMsg,'')

	return 1

SYSERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '[Finalize:'+@pSprocName+']'+char(10)+isnull(@pErrMsg,'')

	return 2

GO
/****** Object:  StoredProcedure [dbo].[FND_Process_Initiation]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[FND_Process_Initiation]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Persiapan sebelum Proses berjalan

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
		ReturnValue:
			0 --> Proses bisa dijalankan
			1 --> Proses kena validasi
			2 --> Error system
			3 --> Proses engga perlu jalan hari ini
			9 --> Proses Sudah Jalan

		ProcessDailyType
			1 --> Daily Process
			2 --> Begin Of Month Process
			3 --> End Of Month Process

		ProcessBatchGroup
			1 --> 'Begin Of Day'
			2 --> 'End Of Day'
			3 --> 'All Day'

*/

@pSprocName					varchar(50),
@pErrMsg					varchar(200) output
	
as 

set nocount on

--- Variable
declare
	@ProcessDate			datetime,
	@Today					datetime,
	@Tomorrow				datetime,
	@DependenceProcessId			smallint,
	@ProcessBatchGroup				tinyint,
	@ProcessDailyType				tinyint,
	@IsOnceInADay					bit,
	@IsProcessing					tinyint,
	@IsFinished						tinyint,
	@DependenceSprocName			varchar(50),
	@DependenceIsFinished			tinyint,
	@IsEndOfDay						bit

--- Mulai
set @ProcessDate = getdate()
--set @Today = dbo.fn_KPNS_ControlDatetime('CurrentSystemDate')
set @Today = dbo.fn_FND_ControlDatetime('DateCurrent')
set	@Tomorrow = dateadd(dd,1,@Today)
set @IsEndOfDay = dbo.fn_FND_ControlInteger('IsEndOfDay')

--- Validasi
select 
	@DependenceProcessId	= DependenceProcessId,
	@ProcessBatchGroup		= ProcessBatchGroup,
	@ProcessDailyType		= ProcessDailyType,
	@IsOnceInADay			= IsOnceInADay,
	@IsProcessing			= IsProcessing,
	@IsFinished				= IsFinished
from dbo.FND_ProcessList_TR
where SprocName = @pSprocName


if @DependenceProcessId is null
begin
	select @pErrMsg = 'Sproc Tidak Dikenal'
	goto APPERR
end


--- Kalau Sehari Sekali dan Sudah Jalan
if @IsOnceInADay = 1 and @IsFinished = 1
begin
	return 9
end

if @IsProcessing = 1
begin
	return 0	--> proses tinggal diulang lagi
end


if @DependenceProcessId = 0	--- Proses paling awal, engga perlu Preparation
	return 0

--- Cek Dependence udah jalan ?
select 
	@DependenceSprocName		= SprocName,
	@DependenceIsFinished		= IsFinished
from dbo.FND_ProcessList_TR
	where ProcessId = @DependenceProcessId

if @DependenceSprocName is null
begin
	select @pErrMsg = 'Sproc Dependence Tidak Ditemukan'
	goto APPERR	
end

if @DependenceIsFinished = 0
begin
	select @pErrMsg = 'Waiting Sproc Dependence '+@DependenceSprocName
	goto APPERR	
end

--- Cek EOM / BOM
if @ProcessDailyType = 2 and datepart(dd,@Today) <> 1
begin
	select @pErrMsg = 'Proses BOM Tidak Perlu Jalan Hari Ini'
	goto BYPASS	
end
else if @ProcessDailyType = 3 and datepart(mm,@Today) = datepart(mm,@Tomorrow) 
begin
	select @pErrMsg = 'Proses EOM Tidak Perlu Jalan Hari Ini'
	goto BYPASS	
end

--- Cek Sudah Akhir Hari ?
if @ProcessBatchGroup = 3 and @IsEndOfDay = 1		--- untuk Proses AllDay
begin
	select @pErrMsg = 'Sudah Akhir Hari'
	goto APPERR	
end


--- Simpan
	update dbo.FND_ProcessList_TR
	set IsProcessing = 1, ProcessStart = @ProcessDate
	where SprocName = @pSprocName

	if @@error <> 0
	begin
		select @pErrMsg = 'Gagal Update KPNS_ProcessList_TR'
		goto SYSERR
	end

return 0
----------------------------------------
	
APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '[Preparation:'+@pSprocName+']'+char(10)+isnull(@pErrMsg,'')

	return 1

SYSERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '[Initiation:'+@pSprocName+']'+char(10)+isnull(@pErrMsg,'')

	return 2

BYPASS:
	if @@trancount > 0
		ROLLBACK TRAN

	update dbo.FND_ProcessList_TR
	set IsProcessing = 0, IsFinished = 1, ProcessEnd = @ProcessDate
	where SprocName = @pSprocName

	set @pErrMsg = '[Initiation:'+@pSprocName+']'+char(10)+isnull(@pErrMsg,'')

	return 3	--> dianggap sudah berjalan / berhasil


GO
/****** Object:  StoredProcedure [dbo].[FND_Process_Master]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[FND_Process_Master]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Proses Master

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
*/

@pErrMsg					varchar(200) output
	
as 

set nocount on

--- Variable
declare
	@SprocName				varchar(50),
	@ReturnCode				tinyint,
	@CutOffHourBOD			bigint, 
	@ProcessId				smallint, 
	@DependenceProcessId	smallint,
	@SprocNameProcess		varchar(50),
	@Stat					nvarchar(500),
	@Param					nvarchar(100)

--- Mulai
set @SprocName		= object_name(@@procid)
set @Stat			= '' 

declare process_cur cursor local read_only fast_forward
for select ProcessId, DependenceProcessId, SprocName
from dbo.FND_ProcessList_TR
order by ProcessId

open process_cur

while 1=1
begin
	fetch process_cur into 	@ProcessId, @DependenceProcessId ,@SprocNameProcess
	if @@FETCH_STATUS <> 0
		break
	
	set @Stat = 'exec dbo.' + @SprocNameProcess + ' @pErrMsg output'
	set @Param = '@pErrMsg varchar(200) output'
	
	exec sp_executesql @Stat, @Param, @pErrMsg = @pErrMsg output
	if @@ERROR <> 0
	begin
		set @pErrMsg = 'Gagal ' + @SprocNameProcess 
		break
	end
end

close process_cur
deallocate process_cur

if @pErrMsg is not null
	goto SYSERR

return 0
----------------------------------------
	
APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+@SprocName+']'+char(10)+isnull(@pErrMsg,'')

	return 1

SYSERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+@SprocName+']'+char(10)+isnull(@pErrMsg,'')

	return 2

GO
/****** Object:  StoredProcedure [dbo].[FND_Prs_EOD_CustomerEntry]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[FND_Prs_EOD_CustomerEntry]
/*
	CreateBy	: Hannar
	CreateDate	: 20200612
	Objective	: Proses Create CIF di Point Reward (FND_Point_TM)

	Notes
		Dibuat di EOD karena BOD data T24 belum tersedia
*/

	@pErrMsg					varchar(200) output
	
as 

set nocount on

---- Variable
declare
	@ProcessDate				datetime,
	@Today						date,
	@Yesterday					date,
	@SprocName				varchar(50),
	@ReturnCode				tinyint


--- Mulai
set @ProcessDate	= getdate()
set @Today			= dbo.fn_FND_ControlDatetime('DateCurrent')
set @Yesterday		= dateadd(dd,-1,@Today)
set @SprocName		= object_name(@@procid)

--- Proses Preparation
exec @ReturnCode = dbo.FND_Process_Initiation @SprocName, @pErrMsg output

if @ReturnCode <> 0		-- keluar program
	return @ReturnCode

if @@error <> 0
	goto SYSERR

---- Temporary Table
create table #ListCIF (
	CIFNumber				varchar(20)			null,
	CIFName					varchar(50)			null)


---- Mulai
insert into #ListCIF (
	CIFNumber, CIFName )
select distinct 
	a.customer_no, a.account_title_1
from SQL_TEMENOS.dbo.ACCOUNT_HISTORI a
	join dbo.FND_Parameter_List_TR b
		on a.category COLLATE DATABASE_DEFAULT = b.AlphabeticalCode COLLATE DATABASE_DEFAULT 
			and b.ListName = 'ProductCategory'
where a.batch_date = @Yesterday
	
---- SIMPAN
BEGIN TRAN
	---- a. CIF Udah Pernah Punya Point
	update dbo.FND_Point_TM
	set 
		PointBalance = 0,
		ReferenceStartDate = ReferenceStartDate,
		ReferenceBalance = 0,
		CreatedDate = @ProcessDate,
		CIFStatus = 'A',
		TerminateDate = null,
		NextExpiredDate = null,
		NextExpiredAmount = null,
		LastTopUpDate = null,
		LastRedeemDate = null
	from dbo.FND_Point_TM a
		join #ListCIF b
			on a.CIFNumber COLLATE DATABASE_DEFAULT = b.CIFNumber COLLATE DATABASE_DEFAULT 
	where a.CIFStatus = 'T'
		and b.CIFNumber is null

	if @@error <> 0
	begin
		set @pErrMsg = 'Gagal Update FND_Point_TM (1)'
		goto SYSERR
	end

	insert into dbo.FND_Point_Transaction_TT(
		CIFNumber, TransactionDate, TransactionType,
		TransactionRemark, TransactionAmount, TransactionBalance,
		IsTopUp, SourceSystem, SprocName)
	select a.CIFNumber, @ProcessDate, 0,
		'', 0, 0,
		0, 'Funding', @SprocName
	from dbo.FND_Point_TM a
		join #ListCIF b
			on a.CIFNumber COLLATE DATABASE_DEFAULT = b.CIFNumber COLLATE DATABASE_DEFAULT 
	where a.CIFStatus = 'T'
		and b.CIFNumber is null
		
	if @@error <> 0
	begin
		set @pErrMsg = 'Gagal Insert FND_Point_Transaction_TT (1)'
		goto SYSERR
	end	

	---- b. New CIF
	insert into dbo.FND_Point_TM(
		CIFNumber, CIFName, ReferenceStartDate )
	select a.CIFNumber, a.CIFName , @ProcessDate
	from #ListCIF a
		left join dbo.FND_Point_TM b
			on a.CIFNumber COLLATE DATABASE_DEFAULT = b.CIFNumber COLLATE DATABASE_DEFAULT 
				and b.CIFStatus = 'A'
	where b.CIFNumber is null

	if @@error <> 0
	begin
		set @pErrMsg = 'Gagal Insert FND_Point_TM'
		goto SYSERR
	end

	insert into dbo.FND_Point_Transaction_TT(
		CIFNumber, TransactionDate, TransactionType,
		TransactionRemark, TransactionAmount, TransactionBalance,
		IsTopUp, SourceSystem, SprocName)
	select a.CIFNumber, @ProcessDate, 0,
		'', 0, 0,
		0, 'Funding', @SprocName
	from #ListCIF a
		left join dbo.FND_Point_TM b
			on a.CIFNumber COLLATE DATABASE_DEFAULT = b.CIFNumber COLLATE DATABASE_DEFAULT 
				and b.CIFStatus = 'A'
	where b.CIFNumber is null
		
	if @@error <> 0
	begin
		set @pErrMsg = 'Gagal Insert FND_Point_Transaction_TT (2)'
		goto SYSERR
	end	

	---- c. Terminate CIF
	update dbo.FND_Point_TM
	set 
		CIFStatus = 'T',
		TerminateDate = @ProcessDate
	from dbo.FND_Point_TM a
		left join #ListCIF b
			on a.CIFNumber COLLATE DATABASE_DEFAULT = b.CIFNumber COLLATE DATABASE_DEFAULT 
	where a.CIFStatus = 'A'
		and b.CIFNumber is null

	if @@error <> 0
	begin
		set @pErrMsg = 'Gagal Update FND_Point_TM (3)'
		goto SYSERR
	end

COMMIT TRAN

--- Proses Finalize
exec @ReturnCode = dbo.FND_Process_Finalize @SprocName, @pErrMsg output

if @ReturnCode <> 0		-- keluar program
	return @ReturnCode

if @@error <> 0
	goto SYSERR

 
return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')

	return 1


SYSERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')

	return 2

GO
/****** Object:  StoredProcedure [dbo].[FND_Query_TransactionMBanking]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[FND_Query_TransactionMBanking]
/*
	CreateBy	: Hannar
	CreateDate	: 20200611
	Objective	: Saldo dan Transaksi Point

	Revised (Date, NIK, Description)
	-----------------------------------------------------------

	Notes:
		
*/

@pCIFNumber					varchar(15),
@pErrMsg					varchar(200) output
	
as 

set nocount on

---- Variable
declare
	@CIFName				varchar(50),
	@PointBalance			int,
	@ReferenceStartDate		date,
	@CIFStatus				char(1),
	@NextExpiredDate		date,
	@NextExpiredAmount		int,
	@LastTopUpDate			date,
	@LastRedeemDate			date


--- Validasi 
if isnull(@pCIFNumber,'') = ''
begin
	select @pErrMsg = 'CIFNumber Harus Diisi'
	goto APPERR
end

--- Data Point Master
select
	@CIFName			=	CIFName,
	@PointBalance		=	PointBalance,
	@ReferenceStartDate	=	ReferenceStartDate,
	@CIFStatus			=	CIFStatus,
	@NextExpiredDate	=	NextExpiredDate,
	@NextExpiredAmount	=	NextExpiredAmount,
	@LastTopUpDate		=	LastTopUpDate,
	@LastRedeemDate		=	LastRedeemDate
from dbo.FND_Point_TM
where CIFNumber = @pCIFNumber

if @CIFName is null or @CIFStatus = 'T'
begin
	select @pErrMsg = 'Tidak Eligible Mendapatkan Point'
	goto APPERR
end


---- Result

select
	@pCIFNumber as CIFNumber,
	@CIFName	as CIFName,
	@PointBalance as PointBalance,
	@NextExpiredDate as NextExpiredDate,
	@NextExpiredAmount as NextExpiredAmount,
	@LastTopUpDate as LastTopUpDate,
	@LastRedeemDate as	LastRedeemDate

select
	a.TransactionDate, a.TransactionType,
	b.ItemName as TransactionDescription, 
	case when a.TransactionAmount >= 0 then a.TransactionAmount else 0 end as PenambahanPoin,
	case when a.TransactionAmount < 0 then -a.TransactionAmount else 0 end as RedeemPoin,
	TransactionBalance
from dbo.FND_Point_Transaction_TT a
	join dbo.FND_Parameter_List_TR b
		on a.TransactionType = b.ItemCode
			and b.ListName = 'TransactionType'
where a.CIFNumber = @pCIFNumber
	and a.TransactionDate >= @ReferenceStartDate
order by a.PointId

return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')

	return 1


SYSERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')

	return 2

GO
/****** Object:  StoredProcedure [dbo].[GetPageAmortisasiRequest]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Calvin
-- Create date: 12112018
-- Description:	<Get Page Amortisasi Request>
-- exec [dbo].[GetPageAmortisasiRequest] 'ID0010001', 'GETDATA',''
-- =============================================

CREATE PROCEDURE [dbo].[GetPageAmortisasiRequest]

@cabanglogin varchar(100),
@status varchar(100),
@searchText varchar(100)	
AS
BEGIN
	SET NOCOUNT ON;
	declare @cabang varchar (100)
	
	IF @status = 'GETDATA'
	BEGIN
		IF EXISTS (select * from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin)
		BEGIN
		select top 1 @cabang = KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO
		where KodeCabangWilayahKliring = @cabanglogin

			select c.MaturityDate as 'pR_MaturityDate', c.StartDate as 'pR_StartDate', c.Cabang as 'PR_Cabang',  a.Id,
			b.TotalPurchase as 'pO_TotalPurchase',
			c.TglBukaRekening as 'pR_TglBukaRekening',
			c.JenisTabungan as 'PR_JenisTabungan',
			c.NoRekening as 'PR_NoRekening',
			c.NamaNasabah as 'PR_NamaNasabah',
			c.DraftPRId as 'PR_DraftPRId',
			c.DraftPRDate as 'pR_DraftPRDate',
			c.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			c.Requester as 'PR_Requester',
			c.PRId as 'PR_PRId',
			c.PRDate as 'pR_PRDate',
			c.RewardBudget as 'pR_RewardBudget',
			b.PolaId as 'PO_PolaId',
			b.TypeId as 'PO_TypeId',
			b.Quantity as 'PO_Quantity',
			b.SupplierId as 'PO_SupplierId',
			b.NilaiBuku as 'pO_NilaiBuku',
			b.NikEmp as 'PO_NikEmp',
			b.DeptId as 'PO_DeptId',
			b.VendorQuotationNo as 'PO_VendorQuotationNo',
			b.VendorQuotationDate as 'PO_VendorQuotationDate',
			b.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			b.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			b.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			b.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			RequestId,
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			RequestId,
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].[AmortisasiRequest] a
			join [SQL_FUNDING].[dbo].PurchaseOrder b on a.POId = b.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput c on b.EnquiryId = c.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on c.Id = e.EnquiryId 
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on c.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where 
				--c.Cabang in (@cabang, @cabanglogin) and a.IsDelete = 0
				--(c.Cabang=@cabanglogin or c.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
				--and 
				c.JenisTabungan in ('6502','6008')
				and a.IsDelete = 0
				and (f.[company_name] like '%' + @searchText + '%'
				or a.RequestId like '%' + @searchText + '%') 
				order by a.id desc

		END
		ELSE
		begin
			select c.MaturityDate as 'pR_MaturityDate',c.StartDate as 'pR_StartDate',  c.Cabang as 'PR_Cabang', a.Id,
			b.TotalPurchase as 'pO_TotalPurchase',
			c.TglBukaRekening as 'pR_TglBukaRekening',
			c.JenisTabungan as 'PR_JenisTabungan',
			c.NoRekening as 'PR_NoRekening',
			c.NamaNasabah as 'PR_NamaNasabah',
			c.DraftPRId as 'PR_DraftPRId',
			c.DraftPRDate as 'pR_DraftPRDate',
			c.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			c.Requester as 'PR_Requester',
			c.PRId as 'PR_PRId',
			c.PRDate as 'pR_PRDate',
			c.RewardBudget as 'pR_RewardBudget',
			b.PolaId as 'PO_PolaId',
			b.TypeId as 'PO_TypeId',
			b.Quantity as 'PO_Quantity',
			b.SupplierId as 'PO_SupplierId',
			b.NilaiBuku as 'pO_NilaiBuku',
			b.NikEmp as 'PO_NikEmp',
			b.DeptId as 'PO_DeptId',
			b.VendorQuotationNo as 'PO_VendorQuotationNo',
			b.VendorQuotationDate as 'PO_VendorQuotationDate',
			b.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			b.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			b.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			b.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			RequestId,
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].[AmortisasiRequest] a
			join [SQL_FUNDING].[dbo].PurchaseOrder b on a.POId = b.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput c on b.EnquiryId = c.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on c.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on c.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where c.Cabang = @cabanglogin 
			and a.IsDelete = 0
			and c.JenisTabungan in ('6502','6008')
			and (f.[company_name] like '%' + @searchText + '%'
				or a.RequestId like '%' + @searchText + '%') 			
		END	
	END
	IF @status = 'APPROVE'
	BEGIN
		--IF EXISTS (select * from [10.100.2.120\APPSERVERDEV].SQL_Satellite.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin)
		BEGIN
		--select top 1 @cabang = KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO
		--where KodeCabangWilayahKliring = @cabanglogin
			select  c.MaturityDate as 'pR_MaturityDate', c.StartDate as 'pR_StartDate', c.Cabang as 'PR_Cabang', a.Id,
			 RequestId,
			b.TotalPurchase as 'pO_TotalPurchase',
			c.TglBukaRekening as 'pR_TglBukaRekening',
			c.JenisTabungan as 'PR_JenisTabungan',
			c.NoRekening as 'PR_NoRekening',
			c.NamaNasabah as 'PR_NamaNasabah',
			c.DraftPRId as 'PR_DraftPRId',
			c.DraftPRDate as 'pR_DraftPRDate',
			c.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			c.Requester as 'PR_Requester',
			c.PRId as 'PR_PRId',
			c.PRDate as 'pR_PRDate',
			c.RewardBudget as 'pR_RewardBudget',
			b.PolaId as 'PO_PolaId',
			b.TypeId as 'PO_TypeId',
			b.Quantity as 'PO_Quantity',
			b.SupplierId as 'PO_SupplierId',
			b.NilaiBuku as 'pO_NilaiBuku',
			b.NikEmp as 'PO_NikEmp',
			b.DeptId as 'PO_DeptId',
			b.VendorQuotationNo as 'PO_VendorQuotationNo',
			b.VendorQuotationDate as 'PO_VendorQuotationDate',
			b.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			b.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			b.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			b.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			RequestId,
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].[AmortisasiRequest] a
			join [SQL_FUNDING].[dbo].PurchaseOrder b on a.POId = b.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput c on b.EnquiryId = c.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on c.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on c.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where --c.Cabang in (@cabang, @cabanglogin) and a.IsDelete = 0 and a.StatusData != 5
				--(c.Cabang=@cabanglogin or c.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
				--and 
				a.IsDelete = 0
				and c.JenisTabungan in ('6502','6008')
				and a.StatusData != 5
				and (f.[company_name] like '%' + @searchText + '%'
				or a.RequestId like '%' + @searchText + '%')
				order by a.Id desc
		END
		--ELSE
		begin
			select  c.MaturityDate as 'pR_MaturityDate', c.StartDate as 'pR_StartDate', c.Cabang as 'PR_Cabang', a.Id,
			 RequestId,
			b.TotalPurchase as 'pO_TotalPurchase',
			c.TglBukaRekening as 'pR_TglBukaRekening',
			c.JenisTabungan as 'PR_JenisTabungan',
			c.NoRekening as 'PR_NoRekening',
			c.NamaNasabah as 'PR_NamaNasabah',
			c.DraftPRId as 'PR_DraftPRId',
			c.DraftPRDate as 'pR_DraftPRDate',
			c.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			c.Requester as 'PR_Requester',
			c.PRId as 'PR_PRId',
			c.PRDate as 'pR_PRDate',
			c.RewardBudget as 'pR_RewardBudget',
			b.PolaId as 'PO_PolaId',
			b.TypeId as 'PO_TypeId',
			b.Quantity as 'PO_Quantity',
			b.SupplierId as 'PO_SupplierId',
			b.NilaiBuku as 'pO_NilaiBuku',
			b.NikEmp as 'PO_NikEmp',
			b.DeptId as 'PO_DeptId',
			b.VendorQuotationNo as 'PO_VendorQuotationNo',
			b.VendorQuotationDate as 'PO_VendorQuotationDate',
			b.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			b.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			b.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			b.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			RequestId,
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].[AmortisasiRequest] a
			join [SQL_FUNDING].[dbo].PurchaseOrder b on a.POId = b.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput c on b.EnquiryId = c.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on c.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on c.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where c.Cabang = @cabanglogin and a.IsDelete = 0 and a.StatusData != 5
			and c.JenisTabungan in ('6502','6008')
			and (f.[company_name] like '%' + @searchText + '%'
				or a.RequestId like '%' + @searchText + '%')
		END
	END
	IF @status = 'GETDATAPURCHASE'
	BEGIN
		IF EXISTS (select * from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin)
		BEGIN
		select top 1 @cabang = KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO
		where KodeCabangWilayahKliring = @cabanglogin
			
		select
		b.Id,
		b.EnquiryId,
		TglBukaRekening,
		JenisTabungan,
		Cabang,
		f.company_name as NamaCabang ,
		NoRekening ,
		NamaNasabah ,
		DraftPRId ,
		DraftPRDate ,
		PromotionCode ,
		KategoriBarang ,
		TypeBarang ,
		Merek,
		e.Quantity as 'QuantityBarang',
		Warna ,
		Penalty ,
		StartDate ,
		MaturityDate ,
		Requester ,
		PRId ,
		PRDate ,
		RewardBudget ,
		AttachmentSPNasabah ,
		AttachmentMemoDireksi,
		e.Id as 'DetailBarangId',
		POId ,
		PODate ,
		POGroupId ,
		CategoryId ,
		PolaId ,
		UnitId,
		TypeId ,
		PaymentMethod ,
		PaymentType ,
		DPAmount,
		b.Quantity as 'Quantity',
		Currency,
		NominalBarang ,
		NominalPurchase ,
		TotalPurchase ,
		Pajak ,
		SupplierId ,
		NilaiBuku ,
		NikEmp ,
		DeptId ,
		VendorQuotationNo ,
		VendorQuotationDate ,
		VendorQuotationAmount ,
		VendorInvoiceNo ,
		VendorInvoiceDate ,
		VendorInvoiceAmount ,
		PODescription ,
		UploadPO ,
		b.CreateBy ,
		b.CreateDate ,
		b.UpdateBy ,
		b.UpdateDate ,
		b.ApproveBy ,
		b.ApproveDate ,
		b.StatusData,
		b.ApproveBy2 ,
		b.ApproveDate2 ,
		NoCif,
		company_name ,
		CatatanCabang ,
		KodePromosi ,
		e.KategoriBarang as KategoriBarangID,
		Keterangan,
		AdditionalInfoDetailItem ,
		NamaBank,
		NomorRekeningVendor
        from [SQL_FUNDING].[dbo].PurchaseOrder b
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput c on b.EnquiryId = c.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on c.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on c.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where (c.Cabang=@cabanglogin or c.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
			and b.IsDelete = 0
			and c.JenisTabungan in ('6502','6008')
			and (f.[company_name] like '%' + @searchText + '%'
				or b.POId like '%' + @searchText + '%')
			select * from [SQL_FUNDING].[dbo].DetailBarang		
		END	
		ELSE
	BEGIN
		SELECT a.Id,        
		a.POId,        
		PODate,        
		NoCif,        
		NoRekening,        
		NamaNasabah     
		JenisTabungan,         
		b.Cabang,        
		TglBukaRekening,        
		StartDate,         
		MaturityDate,        
		CategoryId,        
		Merek = c.Merek,        
		TypeBarang = c.TypeBarang,        
		Warna = c.Warna,        
		Quantity = a.Quantity,        
		a.DetailBarangId,  
		b.Requester,
		a.PaymentMethod,
		c.Keterangan,
		b.CatatanCabang,
		a.EnquiryId,
		a.DetailBarangId,                
		a.POGroupId,      
		a.CategoryId,
		a.PolaId,
		a.UnitId,
		a.TypeId,
		a.PaymentMethod,
		a.PaymentType,
		a.DPAmount,
		a.Quantity,
		a.Currency,
		a.NominalBarang,
		a.NominalPurchase,
		a.TotalPurchase,
		a.SupplierId,
		a.NilaiBuku,
		a.NikEmp,
		a.DeptId,
		a.VendorQuotationNo,
		a.VendorQuotationDate,
		a.VendorQuotationAmount,
		a.VendorInvoiceNo,
		a.VendorInvoiceDate,
		a.VendorInvoiceAmount,
		a.PODescription,
		a.ApproveBy2,
		a.ApproveDate2,
		a.StatusData2,
		a.CreateBy,
		a.CreateDate,
		a.UpdateBy,
		a.UpdateDate,
		a.ApproveBy,
		a.ApproveDate,
		a.RejectBy,
		a.RejectDate,
		a.RejectReason,
		a.CompanyId,
		a.BranchId,
		a.StatusData,
		a.IsDelete,
		a.UploadPO,
		a.Pajak,
		b.NoCif,        
		b.NoRekening,        
		b.NamaNasabah,                    
		b.JenisTabungan,
		JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
		WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
		WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
		END,         
		b.Cabang,    
		com.company_name,    
		b.TglBukaRekening,        
		b.StartDate,         
		b.MaturityDate,        
		b.Requester,    
		b.CatatanCabang, 
		b.KodePromosi, 
		c.KategoriBarang,         
		c.Merek,        
		c.TypeBarang, 
		QuantityBarang = c.Quantity, 
		c.Penalty,      
		c.Warna,
		b.PRId,
		b.PRDate,
		b.DraftPRId,
		b.DraftPRDate,
		b.RewardBudget,
		me.Nama    
		, SupplierName = isup.Nm_Supp
		, AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
		, ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan
		, a.NamaBank
		, a.NomorRekeningVendor 
		, a.AdditionalInfoDetailItem
		, isnull(a.PurchaseReceiveBy,'')
		FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
		LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
		LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId  
		LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang COLLATE DATABASE_DEFAULT   
		LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
		LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
		LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0             
		where b.Cabang = @cabanglogin and a.IsDelete = 0
		and b.JenisTabungan in ('6502','6008')
		and (com.[company_name] like '%' + @searchText + '%'	
				or a.POId like '%' + @searchText + '%')
		END
	END
END


GO
/****** Object:  StoredProcedure [dbo].[GetPageAmortisasiRequestPurchaseOrder]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Calvin
-- Create date: 12112018
-- Description:	<Get Page Amortisasi Request>
-- exec [dbo].[GetPageAmortisasiRequest] 'ID0010001', 'GETDATAPURCHASE',''
-- =============================================

CREATE PROCEDURE [dbo].[GetPageAmortisasiRequestPurchaseOrder]

@cabanglogin varchar(100),
@status varchar(100),
@searchText varchar(100)	
AS
BEGIN
	SET NOCOUNT ON;
	declare @cabang varchar (100)

	--IF EXISTS (select * from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin)
	--BEGIN
	--	select top 1 @cabang = KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO
	--	where KodeCabangWilayahKliring = @cabanglogin
			
	--	SELECT a.Id,        
	--	a.POId,        
	--	PODate,        
	--	NoCif,        
	--	NoRekening,        
	--	NamaNasabah,    
	--	JenisTabungan,         
	--	b.Cabang,        
	--	TglBukaRekening,        
	--	StartDate,         
	--	MaturityDate,        
	--	CategoryId,        
	--	Merek = c.Merek,        
	--	TypeBarang = c.TypeBarang,        
	--	Warna = c.Warna,        
	--	Quantity = a.Quantity,        
	--	a.DetailBarangId,  
	--	b.Requester,
	--	a.PaymentMethod,
	--	c.Keterangan,
	--	b.CatatanCabang,
	--	a.EnquiryId,
	--	a.DetailBarangId,                
	--	a.POGroupId,      
	--	a.CategoryId,
	--	a.PolaId,
	--	a.UnitId,
	--	a.TypeId,
	--	a.PaymentMethod,
	--	a.PaymentType,
	--	a.DPAmount,
	--	a.Quantity,
	--	a.Currency,
	--	a.NominalBarang,
	--	a.NominalPurchase,
	--	a.TotalPurchase,
	--	a.SupplierId,
	--	a.NilaiBuku,
	--	a.NikEmp,
	--	a.DeptId,
	--	a.VendorQuotationNo,
	--	a.VendorQuotationDate,
	--	a.VendorQuotationAmount,
	--	a.VendorInvoiceNo,
	--	a.VendorInvoiceDate,
	--	a.VendorInvoiceAmount,
	--	a.PODescription,
	--	a.ApproveBy2,
	--	a.ApproveDate2,
	--	a.StatusData2,
	--	a.CreateBy,
	--	a.CreateDate,
	--	a.UpdateBy,
	--	a.UpdateDate,
	--	a.ApproveBy,
	--	a.ApproveDate,
	--	a.RejectBy,
	--	a.RejectDate,
	--	a.RejectReason,
	--	a.CompanyId,
	--	a.BranchId,
	--	a.StatusData,
	--	a.IsDelete,
	--	a.UploadPO,
	--	a.Pajak,
	--	b.NoCif,        
	--	b.NoRekening,        
	--	b.NamaNasabah,                    
	--	b.JenisTabungan,
	--	JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
	--	WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
	--	WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
	--	END,         
	--	b.Cabang,    
	--	com.company_name,    
	--	b.TglBukaRekening,        
	--	b.StartDate,         
	--	b.MaturityDate,        
	--	b.Requester,    
	--	b.CatatanCabang, 
	--	b.KodePromosi, 
	--	c.KategoriBarang,         
	--	c.Merek,        
	--	c.TypeBarang, 
	--	QuantityBarang = c.Quantity, 
	--	c.Penalty,      
	--	c.Warna,
	--	b.PRId,
	--	b.PRDate,
	--	b.DraftPRId,
	--	b.DraftPRDate,
	--	b.RewardBudget,
	--	me.Nama    
	--	, SupplierName = isup.Nm_Supp
	--	, AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
	--	, ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan
	--	, a.NamaBank
	--	, a.NomorRekeningVendor 
	--	, a.AdditionalInfoDetailItem
	--	, isnull(a.PurchaseReceiveBy,'')
	--	FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
	--	LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
	--	LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId  
	--	LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang COLLATE DATABASE_DEFAULT   
	--	LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
	--	LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
	--	LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0    
	--	LEFT JOIN SQL_FUNDING.dbo.AmortisasiRequest d on d.POId = a.Id
	--	where (b.Cabang=@cabanglogin or b.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
	--	and b.IsDelete = 0 AND D.StatusData is null
	--	and com.[company_name] like '%' + @searchText + '%'			
	--END	
	--ELSE
	BEGIN
		SELECT a.Id,        
		a.POId,        
		PODate,        
		NoCif,        
		NoRekening,        
		NamaNasabah,
		JenisTabungan,         
		b.Cabang,        
		TglBukaRekening,        
		StartDate,         
		MaturityDate,        
		CategoryId,        
		Merek = c.Merek,        
		TypeBarang = c.TypeBarang,        
		Warna = c.Warna,        
		Quantity = a.Quantity,        
		a.DetailBarangId,  
		b.Requester,
		a.PaymentMethod,
		c.Keterangan,
		b.CatatanCabang,
		a.EnquiryId,
		a.DetailBarangId,                
		a.POGroupId,      
		a.CategoryId,
		a.PolaId,
		a.UnitId,
		a.TypeId,
		a.PaymentMethod,
		a.PaymentType,
		a.DPAmount,
		a.Quantity,
		a.Currency,
		a.NominalBarang,
		a.NominalPurchase,
		a.TotalPurchase,
		a.SupplierId,
		a.NilaiBuku,
		a.NikEmp,
		a.DeptId,
		a.VendorQuotationNo,
		a.VendorQuotationDate,
		a.VendorQuotationAmount,
		a.VendorInvoiceNo,
		a.VendorInvoiceDate,
		a.VendorInvoiceAmount,
		a.PODescription,
		a.ApproveBy2,
		a.ApproveDate2,
		a.StatusData2,
		a.CreateBy,
		a.CreateDate,
		a.UpdateBy,
		a.UpdateDate,
		a.ApproveBy,
		a.ApproveDate,
		a.RejectBy,
		a.RejectDate,
		a.RejectReason,
		a.CompanyId,
		a.BranchId,
		a.StatusData,
		a.IsDelete,
		a.UploadPO,
		a.Pajak,
		b.NoCif,        
		b.NoRekening,        
		b.NamaNasabah,                    
		b.JenisTabungan,
		JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
		WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
		WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
		END,         
		b.Cabang,    
		com.company_name,    
		b.TglBukaRekening,        
		b.StartDate,         
		b.MaturityDate,        
		b.Requester,    
		b.CatatanCabang, 
		b.KodePromosi, 
		c.KategoriBarang,         
		c.Merek,        
		c.TypeBarang, 
		QuantityBarang = c.Quantity, 
		c.Penalty,      
		c.Warna,
		b.PRId,
		b.PRDate,
		b.DraftPRId,
		b.DraftPRDate,
		b.RewardBudget,
		me.Nama    
		, SupplierName = isup.Nm_Supp
		, AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
		, ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan
		, a.NamaBank
		, a.NomorRekeningVendor 
		, a.AdditionalInfoDetailItem
		, isnull(a.PurchaseReceiveBy,'')
		FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
		LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
		LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId  
		LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang COLLATE DATABASE_DEFAULT   
		LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
		LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
		LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
		LEFT JOIN SQL_FUNDING.dbo.AmortisasiRequest d on d.POId = a.Id             
		where 
		--b.Cabang = @cabanglogin and 
		a.IsDelete = 0 AND D.StatusData is null
		and (com.[company_name] like '%' + @searchText + '%'	
		or a.POId like '%' + @searchText + '%')
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetPageBreakAmortisasiRequest]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Calvin
-- Create date: 12112018
-- Description:	<Get Page Break Amortisasi Request>
-- exec [dbo].[GetPageBreakAmortisasiRequest] 'ID0010180','GETDATA'
-- =============================================

CREATE PROCEDURE [dbo].[GetPageBreakAmortisasiRequest]

@cabanglogin varchar(100),
@status varchar(100),
@searchText varchar(100)	
	
AS
BEGIN
	SET NOCOUNT ON;
	declare @cabang varchar (100)
	
	IF @status = 'GETDATA'
	BEGIN
		--IF EXISTS (select * from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabang = @cabanglogin)
		IF EXISTS (select * from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = 'ID0010180')
		BEGIN
		--select @cabang = KodeCabangWilayahKliring from SQL_Satellite.dbo.TabCentralisasiBO
		--where KodeCabang = @cabanglogin

		select top 1 @cabang = KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO
		where KodeCabangWilayahKliring = @cabanglogin

		print ('a')
			select  d.MaturityDate as 'pR_MaturityDate', d.StartDate as 'pR_StartDate', d.Cabang as 'PR_Cabang', a.Id,
			 a.RequestId,
			c.TotalPurchase as 'pO_TotalPurchase',
			d.TglBukaRekening as 'pR_TglBukaRekening',
			d.JenisTabungan as 'PR_JenisTabungan',
			d.NoRekening as 'PR_NoRekening',
			d.NamaNasabah as 'PR_NamaNasabah',
			d.DraftPRId as 'PR_DraftPRId',
			d.DraftPRDate as 'pR_DraftPRDate',
			d.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			d.Requester as 'PR_Requester',
			d.PRId as 'PR_PRId',
			d.PRDate as 'pR_PRDate',
			d.RewardBudget as 'pR_RewardBudget',
			c.PolaId as 'PO_PolaId',
			c.TypeId as 'PO_TypeId',
			c.Quantity as 'PO_Quantity',
			c.SupplierId as 'PO_SupplierId',
			c.NilaiBuku as 'pO_NilaiBuku',
			c.NikEmp as 'PO_NikEmp',
			c.DeptId as 'PO_DeptId',
			c.VendorQuotationNo as 'PO_VendorQuotationNo',
			c.VendorQuotationDate as 'PO_VendorQuotationDate',
			c.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			c.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			c.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			c.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			b.RequestId,
			b.RequestDate,
			convert(varchar,c.POId) as 'PO_POId',
			c.PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			c.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			a.TTid,
			a.Memo,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].BreakAmortisasiRequest a
			join SQL_FUNDING.dbo.AmortisasiRequest b on a.TTid = b.Id
			join [SQL_FUNDING].[dbo].PurchaseOrder c on b.POId = c.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput d on c.EnquiryId = d.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on d.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on d.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where --d.Cabang in (@cabang, @cabanglogin) and a.IsDelete = 0
			(d.Cabang=@cabanglogin or d.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
			and a.IsDelete = 0
			and f.[company_name] like '%' + @searchText + '%'
		END
		ELSE
		BEGIN
		print ('b')
			select  d.MaturityDate as 'pR_MaturityDate', d.StartDate as 'pR_StartDate', d.Cabang as 'PR_Cabang', a.Id,
			 a.RequestId,
			c.TotalPurchase as 'pO_TotalPurchase',
			d.TglBukaRekening as 'pR_TglBukaRekening',
			d.JenisTabungan as 'PR_JenisTabungan',
			d.NoRekening as 'PR_NoRekening',
			d.NamaNasabah as 'PR_NamaNasabah',
			d.DraftPRId as 'PR_DraftPRId',
			d.DraftPRDate as 'pR_DraftPRDate',
			d.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			d.Requester as 'PR_Requester',
			d.PRId as 'PR_PRId',
			d.PRDate as 'pR_PRDate',
			d.RewardBudget as 'pR_RewardBudget',
			c.PolaId as 'PO_PolaId',
			c.TypeId as 'PO_TypeId',
			c.Quantity as 'PO_Quantity',
			c.SupplierId as 'PO_SupplierId',
			c.NilaiBuku as 'pO_NilaiBuku',
			c.NikEmp as 'PO_NikEmp',
			c.DeptId as 'PO_DeptId',
			c.VendorQuotationNo as 'PO_VendorQuotationNo',
			c.VendorQuotationDate as 'PO_VendorQuotationDate',
			c.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			c.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			c.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			c.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			b.RequestId,
			b.RequestDate,
			convert(varchar,c.POId) as 'PO_POId',
			c.PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			c.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			a.TTid,
			a.Memo,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].BreakAmortisasiRequest a
			join SQL_FUNDING.dbo.AmortisasiRequest b on a.TTid = b.Id
			join [SQL_FUNDING].[dbo].PurchaseOrder c on b.POId = c.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput d on c.EnquiryId = d.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on d.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on d.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where d.Cabang = @cabanglogin and a.IsDelete = 0
			and f.[company_name] like '%' + @searchText + '%'
		END
	END
	IF @status = 'APPROVE'
	BEGIN
		--IF EXISTS (select * from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabang = @cabanglogin)
		--BEGIN
		--select @cabang = KodeCabangWilayahKliring from SQL_Satellite.dbo.TabCentralisasiBO
		--where KodeCabang = @cabanglogin

		--IF EXISTS (select * from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabang = @cabanglogin)
		IF EXISTS (select * from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = 'ID0010180')
		BEGIN
		--select @cabang = KodeCabangWilayahKliring from SQL_Satellite.dbo.TabCentralisasiBO
		--where KodeCabang = @cabanglogin

		select top 1 @cabang = KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO
		where KodeCabangWilayahKliring = @cabanglogin

			select  d.MaturityDate as 'pR_MaturityDate', d.StartDate as 'pR_StartDate', d.Cabang as 'PR_Cabang', a.Id,
			 a.RequestId,
			c.TotalPurchase as 'pO_TotalPurchase',
			d.TglBukaRekening as 'pR_TglBukaRekening',
			d.JenisTabungan as 'PR_JenisTabungan',
			d.NoRekening as 'PR_NoRekening',
			d.NamaNasabah as 'PR_NamaNasabah',
			d.DraftPRId as 'PR_DraftPRId',
			d.DraftPRDate as 'pR_DraftPRDate',
			d.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			d.Requester as 'PR_Requester',
			d.PRId as 'PR_PRId',
			d.PRDate as 'pR_PRDate',
			d.RewardBudget as 'pR_RewardBudget',
			c.PolaId as 'PO_PolaId',
			c.TypeId as 'PO_TypeId',
			c.Quantity as 'PO_Quantity',
			c.SupplierId as 'PO_SupplierId',
			c.NilaiBuku as 'pO_NilaiBuku',
			c.NikEmp as 'PO_NikEmp',
			c.DeptId as 'PO_DeptId',
			c.VendorQuotationNo as 'PO_VendorQuotationNo',
			c.VendorQuotationDate as 'PO_VendorQuotationDate',
			c.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			c.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			c.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			c.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			b.RequestId,
			b.RequestDate,
			convert(varchar,c.POId) as 'PO_POId',
			c.PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			c.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			a.TTid,
			a.Memo,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].BreakAmortisasiRequest a
			join SQL_FUNDING.dbo.AmortisasiRequest b on a.TTid = b.Id
			join [SQL_FUNDING].[dbo].PurchaseOrder c on b.POId = c.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput d on c.EnquiryId = d.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on d.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on d.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where --d.Cabang in (@cabang, @cabanglogin) and a.IsDelete = 0 and a.StatusData != 5
			(d.Cabang=@cabanglogin or d.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
			and a.IsDelete = 0 and a.StatusData != 5
			and f.[company_name] like '%' + @searchText + '%'
		
		END
		ELSE
		BEGIN
			select  d.MaturityDate as 'pR_MaturityDate', d.StartDate as 'pR_StartDate', d.Cabang as 'PR_Cabang', a.Id,
			 a.RequestId,
			c.TotalPurchase as 'pO_TotalPurchase',
			d.TglBukaRekening as 'pR_TglBukaRekening',
			d.JenisTabungan as 'PR_JenisTabungan',
			d.NoRekening as 'PR_NoRekening',
			d.NamaNasabah as 'PR_NamaNasabah',
			d.DraftPRId as 'PR_DraftPRId',
			d.DraftPRDate as 'pR_DraftPRDate',
			d.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			d.Requester as 'PR_Requester',
			d.PRId as 'PR_PRId',
			d.PRDate as 'pR_PRDate',
			d.RewardBudget as 'pR_RewardBudget',
			c.PolaId as 'PO_PolaId',
			c.TypeId as 'PO_TypeId',
			c.Quantity as 'PO_Quantity',
			c.SupplierId as 'PO_SupplierId',
			c.NilaiBuku as 'pO_NilaiBuku',
			c.NikEmp as 'PO_NikEmp',
			c.DeptId as 'PO_DeptId',
			c.VendorQuotationNo as 'PO_VendorQuotationNo',
			c.VendorQuotationDate as 'PO_VendorQuotationDate',
			c.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			c.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			c.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			c.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			b.RequestId,
			b.RequestDate,
			convert(varchar,c.POId) as 'PO_POId',
			c.PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			c.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			a.TTid,
			a.Memo,
			f.[company_name] as 'NamaCabang',
			a.ApproveDate FROM [SQL_FUNDING].[dbo].BreakAmortisasiRequest a
			join SQL_FUNDING.dbo.AmortisasiRequest b on a.TTid = b.Id
			join [SQL_FUNDING].[dbo].PurchaseOrder c on b.POId = c.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput d on c.EnquiryId = d.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on d.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on d.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where d.Cabang = @cabanglogin and a.IsDelete = 0 and a.StatusData != 5
			and f.[company_name] like '%' + @searchText + '%'
		
		END
	END
	IF @status = 'GetAmorReqInBreakAmorMenu'
	BEGIN
		IF EXISTS (select * from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabang = @cabanglogin)
		BEGIN
		select @cabang = KodeCabangWilayahKliring from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO
		where KodeCabang = @cabanglogin

			select  c.MaturityDate as 'pR_MaturityDate', c.StartDate as 'pR_StartDate', c.Cabang as 'PR_Cabang', a.Id,
			 RequestId,
			b.TotalPurchase as 'pO_TotalPurchase',
			c.TglBukaRekening as 'pR_TglBukaRekening',
			c.JenisTabungan as 'PR_JenisTabungan',
			c.NoRekening as 'PR_NoRekening',
			c.NamaNasabah as 'PR_NamaNasabah',
			c.DraftPRId as 'PR_DraftPRId',
			c.DraftPRDate as 'pR_DraftPRDate',
			c.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			c.Requester as 'PR_Requester',
			c.PRId as 'PR_PRId',
			c.PRDate as 'pR_PRDate',
			c.RewardBudget as 'pR_RewardBudget',
			b.PolaId as 'PO_PolaId',
			b.TypeId as 'PO_TypeId',
			b.Quantity as 'PO_Quantity',
			b.SupplierId as 'PO_SupplierId',
			b.NilaiBuku as 'pO_NilaiBuku',
			b.NikEmp as 'PO_NikEmp',
			b.DeptId as 'PO_DeptId',
			b.VendorQuotationNo as 'PO_VendorQuotationNo',
			b.VendorQuotationDate as 'PO_VendorQuotationDate',
			b.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			b.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			b.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			b.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			RequestId,
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			a.ApproveDate FROM [SQL_FUNDING].[dbo].[AmortisasiRequest] a
			join [SQL_FUNDING].[dbo].PurchaseOrder b on a.POId = b.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput c on b.EnquiryId = c.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on c.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on c.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where --c.Cabang in (@cabang, @cabanglogin)  
			(c.Cabang=@cabanglogin or c.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
				and f.[company_name] like '%' + @searchText + '%'
			and a.IsDelete = 0 and a.StatusData = 5 and a.IsBreak = 0
		END
		ELSE
		BEGIN
			select  c.MaturityDate as 'pR_MaturityDate', c.StartDate as 'pR_StartDate', c.Cabang as 'PR_Cabang', a.Id,
			 RequestId,
			b.TotalPurchase as 'pO_TotalPurchase',
			c.TglBukaRekening as 'pR_TglBukaRekening',
			c.JenisTabungan as 'PR_JenisTabungan',
			c.NoRekening as 'PR_NoRekening',
			c.NamaNasabah as 'PR_NamaNasabah',
			c.DraftPRId as 'PR_DraftPRId',
			c.DraftPRDate as 'pR_DraftPRDate',
			c.KodePromosi as 'PR_KodePromosi',
			e.TypeBarang as 'DB_TypeBarang',
			e.Merek as 'DB_Merek',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			e.Penalty as 'dB_Penalty',
			c.Requester as 'PR_Requester',
			c.PRId as 'PR_PRId',
			c.PRDate as 'pR_PRDate',
			c.RewardBudget as 'pR_RewardBudget',
			b.PolaId as 'PO_PolaId',
			b.TypeId as 'PO_TypeId',
			b.Quantity as 'PO_Quantity',
			b.SupplierId as 'PO_SupplierId',
			b.NilaiBuku as 'pO_NilaiBuku',
			b.NikEmp as 'PO_NikEmp',
			b.DeptId as 'PO_DeptId',
			b.VendorQuotationNo as 'PO_VendorQuotationNo',
			b.VendorQuotationDate as 'PO_VendorQuotationDate',
			b.VendorQuotationAmount as 'PO_VendorQuatationAmount',
			b.VendorInvoiceNo as 'PO_VendorInvoiceNo',
			b.VendorInvoiceDate as 'PO_VendorInvoiceDate',
			b.VendorInvoiceAmount as 'PO_VendorInvoiceAmount',
			RequestId,
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			RequestDate,
			convert(varchar,b.POId) as 'PO_POId',
			PODate as 'PO_PODate',
			ISNULL(CategoryId,'') as 'PO_CategoryId',
			e.Merek as 'DB_Merek',
			e.TypeBarang as 'DB_TypeBarang',
			e.Warna as 'DB_Warna',
			e.Quantity as 'DB_Quantity',
			b.NominalBarang as 'PO_NominalBarang',
			a.StatusData,
			a.ApproveBy,
			a.ApproveDate FROM [SQL_FUNDING].[dbo].[AmortisasiRequest] a
			join [SQL_FUNDING].[dbo].PurchaseOrder b on a.POId = b.Id
			join [SQL_FUNDING].[dbo].EnquiryTabunganInput c on b.EnquiryId = c.Id
			join [SQL_FUNDING].[dbo].DetailBarang e on c.Id = e.EnquiryId
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] f WITH(NOLOCK) on c.Cabang=f.[@ID] COLLATE DATABASE_DEFAULT
			where --c.Cabang = @cabanglogin 
			(c.Cabang=@cabanglogin or c.Cabang in(select KodeCabang from [10.100.2.120\APPSERVERDEV].SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabanglogin))
			and f.[company_name] like '%' + @searchText + '%'
			and a.IsDelete = 0 and a.StatusData = 5 and a.IsBreak = 0
		END
	END
	
END




GO
/****** Object:  StoredProcedure [dbo].[InsertUploadSpNasabah]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Calvin
-- Create date: 02112018
-- Description:	<Get Menu Status Nasabah>
-- exec [dbo].[SP_GetMenuStatusNasabah]
-- =============================================

CREATE PROCEDURE [dbo].[InsertUploadSpNasabah]

@norek varchar(100),
@filenames varchar(MAX),
@userid varchar(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	insert into SQL_FUNDING.dbo.UploadNasabah
	values (@norek,@filenames,@userid,GETDATE(),1--statusdata
	,0--isdelete
	)
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_AUTHORIZE_RECEIVE]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Yadit>    
-- Create date: <11 April - 2018>    
-- Description: <Select authorize receive>    
-- =============================================    
CREATE PROCEDURE [dbo].[SP_AUTHORIZE_RECEIVE]     
--'',null,'',''    
 -- Add the parameters for the stored procedure here    
 @cabang varchar(50),    
 @tanggal varchar(50),    
 @no varchar(50),    
 @nopo varchar(50),    
 @tanggalpo varchar(50),  
 @jenis INT    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
 SELECT a.Id,    
     PurchaseReceiveId,    
     PurchaseReceiveDate,    
     b.POId,    
     b.PODate,    
     c.PromotionCode,    
     c.Merek,    
     c.TypeBarang,    
     c.Warna,    
     b.Quantity,    
     PelunasanId,    
     JurnalValueDate,
     a.Receiver    
  FROM SQL_FUNDING.dbo.PurchaseReceive a WITH(NOLOCK)    
  LEFT JOIN SQL_FUNDING.dbo.PurchaseOrder b WITH(NOLOCK) ON a.PurchaseOrderId = b.Id    
  LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = b.DetailBarangId    
  LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput d WITH(NOLOCK) ON d.Id = b.EnquiryId    
  WHERE a.ApproveReceiveBy IS NULL AND a.PelunasanId IS NULL  AND PurchaseReceiveId IS NOT NULL  
  AND POId LIKE '%' + @nopo + '%'     
  AND PurchaseReceiveId LIKE '%' +  @no + '%'     
  AND (CAST(PurchaseReceiveDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)     
  AND (CAST(b.PODate AS DATE) = CAST(@tanggalpo AS DATE) OR @tanggalpo IS NULL)    
  AND (cabang = @cabang OR @cabang = '')   
  AND JenisTabungan = @jenis   
  ORDER BY a.CreateDate desc    
      
END  


GO
/****** Object:  StoredProcedure [dbo].[SP_AUTHORIZECASHBACK]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Eka Muhendra>        
-- Create date: <01 Oct - 2020>        
-- Description: <Select authorize Cashback>        
-- =============================================  
-- EXEC [dbo].[SP_AUTHORIZECASHBACK]  null,'6008','',''   
   
CREATE PROCEDURE [dbo].[SP_AUTHORIZECASHBACK]  
 @tanggal datetime,        
 @jenis int,        
 @cabang varchar(50),        
 @no varchar(50)        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;

 SELECT ROW_NUMBER() OVER(PARTITION BY POGroupId 
 ORDER BY POGroupId DESC) AS jmlh,* 
 INTO #Temp1 
 FROM PurchaseOrder

 SELECT POGroupId, count(POGroupId) AS totalpo
 INTO #temp2
 FROM PurchaseOrder 
 GROUP BY POGroupId
      
  SELECT a.Id,        
    a.POId,        
    a.PODate,        
    NoCif,        
    NoRekening,        
    NamaNasabah,        
    JenisTabungan,         
    b.Cabang,        
    TglBukaRekening,        
    StartDate,         
    MaturityDate,        
    a.CategoryId,        
    Merek = c.Merek,        
    TypeBarang = c.TypeBarang,        
    Warna = c.Warna,        
    Quantity = a.Quantity,        
    a.DetailBarangId,  
    b.Requester,
    a.PaymentMethod
    ,c.Keterangan
    ,b.CatatanCabang
	,a.EnquiryId,
	a.DetailBarangId,                
    a.POGroupId,
	te.jmlh,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
	te2.totalpo,
	a.CatatanPO,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
    WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
    WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
    END,         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang, 
	b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang,
	c.keterangan as TypeCashback, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
    me.Nama    
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan
    , a.NamaBank
    , a.NomorRekeningVendor 
    , a.AdditionalInfoDetailItem
	, isnull(a.PurchaseReceiveBy,'')
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)
   JOIN #Temp1 te on te.Id = a.Id
   JOIN #temp2 te2 on te2.POGroupId = a.POGroupId        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId  
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang COLLATE DATABASE_DEFAULT      
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0       
   WHERE a.ApproveBy IS NULL         
   AND (CAST(a.PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)        
   AND b.JenisTabungan = @jenis
   AND te.jmlh = 1         
   AND (b.Cabang = @cabang OR @cabang = '') 
   AND c.KategoriBarang = '8'       
   AND a.POGroupId LIKE '%' + @no + '%' AND a.StatusData = 1      
   ORDER BY a.POGroupId desc
END

GO
/****** Object:  StoredProcedure [dbo].[SP_AUTHORIZEENQUIRYTABUNGAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Alexander Andri>  
-- Create date: <20 mei- 2016>  
-- Description: <Select authorize enquiry tabungan>  
-- [SP_AUTHORIZEENQUIRYTABUNGAN] null,'6502','','',''

-- =============================================
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20200710, eka, penambahan sp
*/
CREATE PROCEDURE [dbo].[SP_AUTHORIZEENQUIRYTABUNGAN]
	
	@tanggal DATETIME
	,@jenis INT
	,@cabang VARCHAR(50)
	,@norekening VARCHAR(50),
	@nodraft VARCHAR(50)

AS  
BEGIN

	SET NOCOUNT ON;
	
	SELECT	Id
			,NoRekening
			,NoCif
			,NamaNasabah
			
			--,KodeJenisTabungan = CASE WHEN JenisTabungan = 'Tabungan Sipucuk' THEN '6501'
			--     WHEN JenisTabungan = 'Tabungan Sipucuk Reward' THEN '6502'
			--     WHEN JenisTabungan = 'Tabungan Hadiah Langsung' THEN '6008'
			--   END
			
			,JenisTabungan
			,Cabang
			,NamaCabang = d.company_name
			,TglBukaRekening
			,StartDate
			,MaturityDate
			,Nominal
			,DraftPRId
			,DraftPRDate,
			a.Requester
			,a.AttachmentSPNasabah
			,a.DetailBarangId	
			,a.CatatanCabang
			--20200710, eka, begin
			,ISNULL(a.PenyimpanganProgram,0) AS PenyimpanganProgram
			,a.AttachmentPenyimpangan
			--20200710, eka, end							
			
		FROM SQL_FUNDING.dbo.EnquiryTabunganInput a WITH(NOLOCK)
		
		LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK) ON d.[@ID] = a.Cabang COLLATE DATABASE_DEFAULT
		
		WHERE	JenisTabungan = @jenis
				AND NoRekening LIKE '%' + @norekening + '%'
				AND DraftPRId LIKE '%' +  @nodraft + '%'
				AND ApproveBy IS NULL
				AND StatusData <> 3 --delete ga muncul lg
				AND (CAST(DraftPRDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)
				AND (Cabang = @cabang OR @cabang = '')
				AND RejectBy IS NULL
				
		ORDER BY	a.CreateDate DESC
		
END  


GO
/****** Object:  StoredProcedure [dbo].[SP_AUTHORIZEPAYMENTREQUEST]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Alexander Andri>      
-- Create date: <11 agustus 2016>      
-- Description: <Select authorize payment request>      
-- =============================================      
CREATE PROCEDURE [dbo].[SP_AUTHORIZEPAYMENTREQUEST]      
 -- Add the parameters for the stored procedure here      
 @tanggal datetime ,      
 @jenis int ,      
 @cabang varchar(50),      
 @norekening varchar(50),      
 @no varchar(50),      
 @nopo varchar(50),      
 @tanggalpo datetime    
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
  SELECT a.Id,      
     --KodeJenisTabungan = CASE WHEN JenisTabungan = ''Tabungan Sipucuk'' THEN ''6501''      
     --     WHEN JenisTabungan = ''Tabungan Sipucuk Reward'' THEN ''6502''      
     --     WHEN JenisTabungan = ''Tabungan Hadiah Langsung'' THEN ''6008''      
     --   END,      
    PaymentRequestId,      
    PaymentRequestDate,      
    Merek,      
    Typebarang,      
    b.Quantity,      
    POId,      
    Warna,      
    PODate,      
    Cabang,  
    d.Requester,
    a.JurnalName,
    a.TransactionCode,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount  ,
    a.PaymentRequestType,
    b.PaymentMethod
   FROM SQL_FUNDING.dbo.PaymentRequest a WITH(NOLOCK)      
   LEFT JOIN SQL_FUNDING.dbo.PurchaseOrder b WITH(NOLOCK) ON a.PurchaseOrderId = b.Id      
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = b.DetailBarangId      
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput d WITH(NOLOCK) ON d.Id = b.EnquiryId      
   WHERE a.ApproveBy IS NULL AND d.JenisTabungan = @jenis       
   AND (CAST(PODate AS DATE) = CAST(@tanggalpo AS DATE) OR @tanggalpo is null)      
   AND (CAST(PaymentRequestDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal is null)      
   AND (Cabang = @cabang OR @cabang = '')      
   AND NoRekening LIKE '%' + @norekening + '%' AND PaymentRequestId LIKE '%' +  @no + '%'      
   AND POId LIKE '%' + @nopo + '%' AND a.StatusData <> 3      
   ORDER BY a.CreateDate desc    
       
END     


GO
/****** Object:  StoredProcedure [dbo].[SP_AUTHORIZEPURCHASEORDER]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Alexander Andri>        
-- Create date: <05 augustus - 2016>        
-- Description: <Select authorize purchase order>        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_AUTHORIZEPURCHASEORDER]
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190129, jeni, penambahan field pada PurchaseOrder
	20190206, jeni, ganti filter POId ke POGroupId
*/
 -- Add the parameters for the stored procedure here        
 @tanggal datetime,        
 @jenis int,        
 @cabang varchar(50),        
 @no varchar(50)        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
  SELECT a.Id,        
    a.POId,        
    PODate,        
    NoCif,        
    NoRekening,        
    NamaNasabah,        
    --KodeJenisTabungan = CASE WHEN JenisTabungan = 'Tabungan Sipucuk' THEN '6501'        
    --     WHEN JenisTabungan = 'Tabungan Sipucuk Reward' THEN '6502'         
    --     WHEN JenisTabungan = 'Tabungan Hadiah Langsung' THEN '6008'        
    --   END,        
    JenisTabungan,         
    b.Cabang,        
    TglBukaRekening,        
    StartDate,         
    MaturityDate,        
    CategoryId,        
    Merek = c.Merek,        
       TypeBarang = c.TypeBarang,        
       Warna = c.Warna,        
       Quantity = a.Quantity,        
       a.DetailBarangId,  
       b.Requester,
       a.PaymentMethod
       ,c.Keterangan
       ,b.CatatanCabang
       
       ,
	a.EnquiryId,
	a.DetailBarangId,                
    a.POGroupId,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
       END,         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang, 
       
       
       b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
    me.Nama    
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan
    , a.NamaBank
    , a.NomorRekeningVendor 
    , a.AdditionalInfoDetailItem
--20190129, jeni, BEGIN
	, isnull(a.PurchaseReceiveBy,'')
--20190129, jeni, END
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId  
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang COLLATE DATABASE_DEFAULT      
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0       
      WHERE a.ApproveBy IS NULL         
   AND (CAST(PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)        
   AND b.JenisTabungan = @jenis         
   AND (b.Cabang = @cabang OR @cabang = '')        
--20190206, jeni, BEGIN
   --AND POId LIKE '%' + @no + '%' AND a.StatusData2 <> 3        
   AND POGroupId LIKE '%' + @no + '%' AND a.StatusData2 <> 3
   AND a.POId NOT LIKE '%CSBK%'        
--20190206, jeni, END
--20190206, jeni, BEGIN		   
   --ORDER BY a.CreateDate desc      
   ORDER BY a.POGroupId, a.POId
--20190206, jeni, END
         
END

GO
/****** Object:  StoredProcedure [dbo].[SP_AUTHORIZEPURCHASERECEIVE]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Alexander Andri>      
-- Create date: <20 mei- 2016>      
-- Description: <Select authorize purchase receive>      
-- =============================================      
CREATE PROCEDURE [dbo].[SP_AUTHORIZEPURCHASERECEIVE]       
--'',null,'',''      
 -- Add the parameters for the stored procedure here      
 @cabang varchar(50),      
 @tanggal varchar(50),      
 @no varchar(50),      
 @nopo varchar(50),      
 @tanggalpo varchar(50)      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
 SELECT a.Id,      
     PurchaseReceiveId,      
     PurchaseReceiveDate,      
     b.POId,      
     b.PODate,      
     c.PromotionCode,      
     c.Merek,      
     c.TypeBarang,      
     c.Warna,      
     b.Quantity,      
     PelunasanId,      
     JurnalValueDate,  
     a.JurnalName,
     a.Receiver      
  FROM SQL_FUNDING.dbo.PurchaseReceive a WITH(NOLOCK)      
  LEFT JOIN SQL_FUNDING.dbo.PurchaseOrder b WITH(NOLOCK) ON a.PurchaseOrderId = b.Id      
  LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = b.DetailBarangId      
  LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput d WITH(NOLOCK) ON d.Id = b.EnquiryId      
  WHERE a.ApproveBy IS NULL AND a.PelunasanId IS NOT NULL       
  AND POId LIKE '%' + @nopo + '%'       
  AND PurchaseReceiveId LIKE '%' +  @no + '%'       
  AND (CAST(PurchaseReceiveDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)       
  AND (CAST(b.PODate AS DATE) = CAST(@tanggalpo AS DATE) OR @tanggalpo IS NULL)      
  AND (cabang = @cabang OR @cabang = '')      
  ORDER BY a.CreateDate desc      
        
END  


GO
/****** Object:  StoredProcedure [dbo].[SP_AUTHORIZEPURCHASEREQUEST]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		<Alexander Andri>
-- Create date: <20 mei- 2016>
-- Description:	<Select authorize enquiry tabungan>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AUTHORIZEPURCHASEREQUEST]
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190114, jeni, penambahan filter yang reject tidak keluar di author
*/
	-- Add the parameters for the stored procedure here
	@tanggal datetime,
	@jenis int,
	@cabang varchar(50),
	@norekening varchar(50),
	@no varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
	
	SELECT Id,
		   NoRekening,
		   NoCif,
		   NamaNasabah,
		   
		   --KodeJenisTabungan = CASE WHEN JenisTabungan = 'Tabungan Sipucuk' THEN '6501'
					--		   WHEN JenisTabungan = 'Tabungan Sipucuk Reward' THEN '6502' 
					--		   WHEN JenisTabungan = 'Tabungan Hadiah Langsung' THEN '6008'
					--	  END,
		   JenisTabungan,	
		   Cabang,
		   NamaCabang = d.company_name,
		   TglBukaRekening,
		   Requester,
		   StartDate, 
		   MaturityDate,
		   Nominal,
		   PRId,
		   PRDate,
		   DraftPRId,
		   DraftPRDate,
		   a.RewardBudget,
		   a.KodePromosi,
		   a.AttachmentMemoDireksi,
		   a.Requester,
		   a.CatatanCabang,
		   a.CatatanFProduct
	 FROM SQL_FUNDING.dbo.EnquiryTabunganInput a WITH(NOLOCK)
	 LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK)
	 ON d.[@ID] = a.Cabang COLLATE DATABASE_DEFAULT 
	 WHERE PRId IS NOT NULL AND ApproveBy2 is null 
--20190114, jeni, BEGIN
	 --AND ApproveBy IS NOT NULL AND StatusData2 <> 3 --delete ga muncul lg
	 AND ApproveBy IS NOT NULL AND StatusData2 <> 3 AND StatusData2 <> 6 --delete dan reject ga muncul lg
--20190114, jeni, END
	 AND (Cabang = @cabang OR @cabang = '')
	 AND (CAST(PRDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL) 
	 AND JenisTabungan = @jenis 
	 AND NoRekening LIKE '%' + @norekening + '%' AND PRId LIKE '%' +  @no + '%'
	 ORDER BY a.CreateDate desc
	 
END


GO
/****** Object:  StoredProcedure [dbo].[SP_AUTO_JurnalAmortisasi]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AUTO_JurnalAmortisasi]  
 @date DATE 
 -- Add the parameters for the stored procedure here  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
DECLARE @DayName VARCHAR(100),@ColGUID VARCHAR(100),@AmortisasiRequestId INT,@PoID INT, @Amount DECIMAl(18,2)
SET @DayName = (SELECT DATENAME(WEEKDAY,@date))

IF OBJECT_ID('tempdb..#tmpAmortisasi') IS NOT NULL DROP TABLE #tmpAmortisasi

CREATE TABLE #tmpAmortisasi
(	KartuAmortisasiId INT,
	AmortisasiRequestId INT,
	NomorAmortisasi VARCHAR(50),
	POId INT,
	ValueDate DATE,
	BranchId VARCHAR(100),
	BranchName VARCHAR(100),
	IntAccCategoryId VARCHAR(100),
	IntAccCategoryName VARCHAR(100),
	DebitKredit INT,
	Narative VARCHAR(100),
	Currency VARCHAR(100),
	Amount DECIMAL(18,2),
	ref_code VARCHAR(100)
)

IF OBJECT_ID('tempdb..#tmpAmortisasiHeader1') IS NOT NULL DROP TABLE #tmpAmortisasiHeader1

CREATE TABLE #tmpAmortisasiHeader1
(	AmortisasiRequestId INT,
	PoID INT,
	Amount DECIMAL(18,2)
)

IF OBJECT_ID('tempdb..#tmpAmortisasiHeader2') IS NOT NULL DROP TABLE #tmpAmortisasiHeader2

CREATE TABLE #tmpAmortisasiHeader2
(	ColGUID UNIQUEIDENTIFIER,
	AmortisasiRequestId INT,
	PoID INT,
	Amount DECIMAL(18,2)
)

IF OBJECT_ID('tempdb..#tmpAmortisasiDetail') IS NOT NULL DROP TABLE #tmpAmortisasiDetail

CREATE TABLE #tmpAmortisasiDetail
(	KartuAmortisasiId INT
)


	IF (@DayName <> 'Saturday' AND @DayName <> 'Sunday')
	BEGIN
		IF ( NOT EXISTS ( SELECT * FROM [SQL_BMRS].[dbo].[HolidayTable]
							WHERE [HolidayDate] = CONVERT(VARCHAR(10),@date,112)
						)
			)
		BEGIN			
		
			INSERT INTO #tmpAmortisasi
			SELECT ka.Id,
				   ka.AmortisasiRequestId,				   
				   ar.RequestId,
				   ar.PoId,
				   @date AS ValueDate,
				   ard.BranchId,
				   ard.BranchName,
				   ard.IntAccCategoryId,
				   ard.IntAccCategoryName,
				   ard.DebitKredit,
				   ard.Narative,
				   ard.Currency,
				   ka.AmortizeAmount AS Amount,
				   ard.ref_code				   
			 FROM KartuAmortisasi ka
			INNER JOIN AmortisasiRequest ar
				ON ar.Id = ka.AmortisasiRequestId
			INNER JOIN AmortisasiRequestDetail ard
			    ON ard.AmortisasiRequestId = ar.Id									
				
			WHERE ka.IsProceed = 0
					AND ar.IsDelete = 0
					AND ar.ApproveBy IS NOT NULL
					AND ka.ValueDate <= @date
					AND ar.IsBreak = 0
					
			INSERT INTO #tmpAmortisasiDetail
			SELECT DISTINCT KartuAmortisasiId FROM #tmpAmortisasi			
															
			INSERT INTO #tmpAmortisasiHeader1
			SELECT DISTINCT AmortisasiRequestId, PoID, Amount FROM #tmpAmortisasi	
			
			INSERT INTO #tmpAmortisasiHeader2	
			SELECT NEWID(),AmortisasiRequestId, PoID, Amount FROM #tmpAmortisasiHeader1 
			
			SELECT * FROM #tmpAmortisasiHeader2
			
			SELECT * FROM #tmpAmortisasi
			
			SELECT * FROM #tmpAmortisasiDetail
					
			DECLARE cursorAmortisasi CURSOR FOR	
			
			SELECT ColGUID,
					AmortisasiRequestId,
					PoID,
					Amount 
			FROM #tmpAmortisasiHeader2
			
			OPEN cursorAmortisasi	
			FETCH NEXT FROM cursorAmortisasi 
			INTO @ColGUID,@AmortisasiRequestId,@PoID,@Amount
			WHILE @@FETCH_STATUS = 0	
			BEGIN
			
				/*INSERT HEADER*/ 			
				INSERT INTO [SQL_AUTHORIZE].[dbo].[AUTH_GUIDDATA](
				[application] --'MyFunding'
				,[guid] --@guid
				,[filename] --b.[RequestId]
				,[deskripsi] --'AMORTISASI'
				,[userUpload] --@user
				,[tglUpload] --GETDATE()
				,[flagCsv] --0
				,[flagRes] --0
				,[CreateDate] --GETDATE()
				,[StatusData] --1
				,[IsDelete] --0
				,[isgroup] --0
				,[flag_otor] --1
				)
				SELECT	
				'MyFunding' --[application]
				, ColGUID--[guid]
				,dbo.fnGenerateFilenameReward() --[filename]
				,'AMORTISASI' --[deskripsi]
				,'SYSTEM' --[userUpload]
				,GETDATE() --[tglUpload]
				,0 --[flagCsv]
				,0 --[flagRes]
				,GETDATE() --[CreateDate]
				,1 --[StatusData]
				,0 --[IsDelete]
				,0 --[isgroup]
				,1 --[flag_otor]
				FROM #tmpAmortisasiHeader2	
				WHERE AmortisasiRequestId = @AmortisasiRequestId
				
				/*INSERT FOR DEBIT*/
				INSERT INTO [SQL_AUTHORIZE].[dbo].[AUTH_DATATRX](
				[guid] --@guid
				,[filename] --dbo.fnGenerateFilenameReward()
				,[sequence] --ROW_NUMBER() OVER(ORDER BY a.[id])
				,[rekening_debet] --CASE a.[DebitKredit] WHEN 0 THEN a.[IntAccCategoryId] ELSE NULL END
				,[currency_debet] --CASE a.[DebitKredit] WHEN 0 THEN 'IDR' ELSE NULL END
				,[Nominal] --a.[Amount]
				--,[rekening_kredit] --CASE a.[DebitKredit] WHEN 1 THEN a.[IntAccCategoryId] ELSE NULL END
				--,[currency_kredit] --CASE a.[DebitKredit] WHEN 1 THEN 'IDR' ELSE NULL END
				,[filler] --'9999'
				,[cabang] --a.[BranchId]
				,[upload_date] --GETDATE()
				,[value_date] --CONVERT(VARCHAR(8),GETDATE(),112)
				,[debit_ref] --b.[RequestId]
				--,[kredit_ref] --CASE a.[DebitKredit] WHEN 1 THEN b.[RequestId] ELSE 'TRXMYREWARD' END 
				,[deskripsi] --'AMORTISASI'
				,[cost_center] --1
				,[batch] --b.[RequestId]
				,[CreateBy] --@user
				,[CreateDate] --GETDATE()
				,[StatusData] --1
				,[IsDelete] --0
				)
				
				SELECT	b.ColGUID --[guid]
				,dbo.fnGenerateFilenameReward() --[filename]
				,ROW_NUMBER() OVER(ORDER BY a.[AmortisasiRequestId]) --[sequence]
				,a.[IntAccCategoryId] --[rekening_debet]
				,A.[Currency]  --[currency_debet]
				,a.[Amount] --[Nominal]
				--,CASE a.[DebitKredit] WHEN 1 THEN a.[IntAccCategoryId] ELSE NULL END --[rekening_kredit]
				--,CASE a.[DebitKredit] WHEN 1 THEN 'IDR' ELSE NULL END --[currency_kredit]
				,'999999' --[filler]
				,a.[BranchId] --[cabang]
				,GETDATE() --[upload_date]
				,CONVERT(VARCHAR(8),GETDATE(),112) --[value_date]
				,a.[ref_code] --[debit_ref]
				--,CASE a.[DebitKredit] WHEN 1 THEN b.[RequestId] ELSE 'TRXMYREWARD' END --[kredit_ref]
				,'AMORTISASI' --[deskripsi]
				,1 --[cost_center]
				,a.NomorAmortisasi --[batch]
				,'SYSTEM' --[CreateBy]
				,GETDATE() --[CreateDate]
				,1 --[StatusData]
				,0 --[IsDelete]
				FROM #tmpAmortisasi a
				INNER JOIN #tmpAmortisasiHeader2 b ON a.[AmortisasiRequestId] = b.[AmortisasiRequestId]
				WHERE a.[DebitKredit] = 0 --debit	
					AND a.AmortisasiRequestId = @AmortisasiRequestId 									
				
				/*UPDATE FOR KREDIT*/
				UPDATE [SQL_AUTHORIZE].[dbo].[AUTH_DATATRX]
				SET	[rekening_kredit] = a.[IntAccCategoryId]
					,[currency_kredit] = a.[Currency]
					,[kredit_ref] = 'TRXMYFUNDING'
				FROM #tmpAmortisasi a
				WHERE	[debit_ref] = a.[ref_code]
						AND a.DebitKredit = 1 --kredit
						AND a.AmortisasiRequestId = @AmortisasiRequestId
				
				/*Update IsProceed di Kartu Amortisasi*/
				UPDATE KartuAmortisasi
				SET IsProceed = 1,
					ProceedDateTime = GETDATE(),
					ProceedBy = 'SYSTEM'
				FROM #tmpAmortisasi a	
				WHERE KartuAmortisasi.Id = a.KartuAmortisasiId
					AND a.AmortisasiRequestId = @AmortisasiRequestId
				
				/*UPDATE Nilai Buku di Purchase Order*/
				SET @Amount = (SELECT SUM(AmortizeAmount) FROM KartuAmortisasi 
								WHERE AmortisasiRequestId = @AmortisasiRequestId
									AND IsProceed = 0
								)
			
				UPDATE PurchaseOrder SET NilaiBuku = NilaiBuku - @Amount
				WHERE Id = @PoID	
				
				
				/*Send Email Notifikasi*/
				
				DECLARE @RequestId VARCHAR(100),
						@Branch VARCHAR(100),
						@DocumentDate DATE 
				
				SELECT @RequestId = RequestId,
						@Branch = eti.Cabang
				 FROM AmortisasiRequest ar
				INNER JOIN PurchaseOrder po
					ON po.Id = ar.POId
				INNER JOIN EnquiryTabunganInput eti
					ON eti.Id = po.EnquiryId										
				WHERE ar.Id  = @AmortisasiRequestId
				
				SET @DocumentDate = GETDATE()
				
				EXEC SP_SendEmail_MyFunding
				'AutoAmortisasi',
				@RequestId,
				@Branch,
				@DocumentDate,
				'Amortisasi',
				'Auto Amortisasi',
				''								
				
				/*END Send Email Notifikasi*/
																															
				FETCH NEXT FROM cursorAmortisasi 
				INTO @ColGUID,@AmortisasiRequestId,@PoID,@Amount
			END
			CLOSE cursorAmortisasi;
			DEALLOCATE cursorAmortisasi;
				
																				
		END
	  
	END

DROP TABLE #tmpAmortisasi
DROP TABLE #tmpAmortisasiHeader1
DROP TABLE #tmpAmortisasiHeader2
DROP TABLE #tmpAmortisasiDetail
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_AUTO_PENCADANGAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_AUTO_PENCADANGAN]  
 @date DATE = NULL  
 -- Add the parameters for the stored procedure here  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
 DECLARE @DATENOW DATE =  ISNULL(@date, GETDATE())  
 DECLARE @TGL INT = DAY(@DATENOW)  
 DECLARE @MAXTGL INT = DAY(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0)))  
 DECLARE @TABLE TABLE (  
  BranchId nvarchar(100),  
  BranchName nvarchar(100),  
  IntAccCategoryId nvarchar(100),  
  IntAccCategoryName nvarchar(100),  
  Narative nvarchar(100),  
  Currency nvarchar(100),  
  CreateBy nvarchar(max),  
  CreateDate datetime,  
  DebitKredit int  
 )  
   
DECLARE   
@AccBddPromosi Varchar(100),   
@AccByBunga Varchar(100),  
  
@AccNameBddPromosi Varchar(100),   
@AccNameByBunga Varchar(100)  
  
--BddPromosi, KspHutang, KewPajak, RekPerantara, BiayaBunga  
Select @AccBddPromosi = a.Number, @AccNameBddPromosi = a.Deskripsi from dbo.fn_ListAccountPencadangan('BddPromosi') a  
Select @AccByBunga = a.Number, @AccNameByBunga = a.Deskripsi from dbo.fn_ListAccountPencadangan('BiayaBunga') a  
  
   
 INSERT INTO @TABLE VALUES (  
  'ID0010100',  
  'KC TOMANG',  
  @AccByBunga,  
  @AccNameByBunga,  
  'Pencadangan by system',  
  'IDR',  
  'System' ,  
  GETDATE(),  
  0  
 ),(  
  'ID0010100',  
  'KC TOMANG',  
  @AccBddPromosi,  
  @AccNameBddPromosi,  
  'Pencadangan by system',  
  'IDR',  
  'System' ,  
  GETDATE(),  
  1  
 )  
   
 --SELECT *FROM @TABLE  
   
    INSERT INTO [SQL_FUNDING].[dbo].[PencadanganTransaksi]  
      ([PencadanganId]  
      ,[Value_date]  
      ,[ref_code]  
      ,[BranchId]  
      ,[BranchName]  
      ,[IntAccCategoryId]  
      ,[IntAccCategoryName]  
      ,[DebitKredit]  
      ,[Narative]  
      ,[Currency]  
      ,[Amount]  
      ,[CreateBy]  
      ,[CreateDate]  
      ,[UpdateBy]  
      ,[UpdateDate]  
      ,[ApproveBy]  
      ,[ApproveDate]  
      ,[RejectBy]  
      ,[RejectDate]  
      ,[RejectReason]  
      ,[CompanyId]  
      ,[StatusData]  
      ,[IsDelete])  
   SELECT   
      p.Id --P.--<PencadanganId, int,>  
      , GETDATE() --<Value_date, datetime,>  
      , p.RequestId + RIGHT(CONVERT(VARCHAR(8),1000 + ( COUNT(PT.Id) / 2) +1),3) --<ref_code, nvarchar(max),>"  
      , T.BranchId--,'ID0010100' --<BranchId, nvarchar(max),>  
      , T.BranchName--,'KC TOMANG' --<BranchName, nvarchar(max),>  
      , T.IntAccCategoryId--,'PL66552'--<IntAccCategoryId, nvarchar(max),>  
      , T.IntAccCategoryName--,'Biaya Bunga Program Tabungan'--<IntAccCategoryName, nvarchar(max),>  
      , T.DebitKredit--, 0 --<DebitKredit, int,>  
      , T.Narative--, 'Pencadangan by system'--<Narative, nvarchar(max),>  
      , T.Currency--, 'IDR'--<Currency, nvarchar(max),>  
      , P.NominalPencadangan--, @JUMLAHBULANLEWAT*@amountPerBulan--<Amount, decimal(18,2),>  
      , 'SYSTEM'--, 'System' --<CreateBy, nvarchar(max),>  
      , GETDATE()--, GETDATE()--<CreateDate, datetime,>  
      ,null--<UpdateBy, nvarchar(max),>  
      ,null--<UpdateDate, datetime,>  
      ,null--<ApproveBy, nvarchar(max),>  
      ,null--<ApproveDate, datetime,>  
      ,null--<RejectBy, nvarchar(max),>  
      ,null--<RejectDate, datetime,>  
      ,null--<RejectReason, nvarchar(max),>  
      ,null--<CompanyId, int,>  
      ,1--<StatusData, int,>  
      ,0--<IsDelete, bit,>)  
 FROM Pencadangan P  
 LEFT JOIN PencadanganTransaksi pt on pt.PencadanganId = p.Id  
 JOIN @TABLE T on 1 = 1  
 WHERE @DATENOW BETWEEN p.startDate AND p.maturityDate  
 --AND P.JPId IS NULL  
 AND   
 (  
  --CONVERT(date, P.PecadanganDate) = @date  
  DAY(P.startDate) = @TGL OR (@MAXTGL = @TGL AND DAY(P.startDate) >= @TGL)  
 )  
 GROUP BY p.Id, p.RequestId , T.BranchId, T.BranchName , T.IntAccCategoryId, T.IntAccCategoryName , T.DebitKredit, T.Narative, T.Currency, P.NominalPencadangan  
   
 --Select @TGL , @MAXTGL , @date  
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_Cashback]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Eka Muhendra>    
-- Create date: <16 Sep 2020>    
-- Description: <SP View Cashback>]
--EXEC [dbo].[SP_Cashback] '','','6008',''    
CREATE PROCEDURE [dbo].[SP_Cashback]     
 -- Add the parameters for the stored procedure here    
 @no VARCHAR(50) = null,    
 @norekening VARCHAR(50) = null,    
 @jenis INT,    
 @cabang VARCHAR(20) = null    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
 
 DECLARE @stringValue VARCHAR(500)
    
    -- Insert statements for procedure here    
  
 SELECT a.[Id]    
    ,[TglBukaRekening]    
    ,[JenisTabungan]    
    ,[NoRekening]    
    ,[NoCif]    
    ,[NamaNasabah]    
    ,[KodePromosi]    
    ,[Cabang]    
    ,NamaCabang = d.company_name    
    ,[StartDate]    
    ,[MaturityDate]    
    ,[RewardBudget]    
    ,[PRId]    
    ,b.Jumlah  
    ,[PRDate]    
    ,[DraftPRId]    
    ,[DraftPRDate]    
    ,[Requester]    
    ,[AttachmentSPNasabah]    
    ,[RewardBudget]    
    ,[AttachmentMemoDireksi]    
    ,[CatatanCabang]    
    ,[CatatanFProduct]    
    ,a.[CreateBy]    
    ,a.[CreateDate]    
    ,a.[UpdateBy]    
    ,a.[UpdateDate]    
    ,a.[ApproveBy]    
    ,a.[ApproveDate]   
    ,kat.Keterangan
    ,
    --(STUFF((
    --    SELECT ', ' + Warna
    --    FROM DetailBarang
    --    WHERE EnquiryId = a.Id
    --    FOR XML PATH('')
    --    ), 1, 2, '')
    --) 
    db.Warna AS Warna
    , db.Keterangan as TypeCashback
    , kat.Merk as Merek
    , kat.[Type] as TypeBarang
    ,db.Id AS DetailBarangId
    
    --,(SELECT @stringValue = COALESCE(@stringValue + ', ' + '') + db.Warna FROM DetailBarang db WHERE EnquiryID = a.Id ) 
 FROM [SQL_FUNDING].[dbo].[EnquiryTabunganInput] a WITH(NOLOCK)    
 LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK) ON d.[@ID] = a.Cabang COLLATE DATABASE_DEFAULT  
 LEFT JOIN [SQL_FUNDING].dbo.Katalog kat WITH(NOLOCK) ON kat.Kode_Promo = a.KodePromosi AND kat.IsDelete = 0 
 INNER JOIN [SQL_FUNDING].dbo.DetailBarang db
	ON db.EnquiryId = a.Id 
 --(SELECT count(id) as Jumlah,EnquiryId     
 --FROM [SQL_FUNDING].dbo.Detailbarang db    
 --WHERE db.Id not in (select DetailBarangId from PurchaseOrder)    
 --GROUP BY EnquiryId    
 --)B On b.EnquiryId = a.Id    
 Outer Apply (    
  select COUNT(id) as Jumlah from DetailBarang db     
  where db.EnquiryId = a.Id     
  --and db.Id not in (select DetailBarangId from PurchaseOrder)    
  and not exists    
  (  
   Select top 1 1 from PurchaseOrder po   
   where po.EnquiryId = a.Id and db.Id = po.DetailBarangId)    
  )    
  B     
 WHERE PRId IS NOT NULL AND ApproveBy2 IS NOT NULL --Munculin data     
 AND (NoRekening LIKE '%' + @NoRekening + '%'  or @norekening is null)  
 and (Cabang = @cabang or @cabang = '')  
 AND JenisTabungan = @jenis  
 AND (PRId LIKE '%' + @no + '%'  or @no is null)  
 AND b.Jumlah > 0    
 --AND db.Id NOT IN (SELECT DetailBarangId FROM PurchaseOrder WITH(NOLOCK))
 and db.KategoriBarang = 8    
 ORDER BY a.CreateDate desc  
END 



GO
/****** Object:  StoredProcedure [dbo].[SP_CHECKING_ACCCOUNT]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SP_GET_BRANCEDESC] 'ID0010111'

CREATE PROCEDURE [dbo].[SP_CHECKING_ACCCOUNT]
	
	@AccountNumber VARCHAR(200)

AS
BEGIN
	SET NOCOUNT ON;

	SELECT	[@ID] AS AccountNo,
			account_title_1	AS AccountName				
		FROM SQL_TEMENOS.dbo.ACCOUNT		
		WHERE	[@ID] = @AccountNumber

END


GO
/****** Object:  StoredProcedure [dbo].[SP_DELIVERYORDER]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Alexander Andri>  
-- Create date: <29 Agustus 2016>  
-- Description: <SP View Delivery Order> 

-- [SP_DELIVERYORDER] '', '', '6502', '', null, '', null
-- =============================================

CREATE PROCEDURE [dbo].[SP_DELIVERYORDER]
	
	@no VARCHAR(50)
	,@norekening VARCHAR(50)
	,@jenis INT
	,@cabang VARCHAR(20)
	,@tanggal VARCHAR(50)
	,@nopr VARCHAR(50)
	,@tanggalpr VARCHAR(50)
	
AS  
BEGIN

	SET NOCOUNT ON;
	
	SELECT	a.[Id]
			,b.POId
			,a.PurchaseOrderId
			,b.PODate
			,a.PurchaseReceiveId
			,a.PurchaseReceiveDate
			,c.PromotionCode
			,c.TypeBarang
			,c.Merek
			,c.Warna
			,b.Quantity
			,d.JenisTabungan
			,StatusBarang = ISNULL(e.StatusBarang,0)
			
		FROM [SQL_FUNDING].[dbo].PurchaseReceive a WITH(NOLOCK)
		
		LEFT JOIN [SQL_FUNDING].[dbo].[PurchaseOrder] b WITH(NOLOCK)ON a.PurchaseOrderId = b.Id
		LEFT JOIN [SQL_FUNDING].dbo.DetailBarang c WITH(NOLOCK) ON c.Id = b.DetailBarangId
		LEFT JOIN [SQL_FUNDING].dbo.EnquiryTabunganInput d WITH(NOLOCK) ON d.Id = b.EnquiryId
		
		LEFT JOIN(
			SELECT	StatusBarang = MAX(StatusBarang),PurchaseOrderId
				FROM [SQL_FUNDING].dbo.DeliveryOrder e WITH(NOLOCK)
				GROUP BY PurchaseOrderId
				--WHERE e.PurchaseOrderId = b.Id
			)e ON e.PurchaseOrderId = b.Id
			
		WHERE	a.ApproveBy IS NOT NULL --Munculin data
				AND a.PurchaseOrderId NOT IN (SELECT PurchaseOrderId FROM DeliveryOrder WHERE StatusBarang = 4)
				AND JenisTabungan = @jenis
				AND NoRekening LIKE '%' + @NoRekening + '%'
				AND b.POId LIKE '%' + @no + '%'
				AND a.PurchaseReceiveId LIKE '%' + @nopr + '%'
				AND (CAST(PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)
				AND (CAST(a.PurchaseReceiveDate AS DATE) = CAST(@tanggalpr AS DATE) OR @tanggalpr IS NULL)
				AND (Cabang = @cabang OR @cabang = '')
				
		ORDER BY	a.CreateDate DESC
   
END

--delete DeliveryOrder
GO
/****** Object:  StoredProcedure [dbo].[SP_DELIVERYORDERDETAIL]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Alexander Andri>
-- Create date: <29 Agustus 2016>
-- Description:	<SP View Delivery Order Detail>
-- =============================================

CREATE PROCEDURE [dbo].[SP_DELIVERYORDERDETAIL]
	
	@ID int
	
AS
BEGIN

	SET NOCOUNT ON;

	
	SELECT	DeliveryOrderId
			,DeliveryOrderDate
			,StatusBarang
			,Receiver
			,Condition
			,attachmentTandaTerima
			,[Description]
			
		FROM [SQL_FUNDING].[dbo].DeliveryOrder a WITH(NOLOCK)
		
		WHERE	PurchaseOrderId = @ID
		
		ORDER BY	a.CreateDate DESC
	
END

--delete DeliveryOrder
GO
/****** Object:  StoredProcedure [dbo].[SP_ENQUIRYTABUNGAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Alexander Andri <3 Yoyon>  
-- Create date: <20 mei- 2016>  
-- Description: <Select enquiry tabungan>  
-- => AMBIL DI ACCOUNT  
-- 6501 = "TabunganSiPucuk"  
-- 6502 = "TabunganSiPucukReward"  
-- => AMBIL DI AZ_ACCOUNT  
-- 6008 = "TabunganHadiahLangsung"  
-- [SP_ENQUIRYTABUNGAN] null,'6502',''  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_ENQUIRYTABUNGAN]  
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190110, jeni, penambahan filter yang sudah direject tidak keluar
	20200721, jeni, ganti query biar gk naik darah
	20200810, jeni, ganti untuk kebutuhan PSH

*/
 @tanggal DATETIME,-- = '2016-09-01',  
 @jenis INT,-- = '6501',  
 @cabang VARCHAR(50) = NULL  
AS  
BEGIN  
SET NOCOUNT ON;  
  
 declare @BatchDate date

IF @jenis in(6008, 6001, 6004)
BEGIN  
--PRINT '= 6008' --Tabungan Hadiah Langsung  

 select top 1 @BatchDate = batch_date from SQL_TEMENOS.dbo.[az_ACCOUNT] order by batch_date desc

 select * into #TempTAI_1 
 from SQL_TEMENOS.dbo.[ACCOUNT]  
 where batch_date = @BatchDate
 --and [category] IN ('6501','6502')
 and ([category] = @jenis OR @jenis IS NULL)

 select * 
 into #TempTAI_2 
 from [SQL_TEMENOS].[dbo].[AC_LOCKED_EVENTS_HISTORI]
 where batch_date = @BatchDate

SELECT 
  DISTINCT
	a.customer_no, 
  ISNULL(a.[account_no],'') [NoRekening]
  --,b.[customer_no] [NoCif]
  --,[NamaNasabah] = b.[name_1]  
  ,[CategoryCode] = ISNULL(a.[category],'')  
  ,[KodePromosi] = ISNULL(g.[Kode_Promo],'')  
  ,[JenisTabungan] = CAST(a.[category] AS INT)  
  ,[Cabang] = a.[co_code]  
  ,[NamaCabang] = d.[company_name]  
  ,[TglBukaRekening] = a.[opening_date]  
--jeni, begin  
  --,[StartDate] = a.[opening_date]  
  --,le.[to_date] [MaturityDate]
  ,[StartDate] = le.[from_date]
  ,[FromDate] = le.[from_date]
  ,[MaturityDate] = le.[to_date]
  ,[ToDate] = le.[to_date]
--jeni, end
  ,[Nominal] = CONVERT(NUMERIC(18,2),[online_actual_bal])  
  ,g.[Kategory]  
  ,[Keterangan]  = le.[description]
  ,g.[Merk]  
  ,g.[Type]  
  ,g.[Penalty]  
into #TempTAI_3
 FROM #TempTAI_1 a  
 JOIN #TempTAI_2 le ON a.[account_no] COLLATE DATABASE_DEFAULT = le.[account_number] COLLATE DATABASE_DEFAULT 
 --LEFT JOIN  [SQL_TEMENOS].[dbo].[CUSTOMER] b WITH(NOLOCK) ON a.[customer_no] COLLATE DATABASE_DEFAULT = b.[customer_no] COLLATE DATABASE_DEFAULT
 LEFT JOIN (SELECT * FROM [SQL_FUNDING].[dbo].[Katalog] WITH(NOLOCK)) g  ON g.[Kode_Promo] COLLATE DATABASE_DEFAULT = a.[l_kode_promo] COLLATE DATABASE_DEFAULT  
 LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] d WITH(NOLOCK) ON d.[@ID] COLLATE DATABASE_DEFAULT = a.[co_code] COLLATE DATABASE_DEFAULT 
 WHERE 
   (CAST(a.[opening_date] AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)  
   AND (a.[co_code] = @cabang OR @cabang IS NULL OR @cabang = '')  
   AND a.[account_no] COLLATE DATABASE_DEFAULT NOT IN( SELECT [NoRekening] FROM [EnquiryTabunganInput] WITH(NOLOCK) WHERE RejectBy IS NULL AND IsDelete = 0 )  
 ORDER BY a.[opening_date] DESC  


 select
  [NoRekening]
  ,a.[customer_no] as [NoCif]
  ,b.[name_1]   as [NamaNasabah]
  ,[CategoryCode]
  ,[KodePromosi]
  ,[JenisTabungan]
  ,[Cabang]
  ,[NamaCabang]
  ,[TglBukaRekening]
  ,[StartDate]
  ,[MaturityDate]
  ,[Nominal]
  ,[Kategory]  
  ,[Keterangan]  
  ,[Merk]  
  ,[Type]  
  ,[Penalty]  
from #TempTAI_3 a
	JOIN  [SQL_TEMENOS].[dbo].[CUSTOMER] b WITH(NOLOCK) ON a.[customer_no] COLLATE DATABASE_DEFAULT = b.[customer_no] COLLATE DATABASE_DEFAULT

END  
  
ELSE  
BEGIN  
PRINT '<> 6008' --TabunganSiPucuk(6501) && TabunganSiPucukReward(6502)  
--20200721, jeni, begin
 select top 1 @BatchDate = batch_date from SQL_TEMENOS.dbo.[az_ACCOUNT] order by batch_date desc

 select * into #TempTAI 
 from SQL_TEMENOS.dbo.[az_ACCOUNT]  
 where batch_date = @BatchDate
 --and [category] IN ('6501','6502')
 and ([category] = @jenis OR @jenis IS NULL)
--20200721, jeni, end


SELECT DISTINCT  
  [NoRekening] = ISNULL(f.[@ID],'')  
  ,[NoCif] = b.[customer_no]  
  ,[NamaNasabah] = b.[name_1]  
  ,[CategoryCode] = ISNULL(f.[category],'')  
  --,[JenisTabungan] = CASE WHEN a.[category] = '6501' THEN 0  
  --       WHEN a.[category] = '6502' THEN 1  
  --       WHEN a.[category] = '6008' THEN 2  
  --     END  
  ,[KodePromosi] = ISNULL(e.[Kode_Promo],f.[l_az_reward_pro])  
  ,[JenisTabungan] = CAST(f.[category] AS INT)  
  ,[Cabang] = f.[co_code]  
  ,[NamaCabang] = d.[company_name]  
  ,[TglBukaRekening] = ISNULL(f.[value_date],NULL)  
  ,[StartDate] = ISNULL(f.[value_date],NULL)  
  ,[MaturityDate] = ISNULL(f.[maturity_date],NULL)  
  ,[Nominal] = CONVERT(NUMERIC(18,2),[principal])  
  ,e.[Kategory]  
  ,e.[Keterangan]  
  ,e.[Merk]  
  ,e.[Type]  
  ,e.[Penalty]
  ,eti.RejectBy
  ,eti.DraftPRId
  ,eti.DraftPRDate
  ,eti.Requester
  ,eti.CatatanCabang
  ,eti.AttachmentSPNasabah
  ,eti.Id AS EnquiryId
--20200721, jeni, begin
-- FROM [SQL_TEMENOS].[dbo].[az_ACCOUNT] f  
-- LEFT JOIN [SQL_TEMENOS].[dbo].[CUSTOMER] b WITH(NOLOCK) ON f.[customer] = b.[customer_no] COLLATE DATABASE_DEFAULT  
-- LEFT JOIN (SELECT * FROM [SQL_FUNDING].[dbo].[Katalog] WITH(NOLOCK)
--			WHERE IsDelete = 0) e ON e.[Kode_Promo] = f.[l_az_reward_pro] COLLATE DATABASE_DEFAULT  
-- LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] d WITH(NOLOCK) ON d.[@ID] = f.[co_code] COLLATE DATABASE_DEFAULT  
-- LEFT JOIN [SQL_FUNDING].[dbo].EnquiryTabunganInput eti
--	ON eti.NoRekening = f.[@ID] COLLATE DATABASE_DEFAULT 
-- WHERE f.[category] IN ('6501','6502')  
--   AND (CAST(f.[value_date] AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)  
--   AND (f.[category] = @jenis OR @jenis IS NULL)  
--   AND (f.[co_code] = @cabang OR @cabang IS NULL OR @cabang = '')     
--   AND f.[@ID] COLLATE DATABASE_DEFAULT NOT IN( SELECT [NoRekening] FROM [EnquiryTabunganInput] WITH(NOLOCK) WHERE RejectBy IS NULL AND IsDelete = 0 )  
--   AND f.[batch_date] IN( SELECT MAX([batch_date]) FROM [SQL_TEMENOS].[dbo].[az_ACCOUNT] WITH(NOLOCK) )  
--   AND e.Kode_Promo NOT IN ('M0001-25')
--   AND (CAST(f.[value_date] AS DATE) >= '01-AUG-2018')  
----20190114, jeni, BEGIN
--   AND isnull(eti.DraftPRId,'') = ''
----20190114, jeni, END



FROM #TempTAI f  
 JOIN [SQL_TEMENOS].[dbo].[CUSTOMER] b WITH(NOLOCK) ON f.[customer] COLLATE DATABASE_DEFAULT = b.[customer_no] COLLATE DATABASE_DEFAULT  
 LEFT JOIN (SELECT * FROM [SQL_FUNDING].[dbo].[Katalog] WITH(NOLOCK)
			WHERE IsDelete = 0) e ON e.[Kode_Promo] COLLATE DATABASE_DEFAULT = f.[l_az_reward_pro] COLLATE DATABASE_DEFAULT  
 LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] d WITH(NOLOCK) ON d.[@ID] COLLATE DATABASE_DEFAULT = f.[co_code] COLLATE DATABASE_DEFAULT  
 LEFT JOIN [SQL_FUNDING].[dbo].EnquiryTabunganInput eti 
	ON eti.NoRekening COLLATE DATABASE_DEFAULT = f.[@ID] COLLATE DATABASE_DEFAULT 
 WHERE (CAST(f.[value_date] AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)  
   --AND (f.[category] = @jenis OR @jenis IS NULL)  
   AND (f.[co_code] = @cabang OR @cabang IS NULL OR @cabang = '')     
   AND f.[@ID] COLLATE DATABASE_DEFAULT NOT IN( SELECT [NoRekening] FROM [EnquiryTabunganInput] WITH(NOLOCK) WHERE RejectBy IS NULL AND IsDelete = 0 )  
   AND e.Kode_Promo NOT IN ('M0001-25')
   AND (CAST(f.[value_date] AS DATE) >= '01-AUG-2018')  
--20190114, jeni, BEGIN
   AND isnull(eti.DraftPRId,'') = ''
--20190114, jeni, END
--20200721, jeni, end
END  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ENQUIRYTABUNGAN_20200721]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Alexander Andri <3 Yoyon>  
-- Create date: <20 mei- 2016>  
-- Description: <Select enquiry tabungan>  
-- => AMBIL DI ACCOUNT  
-- 6501 = "TabunganSiPucuk"  
-- 6502 = "TabunganSiPucukReward"  
-- => AMBIL DI AZ_ACCOUNT  
-- 6008 = "TabunganHadiahLangsung"  
-- [SP_ENQUIRYTABUNGAN] null,'6502',''  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_ENQUIRYTABUNGAN_20200721]  
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190110, jeni, penambahan filter yang sudah direject tidak keluar
*/
 @tanggal DATETIME,-- = '2016-09-01',  
 @jenis INT,-- = '6501',  
 @cabang VARCHAR(50) = NULL  
AS  
BEGIN  
SET NOCOUNT ON;  
  
IF @jenis =6008  
BEGIN  
PRINT '= 6008' --Tabungan Hadiah Langsung  
SELECT DISTINCT  
  [NoRekening] = ISNULL(a.[account_no],'')  
  ,[NoCif] = b.[customer_no]  
  ,[NamaNasabah] = b.[name_1]  
  ,[CategoryCode] = ISNULL(a.[category],'')  
  --,[JenisTabungan] = CASE WHEN a.category = '6501' THEN 0  
  --       WHEN a.category = '6502' THEN 1  
  --       WHEN a.category = '6008' THEN 2  
  --     END  
  ,[KodePromosi] = ISNULL(g.[Kode_Promo],'')  
  ,[JenisTabungan] = CAST(a.[category] AS INT)  
  ,[Cabang] = a.[co_code]  
  ,[NamaCabang] = d.[company_name]  
  ,[TglBukaRekening] = a.[opening_date]  
  ,[StartDate] = a.[opening_date]  
  ,[MaturityDate] = le.[to_date]  
  ,[Nominal] = CONVERT(NUMERIC(18,2),[online_actual_bal])  
  ,g.[Kategory]  
  ,g.[Keterangan]  
  ,g.[Merk]  
  ,g.[Type]  
  ,g.[Penalty]  
 FROM [SQL_TEMENOS].[dbo].[ACCOUNT] a  
 LEFT JOIN [SQL_TEMENOS].[dbo].[ac_locked_events] le ON a.[account_no] = le.[account_number]  
 LEFT JOIN  [SQL_TEMENOS].[dbo].[CUSTOMER] b WITH(NOLOCK) ON a.[customer_no] = b.[customer_no]  
 LEFT JOIN (SELECT * FROM [SQL_FUNDING].[dbo].[Katalog] WITH(NOLOCK))  g  ON g.[Kode_Promo] = a.[l_kode_promo]  
 LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] d WITH(NOLOCK) ON d.[@ID] = a.[co_code]  
 WHERE a.[category] IN ('6008')  
   AND (CAST(a.[opening_date] AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)  
   AND (a.[category] = @jenis OR @jenis IS NULL)  
   AND (a.[co_code] = @cabang OR @cabang IS NULL OR @cabang = '')  
   AND a.[account_no] NOT IN( SELECT [NoRekening] FROM [EnquiryTabunganInput] WITH(NOLOCK) WHERE RejectBy IS NULL AND IsDelete = 0 )  
   AND a.[batch_date] IN( SELECT MAX([batch_date]) FROM [SQL_TEMENOS].[dbo].[ACCOUNT] WITH(NOLOCK) )  
 ORDER BY a.[opening_date] DESC  
END  
  
ELSE  
BEGIN  
PRINT '<> 6008' --TabunganSiPucuk(6501) && TabunganSiPucukReward(6502)  
SELECT DISTINCT  
  [NoRekening] = ISNULL(f.[@ID],'')  
  ,[NoCif] = b.[customer_no]  
  ,[NamaNasabah] = b.[name_1]  
  ,[CategoryCode] = ISNULL(f.[category],'')  
  --,[JenisTabungan] = CASE WHEN a.[category] = '6501' THEN 0  
  --       WHEN a.[category] = '6502' THEN 1  
  --       WHEN a.[category] = '6008' THEN 2  
  --     END  
  ,[KodePromosi] = ISNULL(e.[Kode_Promo],f.[l_az_reward_pro])  
  ,[JenisTabungan] = CAST(f.[category] AS INT)  
  ,[Cabang] = f.[co_code]  
  ,[NamaCabang] = d.[company_name]  
  ,[TglBukaRekening] = ISNULL(f.[value_date],NULL)  
  ,[StartDate] = ISNULL(f.[value_date],NULL)  
  ,[MaturityDate] = ISNULL(f.[maturity_date],NULL)  
  ,[Nominal] = CONVERT(NUMERIC(18,2),[principal])  
  ,e.[Kategory]  
  ,e.[Keterangan]  
  ,e.[Merk]  
  ,e.[Type]  
  ,e.[Penalty]
  --,Case When eti.PenyimpanganProgram = 0 then 'Tidak' When eti.PenyimpanganProgram = 1 then 'Iya' else 'None' end as PenyimpanganProgram
  ,eti.RejectBy
  ,eti.DraftPRId
  ,eti.DraftPRDate
  ,eti.Requester
  ,eti.CatatanCabang
  ,eti.AttachmentSPNasabah
  ,eti.Id AS EnquiryId
 FROM [SQL_TEMENOS].[dbo].[az_ACCOUNT] f  
 LEFT JOIN [SQL_TEMENOS].[dbo].[CUSTOMER] b WITH(NOLOCK) ON f.[customer] = b.[customer_no] COLLATE DATABASE_DEFAULT  
 LEFT JOIN (SELECT * FROM [SQL_FUNDING].[dbo].[Katalog] WITH(NOLOCK)
			WHERE IsDelete = 0) e ON e.[Kode_Promo] = f.[l_az_reward_pro] COLLATE DATABASE_DEFAULT  
 LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] d WITH(NOLOCK) ON d.[@ID] = f.[co_code] COLLATE DATABASE_DEFAULT  
 LEFT JOIN [SQL_FUNDING].[dbo].EnquiryTabunganInput eti
	ON eti.NoRekening = f.[@ID] COLLATE DATABASE_DEFAULT 
 WHERE f.[category] IN ('6501','6502')  
   AND (CAST(f.[value_date] AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)  
   AND (f.[category] = @jenis OR @jenis IS NULL)  
   AND (f.[co_code] = @cabang OR @cabang IS NULL OR @cabang = '')     
   AND f.[@ID] COLLATE DATABASE_DEFAULT NOT IN( SELECT [NoRekening] FROM [EnquiryTabunganInput] WITH(NOLOCK) WHERE RejectBy IS NULL AND IsDelete = 0 )  
   AND f.[batch_date] IN( SELECT MAX([batch_date]) FROM [SQL_TEMENOS].[dbo].[az_ACCOUNT] WITH(NOLOCK) )  
   AND e.Kode_Promo NOT IN ('M0001-25')
   AND (CAST(f.[value_date] AS DATE) >= '01-AUG-2018')  
--20190114, jeni, BEGIN
   AND isnull(eti.DraftPRId,'') = ''
--20190114, jeni, END
END  
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GENERATE_NOMOR]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Alexander Andri>      
-- Create date: <22 juni 2016>      
-- Description: <SP Generate Nomor Purchase Request>    
-- [SP_GENERATE_NOMOR] 'Enquiry'
-- [SP_GENERATE_NOMOR] 'Purchase'
-- =============================================      
CREATE PROCEDURE [dbo].[SP_GENERATE_NOMOR]      
 -- Add the parameters for the stored procedure here      
 @category VARCHAR(50)      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
 DECLARE @JUMLAH VARCHAR(10), @JUMLAH2 VARCHAR(10),       
 @JUMLAH3 VARCHAR(10), @JUMLAH4 VARCHAR(10),  
 @JUMLAH5 VARCHAR(10), @JUMLAH6 VARCHAR(10),  
 @JUMLAH7 VARCHAR(10), @JUMLAH8 VARCHAR(10),  
 @JUMLAH9 VARCHAR(10), @JUMLAH10 VARCHAR(10),
 @Prefix VARCHAR(15)
 
 IF (@category = 'PaymentRequest')
 BEGIN
	SET @Prefix = 'PYR' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
 
	SELECT @JUMLAH4 = ISNULL(MAX(Cast(RIGHT(PaymentRequestId, 4)as int)),'0') + 1 FROM PaymentRequest WITH(NOLOCK) --Buat No PaymentRequest      
	WHERE PaymentRequestId LIKE 'PYR' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
 END
 ELSE IF (@category = 'Enquiry')
 BEGIN
	SET @Prefix = 'DPR' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
	
	SELECT @JUMLAH = ISNULL(MAX(Cast(RIGHT(DraftPRId, 5)as int)),'0') + 1 FROM EnquiryTabunganInput WITH(NOLOCK) -- Buat No Draft Purchase Request 
	WHERE DraftPRId LIKE 'DPR' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
 
 END
 ELSE IF (@category = 'Purchase')
 BEGIN
	SET @Prefix = 'PRRWD' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
 
	SELECT @JUMLAH2 = ISNULL(MAX(Cast(RIGHT(PRId, 5)as int)),'0') + 1 FROM EnquiryTabunganInput WITH(NOLOCK) --WHERE PRId IS NOT NULL --Buat No Purchase Request
	WHERE PRId LIKE 'PRRWD' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
	
 END
 ELSE IF (@category = 'PurchaseReceive')
 BEGIN
	SET @Prefix = 'PCR' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
	
	SELECT @JUMLAH5 = ISNULL(MAX(Cast(RIGHT(PurchaseReceiveId, 4)as int)),'0') + 1 FROM PurchaseReceive WITH(NOLOCK) --Buat No PurchaseReceive 
	WHERE PurchaseReceiveId LIKE 'PCR' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
	
 END
 ELSE IF (@category = 'Pelunasan')
 BEGIN
	SET @Prefix = 'PLS' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
 
	SELECT @JUMLAH6 = ISNULL(MAX(Cast(RIGHT(PelunasanId, 4)as int)),'0') + 1 FROM PurchaseReceive WITH(NOLOCK) --WHERE PelunasanId IS NOT NULL--Buat No PurchaseReceive   
	WHERE PelunasanId LIKE 'PLS' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
 
 END
 ELSE IF (@category = 'DeliveryOrder')
 BEGIN
	SET @Prefix = 'DO' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
 
	SELECT @JUMLAH7 = ISNULL(MAX(Cast(RIGHT(DeliveryOrderId, 5)as int)),'0') + 1 FROM DeliveryOrder WITH(NOLOCK) --Buat No Delivery Order  
	WHERE DeliveryOrderId LIKE 'DO' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
	
 END
 ELSE IF (@category = 'Amortisasi')
 BEGIN
	SET @Prefix = 'AM' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
 
	SELECT @JUMLAH8 = ISNULL(MAX(Cast(RIGHT(RequestId, 5)as int)),'0') + 1 FROM AmortisasiRequest WITH(NOLOCK) --Buat No Amortisasi 
	WHERE RequestId LIKE 'AM' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
	
 END 
 ELSE IF (@category = 'BreakAmortisasi')
 BEGIN
	SET @Prefix = 'BA' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
 
	SELECT @JUMLAH9 = ISNULL(MAX(Cast(RIGHT(RequestId, 5)as int)),'0') + 1 FROM BreakAmortisasiRequest WITH(NOLOCK) --Buat No Amortisasi 
	WHERE RequestId LIKE 'BA' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
		
 END 
 ELSE IF (@category = 'Pencadangan')
 BEGIN
	SET @Prefix = 'PC' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2)
 
	SELECT @JUMLAH10 = ISNULL(MAX(Cast(RIGHT(RequestId, 5)as int)),'0') + 1 FROM Pencadangan WITH(NOLOCK) --Buat No Amortisasi 
	WHERE RequestId LIKE 'PC' + CONVERT(VARCHAR,YEAR(GETDATE())) + RIGHT('0' + CONVERT(VARCHAR,MONTH(GETDATE())),2) + RIGHT('0' + CONVERT(VARCHAR,DAY(GETDATE())),2) + '%'
 
 END
 
 -- Insert statements for procedure here      
      
   
 --SELECT @JUMLAH3 = MAX(Cast(RIGHT(POId, 5)as int)) + 1 FROM PurchaseOrder WITH(NOLOCK) --Buat No Purchase Order      
 
                            
       
 IF (LEN(@JUMLAH) = 1)      
  SET @JUMLAH = '0000' + @JUMLAH      
 ELSE IF (LEN(@JUMLAH) = 2)      
  SET @JUMLAH = '000' + @JUMLAH      
 ELSE IF (LEN(@JUMLAH) = 3)      
  SET @JUMLAH = '00' + @JUMLAH      
 ELSE IF (LEN(@JUMLAH) = 4)      
  SET @JUMLAH = '0' + @JUMLAH      
       
 IF (LEN(@JUMLAH2) = 1)      
  SET @JUMLAH2 = '0000' + @JUMLAH2      
 ELSE IF (LEN(@JUMLAH2) = 2)      
  SET @JUMLAH2 = '000' + @JUMLAH2      
 ELSE IF (LEN(@JUMLAH2) = 3)      
  SET @JUMLAH2 = '00' + @JUMLAH2      
 ELSE IF (LEN(@JUMLAH2) = 4)      
  SET @JUMLAH2 = '0' + @JUMLAH2      
        
 IF (LEN(@JUMLAH3) = 1)      
  SET @JUMLAH3 = '0000' + @JUMLAH3      
 ELSE IF (LEN(@JUMLAH3) = 2)      
  SET @JUMLAH3 = '000' + @JUMLAH3      
 ELSE IF (LEN(@JUMLAH3) = 3)      
  SET @JUMLAH3 = '00' + @JUMLAH3      
 ELSE IF (LEN(@JUMLAH3) = 4)      
  SET @JUMLAH3 = '0' + @JUMLAH3      
        
 IF (LEN(@JUMLAH4) = 1)      
  SET @JUMLAH4 = '000' + @JUMLAH4      
 ELSE IF (LEN(@JUMLAH4) = 2)      
  SET @JUMLAH4 = '00' + @JUMLAH4      
 ELSE IF (LEN(@JUMLAH4) = 3)      
  SET @JUMLAH4 = '0' + @JUMLAH4      
 --ELSE IF (LEN(@JUMLAH4) = 4)      
 -- SET @JUMLAH4 = '0' + @JUMLAH4      
       
 IF (LEN(@JUMLAH5) = 1)      
  SET @JUMLAH5 = '000' + @JUMLAH5      
 ELSE IF (LEN(@JUMLAH5) = 2)      
  SET @JUMLAH5 = '00' + @JUMLAH5      
 ELSE IF (LEN(@JUMLAH5) = 3)      
  SET @JUMLAH5 = '0' + @JUMLAH5      
 --ELSE IF (LEN(@JUMLAH5) = 4)      
 -- SET @JUMLAH5 = '0' + @JUMLAH5      
        
 IF (LEN(@JUMLAH6) = 1)      
  SET @JUMLAH6 = '000' + @JUMLAH6      
 ELSE IF (LEN(@JUMLAH6) = 2)      
  SET @JUMLAH6 = '00' + @JUMLAH6      
 ELSE IF (LEN(@JUMLAH6) = 3)      
  SET @JUMLAH6 = '0' + @JUMLAH6      
 --ELSE IF (LEN(@JUMLAH6) = 4)      
 -- SET @JUMLAH6 = '0' + @JUMLAH6      
        
 IF (LEN(@JUMLAH7) = 1)      
  SET @JUMLAH7 = '0000' + @JUMLAH7      
 ELSE IF (LEN(@JUMLAH7) = 2)      
  SET @JUMLAH7 = '000' + @JUMLAH7      
 ELSE IF (LEN(@JUMLAH7) = 3)      
  SET @JUMLAH7 = '00' + @JUMLAH7      
 ELSE IF (LEN(@JUMLAH7) = 4)      
  SET @JUMLAH7 = '0' + @JUMLAH7      
  
 IF (LEN(@JUMLAH8) = 1)      
  SET @JUMLAH8 = '0000' + @JUMLAH8    
 ELSE IF (LEN(@JUMLAH8) = 2)      
  SET @JUMLAH8 = '000' + @JUMLAH8      
 ELSE IF (LEN(@JUMLAH8) = 3)      
  SET @JUMLAH8 = '00' + @JUMLAH8      
 ELSE IF (LEN(@JUMLAH8) = 4)      
  SET @JUMLAH8 = '0' + @JUMLAH8     
  
 IF (LEN(@JUMLAH9) = 1)      
  SET @JUMLAH9 = '0000' + @JUMLAH9    
 ELSE IF (LEN(@JUMLAH9) = 2)      
  SET @JUMLAH9 = '000' + @JUMLAH9      
 ELSE IF (LEN(@JUMLAH9) = 3)      
  SET @JUMLAH9 = '00' + @JUMLAH9      
 ELSE IF (LEN(@JUMLAH9) = 4)      
  SET @JUMLAH9 = '0' + @JUMLAH9   
  
 IF (LEN(@JUMLAH10) = 1)      
  SET @JUMLAH10 = '0000' + @JUMLAH10    
 ELSE IF (LEN(@JUMLAH10) = 2)      
  SET @JUMLAH10 = '000' + @JUMLAH10      
 ELSE IF (LEN(@JUMLAH10) = 3)      
  SET @JUMLAH10 = '00' + @JUMLAH10      
 ELSE IF (LEN(@JUMLAH10) = 4)      
  SET @JUMLAH10 = '0' + @JUMLAH10   
  
 IF @category = 'Enquiry'      
 BEGIN
 --select @JUMLAH
 SELECT NOMOR = @Prefix + @JUMLAH   
 --SELECT NOMOR = 'DPR'
 END      
       
 ELSE IF @category = 'Purchase'      
 BEGIN      
 SELECT NOMOR = @Prefix + @JUMLAH2      
 END      
       
 ELSE IF @category = 'PurchaseOrder'      
 BEGIN      
 SELECT NOMOR = 'PORWD' + CAST(YEAR(GETDATE()) AS VARCHAR) +       
     CAST(MONTH(GETDATE()) AS VARCHAR) + CAST(DAY(GETDATE()) AS VARCHAR)+@JUMLAH3      
 END      
       
 ELSE IF @category = 'PaymentRequest'      
 BEGIN      
	SELECT NOMOR = @Prefix + @JUMLAH4      
 END      
       
 ELSE IF @category = 'PurchaseReceive'      
 BEGIN       
 SELECT NOMOR = @Prefix + @JUMLAH5      
 END      
       
 ELSE IF @category = 'Pelunasan'      
 BEGIN       
 SELECT NOMOR = @Prefix + @JUMLAH6      
 END      
       
 ELSE IF @category = 'DeliveryOrder'      
 BEGIN       
 SELECT NOMOR = @Prefix + @JUMLAH7      
 END      
      
 ELSE IF @category = 'Amortisasi'      
 BEGIN       
 SELECT NOMOR = @Prefix + @JUMLAH8     
 END  
   
 ELSE IF @category = 'BreakAmortisasi'      
 BEGIN       
 SELECT NOMOR = @Prefix + @JUMLAH9  
 END  
   
 ELSE IF @category = 'Pencadangan'      
 BEGIN       
 SELECT NOMOR = @Prefix+@JUMLAH10  
 END     
       
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_GENERATE_NOMOR_POGROUP]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Alexander Andri>    
-- Create date: <22 juni 2016>    
-- Description: <SP Generate Nomor po group>    
-- =============================================    
CREATE PROCEDURE [dbo].[SP_GENERATE_NOMOR_POGROUP]    
 -- Add the parameters for the stored procedure here    
 @EnquiryID INT   
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
 DECLARE @JUMLAH VARCHAR(10)
 -- Insert statements for procedure here    
	SELECT @JUMLAH = COUNT(*) FROM DetailBarang WITH(NOLOCK) WHERE EnquiryId = @EnquiryID 
	SELECT @JUMLAH 
	
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GenerateFTCashBack]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GenerateFTCashBack]
/*
 =============================================  
 Author:  eka
 Create date: 20201001
 Description: Generate FT Jurnal Cashback
 =============================================  
exec [SP_GenerateFTCashBack] '0024/CSBK-FND/X/2020'
*/
@POGroupId varchar(30) = null
AS BEGIN
	SET NOCOUNT ON;

	
declare @GenerateText varchar(max)

set @GenerateText = ''

select 
	@GenerateText += 
	+ ',' + a.AccountDebet + ',' +
	CASE 
		WHEN b.CCYDebet = 0 THEN 'IDR' 
		WHEN b.CCYDebet = 1 THEN 'USD' 
		ELSE 'SGD' 
	END + ',' +
	LEFT(a.nominal, LEN(a.nominal) - 3) + ',' +
	a.AccountKredit + ',' +
	CASE 
		WHEN b.CCYKredit = 0 THEN 'IDR' 
		WHEN b.CCYKredit = 1 THEN 'USD' 
		ELSE 'SGD' 
	END + ',' +
	--'99999' + ',' +
	'99999' + ',' +
	a.KodeCabang + ',' +
	convert(varchar, GETDATE(), 112)  + ',' +
	convert(varchar, GETDATE(), 112)  + ',' +
	'TRNPRDDEV'  + ',' +
	'TRNPRDDEV'  + ',' +
	b.PODescription + ',' +
	case when b.CostCenter is null then '9602' else b.CostCenter end  + ',' +
	b.AdditionalInfoDetailItem + char(13)
from JurnalCashback a
	join PurchaseOrder b
		on a.POId = b.POId
where
	a.POGroupId = @POGroupId

print @GenerateText
select @GenerateText

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GenerateNoCashback]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Eka Muhendra>
-- Create date: <17 Sep 2020>
-- Description:	<Generate Nomor Cashback>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GenerateNoCashback]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Nomor VARCHAR(50)
	DECLARE @Bulan VARCHAR(2)
	DECLARE @Tahun VARCHAR(4)
	DECLARE @Format VARCHAR(50) 

    -- Insert statements for procedure here
	
			
	IF EXISTS (SELECT * FROM SQL_FUNDING.dbo.GenerateNoPurchaseOrder 
					WHERE	
							Bulan = MONTH(GETDATE())
							AND Tahun = YEAR(GETDATE()))
		BEGIN
			SELECT @Nomor = convert(varchar,MAX(Nomor) + 1 )
				FROM SQL_FUNDING.dbo.GenerateNoPurchaseOrder WITH(NOLOCK)
					WHERE	
							Bulan = MONTH(GETDATE())
							AND Tahun = YEAR(GETDATE())
		END
	ELSE
		SET @Nomor = 1
	
	
	SET @Nomor = RIGHT('0000' + @Nomor,4)
		
	SET @Bulan = MONTH(GETDATE())
	SET @Tahun = YEAR(GETDATE())
		
	SELECT @Nomor + '/' + 'CSBK-FND/' + dbo.fnConvertIntToRoman(@Bulan) + '/' + @Tahun as NoPurchaseOrder
	--SELECT @Nomor + '-MON/' + dbo.fnConvertIntToRoman(@Bulan) + '/' + @Tahun						 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GenerateNoPurchaseOrder]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SP_GenerateNoPurchaseOrder]
	-- Add the parameters for the stored procedure here
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @Nomor VARCHAR(50)
	DECLARE @Bulan VARCHAR(2)
	DECLARE @Tahun VARCHAR(4)
	DECLARE @Format VARCHAR(50) 

    -- Insert statements for procedure here
	
			
	IF EXISTS (SELECT * FROM SQL_FUNDING.dbo.GenerateNoPurchaseOrder 
					WHERE	
							Bulan = MONTH(GETDATE())
							AND Tahun = YEAR(GETDATE()))
		BEGIN
			SELECT @Nomor = convert(varchar,MAX(Nomor) + 1 )
				FROM SQL_FUNDING.dbo.GenerateNoPurchaseOrder WITH(NOLOCK)
					WHERE	
							Bulan = MONTH(GETDATE())
							AND Tahun = YEAR(GETDATE())
		END
	ELSE
		SET @Nomor = 1
	
	
	SET @Nomor = RIGHT('0000' + @Nomor,4)
		
	SET @Bulan = MONTH(GETDATE())
	SET @Tahun = YEAR(GETDATE())
		
	SELECT @Nomor + '/' + 'PO-GFA/' + dbo.fnConvertIntToRoman(@Bulan) + '/' + @Tahun as NoPurchaseOrder
	--SELECT @Nomor + '-MON/' + dbo.fnConvertIntToRoman(@Bulan) + '/' + @Tahun						 
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GET_BRANCEDESC]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[SP_GET_BRANCEDESC] 'ID0010111'

CREATE PROCEDURE [dbo].[SP_GET_BRANCEDESC]
	
	@id VARCHAR(100)

AS
BEGIN

	SELECT	[@ID]
			,company_name
		
		FROM SQL_TEMENOS.dbo.COMPANY
		
		WHERE	[@ID] = @id

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_INTACCORCATTDESC]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[SP_GET_INTACCORCATTDESC] --'PL51110'
@id varchar(100)
as
begin
select [description] from dbo.View_MappingPl where Id =  @id 
end

GO
/****** Object:  StoredProcedure [dbo].[SP_Get_JurnalCashback]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================        
-- Author:  <jeni>        
-- Create date: <20 Sep - 2020>        
-- Description: <SP_JurnalCashback>        
-- =============================================  
/*
	exec [SP_Get_JurnalCashback] 169,1
	eka, tambah parameter,insert&select
*/
CREATE PROCEDURE [dbo].[SP_Get_JurnalCashback]
 -- Add the parameters for the stored procedure here        
 @EnquiryId bigint,
 @flag int
 --@PoId varchar(50)         
AS        
BEGIN        
 SET NOCOUNT ON;        

declare @BrachID	varchar(20),
		@GL_BDD		varchar(30),
		@GL_Biaya	varchar(30),
		@GL_PPH		varchar(30),
		@GL_RAK		varchar(30),
		@GL_AccountNo	varchar(30),
		@StartDate		date,
		@MaturityDate	date,
		@pBudgetReward		money,
		@KdCabang	varchar(30),
		@NamaCabang varchar (30),
		@NamaNasabah varchar(50),
		@CCYDebet varchar(5),
		@CCYKredit varchar(5),
		@Keterangan	varchar(30),
		@NoBatch	varchar(30),
		@POId		varchar(30),
		@POGroupId	varchar(30),
		@EnqId		varchar(5),
		@CostCenter varchar(5)

declare @temp table
(
	KdCabang				varchar(30),
	NamaCabang				varchar(30),
	AccountDebet			varchar(30),
	AccountKredit			varchar(30),
	CCYDebet				varchar(5),
	CCYKredit				varchar(5),
	Keterangan				varchar(30),
	NoBatch					varchar(30),
	CostCenter				varchar(5),
	POId					varchar(30),
	POGroupId				varchar(30),
	EnqId					varchar(5),
	Nominal					money
)

select 
	@BrachID		= right(a.Cabang,4),
	@GL_AccountNo	= a.NoRekening,
	@StartDate		= a.StartDate,
	@MaturityDate	= a.MaturityDate,
	@pBudgetReward  = a.RewardBudget,
	@KdCabang		= a.Cabang,
	@NamaNasabah	= a.NamaNasabah,
	@NamaCabang		= co.company_name,
	@CCYDebet		= CASE WHEN b.CCYKredit = 0 THEN 'IDR' WHEN b.CCYDebet = 1 THEN 'USD' ELSE 'SGD' END,
	@CCYKredit		= CASE WHEN b.CCYKredit = 0 THEN 'IDR' WHEN b.CCYKredit = 1 THEN 'USD' ELSE 'SGD' END,
	@Keterangan		= b.PODescription,
	@NoBatch		= b.AdditionalInfoDetailItem,
	@POId			= b.POId,
	@POGroupId		= b.POGroupId,
	@EnqId			= b.EnquiryId,
	@CostCenter		= '9602'
from EnquiryTabunganInput a
left join sql_temenos.dbo.company co on a.Cabang = co.[@ID] COLLATE DATABASE_DEFAULT
left join PurchaseOrder b on a.id = b.EnquiryId
where a.Id = @EnquiryId --and b.PoId = @PoId

select  @GL_BDD = replace(dbo.fn_FND_ControlChar('IA_BDD_PROMOSI'),'BRANCH', @BrachID)
select  @GL_Biaya = dbo.fn_FND_ControlChar('IA_BIAYA_CASHBACK')
select  @GL_PPH = replace(dbo.fn_FND_ControlChar('IA_PPH'),'BRANCH', @BrachID)
select  @GL_RAK = replace(dbo.fn_FND_ControlChar('IA_REKENING_PERANTARA'),'BRANCH', @BrachID)

if DATEDIFF(month, @StartDate, @MaturityDate) > 1
begin
	insert into @temp(AccountDebet,AccountKredit,CCYDebet,CCYKredit,Nominal,KdCabang,NamaCabang,Keterangan,NoBatch,CostCenter,EnqId,POId,POGroupId)
	select @GL_BDD, @GL_RAK,@CCYDebet,@CCYKredit, (@pBudgetReward / 0.8),@KdCabang,@NamaCabang,@Keterangan,@NoBatch,@CostCenter,@EnqId,@POId,@POGroupId
end
else
begin
	insert into @temp(AccountDebet,AccountKredit,CCYDebet,CCYKredit,Nominal,KdCabang,NamaCabang,Keterangan,NoBatch,CostCenter,EnqId,POId,POGroupId)
	select @GL_Biaya, @GL_RAK,@CCYDebet,@CCYKredit, (@pBudgetReward / 0.8), @KdCabang,@NamaCabang,@Keterangan,@NoBatch,@CostCenter,@EnqId,@POId,@POGroupId
end

insert into @temp(AccountDebet,AccountKredit,CCYDebet,CCYKredit,Nominal,KdCabang,NamaCabang,Keterangan,NoBatch,CostCenter,EnqId,POId,POGroupId)
select @GL_RAK, @GL_PPH,@CCYDebet,@CCYKredit, ((@pBudgetReward / 0.8) * 0.2), @KdCabang,@NamaCabang,@Keterangan,@NoBatch,@CostCenter,@EnqId,@POId,@POGroupId

insert into @temp(AccountDebet,AccountKredit,CCYDebet,CCYKredit,Nominal,KdCabang,NamaCabang,Keterangan,NoBatch,CostCenter,EnqId,POId,POGroupId)
select @GL_RAK, @GL_AccountNo,@CCYDebet,@CCYKredit, @pBudgetReward,@KdCabang,@NamaCabang,@Keterangan,@NoBatch,@CostCenter,@EnqId,@POId,@POGroupId
if (@flag = 1)
BEGIN
select * from  @temp
END

if (@flag = 2)
BEGIN
INSERT INTO [SQL_FUNDING].[dbo].[JurnalCashback](
      [EnquiryId]
      ,[POId]
      ,[POGroupId]
      ,[KodeCabang]
      ,[AccountDebet]
      ,[AccountKredit]
      ,[Nominal]
	)
	SELECT
	[EnqId],
	[POId],
	[POGroupId],
	[KdCabang],
	[AccountDebet],
    [AccountKredit],
	[Nominal]
	from @temp
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBankName]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_GetBankName]  
 -- Add the parameters for the stored procedure here  
   
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 SELECT DISTINCT  BankName FROM [SQL_CMS].dbo.CMSBank 
END  



GO
/****** Object:  StoredProcedure [dbo].[SP_GetCashbackGroup]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetCashbackGroup]
/*
 =============================================  
 Author:  eka
 Create date: 20201001
 Description: Get Cashback Group
 =============================================  
exec SP_GetCashbackGroup '0027/CSBK-FND/XI/2020','1'
*/
@POGroupId varchar(30) = null,
@POid varchar(30) = null,
@flag int

AS BEGIN
	SET NOCOUNT ON; 

	SELECT DISTINCT
		CONVERT(date, a.PODate)  as PODate, 
		a.POGroupId, 
		a.POId,
		b.NoRekening,
		b.NamaNasabah,
		CONVERT(date, b.TglBukaRekening)  as TglBukaRekening,
		c.Keterangan,
		c.Penalty,
		CASE WHEN a.CCYDebet = 0 THEN 'IDR' 
		WHEN a.CCYDebet = 1 THEN 'USD' 
		ELSE 'SGD' 
		END AS CCYDebet,
		CASE WHEN a.CCYKredit = 0 THEN 'IDR' 
		WHEN a.CCYKredit = 1 THEN 'USD' 
		ELSE 'SGD' 
		END AS CCYKredit,
		b.RewardBudget
		into #temp1
		FROM 
		PurchaseOrder a
		left join EnquiryTabunganInput b on a.EnquiryId = b.Id
		left join DetailBarang c on b.Id = c.EnquiryId
	WHERE 
		a.StatusData IN (1,5)	
		and a.POGroupId = @POGroupId
		and a.POGroupId like '%CSBK%'
END

if (@flag = 1)
BEGIN
select * from #temp1
END

if (@flag = 2)
BEGIN
update PurchaseOrder
set StatusData = 5
where POGroupId = @POGroupId
END

if (@flag = 3)
BEGIN
delete from PurchaseOrder 
where POGroupId = @POGroupId
END

if (@flag = 4)
BEGIN
DELETE FROM PurchaseOrder WHERE POId = @POId
DELETE FROM JurnalCashback WHERE POId = @POId
END

drop table #temp1
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCompany]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_GetCompany]  
 -- Add the parameters for the stored procedure here  
   
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 select Id = [@ID], company_code, company_name, name_address
		,mnemonic, customer_company, customer_mnemonic, company_group
		,curr_no, date_time, co_code, batch_date
  FROM [SQL_TEMENOS].[dbo].[COMPANY]  
END  


GO
/****** Object:  StoredProcedure [dbo].[sp_GetInternalAccount_JurnalPelunasan_Debit]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yadit
-- Create date: 22 Maret 2018
-- Description:	<Get Internal Account Payment Request Kredit,,>
-- sp_helper '01',NULL
-- sp_helper '01','IDR1501100010150'
-- =============================================

CREATE PROCEDURE [dbo].[sp_GetInternalAccount_JurnalPelunasan_Debit]

	@BranchId VARCHAR(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
		SELECT	AC.[account_no] AS [NomorIA]
				,AC.[currency] AS [MataUang]
				--,AC.[co_code] AS [Cabang]
				,C.[company_name] AS [NamaCabang]
				,AC.[account_title_1] AS [Deskripsi]
				
			FROM [SQL_TEMENOS].[dbo].[ACCOUNT] AC WITH(NOLOCK)						
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] C WITH(NOLOCK) ON AC.[co_code] = C.[@ID]
			
			WHERE category IN ('12123','15051','15049') 
				AND AC.co_code = @BranchId
										
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetInternalAccount_JurnalPencadangan_Debit]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yadit
-- Create date: 25 April 2018
-- Description:	<Get Internal Account Payment Request Pencadangan Debit,,>
-- sp_helper '01',NULL
-- sp_helper '01','IDR1501100010150'
-- =============================================

CREATE PROCEDURE [dbo].[sp_GetInternalAccount_JurnalPencadangan_Debit]

	@BranchId VARCHAR(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
		SELECT	AC.[account_no] AS [NomorIA]
				,AC.[currency] AS [MataUang]
				--,AC.[co_code] AS [Cabang]
				,C.[company_name] AS [NamaCabang]
				,AC.[account_title_1] AS [Deskripsi]
				
			FROM [SQL_TEMENOS].[dbo].[ACCOUNT] AC WITH(NOLOCK)						
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] C WITH(NOLOCK) ON AC.[co_code] = C.[@ID]
			
			WHERE category IN ('12123','15051') 
				AND AC.co_code = @BranchId
										
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetInternalAccount_JurnalPencadangan_Kredit]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yadit
-- Create date: 25 April 2018
-- Description:	<Get Internal Account Payment Request Pencadangan Kredit,,>
-- sp_helper '01',NULL
-- sp_helper '01','IDR1501100010150'
-- =============================================

CREATE PROCEDURE [dbo].[sp_GetInternalAccount_JurnalPencadangan_Kredit]

	@BranchId VARCHAR(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
		SELECT	AC.[account_no] AS [NomorIA]
				,AC.[currency] AS [MataUang]
				--,AC.[co_code] AS [Cabang]
				,C.[company_name] AS [NamaCabang]
				,AC.[account_title_1] AS [Deskripsi]
				
			FROM [SQL_TEMENOS].[dbo].[ACCOUNT] AC WITH(NOLOCK)						
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] C WITH(NOLOCK) ON AC.[co_code] = C.[@ID]
			
			WHERE category IN ('15049','15051','17217') 
				AND AC.co_code = @BranchId
										
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetInternalAccount_PaymentRequest_Debit]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yadit
-- Create date: 22 Maret 2018
-- Description:	<Get Internal Account Payment Request Debit,,>
-- sp_helper '01',NULL
-- sp_helper '01','IDR1501100010150'
-- =============================================

CREATE PROCEDURE [dbo].[sp_GetInternalAccount_PaymentRequest_Debit]

	@BranchId VARCHAR(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
		SELECT	AC.[account_no] AS [NomorIA]
				,AC.[currency] AS [MataUang]
				--,AC.[co_code] AS [Cabang]
				,C.[company_name] AS [NamaCabang]
				,AC.[account_title_1] AS [Deskripsi]
				
			FROM [SQL_TEMENOS].[dbo].[ACCOUNT] AC WITH(NOLOCK)						
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] C WITH(NOLOCK) ON AC.[co_code] = C.[@ID]
			
			WHERE category = '12146'
				AND AC.co_code = @BranchId
										
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetInternalAccount_PaymentRequest_Kredit]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Yadit
-- Create date: 22 Maret 2018
-- Description:	<Get Internal Account Payment Request Kredit,,>
-- sp_helper '01',NULL
-- sp_helper '01','IDR1501100010150'
-- =============================================

CREATE PROCEDURE [dbo].[sp_GetInternalAccount_PaymentRequest_Kredit]

	@BranchId VARCHAR(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
		SELECT	AC.[account_no] AS [NomorIA]
				,AC.[currency] AS [MataUang]
				--,AC.[co_code] AS [Cabang]
				,C.[company_name] AS [NamaCabang]
				,AC.[account_title_1] AS [Deskripsi]
				
			FROM [SQL_TEMENOS].[dbo].[ACCOUNT] AC WITH(NOLOCK)						
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] C WITH(NOLOCK) ON AC.[co_code] = C.[@ID]
			
			WHERE --category = '12146'
				--AND 
				AC.co_code = @BranchId
										
END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetJurnalOtomatis]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Yadit>        
-- Create date: <15 May - 2018>        
-- Description: <SP_GetJurnalOtomatis>        
-- =============================================  
--EXEC SP_GetJurnalOtomatis 'Pelunasan','0007/PO-GFA/III/2019','null'      
CREATE PROCEDURE [dbo].[SP_GetJurnalOtomatis]        
 -- Add the parameters for the stored procedure here        
 @Transaksi VARCHAR(200),       
 --@DebetKredit INT,
 @PONo VARCHAR(50),
 @Narrative VARCHAR(200)
         
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
  DECLARE @InternalAccountName VARCHAR(200),
		@InternalAccount VARCHAR(200),
		@Query VARCHAR(200),
		@UangMuka VARCHAR(200),
		@FPBeforeReceive VARCHAR(200),
		@FPAfterReceive VARCHAR(200),
		@NamaBank  VARCHAR(500),
		@JurnalType VARCHAR(50),
		@PaymentMethod INT,
		@DebetKredit INT,
		@BranchId VARCHAR(100),
		@BranchName VARCHAR(200),
		@BranchIdOld VARCHAR(100),
		@BranchNameOld VARCHAR(200),
		@IdPO INT,
		@SisaAmortisasi VARCHAR(200),
		@Penalty VARCHAR(200),
		@AmorBerjalan VARCHAR(200)
		
		
SELECT @NamaBank = NamaBank,
	   @PaymentMethod = PaymentMethod,
	   @BranchIdOld = eti.Cabang,
	   @BranchNameOld = com.company_name,
	   @IdPO = PO.id
 FROM PurchaseOrder PO
 INNER JOIN EnquiryTabunganInput eti
	ON eti.Id = PO.EnquiryId
 LEFT JOIN [SQL_TEMENOS].dbo.COMPANY com 
	ON com.[@Id] COLLATE DATABASE_DEFAULT = eti.Cabang COLLATE DATABASE_DEFAULT
 WHERE POId = @PONo	 

IF (@NamaBank LIKE '%Bank Mayora%')
	BEGIN
		SET @JurnalType = 'PB'
	END
ELSE
	BEGIN
		SET @JurnalType = 'SKN'
	END	
	
IF (@Transaksi = 'Pencadangan' OR @Transaksi = 'Amortisasi' OR @Transaksi = 'BreakAmortisasiSiPucuk' OR @Transaksi = 'BreakAmortisasiBerhadiah')
	BEGIN
		SET @JurnalType = 'PB'		
	END	
PRINT(@JurnalType)
PRINT(@PaymentMethod)

IF (@Transaksi = 'Pelunasan' AND @PaymentMethod = 2)
	BEGIN
		/*Pencadangan*/
		IF EXISTS(SELECT PurchaseOrderId FROM PaymentRequest WHERE PurchaseOrderId = @IdPO AND PaymentRequestType = 1)
			BEGIN
				SET @Transaksi = 'Penyelesaian'
			END 		
	END	
	
IF (@Transaksi = 'BreakAmortisasiSiPucuk' OR @Transaksi = 'BreakAmortisasiBerhadiah')
	BEGIN
		SET @AmorBerjalan = ISNULL(ROUND((SELECT SUM(ka.AmortizeAmount) FROM AmortisasiRequest ar
								INNER JOIN KartuAmortisasi ka ON ka.AmortisasiRequestId = ar.Id
								WHERE ar.POId = @IdPO
									AND ar.IsDelete = 0
									AND ka.IsProceed = 1),0),0)
	
		SET @SisaAmortisasi = ROUND(Convert(DECIMAL(18,2),(SELECT TotalPurchase / 0.8 FROM PurchaseOrder WHERE ID = @IdPO)),0) - ROUND(Convert(DECIMAL(18,2),@AmorBerjalan),0)
								--ISNULL((SELECT SUM(ka.AmortizeAmount) FROM AmortisasiRequest ar
								--INNER JOIN KartuAmortisasi ka ON ka.AmortisasiRequestId = ar.Id
								--WHERE ar.POId = @IdPO
								--	AND ar.IsDelete = 0
								--	AND ka.IsProceed = 0),0)
		SET @Penalty = ISNULL(ROUND((SELECT k.Penalty FROM PurchaseOrder po 
						INNER JOIN DetailBarang db ON db.Id = po.DetailBarangId
						INNER JOIN Katalog k ON k.Kode_Promo = db.PromotionCode
						WHERE POId = @PONo),0),0)							
						
																	
		PRINT(@Penalty)																													
	END
	
	
PRINT(@Transaksi)	
/* 
	0 = UMBeforeReceive
    1 = FPBeforeReceive
    2 = FPAfterReceive 
*/	

IF OBJECT_ID('tempdb..#tempJurnalOtomatis') IS NOT NULL DROP TABLE #tempJurnalOtomatis

CREATE TABLE #tempJurnalOtomatis
(
	DebetKredit INT,
	InternalAccountName VARCHAR(200),
	InternalAccount VARCHAR(200),
	Query VARCHAR(200),
	UangMuka VARCHAR(200)
)

IF OBJECT_ID('tempdb..#tempResultz') IS NOT NULL DROP TABLE #tempResultz

CREATE TABLE #tempResultz
(
	ValueDate DATETIME,
	BranchId VARCHAR(100),
	BranchName VARCHAR(200),
	DebetKredit INT,
	InternalAccountName VARCHAR(200),
	InternalAccount VARCHAR(200),
	Narrative VARCHAR(200),
	Amount decimal(18,2),
	UangMuka VARCHAR(200)
)

INSERT INTO #tempJurnalOtomatis	                
SELECT DebetKredit,
	   InternalAccountName,
	   InternalAccount,
	   CASE WHEN @PaymentMethod = 0 THEN UangMuka
					 WHEN @PaymentMethod = 1 THEN FPBeforeReceive
					 WHEN @PaymentMethod = 2 THEN FPAfterReceive END,
	   UangMuka
FROM MasterJurnalOtomatis mjo
WHERE Transaksi = @Transaksi
	AND JurnalType = @JurnalType
	--AND DebetKredit = 0
	
DECLARE db_cursor CURSOR FOR
	SELECT DebetKredit,InternalAccountName,InternalAccount,Query,UangMuka FROM #tempJurnalOtomatis
OPEN db_cursor  
	FETCH NEXT FROM db_cursor INTO @DebetKredit,@InternalAccountName,@InternalAccount,@Query,@UangMuka 

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		--PRINT('yay')
		
		SET @BranchId = @BranchIdOld
		SET @BranchName = @BranchNameOld
		
		SET @InternalAccount = REPLACE(@InternalAccount,'BRANCH',RIGHT(@BranchIdOld,4))
		
		IF (@Transaksi = 'BreakAmortisasiSiPucuk' OR @Transaksi = 'BreakAmortisasiBerhadiah')
			BEGIN		
				SET @InternalAccountName = ISNULL((SELECT account_title_1 FROM [SQL_TEMENOS].dbo.ACCOUNT																
											WHERE [@ID] = @InternalAccount),@InternalAccountName)
			END
		
		IF (@InternalAccount LIKE '%|%')
			BEGIN
				EXEC SP_QueryJurnalOtomatis @PONo, @InternalAccount, @InternalAccount OUTPUT
				
				SELECT @InternalAccountName = ISNULL(account_title_1,''),
					  @BranchId = 'ID0010001',--ISNULL(acc.co_code,''),
					  @BranchName = ISNULL(com.company_name,'')
				 FROM [SQL_TEMENOS].dbo.ACCOUNT	 acc 
				 LEFT JOIN [SQL_TEMENOS].dbo.COMPANY com
					ON com.[@ID] COLLATE DATABASE_DEFAULT = 'ID0010001'														
				WHERE acc.[@ID] = @InternalAccount
																						
			END
		
		PRINT(@InternalAccount)
		
		PRINT(@Query)
		
		PRINT(@UangMuka)
		
		IF (@Query LIKE '%|%')
			BEGIN
				EXEC SP_QueryJurnalOtomatis @PONo, @Query, @Query OUTPUT
			END	
			
		--PRINT(@Query)	
		IF (@Transaksi = 'Pelunasan' AND @PaymentMethod = 1)
			BEGIN
			--20200827, Eka, BEGIN
				SET @Transaksi = 
				--'Pembebanan'
				ISNULL((SELECT e.NoRekening FROM PurchaseOrder po 
						INNER JOIN EnquiryTabunganInput e ON e.Id = po.enquiryId
						WHERE POId = @PONo),0)
			END

			BEGIN
				SET @Narrative = 
				--'FPAfterReceive'
				ISNULL((SELECT e.NamaNasabah FROM PurchaseOrder po 
						INNER JOIN EnquiryTabunganInput e ON e.Id = po.enquiryId
						WHERE POId = @PONo),0)
			END	
			
		IF (@Transaksi = 'Pelunasan' AND @PaymentMethod = 2)
			BEGIN
				SET @Transaksi = 
				--'FPAfterReceive'
				ISNULL((SELECT e.NoRekening FROM PurchaseOrder po 
						INNER JOIN EnquiryTabunganInput e ON e.Id = po.enquiryId
						WHERE POId = @PONo),0)
			END
			
			BEGIN
				SET @Narrative = 
				--'FPAfterReceive'
				ISNULL((SELECT e.NamaNasabah FROM PurchaseOrder po 
						INNER JOIN EnquiryTabunganInput e ON e.Id = po.enquiryId
						WHERE POId = @PONo),0)
			END	
			--20200827, Eka, END

		/*SECTION BREAK AMORTISASI*/
		IF (@Transaksi = 'BreakAmortisasiSiPucuk' OR @Transaksi = 'BreakAmortisasiBerhadiah')
			BEGIN
				IF (@UangMuka = 0)
					BEGIN
						SET @Query = @SisaAmortisasi
					END
				ELSE IF (@UangMuka = 1)
					BEGIN
						SET @Query = ROUND(CONVERT(DECIMAL(18,2),@Penalty),0) - ROUND(CONVERT(DECIMAL(18,2),@SisaAmortisasi),0)
					END
				ELSE IF (@UangMuka = 2)
					BEGIN
						SET @Query = @AmorBerjalan
					END	
			END						
																
			 
		
		/*END SECTION BREAK AMORTISASI*/
		
		/*BRANCH ID & NAME*/
		IF (@InternalAccount LIKE 'IDR%')
			BEGIN
				SET @BranchId = 'ID001' + RIGHT(@InternalAccount,4)
				SET @BranchName = (SELECT company_name FROM [SQL_TEMENOS].dbo.COMPANY 
									WHERE [@Id] = @BranchId)
			END		
						
		IF (@Transaksi <> 'Amortisasi' AND @Transaksi <> 'BreakAmortisasiSiPucuk' 
			AND @Transaksi <> 'BreakAmortisasiBerhadiah' )
			BEGIN
				INSERT INTO #tempResultz
				SELECT GETDATE() AS ValueDate,
			   @BranchId AS BranchId,			   
			   @BranchName AS BranchName,
			   @DebetKredit AS DebetKredit,
			   @InternalAccountName AS InternalAccountName,
			   @InternalAccount AS InternalAccount,
			   @Transaksi + ' ' + @Narrative AS Narrative,
			   ROUND(CONVERT(DECIMAL(18,2),@Query),0) AS Amount,
			   @UangMuka
			END	
		ELSE
			BEGIN							
				INSERT INTO #tempResultz
				SELECT GETDATE() AS ValueDate,
			   @BranchId AS BranchId,
			   @BranchName AS BranchName,
			   @DebetKredit AS DebetKredit,
			   @InternalAccountName AS InternalAccountName,
			   @InternalAccount AS InternalAccount,
			   @Transaksi + ' ' + @Narrative AS Narrative,
			   CASE WHEN @Transaksi = 'Amortisasi' THEN 0 ELSE ROUND(CONVERT(DECIMAL(18,2),@Query),0) END AS Amount,
			   @UangMuka
			END
			
								   	
		FETCH NEXT FROM db_cursor INTO @DebetKredit,@InternalAccountName,@InternalAccount,@Query,@UangMuka
	END
	
	CLOSE db_cursor  
	DEALLOCATE db_cursor
IF (@Transaksi = 'Amortisasi' OR @Transaksi = 'BreakAmortisasiSiPucuk' 
			OR @Transaksi = 'BreakAmortisasiBerhadiah' )
	BEGIN
		SELECT ValueDate AS Value_Date,
				BranchId,
				BranchName,
			   DebetKredit AS DebitKredit,
			   InternalAccountName AS IntAccCategoryName,
			   InternalAccount AS IntAccCategoryId,
			   Narrative AS Narative,
			   'IDR' AS Currency,
			   Amount,
			   UangMuka
		 FROM #tempResultz
	END
ELSE
	BEGIN
		SELECT * FROM #tempResultz
		WHERE Amount IS NOT NULL
	END
		
DROP TABLE #tempJurnalOtomatis
DROP TABLE #tempResultz
	              
END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetKodeProduk]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_GetKodeProduk]  
 -- Add the parameters for the stored procedure here  
   
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 select * FROM [SQL_TEMENOS].[dbo].[MST_KODE_PRODUK]  
 order by ID
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_GetKodeProduk2]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_GetKodeProduk2]  
 -- Add the parameters for the stored procedure here  
   
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 select Id, Kode_Promo FROM [SQL_FUNDING].[dbo].[Katalog]  

 order by ID
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_GETLISTEMAIL_BY_ROLE]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GETLISTEMAIL_BY_ROLE]
	@ROLEID NVARCHAR(50) = null,
	@rolename nvarchar(50) = null
AS
BEGIN

SELECT EmailInternal FROM SQL_USER.dbo.RoleMaster R
LEFT JOIN SQL_USER.dbo.UserRoles ur ON ur.RoleId = R.Id
LEFT JOIN SQL_USER.dbo.UserMaster UM ON UM.Id = UR.UserId
LEFT JOIN SQL_MyPeople.dbo.MasterEmployee E ON E.NIK = UM.NIK
WHERE (@ROLEID = R.Id or @ROLEID is null)
and (@rolename = r.Name or @rolename is null)
and EmailInternal is not null
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMenuStatusNasabah]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		Calvin
-- Create date: 02112018
-- Description:	<Get Menu Status Nasabah>
-- exec [dbo].[SP_GetMenuStatusNasabah]
-- =============================================

CREATE PROCEDURE [dbo].[SP_GetMenuStatusNasabah]
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190117, jeni, penambahan parametr permintaan lele
	20200708, eka, penambahan field & status
*/
--20190117, jeni, BEGIN
	@pNoRekening	nvarchar(100)=NULL
	,@pNoCif		nvarchar(100)=NULL
	,@pCabang		varchar(20)=null
--20190117, jeni, END
AS
BEGIN
	SET NOCOUNT ON;
	
	create table #test1234
	(
	POID varchar(100),
	DOID varchar(100),
	DODATE date
	)
	insert into #test1234
	select distinct b.PurchaseOrderId, MAX(DeliveryOrderId) as DOID, DeliveryOrderDate from SQL_FUNDING.dbo.PurchaseOrder a
	INNER JOIN 
	(
				SELECT PurchaseOrderId, MAX(DeliveryOrderDate) MaxDate
				FROM    sql_funding.dbo.DeliveryOrder
				GROUP BY PurchaseOrderId
			) MaxD ON a.Id = MaxD.PurchaseOrderId INNER JOIN
	sql_funding.dbo.DeliveryOrder b on MaxD.PurchaseOrderId = b.PurchaseOrderId
	and maxd.MaxDate = b.DeliveryOrderDate
	where a.IsDelete = 0 and b.IsDelete = 0
	group by b.PurchaseOrderId, DeliveryOrderDate

	SELECT  
	  [NoRekening] = ISNULL(enq.NoRekening,'')  
	  ,[NoCif] = enq.NoCif
	  ,[NamaNasabah] = cust.[name_1]  
	  ,[CategoryCode] = ISNULL(enq.JenisTabungan,0)  
	  --,[JenisTabungan] = CASE WHEN a.category = '6501' THEN 0  
	  --       WHEN a.category = '6502' THEN 1  
	  --       WHEN a.category = '6008' THEN 2  
	  --     END  
	  ,[KodePromosi] = ISNULL(enq.KodePromosi,'')  
	  ,[JenisTabungan] = ISNULL(CAST(enq.JenisTabungan AS INT)  ,'')
	  ,[Cabang] = enq.Cabang
	  ,[NamaCabang] = d.[company_name]  
	  ,[TglBukaRekening] = enq.TglBukaRekening
	  ,[StartDate] = enq.TglBukaRekening
	  ,[MaturityDate] = enq.MaturityDate
	--  ,'' as StatusReward
		 --TAMBAH KONDISI KALAU BELUM DIAPPROVE DI FLOW YANG MANA, ID NYA KOSONG ( - ) .BELUMDIKERJAKAN
	  --20200708, eka, BEGIN
	  ,enq.DraftPRId as DraftPurchaseId
	  ,enq.ApproveDate
	  ,CASE WHEN enq.StatusData = 0 THEN 'None' 
	  WHEN enq.StatusData = 1 THEN 'New' 
	  WHEN enq.StatusData = 2 THEN 'Edited' 
	  WHEN enq.StatusData = 3 THEN 'Deleted' 
	  WHEN enq.StatusData = 4 THEN 'Canceled' 
	  WHEN enq.StatusData = 5 THEN 'Approved' 
	  WHEN enq.StatusData = 6 THEN 'Rejected' 
	  WHEN enq.StatusData = 7 THEN 'BackDate' 
	  ELSE 'None' END AS DPRStatus
	  ,enq.PRId as PurchaseRequestId
	  ,CASE WHEN enq.StatusData2 = 0 THEN 'None' 
	  WHEN enq.StatusData2 = 1 THEN 'New' 
	  WHEN enq.StatusData2 = 2 THEN 'Edited' 
	  WHEN enq.StatusData2 = 3 THEN 'Deleted' 
	  WHEN enq.StatusData2 = 4 THEN 'Canceled' 
	  WHEN enq.StatusData2 = 5 THEN 'Approved' 
	  WHEN enq.StatusData2 = 6 THEN 'Rejected'
	  WHEN enq.StatusData2 = 7 THEN 'BackDate' 
	  ELSE 'None' END AS PRStatus
	  ,po.POId as PurchaseOrderId
	  ,Case When po.StatusData = 0 THEN 'None' 
	  WHEN po.StatusData = 1 THEN 'New' 
	  WHEN po.StatusData = 2 THEN 'Edited' 
	  WHEN po.StatusData = 3 THEN 'Deleted' 
	  WHEN po.StatusData = 4 THEN 'Canceled' 
	  WHEN po.StatusData = 5 THEN 'Approved' 
	  WHEN po.StatusData = 6 THEN 'Rejected' 
	  WHEN  po.StatusData = 7 THEN 'BackDate' 
	  ELSE 'None' END AS POStatus
	  ,CASE WHEN enq.PenyimpanganProgram = 0 THEN 'Tidak' 
	  WHEN enq.PenyimpanganProgram = 1 THEN 'Ya' 
	  ELSE 'None' END AS StatusPenyimpangan
	  ,um.UserRealName AS ApproverDPR
	  ,ar.RequestId as AmortisasiRequestId
	  ,prq.PaymentRequestId
	  ,pr.PurchaseReceiveId
	  ,pr.PelunasanId
	  ,temp.DOID as DeliveryOrderId
	 FROM SQL_FUNDING.dbo.EnquiryTabunganInput enq
	 LEFT JOIN (SELECT * FROM [SQL_FUNDING].[dbo].[Katalog] WITH(NOLOCK))  katalog  ON katalog.[Kode_Promo] = enq.KodePromosi
	 LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] d WITH(NOLOCK) ON d.[@ID] COLLATE Latin1_General_CI_AS = enq.cabang COLLATE Latin1_General_CI_AS
	 left join [SQL_TEMENOS].[dbo].[CUSTOMER] cust on enq.NoCif COLLATE Latin1_General_CI_AS = cust.customer_no COLLATE Latin1_General_CI_AS
	 left join SQL_FUNDING.dbo.PurchaseOrder po on po.EnquiryId = enq.Id
	 left join SQL_FUNDING.dbo.AmortisasiRequest ar on ar.POId = po.Id
	 left join SQL_FUNDING.dbo.PaymentRequest prq on prq.PurchaseOrderId = po.Id
	 left join sql_funding.dbo.PurchaseReceive pr on po.Id = pr.PurchaseOrderId
	 left join #test1234 temp on temp.POID = po.Id
	 left join sql_user.dbo.usermaster um on enq.ApproveBy = um.Id
	 --20200708, eka, END
	 WHERE enq.JenisTabungan IN ('6501','6502','6008')  
	   AND enq.IsDelete = 0 
	   and enq.RejectBy is null
--20190117, jeni, BEGIN
		and (enq.NoRekening = ISNULL(@pNoRekening,'') OR ISNULL(@pNoRekening,'') = '')
		and (enq.NoCif = ISNULL(@pNoCif,'') OR ISNULL(@pNoCif,'') = '')
		and (Cabang = @pCabang OR isnull(@pCabang,'') = '')
--20190117, jeni, END
	 ORDER BY enq.StartDate DESC
	 
	 drop table #test1234
	 
	 --customer no = 30077126, 30055135 double karena data di dev  
	 --select * from SQL_FUNDING.dbo.PurchaseOrder
	 --where EnquiryId in ('9','10')
										
END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetPOGroup]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetPOGroup]
/*
 =============================================  
 Author:  jeni
 Create date: 20190130
 Description: Get PO Group
 =============================================  
exec SP_GetPOGroup 'XXX', null
*/
@SupplierId varchar(50) = null,
@PaymentMethod int = null
AS BEGIN
	SET NOCOUNT ON;
if @SupplierId = 'XXX'
begin
	SELECT DISTINCT 
		a.POGroupId, 
		a.POId,
		a.CCYKredit,
		a.CCYDebet,
		a.CatatanPO,
		db.PromotionCode,
		db.Keterangan, 
		--a.NamaBank,
		--a.NomorRekeningVendor,
		CONVERT(date, a.PODate)  as PODate 
	FROM 
		PurchaseOrder a
		left join EnquiryTabunganInput e on a.EnquiryId = e.Id
		left join DetailBarang db on db.enquiryid = e.Id
	WHERE 
		--StatusData=5
		--and 
		a.POGroupId = a.POId
		and a.POGroupId not like '%PO%'
		and a.StatusData = 1
end
else
begin
	SELECT DISTINCT 
		a.POGroupId, 
		a.POId,
		a.PaymentType,
		--a.CCYDebet,
		--a.CCYKredit,
		a.CatatanPO, 
		a.NamaBank,
		a.NomorRekeningVendor,
		CONVERT(date, a.PODate)  as PODate 
	FROM 
		PurchaseOrder a
	WHERE 
		StatusData=1
		AND SupplierId = @SupplierId
		AND PaymentMethod = @PaymentMethod
end

END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetUploadNasabah]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Calvin
-- Create date: 07 November 2018
-- Description:	<SP_GetUploadNasabah>
-- =============================================

CREATE PROCEDURE [dbo].[SP_GetUploadNasabah]

	@NoRek varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
		SELECT	*
			FROM SQL_FUNDING.dbo.UploadNasabah
			where NoRekening = @NoRek
										
END

GO
/****** Object:  StoredProcedure [dbo].[sp_helper]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ade Arman
-- Create date: 17 Oktober 2017
-- Description:	<Description,,>
-- sp_helper '01',NULL
-- sp_helper '01','IDR1501100010150'
-- =============================================

CREATE PROCEDURE [dbo].[sp_helper]

	@flag CHAR(2)
	,@code VARCHAR(250)
	
AS
BEGIN
	SET NOCOUNT ON;

	IF @flag = '01' --GET INTERNAL ACCOUNT
	BEGIN
	
		SELECT	AC.[account_no] AS [NomorIA]
				,AC.[currency] AS [MataUang]
				--,AC.[co_code] AS [Cabang]
				,C.[company_name] AS [NamaCabang]
				,AC.[account_title_1] AS [Deskripsi]
				
			FROM [SQL_TEMENOS].[dbo].[ACCOUNT] AC WITH(NOLOCK)
			
			LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] C WITH(NOLOCK) ON AC.[co_code] = C.[@ID]
			
			WHERE	--(AC.[account_no] LIKE 'IDR%'
					--	AND (AC.[account_title_1] LIKE '%BDD%Promosi%'
					--		OR AC.[account_title_1] like '%Kewajiban%Pajak%' OR AC.[account_title_1] like '%Hutang%Supplier%')
					@code IS NULL AND (AC.[account_no] LIKE 'IDR%'
						AND (AC.[account_title_1] LIKE '%BDD%Promosi%'
							OR AC.[account_title_1] like '%Kewajiban%Pajak%'
							OR AC.[account_title_1] like '%Hutang%Supplier%'))
						OR	((AC.[account_no] LIKE '%'+@code+'%' AND (AC.[account_no] LIKE 'IDR%'
							AND (AC.[account_title_1] LIKE '%BDD%Promosi%'
								OR AC.[account_title_1] like '%Kewajiban%Pajak%'
								OR AC.[account_title_1] like '%Hutang%Supplier%')))
							OR (C.[company_name] LIKE '%'+@code+'%' AND (AC.[account_no] LIKE 'IDR%'
								AND (AC.[account_title_1] LIKE '%BDD%Promosi%'
									OR AC.[account_title_1] like '%Kewajiban%Pajak%'
									OR AC.[account_title_1] like '%Hutang%Supplier%')))
							OR (AC.[account_title_1] LIKE '%'+@code+'%' AND (AC.[account_no] LIKE 'IDR%'
								AND (AC.[account_title_1] LIKE '%BDD%Promosi%'
									OR AC.[account_title_1] like '%Kewajiban%Pajak%'
									OR AC.[account_title_1] like '%Hutang%Supplier%'))))
	END
	
	
	--ELSE IF @flag = '02'
	--BEGIN
		
	
	--END
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HistoryCashback]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Eka>        
-- Create date: <02 Feb - 2018>        
-- Description: <Select History purchase order>
-- EXEC [SP_HistoryCashback] null,null,'6008','','',''        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_HistoryCashback]
 -- Add the parameters for the stored procedure here
 -- 20200910, Eka, Nambahin Filter Cabang       
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
*/
 --@tanggal datetime,        
 @tanggalmulai datetime,
 @tanggalakhir datetime = null,
 @jenis int,        
 @cabang varchar(50),        
 @no varchar(50),
 @print int = null         
AS        
BEGIN              
 SET NOCOUNT ON;        
 
 SELECT ROW_NUMBER() OVER(PARTITION BY POGroupId 
 ORDER BY POGroupId DESC) AS jmlh,* 
 INTO #Temp1 
 FROM PurchaseOrder

 SELECT POGroupId, count(POGroupId) as totalpo
 INTO #temp2
 FROM PurchaseOrder 
 GROUP BY POGroupId

if isnull(@print,0) = 0
 begin
	SELECT a.Id,
	a.EnquiryId,
	a.DetailBarangId,        
    a.POId,        
    a.PODate,  
    a.POGroupId,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
       END,
	   --eka,begin
	te2.totalpo,
	a.CatatanPO,         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang,  
    b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
	b.Cabang,
    me.Nama    
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan              
    , a.NamaBank
    , a.NomorRekeningVendor   
    , a.AdditionalInfoDetailItem   
    , b.AttachmentSPNasabah
    , b.AttachmentMemoDireksi
    --, TelpPIC = isup.Telp_PIC
                
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)
   JOIN #Temp1 te on te.Id = a.Id
   JOIN #temp2 te2 on te2.POGroupId = a.POGroupId        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang    COLLATE DATABASE_DEFAULT
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
      WHERE 
--20200805, eka. begin		   
		   --(CAST(a.PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)        
		   a.PODate between @tanggalmulai and @tanggalakhir OR @tanggalmulai IS NULL and @tanggalakhir IS NULL

	     AND b.JenisTabungan = @jenis         
		   --AND (b.Cabang = @cabang OR @cabang = '' or b.Cabang in(select KodeCabang from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabang))    
		   AND (@no = '' OR a.POId = @no)
		   AND te.jmlh = 1  
		   AND a.IsDelete = 0
		   AND (b.Cabang = @cabang OR @cabang = '')
		   AND a.StatusData = 5
		   AND a.ApproveDate is not null
		   AND a.POGroupId like '%CSBK%'
--20200805, eka. end
   ORDER BY a.POGroupId, a.POId
 end
 else
 begin
	SELECT a.Id,
	a.EnquiryId,
	a.DetailBarangId,        
    a.POId,        
    a.PODate,  
    a.POGroupId,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
       END,         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang,  
    b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
    me.Nama    
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan              
    , a.NamaBank
    , a.NomorRekeningVendor   
    , a.AdditionalInfoDetailItem   
    , b.AttachmentSPNasabah
    , b.AttachmentMemoDireksi
    --, TelpPIC = isup.Telp_PIC
                
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)
   JOIN #Temp1 te on te.Id = a.Id        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang    COLLATE DATABASE_DEFAULT
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
      WHERE 
--20200805, eka. begin		   
		   --(CAST(a.PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)        
		   a.PODate between @tanggalmulai and @tanggalakhir OR @tanggalmulai IS NULL and @tanggalakhir IS NULL
--20200805, eka. end
		   AND b.JenisTabungan = @jenis         
		   --AND (b.Cabang = @cabang OR @cabang = '' or b.Cabang in(select KodeCabang from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabang))    
		   AND a.POGroupId LIKE '%' + @no + '%'
		   AND te.jmlh = 1
		   AND a.IsDelete = 0
		   AND a.StatusData = 5
		   AND a.ApproveDate is not null
		   AND a.POGroupId like '%CSBK%'
   ORDER BY a.POGroupId, a.POId
end
--20190719, jeni, end
         
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HistoryJurnalCashback]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_HistoryJurnalCashback]
/*
 =============================================  
 Author:  eka
 Create date: 20201001
 Description: History Jurnal Cashback
 =============================================  
exec SP_HistoryJurnalCashback '0028/CSBK-FND/X/2020'
*/
@POGroupId varchar(30) = null
AS BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT
		CONVERT(date, a.PODate)  as PODate, 
		j.POGroupId, 
		j.POId,
		b.NoRekening,
		b.NamaNasabah,
		CONVERT(date, b.TglBukaRekening)  as TglBukaRekening,
		c.Keterangan as KeteranganDb,
		c.Penalty,
		CASE WHEN a.CCYDebet = 0 THEN 'IDR' 
		WHEN a.CCYDebet = 1 THEN 'USD' 
		ELSE 'SGD' 
		END AS CCYDebet,
		CASE WHEN a.CCYKredit = 0 THEN 'IDR' 
		WHEN a.CCYKredit = 1 THEN 'USD' 
		ELSE 'SGD' 
		END AS CCYKredit,
		b.RewardBudget,
		j.AccountDebet,
		j.AccountKredit,
		j.nominal,
		j.KodeCabang,
		co.company_name as NamaCabang,
		'9602' as CostCenter,
		a.AdditionalInfoDetailItem as Keterangan,
		a.PODescription as NoBatch
		FROM 
		PurchaseOrder a
		left join JurnalCashback j on a.poid = j.POId
		left join EnquiryTabunganInput b on a.EnquiryId = b.Id
		left join sql_temenos.dbo.company co on b.Cabang = co.[@ID] COLLATE DATABASE_DEFAULT
		left join DetailBarang c on b.Id = c.EnquiryId
	WHERE 
		a.StatusData IN (1,5)	
		and a.POGroupId = @POGroupId
		and a.POGroupId like '%CSBK%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HistoryPOGetAll]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <>        
-- Create date: <02 Feb - 2018>        
-- Description: <Select all history po>
-- EXEC SP_HistoryPOGetAll null,null,'',''        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_HistoryPOGetAll]
 --@tanggal datetime,        
 @tanggalmulai datetime,
 @tanggalakhir datetime = null,        
 @cabang varchar(50),        
 @no varchar(50)         
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
	SELECT a.Id,
	a.EnquiryId,
	a.DetailBarangId,        
    a.POId,        
    a.PODate,  
    a.POGroupId,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
       END,
	   --eka,begin         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang,  
    b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
	b.Cabang,
    me.Nama    
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan              
    , a.NamaBank
    , a.NomorRekeningVendor   
    , a.AdditionalInfoDetailItem   
    , b.AttachmentSPNasabah
    , b.AttachmentMemoDireksi
	, ISNULL (q.RequestId,'') as AmorRequestId
    --, TelpPIC = isup.Telp_PIC
                
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)
   LEFT JOIN SQL_FUNDING.dbo.AmortisasiRequest q on a.id = q.POId        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang    COLLATE DATABASE_DEFAULT
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
      WHERE 
--20200805, eka. begin		           
		   a.PODate between @tanggalmulai and @tanggalakhir OR @tanggalmulai IS NULL and @tanggalakhir IS NULL             
		   AND (@no = '' OR a.POId = @no)  
		   AND a.IsDelete = 0
		   AND (b.Cabang = @cabang OR @cabang = '')
--20200805, eka. end
   ORDER BY a.POGroupId, a.POId         
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HistoryPurchaseOrder]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Yadit>        
-- Create date: <02 Feb - 2018>        
-- Description: <Select History purchase order>
-- EXEC SP_HistoryPurchaseOrder null,null,'6008','','','1'        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_HistoryPurchaseOrder]
 -- Add the parameters for the stored procedure here
 -- 20200910, Eka, Nambahin Filter Cabang       
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190203, jeni, penambahan perubahan filter dari poid ke pogroupid
	20190719, jeni, Print PO GROUP jadi ngaco harus tambah flag
*/
 --@tanggal datetime,        
 @tanggalmulai datetime,
 @tanggalakhir datetime = null,
 @jenis int,        
 @cabang varchar(50),        
 @no varchar(50),
 @print int = null         
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
 
 --20190719, jeni, begin
--  SELECT a.Id,
--	a.EnquiryId,
--	a.DetailBarangId,        
--    a.POId,        
--    a.PODate,  
--    a.POGroupId,      
--    a.CategoryId,
--    a.PolaId,
--    a.UnitId,
--    a.TypeId,
--    a.PaymentMethod,
--    a.PaymentType,
--    a.DPAmount,
--    a.Quantity,
--    a.Currency,
--    a.NominalBarang,
--    a.NominalPurchase,
--    a.TotalPurchase,
--    a.SupplierId,
--    a.NilaiBuku,
--    a.NikEmp,
--    a.DeptId,
--    a.VendorQuotationNo,
--    a.VendorQuotationDate,
--    a.VendorQuotationAmount,
--    a.VendorInvoiceNo,
--    a.VendorInvoiceDate,
--    a.VendorInvoiceAmount,
--    a.PODescription,
--    a.ApproveBy2,
--    a.ApproveDate2,
--    a.StatusData2,
--    a.CreateBy,
--    a.CreateDate,
--    a.UpdateBy,
--    a.UpdateDate,
--    a.ApproveBy,
--    a.ApproveDate,
--    a.RejectBy,
--    a.RejectDate,
--    a.RejectReason,
--    a.CompanyId,
--    a.BranchId,
--    a.StatusData,
--    a.IsDelete,
--    a.UploadPO,
--    a.Pajak,
--    b.NoCif,        
--    b.NoRekening,        
--    b.NamaNasabah,                    
--    b.JenisTabungan,
--    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
--         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
--         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
--       END,         
--    b.Cabang,    
--    com.company_name,    
--    b.TglBukaRekening,        
--    b.StartDate,         
--    b.MaturityDate,        
--    b.Requester,    
--    b.CatatanCabang,  
--    b.KodePromosi, 
--    c.KategoriBarang,         
--    c.Merek,        
--    c.TypeBarang, 
--    QuantityBarang = c.Quantity, 
--    c.Penalty,      
--    c.Warna,
--    b.PRId,
--    b.PRDate,
--    b.DraftPRId,
--    b.DraftPRDate,
--    b.RewardBudget,
--    me.Nama    
--    , SupplierName = isup.Nm_Supp
--    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
--    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan              
--    , a.NamaBank
--    , a.NomorRekeningVendor   
--    , a.AdditionalInfoDetailItem   
--    , b.AttachmentSPNasabah
--    , b.AttachmentMemoDireksi
--    --, TelpPIC = isup.Telp_PIC
                
--   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
--   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
--   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId
--   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang    
--   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
--   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
--   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
--      WHERE (CAST(a.PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)        
--		   AND b.JenisTabungan = @jenis         
--		   AND (b.Cabang = @cabang OR @cabang = '' or b.Cabang in(select KodeCabang from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabang))    
----20190206, jeni, BEGIN		   
--		   --AND (@no = '' OR a.POId = @no)  
--		   AND ((@no = '' OR a.POGroupId LIKE '%' + @no + '%')  or a.POId = @no)
----20190206, jeni, END
--		   AND a.IsDelete = 0
--   /*AND a.StatusData2 <> 3 */        
----20190206, jeni, BEGIN		   
--   --ORDER BY a.CreateDate desc      
--   ORDER BY a.POGroupId, a.POId
----20190206, jeni, END
if isnull(@print,0) = 0
 begin
	SELECT a.Id,
	a.EnquiryId,
	a.DetailBarangId,        
    a.POId,        
    a.PODate,  
    a.POGroupId,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
       END,
	   --eka,begin         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang,  
    b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
	b.Cabang,
    me.Nama    
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan              
    , a.NamaBank
    , a.NomorRekeningVendor   
    , a.AdditionalInfoDetailItem   
    , b.AttachmentSPNasabah
    , b.AttachmentMemoDireksi
    --, TelpPIC = isup.Telp_PIC
                
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang    COLLATE DATABASE_DEFAULT
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
      WHERE 
--20200805, eka. begin		   
		   --(CAST(a.PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)        
		   a.PODate between @tanggalmulai and @tanggalakhir OR @tanggalmulai IS NULL and @tanggalakhir IS NULL

	     AND b.JenisTabungan = @jenis         
		   --AND (b.Cabang = @cabang OR @cabang = '' or b.Cabang in(select KodeCabang from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabang))    
		   AND (@no = '' OR a.POId = @no)  
		   AND a.IsDelete = 0
		   AND (b.Cabang = @cabang OR @cabang = '')
		   AND a.POId not like '%CSBK%'
--20200805, eka. end
   ORDER BY a.POGroupId, a.POId
 end
 else
 begin
	SELECT a.Id,
	a.EnquiryId,
	a.DetailBarangId,        
    a.POId,        
    a.PODate,  
    a.POGroupId,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
       END,         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang,  
    b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
    me.Nama    
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3  
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan              
    , a.NamaBank
    , a.NomorRekeningVendor   
    , a.AdditionalInfoDetailItem   
    , b.AttachmentSPNasabah
    , b.AttachmentMemoDireksi
    --, TelpPIC = isup.Telp_PIC
                
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang    COLLATE DATABASE_DEFAULT
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp  
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId 
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
      WHERE 
--20200805, eka. begin		   
		   --(CAST(a.PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)        
		   a.PODate between @tanggalmulai and @tanggalakhir OR @tanggalmulai IS NULL and @tanggalakhir IS NULL
--20200805, eka. end
		   AND b.JenisTabungan = @jenis         
		   --AND (b.Cabang = @cabang OR @cabang = '' or b.Cabang in(select KodeCabang from SQL_Satellite.dbo.TabCentralisasiBO where KodeCabangWilayahKliring = @cabang))    
		   AND a.POGroupId LIKE '%' + @no + '%'
		   AND a.IsDelete = 0
		   AND a.POId not like '%CSBK%'
		   
   ORDER BY a.POGroupId, a.POId
end
--20190719, jeni, end
         
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HISTORYPURCHASERECEIVE]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Eka Muhendra>      
-- Create date: <11-08-2020>      
-- Description: <Select history purchase receive>      
-- =============================================      
CREATE PROCEDURE [dbo].[SP_HISTORYPURCHASERECEIVE]       
--exec [SP_HISTORYPURCHASERECEIVE] 'ID0010200',null,'','',null      
 -- Add the parameters for the stored procedure here      
 @cabang varchar(50),      
 @tanggal varchar(50),      
 @no varchar(50),      
 @nopo varchar(50),      
 @tanggalpo varchar(50)      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
      
 SELECT a.Id,      
     PurchaseReceiveId,      
     PurchaseReceiveDate,      
     b.POId,      
     b.PODate,      
     c.PromotionCode,      
     c.Merek,      
     c.TypeBarang,      
     c.Warna,      
     b.Quantity,      
     PelunasanId,      
     JurnalValueDate,  
     a.JurnalName,
     a.Receiver,
	 d.Id     
  FROM SQL_FUNDING.dbo.PurchaseReceive a WITH(NOLOCK)      
  LEFT JOIN SQL_FUNDING.dbo.PurchaseOrder b WITH(NOLOCK) ON a.PurchaseOrderId = b.Id      
  LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = b.DetailBarangId      
  LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput d WITH(NOLOCK) ON d.Id = b.EnquiryId      
  WHERE a.ApproveBy IS NOT NULL AND a.PelunasanId IS NOT NULL       
  AND POId LIKE '%' + @nopo + '%'       
  AND PurchaseReceiveId LIKE '%' +  @no + '%'       
  AND (CAST(PurchaseReceiveDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)       
  AND (CAST(b.PODate AS DATE) = CAST(@tanggalpo AS DATE) OR @tanggalpo IS NULL)      
  AND (cabang = @cabang OR @cabang = '')      
  ORDER BY a.CreateDate desc      
        
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_GenerateNoPurchaseOrder]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Insert_GenerateNoPurchaseOrder] 
	-- Add the parameters for the stored procedure here
	@Nomor VARCHAR(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	INSERT [SQL_funding].[dbo].GenerateNoPurchaseOrder (Nomor ,Bulan ,Tahun)
		SELECT	
				CAST(LEFT(@Nomor,4) as int),
				dbo.fnRomanToNumerals(RIGHT(LEFT(@Nomor,LEN(@Nomor) - 5), CHARINDEX('/',REVERSE(LEFT(@Nomor, LEN(@Nomor)-5))) -1)),
				RIGHT(@Nomor,4)	  
	
END



GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAUTHORIZEAMORTISASI]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ade Arman
-- Create date: 20170417
-- Description:	SP insert authorize pembayaran
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTAUTHORIZEAMORTISASI]
	@id INT	,@flag CHAR(1)	,@guid uniqueidentifier	,@user VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;

IF @flag = '1'
BEGIN
INSERT INTO [SQL_AUTHORIZE].[dbo].[AUTH_GUIDDATA](
	[application] --'MyFunding'
	,[guid] --@guid
	,[filename] --b.[RequestId]
	,[deskripsi] --'AMORTISASI'
	,[userUpload] --@user
	,[tglUpload] --GETDATE()
	,[flagCsv] --0
	,[flagRes] --0
	,[CreateDate] --GETDATE()
	,[StatusData] --1
	,[IsDelete] --0
	,[isgroup] --0
	,[flag_otor] --1
	)
	SELECT	TOP 1
			'MyFunding' --[application]
			,@guid --[guid]
			,dbo.fnGenerateFilenameReward() --[filename]
			,'AMORTISASI' --[deskripsi]
			,@user --[userUpload]
			,GETDATE() --[tglUpload]
			,0 --[flagCsv]
			,0 --[flagRes]
			,GETDATE() --[CreateDate]
			,1 --[StatusData]
			,0 --[IsDelete]
			,0 --[isgroup]
			,1 --[flag_otor]
		FROM [SQL_FUNDING].[dbo].[AmortisasiRequestDetail] a
		JOIN [SQL_FUNDING].[dbo].[AmortisasiRequest] b ON a.[AmortisasiRequestId] = b.[Id]
		WHERE a.[AmortisasiRequestId] = @Id
END

ELSE IF @flag = '2'
BEGIN
INSERT INTO [SQL_AUTHORIZE].[dbo].[AUTH_DATATRX](
	[guid] --@guid
	,[filename] --dbo.fnGenerateFilenameReward()
	,[sequence] --ROW_NUMBER() OVER(ORDER BY a.[id])
	,[rekening_debet] --CASE a.[DebitKredit] WHEN 0 THEN a.[IntAccCategoryId] ELSE NULL END
	,[currency_debet] --CASE a.[DebitKredit] WHEN 0 THEN 'IDR' ELSE NULL END
	,[Nominal] --a.[Amount]
	--,[rekening_kredit] --CASE a.[DebitKredit] WHEN 1 THEN a.[IntAccCategoryId] ELSE NULL END
	--,[currency_kredit] --CASE a.[DebitKredit] WHEN 1 THEN 'IDR' ELSE NULL END
	,[filler] --'9999'
	,[cabang] --a.[BranchId]
	,[upload_date] --GETDATE()
	,[value_date] --CONVERT(VARCHAR(8),GETDATE(),112)
	,[debit_ref] --b.[RequestId]
	--,[kredit_ref] --CASE a.[DebitKredit] WHEN 1 THEN b.[RequestId] ELSE 'TRXMYREWARD' END 
	,[deskripsi] --'AMORTISASI'
	,[cost_center] --1
	,[batch] --b.[RequestId]
	,[CreateBy] --@user
	,[CreateDate] --GETDATE()
	,[StatusData] --1
	,[IsDelete] --0
	)
	SELECT	@guid --[guid]
			,dbo.fnGenerateFilenameReward() --[filename]
			,ROW_NUMBER() OVER(ORDER BY a.[id]) --[sequence]
			,a.[IntAccCategoryId] --[rekening_debet]
			,A.[Currency]  --[currency_debet]
			,a.[Amount] --[Nominal]
			--,CASE a.[DebitKredit] WHEN 1 THEN a.[IntAccCategoryId] ELSE NULL END --[rekening_kredit]
			--,CASE a.[DebitKredit] WHEN 1 THEN 'IDR' ELSE NULL END --[currency_kredit]
			,'999999' --[filler]
			,a.[BranchId] --[cabang]
			,GETDATE() --[upload_date]
			,CONVERT(VARCHAR(8),GETDATE(),112) --[value_date]
			,a.[ref_code] --[debit_ref]
			--,CASE a.[DebitKredit] WHEN 1 THEN b.[RequestId] ELSE 'TRXMYREWARD' END --[kredit_ref]
			,'AMORTISASI' --[deskripsi]
			,'9602' --[cost_center]
			,b.[RequestId]--[batch]
			,@user --[CreateBy]
			,GETDATE() --[CreateDate]
			,1 --[StatusData]
			,0 --[IsDelete]
		FROM [SQL_FUNDING].[dbo].[AmortisasiRequestDetail] a
		JOIN [SQL_FUNDING].[dbo].[AmortisasiRequest] b ON a.[AmortisasiRequestId] = b.Id
		WHERE	a.[AmortisasiRequestId] = @Id
				AND a.[DebitKredit] = 0 --debit
				
UPDATE [SQL_AUTHORIZE].[dbo].[AUTH_DATATRX]
	SET	[rekening_kredit] = a.[IntAccCategoryId]
		,[currency_kredit] = a.[Currency]
		,[kredit_ref] = 'TRXMYFUNDING'
	FROM [SQL_FUNDING].[dbo].[AmortisasiRequestDetail] a
	JOIN [SQL_FUNDING].[dbo].[AmortisasiRequest] b ON a.[AmortisasiRequestId] = b.Id
	WHERE	[debit_ref] = a.[ref_code]
			AND a.DebitKredit = 1 --kredit
			
END

END


GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTBREAKAUTHORIZEAMORTISASI]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ade Arman
-- Create date: 20170417
-- Description:	SP insert break authorize pembayaran
-- SELECT dbo.fnGenerateFilenameReward()
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTBREAKAUTHORIZEAMORTISASI]
	@id INT	,@flag CHAR(1)	,@guid uniqueidentifier	,@user VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;

IF @flag = '1'
BEGIN
INSERT INTO [SQL_AUTHORIZE].[dbo].[AUTH_GUIDDATA](
	[application] --'MyFunding'
	,[guid] --@guid
	,[filename] --b.[RequestId]
	,[deskripsi] --'BREAK AMORTISASI'
	,[userUpload] --@user
	,[tglUpload] --GETDATE()
	,[flagCsv] --0
	,[flagRes] --0
	,[CreateDate] --GETDATE()
	,[StatusData] --1
	,[IsDelete] --0
	,[isgroup] --0
	,[flag_otor] --1
	)
	SELECT	TOP 1
			'MyFunding' --[application]
			,@guid --[guid]
			,dbo.fnGenerateFilenameReward() --[filename]
			,'BREAKAMORTISASI' --[deskripsi]
			,@user --[userUpload]
			,GETDATE() --[tglUpload]
			,0 --[flagCsv]
			,0 --[flagRes]
			,GETDATE() --[CreateDate]
			,1 --[StatusData]
			,0 --[IsDelete]
			,0 --[isgroup]
			,1 --[flag_otor]
		FROM [SQL_FUNDING].[dbo].[BreakAmortisasiRequestDetail] a
		JOIN [SQL_FUNDING].[dbo].[BreakAmortisasiRequest] b ON a.[BreakAmortisasiRequestId] = b.Id
		WHERE a.[BreakAmortisasiRequestId] = @Id
END

ELSE IF @flag = '2'
BEGIN
INSERT INTO [SQL_AUTHORIZE].[dbo].[AUTH_DATATRX](
	[guid] --@guid
	,[filename] --dbo.fnGenerateFilenameReward()
	,[sequence] --ROW_NUMBER() OVER(ORDER BY a.[id])
	,[rekening_debet] --CASE a.[DebitKredit] WHEN 0 THEN a.[IntAccCategoryId] ELSE NULL END
	,[currency_debet] --CASE a.[DebitKredit] WHEN 0 THEN 'IDR' ELSE NULL END
	,[Nominal] --a.[Amount]
	--,[rekening_kredit] --CASE a.[DebitKredit] WHEN 1 THEN a.[IntAccCategoryId] ELSE NULL END
	--,[currency_kredit] --CASE a.[DebitKredit] WHEN 1 THEN 'IDR' ELSE NULL END
	,[filler] --'9999'
	,[cabang] --a.[BranchId]
	,[upload_date] --GETDATE()
	,[value_date] --CONVERT(VARCHAR(8),GETDATE(),112)
	,[debit_ref] --b.[RequestId]
	--,[kredit_ref] --CASE a.[DebitKredit] WHEN 1 THEN b.[RequestId] ELSE 'TRXMYREWARD' END 
	,[deskripsi] --'BREAK AMORTISASI'
	,[cost_center] --1
	,[batch] --a.[ref_code]
	,[CreateBy] --@user
	,[CreateDate] --GETDATE()
	,[StatusData] --1
	,[IsDelete] --0
	)
	SELECT	@guid --[guid]
			,dbo.fnGenerateFilenameReward() --[filename]
			,ROW_NUMBER() OVER(ORDER BY a.[id]) --[sequence]
			,a.[IntAccCategoryId] --[rekening_debet]
			,a.[Currency]  --[currency_debet]
			,a.[Amount] --[Nominal]
			--,CASE a.[DebitKredit] WHEN 1 THEN a.[IntAccCategoryId] ELSE NULL END --[rekening_kredit]
			--,CASE a.[DebitKredit] WHEN 1 THEN 'IDR' ELSE NULL END --[currency_kredit]
			,'999999' --[filler]
			,a.[BranchId] --[cabang]
			,GETDATE() --[upload_date]
			,CONVERT(VARCHAR(8),GETDATE(),112) --[value_date]
			,a.[ref_code] --[debit_ref]
			--,CASE a.[DebitKredit] WHEN 1 THEN b.[RequestId] ELSE 'TRXMYREWARD' END --[kredit_ref]
			,'BREAKAMORTISASI' --[deskripsi]
			,'9602' --[cost_center]
			,b.[RequestId] --[batch]
			,@user --[CreateBy]
			,GETDATE() --[CreateDate]
			,1 --[StatusData]
			,0 --[IsDelete]
		FROM [SQL_FUNDING].[dbo].[BreakAmortisasiRequestDetail] a
		JOIN [SQL_FUNDING].[dbo].[BreakAmortisasiRequest] b ON a.[BreakAmortisasiRequestId] = b.Id
		WHERE	a.[BreakAmortisasiRequestId] = @Id
				AND a.[DebitKredit] = 0 --debit

UPDATE [SQL_AUTHORIZE].[dbo].[AUTH_DATATRX]
	SET	[rekening_kredit] = a.[IntAccCategoryId]
		,[currency_kredit] = a.[Currency]
		,[kredit_ref] = 'TRXMYFUNDING'
	FROM [SQL_FUNDING].[dbo].[BreakAmortisasiRequestDetail] a
	JOIN [SQL_FUNDING].[dbo].[BreakAmortisasiRequest] b ON a.[BreakAmortisasiRequestId] = b.Id
	WHERE	[debit_ref] = a.[ref_code]
			AND a.DebitKredit = 1 --kredit
			
END

END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTBREAKPAYMENTAMORTISASI]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Alexander Andri>    
-- Create date: <28 July 2016>    
-- Description: <SP insert payment pembayaran> 
-- [SP_INSERTBREAKPAYMENTAMORTISASI] '4'   
-- =============================================    
CREATE PROCEDURE [dbo].[SP_INSERTBREAKPAYMENTAMORTISASI]
	@id INT
AS
BEGIN

SET NOCOUNT ON;

INSERT INTO SQL_Payment.dbo.PaymentTransaction (
	TrxCode
	,Branch
	,[Sign]
	,GLNumber
	,Currency
	,Nominal
	,TglTrx
	,RefCode
	,[Description]
	,Flag_Status
	,UserID
	,Tgl_Input
	,Acct_No
	,Acct_Nm
	,BankCode
	,SendName
	,Trf_Desc
	,Flag
	,Divisi
	)    
	SELECT	[TransactionCode] = 'PB'
			,a.[BranchId]
			,[DebitKredit] = case A.[DebitKredit] when 0 then 'D' else 'K' end
			,[InternalAccount] = A.[IntAccCategoryId]
			,[Currency] = 'IDR'
			,[Amount]
			,A.[Value_date]
			,[RefCode] = b.[RequestId]
			,A.[Narative]
			,[FlagStatus] = 'S'
			,'MyReward'
			,GETDATE()
			,'','','','','','',''
		FROM [BreakAmortisasiRequestDetail] a
		JOIN [BreakAmortisasiRequest] b ON a.[BreakAmortisasiRequestId] = b.[Id]
		WHERE a.[BreakAmortisasiRequestId] = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTPAYMENTAMORTISASI]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:  <Alexander Andri>
-- Create date: <28 July 2016>
-- Description: <SP insert payment pembayaran>
-- [SP_INSERTPAYMENTAMORTISASI] '31'
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTPAYMENTAMORTISASI]  
	@id INT
AS
BEGIN
-- Select*from SQL_Payment.dbo.PaymentTransaction Order BY Tgl_Input desc
SET NOCOUNT ON;

INSERT INTO [SQL_Payment].[dbo].[PaymentTransaction] (
	[TrxCode]
	,[Branch]
	,[Sign]
	,[GLNumber]
	,[Currency]
	,[Nominal]
	,[TglTrx]
	,[RefCode]
	,[Description]
	,[Flag_Status]
	,[UserID]
	,[Tgl_Input]
	,[Acct_No]
	,[Acct_Nm]
	,[BankCode]
	,[SendName]
	,[Trf_Desc]
	,[Flag]
	,[Divisi]
	)
	SELECT	[TransactionCode] = 'PB'
			,a.[BranchId]
			,[DebitKredit] = case A.[DebitKredit] when 0 then 'D' else 'K' end
			,[InternalAccount] = A.[IntAccCategoryId]
			,[Currency] = 'IDR'
			,[Amount]
			,A.[Value_date]
			,[RefCode] = a.[ref_code]
			,A.[Narative]
			,[FlagStatus] = 'S'
			,'MyReward'
			,GETDATE()
			,'','','','','','',''
		FROM [AmortisasiRequestDetail] a
		JOIN [AmortisasiRequest] b ON a.[AmortisasiRequestId] = b.[Id]
		WHERE a.[AmortisasiRequestId] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTPAYMENTAPENCADANGAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <ACHMAD ICHWAN YASIR>    
-- Create date: <28 July 2016>    
-- Description: <SP insert payment pembayaran>    
-- =============================================    
CREATE PROCEDURE [dbo].[SP_INSERTPAYMENTAPENCADANGAN]     
 -- Add the parameters for the stored procedure here    
 @id int    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 -- Select*from SQL_Payment.dbo.PaymentTransaction Order BY Tgl_Input desc
 SET NOCOUNT ON;    
    
 INSERT INTO SQL_Payment.dbo.PaymentTransaction (TrxCode,    
             Branch,    
             [Sign],    
             GLNumber,    
             Currency,    
             Nominal,    
             TglTrx,    
             RefCode,    
             [Description],    
             Flag_Status,    
             UserID,    
             Tgl_Input, 
             Acct_No, 
			 Acct_Nm, 
			 BankCode,
			 SendName, 
			 Trf_Desc, 
			 Flag, 
			 Divisi, CostCenter)    
 SELECT TransactionCode = 'PB',    
		 a.BranchId,    
		 DebitKredit = case A.DebitKredit when 0 then 'D' else 'K' end,    
		 InternalAccount = A.IntAccCategoryId,    
		 Currency = 'IDR',    
		 Amount,    
		 A.Value_date,    
		 RefCode = a.ref_code,    
		 A.Narative,    
		 FlagStatus = 'S',    
		 'MyFunding',    
		 GETDATE(),
		 '','', '','', '', '', '' ,CASE WHEN LEFT(IntAccCategoryId, 2) = 'PL' THEN '9602' ELSE NULL END   
 FROM PencadanganTransaksi a    
 JOIN Pencadangan b ON a.PencadanganId = b.Id    
 WHERE a.Id = @Id     
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTPAYMENTPELUNASAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Alexander Andri>
-- Create date: <28 July 2016>
-- Description:	<SP insert payment pembayaran>
--[SP_INSERTPAYMENTPELUNASAN] '31'
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERTPAYMENTPELUNASAN] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SQL_Payment.dbo.PaymentTransaction (TrxCode,
													Branch,
													[Sign],
													GLNumber,
													Currency,
													Nominal,
													TglTrx,
													RefCode,
													[Description],
													Flag_Status,
													UserID,
													Tgl_Input,
													Acct_No, 
													Acct_Nm, 
													BankCode,
													SendName, 
													Trf_Desc, 
													Flag, 
													Divisi,
													CostCenter)
	SELECT TransactionCode = 'PB',
		   z.BranchId,
		   z.DebetKredit,
		   InternalAccount,
		   Currency = 'IDR',
		   Amount,
		   ValueDate,
		   RefCode = CASE WHEN (z.RowNumber % 2 = 1) THEN z.RefCode + Convert(VARCHAR(10),CEILING(z.RowNumber/2.0))
						  WHEN (z.RowNumber % 2 = 0) THEN z.RefCode + Convert(VARCHAR(10),z.RowNumber/2) END			
		   ,
		   Narrative,
		   FlagStatus = 'S',
		   'MyFunding',
		   GETDATE(),
		   '', '', '','', ISNULL(z.JurnalName,''), '', '', CASE WHEN LEFT(InternalAccount, 2) = 'PL' THEN '9602' ELSE NULL END 
FROM (
	SELECT ROW_NUMBER() OVER( ORDER BY a.Id ASC) AS RowNumber,
		   TransactionCode = 'PB',
		   a.BranchId,
		   --'ID001' + RIGHT(a.InternalAccount,4) AS BranchId,
		   DebetKredit = case DebetKredit when 0 then 'D' else 'K' end ,
		   InternalAccount,
		   Currency = 'IDR',
		   Amount,
		   ValueDate,
		   RefCode = b.PelunasanId,
		   Narrative,
		   FlagStatus = 'S',
		   'MyFunding' AS UserID,
		   GETDATE() AS Tgl_Input,
		   '' AS Acct_No, 
		   '' AS Acct_Nm, 
		   '' AS BankCode,
		   '' AS SendName, b.JurnalName, 
		   '' AS Flag, 
		   '' AS Divisi, CASE WHEN LEFT(InternalAccount, 2) = 'PL' THEN '9602' ELSE NULL END AS CostCenter
	FROM JurnalPelunasan a
	JOIN PurchaseReceive b ON a.PCRId = b.Id
	WHERE a.PCRId = @id	
	) z						
	
END


GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTPAYMENTPEMBAYARAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Alexander Andri>  
-- Create date: <28 July 2016>  
-- Description: <SP insert payment pembayaran>  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_INSERTPAYMENTPEMBAYARAN]   
 -- Add the parameters for the stored procedure here  
 @id int  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
 INSERT INTO SQL_Payment.dbo.PaymentTransaction (TrxCode,  
             Branch,  
             [Sign],  
             GLNumber,  
             Currency,  
             Nominal,  
             TglTrx,  
             RefCode,  
             [Description],  
             Flag_Status,  
             UserID,  
             Tgl_Input,  
             Acct_No,   
             Acct_Nm,   
             BankCode,  
             SendName,   
             Trf_Desc,   
             Flag,  
             CostCenter,   
             Divisi) 
             
 SELECT z.TransactionCode,  
     z.BranchId,  
     z.DebetKredit,  
     InternalAccount,  
     Currency = 'IDR',  
     Amount,  
     ValueDate,  
     RefCode =  CASE WHEN (z.RowNumber % 2 = 1) THEN z.RefCode + Convert(VARCHAR(10),CEILING(z.RowNumber/2.0))
						  WHEN (z.RowNumber % 2 = 0) THEN z.RefCode + Convert(VARCHAR(10),z.RowNumber/2) END
						  ,  
     z.[Description],  
     FlagStatus = 'S',  
     'MyFunding' AS UserID,  
      GETDATE() AS Tgl_Input,  
      '' AS Acct_No,  
      '' AS Acct_Nm,  
      '' AS BankCode,  
     '' AS SendName,  
      '' AS Trf_Desc,  
     '' AS Flag, 
     CASE WHEN LEFT(InternalAccount, 2) = 'PL' THEN '9602' ELSE NULL END AS CostCenter,
     '' AS Divisi
     
 FROM (    
              
 SELECT 
     ROW_NUMBER() OVER( ORDER BY a.Id ASC) AS RowNumber,
     b.TransactionCode,  
     a.BranchId,
     --'ID001' + RIGHT(a.InternalAccount,4) AS BranchId,  
     DebetKredit = case DebetKredit when 0 then 'D' else 'K' end,  
     InternalAccount,  
     Currency = 'IDR',  
     Amount,  
     ValueDate,  
     RefCode = b.PaymentRequestId,  
     SUBSTRING(Narrative,1,50) AS [Description],  
     FlagStatus = 'S',  
     'MyFunding' AS UserID,  
      GETDATE() AS Tgl_Input,  
      '' AS Acct_No,  
      '' AS Acct_Nm,  
      '' AS BankCode,  
     '' AS SendName,  
      '' AS Trf_Desc,  
     '' AS Flag, 
     CASE WHEN LEFT(InternalAccount, 2) = 'PL' THEN '9602' ELSE NULL END AS CostCenter,
     '' AS Divisi  
 FROM JurnalPembayaran a  
 JOIN PaymentRequest b ON a.PaymentRequestId = b.Id  
 WHERE a.PaymentRequestId = @Id  ) z 
   
END  


GO
/****** Object:  StoredProcedure [dbo].[SP_List_of_Account_with_Closed_Status]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_List_of_Account_with_Closed_Status]

@tanggal1 date,
@tanggal2 date

AS
BEGIN

		SELECT 
		a.account_no AS 'Account No'
		, a.account_title_1 AS 'Account Name'
		, ac.acct_closed_date AS 'Date of Closure'
		, a.category AS 'Category'
		, c.[description] AS 'Product Name'
		, a.opening_date AS 'Account Open Date'
		, a.co_code AS 'Branch Code'
		, b.company_name AS 'Branch Name'
		FROM [SQL_TEMENOS].[dbo].[account_closed] ac
		JOIN SQL_TEMENOS.DBO.ACCOUNT a
		  ON ac.[@ID] = a.account_no COLLATE DATABASE_DEFAULT
		JOIN SQL_TEMENOS.DBO.CATEGORY c
		  ON a.category = c.[@ID] COLLATE DATABASE_DEFAULT
		JOIN SQL_TEMENOS.DBO.COMPANY b
		  ON a.co_code = b.[@ID] COLLATE DATABASE_DEFAULT
		where ac.acct_closed_date between @tanggal1 and @tanggal2
		ORDER BY ac.acct_closed_date, a.account_no
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ListJurnalCashback]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ListJurnalCashback]
/*
 =============================================  
 Author:  eka
 Create date: 20201001
 Description: List Jurnal Cashback
 =============================================  
exec [SP_ListJurnalCashback] '0027/CSBK-FND/XI/2020','1'
*/
@POGroupId varchar(30) = null,
@POid varchar(30) = null,
@flag int

AS BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT
		CONVERT(date, d.PODate)  as PODate,
		d.Id,
		a.POId,
		a.PoGroupId,
		a.AccountDebet, 
		a.AccountKredit,
		a.Nominal,
		a.KodeCabang,
		co.company_name as NamaCabang,
		CASE WHEN d.CCYDebet = 0 THEN 'IDR' 
		WHEN d.CCYDebet = 1 THEN 'USD' 
		ELSE 'SGD' 
		END AS CCYDebet,
		CASE WHEN d.CCYKredit = 0 THEN 'IDR' 
		WHEN d.CCYKredit = 1 THEN 'USD' 
		ELSE 'SGD' 
		END AS CCYKredit,
		d.PODescription as Keterangan,
		'9602' as CostCenter,
		d.AdditionalInfoDetailItem as NoBatch
		into #temp1
		FROM 
		JurnalCashback a
		join EnquiryTabunganInput b on a.EnquiryId = b.Id
		join PurchaseOrder d on a.POId = d.POId
		join sql_temenos.dbo.company co on b.Cabang = co.[@ID] COLLATE DATABASE_DEFAULT
	WHERE 
		d.StatusData=1	
		AND d.POGroupId = @POGroupId
		and d.POGroupId like '%CSBK%'
	ORDER BY d.Id asc
END



if (@flag = 1)
BEGIN
select * from #temp1
END

if (@flag = 2)
BEGIN
DELETE FROM PurchaseOrder WHERE POId = @POId
DELETE FROM JurnalCashback WHERE POId = @POId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListSupplier_SQLInventory]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Yadit>        
-- Create date: <07 Feb - 2018>        
-- Description: <Select Supplier di SQL INVENTORY>        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_ListSupplier_SQLInventory]        
 -- Add the parameters for the stored procedure here                
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
  SELECT a.Supp_ID,
	     a.Nm_Supp,
	     a.Alamat1,
	     a.Alamat2,
	     a.Alamat3,
	      a.Kota,
	      a.Zip_ID,
	      a.Kabupaten,
	      a.Provinsi,
	      a.[Owner],
	      a.Telp_Owner,
	      a.HP_Owner,
	      a.PIC,
	      a.Telp_PIC,
	      a.HP_PIC,
	      a.Fax_No,
	      a.Email,
	      a.NoRek,
	      a.Nm_Bank,
	      a.[User_ID],
	      a.Tgl_Input,
	      a.TermOfPayment	                                
   FROM SQL_INVENTORY.dbo.InventorySupplier a WITH(NOLOCK)             		     
         
END


GO
/****** Object:  StoredProcedure [dbo].[SP_PAYMENTREQUEST]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Alexander Andri>    
-- Create date: <28 July 2016>    
-- Description: <SP View Payment Request>    
-- =============================================    
CREATE PROCEDURE [dbo].[SP_PAYMENTREQUEST]     
--EXEC [SP_PAYMENTREQUEST]    '','2016-09-27',6501,'ID0010510'    
 -- Add the parameters for the stored procedure here 
 -- Eka - Nambahin buat filter cabang   
 @no VARCHAR(50),    
 @tanggal DATETIME,    
 @jenis INT,    
 @cabang VARCHAR(50)    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
    
    -- Insert statements for procedure here    
    
 SELECT a.[Id]    
    ,poid = POId    
    ,PODate    
    ,a.PaymentMethod  
    ,a.EnquiryId    
    ,a.CategoryId    
    ,b.TypeBarang    
    ,b.Merek    
    ,b.Warna    
    ,Quantity = ISNULL(a.Quantity,0)    
    ,JenisTabungan    
    ,c.Cabang    
    ,NamaCabang = d.company_name    
    ,Amount = CASE WHEN a.PaymentMethod = 1 THEN a.NominalPurchase        
    ELSE 0 END
    , c.Requester
    , a.DPAmount
    , a.TotalPurchase
    , invSup.NoRek AS NoRekSupplier
    , acc.account_title_1 AS AccountTitle
    , d2.company_name AS AccountCabang
 FROM [SQL_FUNDING].[dbo].[PurchaseOrder] a WITH(NOLOCK)     
 LEFT JOIN [SQL_FUNDING].[dbo].[DetailBarang] b WITH(NOLOCK) ON a.DetailBarangId = b.Id    
 LEFT JOIN [SQL_FUNDING].[dbo].[EnquiryTabunganInput] c WITH(NOLOCK) ON a.EnquiryId = c.Id    
 LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK) ON d.[@ID] = c.Cabang COLLATE DATABASE_DEFAULT   
 LEFT JOIN [SQL_INVENTORY].dbo.InventorySupplier invSup ON invSup.Supp_ID = a.SupplierId
 LEFT JOIN [SQL_TEMENOS].dbo.Account acc ON acc.[@ID] = invSup.NoRek COLLATE DATABASE_DEFAULT 
 LEFT JOIN SQL_TEMENOS.dbo.COMPANY d2 WITH(NOLOCK) ON d2.[@ID] = acc.co_code
 
 WHERE POId IS NOT NULL AND a.ApproveBy IS NOT NULL --Munculin data     
 AND a.Id NOT IN (SELECT PurchaseOrderId FROM PaymentRequest WITH(NOLOCK))    
 AND (CAST(PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)     
 AND (Cabang = @cabang OR @cabang = '')    
 AND JenisTabungan = @jenis AND POId LIKE '%' + @no + '%'  
 AND a.PaymentMethod != '2'  
 OR (a.PaymentMethod = '2' AND a.Id NOT IN (SELECT PurchaseOrderId FROM PaymentRequest WITH(NOLOCK)) AND a.Id NOT IN (SELECT PurchaseOrderId FROM PurchaseReceive WHERE PelunasanId IS NOT NULL)
		AND a.Id IN (SELECT PurchaseOrderId FROM PurchaseReceive WHERE ApproveReceiveBy IS NOT NULL AND PelunasanId IS NULL ) 
		--20200908, Eka, BEGIN
		AND (Cabang = @cabang OR @cabang = '')
		)
		--20200908, Eka, END    
 ORDER BY a.CreateDate desc    
     
END    


GO
/****** Object:  StoredProcedure [dbo].[SP_PELUNASAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Alexander Andri>        
-- Create date: <11 agustus 2016>        
-- Description: <Select authorize pelunasan>        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_PELUNASAN]        
 -- Add the parameters for the stored procedure here        
  @no VARCHAR(50),        
  @nopr VARCHAR(50),        
  @jenis INT,        
  @cabang VARCHAR(20),        
  @tanggal VARCHAR(50),        
  @tanggalpr VARCHAR(50)        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
  SET NOCOUNT ON;        
        
  SELECT a.[Id],        
    b.POId,        
    a.PurchaseOrderId,        
    b.PODate,        
    a.PurchaseReceiveId,        
    a.PurchaseReceiveDate,        
    c.PromotionCode,        
    c.TypeBarang,        
    c.Merek,        
    c.Warna,        
    b.Quantity,        
    d.jenistabungan,      
    TotalPurchase = ISNULL(b.TotalPurchase,0),    
    pajak = ISNULL(ISNULL((b.TotalPurchase/0.8),0) - b.TotalPurchase,0),    
    SisaPembayaran = ISNULL((b.TotalPurchase/0.8),0) - ISNULL(b.DPAmount,0),  
    b.PaymentMethod,  
    b.DPAmount ,
    e.PaymentRequestType AS PaymentRequestType,
    e.ApproveBy AS ApproveByPaymentRequest,
    e.PaymentRequestId,
    a.Receiver,
    a.ApproveReceiveBy,
    a.ApproveReceiveDateTime,
    a.Condition
    FROM [SQL_FUNDING].[dbo].[PurchaseReceive] a WITH(NOLOCK)         
    LEFT JOIN [SQL_FUNDING].[dbo].[PurchaseOrder] b WITH(NOLOCK)         
    ON a.PurchaseOrderId = b.Id        
    LEFT JOIN [SQL_FUNDING].dbo.DetailBarang c WITH(NOLOCK)         
    ON c.Id = b.DetailBarangId        
    LEFT JOIN [SQL_FUNDING].dbo.EnquiryTabunganInput d WITH(NOLOCK)         
    ON d.Id = b.EnquiryId        
    
    LEFT JOIN [SQL_FUNDING].dbo.[PaymentRequest] e 
		ON e.PurchaseOrderId = b.Id
    
    WHERE  a.PelunasanId IS NULL AND a.ApproveReceiveBy IS NOT NULL        
    AND JenisTabungan = @jenis       
    AND PurchaseReceiveId LIKE '%' +  @nopr + '%' AND POId LIKE '%' + @no + '%'      
    AND (CAST(PurchaseReceiveDate AS DATE) = CAST(@tanggalpr AS DATE) OR @tanggalpr IS NULL)      
    AND (CAST(PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)      
    AND (Cabang = @cabang OR @cabang = '')      
  ORDER BY a.CreateDate desc      
        
END      


GO
/****** Object:  StoredProcedure [dbo].[SP_PURCHASEORDER]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Alexander Andri>    
-- Create date: <28 July 2016>    
-- Description: <SP View Purchase Order>    
-- =============================================
--EXEC [dbo].[SP_PURCHASEORDER] '','','6502',''
-- eka, nambah where       
CREATE PROCEDURE [dbo].[SP_PURCHASEORDER]     
 -- Add the parameters for the stored procedure here    
 @no VARCHAR(50) = null,    
 @norekening VARCHAR(50) = null,    
 @jenis INT,    
 @cabang VARCHAR(20) = null    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
 
 DECLARE @stringValue VARCHAR(500)
    
    -- Insert statements for procedure here    
  
 SELECT a.[Id]    
    ,[TglBukaRekening]    
    ,[JenisTabungan]    
    ,[NoRekening]    
    ,[NoCif]    
    ,[NamaNasabah]    
    ,[KodePromosi]    
    ,[Cabang]    
    ,NamaCabang = d.company_name    
    ,[StartDate]    
    ,[MaturityDate]    
    ,[Nominal]    
    ,[PRId]    
    ,b.Jumlah  
    ,[PRDate]    
    ,[DraftPRId]    
    ,[DraftPRDate]    
    ,[Requester]    
    ,[AttachmentSPNasabah]    
    ,[RewardBudget]    
    ,[AttachmentMemoDireksi]    
    ,[CatatanCabang]    
    ,[CatatanFProduct]    
    ,a.[CreateBy]    
    ,a.[CreateDate]    
    ,a.[UpdateBy]    
    ,a.[UpdateDate]    
    ,a.[ApproveBy]    
    ,a.[ApproveDate]   
    ,kat.Keterangan
    ,
    --(STUFF((
    --    SELECT ', ' + Warna
    --    FROM DetailBarang
    --    WHERE EnquiryId = a.Id
    --    FOR XML PATH('')
    --    ), 1, 2, '')
    --) 
    db.Warna AS Warna
    , kat.Kategory
    , kat.Merk as Merek
    , kat.[Type] as TypeBarang
    ,db.Id AS DetailBarangId
    
    --,(SELECT @stringValue = COALESCE(@stringValue + ', ' + '') + db.Warna FROM DetailBarang db WHERE EnquiryID = a.Id ) 
 FROM [SQL_FUNDING].[dbo].[EnquiryTabunganInput] a WITH(NOLOCK)    
 LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK) ON d.[@ID] = a.Cabang COLLATE DATABASE_DEFAULT  
 LEFT JOIN [SQL_FUNDING].dbo.Katalog kat WITH(NOLOCK) ON kat.Kode_Promo = a.KodePromosi AND kat.IsDelete = 0 
 INNER JOIN [SQL_FUNDING].dbo.DetailBarang db
	ON db.EnquiryId = a.Id 
 --(SELECT count(id) as Jumlah,EnquiryId     
 --FROM [SQL_FUNDING].dbo.Detailbarang db    
 --WHERE db.Id not in (select DetailBarangId from PurchaseOrder)    
 --GROUP BY EnquiryId    
 --)B On b.EnquiryId = a.Id    
 Outer Apply (    
  select COUNT(id) as Jumlah from DetailBarang db     
  where db.EnquiryId = a.Id     
  --and db.Id not in (select DetailBarangId from PurchaseOrder)    
  and not exists    
  (  
   Select top 1 1 from PurchaseOrder po   
   where po.EnquiryId = a.Id and db.Id = po.DetailBarangId)    
  )    
  B     
 WHERE PRId IS NOT NULL AND ApproveBy2 IS NOT NULL --Munculin data     
 AND (NoRekening LIKE '%' + @NoRekening + '%'  or @norekening is null)  
 and (Cabang = @cabang or @cabang = '')  
 AND JenisTabungan = @jenis   
 AND (PRId LIKE '%' + @no + '%'  or @no is null)  
 AND b.Jumlah > 0    
 --AND db.Id NOT IN (SELECT DetailBarangId FROM PurchaseOrder WITH(NOLOCK))
 --eka begin 20201001
 and db.Kategoribarang <> 8
 --eka end 20201001    
 ORDER BY a.CreateDate desc  
     
END 



GO
/****** Object:  StoredProcedure [dbo].[SP_PURCHASERECEIVE]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_executesql N'SP_PURCHASERECEIVE @no, @norekening, @jenis, @cabang, @tanggal',N'@no nvarchar(4000),@noRekening nvarchar(4000),@tanggal datetime,@jenis int,@cabang nvarchar(4000)',@no=N'',@noRekening=N'',@tanggal='2017-03-10 16:29:49.813',@jenis=6
  
    
--008,@cabang=N''        
-- =============================================          
-- Author:  <Alexander Andri>          
-- Create date: <12 Agustus 2016>          
-- Description: <SP View Purchase Receive>          
-- =============================================          
CREATE PROCEDURE [dbo].[SP_PURCHASERECEIVE]           
 -- Add the parameters for the stored procedure here          
 @no VARCHAR(50),          
 @norekening VARCHAR(50),          
 @jenis INT,          
 @cabang VARCHAR(20),          
 @tanggal DATETIME,  
 @nopr VARCHAR(50)          
AS          
BEGIN          
 -- SET NOCOUNT ON added to prevent extra result sets from          
 -- interfering with SELECT statements.          
 SET NOCOUNT ON;          
          
    -- Insert statements for procedure here          
          
 SELECT a.[Id],          
   a.POId,          
   PurchaseOrderId = a.id,          
   a.PaymentMethod,        
   a.PODate,          
   b.PaymentRequestId,          
   b.PaymentRequestDate,          
   c.PromotionCode,          
   c.TypeBarang,          
   c.Merek,          
   c.Warna,          
   a.Quantity,          
   d.JenisTabungan,      
   a.PaymentMethod      
 FROM [SQL_FUNDING].[dbo].[PurchaseOrder] a WITH(NOLOCK)           
 LEFT JOIN [SQL_FUNDING].[dbo].[PaymentRequest] b WITH(NOLOCK)           
 ON b.PurchaseOrderId = a.Id          
 LEFT JOIN [SQL_FUNDING].dbo.DetailBarang c WITH(NOLOCK)           
 ON c.Id = a.DetailBarangId          
 LEFT JOIN [SQL_FUNDING].dbo.EnquiryTabunganInput d WITH(NOLOCK)           
 ON d.Id = a.EnquiryId          
 WHERE  a.ApproveBy IS NOT NULL --Munculin data    
 AND a.Id NOT IN (SELECT PurchaseOrderId FROM PurchaseReceive)        
 AND (( PaymentMethod = 2) OR ( B.PurchaseOrderId IS NOT NULL AND PaymentMethod <> 2 and b.ApproveBy IS NOT NULL ))        
 AND NoRekening LIKE '%' + @NoRekening + '%'          
 AND (CAST(PODate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)          
 AND JenisTabungan = @jenis AND POId LIKE '%' + @no + '%'          
 AND (cabang = @cabang OR @cabang = '')   
 AND (b.PaymentRequestId LIKE '%' + @nopr + '%'  OR   b.PaymentRequestId IS NULL)       
 ORDER BY a.CreateDate desc    
 
       
           
END  
   

GO
/****** Object:  StoredProcedure [dbo].[SP_PURCHASEREQUEST]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		<Alexander Andri>
-- Create date: <19 July 2016>
-- Description:	<SP View Purchase Request>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PURCHASEREQUEST] 
	-- Add the parameters for the stored procedure here
/*	-- EXEC [SP_PURCHASEREQUEST]
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20200713, eka, penambahan sp
*/
	@nodraft VARCHAR(50),
	@norekening VARCHAR(50),
	@jenis INT,
	@cabang VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT [Id]
		  ,DraftPRId
		  ,[TglBukaRekening]
		  ,[JenisTabungan]
		  ,[NoRekening]
		  ,[NoCif]
		  ,[NamaNasabah]
		  ,[KodePromosi]
		  ,[Cabang]
		  ,NamaCabang = d.company_name
		  ,Requester
		  ,[StartDate]
		  ,[MaturityDate]
		  ,[Nominal]
		  ,[PRId]
		  ,[PRDate]
		  ,[DraftPRId]
		  ,[DraftPRDate]
		  ,[AttachmentSPNasabah]
		  ,[RewardBudget]
		  ,[AttachmentMemoDireksi]
		  ,[CatatanCabang]
		  ,[CatatanFProduct]
		  --20200710, eka, begin
		  ,ISNULL(PenyimpanganProgram,0) AS PenyimpanganProgram
		  ,[AttachmentPenyimpangan]
		  --20200710, eka, end	
	FROM [SQL_FUNDING].[dbo].[EnquiryTabunganInput] a WITH(NOLOCK)
	LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK) ON d.[@ID] = a.Cabang COLLATE DATABASE_DEFAULT  
	WHERE PRId IS NULL AND ApproveBy IS NOT NULL --Munculin data 
	AND NoRekening LIKE '%' + @NoRekening + '%' and StatusData <> 6
	AND JenisTabungan = @jenis AND DraftPRId LIKE '%' + @nodraft + '%'
	AND (Cabang = @Cabang OR @cabang = '')
	ORDER BY a.CreateDate desc

		
END


GO
/****** Object:  StoredProcedure [dbo].[SP_QueryJurnalOtomatis]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================        
-- Author:  <Yadit>        
-- Create date: <15 May - 2018>        
-- Description: <Query Jurnal Otomatis>        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_QueryJurnalOtomatis]        
 -- Add the parameters for the stored procedure here        
 @Nomor VARCHAR(50),       
 @Query VARCHAR(200),
 @Result VARCHAR(200) OUTPUT
         
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
  DECLARE @TableName VARCHAR(100),
		@FieldName VARCHAR(100),
		@Sql VARCHAR(MAX)
		
	IF OBJECT_ID('tempdb..#tempResult') IS NOT NULL DROP TABLE #tempResult	
		
	CREATE TABLE #tempResult
	( Result VARCHAR(200)
	) 	
		
	
SET @TableName = (SELECT Item FROM [SQL_TEMENOS].dbo.SplitString(@Query,'|')
					WHERE ItemIndex = 0)
					
SET @FieldName = (SELECT Item FROM [SQL_TEMENOS].dbo.SplitString(@Query,'|')
					WHERE ItemIndex = 1)					

IF (@TableName = 'EnquiryTabunganInput')
	BEGIN
		SET @Sql = 'SELECT eti.' + @FieldName + ' AS Result FROM ' + @TableName + ' eti' +
		    ' INNER JOIN PurchaseOrder po
				ON eti.id = po.EnquiryId ' + 
			' WHERE po.POId = ''' + @Nomor + ''''
	END
ELSE IF (@TableName = 'az_account')
	BEGIN
		SET @Sql = 'SELECT az.' + @FieldName + ' AS Result FROM [SQL_TEMENOS].dbo.' + @TableName + ' az' +
		    ' INNER JOIN EnquiryTabunganInput eti 
				ON az.[@ID] = eti.NoRekening COLLATE DATABASE_DEFAULT
			  INNER JOIN PurchaseOrder po
				ON eti.id = po.EnquiryId ' + 
			' WHERE po.POId = ''' + @Nomor + ''''
	END
ELSE
	BEGIN
		SET @Sql = 'SELECT ' + @FieldName + ' AS Result FROM ' + @TableName + 
			' WHERE POId = ''' + @Nomor + ''''
	END
	
 
PRINT(@Sql)
INSERT INTO #tempResult 
EXEC (@Sql)

SET @Result = (SELECT Result FROM #tempResult)  

DROP TABLE #tempResult  
         
END


GO
/****** Object:  StoredProcedure [dbo].[SP_REJECTENQUIRYTABUNGAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Alexander Andri>  
-- Create date: <20 mei- 2016>  
-- Description: <Select authorize enquiry tabungan>  
-- [SP_AUTHORIZEENQUIRYTABUNGAN] null,'6502','','',''
-- =============================================
CREATE PROCEDURE [dbo].[SP_REJECTENQUIRYTABUNGAN]
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190110, jeni, penambahan isnull pada DraftPRId
	20200710, eka, penambahan sp
*/	
	@tanggal DATETIME
	,@jenis INT
	,@cabang VARCHAR(50)
	,@norekening VARCHAR(50),
	@nodraft VARCHAR(50)

AS  
BEGIN

	SET NOCOUNT ON;
	
	SELECT	a.Id
			,NoRekening
			,NoCif
			,NamaNasabah
			
			--,KodeJenisTabungan = CASE WHEN JenisTabungan = 'Tabungan Sipucuk' THEN '6501'
			--     WHEN JenisTabungan = 'Tabungan Sipucuk Reward' THEN '6502'
			--     WHEN JenisTabungan = 'Tabungan Hadiah Langsung' THEN '6008'
			--   END
			
			,JenisTabungan
			,Cabang
			,NamaCabang = d.company_name
			,TglBukaRekening
			,StartDate
			,MaturityDate
			,Nominal
			,DraftPRId
			,DraftPRDate,
			a.Requester
			,a.AttachmentSPNasabah
			,a.DetailBarangId	
			,a.CatatanCabang
--20190114, jeni, BEGIN
			,a.KodePromosi
			,c.Keterangan
			,a.RejectReason
--20200710, eka, BEGIN
			,ISNULL(a.PenyimpanganProgram,0) AS PenyimpanganProgram
			,a.AttachmentPenyimpangan
--20200710, eka, END
--20190114, jeni, END
		FROM SQL_FUNDING.dbo.EnquiryTabunganInput a WITH(NOLOCK)
		
		LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK) ON d.[@ID] = a.Cabang COLLATE DATABASE_DEFAULT
--20190114, jeni, BEGIN
		LEFT JOIN SQL_FUNDING.dbo.Katalog c WITH(NOLOCK) ON a.KodePromosi=c.Kode_Promo
--20190114, jeni, END		
		WHERE	JenisTabungan = @jenis
--20190110, jeni, BEGIN
				--AND NoRekening LIKE '%' + @norekening + '%'
				--AND DraftPRId LIKE '%' +  @nodraft + '%'
				AND ISNULL(NoRekening,'') LIKE '%' + @norekening + '%'
				AND ISNULL(DraftPRId,'') LIKE '%' +  @nodraft + '%'
--20190110, jeni, END
				--AND ApproveBy IS NULL
--20190110, jeni, BEGIN
				--AND a.StatusData <> 3 --delete ga muncul lg
				AND a.StatusData <> 3 AND a.StatusData=6 --delete ga muncul lg --menampilkan yang status reject
--20190110, jeni, END
				AND (CAST(DraftPRDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL)
				AND (Cabang = @cabang OR @cabang = '')
				AND a.RejectBy IS NOT NULL
				
		ORDER BY	a.CreateDate DESC
		
END  

GO
/****** Object:  StoredProcedure [dbo].[SP_REJECTPURCHASEREQUEST]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Alexander Andri>
-- Create date: <20 mei- 2016>
-- Description:	<Select authorize enquiry tabungan>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REJECTPURCHASEREQUEST]
/*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190110, jeni, penambahan isnull pada PRId
*/
	-- Add the parameters for the stored procedure here
	@tanggal datetime,
	@jenis int,
	@cabang varchar(50),
	@norekening varchar(50),
	@no varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
	
	SELECT Id,
		   NoRekening,
		   NoCif,
		   NamaNasabah,
		   
		   --KodeJenisTabungan = CASE WHEN JenisTabungan = 'Tabungan Sipucuk' THEN '6501'
					--		   WHEN JenisTabungan = 'Tabungan Sipucuk Reward' THEN '6502' 
					--		   WHEN JenisTabungan = 'Tabungan Hadiah Langsung' THEN '6008'
					--	  END,
		   JenisTabungan,	
		   Cabang,
		   NamaCabang = d.company_name,
		   TglBukaRekening,
		   Requester,
		   StartDate, 
		   MaturityDate,
		   Nominal,
		   PRId,
		   PRDate,
		   DraftPRId,
		   DraftPRDate,
		   a.RewardBudget,
		   a.AttachmentMemoDireksi,
		   a.Requester,
		   a.CatatanCabang,
		   a.CatatanFProduct
--20190115, jeni, BEGIN
		   ,a.RejectReason2
--20190115, jeni, END
	 FROM SQL_FUNDING.dbo.EnquiryTabunganInput a WITH(NOLOCK)
	 LEFT JOIN SQL_TEMENOS.dbo.COMPANY d WITH(NOLOCK)
	 ON d.[@ID] = a.Cabang COLLATE DATABASE_DEFAULT
	 WHERE --PRId IS NOT NULL AND ApproveBy2 is null 
	 --AND ApproveBy IS NOT NULL 
	 --AND 
--20190110, jeni, BEGIN
	 --StatusData = 6
	 StatusData2 = 6
--20190110, jeni, BEGIN
	 AND StatusData2 <> 3 --delete ga muncul lg
	 AND (Cabang = @cabang OR @cabang = '')
	 AND (CAST(PRDate AS DATE) = CAST(@tanggal AS DATE) OR @tanggal IS NULL) 
	 AND JenisTabungan = @jenis 
--20190110, jeni, BEGIN
--	 AND NoRekening LIKE '%' + @norekening + '%' AND PRId LIKE '%' +  @no + '%'
AND ISNULL(NoRekening,'') LIKE '%' + @norekening + '%' AND ISNULL(PRId,'') LIKE '%' +  @no + '%'
--20190110, jeni, END
	 ORDER BY a.CreateDate desc
	 
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Active_Customer_List]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_Active_Customer_List]

AS
BEGIN

		-- Active Custmomer List
		SELECT
			c.customer_no AS 'Customer No'
			, c.mnemonic AS 'Mnemonic'
			, c.name_1 AS 'Name'
			, ao.name AS 'Account Officer'
			--, COALESCE(ao2.name, '') AS 'Second Officer'
			, ao2.name AS 'Second Officer'
			, s.description AS 'Sector Name'
			, c.residence AS 'Residence'
			, c.[address]+' '+c.street AS 'Alamat'
			, c.legal_id AS 'No. KTP'
			, CASE 
				WHEN (c.sid_related LIKE '1') THEN 'Terkait'
				WHEN (c.sid_related LIKE '2') THEN 'Tidak Terkait'
			END AS 'Terkait / Tidak Terkait'
			, c.company_book AS 'Cabang'
			--, c.co_code AS 'Cabang' -- isi only ID0010001
			--, c.cus_open_date AS 'Tanggal Buka CIF'
			, CONVERT(VARCHAR, CAST(c.cus_open_date AS DATE),113) AS 'Tanggal Buka CIF'
			, j.JobName AS 'Pekerjaan' 
			, sms_1 AS 'No Telepon'
			, c.sid_dati2debtor AS 'DATI2'
		FROM SQL_TEMENOS.dbo.CUSTOMER c
		LEFT JOIN SQL_TEMENOS.dbo.dept_acct_officer ao ON c.account_officer = ao.[@ID]
		LEFT JOIN SQL_TEMENOS.dbo.dept_acct_officer ao2 ON c.other_officer = ao.[@ID]
		LEFT JOIN SQL_TEMENOS.dbo.sector s ON c.sector = s.[@ID]
		LEFT JOIN SQL_TEMENOS.dbo.job_title j ON c.occupation = j.JobCode
		WHERE (inactive_cust IS NULL OR inactive_cust NOT LIKE 'YES')
		--ORDER BY CAST(c.[@ID] AS INT)
		order by c.customer_no
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Inactive_Account]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_Inactive_Account]

AS
BEGIN

		SELECT 
a.account_no AS 'Account No'
, a.customer_no AS 'CIF'
, a.category AS 'Category'
, ca.[description] AS 'Product'
, a.account_title_1 AS 'Account Name'
, a.currency AS 'Ccy'
, a.online_actual_bal AS 'Working Balance'
--, air.reset_date AS 'Date Last Cust'
--, air.reset_date AS 'Date Last Cr Cust'
--, AS 'Amnt Last Cr Cust'
--, air.reset_date AS 'Date Last Dr Cust'
--, AS 'Amnt Last Dr Cust'
--, CONVERT(VARCHAR(50),DATEDIFF(MONTH,air.reset_date,air.batch_date))+' Months' AS 'Inactive Period'
, b.company_name AS 'Branch'
FROM SQL_TEMENOS.DBO.ACCOUNT a
JOIN SQL_TEMENOS.DBO.CATEGORY ca
  ON a.category = ca.[@ID] COLLATE DATABASE_DEFAULT
JOIN SQL_TEMENOS.DBO.COMPANY b
  ON a.co_code = b.[@ID] COLLATE DATABASE_DEFAULT
--JOIN SQL_TEMENOS.dbo.acct_inactive_reset air
--  ON a.account_no = air.[@ID]
-- AND a.co_code = air.co_code
  --LEFT JOIN SQL_TEMENOS.dbo.STMT_ENTRY se
  --  ON a.account_no = se.account_number
  -- AND a.co_code = se.company_code
where a.inactiv_marker = 'Y'
order by a.customer_no, a.account_no

END

GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Inactive_Customer_List]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_Inactive_Customer_List]

AS
BEGIN

		SELECT
			c.customer_no AS 'Customer No'
			, c.mnemonic AS 'Mnemonic'
			, c.name_1 AS 'Name'
			, ao.name AS 'Account Officer'
			--, COALESCE(ao2.name, '') AS 'Second Officer'
			, ao2.name AS 'Second Officer'
			, s.description AS 'Sector Name'
			, c.residence AS 'Residence'
			, c.[address]+' '+c.street AS 'Alamat'
			, c.legal_id AS 'No. KTP'
			, CASE 
				WHEN (c.sid_related LIKE '1') THEN 'Terkait'
				WHEN (c.sid_related LIKE '2') THEN 'Tidak Terkait'
			END AS 'Terkait / Tidak Terkait'
			, c.company_book AS 'Cabang'
			--, c.co_code AS 'Cabang' -- isi only ID0010001
			--, c.cus_open_date AS 'Tanggal Buka CIF'
			, CONVERT(VARCHAR, CAST(c.cus_open_date AS DATE),113) AS 'Tanggal Buka CIF'
			, j.JobName AS 'Pekerjaan' 
			, sms_1 AS 'No Telepon'
			--, c.sid_dati2debtor AS 'DATI2'
		FROM SQL_TEMENOS.dbo.CUSTOMER c
		LEFT JOIN SQL_TEMENOS.dbo.dept_acct_officer ao ON c.account_officer = ao.[@ID]
		LEFT JOIN SQL_TEMENOS.dbo.dept_acct_officer ao2 ON c.other_officer = ao.[@ID]
		LEFT JOIN SQL_TEMENOS.dbo.sector s ON c.sector = s.[@ID]
		LEFT JOIN SQL_TEMENOS.dbo.job_title j ON c.occupation = j.JobCode
		WHERE (inactive_cust IS NOT NULL AND inactive_cust LIKE 'YES')
		--ORDER BY CAST(c.[@ID] AS INT)
		order by c.customer_no
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Saldo_Account_Rata2]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [SP_Report_Saldo_Account_Rata2] '07/01/2018','07/31/2018', 'TABUNGAN', '6001'
-- [SP_Report_Saldo_Account_Rata2] '05/01/2018','05/31/2018', 'GIRO', 'ALL'
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_Saldo_Account_Rata2]
	@tanggal1 date,
	@tanggal2 date,
	@kategori VARCHAR(10) = 'ALL',
	@kodeproduk VARCHAR(10) = 'ALL'
AS
BEGIN

DECLARE @listGiro TABLE (id VARCHAR(10));
INSERT @listGiro(id) VALUES(1001), (1002), (1003), (1004), (1005), (1006), (1007), (1008), (1009), (1021), (1102), (1103), (1104), (1105), (1501), (1502), (1503), (1504); 

DECLARE @listTabungan TABLE (id VARCHAR(10));
INSERT @listTabungan(id) VALUES(6001), (6002), (6003), (6004), (6005), (6006), (6007), (6008), (6011), (6012), (6013), (6014), (6017), (6501), (6502), (6503); 

--Table variable bikin lamaa
CREATE TABLE #tempListSelection  (id VARCHAR(10));
--DECLARE @listSelection TABLE (id VARCHAR(10));


IF(@kodeproduk = 'ALL' OR @kodeproduk IS NULL OR @kodeproduk = '')
BEGIN
	IF(@kategori = 'GIRO')
	BEGIN
		--INSERT INTO @listSelection SELECT * FROM @listGiro 
		INSERT INTO #tempListSelection SELECT * FROM @listGiro 
	END
	ELSE IF(@kategori = 'TABUNGAN')
	BEGIN
		--INSERT INTO @listSelection SELECT * FROM @listTabungan 
		INSERT INTO #tempListSelection SELECT * FROM @listTabungan 
	END
	ELSE
	BEGIN
		--INSERT INTO @listSelection SELECT * FROM @listGiro 
		--INSERT INTO @listSelection SELECT * FROM @listTabungan 
		INSERT INTO #tempListSelection SELECT * FROM @listGiro 
		INSERT INTO #tempListSelection SELECT * FROM @listTabungan 
	END
END
ELSE
BEGIN
	--INSERT @listSelection(id) VALUES(@kodeproduk);
	INSERT #tempListSelection(id) VALUES(@kodeproduk);
END;

SELECT
	abal.account_no AS 'Account number'
	, abal.alt_acct_id AS 'Alt Account No'
	, abal.customer_no AS 'CIF number'
	--, abal.account_title_1 AS 'CIF Name'
	, c.name_1 AS 'CIF Name'
	, abal.account_title_1 AS 'Account Name'
	, abal.category AS 'Product Code'
	, ca.[description] AS 'Product Description'
	, COALESCE(abal.AvgBal,0) AS 'Average Balance'
	, abal.co_code AS 'Company ID'
	, b.company_name AS 'Company Name'
FROM
(
	SELECT 
		acct.category
		, acct.customer_no
		, alt_acct_id
		, acct.account_no
		, acct.account_title_1
		, co_code
		, AVG(acbl.online_actual_bal) AS AvgBal
	FROM
	(
		SELECT 
			account_no
			, alt_acct_id
			, customer_no
			, account_title_1
			, category
			, co_code
		FROM SQL_TEMENOS.DBO.ACCOUNT ac
		WHERE account_no NOT IN (SELECT [@ID] FROM SQL_TEMENOS.DBO.account_closed)
		AND category IN (SELECT id FROM #tempListSelection)
	) acct
	--INNER JOIN #tempListSelection ls ON acct.category = ls.id
	LEFT JOIN SQL_TEMENOS.DBO.account_balance acbl ON acct.account_no = acbl.account_number 
	AND batch_date BETWEEN @tanggal1 AND @tanggal2
	GROUP BY 
		acct.category
		, acct.account_no
		, customer_no
		, account_title_1
		, alt_acct_id
		, co_code
) abal 
INNER JOIN SQL_TEMENOS.DBO.CUSTOMER c
	ON abal.customer_no = c.customer_no COLLATE DATABASE_DEFAULT AND c.inactive_cust IS NULL
INNER JOIN SQL_TEMENOS.DBO.CATEGORY ca
	ON abal.category = ca.[@ID] COLLATE DATABASE_DEFAULT
INNER JOIN SQL_TEMENOS.DBO.COMPANY b
	ON abal.co_code = b.[@ID] COLLATE DATABASE_DEFAULT


DROP TABLE #tempListSelection
END


SELECT * FROM SQL_TEMENOS.DBO.account_balance
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Saldo_Account_Rata2_BAK]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [SP_Report_Saldo_Account_Rata2] '02/01/2018','02/28/2018'
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_Saldo_Account_Rata2_BAK]
@tanggal1 date,
@tanggal2 date

AS
BEGIN

WITH AccData AS
(
	SELECT 
		acc.account_no
		, acc.alt_acct_id
		, acc.customer_no
		, acc.account_title_1
		, acc.category
		, acc.co_code
		--, bal.bal_date
		, COALESCE(AVG(bal.online_actual_bal),0) AS AvgBal
	FROM 
	(
		SELECT 
		acct.account_no
		, acct.alt_acct_id
		, acct.customer_no
		, acct.account_title_1
		, acct.category
		, acct.co_code
		FROM SQL_TEMENOS.DBO.ACCOUNT acct
		WHERE category IN(
			-- Giro
			1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1021, 1102, 1103, 1104, 1105, 1501, 1502, 1503, 1504, 
			--Tabungan
			6001, 6002, 6003, 6004, 6005, 6006, 6007, 6008, 6011, 6012, 6013, 6014, 6017, 6501, 6502, 6503)
		AND acct.account_no NOT IN (SELECT [@ID] FROM SQL_TEMENOS.DBO.account_closed )
	) acc
	INNER JOIN SQL_TEMENOS.DBO.AccountBalance bal ON acc.account_no = bal.account_no
	WHERE bal.batch_date BETWEEN @tanggal1 AND @tanggal2
	GROUP BY acc.account_no
		, acc.alt_acct_id
		, acc.customer_no
		, acc.account_title_1
		, acc.category
		, acc.co_code
)
SELECT 
a.account_no AS 'Account number'
, a.alt_acct_id AS 'Alt Account No'
, a.customer_no AS 'CIF number'
, c.name_1 AS 'CIF Name'
, a.account_title_1 AS 'Account Name'
, a.category AS 'Product Code'
, ca.[description] AS 'Product Description'
, a.AvgBal AS 'Average Balance'
, a.co_code AS 'Company ID'
, b.company_name AS 'Company Name'
FROM AccData a
LEFT JOIN SQL_TEMENOS.DBO.CUSTOMER c
	ON a.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
JOIN SQL_TEMENOS.DBO.CATEGORY ca
	ON a.category = ca.[@ID] COLLATE DATABASE_DEFAULT
JOIN SQL_TEMENOS.DBO.COMPANY b
	ON a.co_code = b.[@ID] COLLATE DATABASE_DEFAULT
 where a.category IN (1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1021, 1102, 1103, 1104, 1105, 1501, 1502, 1503, 1504, 6001, 6002, 6003, 6004, 6005, 6006, 6007, 6008, 6011, 6012, 6013, 6014, 6017, 6501, 6502, 6503)
END








GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Saldo_Account_Rata2_ListProduk]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Report_Saldo_Account_Rata2_ListProduk]
@kategori VARCHAR(10) = 'ALL'
AS
BEGIN
	DECLARE @listGiro TABLE (id VARCHAR(10));
	INSERT @listGiro(id) VALUES(1001), (1002), (1003), (1004), (1005), (1006), (1007), (1008), (1009), (1021), (1102), (1103), (1104), (1105), (1501), (1502), (1503), (1504); 

	DECLARE @listTabungan TABLE (id VARCHAR(10));
	INSERT @listTabungan(id) VALUES(6001), (6002), (6003), (6004), (6005), (6006), (6007), (6008), (6011), (6012), (6013), (6014), (6017), (6501), (6502), (6503); 

	DECLARE @listSelection TABLE (id VARCHAR(10));
	INSERT INTO @listSelection VALUES('ALL');

	IF(@kategori = 'GIRO')
	BEGIN
		INSERT INTO @listSelection SELECT * FROM @listGiro 
	END
	ELSE IF(@kategori = 'TABUNGAN')
	BEGIN
		INSERT INTO @listSelection SELECT * FROM @listTabungan 
	END
	ELSE
	BEGIN
		INSERT INTO @listSelection SELECT * FROM @listGiro 
		INSERT INTO @listSelection SELECT * FROM @listTabungan 
	END

	SELECT * FROM @listSelection
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Saldo_Account_Rata2_temp]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [SP_Report_Saldo_Account_Rata2_temp] '05/01/2018','05/31/2018', 'TABUNGAN', '6001'
-- [SP_Report_Saldo_Account_Rata2] '05/01/2018','05/31/2018', 'GIRO', 'ALL'
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_Saldo_Account_Rata2_temp]
@tanggal1 date,
@tanggal2 date,
@kategori VARCHAR(10) = 'ALL',
@kodeproduk VARCHAR(10) = 'ALL'
AS
BEGIN

DECLARE @listGiro TABLE (id VARCHAR(10));
INSERT @listGiro(id) VALUES(1001), (1002), (1003), (1004), (1005), (1006), (1007), (1008), (1009), (1021), (1102), (1103), (1104), (1105), (1501), (1502), (1503), (1504); 

DECLARE @listTabungan TABLE (id VARCHAR(10));
INSERT @listTabungan(id) VALUES(6001), (6002), (6003), (6004), (6005), (6006), (6007), (6008), (6011), (6012), (6013), (6014), (6017), (6501), (6502), (6503); 

DECLARE @listSelection TABLE (id VARCHAR(10));


IF(@kodeproduk = 'ALL' OR @kodeproduk IS NULL OR @kodeproduk = '')
BEGIN
	IF(@kategori = 'GIRO')
	BEGIN
		INSERT INTO @listSelection SELECT * FROM @listGiro 
	END
	ELSE IF(@kategori = 'TABUNGAN')
	BEGIN
		INSERT INTO @listSelection SELECT * FROM @listTabungan 
	END
	ELSE
	BEGIN
		INSERT INTO @listSelection SELECT * FROM @listGiro 
		INSERT INTO @listSelection SELECT * FROM @listTabungan 
	END
END
ELSE
BEGIN
	INSERT @listSelection(id) VALUES(@kodeproduk);
END;

DECLARE @AccData TABLE (
account_no VARCHAR(20)
, alt_acct_id VARCHAR(20)
, customer_no VARCHAR(30)
, name_1 VARCHAR(100)
, account_title_1 VARCHAR(50)
, category VARCHAR(50)
, [description] VARCHAR(50)
, co_code VARCHAR(20)
, company_name VARCHAR(50)
);

WITH AccData AS
(
	SELECT 
		acc.account_no
		, acc.alt_acct_id
		, acc.customer_no
		, acc.account_title_1
		, acc.category
		, acc.co_code
		, acc.name_1
		, acc.[description]
		, acc.company_name
		--, bal.bal_date
		--, COALESCE(AVG(bal.online_actual_bal),0) AS AvgBal
	FROM 
	(
		SELECT 
		acct.account_no
		, acct.alt_acct_id
		, acct.customer_no
		, acct.account_title_1
		, acct.category
		, acct.co_code
		, c.name_1
		, ca.[description]
		, b.company_name
		FROM SQL_TEMENOS.DBO.ACCOUNT acct
		INNER JOIN SQL_TEMENOS.DBO.CUSTOMER c
			ON acct.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
		INNER JOIN SQL_TEMENOS.DBO.CATEGORY ca
			ON acct.category = ca.[@ID] COLLATE DATABASE_DEFAULT
		INNER JOIN SQL_TEMENOS.DBO.COMPANY b
			ON acct.co_code = b.[@ID] COLLATE DATABASE_DEFAULT
		WHERE category IN (SELECT * FROM @listSelection)
		AND acct.account_no NOT IN (SELECT [@ID] FROM SQL_TEMENOS.DBO.account_closed)
	) acc
	
)
INSERT INTO @AccData
SELECT 
a.account_no
, a.alt_acct_id
, a.customer_no
, a.name_1
, a.account_title_1
, a.category
, a.[description]
--, a.AvgBal
, a.co_code
, a.company_name
FROM AccData a;

SELECT
	acc.* 
	, COALESCE(AVG(bal.online_actual_bal),0) AS AvgBal
FROM @AccData acc
LEFT JOIN (
		SELECT * FROM SQL_TEMENOS.DBO.AccountBalance 
		WHERE batch_date BETWEEN @tanggal1 AND @tanggal2
		AND account_no IN(SELECT account_no FROM @AccData)
	) bal ON acc.account_no = bal.account_no
	--WHERE bal.batch_date BETWEEN @tanggal1 AND @tanggal2
	GROUP BY acc.account_no
		, acc.alt_acct_id
		, acc.customer_no
		, acc.account_title_1
		, acc.category
		, acc.co_code
		, acc.name_1
		, acc.[description]
		, acc.company_name


--SELECT 
--a.account_no AS 'Account number'
--, a.alt_acct_id AS 'Alt Account No'
--, a.customer_no AS 'CIF number'
--, a.name_1 AS 'CIF Name'
--, a.account_title_1 AS 'Account Name'
--, a.category AS 'Product Code'
--, a.[description] AS 'Product Description'
--, a.AvgBal AS 'Average Balance'
--, a.co_code AS 'Company ID'
--, a.company_name AS 'Company Name'
--FROM AccData a
--LEFT JOIN (
--		SELECT * FROM SQL_TEMENOS.DBO.AccountBalance 
--		WHERE batch_date BETWEEN @tanggal1 AND @tanggal2
--	) bal ON acc.account_no = bal.account_no
--	--WHERE bal.batch_date BETWEEN @tanggal1 AND @tanggal2
--	GROUP BY acc.account_no
--		, acc.alt_acct_id
--		, acc.customer_no
--		, acc.account_title_1
--		, acc.category
--		, acc.co_code
--		, acc.name_1
--		, acc.[description]
--		, acc.company_name
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Report_Saldo_Account_Rata2_TEST]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [SP_Report_Saldo_Account_Rata2] '05/01/2018','05/31/2018', 'TABUNGAN', '6001'
-- [SP_Report_Saldo_Account_Rata2] '05/01/2018','05/31/2018', 'GIRO', 'ALL'
-- =============================================
CREATE PROCEDURE [dbo].[SP_Report_Saldo_Account_Rata2_TEST]
	@tanggal1 date,
	@tanggal2 date,
	@kategori VARCHAR(10) = 'ALL',
	@kodeproduk VARCHAR(10) = 'ALL'
AS
BEGIN

DECLARE @listGiro TABLE (id VARCHAR(10));
INSERT @listGiro(id) VALUES(1001), (1002), (1003), (1004), (1005), (1006), (1007), (1008), (1009), (1021), (1102), (1103), (1104), (1105), (1501), (1502), (1503), (1504); 

DECLARE @listTabungan TABLE (id VARCHAR(10));
INSERT @listTabungan(id) VALUES(6001), (6002), (6003), (6004), (6005), (6006), (6007), (6008), (6011), (6012), (6013), (6014), (6017), (6501), (6502), (6503); 

--Table variable bikin lamaa
CREATE TABLE #tempListSelection  (id VARCHAR(10));
--DECLARE @listSelection TABLE (id VARCHAR(10));


IF(@kodeproduk = 'ALL' OR @kodeproduk IS NULL OR @kodeproduk = '')
BEGIN
	IF(@kategori = 'GIRO')
	BEGIN
		--INSERT INTO @listSelection SELECT * FROM @listGiro 
		INSERT INTO #tempListSelection SELECT * FROM @listGiro 
	END
	ELSE IF(@kategori = 'TABUNGAN')
	BEGIN
		--INSERT INTO @listSelection SELECT * FROM @listTabungan 
		INSERT INTO #tempListSelection SELECT * FROM @listTabungan 
	END
	ELSE
	BEGIN
		--INSERT INTO @listSelection SELECT * FROM @listGiro 
		--INSERT INTO @listSelection SELECT * FROM @listTabungan 
		INSERT INTO #tempListSelection SELECT * FROM @listGiro 
		INSERT INTO #tempListSelection SELECT * FROM @listTabungan 
	END
END
ELSE
BEGIN
	--INSERT @listSelection(id) VALUES(@kodeproduk);
	INSERT #tempListSelection(id) VALUES(@kodeproduk);
END;

--DECLARE 
--@_tanggal1 date = @tanggal1,
--@_tanggal2 date = @tanggal2

SELECT
	abal.account_no AS 'Account number'
	, abal.alt_acct_id AS 'Alt Account No'
	, abal.customer_no AS 'CIF number'
	, abal.account_title_1 AS 'CIF Name'
	--, c.name_1 AS 'CIF Name'
	, abal.account_title_1 AS 'Account Name'
	, abal.category AS 'Product Code'
	, ca.[description] AS 'Product Description'
	, COALESCE(abal.AvgBal,0) AS 'Average Balance'
	, abal.co_code AS 'Company ID'
	, b.company_name AS 'Company Name'
FROM
(
	SELECT 
		acct.category
		, acct.customer_no
		, alt_acct_id
		, acct.account_no
		, acct.account_title_1
		, co_code
		, AVG(acbl.online_actual_bal) AS AvgBal
	FROM
	(
		SELECT 
			account_no
			, alt_acct_id
			, customer_no
			, account_title_1
			, category
			, co_code
		FROM SQL_TEMENOS.DBO.ACCOUNT ac
		WHERE account_no NOT IN (SELECT [@ID] FROM SQL_TEMENOS.DBO.account_closed)
	) acct
	INNER JOIN #tempListSelection ls ON acct.category = ls.id
	LEFT JOIN SQL_TEMENOS.DBO.AccountBalance acbl ON acct.account_no = acbl.account_no 
	--AND batch_date BETWEEN @_tanggal1 AND @_tanggal2
	AND batch_date BETWEEN @tanggal1 AND @tanggal2
	GROUP BY 
		acct.category
		, acct.account_no
		, customer_no
		, account_title_1
		, alt_acct_id
		, co_code
) abal 
--INNER JOIN SQL_TEMENOS.DBO.CUSTOMER c
--	ON abal.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
INNER JOIN SQL_TEMENOS.DBO.CATEGORY ca
	ON abal.category = ca.[@ID] COLLATE DATABASE_DEFAULT
INNER JOIN SQL_TEMENOS.DBO.COMPANY b
	ON abal.co_code = b.[@ID] COLLATE DATABASE_DEFAULT


DROP TABLE #tempListSelection
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ReportPurchaseOrder]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================        
-- Author:  <Yadit>        
-- Create date: <02 Feb - 2018>        
-- Description: <Select Report purchase order>        
-- =============================================        
CREATE PROCEDURE [dbo].[SP_ReportPurchaseOrder]        
 -- Add the parameters for the stored procedure here        
 /*	
	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	20190203, jeni, penambahan perubahan filter dari poid ke pogroupid
*/
 @PONo VARCHAR(100)--,
 --@EndDate DATE,        
 --@jenis int,        
 --@cabang varchar(50)--,        
 --@no varchar(50)        
AS        
BEGIN        
 -- SET NOCOUNT ON added to prevent extra result sets from        
 -- interfering with SELECT statements.        
 SET NOCOUNT ON;        
        
  SELECT a.Id,
	a.EnquiryId,
	a.DetailBarangId,        
    a.POId,        
    a.PODate,  
    a.POGroupId,      
    a.CategoryId,
    a.PolaId,
    a.UnitId,
    a.TypeId,
    a.PaymentMethod,
    a.PaymentType,
    a.DPAmount,
    a.Quantity,
    a.Currency,
    a.NominalBarang,
    a.NominalPurchase,
    a.TotalPurchase,
    a.SupplierId,
    a.NilaiBuku,
    a.NikEmp,
    a.DeptId,
    a.VendorQuotationNo,
    a.VendorQuotationDate,
    a.VendorQuotationAmount,
    a.VendorInvoiceNo,
    a.VendorInvoiceDate,
    a.VendorInvoiceAmount,
    a.PODescription,
    a.ApproveBy2,
    a.ApproveDate2,
    a.StatusData2,
    a.CreateBy,
    a.CreateDate,
    a.UpdateBy,
    a.UpdateDate,
    a.ApproveBy,
    a.ApproveDate,
    a.RejectBy,
    a.RejectDate,
    a.RejectReason,
    a.CompanyId,
    a.BranchId,
    a.StatusData,
    a.IsDelete,
    a.UploadPO,
    a.Pajak,
    b.NoCif,        
    b.NoRekening,        
    b.NamaNasabah,                    
    b.JenisTabungan,
    JenisTabunganName = CASE WHEN JenisTabungan = '6501' THEN  'Tabungan Sipucuk'       
         WHEN JenisTabungan = '6502' THEN 'Tabungan Sipucuk Reward'       
         WHEN JenisTabungan = '6008' THEN 'Tabungan Hadiah Langsung'       
       END,         
    b.Cabang,    
    com.company_name,    
    b.TglBukaRekening,        
    b.StartDate,         
    b.MaturityDate,        
    b.Requester,    
    b.CatatanCabang,  
    b.KodePromosi, 
    c.KategoriBarang,         
    c.Merek,        
    c.TypeBarang, 
    QuantityBarang = c.Quantity, 
    c.Penalty,      
    c.Warna,
    b.PRId,
    b.PRDate,
    b.DraftPRId,
    b.DraftPRDate,
    b.RewardBudget,
    me.Nama
    , SupplierName = isup.Nm_Supp
    , AlamatSupplier = isup.Alamat1 + ' ' + isup.Alamat2 + ' ' + isup.Alamat3
    , UserInputer =  um.UserRealName
    , UserHead = um2.UserRealName                  
    --, do.DeliveryOrderDate
    , ISNULL(c.Keterangan,ctlg.Keterangan) AS Keterangan 
    , a.AdditionalInfoDetailItem
    , TelpPIC = CASE WHEN ISNULL(isup.Telp_PIC,'') = '' AND ISNULL(isup.HP_PIC,'') <> '' THEN
					isup.HP_PIC
					WHEN ISNULL(isup.Telp_PIC,'') <> '' AND ISNULL(isup.HP_PIC,'') = '' THEN
					isup.Telp_PIC
					WHEN ISNULL(isup.Telp_PIC,'') <> '' AND ISNULL(isup.HP_PIC,'') <> '' THEN
					isup.Telp_PIC + ', ' + isup.HP_PIC
					ELSE '' END     
                
   FROM SQL_FUNDING.dbo.PurchaseOrder a WITH(NOLOCK)        
   LEFT JOIN SQL_FUNDING.dbo.EnquiryTabunganInput b WITH(NOLOCK) ON a.EnquiryId = b.Id        
   LEFT JOIN SQL_FUNDING.dbo.DetailBarang c WITH(NOLOCK) ON c.Id = a.DetailBarangId
   LEFT JOIN SQL_TEMENOS.dbo.Company com WITH(NOLOCK) ON com.[@ID] = b.Cabang  COLLATE DATABASE_DEFAULT   
   LEFT JOIN SQL_MyPeople.dbo.MasterEmployee me WITH(NOLOCK) ON me.NIK = a.NikEmp 
   LEFT JOIN SQL_INVENTORY.dbo.InventorySupplier isup WITH(NOLOCK) ON isup.Supp_ID = a.SupplierId    
   LEFT JOIN SQL_USER.dbo.UserMaster um WITH(NOLOCK) ON um.Id = a.CreateBy COLLATE DATABASE_DEFAULT
   LEFT JOIN SQL_USER.dbo.UserMaster um2 WITH(NOLOCK) ON um2.Id = a.ApproveBy  COLLATE DATABASE_DEFAULT
   LEFT JOIN SQL_FUNDING.dbo.Katalog ctlg ON ctlg.Kode_Promo = c.PromotionCode AND ctlg.IsDelete = 0
   --LEFT JOIN SQL_FUNDING.dbo.DeliveryOrder do WITH(NOLOCK) ON do.PurchaseOrderId = a.POId 
--20190206, jeni, BEGIN
 --WHERE a.POId = @PONo
 WHERE a.POGroupId = @PONo
--20190206, jeni, END
      /*(CAST(a.PODate AS DATE) BETWEEN @StartDate AND @EndDate )        
		   AND b.JenisTabungan = @jenis         
		   AND (b.Cabang = @cabang OR @cabang = '')        		
		   AND a.IsDelete = 0*/
   /*AND a.StatusData2 <> 3 */        
  -- ORDER BY a.CreateDate desc      
         
END



GO
/****** Object:  StoredProcedure [dbo].[SP_SendEmail_MyFunding]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SendEmail_MyFunding]
	@Group VARCHAR(100),
	@DocumentNo VARCHAR(100),
	@Cabang VARCHAR(100),
	@DocumentDate DATE,
	@DocumentType VARCHAR(100),
	@JenisPembuatan VARCHAR(100),
	@Link VARCHAR(200)
AS
BEGIN
	DECLARE @cEmail VARCHAR(MAX), @EmailCC VARCHAR(MAX),@cEmailz VARCHAR(MAX), @EmailCCz VARCHAR(MAX)
	DECLARE @bodyText NVARCHAR(MAX),@cSubjectText VARCHAR(50), @stsapphris VARCHAR(10),
			@ID INT, @userInput VARCHAR(6)
		
    SELECT @cEmailz = REPLACE(COALESCE(@cEmailz + '; ', ''),' ','') + Email 
    FROM ParameterEmail
    WHERE [Group] = @Group  
		AND IsDelete = 0
		AND IsActive = 1
    
    SET @cEmailz = REPLACE(@cEmailz,'Head Cabang','Head Cabang ' + @Cabang)
    
    SET @cEmailz = REPLACE(@cEmailz,'Cabang','Cabang ' + @Cabang)
    
    SELECT @cEmail = REPLACE(COALESCE(@cEmail + '; ', ''),' ','') +  ISNULL(pe.Email, ss.Item) 
	FROM [SQL_TEMENOS].dbo.SplitString(@cEmailz, ';') ss
	LEFT JOIN ParameterEmail pe ON pe.[Group] = ss.Item AND pe.IsActive = 1 AND pe.IsDelete = 0
    
    SELECT @EmailCCz = REPLACE(COALESCE(@EmailCCz + '; ', ''),' ','') + Email
    FROM ParameterEmail
    WHERE [Group] = 'IT'    
    
    SELECT @EmailCC = REPLACE(COALESCE(@EmailCC + '; ', ''),' ','') +  ISNULL(pe.Email, ss.Item) 
	FROM [SQL_TEMENOS].dbo.SplitString(@EmailCCz, ';') ss
	LEFT JOIN ParameterEmail pe ON pe.[Group] = ss.Item	
        				
	--SET @cSubjectText = '[FLPP] New Debitur Found - '+CONVERT(Varchar(8),GETDATE(),112)
	SET @cSubjectText = 'Notification My Funding'
	SELECT @bodyText =    '<p>Dear Group Terkait' + /*+ @Group +*/ ',</p><br><br>' 
						+ '<p>Sekedar Informasi, terdapat permintaan ' + @JenisPembuatan + ', berdasarkan data Sebagai Berikut:</p><br>'
					    + '<table border="0">'
					    + '<tr><td>Cabang</td><td>: ' + @Cabang + '</td></tr>'
					    + '<tr><td>No Dokumen</td><td>: ' + @DocumentNo + '</td></tr>'
					    + '<tr><td>Jenis Dokumen</td><td>: ' + @DocumentType + '</td></tr>'
					    + '<tr><td>Tanggal Dokumen</td><td>: ' + CONVERT(VARCHAR,@DocumentDate) + '</td></tr>'
					    + '<tr><td>Jenis Permintaan</td><td>: ' + @JenisPembuatan + '</td></tr>'
					    + '</table border="0">'
					    + '<br><br><p>Dimohon permintaan ini segera di konfirmasi</p><br><br><br><p>Terima kasih</p><br><p>MyRewArd System Application</p><br><div class="btn btn-primary"><a href="' + @Link + '/">Klik disini </a></div>'
				    
	EXEC msdb.dbo.sp_send_dbmail
	@profile_name= 'IT Notification',
	@recipients	 = @cEmail,
	@copy_recipients = @EmailCC, 
	@subject	 = @cSubjectText,
	@body		 = @bodyText,
	@body_format = 'HTML'--,
	--@execute_query_database = 'SQL_PRODUCT'
	
	--@file_attachments= @cFileAttach
	select 1			
END



GO
/****** Object:  StoredProcedure [dbo].[SP_SendEmailReject_MyFunding]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SendEmailReject_MyFunding]
	@Group VARCHAR(100),
	@DocumentNo VARCHAR(100),
	@Cabang VARCHAR(100),
	@DocumentDate DATE,
	@DocumentType VARCHAR(100),
	@JenisPembuatan VARCHAR(100),
	@Link VARCHAR(200)
AS
BEGIN
	DECLARE @cEmail VARCHAR(MAX), @EmailCC VARCHAR(MAX),@cEmailz VARCHAR(MAX), @EmailCCz VARCHAR(MAX)
	DECLARE @bodyText NVARCHAR(MAX),@cSubjectText VARCHAR(50), @stsapphris VARCHAR(10),
			@ID INT, @userInput VARCHAR(6)
		
    SELECT @cEmailz = REPLACE(COALESCE(@cEmailz + '; ', ''),' ','') + Email 
    FROM ParameterEmail
    WHERE [Group] = @Group  
		AND IsDelete = 0
		AND IsActive = 1
    
    --SET @cEmailz = REPLACE(@cEmailz,'Head Cabang','Head Cabang ' + @Cabang)
    
    SET @cEmailz = REPLACE(@cEmailz,'Cabang','Cabang ' + @Cabang)
    
    SELECT @cEmail = REPLACE(COALESCE(@cEmail + '; ', ''),' ','') +  ISNULL(pe.Email, ss.Item) 
	FROM [SQL_TEMENOS].dbo.SplitString(@cEmailz, ';') ss
	LEFT JOIN ParameterEmail pe ON pe.[Group] = ss.Item AND pe.IsActive = 1 AND pe.IsDelete = 0
    
    SELECT @EmailCCz = REPLACE(COALESCE(@EmailCCz + '; ', ''),' ','') + Email
    FROM ParameterEmail
    WHERE [Group] = 'IT'    
    
    SELECT @EmailCC = REPLACE(COALESCE(@EmailCC + '; ', ''),' ','') +  ISNULL(pe.Email, ss.Item) 
	FROM [SQL_TEMENOS].dbo.SplitString(@EmailCCz, ';') ss
	LEFT JOIN ParameterEmail pe ON pe.[Group] = ss.Item	
        				
	--SET @cSubjectText = '[FLPP] New Debitur Found - '+CONVERT(Varchar(8),GETDATE(),112)
	SET @cSubjectText = 'Notification My Funding'
	SELECT @bodyText =    '<p>Dear Group Terkait' + /*+ @Group +*/ ',</p><br><br>' 
						+ '<p>Sekedar Informasi, terdapat hal ' + @JenisPembuatan + ', berdasarkan data Sebagai Berikut:</p><br>'
					    + '<table border="0">'
					    + '<tr><td>Cabang</td><td>: ' + @Cabang + '</td></tr>'
					    + '<tr><td>No Dokumen</td><td>: ' + @DocumentNo + '</td></tr>'
					    + '<tr><td>Jenis Dokumen</td><td>: ' + @DocumentType + '</td></tr>'
					    + '<tr><td>Tanggal Dokumen</td><td>: ' + CONVERT(VARCHAR,@DocumentDate) + '</td></tr>'
					    + '<tr><td>Jenis Permintaan</td><td>: ' + @JenisPembuatan + '</td></tr>'
					    + '</table border="0">'
					    + '<br><br><p>Dimohon hal ini segera ditindak lanjut kembali</p><br><br><br><p>Terima kasih</p><br><p>MyReward System Application</p><br><div class="btn btn-primary"><a href="' + @Link + '/">Klik disini </a></div>'
			
	
	EXEC msdb.dbo.sp_send_dbmail
	@profile_name= 'IT Notification',
	@recipients	 = 'eka.mahendra@bankmayora.co.id',--@cEmail,
	@copy_recipients = 'eka.mahendra@bankmayora.co.id',--@EmailCC, 
	@subject	 = @cSubjectText,
	@body		 = @bodyText,
	@body_format = 'HTML'--,
	--@execute_query_database = 'SQL_PRODUCT'
	
	insert into test 	    
	select 'IT Notification Dev', @cEmail,@EmailCC, @cSubjectText,@bodyText,'HTML'
	--@file_attachments= @cFileAttach
	select 1			
END



GO
/****** Object:  StoredProcedure [dbo].[SP_SISAPELUNASAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SP_SISAPELUNASAN] --'PL51110'
@id int
as
begin

	select sisa = ISNULL(TotalPurchase,0) - ISNULL(DPAmount,0)
	from dbo.PurchaseOrder with(nolock) where Id =  @id 
	
end

GO
/****** Object:  StoredProcedure [dbo].[SP_START_AUTO_PECADANGAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    --[SP_START_AUTO_PECADANGAN] 130
CREATE Procedure [dbo].[SP_START_AUTO_PECADANGAN]  --'40'--'22'    
 @POid INT  --= 40  
AS    
BEGIN    
DECLARE @TABLE TABLE (    
 NOMOR VARCHAR(50)    
)    
DECLARE @REQUESTID NVARCHAR(MAX),   
@Startdate Datetime,   
@maturityDate Datetime,   
@TotalPurchase decimal,   
@poDate Datetime,   
@totalMonth int,   
@amountPerBulan money  ,  
  
@NomBddPromosi money,   
@NomByBunga money,  
@NomKewajibanPajak Money,  
@NomKspHutang Money,  
  
@AccBddPromosi Varchar(100),   
@AccByBunga Varchar(100),  
@AccKewajibanPajak Varchar(100),  
@AccKspHutang Varchar(100),  
  
@AccNameBddPromosi Varchar(100),   
@AccNameByBunga Varchar(100),  
@AccNameKewajibanPajak Varchar(100),  
@AccNameKspHutang Varchar(100)  
  
--BddPromosi, KspHutang, KewPajak, RekPerantara, BiayaBunga  
Select @AccBddPromosi = a.Number, @AccNameBddPromosi = a.Deskripsi from dbo.fn_ListAccountPencadangan('BddPromosi') a  
Select @AccKspHutang = a.Number, @AccNameKspHutang = a.Deskripsi from dbo.fn_ListAccountPencadangan('KspHutang') a  
Select @AccKewajibanPajak = a.Number, @AccNameKewajibanPajak = a.Deskripsi from dbo.fn_ListAccountPencadangan('KewPajak') a  
Select @AccByBunga = a.Number, @AccNameByBunga = a.Deskripsi from dbo.fn_ListAccountPencadangan('BiayaBunga') a  
  
INSERT INTO @TABLE    
EXEC dbo.SP_GENERATE_NOMOR 'Pencadangan'    
SELECT @REQUESTID = NOMOR FROM @TABLE    
SELECT TOP 1 @poDate = po.PODate, @TotalPurchase = po.TotalPurchase, @Startdate = EQ.StartDate, @maturityDate = EQ.MaturityDate    
           FROM PurchaseOrder PO     
           left join EnquiryTabunganInput EQ ON EQ.Id = PO.EnquiryId    
           WHERE PO.Id = @POid    
           and PO.IsDelete != 1    
           and EQ.IsDelete != 1    
set @totalMonth = dbo.FullMonthsSeparation(@Startdate,@maturityDate)    
set @amountPerBulan  = (@TotalPurchase * 1.2) / @totalMonth    

if @Startdate is null
begin
   set @Startdate = GETDATE()  
end
if @maturityDate is null
begin
   set @maturityDate = GETDATE()
end
  
DECLARE @JUMLAHBULANLEWAT INT  = dbo.FullMonthsSeparation(@Startdate,GETDATE()) 
Set @NomKspHutang = @TotalPurchase  
Set @NomKewajibanPajak = (@TotalPurchase * 0.2)  
Set @NomByBunga = @JUMLAHBULANLEWAT * @amountPerBulan
Set @NomBddPromosi = (@TotalPurchase * 1.2) - @NomByBunga  
Select @JUMLAHBULANLEWAT, @NomBddPromosi bddpromo, @NomByBunga nombybynga, @NomKewajibanPajak kewajiabanpajak, @NomKspHutang ksphutang, @amountPerBulan amountperbulan, @TotalPurchase TotalPurchase, @totalMonth totammonth, @Startdate Startdate, @maturityDate Maturitydate   
--select @JUMLAHBULANLEWAT jmllewat, @amountPerBulan amtperbln, @NominalBarang nom,  @totalMonth total, @NomBddPromosi BddPromosi, @NomByBunga BiayaBunga, @NomKewajibanPajak KewajibanPajak, @NomKspHutang KspHutang,  
--@AccBddPromosi ,   
--@AccByBunga ,  
--@AccKewajibanPajak ,  
--@AccKspHutang ,  
--@AccNameBddPromosi ,   
--@AccNameByBunga ,  
--@AccNameKewajibanPajak ,  
--@AccNameKspHutang   
  INSERT INTO [SQL_FUNDING].[dbo].[Pencadangan]    
           ([RequestId]    
           ,[POId]    
           ,[JPId]    
           ,[PecadanganDate]    
           ,[PembalikanDate]    
           ,[CreateBy]    
           ,[CreateDate]    
           ,[UpdateBy]    
           ,[UpdateDate]    
           ,[ApproveBy]    
           ,[ApproveDate]    
           ,[RejectBy]    
           ,[RejectDate]    
           ,[RejectReason]    
           ,[CompanyId]    
           ,[BranchId]    
           ,[StatusData]    
           ,[IsDelete]    
           ,[NominalPencadangan]    
           ,[startDate]    
           ,[maturityDate])    
     SELECT TOP 1    
           @REQUESTID    
           ,@POid  --<POId, int,>    
           ,null  --<JPId, int,>    
           ,@poDate  --<PecadanganDate, datetime,>    
           ,null  --<PembalikanDate, datetime,>    
           ,'System' --<CreateBy, nvarchar(max),>    
           ,GETDATE() --<CreateDate, datetime,>    
           ,null  --<UpdateBy, nvarchar(max),>    
           ,null  --<UpdateDate, datetime,>    
           ,null  --<ApproveBy, nvarchar(max),>    
           ,null  --<ApproveDate, datetime,>    
           ,null  --<RejectBy, nvarchar(max),>    
           ,null  --<RejectDate, datetime,>    
           ,null  --<RejectReason, nvarchar(max),>    
           ,null  --<CompanyId, int,>    
           ,null  --<BranchId, int,>    
           ,1   --<StatusData, int,>    
           ,0   --<IsDelete, bit,>)    
           ,ISNULL(@amountPerBulan , 0)  
           ,@Startdate    
           ,@maturityDate    
  
IF ( @JUMLAHBULANLEWAT >= 1)    
 BEGIN    
 declare @reffcode varchar(50)= @REQUESTID + '001', @pecadanganId int = SCOPE_IDENTITY()    
  INSERT INTO [SQL_FUNDING].[dbo].[PencadanganTransaksi]    
      ([PencadanganId]    
      ,[Value_date]    
      ,[ref_code]    
      ,[BranchId]    
      ,[BranchName]    
      ,[IntAccCategoryId]    
      ,[IntAccCategoryName]    
      ,[DebitKredit]    
      ,[Narative]    
      ,[Currency]    
      ,[Amount]    
      ,[CreateBy]    
      ,[CreateDate]    
      ,[UpdateBy]    
      ,[UpdateDate]    
      ,[ApproveBy]    
      ,[ApproveDate]    
      ,[RejectBy]    
      ,[RejectDate]    
      ,[RejectReason]    
      ,[CompanyId]    
      ,[StatusData]    
      ,[IsDelete])    
   VALUES  
  
      ( @pecadanganId--<PencadanganId, int,>    
      , GETDATE() --<Value_date, datetime,>    
      , @reffcode --<ref_code, nvarchar(max),>    
      ,'ID0010100' --<BranchId, nvarchar(max),>    
      ,'KC TOMANG' --<BranchName, nvarchar(max),>    
      , @AccBddPromosi--<IntAccCategoryId, nvarchar(max),>    
      , @AccNameBddPromosi--<IntAccCategoryName, nvarchar(max),>    
      , 0 --<DebitKredit, int,>    
      , @AccNameBddPromosi--<Narative, nvarchar(max),>    
      , 'IDR'--<Currency, nvarchar(max),>    
      , @NomBddPromosi--<Amount, decimal(18,2),>    
      , 'System' --<CreateBy, nvarchar(max),>    
      , GETDATE()--<CreateDate, datetime,>    
      ,null--<UpdateBy, nvarchar(max),>    
      ,null--<UpdateDate, datetime,>    
      ,null--<ApproveBy, nvarchar(max),>    
      ,null--<ApproveDate, datetime,>    
      ,null--<RejectBy, nvarchar(max),>    
      ,null--<RejectDate, datetime,>    
      ,null--<RejectReason, nvarchar(max),>    
      ,null--<CompanyId, int,>    
      ,1--<StatusData, int,>    
      ,0)--<IsDelete, bit,>)    
  
      ,( @pecadanganId--<PencadanganId, int,>    
      , GETDATE() --<Value_date, datetime,>    
      , @reffcode --<ref_code, nvarchar(max),>    
      ,'ID0010100' --<BranchId, nvarchar(max),>    
      ,'KC TOMANG' --<BranchName, nvarchar(max),>    
      , @AccByBunga--<IntAccCategoryId, nvarchar(max),>    
      , @AccNameByBunga--<IntAccCategoryName, nvarchar(max),>    
      , 0 --<DebitKredit, int,>    
      , @AccNameByBunga--<Narative, nvarchar(max),>    
      , 'IDR'--<Currency, nvarchar(max),>    
      , @NomByBunga--<Amount, decimal(18,2),>    
      , 'System' --<CreateBy, nvarchar(max),>    
      , GETDATE()--<CreateDate, datetime,>    
      ,null--<UpdateBy, nvarchar(max),>    
      ,null--<UpdateDate, datetime,>    
      ,null--<ApproveBy, nvarchar(max),>    
      ,null--<ApproveDate, datetime,>    
      ,null--<RejectBy, nvarchar(max),>    
      ,null--<RejectDate, datetime,>    
      ,null--<RejectReason, nvarchar(max),>    
      ,null--<CompanyId, int,>    
      ,1--<StatusData, int,>    
      ,0)--<IsDelete, bit,>)    
  
      ,( @pecadanganId--<PencadanganId, int,>    
      , GETDATE() --<Value_date, datetime,>    
      , @reffcode --<ref_code, nvarchar(max),>    
      ,'ID0010100' --<BranchId, nvarchar(max),>    
      ,'KC TOMANG' --<BranchName, nvarchar(max),>    
      , @AccKspHutang--<IntAccCategoryId, nvarchar(max),>    
      , @AccNameKspHutang--<IntAccCategoryName, nvarchar(max),>    
      , 1 --<DebitKredit, int,>    
      , @AccNameKspHutang--<Narative, nvarchar(max),>    
      , 'IDR'--<Currency, nvarchar(max),>    
      , @NomKspHutang--<Amount, decimal(18,2),>    
      , 'System' --<CreateBy, nvarchar(max),>    
      , GETDATE()--<CreateDate, datetime,>    
      ,null--<UpdateBy, nvarchar(max),>    
      ,null--<UpdateDate, datetime,>    
      ,null--<ApproveBy, nvarchar(max),>    
      ,null--<ApproveDate, datetime,>    
      ,null--<RejectBy, nvarchar(max),>    
      ,null--<RejectDate, datetime,>    
      ,null--<RejectReason, nvarchar(max),>    
      ,null--<CompanyId, int,>    
      ,1--<StatusData, int,>    
      ,0)    
  
      ,( @pecadanganId--<PencadanganId, int,>    
      , GETDATE() --<Value_date, datetime,>    
      , @reffcode --<ref_code, nvarchar(max),>    
      ,'ID0010100' --<BranchId, nvarchar(max),>    
      ,'KC TOMANG' --<BranchName, nvarchar(max),>    
      , @AccKewajibanPajak--<IntAccCategoryId, nvarchar(max),>    
      , @AccNameKewajibanPajak--<IntAccCategoryName, nvarchar(max),>    
      , 1 --<DebitKredit, int,>    
      , @AccNameKewajibanPajak--<Narative, nvarchar(max),>    
      , 'IDR'--<Currency, nvarchar(max),>    
      , @NomKewajibanPajak--<Amount, decimal(18,2),>    
      , 'System' --<CreateBy, nvarchar(max),>    
      , GETDATE()--<CreateDate, datetime,>    
      ,null--<UpdateBy, nvarchar(max),>    
      ,null--<UpdateDate, datetime,>    
      ,null--<ApproveBy, nvarchar(max),>    
      ,null--<ApproveDate, datetime,>    
      ,null--<RejectBy, nvarchar(max),>    
      ,null--<RejectDate, datetime,>    
      ,null--<RejectReason, nvarchar(max),>    
      ,null--<CompanyId, int,>    
      ,1--<StatusData, int,>    
      ,0)    
 END    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_STOP_AUTO_PECADANGAN]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE Procedure [dbo].[SP_STOP_AUTO_PECADANGAN] --'17'  
@PRid nvarchar(50)  
AS  
BEGIN  
DECLARE @POid INT, @JPid nvarchar(50), @prid_ int  

SELECT @POid = PR.PurchaseOrderId, @JPid = pr.PelunasanId, @prid_ = pr.Id FROM PurchaseReceive PR WHERE PR.PurchaseReceiveId = @PRid  
UPDATE Pencadangan set JPId = jp.Id, PembalikanDate = jp.ValueDate from JurnalPelunasan jp where jp.PCRId = @prid_ and Pencadangan.POId = @POid  
Declare @reffCode varchar(50), @Pid int, @amount MONEY  
Declare @branchId varchar (50) = 'ID0010100',  
  @branchName varchar(50) = 'KC TOMANG'    
  
DECLARE   
@AccRekPerantara Varchar(100),  
@AccKspHutang Varchar(100),  
  
@AccNameRekPerantara  Varchar(100),  
@AccNameKspHutang Varchar(100)  
  
--BddPromosi, KspHutang, KewPajak, RekPerantara, BiayaBunga  
Select @AccRekPerantara = a.Number, @AccNameRekPerantara = a.Deskripsi from dbo.fn_ListAccountPencadangan('RekPerantara') a  
Select @AccKspHutang = a.Number, @AccNameKspHutang = a.Deskripsi from dbo.fn_ListAccountPencadangan('KspHutang') a  
  
--Select top 1* from dbo.fn_ListAccountPencadangan('BddPromosi') a    
--union all  
--Select top 1* from dbo.fn_ListAccountPencadangan('KspHutang') a    
--union all  
--Select top 1* from dbo.fn_ListAccountPencadangan('KewPajak') a    
--union all  
--Select top 1* from dbo.fn_ListAccountPencadangan('BiayaBunga') a    
  --SELECT   
  --         p.Id,  
  --         p.RequestId + '999',  
  --         PT.Amount  
  --FROM Pencadangan P  
  --LEFT JOIN PencadanganTransaksi PT ON P.Id = pt.PencadanganId and IntAccCategoryId = 'IDR1505100010100'  
  --where p.POId = 40 --and pt.DebitKredit = 0  
  ----group by p.Id, p.RequestId  
  
SELECT   
           @Pid = p.Id,  
           @reffCode = p.RequestId + '999',  
           @amount = SUM(ISNULL(PT.Amount,0))  
  FROM Pencadangan P  
  LEFT JOIN PencadanganTransaksi PT ON P.Id = pt.PencadanganId and IntAccCategoryId = 'IDR1505100010100'  
  where p.POId = @POid --and pt.DebitKredit = 0  
  group by p.Id, p.RequestId  
INSERT INTO [SQL_FUNDING].[dbo].[PencadanganTransaksi]  
           ([PencadanganId]  
           ,[Value_date]  
           ,[ref_code]  
           ,[BranchId]  
           ,[BranchName]  
           ,[IntAccCategoryId]  
           ,[IntAccCategoryName]  
           ,[DebitKredit]  
           ,[Narative]  
           ,[Currency]  
           ,[Amount]  
           ,[CreateBy]  
           ,[CreateDate]  
           ,[UpdateBy]  
           ,[UpdateDate]  
           ,[ApproveBy]  
           ,[ApproveDate]  
           ,[RejectBy]  
           ,[RejectDate]  
           ,[RejectReason]  
           ,[CompanyId]  
           ,[StatusData]  
           ,[IsDelete])  
     Values(   
           @Pid--(<PencadanganId, int,>  
           , GETDATE() --<Value_date, datetime,>  
           , @reffCode --<ref_code, nvarchar(max),>  
           , @branchId--<BranchId, nvarchar(max),>  
           , @branchName--<BranchName, nvarchar(max),>  
           , @AccKspHutang--<IntAccCategoryId, nvarchar(max),>  
           , @AccNameKspHutang--<IntAccCategoryName, nvarchar(max),>  
           , 0--<DebitKredit, int,>  
           , 'Pembalikan'--<Narative, nvarchar(max),>  
           , 'IDR'--<Currency, nvarchar(max),>  
           , @amount--<Amount, decimal(18,2),>  
           , 'SYSTEM'--<CreateBy, nvarchar(max),>  
           , GETDATE()--<CreateDate, datetime,>  
           , null--<UpdateBy, nvarchar(max),>  
           , null--<UpdateDate, datetime,>  
           , null--<ApproveBy, nvarchar(max),>  
           , null--<ApproveDate, datetime,>  
           , null--<RejectBy, nvarchar(max),>  
           , null--<RejectDate, datetime,>  
           , null--<RejectReason, nvarchar(max),>  
           , null--<CompanyId, int,>  
           , 1--<StatusData, int,>  
           , 0--<IsDelete, bit,>)  
           ),(   
           @Pid--(<PencadanganId, int,>  
           , GETDATE() --<Value_date, datetime,>  
           , @reffCode --<ref_code, nvarchar(max),>  
           , @branchId--<BranchId, nvarchar(max),>  
           , @branchName--<BranchName, nvarchar(max),>  
           , @AccRekPerantara --<IntAccCategoryId, nvarchar(max),>  
           , @AccNameRekPerantara--<IntAccCategoryName, nvarchar(max),>  
           , 1--<DebitKredit, int,>  
           , 'Pembalikan'--<Narative, nvarchar(max),>  
           , 'IDR'--<Currency, nvarchar(max),>  
           , @amount--<Amount, decimal(18,2),>  
           , 'SYSTEM'--<CreateBy, nvarchar(max),>  
           , GETDATE()--<CreateDate, datetime,>  
           , null--<UpdateBy, nvarchar(max),>  
           , null--<UpdateDate, datetime,>  
           , null--<ApproveBy, nvarchar(max),>  
           , null--<ApproveDate, datetime,>  
           , null--<RejectBy, nvarchar(max),>  
           , null--<RejectDate, datetime,>  
           , null--<RejectReason, nvarchar(max),>  
           , null--<CompanyId, int,>  
           , 1--<StatusData, int,>  
           , 0--<IsDelete, bit,>)  
           )  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_DetailBarang_PR]    Script Date: 2020-11-26 09:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Eka>
-- Create date: <2020-07-28>
-- Description:	<Update Quantity>

CREATE PROCEDURE [dbo].[SP_Update_DetailBarang_PR]
 @id int
 ,@quantity int

AS
BEGIN
	SET NOCOUNT ON

  UPDATE [SQL_FUNDING].[dbo].[DetailBarang] set
  [Quantity] = @quantity
  where id = @id
  
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MappingPl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MappingPl'
GO
