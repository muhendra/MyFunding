USE [SQL_Statement]
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertMonth]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[ConvertMonth] 
(	
	-- Add the parameters for the function here
	@param1 varchar(12) 
)
RETURNS varchar(20) 
AS
BEGIN 
		DECLARE @namedate varchar(20)
	 
		IF  substring(@param1,5,2) = '01'
			SET @namedate = 'JANUARI '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '02'
			SET @namedate = 'FEBRUARI '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '03'
			SET @namedate = 'MARET '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '04'
			SET @namedate = 'APRIL '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '05'
			SET @namedate = 'MEI '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '06'
			SET @namedate = 'JUNI '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '07'
			SET @namedate = 'JULI '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '08'
			SET @namedate = 'AGUSTUS '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '09'
			SET @namedate = 'SEPTEMBER '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '10'
			SET @namedate = 'OKTOBER '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '11'
			SET @namedate = 'NOVEMBER '+substring(@param1,1,4)
		ELSE IF  substring(@param1,5,2) = '12'
			SET @namedate = 'DESEMBER '+substring(@param1,1,4)
	RETURN @namedate
END

GO
/****** Object:  UserDefinedFunction [dbo].[ConvertPeriodToMont]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
--SELECT dbo.ConvertPeriodToMont('JANUARI 2018')
-- =============================================
CREATE FUNCTION [dbo].[ConvertPeriodToMont]
(
	-- Add the parameters for the function here
	@param1 varchar(255) 
)
RETURNS varchar(255) 
AS
BEGIN
	-- Declare the return variable here
	DECLARE @namedate varchar(255)

	-- Add the T-SQL statements to compute the return value here
		IF  @param1 LIKE '%JANUARI%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-01'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-01'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%FEBRUARI%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-02'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-02'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%MARET%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-03'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-03'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%APRIL%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-04'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-04'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%MEI%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-05'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-05'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%JUNI%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-06'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-06'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%JULI%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-07'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-07'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%AGUSTUS%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-08'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-08'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%SEPTEMBER%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-09'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-09'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%OKTOBER%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-10'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-10'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%NOVEMBER%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-11'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-11'+'-01'))+1,-1),106)
		ELSE IF  @param1 LIKE '%DESEMBER%'
			SET @namedate = CONVERT(VARCHAR,CONVERT(DATE,RIGHT(@param1,4)+'-12'+'-01'),106)+' / ' + CONVERT(VARCHAR,DATEADD(mm,DATEDIFF(mm,0,CONVERT(DATE,RIGHT(@param1,4)+'-12'+'-01'))+1,-1),106)
	RETURN @namedate

END



GO
/****** Object:  UserDefinedFunction [dbo].[fn_indonesian_date]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- SELECT [dbo].[fn_indonesian_date]('1990-12-01')
-- =============================================
CREATE FUNCTION [dbo].[fn_indonesian_date]
(
	@date date
)

RETURNS varchar(50)

AS
BEGIN

	DECLARE @tanggal varchar(50)
	declare @month int
	
	select @month = month(@date)
	
	if @month = 1
		SELECT @tanggal =  ' JANUARI ' + CONVERT(varchar(4),year(@date))
	
	else if @month = 2
		SELECT @tanggal =  ' FEBRUARI ' + CONVERT(varchar(4),year(@date))

	else if @month = 3
		SELECT @tanggal =  ' MARET ' + CONVERT(varchar(4),year(@date))

	else if @month = 4
		SELECT @tanggal =  ' APRIL ' + CONVERT(varchar(4),year(@date))

	else if @month = 5
		SELECT @tanggal =  ' MEI ' + CONVERT(varchar(4),year(@date))

	else if @month = 6
		SELECT @tanggal =  ' JUNI ' + CONVERT(varchar(4),year(@date))

	else if @month = 7
		SELECT @tanggal =  ' JULI ' + CONVERT(varchar(4),year(@date))

	else if @month = 8
		SELECT @tanggal =  ' AGUSTUS ' + CONVERT(varchar(4),year(@date))

	else if @month = 9
		SELECT @tanggal =  ' SEPTEMBER ' + CONVERT(varchar(4),year(@date))

	else if @month = 10
		SELECT @tanggal =  ' OKTOBER ' + CONVERT(varchar(4),year(@date))

	else if @month = 11
		SELECT @tanggal =  ' NOVEMBER ' + CONVERT(varchar(4),year(@date))

	else if @month = 12
		SELECT @tanggal =  ' DESEMBER ' + CONVERT(varchar(4),year(@date))
	
	RETURN @tanggal

END
GO
/****** Object:  UserDefinedFunction [dbo].[fnAppEmailCheck]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- SELECT [dbo].[fn_indonesian_date]('1990-12-01')
-- =============================================
CREATE FUNCTION [dbo].[fnAppEmailCheck]
(
	@email VARCHAR(255) 
)

RETURNS bit 

AS
BEGIN
 
     DECLARE @valid bit  
     IF @email IS NOT NULL   
          SET @email = LOWER(@email)  
          SET @valid = 0  
          IF @email like '[a-z,0-9,_,-]%@[a-z,0-9,_,-]%.[a-z][a-z]%'  
             AND LEN(@email) = LEN(dbo.fnAppStripNonEmail(@email))  
             AND @email NOT like '%@%@%'  
             AND CHARINDEX('.@',@email) = 0  
             AND CHARINDEX('..',@email) = 0  
             AND CHARINDEX(',',@email) = 0  
             AND CHARINDEX(' ',@email) = 0 
             AND RIGHT(@email,1) between 'a' AND 'z'  
               SET @valid=1  
     RETURN @valid  
END  


GO
/****** Object:  UserDefinedFunction [dbo].[fnAppStripNonEmail]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- SELECT [dbo].[fnAppStripNonEmail]
-- =============================================
CREATE FUNCTION [dbo].[fnAppStripNonEmail]
(
@Temp VarChar(1000)
)

Returns VarChar(1000)

AS
BEGIN

    Declare @KeepValues as varchar(50)
    Set @KeepValues = '%[^a-z,0-9,_,@,.,-]%'
    While PatIndex(@KeepValues, @Temp) > 0
        Set @Temp = Stuff(@Temp, PatIndex(@KeepValues, @Temp), 1, '')

    Return @Temp
END
GO
/****** Object:  UserDefinedFunction [dbo].[parseJSON]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[parseJSON]( 
/*
	CreateBy	: Jeni
	CreateDate	: 20201007
	Objective	: Parse Json

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
	Notes:
		
*/
@JSON NVARCHAR(MAX)

)

RETURNS @hierarchy TABLE
	  (
	   element_id INT IDENTITY(1, 1) NOT NULL, /* internal surrogate primary key gives the order of parsing and the list order */
	   sequenceNo [int] NULL, /* the place in the sequence for the element */
	   parent_ID INT,/* if the element has a parent then it is in this column. The document is the ultimate parent, so you can get the structure from recursing from the document */
	   Object_ID INT,/* each list or object has an object id. This ties all elements to a parent. Lists are treated as objects here */
	   NAME NVARCHAR(2000),/* the name of the object */
	   StringValue NVARCHAR(MAX) NOT NULL,/*the string representation of the value of the element. */
	   ValueType VARCHAR(10) NOT null /* the declared type of the value represented as a string in StringValue*/
	  )
	AS
	BEGIN
	  DECLARE
	    @FirstObject INT, --the index of the first open bracket found in the JSON string
	    @OpenDelimiter INT,--the index of the next open bracket found in the JSON string
	    @NextOpenDelimiter INT,--the index of subsequent open bracket found in the JSON string
	    @NextCloseDelimiter INT,--the index of subsequent close bracket found in the JSON string
	    @Type NVARCHAR(10),--whether it denotes an object or an array
	    @NextCloseDelimiterChar CHAR(1),--either a '}' or a ']'
	    @Contents NVARCHAR(MAX), --the unparsed contents of the bracketed expression
	    @Start INT, --index of the start of the token that you are parsing
	    @end INT,--index of the end of the token that you are parsing
	    @param INT,--the parameter at the end of the next Object/Array token
	    @EndOfName INT,--the index of the start of the parameter at end of Object/Array token
	    @token NVARCHAR(200),--either a string or object
	    @value NVARCHAR(MAX), -- the value as a string
	    @SequenceNo int, -- the sequence number within a list
	    @name NVARCHAR(200), --the name as a string
	    @parent_ID INT,--the next parent ID to allocate
	    @lenJSON INT,--the current length of the JSON String
	    @characters NCHAR(36),--used to convert hex to decimal
	    @result BIGINT,--the value of the hex symbol being parsed
	    @index SMALLINT,--used for parsing the hex value
	    @Escape INT --the index of the next escape character
	    
	  DECLARE @Strings TABLE /* in this temporary table we keep all strings, even the names of the elements, since they are 'escaped' in a different way, and may contain, unescaped, brackets denoting objects or lists. These are replaced in the JSON string by
 tokens representing the string */
	    (
	     String_ID INT IDENTITY(1, 1),
	     StringValue NVARCHAR(MAX)
	    )
	  SELECT--initialise the characters to convert hex to ascii
	    @characters='0123456789abcdefghijklmnopqrstuvwxyz',
	    @SequenceNo=0, --set the sequence no. to something sensible.
	  /* firstly we process all strings. This is done because [{} and ] aren't escaped in strings, which complicates an iterative parse. */
	    @parent_ID=0;
	  WHILE 1=1 --forever until there is nothing more to do
	    BEGIN
	      SELECT
	        @start=PATINDEX('%[^a-zA-Z]["]%', @json collate SQL_Latin1_General_CP850_Bin);--next delimited string
	      IF @start=0 BREAK --no more so drop through the WHILE loop
	      IF SUBSTRING(@json, @start+1, 1)='"' 
	        BEGIN --Delimited Name
	          SET @start=@Start+1;
	          SET @end=PATINDEX('%[^\]["]%', RIGHT(@json, LEN(@json+'|')-@start) collate SQL_Latin1_General_CP850_Bin);
	        END
	      IF @end=0 --no end delimiter to last string
	        BREAK --no more
	      SELECT @token=SUBSTRING(@json, @start+1, @end-1)
	      --now put in the escaped control characters
	      SELECT @token=REPLACE(@token, FROMString, TOString)
	      FROM
	        (SELECT
	          '\"' AS FromString, '"' AS ToString
	         UNION ALL SELECT '\\', '\'
	         UNION ALL SELECT '\/', '/'
	       UNION ALL SELECT '\b', CHAR(08)
	         UNION ALL SELECT '\f', CHAR(12)
	         UNION ALL SELECT '\n', CHAR(10)
	         UNION ALL SELECT '\r', CHAR(13)
	         UNION ALL SELECT '\t', CHAR(09)
	        ) substitutions
	      SELECT @result=0, @escape=1
	  --Begin to take out any hex escape codes
	      WHILE @escape>0
	        BEGIN
	          SELECT @index=0,
	          --find the next hex escape sequence
	          @escape=PATINDEX('%\x[0-9a-f][0-9a-f][0-9a-f][0-9a-f]%', @token collate SQL_Latin1_General_CP850_Bin)
	          IF @escape>0 --if there is one
	            BEGIN
	              WHILE @index<4 --there are always four digits to a \x sequence   
	                BEGIN
	                  SELECT --determine its value
	                    @result=@result+POWER(16, @index)
	                    *(CHARINDEX(SUBSTRING(@token, @escape+2+3-@index, 1),
	                                @characters)-1), @index=@index+1 ;
	         
	                END
	                -- and replace the hex sequence by its unicode value
	              SELECT @token=STUFF(@token, @escape, 6, NCHAR(@result))
	            END
	        END
	      --now store the string away 
	      INSERT INTO @Strings (StringValue) SELECT @token
	      -- and replace the string with a token
	      SELECT @JSON=STUFF(@json, @start, @end+1,
	                    '@string'+CONVERT(NVARCHAR(5), @@identity))
	    END
	  -- all strings are now removed. Now we find the first leaf.  
	  WHILE 1=1  --forever until there is nothing more to do
	  BEGIN
	 
	  SELECT @parent_ID=@parent_ID+1
	  --find the first object or list by looking for the open bracket
	  SELECT @FirstObject=PATINDEX('%[{[[]%', @json collate SQL_Latin1_General_CP850_Bin)--object or array
	  IF @FirstObject = 0 BREAK
	  IF (SUBSTRING(@json, @FirstObject, 1)='{') 
	    SELECT @NextCloseDelimiterChar='}', @type='object'
	  ELSE 
	    SELECT @NextCloseDelimiterChar=']', @type='array'
	  SELECT @OpenDelimiter=@firstObject
	  WHILE 1=1 --find the innermost object or list...
	    BEGIN
	      SELECT
	        @lenJSON=LEN(@JSON+'|')-1
	  --find the matching close-delimiter proceeding after the open-delimiter
	      SELECT
	        @NextCloseDelimiter=CHARINDEX(@NextCloseDelimiterChar, @json,
	                                      @OpenDelimiter+1)
	  --is there an intervening open-delimiter of either type
	      SELECT @NextOpenDelimiter=PATINDEX('%[{[[]%',
	             RIGHT(@json, @lenJSON-@OpenDelimiter)collate SQL_Latin1_General_CP850_Bin)--object
	      IF @NextOpenDelimiter=0 
	        BREAK
	      SELECT @NextOpenDelimiter=@NextOpenDelimiter+@OpenDelimiter
	      IF @NextCloseDelimiter<@NextOpenDelimiter 
	        BREAK
	      IF SUBSTRING(@json, @NextOpenDelimiter, 1)='{' 
	        SELECT @NextCloseDelimiterChar='}', @type='object'
	      ELSE 
	        SELECT @NextCloseDelimiterChar=']', @type='array'
	      SELECT @OpenDelimiter=@NextOpenDelimiter
	    END
	  ---and parse out the list or name/value pairs
	  SELECT
	    @contents=SUBSTRING(@json, @OpenDelimiter+1,
	                        @NextCloseDelimiter-@OpenDelimiter-1)
	  SELECT
	    @JSON=STUFF(@json, @OpenDelimiter,
	                @NextCloseDelimiter-@OpenDelimiter+1,
	                '@'+@type+CONVERT(NVARCHAR(5), @parent_ID))
	  WHILE (PATINDEX('%[A-Za-z0-9@+.e]%', @contents collate SQL_Latin1_General_CP850_Bin))<>0 
	    BEGIN
	      IF @Type='Object' --it will be a 0-n list containing a string followed by a string, number,boolean, or null
	        BEGIN
	          SELECT
	            @SequenceNo=0,@end=CHARINDEX(':', ' '+@contents)--if there is anything, it will be a string-based name.
	          SELECT  @start=PATINDEX('%[^A-Za-z@][@]%', ' '+@contents collate SQL_Latin1_General_CP850_Bin)--AAAAAAAA
	          SELECT @token=SUBSTRING(' '+@contents, @start+1, @End-@Start-1),
	            @endofname=PATINDEX('%[0-9]%', @token collate SQL_Latin1_General_CP850_Bin),
	            @param=RIGHT(@token, LEN(@token)-@endofname+1)
	          SELECT
	            @token=LEFT(@token, @endofname-1),
	            @Contents=RIGHT(' '+@contents, LEN(' '+@contents+'|')-@end-1)
	          SELECT  @name=stringvalue FROM @strings
	            WHERE string_id=@param --fetch the name
	        END
	      ELSE 
	        SELECT @Name=null,@SequenceNo=@SequenceNo+1 
	      SELECT
	        @end=CHARINDEX(',', @contents)-- a string-token, object-token, list-token, number,boolean, or null
                IF @end=0
	        --HR Engineering notation bugfix start
	          IF ISNUMERIC(@contents) = 1
		    SELECT @end = LEN(@contents) + 1
	          Else
	        --HR Engineering notation bugfix end 
		  SELECT  @end=PATINDEX('%[A-Za-z0-9@+.e][^A-Za-z0-9@+.e]%', @contents+' ' collate SQL_Latin1_General_CP850_Bin) + 1
	       SELECT
	        @start=PATINDEX('%[^A-Za-z0-9@+.e][A-Za-z0-9@+.e]%', ' '+@contents collate SQL_Latin1_General_CP850_Bin)
	      --select @start,@end, LEN(@contents+'|'), @contents  
	      SELECT
	        @Value=RTRIM(SUBSTRING(@contents, @start, @End-@Start)),
	        @Contents=RIGHT(@contents+' ', LEN(@contents+'|')-@end)
	      IF SUBSTRING(@value, 1, 7)='@object' 
	        INSERT INTO @hierarchy
	          (NAME, SequenceNo, parent_ID, StringValue, Object_ID, ValueType)
	          SELECT @name, @SequenceNo, @parent_ID, SUBSTRING(@value, 8, 5),
	            SUBSTRING(@value, 8, 5), 'object' 
	      ELSE 
	        IF SUBSTRING(@value, 1, 6)='@array' 
	          INSERT INTO @hierarchy
	            (NAME, SequenceNo, parent_ID, StringValue, Object_ID, ValueType)
	            SELECT @name, @SequenceNo, @parent_ID, SUBSTRING(@value, 7, 5),
	              SUBSTRING(@value, 7, 5), 'array' 
	        ELSE 
	          IF SUBSTRING(@value, 1, 7)='@string' 
	            INSERT INTO @hierarchy
	              (NAME, SequenceNo, parent_ID, StringValue, ValueType)
	              SELECT @name, @SequenceNo, @parent_ID, stringvalue, 'string'
	              FROM @strings
	              WHERE string_id=SUBSTRING(@value, 8, 5)
	          ELSE 
	            IF @value IN ('true', 'false') 
	              INSERT INTO @hierarchy
	                (NAME, SequenceNo, parent_ID, StringValue, ValueType)
	                SELECT @name, @SequenceNo, @parent_ID, @value, 'boolean'
	            ELSE
	              IF @value='null' 
	                INSERT INTO @hierarchy
	                  (NAME, SequenceNo, parent_ID, StringValue, ValueType)
	                  SELECT @name, @SequenceNo, @parent_ID, @value, 'null'
	              ELSE
	                IF PATINDEX('%[^0-9]%', @value collate SQL_Latin1_General_CP850_Bin)>0 
	                  INSERT INTO @hierarchy
	                    (NAME, SequenceNo, parent_ID, StringValue, ValueType)
	                    SELECT @name, @SequenceNo, @parent_ID, @value, 'real'
	                ELSE
	                  INSERT INTO @hierarchy
	                    (NAME, SequenceNo, parent_ID, StringValue, ValueType)
	                    SELECT @name, @SequenceNo, @parent_ID, @value, 'int'
	      if @Contents=' ' Select @SequenceNo=0
	    END
	  END
	INSERT INTO @hierarchy (NAME, SequenceNo, parent_ID, StringValue, Object_ID, ValueType)
	  SELECT '-',1, NULL, '', @parent_id-1, @type
	--
	   RETURN
	END
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2020-11-26 09:32:58 ******/
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
/****** Object:  Table [dbo].[DetailBody]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailBody](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDHeader] [int] NOT NULL,
	[Detail] [varchar](150) NULL,
	[Tanggal] [varchar](10) NULL,
	[Valuta] [varchar](10) NULL,
	[Narative] [varchar](250) NULL,
	[NoRef] [varchar](30) NULL,
	[Debet] [varchar](30) NULL,
	[Kredit] [varchar](30) NULL,
	[Saldo] [varchar](30) NULL,
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
 CONSTRAINT [PK_dbo.DetailBody] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailFooter]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailFooter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDHeader] [int] NOT NULL,
	[NoHalaman] [varchar](4) NULL,
	[SaldoAwal] [varchar](30) NULL,
	[SaldoAkhir] [varchar](30) NULL,
	[TotalDebet] [varchar](30) NULL,
	[TotalKredit] [varchar](30) NULL,
	[FrekuensiDebet] [varchar](5) NULL,
	[FrekuensiKredit] [varchar](5) NULL,
	[SaldoTerendah] [varchar](30) NULL,
	[SaldoTertinggi] [varchar](30) NULL,
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
 CONSTRAINT [PK_dbo.DetailFooter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiroFeeExclude]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiroFeeExclude](
	[AccountNo] [varchar](20) NOT NULL,
	[InputBranch] [varchar](20) NULL,
	[InputDate] [datetime] NULL,
	[InputBy] [varchar](30) NULL,
	[ApproveDate] [datetime] NULL,
	[ApproveBy] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiroPaymentHistory_TH]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiroPaymentHistory_TH](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[TrxDateTime] [varchar](20) NULL,
	[DebetAccount] [varchar](20) NULL,
	[KreditAccount] [varchar](20) NULL,
	[TrxAmount] [money] NULL,
	[trxMessage] [varchar](200) NULL,
	[Narative] [varchar](200) NULL,
	[resMessage] [varchar](2000) NULL,
	[returnCode] [varchar](4) NULL,
	[ftCore] [varchar](20) NULL,
	[noRefCore] [varchar](20) NULL,
	[transmissdateReq] [varchar](20) NULL,
	[JsonRequest] [varchar](2000) NULL,
	[JsonResponse] [varchar](max) NULL,
	[StatementPeriode] [varchar](6) NULL,
	[RegisterAccountID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiroPaymentHistory_TH_20201008]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiroPaymentHistory_TH_20201008](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[TrxDateTime] [varchar](20) NULL,
	[DebetAccount] [varchar](20) NULL,
	[KreditAccount] [varchar](20) NULL,
	[TrxAmount] [money] NULL,
	[trxMessage] [varchar](200) NULL,
	[Narative] [varchar](200) NULL,
	[resMessage] [varchar](2000) NULL,
	[returnCode] [varchar](4) NULL,
	[ftCore] [varchar](20) NULL,
	[noRefCore] [varchar](20) NULL,
	[transmissdateReq] [varchar](20) NULL,
	[JsonRequest] [varchar](2000) NULL,
	[JsonResponse] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HeaderTextFile]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeaderTextFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Periode] [varchar](20) NULL,
	[CIF] [varchar](25) NULL,
	[AccountNo] [varchar](25) NULL,
	[AccountName] [varchar](100) NULL,
	[Currency] [varchar](30) NULL,
	[Alamat1] [varchar](250) NULL,
	[Alamat2] [varchar](250) NULL,
	[Alamat3] [varchar](250) NULL,
	[NPWP] [varchar](50) NULL,
	[OldAcctNo] [varchar](30) NULL,
	[cabang] [varchar](30) NULL,
	[TypeAccount] [varchar](50) NULL,
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
 CONSTRAINT [PK_dbo.HeaderTextFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InsertLog]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsertLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[TimeSpend] [nvarchar](max) NULL,
	[Module] [nvarchar](max) NULL,
	[Process] [nvarchar](max) NULL,
	[LogMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.InsertLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MasterEmailTemplate]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterEmailTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Description] [varchar](30) NULL,
	[Content] [varchar](8000) NULL,
	[ProductCode] [varchar](10) NULL,
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
 CONSTRAINT [PK_dbo.MasterEmailTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterParameter]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterParameter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Value] [varchar](8000) NULL,
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
 CONSTRAINT [PK_dbo.MasterParameter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterPDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterPDF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [varchar](20) NULL,
	[Period] [varchar](20) NULL,
	[Branch] [varchar](50) NULL,
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
	[Folder] [nvarchar](max) NULL,
	[File] [nvarchar](max) NULL,
	[Root] [nvarchar](max) NULL,
	[Content] [text] NULL,
	[Subject] [varchar](30) NULL,
	[Success] [int] NOT NULL CONSTRAINT [DF__MasterPDF__Succe__74AE54BC]  DEFAULT ((0)),
	[Failure] [int] NOT NULL CONSTRAINT [DF__MasterPDF__Failu__75A278F5]  DEFAULT ((0)),
	[Remark] [nvarchar](max) NULL,
	[GeneratePDFDate] [datetime] NULL,
	[SentEmailDate] [datetime] NULL,
	[GeneratePDFLog] [varchar](2000) NULL,
	[SentEmailLog] [varchar](2000) NULL,
 CONSTRAINT [PK_dbo.MasterPDF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterProduct]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NULL,
	[ProductName] [nvarchar](300) NULL,
	[IsActive] [bit] NOT NULL,
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
 CONSTRAINT [PK_dbo.MasterProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MasterPromotion]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterPromotion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[ProductCode] [varchar](10) NULL,
	[Message] [varchar](1000) NULL,
	[PeriodFrom] [date] NOT NULL,
	[PeriodTo] [date] NULL,
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
 CONSTRAINT [PK_dbo.MasterPromotion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterTextFile]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterTextFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameFile] [nvarchar](max) NULL,
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
 CONSTRAINT [PK_dbo.MasterTextFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisteredAccount]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisteredAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatementPeriod] [nvarchar](6) NULL,
	[CIF] [nvarchar](8) NULL,
	[AccountNo] [nvarchar](15) NULL,
	[BirthDate] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[ProductCategory] [int] NOT NULL,
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
	[Email_Sts] [varchar](2) NULL,
	[TotalLembar] [int] NULL,
	[DebetStatus] [int] NULL,
	[HargaLembar] [money] NULL,
	[IsGiroAccount] [bit] NULL,
	[DebetMessage] [varchar](1000) NULL,
	[PaymentDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.RegisteredAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegisteredAccount_20200826]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredAccount_20200826](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatementPeriod] [nvarchar](6) NULL,
	[CIF] [nvarchar](8) NULL,
	[AccountNo] [nvarchar](15) NULL,
	[BirthDate] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[ProductCategory] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Temp]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Temp](
	[IDHeader] [bigint] NULL,
	[HeaderText] [varchar](max) NULL,
	[DetailText] [varchar](max) NULL,
	[FooterText] [varchar](max) NULL,
	[guid] [uniqueidentifier] NULL,
	[identity] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempDetail]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempDetail](
	[IDHeader] [bigint] NULL,
	[IDDetail] [bigint] NULL,
	[DetailText] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempMasterPDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempMasterPDF](
	[AccountNo] [varchar](20) NULL,
	[Period] [varchar](20) NULL,
	[Branch] [varchar](50) NULL,
	[StatusData] [int] NULL,
	[IsDelete] [int] NULL,
	[Folder] [nvarchar](max) NULL,
	[File] [nvarchar](max) NULL,
	[Root] [nvarchar](max) NULL,
	[Subject] [varchar](50) NULL,
	[Success] [int] NULL,
	[Failure] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Product] [varchar](500) NULL,
	[ProductCode] [varchar](500) NULL,
	[AccountName] [varchar](500) NULL,
	[GeneratePDFDate] [datetime] NULL,
	[GeneratePDFLog] [varchar](1000) NULL,
	[StatementPeriode] [varchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempUpdateEmail]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempUpdateEmail](
	[AccountNo] [varchar](255) NULL,
	[Action] [int] NULL,
	[Id] [int] NULL,
	[logMessage] [varchar](2000) NULL,
	[SentEmailDate] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempUpload]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempUpload](
	[UploadGuid] [uniqueidentifier] NOT NULL,
	[AccountNo] [varchar](30) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempUpload_TH]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempUpload_TH](
	[UploadGuid] [uniqueidentifier] NOT NULL,
	[FileName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE function [dbo].[SplitString] 
(
	--Sample SELECT * FROM [SplitString]('asdsadsa|sadsad|asdsad','|')
    @str VARCHAR(MAX)
    ,@separator CHAR(1)
)
RETURNS TABLE

AS

	RETURN(
		WITH tokens(p, a, b) AS(
			SELECT	CAST(1 AS BIGINT)
					,CAST(1 AS BIGINT)
					,CHARINDEX(@separator, @str)
			UNION ALL
			SELECT	p + 1
					,b + 1
					,CHARINDEX(@separator, @str, b + 1)
				FROM tokens
				WHERE	b > 0
			)
			
		SELECT	p-1 ItemIndex,
				SUBSTRING(@str, a, CASE WHEN b > 0 THEN b-a ELSE LEN(@str) END) AS Item
			FROM tokens
		);
GO
ALTER TABLE [dbo].[DetailBody]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetailBody_dbo.HeaderTextFile_IDHeader] FOREIGN KEY([IDHeader])
REFERENCES [dbo].[HeaderTextFile] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetailBody] CHECK CONSTRAINT [FK_dbo.DetailBody_dbo.HeaderTextFile_IDHeader]
GO
ALTER TABLE [dbo].[DetailFooter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DetailFooter_dbo.HeaderTextFile_IDHeader] FOREIGN KEY([IDHeader])
REFERENCES [dbo].[HeaderTextFile] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetailFooter] CHECK CONSTRAINT [FK_dbo.DetailFooter_dbo.HeaderTextFile_IDHeader]
GO
/****** Object:  StoredProcedure [dbo].[Check_EOM]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- CHECK_EOM '2018-09-30'
-- =============================================
CREATE PROCEDURE [dbo].[Check_EOM]
	-- Add the parameters for the stored procedure here
	@tanggal date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @tanggaleom Date 
	SET NOCOUNT ON;
	-- Insert statements for procedure here
	--if (select [SQL_MyPeople].dbo.fnCheckHoliday(@tanggal)) = 0
	--begin
	--	SET @tanggaleom = (SELECT @tanggal)
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-1,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-1,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-2,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-2,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-3,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-3,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-4,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-4,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-5,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-5,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-6,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-6,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-7,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-7,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-8,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-8,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-9,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-9,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-10,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-10,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-11,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-11,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-12,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-12,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-13,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-13,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-14,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-14,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-15,@tanggal))) = 0
	--begin
	--	SET @tanggaleom = (SELECT dateadd(day,-15,@tanggal))
	--end
	--else if (select [SQL_MyPeople].dbo.fnCheckHoliday(dateadd(day,-16,@tanggal))) = 0
	--begin
	--SET @tanggaleom = (SELECT dateadd(day,-16,@tanggal))
	--end

	select @tanggal as eom
END

GO
/****** Object:  StoredProcedure [dbo].[Check_Statement_Period_Registered_Account]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Check_Statement_Period_Registered_Account]
	@periode varchar(255) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
		b.StatementPeriod
	FROM RegisteredAccount b 
	WHERE upper((SELECT dbo.ConvertMonth(b.StatementPeriod))) = @periode
	
END

GO
/****** Object:  StoredProcedure [dbo].[Delete_RegisteredAccount]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec [dbo].[Delete_RegisteredAccount] '479772','151407'
-- =============================================
CREATE PROCEDURE [dbo].[Delete_RegisteredAccount]
	-- Add the parameters for the stored procedure here
	@ID int = null,
	@niklogin varchar(100),
	@module varchar(100),
	@process varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @t1 DATETIME;
	DECLARE @t2 DATETIME;
	declare @timespend varchar(100)
	DECLARE @ACCTNO VARCHAR(100)
	declare @prosesAcctNoDelete varchar(100)
	
	--------------------------------Proses Delete--------------------------------------------
	SET @t1 = GETDATE();
	BEGIN
		Update RegisteredAccount set IsDelete=1 where ID = @ID
	END
	SELECT @ACCTNO = AccountNo FROM RegisteredAccount WHERE ID = @ID
	
	SET @t2 = GETDATE();
	SELECT @timespend = DATEDIFF(second,@t1,@t2);
	--------------------------------Proses Delete--------------------------------------------
	set @prosesAcctNoDelete = 'Record '+@ACCTNO+' Deleted'
	
	exec [dbo].[InsertLog1] @module,@process,@prosesAcctNoDelete,@timespend,@niklogin
	
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteDataGiroFeeExclude]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteDataGiroFeeExclude]
/*
	CreateBy	: Eldwin
	CreateDate	: 20201006
	Objective	: Menghapus data Giro Fee Exclude

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
	@pAccountNo		varchar(20)
AS
set nocount on

	DELETE FROM GiroFeeExclude
	WHERE AccountNo = @pAccountNo			

return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	--set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	--IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1


GO
/****** Object:  StoredProcedure [dbo].[DeleteDataHeaderTextExists]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [Get_Header_TextFile_ToPDF] @AccountNo = '5300010468', @periode = 'JULI 2019'
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDataHeaderTextExists]
	@cabang varchar(max) = null,
	@periode varchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
		delete from SQL_Statement.dbo.HeaderTextFile
		where cabang = @cabang and Periode = @periode
		
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Body_TextFile_ToPDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Body_TextFile_ToPDF]
	@IDHeader int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID]
      ,REPLACE(SUBSTRING(CONVERT(VARCHAR,CONVERT(DATE,[Tanggal]),106),1,LEN(CONVERT(VARCHAR,CONVERT(DATE,[Tanggal]),106))-5),' ','-') as Tanggal
      ,REPLACE(SUBSTRING(CONVERT(VARCHAR,CONVERT(DATE,Valuta),106),1,LEN(CONVERT(VARCHAR,CONVERT(DATE,Valuta),106))-5),' ','-') as Valuta
      ,[Detail]
      ,[Narative]
      ,[NoRef]
      ,[Debet]
      ,[Kredit]
      ,[Saldo]
    FROM [SQL_Statement].[dbo].DetailBody where IDHeader = @IdHeader
END

GO
/****** Object:  StoredProcedure [dbo].[Get_Data_GeneratePDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <>
-- Description:	<>
-- EXEC [dbo].[Get_Data_GeneratePDF] '6001088376','AGUSTUS 2020'
-- =============================================
CREATE PROCEDURE [dbo].[Get_Data_GeneratePDF] 

 @AccNo VARCHAR (50) = null,
 @Periode VARCHAR (50) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
		distinct(a.AccountNo)
		,AccountName
		,replace(convert(varchar,b.BirthDate,103),'/','') as Birthdate
		,b.StatementPeriod
		,upper(a.Periode) AS Periode
		,Cabang
		,d.ID
		,d.Code AS ProductCode
		,(SELECT top 1 content from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as Content
		,(SELECT top 1 name from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as Product
		,(SELECT top 1 c.[Description] from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as [Subject]
	FROM HeaderTextFile a 
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo AND upper(a.Periode) = upper((SELECT dbo.ConvertMonth(b.StatementPeriod))) 
	JOIN MasterProduct d ON b.ProductCategory=d.Id
	WHERE upper(a.Periode) = @Periode 
	AND BirthDate is not null
	AND d.IsDelete=0
	AND a.AccountNo = @AccNo

END

GO
/****** Object:  StoredProcedure [dbo].[Get_DataAccountNo]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*=============================================
	CreateBy	: Eldwin
	CreateDate	: 20200819
	Objective	: Menampilkan data Account No + Nama
================================================*/

CREATE PROCEDURE [dbo].[Get_DataAccountNo] 
	-- Add the parameters for the stored procedure here
	@searchtext VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--select 
	--distinct me.NIK,me.Nama,tp.Posisi from SQL_MyPeople..MasterEmployee me 
	--join SQL_MyBudgeting..tblPosisi tp on me.Posisi = tp.kodePosisi
	--	WHERE 
	--			@searchtext IS NULL
	--			OR Nama LIKE '%' + @searchtext + '%'
	--			OR tp.Posisi LIKE '%' + @searchtext + '%'

	select 
	distinct
	account_no as [AccountNo],name_1 as [Nama]
	from SQL_TEMENOS..ACCOUNT a 
		JOIN SQL_TEMENOS..CUSTOMER b on a.customer_no = b.customer_no
	where 
		@searchtext IS NULL
		OR name_1 like '%'+@searchtext+'%'
		OR account_no like '%'+@searchtext+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [Get_Distinct_HeaderTextFile_By_AccountNo]'KC TOMANG','FEBRUARI 2020'
-- =============================================
CREATE PROCEDURE [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo] 
	@cabang  varchar(255) = null,
	@periode varchar(255) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
		distinct(a.AccountNo)
		,AccountName
		,replace(convert(varchar,b.BirthDate,103),'/','') as Birthdate
		,b.StatementPeriod
		,Cabang
		,(SELECT top 1 content from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as Content
		,(SELECT top 1 name from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as Product
		,(SELECT top 1 c.[Description] from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as [Subject]
	FROM HeaderTextFile a 
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo 
	AND upper(a.Periode) = upper((SELECT dbo.ConvertMonth(b.StatementPeriod)))
	WHERE a.Periode = @periode
	AND a.cabang = @cabang
	AND BirthDate is not null
END

GO
/****** Object:  StoredProcedure [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo_NewProduct]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <>
-- Description:	<>
-- EXEC [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo_NewProduct] 24

CREATE PROCEDURE [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo_NewProduct] 
  @FLAG int

AS
BEGIN

	SET NOCOUNT ON;
	declare @bagi int
	
	
	SELECT @bagi=COUNT(1) FROM (SELECT distinct(a.AccountNo) from HeaderTextFile a
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo AND upper(a.Periode) = upper((SELECT dbo.ConvertMonth(b.StatementPeriod))) 
	JOIN MasterProduct d on d.Id = b.ProductCategory
	WHERE upper(Periode) = upper((SELECT dbo.ConvertMonth(SUBSTRING(CONVERT(VARCHAR,dateadd(mm, datediff(mm, 0, dateadd(MM, -1, getdate())), 0),112),1,6)))) 
	AND b.Email_sts='Y'
	AND a.IsDelete=0 ) AS B

	
    IF (@bagi%25=0)
    SELECT @bagi=@bagi/25
    ELSE
    SELECT @bagi=(@bagi/25)+1
	
	
	SELECT * FROM (SELECT 
	
	CASE WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi then 1 
   
   	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*2 then 2 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*3 then 3 
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*4 then 4
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*5 then 5
   

  	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*6 then 6
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*7 then 7 
      
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*8 then 8
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*9 then 9
   
     	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*10 then 10 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*11 then 11 
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*12 then 12
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*13 then 13
   
     	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*14 then 14 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*15 then 15
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*16 then 16
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*17 then 17
   
     	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*18 then 18 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*19 then 19 
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*20 then 20
   
        WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*21 then 21
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*22 then 22
   
     	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*23 then 23 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*24 then 24 
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*25 then 25
   
 --             	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*26 then 26
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*27 then 27
   
 --    	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*28 then 28 
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*29 then 29 
   
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*30 then 30
   
 --             	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*31 then 31
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*32 then 32
   
 --    	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*33 then 33 
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*34 then 34 
   
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*35 then 35
   
 --             	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*36 then 36
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*37 then 37
   
 --    	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*38 then 38 
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*39 then 39 
   
   
 --     	WHEN 
	--ROW_NUMBER() OVER (
	--ORDER BY a.AccountNo
 --  ) <= @bagi*40 then 40
   
   end as flag,
   
   
   * FROM (SELECT 
		distinct(a.AccountNo)
		,AccountName
		,replace(convert(varchar,b.BirthDate,103),'/','') as Birthdate
		,b.StatementPeriod
		,upper(a.Periode) AS Periode
		,Cabang
		,c.content as Content
		,c.Name as Product
		,d.Code as ProductCode
		,c.[Description] as [Subject]
	FROM HeaderTextFile a 
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo AND upper(a.Periode) = upper((SELECT dbo.ConvertMonth(b.StatementPeriod))) 
	JOIN MasterProduct d
		on d.Id = b.ProductCategory
	JOIN MasterEmailTemplate c
		on d.Code = c.ProductCode
	WHERE upper(a.Periode) = upper((SELECT dbo.ConvertMonth(SUBSTRING(CONVERT(VARCHAR,dateadd(mm, datediff(mm, 0, dateadd(MM, -1, getdate())), 0),112),1,6)))) 
	AND BirthDate is not null
	AND b.Email_sts='Y'
	AND d.IsDelete=0 ) A ) B
WHERE FLAG=@FLAG
END

GO
/****** Object:  StoredProcedure [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo2]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
/*
 [Get_Distinct_HeaderTextFile_By_AccountNo2] 'KCP PASAR MALABAR','SEPTEMBER 2020','5301032376'
 [Get_Distinct_HeaderTextFile_By_AccountNo2] 'KCP CITRA RAYA','AGUSTUS 2020','5300292862'
 */
-- =============================================
CREATE PROCEDURE [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo2] 
	@cabang  varchar(255) = null,
	@periode varchar(255) = null,
	@accountno varchar(255) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
		distinct(a.AccountNo)
		,AccountName
		,replace(convert(varchar,b.BirthDate,103),'/','') as Birthdate
		,b.StatementPeriod
		,upper(a.Periode) AS Periode
		,Cabang
		,c.content as Content
		,c.Name as Product
		,d.Code as ProductCode
		,c.[Description] as [Subject]
		,f.id
	FROM HeaderTextFile a 
    JOIN MasterPDF f ON a.AccountNo=f.AccountNo AND upper(a.Periode) = upper((SELECT dbo.ConvertMonth(f.period)))
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo AND upper(a.Periode) = upper((SELECT dbo.ConvertMonth(b.StatementPeriod))) 
	JOIN MasterProduct d on d.Id = b.ProductCategory
	JOIN MasterEmailTemplate c on d.Code = c.ProductCode
	WHERE a.Periode = @periode
	AND a.cabang = @cabang
	AND a.AccountNo = @accountno
	AND BirthDate is not null
	AND b.Email_sts='Y'
	AND d.IsDelete=0 
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Header_TextFile_ToPDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [Get_Header_TextFile_ToPDF] @AccountNo = '5300006808', @periode = 'OKTOBER 2020'
-- =============================================
CREATE PROCEDURE [dbo].[Get_Header_TextFile_ToPDF]
	@AccountNo varchar(max) = null,
	@periode varchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct a.[ID]
	  ,(SELECT COUNT(AccountNo) From HeaderTextFile Where AccountNo=a.AccountNo and Periode = a.Periode) as LastNumber	
      ,dbo.ConvertPeriodToMont(Periode) as Periode
      ,[CIF]
      ,[AccountNo]
      ,[AccountName]
      ,[Currency]
      ,[Alamat1]
      ,[Alamat2]
      ,[Alamat3]
      ,[NPWP]
      ,[OldAcctNo]
      ,[cabang]
	  ,[TypeAccount]
	  ,NoHalaman
	  ,SaldoAwal
	  ,TotalDebet
	  ,TotalKredit
	  ,SaldoAkhir
	  ,FrekuensiDebet
	  ,FrekuensiKredit
	  ,SaldoTerendah
	  ,SaldoTertinggi
	  ,(SELECT TOP 1 [Message] FROM MasterPromotion c JOIN MasterProduct d ON c.ProductCode=d.Code JOIN RegisteredAccount e ON d.Id=e.ProductCategory WHERE e.AccountNo=a.AccountNo and c.PeriodFrom <=CONVERT(date,GETDATE()) AND c.PeriodTo >=CONVERT(date,GETDATE())) as Promotion
	FROM [SQL_Statement].[dbo].[HeaderTextFile] a 
	JOIN [SQL_Statement].[dbo].[DetailFooter] b ON a.ID=b.IDHeader where a.AccountNo=@AccountNo
	and a.Periode = @periode
END


GO
/****** Object:  StoredProcedure [dbo].[GetDataGiroPaymentHistory]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetDataGiroPaymentHistory]
/*
	CreateBy	: Eldwin
	CreateDate	: 20201009
	Objective	: Menampilkan data Giro Payment History

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
	@pPeriode		date
AS
begin
set nocount on
declare @successAmount	money
declare @failedAmount	money

	SELECT
		a.ID,
		StatementPeriod AS [StatementPeriode],
		CONVERT(varchar,PaymentDate,103) AS [TransactionDate],
		a.AccountNo as [DebetAccount],
		name_1 as [DebetAccountName],
		case when DebetStatus = 1 then 'Success' else 'Failed' end as [DebetStatus],
		DebetMessage,
		TotalLembar,
	 	convert(varchar,convert(money,HargaLembar),1) as [HargaLembar],
		convert(varchar,convert(money,TotalLembar*HargaLembar),1) as [TotalAmount]
	FROM	
		RegisteredAccount a
		JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.AccountNo = b. account_no COLLATE DATABASE_DEFAULT
		JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	WHERE 
		a.StatementPeriod = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)),2)
		AND PaymentDate IS NOT NULL
	
	--SELECT 
	--	a.ID,
	--	StatementPeriode,		
	--	CONVERT(varchar,TransactionDate,103) as TransactionDate,
	--	TrxDateTime,
	--	DebetAccount,
	--	name_1 as [DebetAccountName],
	--	KreditAccount,
	--	TrxAmount,
	--	returnCode as [ReturnCode],
	--	ftCore
	--FROM RegisteredAccount a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.AccountNo = b.account_no COLLATE DATABASE_DEFAULT
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	--	JOIN GiroPaymentHistory_TH d on a.AccountNo = d.DebetAccount
	--WHERE 
	--	a.StatementPeriod = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)),2)

	--SELECT 
	--	@successAmount = SUM(TrxAmount) 
	--FROM RegisteredAccount a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.AccountNo = b.account_no COLLATE DATABASE_DEFAULT
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	--	JOIN GiroPaymentHistory_TH d on a.AccountNo = d.DebetAccount
	--WHERE 
	--	a.StatementPeriod = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)), 2)
	--	and returnCode = '00'


	--SELECT 
	--	@failedAmount = SUM(TrxAmount) 
	--FROM RegisteredAccount a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.AccountNo = b.account_no COLLATE DATABASE_DEFAULT
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	--	JOIN GiroPaymentHistory_TH d on a.AccountNo = d.DebetAccount
	--WHERE 
	--	a.StatementPeriod = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)), 2)
	--	and returnCode <> '00'

	--	select 
	--	@successAmount as [SuccessAmount]
	--	select
	--	@failedAmount as [FailedAmount]
return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	--set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	--IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1

end
GO
/****** Object:  StoredProcedure [dbo].[GetDataGiroPaymentHistoryFailed]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetDataGiroPaymentHistoryFailed]
/*
	CreateBy	: Eldwin
	CreateDate	: 20201009
	Objective	: Menghitung jumlah data Giro Payment History yang success

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
	@pPeriode		date
AS
set nocount on

	--SELECT 
	--	SUM(TrxAmount) as [SuccessAmount]
	--FROM GiroPaymentHistory_TH a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.DebetAccount = b.account_no COLLATE DATABASE_DEFAULT
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	--WHERE 
	--	a.StatementPeriode = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)), 2)
	
	SELECT 
	distinct
		DebetAccount,
		--convert(varchar,SUM(TrxAmount),1) as [FailedAmount]
		TrxAmount
	into #TempTest
	FROM GiroPaymentHistory_TH a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.DebetAccount = b.account_no COLLATE DATABASE_DEFAULT
		JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
		
	WHERE 
		a.StatementPeriode = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)), 2)
		and returnCode <> '00'

	ALTER TABLE #TempTest
	DROP COLUMN DebetAccount

	SELECT convert(varchar,SUM(TrxAmount),1) as [FailedAmount]
	FROM #TempTest
	IF OBJECT_ID('tempdb..#TempTest') IS NOT NULL DROP TABLE #TempTest
return 0

APPERR:
	if @@trancount > 0
	IF OBJECT_ID('tempdb..#TempTest') IS NOT NULL DROP TABLE #TempTest
		ROLLBACK TRAN

	--set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	--IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1


GO
/****** Object:  StoredProcedure [dbo].[GetDataGiroPaymentHistorySuccess]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetDataGiroPaymentHistorySuccess]
/*
	CreateBy	: Eldwin
	CreateDate	: 20201009
	Objective	: Menghitung jumlah data Giro Payment History yang success

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
	@pPeriode		date
AS
set nocount on

	--SELECT 
	--	SUM(TrxAmount) as [SuccessAmount]
	--FROM GiroPaymentHistory_TH a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.DebetAccount = b.account_no COLLATE DATABASE_DEFAULT
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	--WHERE 
	--	a.StatementPeriode = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)), 2)
	
	SELECT 
	DISTINCT
		DebetAccount
		,TrxAmount
	INTO #TempTest
	FROM GiroPaymentHistory_TH a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.DebetAccount = b.account_no COLLATE DATABASE_DEFAULT
		JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	WHERE 
		a.StatementPeriode = convert(varchar,YEAR(@pPeriode))+RIGHT('0' + RTRIM(MONTH(@pPeriode)), 2)
		and returnCode = '00'

	ALTER TABLE #TempTest
	DROP COLUMN DebetAccount

	SELECT convert(varchar,SUM(TrxAmount),1) as [SuccessAmount]
	FROM #TempTest
	IF OBJECT_ID('tempdb..#TempTest') IS NOT NULL DROP TABLE #TempTest
return 0

APPERR:
	if @@trancount > 0
	IF OBJECT_ID('tempdb..#TempTest') IS NOT NULL DROP TABLE #TempTest
		ROLLBACK TRAN

	--set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	--IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1


GO
/****** Object:  StoredProcedure [dbo].[GetListEmailPending]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fajri Sidik>
-- Create date: <24 August 2018>
-- Description:	
-- EXEC [dbo].[GetListEmailPending] '2018-09-10'
-- =============================================
CREATE PROCEDURE [dbo].[GetListEmailPending]
 @Period Date = null
	-- Add the parameters for the stored procedure here
AS
BEGIN
	--DECLARE @ProcessDate DATE = (SELECT left(convert(date,DATEADD(mm,-1,GETDATE())),8)+Value FROM MasterParameter where ID=2)
	DECLARE @Periode varchar(6) = substring(replace(convert(varchar,@Period),'-',''),1,6)
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CONVERT(INT,ROW_NUMBER() OVER (ORDER BY a.ID)) as Number
	,a.Id
	,substring(convert(varchar,convert(Date,a.Period+'01'),106),3,LEN(convert(varchar,convert(Date,Period+'01'),106))-2) as Period
	,ISNULL(LEFT(convert (varchar,a.CreateDate,113),17),'') as ProcessDate
	,a.AccountNo
	,c.ProductName as Category
	,(SELECT TOP 1 AccountName FROM HeaderTextFile WHERE AccountNo=a.AccountNo) as AccountName
	,ISNULL(Email,'') as Email
	,[Root]+'\'+Folder+'\'+[File] as Downloadpdf
	,d.ID as EmailTemplate
	,a.[File]
	,a.Content
	FROM MasterPDF a 
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo
	JOIN MasterProduct c ON b.ProductCategory=c.Id
	LEFT JOIN MasterEmailTemplate d ON d.ProductCode = c.Code
	--JOIN HeaderTextFile d ON a.AccountNo=d.AccountNo
	WHERE
	(a.Period = @Periode OR @Periode is null) 
	AnD
	a.Failure = 0  AND a.Success = 0 AND b.Isdelete = 0
	ORDER BY a.CreateDate ASC
END

GO
/****** Object:  StoredProcedure [dbo].[GetListUserByEmailAndMonth]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fajri Sidik>
-- Create date: <24 August 2018>
-- Description:	
-- exec [dbo].[GetListUserByEmailAndMonth] 5
-- =============================================
CREATE PROCEDURE [dbo].[GetListUserByEmailAndMonth]
	-- Add the parameters for the stored procedure here
	  @FLAG int
AS
BEGIN
SET NOCOUNT ON;

	declare @date varchar(2),
			@tableparam varchar(2)
			
	set @date = right('00' + CAST(DATEPART( DD , GETDATE()) as varchar),2)
	select @tableparam = Value from MasterParameter where ID = 3

	if (@date = @tableparam)
	begin

IF(@FLAG=1)

BEGIN
UPDATE [SQL_Statement].[dbo].[MasterPDF] 
SET Success=0, Failure=1, SentEmailDate=GETDATE(), SentEmailLog='Email Format is Not Valid Or Empty'
FROM [SQL_Statement].[dbo].[MasterPDF] a
JOIN [SQL_Statement].[dbo].[RegisteredAccount] b ON a.AccountNo=b.AccountNo AND a.Period = b.StatementPeriod 
WHERE dbo.fnAppEmailCheck(email) = 0 AND a.Period = LEFT(replace(Convert(varchar(10), DATEADD(MONTH,-1,GETDATE()),102),'.',''),6)
END


    DECLARE @bagi INT

	SELECT @bagi = COUNT(1)
	FROM MasterPDF a 
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo AND a.Period = b.StatementPeriod 
	WHERE a.StatusData=0
	AND Period = LEFT(replace(Convert(varchar(10), DATEADD(MONTH,-1,GETDATE()),102),'.',''),6)
	AND StatementPeriod = LEFT(replace(Convert(varchar(10), DATEADD(MONTH,-1,GETDATE()),102),'.',''),6)
	and Success = 0 
	and Failure = 0	

    IF (@bagi%20=0)
    SELECT @bagi=@bagi/20
    ELSE
    SELECT @bagi=(@bagi/20)+1

    -- Insert statements for procedure here
	SELECT * FROM (SELECT a.Id
	,a.AccountNo
	,(SELECT TOP 1 AccountName FROM HeaderTextFile WHERE AccountNo=a.AccountNo) as AccountName
	,Email
	,[Root]+'\'+Folder+'\'+[File] as PathPdf
	,a.Content
	,d.[Description]
	,a.Success
	,a.Failure
	,a.Subject 
	,CASE WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi then 1 
   
   	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*2 then 2 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*3 then 3 
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*4 then 4
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*5 then 5
   

  	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*6 then 6
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*7 then 7 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*8 then 8
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*9 then 9
   
     	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*10 then 10 
   
   	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*11 then 11 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*12 then 12 
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*13 then 13
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*14 then 14
   

  	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*15 then 15
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*16 then 16 
   
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*17 then 17
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*18 then 18
   
     	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*19 then 19 
   
      	WHEN 
	ROW_NUMBER() OVER (
	ORDER BY a.AccountNo
   ) <= @bagi*20 then 20 
   
	END AS FLAG
	
	FROM MasterPDF a 
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo AND a.Period = b.StatementPeriod 
	JOIN MasterProduct c ON b.ProductCategory=c.Id
	LEFT JOIN MasterEmailTemplate d ON d.ProductCode = c.Code
	--JOIN HeaderTextFile d ON a.AccountNo=d.AccountNo
	WHERE a.StatusData=0
	AND Period = LEFT(replace(Convert(varchar(10), DATEADD(MONTH,-1,GETDATE()),102),'.',''),6)
	AND StatementPeriod = LEFT(replace(Convert(varchar(10), DATEADD(MONTH,-1,GETDATE()),102),'.',''),6)
	and Success = 0 
	and Failure = 0
) A
WHERE FLAG=@FLAG 

end

END
GO
/****** Object:  StoredProcedure [dbo].[GetPageCategoryTemenos]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPageCategoryTemenos]
	--862020
	@searchtext varchar(100) = null
--

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- SELECT [@Id] as Code,[description] as ProductName FROM [SQL_TEMENOS].[dbo].[CATEGORY]
	
	--862020
	SELECT [@Id] as Code,[description] as ProductName FROM [SQL_TEMENOS].[dbo].[CATEGORY]
	where (@searchText is null or @searchText = '' or [@Id] like '%'+@searchText+'%') 
	or (@searchText is null or @searchText = '' or [description] like '%'+@searchText+'%') 
	--
	
END

GO
/****** Object:  StoredProcedure [dbo].[GetPageGiroFeeExclude]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPageGiroFeeExclude]
/*
	CreateBy	: Eldwin
	CreateDate	: 20201006
	Objective	: Menampilkan data Giro Fee Exclude

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
	@searchtext VARCHAR(100)
AS
set nocount on

	SELECT AccountNo,InputBranch
	FROM GiroFeeExclude 
	--JOIN SQL_TEMENOS..ACCOUNT b on a.AccountNo = b.account_no	collate database_default
	--JOIN SQL_TEMENOS..CUSTOMER c on b.customer_no = c.customer_no collate database_default
	WHERE 
			@searchtext IS NULL
			OR AccountNo LIKE '%' + @searchtext + '%'
			
				

return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	--set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	--IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1


GO
/****** Object:  StoredProcedure [dbo].[GetRincianDataGiroPaymentHistory]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRincianDataGiroPaymentHistory]
/*
	CreateBy	: Eldwin
	CreateDate	: 20201009
	Objective	: Menampilkan rincian data Giro Payment History

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
	@pRegisteredAccountId		int
AS
begin
set nocount on
	SELECT 
		a.ID,
		StatementPeriode,		
		CONVERT(varchar,TransactionDate,103) as TransactionDate,
		TrxDateTime,
		DebetAccount,
		name_1 as [DebetAccountName],
		KreditAccount,
		TrxAmount,
		returnCode as [ReturnCode],
		ftCore,
		resMessage
	FROM GiroPaymentHistory_TH a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b on a.DebetAccount = b.account_no COLLATE DATABASE_DEFAULT
		JOIN SQL_TEMENOS.dbo.CUSTOMER c on b.customer_no = c.customer_no COLLATE DATABASE_DEFAULT
	WHERE 
		RegisterAccountID = @pRegisteredAccountId
	ORDER BY ID
	
return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	--set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	--IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1

end
GO
/****** Object:  StoredProcedure [dbo].[GetStatusPDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <>
-- Description:	
-- EXEC [dbo].[GetStatusPDF] '5300171976','2020-08-01'
-- =============================================
CREATE PROCEDURE [dbo].[GetStatusPDF]
 @AccNo VARCHAR (50) = null,
 @Period Date = null

AS
BEGIN

DECLARE @Periode varchar(6) = substring(replace(convert(varchar,@Period),'-',''),1,6)
	
SELECT DISTINCT a.ID,
				a.AccountNo,
                Periode,
                @Periode AS Period,
                CIF,
                b.AccountName,
                TypeAccount,
                a.Branch,
                CONVERT(Varchar,GeneratePDFDate) AS GeneratePDFDate,
                GeneratePDFLog 
                FROM [SQL_Statement].[dbo].[MasterPDF] a
JOIN [SQL_Statement].[dbo].[HeaderTextFile] b ON a.AccountNo=b.AccountNo
WHERE a.Period = @Periode
      AND b.Periode = LTRIM([dbo].fn_indonesian_date(@Period))
	  AND a.AccountNo = @AccNo
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Import_TextFile_Report]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Import_TextFile_Report] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @file_path nvarchar(50);
	declare @sql nvarchar(500);
	create table #FileContents ( LineNumber int identity (1, 1), LineContents text )
	select
		@file_path = 'F:\E-STATEMENT files\KCPI.STMT',
		@sql = 'insert into #FileContents
		select f.BulkColumn 
		from openrowset
		(
			bulk ''' + @file_path + ''',
			single_clob 
		) f;';

	exec (@sql);

	--create table #Header( Id int identity (1, 1), Periode varchar(25), CIF varchar(15), Account_No varchar(50), Account_Name varchar(225),Currency varchar(25), Alamat_1 varchar(225),Alamat_2 varchar(225),Alamat_3 varchar(225),NPWP varchar(225),Old_AcctNo varchar(225))
	SELECT REPLACE(SUBSTRING(Item,89,4),' ','') as no_halaman
		,SUBSTRING(Item,178,15) as Periode
		,SUBSTRING(Item,CHARINDEX(Item,(CHAR(13)+CHAR(10))),15) as Cabang
		 from dbo.SplitString((SELECT LineContents FROM #FileContents),'*')
	SELECT TOP 1 item from dbo.SplitString((SELECT LineContents FROM #FileContents),'*')  
      
	Drop table #FileContents
END

GO
/****** Object:  StoredProcedure [dbo].[InsertGiroFeeExclude]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertGiroFeeExclude]
/*
	CreateBy	: Eldwin
	CreateDate	: 20201006
	Objective	: Insert Giro Fee Exclude

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
@pAccountNo		varchar(20),
@pBranch		varchar(20),
@pInputBy		varchar(20),
@pInputDate		date,
@pErrMsg		varchar(200) = null output
AS
set nocount on

	INSERT INTO GiroFeeExclude(AccountNo,InputBranch,InputDate,InputBy)
	VALUES(@pAccountNo,@pBranch,@pInputDate,@pInputBy)

return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	--IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1


GO
/****** Object:  StoredProcedure [dbo].[InsertLog_GetPage]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [MasterParameter_GetPage] 9
-- =============================================
CREATE PROCEDURE [dbo].[InsertLog_GetPage] 
	@searchtext varchar(100)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT Id, Module, Process, LogMessage, TimeSpend, CreateBy, CreateDate FROM InsertLog a
	where ( a.Module like case when @searchtext = '' then a.Module else '%'+@searchtext+'%' end
	or a.Process like case when @searchtext = '' then a.Process else '%'+@searchtext+'%' end
	or a.CreateBy like case when @searchtext = '' then a.CreateBy else '%'+@searchtext+'%' end)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertLog1]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Calvin>
-- Create date: <2018-10-12>
-- Description:	<Insert Log Statement>
-- =============================================
CREATE PROCEDURE [dbo].[InsertLog1]
@module varchar (100),
@process varchar (100),
@logmessage varchar(100),
@timespend varchar(100),
@nik varchar(6)


AS
BEGIN

	SET NOCOUNT ON;

	
	insert into SQL_Statement.dbo.InsertLog
	values (@nik,GETDATE(),@timespend,@module,@process,@logmessage) 
	
	  
END


GO
/****** Object:  StoredProcedure [dbo].[Job_Get_RegisteredAccount_From_Temenos]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [dbo].[Job_Get_RegisteredAccount_From_Temenos] 
-- =============================================
CREATE PROCEDURE [dbo].[Job_Get_RegisteredAccount_From_Temenos] 
	-- Add the parameters for the stored procedure here
AS
BEGIN

	--DECLARE @tanggal varchar(6) = SUBSTRING(REPLACE(CONVERT(varchar,DATEADD(MONTH,-1,GETDATE()),112),'.',''),1,6)
	---- SET NOCOUNT ON added to prevent extra result sets from
	---- interfering with SELECT statements.
	--SET NOCOUNT ON;
	--if exists(SELECT Value FROM MasterParameter WHERE Id=10 AND value=DAY(GETDATE()))
	--begin
 --   -- Insert statements for procedure here
	--	INSERT INTO RegisteredAccount
	--	(
	--	StatementPeriod
	--	,CIF
	--	,AccountNo
	--	,BirthDate
	--	,Email
	--	,ProductCategory
	--	,CreateBy
	--	,CreateDate
	--	,StatusData
	--	,IsDelete
	--	)
	--	(
	--	--SELECT 
	--	--	@tanggal
	--	--	,c.[@ID]
	--	--	,b.account_no
	--	--	,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
	--	--	,c.email_1
	--	--	,a.Id
	--	--	,'By System'
	--	--	,GETDATE()
	--	--	,0
	--	--	,0
	--	--FROM MasterProduct a 
	--	--JOIN SQL_TEMENOS.dbo.ACCOUNT b 
	--	--	ON a.Code=b.category 
	--	--JOIN SQL_TEMENOS.dbo.CUSTOMER c 
	--	--	ON b.customer_no =c.[@ID]
	--	--WHERE a.IsDelete=0 and a.IsActive=1
	--	--and b.account_no not in(select d.AccountNo from RegisteredAccount d where d.AccountNo=b.account_no and d.StatementPeriod=@tanggal) 
	--	SELECT 
	--		@tanggal
	--		,c.[@ID]
	--		,b.account_no
	--		,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
	--		,c.email_1
	--		,a.Id
	--		,'By System'
	--		,GETDATE()
	--		,0
	--		,0
	--	FROM MasterProduct a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b 
	--		ON a.Code=b.category 
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c 
	--		ON b.customer_no =c.[@ID]
	--	left join RegisteredAccount d on d.AccountNo=b.account_no and d.StatementPeriod = @tanggal
	--	WHERE a.IsDelete=0 and a.IsActive=1
	--	)
	--end
	
	
	
	DECLARE @tanggal varchar(6) =  SUBSTRING(REPLACE(CONVERT(varchar,DATEADD(MONTH,0,GETDATE()),112),'.',''),1,6)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if exists(SELECT Value FROM MasterParameter WHERE Id=10 AND value=DAY('2020-09-26'))
	begin
	
    -- Insert statements for procedure here
		INSERT INTO RegisteredAccount
		(
		StatementPeriod
		,CIF
		,AccountNo
		,BirthDate
		,Email
		,ProductCategory
		,CreateBy
		,CreateDate
		,StatusData
		,IsDelete
		,Email_Sts
		)
		(
		--SELECT 
		--	@tanggal
		--	,c.[@ID]
		--	,b.account_no
		--	,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
		--	,c.email_1
		--	,a.Id
		--	,'By System'
		--	,GETDATE()
		--	,0
		--	,0
		--FROM MasterProduct a 
		--JOIN SQL_TEMENOS.dbo.ACCOUNT b 
		--	ON a.Code=b.category 
		--JOIN SQL_TEMENOS.dbo.CUSTOMER c 
		--	ON b.customer_no =c.[@ID]
		--WHERE a.IsDelete=0 and a.IsActive=1
		--and b.account_no not in(select d.AccountNo from RegisteredAccount d where d.AccountNo=b.account_no and d.StatementPeriod=@tanggal) 
		SELECT 
			@tanggal
			,c.[@ID]
			,b.account_no
			--,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
			,case when c.sector IN ('2001','3054') then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end -- harsan 2020-05-08
			--,case when CHARINDEX('|',c.email_1) > 0 then LEFT(c.email_1,CHARINDEX('|',c.email_1)-1) else c.email_1 end as email_1
			--20191219 , Ferry Begin
			--,REPLACE(c.email_1,'|',',') as email_1 
			,CASE WHEN RIGHT(c.email_1, 1) IN ('|') 
                THEN REPLACE(left(c.email_1,len(c.email_1) - 1),'|',',')
              WHEN LEFT(c.email_1, 1) IN ('|') 
                THEN REPLACE(RIGHT(c.email_1,len(c.email_1) - 1),'|',',') 
                ELSE REPLACE(c.email_1,'|',',')
                END as email_1 
			--20191219 , Ferry End
			,a.Id
			,'By System'
			,GETDATE()
			,0
			,0
			,CASE WHEN b.ac_sta_status in ('Email', 'Post') THEN 'Y' ELSE 'N' END 
		FROM MasterProduct a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b 
			ON a.Code=b.category COLLATE DATABASE_DEFAULT  
		JOIN SQL_TEMENOS.dbo.CUSTOMER c 
			ON b.customer_no =c.[@ID]
		left join RegisteredAccount d on d.AccountNo=b.account_no COLLATE DATABASE_DEFAULT and d.StatementPeriod = @tanggal COLLATE DATABASE_DEFAULT  
		left join SQL_TEMENOS.dbo.account_closed e on b.account_no = e.[@ID]
		WHERE a.IsDelete=0 and a.IsActive=1 and ( b.ac_sta_status in ('Email', 'post', 'Hold') OR b.ac_sta_status is null)
		--and e.[@ID] is null and b.inactiv_marker is null and left(a.Code,1) = 1
		and e.[@ID] is null and left(a.Code,1) = 1
		)

		---insert selain giro tanpa melihat account status
		INSERT INTO RegisteredAccount
		(
		StatementPeriod
		,CIF
		,AccountNo
		,BirthDate
		,Email
		,ProductCategory
		,CreateBy
		,CreateDate
		,StatusData
		,IsDelete
		,Email_Sts
		)
		(
		SELECT 
			@tanggal
			,c.[@ID]
			,b.account_no
			--,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
			,case when c.sector IN ('2001','3054') then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end -- harsan 2020-05-08
			--20191219 , Ferry Begin
			--,REPLACE(c.email_1,'|',',') as email_1 
			,CASE WHEN RIGHT(c.email_1, 1) IN ('|') 
                THEN REPLACE(left(c.email_1,len(c.email_1) - 1),'|',',')
              WHEN LEFT(c.email_1, 1) IN ('|') 
                THEN REPLACE(RIGHT(c.email_1,len(c.email_1) - 1),'|',',') 
                ELSE REPLACE(c.email_1,'|',',')
                END as email_1 
			--20191219 , Ferry End
			,a.Id
			,'By System'
			,GETDATE()
			,0
			,0
			,'Y'
		FROM MasterProduct a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b 
			ON a.Code=b.category COLLATE DATABASE_DEFAULT  
		JOIN SQL_TEMENOS.dbo.CUSTOMER c 
			ON b.customer_no =c.[@ID]
		left join RegisteredAccount d on d.AccountNo=b.account_no COLLATE DATABASE_DEFAULT and d.StatementPeriod = @tanggal COLLATE DATABASE_DEFAULT  
		left join SQL_TEMENOS.dbo.account_closed e on b.account_no = e.[@ID]
		WHERE a.IsDelete=0 and a.IsActive=1
		--and e.[@ID] is null and b.inactiv_marker is null and left(a.Code,1) != 1
		and e.[@ID] is null and left(a.Code,2) = 65
		)


		INSERT INTO RegisteredAccount
		(
		StatementPeriod
		,CIF
		,AccountNo
		,BirthDate
		,Email
		,ProductCategory
		,CreateBy
		,CreateDate
		,StatusData
		,IsDelete
		,Email_Sts
		)
		(
		--SELECT 
		--	@tanggal
		--	,c.[@ID]
		--	,b.account_no
		--	,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
		--	,c.email_1
		--	,a.Id
		--	,'By System'
		--	,GETDATE()
		--	,0
		--	,0
		--FROM MasterProduct a 
		--JOIN SQL_TEMENOS.dbo.ACCOUNT b 
		--	ON a.Code=b.category 
		--JOIN SQL_TEMENOS.dbo.CUSTOMER c 
		--	ON b.customer_no =c.[@ID]
		--WHERE a.IsDelete=0 and a.IsActive=1
		--and b.account_no not in(select d.AccountNo from RegisteredAccount d where d.AccountNo=b.account_no and d.StatementPeriod=@tanggal) 
		SELECT 
			@tanggal
			,c.[@ID]
			,b.account_no
			--,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
			,case when c.sector IN ('2001','3054') then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end -- harsan 2020-05-08
			--,case when CHARINDEX('|',c.email_1) > 0 then LEFT(c.email_1,CHARINDEX('|',c.email_1)-1) else c.email_1 end as email_1
			--20191219 , Ferry Begin
			--,REPLACE(c.email_1,'|',',') as email_1 
			,CASE WHEN RIGHT(c.email_1, 1) IN ('|') 
                THEN REPLACE(left(c.email_1,len(c.email_1) - 1),'|',',')
              WHEN LEFT(c.email_1, 1) IN ('|') 
                THEN REPLACE(RIGHT(c.email_1,len(c.email_1) - 1),'|',',') 
                ELSE REPLACE(c.email_1,'|',',')
                END as email_1 
			--20191219 , Ferry End
			,a.Id
			,'By System'
			,GETDATE()
			,0
			,0
			,'Y'
		FROM MasterProduct a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b 
			ON a.Code=b.category COLLATE DATABASE_DEFAULT  
		JOIN SQL_TEMENOS.dbo.CUSTOMER c 
			ON b.customer_no =c.[@ID]
		left join RegisteredAccount d on d.AccountNo=b.account_no COLLATE DATABASE_DEFAULT  and d.StatementPeriod = @tanggal COLLATE DATABASE_DEFAULT  
		left join SQL_TEMENOS.dbo.account_closed e on b.account_no = e.[@ID]
		WHERE a.IsDelete=0 and a.IsActive=1 
		--and b.ac_sta_status in ('Email', 'post')
		--and e.[@ID] is null and b.inactiv_marker is null and left(a.Code,1) = 1
		and e.[@ID] is null and left(a.Code,2) = 60
		)

		--kebutuhan development
		--update RegisteredAccount set Email='mujaeni.mujaeni@bankmayora.co.id;fatkhur.rozi@bankmayora.co.id;eka.mahendra@bankmayora.co.id' 
		--where StatementPeriod = @tanggal

--20200814, jeni, begin
--nambah daftar blacklist karna fraud
		delete from RegisteredAccount 
		where StatementPeriod = @tanggal
		and AccountNo in ('6000422647','6000444942')
--20200814, jeni, end		
	end
	
	
	
	
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Job_InsertTablePDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <>
-- Description:	<>
-- EXEC [dbo].[Job_InsertTablePDF_OldProduct]
-- =============================================
CREATE PROCEDURE [dbo].[Job_InsertTablePDF]

AS
BEGIN

SET NOCOUNT ON;

IF (DAY(GETDATE()) = (SELECT Value FROM [SQL_Statement].[dbo].[MasterParameter] Where ID=2))
BEGIN

DECLARE @Tgl DATE,
	@HargaLembar money

SET @Tgl = CONVERT(DATE,DATEADD(MONTH,-1,GETDATE()))

select @HargaLembar = [Value] from MasterParameter
where Name='HargaPerLembar'

CREATE TABLE #TEMP_ACCOUNTSTATEMENT(
	[PK] bigint,
	[ID_STMT_ENTRY] varchar(50) NULL,
	[batch_date] date NULL,
	[date_time] varchar(50) NULL,
	[customer_no] varchar(50) NULL,
	[account_number] varchar(50) NULL,
	[account_name] varchar(900) NULL,
	[start_bal] decimal(38, 2) NULL,
	[debit] decimal(38, 2) NULL,
	[credit] decimal(38, 2) NULL,
	[saldo] decimal(38, 2) NULL,
	[currency] varchar(50) NULL,
	[transaction_code] varchar(50) NULL,
	[transaction_desc] varchar(900) NULL,
	[narrative] varchar(900) NULL,
	[system_id] varchar(50) NULL,
	[our_reference] varchar(50) NULL,
	[term_type] varchar(50) NULL,
	[term_id] varchar(50) NULL,
	[card_no] varchar(50) NULL,
	[recipt_no] varchar(50) NULL,
	[transaction_date] date NULL,
	[transaction_time] varchar(50) NULL,
	[terminal_id] varchar(50) NULL,
	[dealer_name] varchar(100) NULL,
	[feature_name] varchar(100) NULL,
	[product_ref] varchar(50) NULL,
	[customer_number] varchar(50) NULL,
	[retrieval_ref_number] varchar(50) NULL,
	[id_reference] varchar(50) NULL,
	[amount_lcy] decimal(38, 2) NULL,
	[debit_acct_no] varchar(50) NULL,
	[credit_acct_no] varchar(50) NULL,
	[debit_amount] decimal(38, 2) NULL,
	[credit_amount] decimal(38, 2) NULL,
	[dr_narrative] varchar(900) NULL,
	[cr_narrative] varchar(900) NULL,
	[transaction_type] varchar(50) NULL,
	[trans_reff] varchar(50) NULL,
	[core_ref] varchar(50) NULL,
	[feature_code] varchar(50) NULL,
	[selling_price] decimal(18, 2) NULL,
	[card_number] varchar(100) NULL,
	[product_code] varchar(100) NULL,
	[dealer_code] varchar(50) NULL,
	[product_category] varchar(50) NULL,
	[product_name] varchar(900) NULL,
	[keterangan] varchar(900) NULL,
	[cek_giro] varchar(3) NULL,
	[cek_giro_account_no] varchar(50) NULL,
	[cek_giro_no] bigint NULL

)

CREATE TABLE #ACCNUM(
Acc_No varchar (50)
)

CREATE TABLE #ACCNUMDETAIL(
id INT IDENTITY(1,1),
JumlahTransaksi int,
Acc_No varchar (50),
JumlahHalaman int,
periode varchar (50),
CIF varchar (100),
AccountName varchar (900),
kurs varchar(50),
Alamat1 varchar(250),
Alamat2 varchar(250),
Alamat3 varchar(250),
NPWP varchar(50),
OldAcctNo varchar(30),
cabang varchar(30),
TypeAccount varchar(50)
)

CREATE TABLE #DETAILBODYTEMP(
id INT IDENTITY(1,1),
Acc_No varchar (50),
account_name varchar (100)
      ,Tanggal varchar(10)
      ,Valuta varchar(10)
      ,[SaldoAwal]  decimal(38, 2)
      ,[SaldoAkhir] decimal(38, 2)
      ,[Debet] decimal(38, 2)
      ,[Kredit] decimal(38, 2)
      ,Detail varchar(150)
      ,Narative varchar(250)
      ,NoRef varchar(30)
)



INSERT INTO #ACCNUM (Acc_No)
SELECT AccountNo FROM [SQL_Statement].[dbo].[RegisteredAccount] 
where StatementPeriod = substring(replace(convert(varchar,CONVERT(DATE,@Tgl)),'-',''),1,6)



INSERT INTO #TEMP_ACCOUNTSTATEMENT(
	   [PK]
      ,[ID_STMT_ENTRY]
      ,[batch_date]
      ,[date_time]
      ,[customer_no]
      ,[account_number]
      ,[account_name]
      ,[start_bal]
      ,[debit]
      ,[credit]
      ,[saldo]
      ,[currency]
      ,[transaction_code]
      ,[transaction_desc]
      ,[narrative]
      ,[system_id]
      ,[our_reference]
      ,[term_type]
      ,[term_id]
      ,[card_no]
      ,[recipt_no]
      ,[transaction_date]
      ,[transaction_time]
      ,[terminal_id]
      ,[dealer_name]
      ,[feature_name]
      ,[product_ref]
      ,[customer_number]
      ,[retrieval_ref_number]
      ,[id_reference]
      ,[amount_lcy]
      ,[debit_acct_no]
      ,[credit_acct_no]
      ,[debit_amount]
      ,[credit_amount]
      ,[dr_narrative]
      ,[cr_narrative]
      ,[transaction_type]
      ,[trans_reff]
      ,[core_ref]
      ,[feature_code]
      ,[selling_price]
      ,[card_number]
      ,[product_code]
      ,[dealer_code]
      ,[product_category]
      ,[product_name]
      ,[keterangan]
      ,[cek_giro]
      ,[cek_giro_account_no]
      ,[cek_giro_no])
	
SELECT [PK]
      ,[ID_STMT_ENTRY]
      ,[batch_date]
      ,[date_time]
      ,[customer_no]
      ,[account_number]
      ,[account_name]
      ,[start_bal]
      ,[debit]
      ,[credit]
      ,[saldo]
      ,[currency]
      ,[transaction_code]
      ,[transaction_desc]
      ,[narrative]
      ,[system_id]
      ,[our_reference]
      ,[term_type]
      ,[term_id]
      ,[card_no]
      ,[recipt_no]
      ,[transaction_date]
      ,[transaction_time]
      ,[terminal_id]
      ,[dealer_name]
      ,[feature_name]
      ,[product_ref]
      ,[customer_number]
      ,[retrieval_ref_number]
      ,[id_reference]
      ,[amount_lcy]
      ,[debit_acct_no]
      ,[credit_acct_no]
      ,[debit_amount]
      ,[credit_amount]
      ,[dr_narrative]
      ,[cr_narrative]
      ,[transaction_type]
      ,[trans_reff]
      ,[core_ref]
      ,[feature_code]
      ,[selling_price]
      ,[card_number]
      ,[product_code]
      ,[dealer_code]
      ,[product_category]
      ,[product_name]
      ,[keterangan]
      ,[cek_giro]
      ,[cek_giro_account_no]
      ,[cek_giro_no] FROM [SQL_TEMENOS].[dbo].[ACCOUNT_STATEMENT] a
JOIN MasterProduct b ON a.product_category=b.code 
WHERE YEAR(batch_date) = YEAR(@Tgl) and MONTH(batch_date)= MONTH(@Tgl) and b.IsDelete=0 


INSERT INTO #ACCNUMDETAIL(
JumlahTransaksi,
Acc_No ,
JumlahHalaman,
periode,
CIF,
AccountName,
kurs,
Alamat1,
Alamat2,
Alamat3,
NPWP,
OldAcctNo,
cabang,
TypeAccount
)		
SELECT COUNT(a.[account_number])AS JumlahTransaksi, 
       a.[account_number],
       CASE WHEN COUNT(a.[account_number])%11=0 
       THEN COUNT(a.[account_number])/11 
       ELSE COUNT(a.[account_number])/11+1 END AS JumlahHalaman,
       LTRIM(CONVERT (VARCHAR,[dbo].[fn_indonesian_date](@Tgl))) AS PERIODE,
       a.[customer_no],
       (SELECT TOP 1 [account_name] FROM #TEMP_ACCOUNTSTATEMENT where [account_number]=a.[account_number]) as [account_name],
       a.[currency],
       [address],
       [street],
       [deskripsi],
       [cus_npwp],
       [alt_acct_id],
       [company_name],
       [description]

FROM #ACCNUM b
JOIN #TEMP_ACCOUNTSTATEMENT a ON a.[account_number] = b.Acc_No
JOIN [SQL_TEMENOS].[dbo].[ACCOUNT] d ON d.account_no = b.Acc_No
JOIN [SQL_TEMENOS].[dbo].[CUSTOMER] c ON a.[customer_no] = c.[customer_no]
LEFT JOIN [SQL_TEMENOS].[dbo].[COMPANY] e ON e.[@ID] = d.[co_code]
LEFT JOIN [SQL_TEMENOS].[dbo].[CATEGORY] f ON f.[@ID] = a.product_category
LEFT JOIN [SQL_TEMENOS].[dbo].[MAP_CITY] g ON g.[kode] = c.[town_country]

GROUP BY a.[account_number],
         a.customer_no,
         a.[account_name],
         a.[currency],
         [address],
         [street],
         [cus_npwp],
         [alt_acct_id],
         company_name,
         [description],
         [deskripsi]
ORDER BY COUNT(a.[account_number]) DESC;



DECLARE @norek varchar(100),@count int=1,@countMAX int, @jmlhhal int, @countHal int
	
SELECT @countMAX=max(id) 
FROM #ACCNUMDETAIL	


WHILE ( @count < @countMAX+1)

BEGIN

SELECT @jmlhhal=JumlahHalaman, @norek=Acc_No 
FROM #ACCNUMDETAIL where id=@count

DECLARE @counter int=1, @idHEAD bigint, @a int=1, @z int=11, @saldoawal varchar(100), @saldoakhir varchar(100), @totalkredit varchar(100)=0,
@FreqDebet varchar(100)=0, @FreqKredit varchar(100)=0, @saldoMin varchar(100)=null, @saldoMax varchar(100)=null, @maxID bigint, @totaldebet varchar(100)=0


INSERT INTO #DETAILBODYTEMP( 
       Acc_No
      ,account_name
      ,Tanggal 
      ,Valuta 
      ,[SaldoAwal]
      ,[SaldoAkhir]
      ,[Debet] 
      ,[Kredit] 
      ,Detail 
      ,Narative 
      ,NoRef 
)

SELECT account_number
      ,account_name
      ,CONVERT(VARCHAR,batch_date,112) AS tanggal
      ,'20'+substring([date_time],0,7) AS Valuta
      ,start_bal
      ,saldo
      ,debit
      ,credit
      ,transaction_desc
      , CASE WHEN transaction_code in (2, 201, 231, 216) then
		REPLACE(keterangan COLLATE DATABASE_DEFAULT,'ý',' ')+ ' Cheque No: ' + convert(varchar,isnull(cek_giro_no,'')) 
	    ELSE
		REPLACE(keterangan COLLATE DATABASE_DEFAULT,'ý',' ') END AS narrative
      ,CASE WHEN our_reference IS NULL THEN substring(narrative,CHARINDEX('ref : ',narrative)+6,100)
       ELSE our_reference END AS NoRef  
 FROM #TEMP_ACCOUNTSTATEMENT
 WHERE [account_number] = @norek	
 ORDER BY batch_date,PK


WHILE (@counter<@jmlhhal+1)
BEGIN

INSERT INTO [SQL_Statement].[dbo].[HeaderTextFile](
 Periode
,CIF
,AccountNo
,AccountName
,Currency
,Alamat1
,Alamat2
,Alamat3
,NPWP
,OldAcctNo
,cabang
,TypeAccount
,CreateBy
,CreateDate
,UpdateBy
,UpdateDate
,ApproveBy
,ApproveDate
,RejectBy
,RejectDate
,RejectReason
,CompanyId
,BranchId
,StatusData
,IsDelete
)
SELECT periode,
       CIF,
       Acc_No,
       AccountName,
       kurs,
       Alamat1,
       Alamat2,
       Alamat3,
       NPWP,
       OldAcctNo, 
       cabang,
       TypeAccount,
       'System',
       GETDATE(),
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       0,
       0
       FROM #ACCNUMDETAIL where id=@count	

SELECT @idHEAD = @@IDENTITY 

IF(@counter=1)

begin
SELECT @saldoawal= [SaldoAwal] FROM #DETAILBODYTEMP where id=1
end

ELSE

begin
SELECT @saldoawal= [SaldoAkhir] FROM #DETAILBODYTEMP where id=@z-11
end


SELECT @maxID=max(id) 
FROM #DETAILBODYTEMP where id between @a AND @z 

SELECT @saldoakhir=[SaldoAkhir] 
FROM #DETAILBODYTEMP where id=@maxID

SELECT @totaldebet=@totaldebet+ISNULL(sum(Debet),0.00),@FreqDebet=@FreqDebet+count(Debet) 
FROM #DETAILBODYTEMP where Debet<>'0.00' AND id between @a AND @z 

SELECT @totalkredit=@totalkredit+ISNULL(sum(Kredit),0.00),@FreqKredit=@FreqKredit+count(Kredit) 
FROM #DETAILBODYTEMP where Kredit<>'0.00' AND id between @a AND @z 


IF (@saldoMin>(SELECT min([SaldoAkhir])FROM #DETAILBODYTEMP where id between @a AND @z ) OR @saldoMin IS NULL)

BEGIN 
SELECT @saldoMin=min([SaldoAkhir]) 
FROM #DETAILBODYTEMP where id between @a AND @z 
END 


IF (@saldoMax<(SELECT max([SaldoAkhir])FROM #DETAILBODYTEMP where id between @a AND @z ) OR @saldoMax IS NULL)

BEGIN 
SELECT @saldoMax=max([SaldoAkhir]) 
FROM #DETAILBODYTEMP where id between @a AND @z 
END 


INSERT INTO [SQL_Statement].[dbo].[DetailFooter](
 IDHeader
,NoHalaman
,SaldoAwal
,SaldoAkhir
,TotalDebet
,TotalKredit
,FrekuensiDebet
,FrekuensiKredit
,SaldoTerendah
,SaldoTertinggi
,CreateBy
,CreateDate
,UpdateBy
,UpdateDate
,ApproveBy
,ApproveDate
,RejectBy
,RejectDate
,RejectReason
,CompanyId
,BranchId
,StatusData
,IsDelete
)
VALUES(@idHEAD
      ,@counter
      ,@saldoawal
      ,@saldoakhir
      ,ISNULL(@totaldebet,'0.00')
      ,ISNULL(@totalkredit,'0.00')
      ,@FreqDebet
      ,@FreqKredit
      ,@saldoMin
      ,@saldoMax,
       'System',
       GETDATE(),
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       0,
       0 )
       

INSERT INTO [SQL_Statement].[dbo].[DetailBody](
 IDHeader
,Detail
,Tanggal
,Valuta
,Narative
,NoRef
,Debet
,Kredit
,Saldo
,CreateBy
,CreateDate
,UpdateBy
,UpdateDate
,ApproveBy
,ApproveDate
,RejectBy
,RejectDate
,RejectReason
,CompanyId
,BranchId
,StatusData
,IsDelete
)
SELECT  @idHEAD
        ,Detail 
        ,Tanggal 
        ,Valuta
        ,[Narative]
        ,[NoRef]
        ,Debet
        ,Kredit
        ,[SaldoAkhir]
        ,'System'
        ,GETDATE()
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,0
        ,0
        
FROM #DETAILBODYTEMP
WHERE id between @a AND @z

SET @counter  = @counter  + 1
SET @a=@a+11
SET @z=@z+11

END

TRUNCATE TABLE #DETAILBODYTEMP
SET @count = @count  + 1
END

select a.AccountNo, count(1) as Total 
into #TempTotalLembar
from HeaderTextFile a
	join SQL_TEMENOS.dbo.ACCOUNT b
		on a.AccountNo collate database_default = b.account_no
	left join GiroFeeExclude c
		on a.AccountNo = c.AccountNo
where Periode = LTRIM(CONVERT (VARCHAR,[dbo].[fn_indonesian_date](@Tgl)))
and isnull(b.ac_sta_status,'xxx') in ('xxx', 'HOLD', 'POST')
and TypeAccount like '%Giro%'
and c.AccountNo is null
group by a.AccountNo

update a set
	a.TotalLembar = b.Total,
	a.HargaLembar = 2500,
	a.IsGiroAccount = 1
from RegisteredAccount a
	join #TempTotalLembar b
		on a.AccountNo = b.AccountNo
where
	a.StatementPeriod = LEFT(replace(Convert(varchar(10), DATEADD(MONTH,-1,GETDATE()),102),'.',''),6)

DROP TABLE #TempTotalLembar
DROP TABLE #ACCNUMDETAIL
DROP TABLE #ACCNUM
DROP TABLE #DETAILBODYTEMP
DROP TABLE #TEMP_ACCOUNTSTATEMENT
  
END

END

GO
/****** Object:  StoredProcedure [dbo].[ListEmailProcessedGetPage]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fajri Sidik>
-- Create date: <24 August 2018>
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[ListEmailProcessedGetPage] 
 @Period Date = null,
 @param int = null,
 @searchText varchar(50) = null
	-- Add the parameters for the stored procedure here
AS
BEGIN

	--DECLARE @Periode varchar(6) = substring(replace(convert(varchar,@Period),'-',''),1,6)

	SET NOCOUNT ON;
	if @param = 1
	begin
    	SELECT CONVERT(INT,ROW_NUMBER() OVER (ORDER BY a.ID)) as Number
		,a.Id
		,SentEmailLog
		,substring(convert(varchar,convert(Date,a.Period+'01'),106),3,LEN(convert(varchar,convert(Date,Period+'01'),106))-2) as Period
		,ISNULL(LEFT(convert (varchar,a.CreateDate,113),17),'') as ProcessDate
		,LEFT(convert (varchar,a.UpdateDate,113),17) as LastProcessDate
		,a.AccountNo
		,c.ProductName as Category
		,(SELECT TOP 1 AccountName FROM HeaderTextFile WHERE AccountNo=a.AccountNo) as AccountName
		,ISNULL(Email,'') as Email
		,[Root]+'\'+Folder+'\'+[File] as Downloadpdf
		,d.ID as EmailTemplate
		,a.[File]
		,a.Content
		,a.Remark
		FROM MasterPDF a 
		JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo and a.Period = b.StatementPeriod
		JOIN MasterProduct c ON b.ProductCategory=c.Id
		LEFT JOIN MasterEmailTemplate d ON d.ProductCode = c.Code
		--JOIN HeaderTextFile d ON a.AccountNo=d.AccountNo
		WHERE a.success = 1 AND b.Isdelete = 0
		--20191029 Ady Begin 
		and (@searchText IS NULL
				OR (SELECT TOP 1 AccountName FROM HeaderTextFile WHERE AccountNo=a.AccountNo) LIKE '%' + @searchText + '%'
				OR b.AccountNo LIKE '%' + @searchText + '%'
				OR c.ProductName LIKE '%' + @searchText + '%'
				OR a.Remark LIKE '%' + @searchText + '%'
				OR Email LIKE '%' + @searchText + '%'
				)
		--20191029 Ady End
		--AND
		--(
		--	(MONTH(a.CreateDate) = MONTH(@Period) AND YEAR(a.CreateDate)=YEAR(@Period))
		--	OR @Period is null
		--)
	end
	else if @param = 2
	begin
		SELECT CONVERT(INT,ROW_NUMBER() OVER (ORDER BY a.ID)) as Number
		,a.Id
		,SentEmailLog
		,substring(convert(varchar,convert(Date,a.Period+'01'),106),3,LEN(convert(varchar,convert(Date,Period+'01'),106))-2) as Period
		,ISNULL(LEFT(convert (varchar,a.CreateDate,113),17),'') as ProcessDate
		,LEFT(convert (varchar,a.UpdateDate,113),17) as LastProcessDate
		,a.AccountNo
		,c.ProductName as Category
		,(SELECT TOP 1 AccountName FROM HeaderTextFile WHERE AccountNo=a.AccountNo) as AccountName
		,ISNULL(Email,'') as Email
		,[Root]+'\'+Folder+'\'+[File] as Downloadpdf
		,d.ID as EmailTemplate
		,a.[File]
		,a.Content
		,a.Remark
		FROM MasterPDF a 
		JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo and a.Period = b.StatementPeriod
		JOIN MasterProduct c ON b.ProductCategory=c.Id
		LEFT JOIN MasterEmailTemplate d ON d.ProductCode = c.Code
		--JOIN HeaderTextFile d ON a.AccountNo=d.AccountNo
		WHERE a.Failure <> 0 and a.success = 0 and b.Isdelete = 0
		--20191029 Ady Begin 
		and (@searchText IS NULL
				OR (SELECT TOP 1 AccountName FROM HeaderTextFile WHERE AccountNo=a.AccountNo) LIKE '%' + @searchText + '%'
				OR a.AccountNo LIKE '%' + @searchText + '%'
				OR c.ProductName LIKE '%' + @searchText + '%'
				OR a.Remark LIKE '%' + @searchText + '%'
				OR Email LIKE '%' + @searchText + '%'
				)
		--20191029 Ady End
		--AND
		--(
		--	(MONTH(a.CreateDate) = MONTH(@Period) AND YEAR(a.CreateDate)=YEAR(@Period))
		--	OR @Period is null
		--)
	end
END


GO
/****** Object:  StoredProcedure [dbo].[MasterEmailTemplate_Add]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterEmailTemplate_Add]
	-- Add the parameters for the stored procedure here
	@Name varchar(100) = null,
	@ProductCode varchar(10) = null,
	@Description varchar(500) = null,
	@Content varchar(max) = null,
	@createby varchar(max) = null,
	@branchId int = null,
	@companyId int = null
AS
BEGIN
	DECLARE @cErrorMessage varchar(max)
	SET NOCOUNT ON;

	if exists(SELECT ProductCode FROM MasterEmailTemplate WHERE ProductCode=@ProductCode and IsDelete = 0)
	begin
		SET @cErrorMessage = 'Product Code is exists';
	end

	if @cErrorMessage is not null
	begin
		goto ERROR
	end

	INSERT INTO MasterEmailTemplate(
	Name
	,[Description]
	,Content
	,ProductCode
	,CreateBy
	,CreateDate
	,BranchId
	,CompanyId
	,StatusData
	,IsDelete
	)
	VALUES(
	@Name
	,@Description
	,@Content
	,@ProductCode
	,@createby
	,GETDATE()
	,@branchId
	,@companyId
	,0
	,0
	)

	ERROR:
	if @cErrorMessage is not null
	begin
		raiserror 77777 @cErrorMessage
		return 1
	end
	return 0
END

GO
/****** Object:  StoredProcedure [dbo].[MasterEmailTemplate_Delete]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterEmailTemplate_Delete]
	-- Add the parameters for the stored procedure here
	@updateby varchar(max) = null,
	@branchId int = null,
	@companyId int = null,
	@ID int = null
AS
BEGIN
	UPDATE MasterEmailTemplate 
	SET UpdateBy = @updateby
		,UpdateDate = GETDATE()
		,BranchId = @branchId
		,CompanyId = @companyId
		,IsDelete = 1
	WHERE ID =  @ID
END

GO
/****** Object:  StoredProcedure [dbo].[MasterEmailTemplate_GetPage]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date1,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterEmailTemplate_GetPage]
	@ID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT MasterEmailTemplate.ID as ID
	,Name
	,ProductCode
	,MasterEmailTemplate.[Description] as [Description]
	,Content
	,ProductName 
	FROM [dbo].MasterEmailTemplate JOIN MasterProduct ON ProductCode=Code  
	where MasterEmailTemplate.isdelete=0 and MasterProduct.IsDelete=0
	and (MasterEmailTemplate.ID=@ID OR @ID is null)
END

GO
/****** Object:  StoredProcedure [dbo].[MasterEmailTemplate_Update]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterEmailTemplate_Update]
	-- Add the parameters for the stored procedure here
	@Name varchar(100) = null,
	@ProductCode varchar(10) = null,
	@Description varchar(500) = null,
	@Content varchar(max) = null,
	@updateby varchar(max) = null,
	@branchId int = null,
	@companyId int = null,
	@ID int = null
AS
BEGIN
	DECLARE @cErrorMessage varchar(max)
	SET NOCOUNT ON;

	if exists(SELECT ProductCode FROM MasterEmailTemplate WHERE ProductCode=@ProductCode and ID<>@ID and IsDelete=0)
	begin
		SET @cErrorMessage = 'Product Code is exists';
	end

	if @cErrorMessage is not null
	begin
		goto ERROR
	end

	UPDATE MasterEmailTemplate 
	SET Name = @Name
		,[Description] = @Description
		,Content = @Content
		,ProductCode = @ProductCode
		,UpdateBy = @updateby
		,UpdateDate = GETDATE()
		,BranchId = @branchId
		,CompanyId = @companyId
	WHERE ID =  @ID

	ERROR:
	if @cErrorMessage is not null
	begin
		raiserror 77777 @cErrorMessage
		return 1
	end
	return 0
END

GO
/****** Object:  StoredProcedure [dbo].[MasterParameter_Add]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterParameter_Add]
	-- Add the parameters for the stored procedure here
	@Name varchar(100) = null,
	@Value varchar(MAX) = null,
	@CreateBy varchar(Max) = null,
	@CompanyId int = null,
	@BranchId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO MasterParameter(
	 Name
	,Value
	,CreateBy
	,CreateDate
	,CompanyId
	,BranchId
	,StatusData
	,IsDelete
	)
	VALUES(
	@Name
	,@Value
	,@CreateBy
	,GETDATE()
	,@CompanyId
	,@BranchId
	,0
	,0
	)
END

GO
/****** Object:  StoredProcedure [dbo].[MasterParameter_Delete]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterParameter_Delete]
	-- Add the parameters for the stored procedure here
	@UpdateBy varchar(Max) = null,
	@CompanyId int = null,
	@BranchId int = null,
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE MasterParameter SET
	UpdateBy = @UpdateBy
	,UpdateDate = GETDATE()
	,CompanyId = @CompanyId
	,BranchId = @BranchId
	,IsDelete = 1
	WHERE ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[MasterParameter_GetPage]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [MasterParameter_GetPage] 9
-- =============================================
CREATE PROCEDURE [dbo].[MasterParameter_GetPage] 
	@Id int =  null
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT ID, Name, Value FROM MasterParameter WHERE IsDelete=0
	AND
	(ID = @Id OR @Id is null)
END

GO
/****** Object:  StoredProcedure [dbo].[MasterParameter_Update]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterParameter_Update]
	-- Add the parameters for the stored procedure here
	@Name varchar(100) = null,
	@Value varchar(MAX) = null,
	@UpdateBy varchar(Max) = null,
	@CompanyId int = null,
	@BranchId int = null,
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE MasterParameter SET
	 Name = @Name
	,Value = @Value
	,UpdateBy = @UpdateBy
	,UpdateDate = GETDATE()
	,CompanyId = @CompanyId
	,BranchId = @BranchId
	WHERE ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[MasterProduct_Add]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterProduct_Add]
	
	@ProductCode varchar(50) =null,
	@ProductName varchar(255) =null,
	@IsActive bit =null,
	@Description varchar(max) =null,
	@createby varchar(max) = null,
	@companyid int =null,
	@branchid int =null
AS
BEGIN
	declare @cErrMsg varchar(100)
	SET NOCOUNT ON;

	if exists(SELECT Code FROM [dbo].[MasterProduct] WHERE Code=@ProductCode and IsDelete=0)
	begin
		select @cErrMsg = 'Product Code already exists'
	end

	if @cErrMsg is not null
	begin
		goto ERROR
	end
    -- Insert statements for procedure here
	INSERT INTO [dbo].[MasterProduct]
           (Code
           ,ProductName
           ,[Description]
		   ,IsActive
		   ,[CreateBy]
		   ,[CreateDate]
		   ,[CompanyId]
		   ,[BranchId]
		   ,[StatusData]
		   ,[IsDelete] )
         
     VALUES
           (@ProductCode
           ,@ProductName
           ,@Description
		   ,@IsActive
		   ,@createby
		   ,GETDATE()
		   ,@companyid
		   ,@branchid
		   ,0
		   ,0)

	ERROR:
	if @cErrMsg is not null
	begin		
		raiserror 77777 @cErrMsg
		return 1
	end
	return 0
END

GO
/****** Object:  StoredProcedure [dbo].[MasterProduct_Delete]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterProduct_Delete]
	@Id int = null,
	@ProductCode varchar(50) =null,
	@ProductName varchar(255) =null,
	@IsActive bit =null,
	@Description varchar(max) =null,
	@updateby varchar(max) = null,
	@companyid int =null,
	@branchid int =null
AS
BEGIN
	declare @cErrMsg varchar(100)
	SET NOCOUNT ON;

	if exists(SELECT Code FROM [dbo].[MasterProduct] WHERE Code=@ProductCode and IsDelete=0 and Id <>@Id)
	begin
		select @cErrMsg = 'Product Code already exists'
	end

	if @cErrMsg is not null
	begin
		goto ERROR
	end
    -- Insert statements for procedure here
	UPDATE [MasterProduct] SET IsDelete = 1,
		UpdateBy=@updateby,CompanyId = @companyid, BranchId = @branchid, UpdateDate=GETDATE() WHERE Id = @Id
	ERROR:
	if @cErrMsg is not null
	begin		
		raiserror 77777 @cErrMsg
		return 1
	end
	return 0
END

GO
/****** Object:  StoredProcedure [dbo].[MasterProduct_GetPage]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterProduct_GetPage]
	-- Add the parameters for the stored procedure here
	--862020
		@searchtext varchar(100)
	--	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT Id,Code, ProductName, IsActive, [Description] From MasterProduct WHERE IsDelete=0
	
	--862020
	SELECT Id,Code, ProductName, IsActive, [Description] From MasterProduct WHERE IsDelete=0
	and (@searchText is null or @searchText = '' or Code like '%'+@searchText+'%') 
	or (@searchText is null or @searchText = '' or ProductName like '%'+@searchText+'%') 
	or (@searchText is null or @searchText = '' or [Description] like '%'+@searchText+'%') 
	--
END

GO
/****** Object:  StoredProcedure [dbo].[MasterProduct_Update]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterProduct_Update]
	@Id int = null,
	@ProductCode varchar(50) =null,
	@ProductName varchar(255) =null,
	@IsActive bit =null,
	@Description varchar(max) =null,
	@updateby varchar(max) = null,
	@companyid int =null,
	@branchid int =null
AS
BEGIN
	declare @cErrMsg varchar(100)
	SET NOCOUNT ON;

	if exists(SELECT Code FROM [dbo].[MasterProduct] WHERE Code=@ProductCode and IsDelete=0 and Id <>@Id)
	begin
		select @cErrMsg = 'Product Code already exists'
	end

	if @cErrMsg is not null
	begin
		goto ERROR
	end
    -- Insert statements for procedure here
	UPDATE [MasterProduct] SET Code = @ProductCode, ProductName = @ProductName,IsActive=@IsActive,[Description]=@Description,
		UpdateBy=@updateby,CompanyId = @companyid, BranchId = @branchid, UpdateDate=GETDATE() WHERE Id = @Id
	ERROR:
	if @cErrMsg is not null
	begin		
		raiserror 77777 @cErrMsg
		return 1
	end
	return 0
END

GO
/****** Object:  StoredProcedure [dbo].[MasterPromotion_Add]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterPromotion_Add] 
	-- Add the parameters for the stored procedure here
	@Name varchar(200) = null,
	@ProductCode varchar(10) = null,
	@Message varchar(300) = null,
	@PeriodFrom Date = null,
	@PeriodTo Date = null,
	@createby varchar = null,
	@companyid int = null,
	@branchid int = null
AS
BEGIN
	declare @cErrorMessage varchar(max)
	SET NOCOUNT ON;

	if Datediff(day,@PeriodTo,@PeriodFrom) > 0
	begin
		select @cErrorMessage = 'Period To must not be greater than Period From'
	end
	else if exists(SELECT ProductCode FROM MasterPromotion a JOIN masterproduct b ON ProductCode=b.Code WHERE (
		(@PeriodFrom BETWEEN PeriodFrom And PeriodTo)
			OR (@PeriodTo BETWEEN PeriodFrom AND PeriodTo)
		)
		AND ProductCode=@ProductCode AND a.IsDelete=0 and b.IsDelete=0)
	begin
		select @cErrorMessage = 'Product Code is Exists Between Period From And Period To'
	end
	
	if @cErrorMessage is not null
	begin 
		GOTO ERROR
	end
    -- Insert statements for procedure here
	INSERT INTO MasterPromotion(
	Name
	,ProductCode
	,PeriodFrom
	,PeriodTo
	,[Message]
	,CreateBy
	,CreateDate
	,CompanyId
	,BranchId
	,StatusData
	,IsDelete
	) 
	Values 
	(
	@Name
	,@ProductCode
	,@PeriodFrom
	,@PeriodTo
	,@Message
	,@createby
	,GETDATE()
	,@companyId
	,@branchid
	,0
	,0
	)
	ERROR:
	if	@cErrorMessage is not null
	begin
		raiserror 77777 @cErrorMessage
		return 1
	end 
	return 0
END


GO
/****** Object:  StoredProcedure [dbo].[MasterPromotion_Delete]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterPromotion_Delete] 
	-- Add the parameters for the stored procedure here
	@updateby varchar = null,
	@companyid int = null,
	@branchid int = null,
	@Id int = null
AS
BEGIN
	-- Insert statements for procedure here
	UPDATE MasterPromotion SET 
	UpdateBy = @updateby
	,UpdateDate = GETDATE()
	,CompanyId = @companyId
	,BranchId = @branchid
	,IsDelete =1
	WHERE ID=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[MasterPromotion_GetPage]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterPromotion_GetPage]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT MasterPromotion.ID as ID
	,Name
	,ProductCode
	,[Message]
	,PeriodFrom
	,PeriodTo
	,ProductName
	 FROM [dbo].[MasterPromotion] JOIN MasterProduct ON ProductCode=Code
	 where MasterPromotion.isdelete=0
	 AND MasterProduct.IsDelete=0
END

GO
/****** Object:  StoredProcedure [dbo].[MasterPromotion_Update]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MasterPromotion_Update] 
	-- Add the parameters for the stored procedure here
	@Name varchar(200) = null,
	@ProductCode varchar(10) = null,
	@Message varchar(300) = null,
	@PeriodFrom Date = null,
	@PeriodTo Date = null,
	@updateby varchar = null,
	@companyid int = null,
	@branchid int = null,
	@Id int = null
AS
BEGIN
	declare @cErrorMessage varchar(max)
	SET NOCOUNT ON;

	if Datediff(day,@PeriodTo,@PeriodFrom) > 0
	begin
		select @cErrorMessage = 'Period To must not be greater than Period From'
	end
	else if exists(SELECT ProductCode FROM MasterPromotion a JOIN masterproduct b ON ProductCode=b.Code WHERE (
		(
			@PeriodFrom BETWEEN PeriodFrom And PeriodTo)
			OR (@PeriodTo BETWEEN PeriodFrom AND PeriodTo)
		)
		AND ProductCode=@ProductCode AND a.IsDelete=0 AND b.IsDelete=0 AND a.ID<>@Id)
	begin
		select @cErrorMessage = 'Product Code is Exists Between Period From And Period To'
	end
	
	if @cErrorMessage is not null
	begin 
		GOTO ERROR
	end
    -- Insert statements for procedure here
	UPDATE MasterPromotion SET 
	Name = @Name
	,ProductCode = @ProductCode
	,PeriodFrom = @PeriodFrom
	,PeriodTo = @PeriodTo
	,[Message] = @Message
	,UpdateBy = @updateby
	,UpdateDate = GETDATE()
	,CompanyId = @companyId
	,BranchId = @branchid
	WHERE ID=@Id

	ERROR:
	if	@cErrorMessage is not null
	begin
		raiserror 77777 @cErrorMessage
		return 1
	end 
	return 0
END


GO
/****** Object:  StoredProcedure [dbo].[RegisteredAccount_GetPage]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec [dbo].[RegisteredAccount_GetPage] '2018-09-07','151407','List Account','Get Account'
-- =============================================
CREATE PROCEDURE [dbo].[RegisteredAccount_GetPage]
@Period Date = null,
@niklogin varchar(6),
@module varchar(100),
@process varchar(100)
AS
BEGIN
	DECLARE @Periode varchar(6) = substring(replace(convert(varchar,@Period),'-',''),1,6)
	SET NOCOUNT ON;
	declare @totaldata varchar(100)
	declare @processLogFinish varchar(100)
	DECLARE @t1 DATETIME;
	DECLARE @t2 DATETIME;
	declare @timespend varchar(100)


	------------------------------SP Insert Log Start---------------------------------------
	--exec [dbo].[InsertLog1] @module, @process, 'Start Get Account','0',@niklogin
	SET @t1 = GETDATE();
		SELECT convert(int,ROW_NUMBER() OVER(ORDER BY BirthDate)) as number
		,a.ID
		,CIF
		,AccountNo
		,ISNULL(Email,'') as Email
		,StatementPeriod
		,b.ProductName as ProductCategory
		,case 		WHEN BirthDate is null AND (dbo.fnAppEmailCheck(email) = 0)
		 THEN 'Invalid Email & date of birth'
			WHEN BirthDate is null AND (dbo.fnAppEmailCheck(email) = 1)
			THEN 'Invalid date of birth'
			WHEN (dbo.fnAppEmailCheck(email) = 0) AND BirthDate is not null
			THEN 'Invalid Email'
		    else  'Valid data'
			end as Remark
		,ProductCategory 
		FROM RegisteredAccount a JOIN MasterProduct b ON a.ProductCategory=b.Id
		WHERE 
		(StatementPeriod =@Periode OR @Periode is null)
		AND 
		a.IsDelete=0 ORDER BY BirthDate ;
	SET @t2 = GETDATE();
	SELECT @timespend = DATEDIFF(second,@t1,@t2);
    
	
	----------------------------SP Insert Log Finish---------------------------------------------
	select @totaldata = COUNT(*) FROM RegisteredAccount a 
	JOIN MasterProduct b ON a.ProductCategory=b.Id
	WHERE 
	(StatementPeriod =@Periode OR @Periode is null)
	AND 
	a.IsDelete=0
	
	set @processLogFinish = 'Finish Get Account - '+@totaldata+' record processed'
	
	--exec [dbo].[InsertLog1] @module, @process, @processLogFinish, @timespend, @niklogin

END

GO
/****** Object:  StoredProcedure [dbo].[Send_Email_Error_Log]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Calvin>
-- Create date: <2018/10/19>
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Send_Email_Error_Log] 
	-- Add the parameters for the stored procedure here
	@status varchar(100),
	@logerror varchar(max)
AS
BEGIN
	DECLARE @BodyEmail varchar(max),
			@Email varchar(max),
			@File varchar(max),
			@bodyText varchar(max)
	SET NOCOUNT ON;
	
	
	select @Email = Value from SQL_Statement.dbo.MasterParameter
	where ID = '13' and Name = 'Email Parameter'
	
	if @status = 'Get Account'
	BEGIN
		set @BodyEmail = 'Error Get Account: '+@logerror
	END
	ELSE IF @status = 'Delete Account'
	BEGIN
		set @BodyEmail = 'Error Delete Account: '+@logerror
	END
	ELSE IF @status = 'Get FTP Files'
	BEGIN
		set @BodyEmail = 'Error Get FTP Files: '+@logerror
	END
	ELSE IF @status = 'Process PDF'
	BEGIN
		set @BodyEmail = 'Error Process PDF: '+@logerror
	END
	ELSE IF @status = 'Send Batch Email'
	BEGIN
		set @BodyEmail = 'Error Send Batch Email: '+@logerror
	END
	BEGIN
		SET @bodyText = @BodyEmail+'<br/>'
		EXEC msdb.dbo.sp_send_dbmail @profile_name='IT Notification',
									@recipients  = @Email,
									--@copy_recipients = @ExternalEmail,
									@subject  = 'Email Error MyFunding',
									@body   = @bodyText,
									--@file_attachments=@File,
									@body_format = 'HTML'

	--SELECT @email,@File
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Send_Email_EStatement]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Harsani Febrianto>
-- Create date: <2020/03/04>
-- Description:	
-- [dbo].[Send_Email_EStatement] '8850'
-- =============================================
CREATE PROCEDURE [dbo].[Send_Email_EStatement] 
	-- Add the parameters for the stored procedure here
	@Id int = null
AS
BEGIN
	DECLARE @BodyEmail varchar(max),
			@Email varchar(max),
			@File varchar(max),
			@bodyText varchar(max)
	SET NOCOUNT ON;

	----------------------------------------------------- SET PARAMETER EMAIL ------------------------------------------------------

    -- Insert statements for procedure here
	SELECT @BodyEmail = Content
		   ,@Email = Email
		   ,@File = 'E:\SharePoint\Calvin\'+[Root]+'\'+Folder+'\'+[File]
	FROM MasterPDF a
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo 
	WHERE a.ID=@Id

	----------------------------------------------------- VALIDASI EMAIL ------------------------------------------------------
	--IF
	--(
	--@Email NOT LIKE '[0-9a-zA-Z]%@__%.__%'					-- valid
	--OR @Email IS NULL or @Email = ''							-- kaga boleh kosong	
	--OR PATINDEX('%[^a-z,0-9,@,.]%', Email) > 0				-- karakter invalid
	--OR @Email LIKE '%@%@%'									-- kaga boleh @ setelah @ 
	--OR @Email LIKE '%..%'										-- kaga boleh . setelah .
	--OR @Email LIKE '%.@'										-- kaga boleh @ setelah .
	--OR @Email LIKE '%@.'										-- kaga boleh . setelah @
	--OR patindex ('[@.-_]%', @Email) > 0						-- kaga boleh @ di awal 
	--OR patindex ('%[@.-_]', @Email) > 0						-- kaga boleh @ di akhir 
	--OR CHARINDEX(' ',LTRIM(RTRIM(@Email))) > 0				-- kaga boleh ada spasi
	--OR @Email LIKE '%.cm' OR @Email LIKE '%.co'				-- biar kaga typo
	--OR @Email LIKE '%.or' OR  @Email LIKE '%.ne'				-- biar kaga typo
	--)

	--BEGIN
	----------------------------------------------------- SEND EMAIL ------------------------------------------------------
		SET @bodyText = @BodyEmail+'<br/>'
		EXEC msdb.dbo.sp_send_dbmail @profile_name='IT Notification Dev',
									@recipients  = @email,
									--@recipients  = 'harsani.febrianto@bankmayora.co.id',
									--@copy_recipients = @ExternalEmail,
									--@copy_recipients = 'harsani.febrianto@bankmayora.co.id; ferryantonius.simamora@bankmayora.co.id',
									@subject  = 'TES Email EStatement',
									@body   = @bodyText,
									@file_attachments = @File,
									@body_format = 'HTML'

	----------------------------------------------------- UPDATE Sukses ------------------------------------------------------
		UPDATE MasterPDF
		SET Success = 1
		WHERE ID = @Id

	--END

	----------------------------------------------------- UPDATE Gagal ------------------------------------------------------

	--ELSE

	--BEGIN
	--	UPDATE MasterPDF
	--	SET Failure = Failure + 1
	--	WHERE ID = @Id
	--END

END

GO
/****** Object:  StoredProcedure [dbo].[Send_Email_PDf]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fajri Sidik>
-- Create date: <2018/08/31>
-- Description:	
-- [dbo].[Send_Email_PDf] @IdPdf=6329
-- =============================================
CREATE PROCEDURE [dbo].[Send_Email_PDf] 
	-- Add the parameters for the stored procedure here
	@IdPdf int = null
AS
BEGIN
	DECLARE @BodyEmail varchar(max),
			@Email varchar(max),
			@File varchar(max),
			@bodyText varchar(max)
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @BodyEmail = Content
		   ,@Email = email
		   ,@File = '\\10.10.2.64\pdf\'+[Root]+'\'+Folder+'\'+[File] 
	FROM MasterPDF a
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo 
	WHERE a.ID=@IdPdf

	IF @Email !=''
	BEGIN
		SET @bodyText = @BodyEmail+'<br/>'
		EXEC msdb.dbo.sp_send_dbmail @profile_name='IT Notification',
									@recipients  = @email,
									--@copy_recipients = @ExternalEmail,
									@subject  = 'TES Email',
									@body   = @bodyText,
									--@file_attachments=@File,
									@body_format = 'HTML'

	--SELECT @email,@File
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_DebetRekeningGiro]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DebetRekeningGiro]
/*
	CreateBy	: Jeni
	CreateDate	: 20191211
	Objective	: Debet rekening giro yang di print

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
	Notes:
		exec [SQL_Statement].[dbo].[SP_DebetRekeningGiro]
		
*/
as 
set nocount on
declare 
	@HargaPerLembar		money,
	@AccountNo			varchar(20),
	@TotalBiaya			money


CREATE TABLE #tempResult
( 
	Result VARCHAR(2000)
)

declare 
	@json				varchar(300),
	@jsonTemplate		varchar(300),
	@AccountKredit		varchar(30),
	@JsonResponse		varchar(2000),
	@Result				varchar(10),
	@ReturnCode			varchar(10),
	@Message			varchar(2000),
	@ftCore				varchar(30),
	@noRefCore			varchar(30),
	@stanReq			varchar(30),
	@transmissdateReq	varchar(30),
	@aiicReq			varchar(30),
	@ErrorMessage		varchar(2000),
	@TransactionDate	varchar(30),
	@toDay				datetime,
	@StatementPeriode	varchar(6),
	@Periode			varchar(20),
	@TglProses			int,
	@RegistrasiAccountID	bigint

set @toDay = GETDATE()
set @jsonTemplate =
	'{
		"trxDatetime": "<trxDatetime>",
		"accountno": "<accountno>",
		"accountkredit": "<accountkredit>",
		"trxAmount": <trxAmount>,
		"feeAmount": 0,
		"trxMessage": "",
		"narrative": "Biaya Transaksi Rekening - <periode>"
	}'



select top 1 @HargaPerLembar = [Value] 
from MasterParameter where Name = 'HargaPerLembar'

select top 1 @TglProses = [Value] 
from MasterParameter where Name = 'PaymentDay'

set @TglProses = 15 --kebutuhan test hapus aja kalo udah

select top 1 @AccountKredit = [Value] 
from MasterParameter where Name = 'AccountNoBiaya'

if @TglProses = DAY(GETDATE()) --Tanggal proses 
begin
	print 'Proses 1'
	set @StatementPeriode = CONVERT(varchar(6), DATEADD(month, -1 ,@toDay), 112)
	
	--periode untuk narative "Aug 2020"
	set @Periode = left(convert(varchar, convert(date,DATEADD(month, -1, getdate())), 109),3) +' ' 
	+ right(convert(varchar, convert(date,DATEADD(month, -1, getdate())), 109),4)

	declare Cr_BiayaGiro cursor
	for
		select 
			a.ID,
			a.AccountNo,
			a.HargaLembar * a.TotalLembar as TotalBiaya
		from RegisteredAccount a
			left join GiroFeeExclude c
				on a.AccountNo = c.AccountNo
		where a.StatementPeriod = @StatementPeriode
		and a.IsGiroAccount = 1
		and c.AccountNo is null --rekening penyimpangan / spesial
		and PaymentDate is null

	open Cr_BiayaGiro
	while 1=1
	begin
		fetch Cr_BiayaGiro into @RegistrasiAccountID, @AccountNo, @TotalBiaya

		if @@FETCH_STATUS <> 0
			break
	
		--mulai
		SET @TransactionDate = (SELECT RIGHT(CAST(YEAR(GETDATE()) AS VARCHAR(4)),2) 
								+ RIGHT('0' + CAST(MONTH(GETDATE()) AS VARCHAR(4)) , 2)
								+ RIGHT('0' + CAST(DAY(GETDATE()) AS VARCHAR(4)) , 2)
								+ RIGHT('0' + CAST(DATEPART(HOUR,GETDATE()) AS VARCHAR(4)) , 2)
								+ RIGHT('0' + CAST(DATEPART(MINUTE,GETDATE()) AS VARCHAR(4)) , 2)
								+ RIGHT('0' + CAST(DATEPART(SECOND,GETDATE()) AS VARCHAR(4)) , 2) )
	
		set @json = @jsonTemplate
		set @json = REPLACE(@json,'<trxDatetime>', @TransactionDate)
		set @json = REPLACE(@json,'<accountno>', @AccountNo)
		set @json = REPLACE(@json,'<trxAmount>', @TotalBiaya)
		set @json = REPLACE(@json,'<accountkredit>', @AccountKredit)
		set @json = REPLACE(@json,'<periode>', @Periode)

		select @json

		INSERT INTO #tempResult
		EXEC [10.100.2.120\APPSERVERDEV].SQL_MAYORA_API.dbo.SqlWebServices 
		'http://192.168.201.30//BankMayora.DEV.API/debetkredit-api/execute-trfdebetkredit',
		'http://192.168.201.30//BankMayora.DEV.API/token',
		@json,
		'yadit',
		'yadit123'
	
	
		SELECT @JsonResponse = Result from #tempResult


		SELECT @Result = StringValue from parseJSON(@JsonResponse) where NAME = 'success'
		SELECT @Message = StringValue from parseJSON(@JsonResponse) where NAME = 'message'
		SELECT @ReturnCode = StringValue from parseJSON(@JsonResponse) where NAME = 'returnCode'
		SELECT @ftCore = StringValue from parseJSON(@JsonResponse) where NAME = 'ftCore'
		SELECT @noRefCore = StringValue from parseJSON(@JsonResponse) where NAME = 'noRefCore'
		SELECT @stanReq = StringValue from parseJSON(@JsonResponse) where NAME = 'stanReq'
		SELECT @transmissdateReq = StringValue from parseJSON(@JsonResponse) where NAME = 'transmissdateReq'
		SELECT @aiicReq = StringValue from parseJSON(@JsonResponse) where NAME = 'aiicReq'

		insert into GiroPaymentHistory_TH(TransactionDate,TrxDateTime,DebetAccount,KreditAccount,TrxAmount
		,trxMessage,Narative,resMessage,returnCode,ftCore,noRefCore,transmissdateReq,JsonRequest,JsonResponse, StatementPeriode, RegisterAccountID)
		select @toDay, @TransactionDate, @AccountNo, @AccountKredit, @TotalBiaya,
		'','',@Message, @ReturnCode, @ftCore, @noRefCore, @transmissdateReq, @json, @JsonResponse, @StatementPeriode, @RegistrasiAccountID

		update RegisteredAccount set
			DebetStatus = case when @ReturnCode = '00' then 1 else 0 end,
			DebetMessage = @Message,
			PaymentDate	= @toDay
		where
			StatementPeriod = @StatementPeriode
			and AccountNo = @AccountNo
	end

	close Cr_BiayaGiro
	deallocate Cr_BiayaGiro
end

print 'Proses 2'
declare Cr_BiayaGiro cursor
for
	select
		a.ID,
		a.AccountNo,
		a.HargaLembar * a.TotalLembar as TotalBiaya,
		a.StatementPeriod
	from RegisteredAccount a
		left join SQL_TEMENOS.dbo.ACCOUNT_CLOSED b
			on a.AccountNo = b.account_no collate database_default
		left join GiroFeeExclude c
			on a.AccountNo = c.AccountNo
	where a.IsGiroAccount = 1
	and c.AccountNo is null --rekening penyimpangan / spesial
	and a.DebetStatus = 0
	and b.account_no is null
	

open Cr_BiayaGiro
while 1=1
begin
	fetch Cr_BiayaGiro into @RegistrasiAccountID, @AccountNo, @TotalBiaya, @StatementPeriode

	if @@FETCH_STATUS <> 0
		break
	

	--mulai
	set @Periode = left(convert(varchar, convert(date,@StatementPeriode + '01'), 109),3) +' ' 
	+ right(convert(varchar, convert(date,@StatementPeriode + '01'), 109),4)

	set @TransactionDate = (SELECT RIGHT(CAST(YEAR(GETDATE()) AS VARCHAR(4)),2) 
							+ RIGHT('0' + CAST(MONTH(GETDATE()) AS VARCHAR(4)) , 2)
							+ RIGHT('0' + CAST(DAY(GETDATE()) AS VARCHAR(4)) , 2)
							+ RIGHT('0' + CAST(DATEPART(HOUR,GETDATE()) AS VARCHAR(4)) , 2)
							+ RIGHT('0' + CAST(DATEPART(MINUTE,GETDATE()) AS VARCHAR(4)) , 2)
							+ RIGHT('0' + CAST(DATEPART(SECOND,GETDATE()) AS VARCHAR(4)) , 2) )
	
	set @json = @jsonTemplate
	set @json = REPLACE(@json,'<trxDatetime>', @TransactionDate)
	set @json = REPLACE(@json,'<accountno>', @AccountNo)
	set @json = REPLACE(@json,'<trxAmount>', @TotalBiaya)
	set @json = REPLACE(@json,'<accountkredit>', @AccountKredit)
	set @json = REPLACE(@json,'<periode>', @Periode)

	select @json

	INSERT INTO #tempResult
	EXEC [10.100.2.120\APPSERVERDEV].SQL_MAYORA_API.dbo.SqlWebServices 
	'http://192.168.201.30//BankMayora.DEV.API/debetkredit-api/execute-trfdebetkredit',
	'http://192.168.201.30//BankMayora.DEV.API/token',
	@json,
	'yadit',
	'yadit123'
	
	SELECT @JsonResponse = Result from #tempResult

	SELECT @Result = StringValue from parseJSON(@JsonResponse) where NAME = 'success'
	SELECT @Message = StringValue from parseJSON(@JsonResponse) where NAME = 'message'
	SELECT @ReturnCode = StringValue from parseJSON(@JsonResponse) where NAME = 'returnCode'
	SELECT @ftCore = StringValue from parseJSON(@JsonResponse) where NAME = 'ftCore'
	SELECT @noRefCore = StringValue from parseJSON(@JsonResponse) where NAME = 'noRefCore'
	SELECT @stanReq = StringValue from parseJSON(@JsonResponse) where NAME = 'stanReq'
	SELECT @transmissdateReq = StringValue from parseJSON(@JsonResponse) where NAME = 'transmissdateReq'
	SELECT @aiicReq = StringValue from parseJSON(@JsonResponse) where NAME = 'aiicReq'

	insert into GiroPaymentHistory_TH(TransactionDate,TrxDateTime,DebetAccount,KreditAccount,TrxAmount
	,trxMessage,Narative,resMessage,returnCode,ftCore,noRefCore,transmissdateReq,JsonRequest,JsonResponse, StatementPeriode, RegisterAccountID)
	select @toDay, @TransactionDate, @AccountNo, @AccountKredit, @TotalBiaya,
	'','',@Message, @ReturnCode, @ftCore, @noRefCore, @transmissdateReq, @json, @JsonResponse, @StatementPeriode, @RegistrasiAccountID

	update RegisteredAccount set
		DebetStatus = case when @ReturnCode = '00' then 1 else 0 end,
		DebetMessage = @Message,
		PaymentDate	= @toDay
	where
		StatementPeriod = @StatementPeriode
		and AccountNo = @AccountNo
end

close Cr_BiayaGiro
deallocate Cr_BiayaGiro

IF OBJECT_ID('tempdb..#tempResult') IS NOT NULL
		drop table #tempResult
return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN
	
	IF OBJECT_ID('tempdb..#tempResult') IS NOT NULL
		drop table #tempResult
return 1

GO
/****** Object:  StoredProcedure [dbo].[SP_GenerateRekeningGiro_Print]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GenerateRekeningGiro_Print]
/*
	CreateBy	: Eldwin
	CreateDate	: 20200910
	Objective	: Upload excel parameter e-statement

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	exec [SP_GenerateRekeningGiro_Print]
	Notes:
	
	
*/
	@pTest				varchar(100) = null output
AS

	SET NOCOUNT ON;

declare
	@ProcessDate			datetime,
	@Today					datetime,
	@SprocName				varchar(50),
	@ReturnCode				smallint,
	@MaxBatchDate			date,
	@StatementPeriode		varchar(8)
		
declare 
	@PathFolder			varchar(100),
	@FileFullPath		varchar(200),
	@sql				nvarchar(max),
	@Guid				uniqueidentifier,
	@DateTime			datetime,
	@pErrMsg			varchar(255),
	@cmd				varchar(200)

--- Mulai
set @ProcessDate = getdate()
set @Today = GETDATE()
set @StatementPeriode = convert(varchar(8), DATEADD(MONTH, -1, @Today), 112)

if DAY(GETDATE())  = 2 --Tanggal proses 
begin

	set @SprocName = object_name(@@procid)
	set @Guid = NEWID()
	
	SET @PathFolder = 'E:\ShareFolder\e-Statement\'+ LEFT(@StatementPeriode,6) +'\'
	set @cmd = 'mkdir "' + @PathFolder +'"'
	exec xp_cmdshell @cmd, no_output

	

	CREATE TABLE #EXCEL_IMPORT
	(
		AccountNo varchar(30)
	)

	declare @BranchID	varchar(20)
	declare Cr_Branch cursor
		for
			select  [@ID] from SQL_TEMENOS.dbo.COMPANY
			where company_name<>'-- Not Used ---'
			--and [@ID] in ('ID0011150')

		open Cr_Branch
		while 1=1
		begin
			fetch Cr_Branch into @BranchID

			if @@FETCH_STATUS <> 0
				break
	--- mulai ---	
		
			set @FileFullPath = @PathFolder + 'ACC.STATEMENT_' + LEFT(@StatementPeriode,6) + '_' + @BranchID + '.txt'

			select top 1 @MaxBatchDate  =batch_date from SQL_TEMENOS.dbo.ACCOUNT
			order by batch_date desc

			insert into #EXCEL_IMPORT
			select a.account_no from SQL_TEMENOS.dbo.ACCOUNT a
				join SQL_TEMENOS.dbo.PRODUCT_CATEGORY_MAPPING b
					on a.category collate database_default = b.product_code collate database_default
				left join SQL_TEMENOS.dbo.ACCOUNT_CLOSED c
					on a.account_no = c.[@ID]
			where 
				a.batch_date = @MaxBatchDate
				and a.co_code = @BranchID
				and b.product_type='GIRO'
				and isnull(a.ac_sta_status,'') <> 'EMAIL'
				and c.[@ID] is null
				and b.product_code not in (1004,1009)

			declare 
				@format			varchar(max),
				@AllLine		varchar(500),
				@MinIDHeader	bigint

			set @AllLine = REPLICATE(' ',130)
			set @format = ''


			--delete from Temp

			---------------- INSERT HEADER ----------------
			insert into Temp([guid], IDHeader, HeaderText, FooterText)
			select
				@Guid,
				a.ID,
				char(12) +char(13) + 
				--'         1         2         3         4         5         6         7         8         9         0         1         2         3         4'+ char(13) + 
				--replicate('1234567890',18) + char(13)  + 
				rtrim(STUFF(@AllLine, 85 , 3, isnull(b.NoHalaman,''))) + char(13) + 
				rtrim(STUFF(@AllLine, 85 , len(isnull(a.Periode,'')), isnull(a.Periode,''))) + char(13) + 
				rtrim(STUFF(@AllLine, 6 , len(isnull(a.cabang,'')), isnull(a.cabang,''))) + char(13) + 
				rtrim(STUFF(@AllLine, 85 , len(isnull(a.TypeAccount,'')), isnull(a.TypeAccount,''))) + char(13) + 
				rtrim(STUFF(@AllLine, 6 , len(isnull(a.CIF,'')), isnull(a.CIF,''))) + char(13) + 
				rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.AccountName,'')), isnull(a.AccountName,'')), 85 , len(isnull(a.AccountNo,'')), isnull(a.AccountNo,''))) + char(13) + 
				rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.Alamat1,'')), isnull(a.Alamat1,'')), 85 , len(isnull(a.Currency,'')), isnull(a.Currency,''))) + char(13) + 
				rtrim(STUFF(@AllLine, 6 , len(isnull(a.Alamat2,'')), isnull(a.Alamat2,''))) + char(13) + 
				rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.Alamat3,'')), isnull(a.Alamat3,'')), 85 , len(isnull(a.NPWP,'')), isnull(a.NPWP,''))) + char(13) + 
				rtrim(STUFF(@AllLine, 6 , len('No Rekening Lama : ' + isnull(a.OldAcctNo,'')), 'No Rekening Lama : ' + isnull(a.OldAcctNo,''))) + char(13) + 
				char(13)+char(13) + 
				rtrim(STUFF(STUFF(@AllLine, 25 , len('Saldo Awal'), 'Saldo Awal'), 111 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(SaldoAwal,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(SaldoAwal,0) AS money), 1), 20))) + char(13) as HeaderText,
	
				rtrim(STUFF(STUFF(STUFF(@AllLine, 25 , len('TOTAL'), 'TOTAL'), 66 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalDebet,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalDebet,0) AS money), 1), 20)), 87 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalKredit,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalKredit,0) AS money), 1), 20))) + char(13) +
				rtrim(STUFF(STUFF(@AllLine, 25 , len('Saldo Akhir'), 'Saldo Akhir'), 111 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.SaldoAkhir,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.SaldoAkhir,0) AS money), 1), 20))) + char(13) +
				rtrim(STUFF(@AllLine, 5 , len('Frekwensi Transaksi Debet:' + isnull(b.FrekuensiDebet,'')), 'Frekwensi Transaksi Debet:' + isnull(b.FrekuensiDebet,''))) + char(13) +
				rtrim(STUFF(@AllLine, 5 , len('Frekwensi Transaksi Kredit:' + isnull(b.FrekuensiKredit,'')), 'Frekwensi Transaksi Kredit:' + isnull(b.FrekuensiKredit,''))) + char(13) +
				rtrim(STUFF(@AllLine, 5 , len('Saldo Terendah :' + Right(Replicate(' ', 26) + CONVERT(varchar, CAST(isnull(b.SaldoTerendah,0) AS money), 1), 26)), 'Saldo Terendah :' + Right(Replicate(' ', 26) + CONVERT(varchar, CAST(isnull(b.SaldoTerendah,0) AS money), 1), 26))) + char(13) +
				rtrim(STUFF(@AllLine, 5 , len('Saldo Tertinggi :' + Right(Replicate(' ', 25) + CONVERT(varchar, CAST(isnull(b.SaldoTertinggi,0) AS money), 1), 25)), 'Saldo Tertinggi :' + Right(Replicate(' ', 25) + CONVERT(varchar, CAST(isnull(b.SaldoTertinggi,0) AS money), 1), 25))) + char(13) + char(13) +
				rtrim(STUFF(@AllLine, 21 , len('SEHUBUNGAN PERGANTIAN CORE BANKING DENGAN INI DIINFORMASIKAN BAHWA NOMOR REKENING GIRO ANDA SECARA'), 'SEHUBUNGAN PERGANTIAN CORE BANKING DENGAN INI DIINFORMASIKAN BAHWA NOMOR REKENING GIRO ANDA SECARA')) + char(13) +
				rtrim(STUFF(@AllLine, 21 , len('OTOMATIS BERUBAH MENJADI NOMOR REKENING BARU SEBAGAIMANA TERCANTUM DALAM STATEMENT R/K INI, NAMUN'), 'OTOMATIS BERUBAH MENJADI NOMOR REKENING BARU SEBAGAIMANA TERCANTUM DALAM STATEMENT R/K INI, NAMUN')) + char(13) +
				rtrim(STUFF(@AllLine, 21 , len('UNTUK KENYAMANAN TRANSAKSI ANDA NOMOR REKENING LAMA MASIH DAPAT DIPERGUNAKAN.'), 'UNTUK KENYAMANAN TRANSAKSI ANDA NOMOR REKENING LAMA MASIH DAPAT DIPERGUNAKAN.')) + 
				REPLICATE(char(13),8) +'*' as FooterText
			from 
				SQL_Statement.dbo.HeaderTextFile a
				join SQL_Statement.dbo.DetailFooter b
					on a.ID = b.IDHeader
				join #EXCEL_IMPORT x on x.AccountNo = a.AccountNo collate latin1_general_ci_as
			where
				char(32)+a.Periode = dbo.fn_indonesian_date(DATEADD(day,1,@StatementPeriode))
			order by a.ID

			---------------- INSERT BODY ----------------
			;WITH x as 
			(
				select 
					b.IDHeader,
					Pet = CONVERT(NVARCHAR(MAX), rtrim(STUFF(STUFF(STUFF(STUFF(STUFF(STUFF(STUFF(@AllLine, 5 , len(Tanggal), isnull(Tanggal,'')), 14 , len(Valuta), isnull(Valuta,'')), 25 , len(Detail), isnull(Detail,'')), 53 , len(NoRef), isnull(NoRef,'')), 68 , 
						len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Debet,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Debet,0) AS money), 1), 20)), 89 , 
						len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Kredit,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Kredit,0) AS money), 1), 20)), 111 , 
						len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Saldo,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Saldo,0) AS money), 1), 20) )) + char(13) +
					case when Narative is null then '' else rtrim(STUFF(@AllLine, 25 , len(isnull(Narative,'')), isnull(Narative,''))) + char(13) end),
					r1 = ROW_NUMBER() OVER (PARTITION BY b.IDHeader ORDER BY a.ID)
				from
					SQL_Statement.dbo.DetailBody a
					join Temp b
						on a.IDHeader = b.IDHeader
					where
						b.[guid] = @Guid
			),
			a AS 
			(
			  SELECT IDHeader, Pet, r1 FROM x WHERE r1 = 1
			),
			r AS
			(
			  SELECT IDHeader, Pet, r1 FROM a WHERE r1 = 1
			  UNION ALL
			  SELECT x.IDHeader, r.Pet + x.Pet, x.r1
				FROM x INNER JOIN r
				ON r.IDHeader = x.IDHeader
				AND x.r1 = r.r1 + 1
			)
			SELECT IDHeader, Pets = MAX(Pet)
				into #RecursiceResult
			  FROM r
			  GROUP BY IDHeader 
			  ORDER BY IDHeader
			  OPTION (MAXRECURSION 0);

	
			update a set
				DetailText = b.Pets
			from 
				Temp a
				join #RecursiceResult b
					on a.IDHeader = b.IDHeader
			where
				a.[guid] = @Guid


			select top 1 
				@MinIDHeader = IDHeader
			from Temp
			where [guid] = @Guid
			order by IDHeader asc

			update Temp set 
				HeaderText = char(12) + isnull(HeaderText,'')
			where [identity] = 1

			DECLARE @bcpCommand varchar(2000)
			--print @bcpCommand
			SET @bcpCommand = 'bcp "select isnull(HeaderText,'''') + isnull(DetailText,'''') + REPLICATE(char(13),24 - (len(DetailText) - len(replace(DetailText,char(13),'''')))) + FooterText from SQL_Statement.dbo.Temp where [guid] = '''+ convert(varchar(64), @Guid) +''' order by IDHeader" queryout "'+ @FileFullPath +'" -c -U loginapp -P m@y0raB4nk! -S '+ convert(varchar,@@ServerName)

			--print @bcpCommand
			EXEC xp_cmdshell @bcpCommand

			truncate table Temp
			delete from #EXCEL_IMPORT
			IF OBJECT_ID('tempdb..#RecursiceResult') IS NOT NULL DROP TABLE #RecursiceResult

	--- selesai ---		
		end

		close Cr_Branch
		deallocate Cr_Branch
end

IF OBJECT_ID('tempdb..#EXCEL_IMPORT') IS NOT NULL DROP TABLE #EXCEL_IMPORT
	if @pErrMsg is not null
		begin
			goto ERROR
		end

	ERROR:
		if @pErrMsg is not null
		begin		
			raiserror 77777 @pErrMsg
			return 1
		end
		return 0
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertMasterPDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_InsertMasterPDF]
/*
	CreateBy	: Jeni
	CreateDate	: 20201002
	Objective	: insert log hasil generate

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
*/
@pXML			xml,
@pErrMsg		varchar(200) = null output
AS
set nocount on


SELECT DISTINCT
	'AccountNo'		= x.v.value('AccountNo[1]', 'varchar(20)')
	,'Period'	= x.v.value('Period[1]', 'varchar(20)')
	,'Branch'	= x.v.value('Branch[1]', 'varchar(50)')
	,'StatusData'	= x.v.value('StatusData[1]', 'int')
	,'IsDelete'			= x.v.value('IsDelete[1]', 'int')
	,'Folder'		= x.v.value('Folder[1]', 'nvarchar(max)')
	,'File'		= x.v.value('File[1]', 'nvarchar(max)')
	,'Root'		= x.v.value('Root[1]', 'nvarchar(max)')
	,'Subject'		= x.v.value('Subject[1]', 'varchar(50)')
	,'Success'		= x.v.value('Success[1]', 'int')
	,'Failure'		= x.v.value('Failure[1]', 'nvarchar(max)')
	,'Remark'		= x.v.value('Remark[1]', 'nvarchar(max)')
	,'Product'		= x.v.value('Product[1]', 'varchar(500)')
	,'ProductCode'		= x.v.value('ProductCode[1]', 'varchar(500)')
	,'AccountName'		= x.v.value('AccountName[1]', 'varchar(500)')
	,'GeneratePDFDate'		= x.v.value('GeneratePDFDate[1]', 'varchar(500)')
	,'GeneratePDFLog'		= x.v.value('GeneratePDFLog[1]', 'varchar(1000)')
	,'StatementPeriode'		= x.v.value('StatementPeriode[1]', 'varchar(1000)')
INTO #tempCustomer
FROM
	@pXML.nodes('data/Table1') x(v)


IF OBJECT_ID('TempMasterPDF') IS NOT NULL 
begin
	insert into TempMasterPDF
	select * from #tempCustomer
end
else
	select * into TempMasterPDF from #tempCustomer
BEGIN TRAN
	insert into MasterPDF(
	AccountNo,[Period],Branch,StatusData,IsDelete,Folder,[File],[Root],Content
	,[Subject],Success,Failure,Remark,GeneratePDFDate,GeneratePDFLog)
	select 
		a.AccountNo, a.[Period], a.Branch, a.StatusData, a.IsDelete, a.Folder, a.[File], a.[Root], replace(replace(replace(replace(b.Content,'[CUST_NAME]',a.AccountName),'[PERIOD]',a.StatementPeriode),'[ACC_NO]',a.AccountNo),'[PRODUCT]',a.Product)
		,a.[Subject], a.Success, a.Failure, a.Remark,CONVERT (DATETIME,a.GeneratePDFDate), a.GeneratePDFLog
	from 
		#tempCustomer a
		join MasterEmailTemplate b
			on a.ProductCode = b.ProductCode
COMMIT TRAN
return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateActionEmail]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateActionEmail]
/*
	CreateBy	: 
	CreateDate	: 
	Objective	: 

	-----------------------------------------------------------
	
*/
@pXML			xml,
@pErrMsg		varchar(200) = null output
AS
	SET NOCOUNT ON;


SELECT DISTINCT
	 'AccountNo'		= x.v.value('AccountNo[1]', 'VARCHAR(255)')
	,'Action'	= x.v.value('Action[1]', 'INT')
	,'Id'	= x.v.value('Id[1]', 'INT')
	,'logMessage'	= x.v.value('logMessage[1]', 'VARCHAR(2000)')
	,'SentEmailDate'  = x.v.value('SentEmailDate[1]', 'varchar(500)')

	
INTO #tempCustomer
FROM
	@pXML.nodes('data/Table1') x(v)


IF OBJECT_ID('TempUpdateEmail') IS NOT NULL 
begin
	insert into TempUpdateEmail
	select * from #tempCustomer
end
else
	select * into TempUpdateEmail from #tempCustomer	
BEGIN TRAN

UPDATE [SQL_Statement].[dbo].[MasterPDF] 
SET Success=1, SentEmailDate=CONVERT(DATETIME,a.SentEmailDate), SentEmailLog=a.logMessage
FROM #tempCustomer a
JOIN [SQL_Statement].[dbo].[MasterPDF] b ON a.AccountNo=b.AccountNo 
WHERE a.[Action]=1 and a.AccountNo=b.AccountNo and a.Id=b.ID

UPDATE [SQL_Statement].[dbo].[MasterPDF] 
SET Failure = Failure+1, SentEmailDate=CONVERT(DATETIME,a.SentEmailDate), SentEmailLog=a.logMessage
FROM #tempCustomer a
JOIN [SQL_Statement].[dbo].[MasterPDF] b ON a.AccountNo=b.AccountNo 
WHERE a.[Action]=2 and a.AccountNo=b.AccountNo and a.Id=b.ID



COMMIT TRAN
return 0

APPERR:
	if @@trancount > 0
		ROLLBACK TRAN

	set @pErrMsg = '['+object_name(@@procid)+']'+char(10)+isnull(@pErrMsg,'')
	IF OBJECT_ID('tempdb..#tempCustomer') IS NOT NULL DROP TABLE #tempCustomer

	return 1


GO
/****** Object:  StoredProcedure [dbo].[TAI]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TAI]
as 
begin
declare 
	@format			varchar(max),
	@AllLine		varchar(500),
	@MinIDHeader	bigint

set @AllLine = REPLICATE(' ',130)
set @format = ''


delete from Temp

---------------- INSERT HEADER ----------------
insert into Temp(IDHeader, HeaderText, FooterText)
select
	a.ID,
	char(12) +char(13) + 
	--'         1         2         3         4         5         6         7         8         9         0         1         2         3         4'+ char(13) + 
	--replicate('1234567890',18) + char(13)  + 
	rtrim(STUFF(@AllLine, 85 , 3, isnull(b.NoHalaman,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 85 , len(isnull(a.Periode,'')), isnull(a.Periode,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len(isnull(a.cabang,'')), isnull(a.cabang,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 85 , len(isnull(a.TypeAccount,'')), isnull(a.TypeAccount,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len(isnull(a.CIF,'')), isnull(a.CIF,''))) + char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.AccountName,'')), isnull(a.AccountName,'')), 85 , len(isnull(a.AccountNo,'')), isnull(a.AccountNo,''))) + char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.Alamat1,'')), isnull(a.Alamat1,'')), 85 , len(isnull(a.Currency,'')), isnull(a.Currency,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len(isnull(a.Alamat2,'')), isnull(a.Alamat2,''))) + char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.Alamat3,'')), isnull(a.Alamat3,'')), 85 , len(isnull(a.NPWP,'')), isnull(a.NPWP,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len('No Rekening Lama : ' + isnull(a.OldAcctNo,'')), 'No Rekening Lama : ' + isnull(a.OldAcctNo,''))) + char(13) + 
	char(13)+char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 25 , len('Saldo Awal'), 'Saldo Awal'), 114 , len(Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(SaldoAwal,0) AS money), 1), 17)), Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(SaldoAwal,0) AS money), 1), 17))) + char(13) as HeaderText,
	
	rtrim(STUFF(STUFF(STUFF(@AllLine, 25 , len('TOTAL'), 'TOTAL'), 69 , len(Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(b.TotalDebet,0) AS money), 1), 17)), Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(b.TotalDebet,0) AS money), 1), 17)), 90 , len(Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(b.TotalKredit,0) AS money), 1), 17)), Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(b.TotalKredit,0) AS money), 1), 17))) + char(13) +
	rtrim(STUFF(STUFF(@AllLine, 25 , len('Saldo Akhir'), 'Saldo Akhir'), 114 , len(Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(b.SaldoAkhir,0) AS money), 1), 17)), Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(b.SaldoAkhir,0) AS money), 1), 17))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Frekwensi Transaksi Debet:' + isnull(b.FrekuensiDebet,'')), 'Frekwensi Transaksi Debet:' + isnull(b.FrekuensiDebet,''))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Frekwensi Transaksi Kredit:' + isnull(b.FrekuensiKredit,'')), 'Frekwensi Transaksi Kredit:' + isnull(b.FrekuensiKredit,''))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Saldo Terendah :' + Right(Replicate(' ', 26) + CONVERT(varchar, CAST(isnull(b.SaldoTerendah,0) AS money), 1), 26)), 'Saldo Terendah :' + Right(Replicate(' ', 26) + CONVERT(varchar, CAST(isnull(b.SaldoTerendah,0) AS money), 1), 26))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Saldo Tertinggi :' + Right(Replicate(' ', 25) + CONVERT(varchar, CAST(isnull(b.SaldoTertinggi,0) AS money), 1), 25)), 'Saldo Tertinggi :' + Right(Replicate(' ', 25) + CONVERT(varchar, CAST(isnull(b.SaldoTertinggi,0) AS money), 1), 25))) + char(13) + char(13) +
	rtrim(STUFF(@AllLine, 21 , len('SEHUBUNGAN PERGANTIAN CORE BANKING DENGAN INI DIINFORMASIKAN BAHWA NOMOR REKENING GIRO ANDA SECARA'), 'SEHUBUNGAN PERGANTIAN CORE BANKING DENGAN INI DIINFORMASIKAN BAHWA NOMOR REKENING GIRO ANDA SECARA')) + char(13) +
	rtrim(STUFF(@AllLine, 21 , len('OTOMATIS BERUBAH MENJADI NOMOR REKENING BARU SEBAGAIMANA TERCANTUM DALAM STATEMENT R/K INI, NAMUN'), 'OTOMATIS BERUBAH MENJADI NOMOR REKENING BARU SEBAGAIMANA TERCANTUM DALAM STATEMENT R/K INI, NAMUN')) + char(13) +
	rtrim(STUFF(@AllLine, 21 , len('UNTUK KENYAMANAN TRANSAKSI ANDA NOMOR REKENING LAMA MASIH DAPAT DIPERGUNAKAN.'), 'UNTUK KENYAMANAN TRANSAKSI ANDA NOMOR REKENING LAMA MASIH DAPAT DIPERGUNAKAN.')) + 
	REPLICATE(char(13),8) +'*' as FooterText
from 
	[192.168.202.3].SQL_Statement.dbo.HeaderTextFile a
	join [192.168.202.3].SQL_Statement.dbo.DetailFooter b
		on a.ID = b.IDHeader
where
	--a.ID=488343
	a.AccountNo in('5300568787', '5300050931')
	and a.Periode='AGUSTUS 2020'
order by a.ID

---------------- INSERT BODY ----------------
;WITH x as 
(
	select 
		b.IDHeader,
		Pet = CONVERT(NVARCHAR(MAX), rtrim(STUFF(STUFF(STUFF(STUFF(STUFF(STUFF(STUFF(@AllLine, 5 , len(Tanggal), isnull(Tanggal,'')), 14 , len(Valuta), isnull(Valuta,'')), 25 , len(Detail), isnull(Detail,'')), 53 , len(NoRef), isnull(NoRef,'')), 71 , len(Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(Debet,0) AS money), 1), 17)), Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(Debet,0) AS money), 1), 17)), 92 , len(Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(Kredit,0) AS money), 1), 17)), Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(Kredit,0) AS money), 1), 17)), 114 , len(Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(Saldo,0) AS money), 1), 17)), Right(Replicate(' ', 17) + CONVERT(varchar, CAST(isnull(Saldo,0) AS money), 1), 17) )) + char(13) +
		case when Narative is null then '' else rtrim(STUFF(@AllLine, 25 , len(isnull(Narative,'')), isnull(Narative,''))) + char(13) end),
		r1 = ROW_NUMBER() OVER (PARTITION BY b.IDHeader ORDER BY a.ID)
	from
		[192.168.202.3].SQL_Statement.dbo.DetailBody a
		join Temp b
			on a.IDHeader = b.IDHeader
),
a AS 
(
  SELECT IDHeader, Pet, r1 FROM x WHERE r1 = 1
),
r AS
(
  SELECT IDHeader, Pet, r1 FROM a WHERE r1 = 1
  UNION ALL
  SELECT x.IDHeader, r.Pet + x.Pet, x.r1
    FROM x INNER JOIN r
	ON r.IDHeader = x.IDHeader
	AND x.r1 = r.r1 + 1
)
SELECT IDHeader, Pets = MAX(Pet)
	into #RecursiceResult
  FROM r
  GROUP BY IDHeader 
  ORDER BY IDHeader
  OPTION (MAXRECURSION 0);

	
update a set
	DetailText = b.Pets
from 
	Temp a
	join #RecursiceResult b
		on a.IDHeader = b.IDHeader


select top 1 
	@MinIDHeader = IDHeader
from Temp
order by IDHeader asc

update Temp set 
	HeaderText = char(12) + HeaderText
where IDHeader = @MinIDHeader

DECLARE @bcpCommand varchar(2000)

SET @bcpCommand = 'bcp "select HeaderText + DetailText + REPLICATE(char(13),12) + FooterText from SQL_Statement.dbo.Temp" queryout "\\10.100.2.248\Temp\EStatment_New.txt" -c -U sa -P Mayora1234 -S '+ convert(varchar,@@ServerName)
EXEC xp_cmdshell @bcpCommand

drop table #RecursiceResult


end
GO
/****** Object:  StoredProcedure [dbo].[Update_RegisteredAccount_From_Temenos]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

-- =============================================
CREATE PROCEDURE [dbo].[Update_RegisteredAccount_From_Temenos] 
	@tanggal date = null,
	@niklogin varchar(6),
	@module varchar(100),
	@process varchar(100)
AS
BEGIN

	--DECLARE @tanggal1 varchar(6) = SUBSTRING(REPLACE(CONVERT(varchar,DATEADD(MONTH,0,@tanggal),112),'.',''),1,6)
	--declare @cErrMsg varchar(100)
	---- SET NOCOUNT ON added to prevent extra result sets from
	---- interfering with SELECT statements.
	--SET NOCOUNT ON;
	--declare @totaldata varchar(100)
	--declare @processLogFinish varchar(100)
	--DECLARE @t1 DATETIME;
	--DECLARE @t2 DATETIME;
	--declare @timespend varchar(100)
	--if	(MONTH(@tanggal) < MONTH(GETDATE())) AND (YEAR(@tanggal) <= YEAR(GETDATE()))
	--BEGIN
	--------------------------------SP Insert Log Start---------------------------------------
	--exec [dbo].[InsertLog1] @module, @process, 'Start Get Account','0',@niklogin
	--SET @t1 = GETDATE();
	--	delete from RegisteredAccount where StatementPeriod = @tanggal1
	--	INSERT INTO RegisteredAccount
	--	(
	--	StatementPeriod
	--	,CIF
	--	,AccountNo
	--	,BirthDate
	--	,Email
	--	,ProductCategory
	--	,CreateBy
	--	,CreateDate
	--	,StatusData
	--	,IsDelete
	--	)
	--	(
	--	SELECT 
	--		@tanggal1
	--		,c.[@ID]
	--		,b.account_no
	--		,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
	--		,c.email_1
	--		,a.Id
	--		,'By System'
	--		,GETDATE()
	--		,0
	--		,0
	--	FROM MasterProduct a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b 
	--		ON a.Code=b.category collate database_default
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c 
	--		ON b.customer_no =c.[@ID]
	--	LEFT JOIN RegisteredAccount d ON b.account_no = d.AccountNo collate database_default
	--	AND d.StatementPeriod=@tanggal1
	--	WHERE a.IsDelete=0 and a.IsActive=1
	--	--and b.account_no not in(select d.AccountNo from RegisteredAccount d where d.AccountNo=b.account_no and d.StatementPeriod=@tanggal1)   
	--	)
	--SET @t2 = GETDATE();
	--SELECT @timespend = DATEDIFF(second,@t1,@t2);
    
	
	------------------------------SP Insert Log Finish---------------------------------------------
	--select @totaldata = COUNT(*) FROM MasterProduct a 
	--	JOIN SQL_TEMENOS.dbo.ACCOUNT b 
	--		ON a.Code=b.category collate database_default
	--	JOIN SQL_TEMENOS.dbo.CUSTOMER c 
	--		ON b.customer_no =c.[@ID]
	--	LEFT JOIN RegisteredAccount d ON b.account_no = d.AccountNo collate database_default
	--	WHERE a.IsDelete=0 and a.IsActive=1
	--	AND 
	--	(d.StatementPeriod=@tanggal1 )
	
	--set @processLogFinish = 'Finish Get Account - '+@totaldata+' record processed'
	
	--exec [dbo].[InsertLog1] @module, @process, @processLogFinish, @timespend, @niklogin
	--END
	--ELSE 
	--BEGIN
	--	select @cErrMsg = 'Inputan Bulan harus dibawah bulan sekarang'
	--END

	--if @cErrMsg is not null
	--begin
	--	goto ERROR
	--end

	--ERROR:
	--if @cErrMsg is not null
	--begin		
	--	raiserror 77777 @cErrMsg
	--	return 1
	--end
	--return 0
	
	
	
		DECLARE @tanggal1 varchar(6) = SUBSTRING(REPLACE(CONVERT(varchar,DATEADD(MONTH,0,@tanggal),112),'.',''),1,6)
	declare @cErrMsg varchar(100)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @totaldata varchar(100)
	declare @processLogFinish varchar(100)
	DECLARE @t1 DATETIME;
	DECLARE @t2 DATETIME;
	declare @timespend varchar(100)
	if	(MONTH(@tanggal) < MONTH(GETDATE())) AND (YEAR(@tanggal) <= YEAR(GETDATE()))
	BEGIN
	------------------------------SP Insert Log Start---------------------------------------
	exec [dbo].[InsertLog1] @module, @process, 'Start Get Account','0',@niklogin
	SET @t1 = GETDATE();
		--delete from RegisteredAccount where StatementPeriod = @tanggal1
		INSERT INTO RegisteredAccount
		(
		StatementPeriod
		,CIF
		,AccountNo
		,BirthDate
		,Email
		,ProductCategory
		,CreateBy
		,CreateDate
		,StatusData
		,IsDelete
		)
		(
		SELECT 
			@tanggal1
			,c.[@ID]
			,b.account_no
			--,case when c.sector='2001' then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end 
			,case when c.sector IN ('2001','3054') then c.tgl_akta_awal when c.sector='1001' then c.date_of_birth end -- harsan 2020-05-08
			,c.email_1
			,a.Id
			,'By System'
			,GETDATE()
			,0
			,0
		FROM MasterProduct a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b 
			ON a.Code=b.category COLLATE DATABASE_DEFAULT 
		JOIN SQL_TEMENOS.dbo.CUSTOMER c 
			ON b.customer_no =c.[@ID]
		LEFT JOIN RegisteredAccount d ON b.account_no = d.AccountNo COLLATE DATABASE_DEFAULT 
		AND d.StatementPeriod=@tanggal1 COLLATE DATABASE_DEFAULT 
		left join SQL_TEMENOS.dbo.account_closed e on b.account_no = e.[@ID]
		WHERE a.IsDelete=0 and a.IsActive=1 and b.ac_sta_status in ('Email', 'post')
		and e.[@ID] is null and d.AccountNo is null
		--and b.inactiv_marker is null
		--and b.account_no not in(select d.AccountNo from RegisteredAccount d where d.AccountNo=b.account_no and d.StatementPeriod=@tanggal1)   
		)
	SET @t2 = GETDATE();
	SELECT @timespend = DATEDIFF(second,@t1,@t2);
    
	
	----------------------------SP Insert Log Finish---------------------------------------------
	select @totaldata = COUNT(*) FROM MasterProduct a 
		JOIN SQL_TEMENOS.dbo.ACCOUNT b 
			ON a.Code=b.category COLLATE DATABASE_DEFAULT 
		JOIN SQL_TEMENOS.dbo.CUSTOMER c 
			ON b.customer_no =c.[@ID]
		LEFT JOIN RegisteredAccount d ON b.account_no = d.AccountNo COLLATE DATABASE_DEFAULT 
		WHERE a.IsDelete=0 and a.IsActive=1  and b.ac_sta_status in ('Email', 'post')
		AND 
		(d.StatementPeriod=@tanggal1 )
	
	set @processLogFinish = 'Finish Get Account - '+@totaldata+' record processed'
	
	exec [dbo].[InsertLog1] @module, @process, @processLogFinish, @timespend, @niklogin
	END
	ELSE 
	BEGIN
		select @cErrMsg = 'Inputan Bulan harus dibawah bulan sekarang'
	END

	if @cErrMsg is not null
	begin
		goto ERROR
	end

	ERROR:
	if @cErrMsg is not null
	begin		
		raiserror 77777 @cErrMsg
		return 1
	end
	return 0
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateActionEMail]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateActionEMail] 
	-- Add the parameters for the stored procedure here
	@AccountNo VARCHAR(255)	= NULL,
	@Params	INT = NULL,
	@ID INT = NULL,
	@EmailLog VARCHAR(2000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Params = 1
	BEGIN
		UPDATE MasterPDF
		SET Success = 1, SentEmailDate=GETDATE(), SentEmailLog = @EmailLog
		WHERE AccountNo = @AccountNo AND ID=@ID
	END
	ELSE IF @Params = 2
	BEGIN
		UPDATE MasterPDF
		SET Failure = Failure+1, SentEmailLog = @EmailLog
		WHERE AccountNo = @AccountNo AND ID=@ID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateGeneratePDFLog]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- [dbo].[UpdateGeneratePDFLog] '[Success]','25' 
-- =============================================
CREATE PROCEDURE [dbo].[UpdateGeneratePDFLog] 
	-- Add the parameters for the stored procedure here
	@Message VARCHAR(2000)= NULL,
	@ID INT = NULL,
	@File VARCHAR(150)= NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		UPDATE [SQL_Statement].[dbo].[MasterPDF]
		SET GeneratePDFLog = @Message, 
		    GeneratePDFDate = GETDATE(),
		    [File] = @File
		WHERE ID=@ID

	
END

GO
/****** Object:  StoredProcedure [dbo].[UploadExcel]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UploadExcel]
/*
	CreateBy	: Eldwin
	CreateDate	: 20200910
	Objective	: Upload excel parameter e-statement

	Revised (Date, NIK, Description)
	-----------------------------------------------------------
	
	Notes:
	
	
*/
	@pFileName			varchar(500),
	@pPeriode			date,
	@pTest				varchar(100) = null output
AS

	SET NOCOUNT ON;

declare
	@ProcessDate			datetime,
	@Today					datetime,
	@SprocName				varchar(50),
	@ReturnCode				smallint
		
declare 
	@PathFolder			varchar(100),
	@FileFullPath		varchar(200),
	@sql				nvarchar(max),
	@Guid				uniqueidentifier,
	@DateTime			datetime,
	@pErrMsg			varchar(255)

--- Mulai
set @ProcessDate = getdate()
set @Today = GETDATE()
set @SprocName = object_name(@@procid)
set @Guid = NEWID()

--SET @PathFolder = '\\10.10.2.74\Project\MyFunding\trunk\MayoraWeb\Files\UploadFiles\Temp\'
SET @PathFolder = '\\10.10.2.74\Project\MyFunding-Gabung\MyFunding\trunk\MayoraWeb\Files\UploadFiles\Temp\'

set @FileFullPath = @PathFolder + @pFileName

CREATE TABLE #EXCEL_IMPORT
(
	AccountNo varchar(30)
)


begin try
	SET @sql = 'SELECT convert(varchar,[AccountNo])
				FROM OPENROWSET(''Microsoft.ACE.OLEDB.12.0'',
				''Excel 12.0; Database='+ @FileFullPath +'; HDR=YES; IMEX=1'',
				''SELECT * FROM [Sheet1$]'');'

	insert into #EXCEL_IMPORT 
	Exec(@sql)
end try


begin catch
	select @pErrMsg = ERROR_MESSAGE(); 
end catch

if not exists(select count(1)  from #EXCEL_IMPORT)
begin
	select @pErrMsg = 'File upload salah'
end

declare 
	@format			varchar(max),
	@AllLine		varchar(500),
	@MinIDHeader	bigint

set @AllLine = REPLICATE(' ',130)
set @format = ''


--delete from Temp

---------------- INSERT HEADER ----------------
insert into Temp([guid], IDHeader, HeaderText, FooterText)
select
	@Guid,
	a.ID,
	char(12) +char(13) + 
	--'         1         2         3         4         5         6         7         8         9         0         1         2         3         4'+ char(13) + 
	--replicate('1234567890',18) + char(13)  + 
	rtrim(STUFF(@AllLine, 85 , 3, isnull(b.NoHalaman,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 85 , len(isnull(a.Periode,'')), isnull(a.Periode,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len(isnull(a.cabang,'')), isnull(a.cabang,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 85 , len(isnull(a.TypeAccount,'')), isnull(a.TypeAccount,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len(isnull(a.CIF,'')), isnull(a.CIF,''))) + char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.AccountName,'')), isnull(a.AccountName,'')), 85 , len(isnull(a.AccountNo,'')), isnull(a.AccountNo,''))) + char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.Alamat1,'')), isnull(a.Alamat1,'')), 85 , len(isnull(a.Currency,'')), isnull(a.Currency,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len(isnull(a.Alamat2,'')), isnull(a.Alamat2,''))) + char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 6 , len(isnull(a.Alamat3,'')), isnull(a.Alamat3,'')), 85 , len(isnull(a.NPWP,'')), isnull(a.NPWP,''))) + char(13) + 
	rtrim(STUFF(@AllLine, 6 , len('No Rekening Lama : ' + isnull(a.OldAcctNo,'')), 'No Rekening Lama : ' + isnull(a.OldAcctNo,''))) + char(13) + 
	char(13)+char(13) + 
	rtrim(STUFF(STUFF(@AllLine, 25 , len('Saldo Awal'), 'Saldo Awal'), 111 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(SaldoAwal,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(SaldoAwal,0) AS money), 1), 20))) + char(13) as HeaderText,
	
	rtrim(STUFF(STUFF(STUFF(@AllLine, 25 , len('TOTAL'), 'TOTAL'), 66 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalDebet,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalDebet,0) AS money), 1), 20)), 87 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalKredit,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.TotalKredit,0) AS money), 1), 20))) + char(13) +
	rtrim(STUFF(STUFF(@AllLine, 25 , len('Saldo Akhir'), 'Saldo Akhir'), 111 , len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.SaldoAkhir,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(b.SaldoAkhir,0) AS money), 1), 20))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Frekwensi Transaksi Debet:' + isnull(b.FrekuensiDebet,'')), 'Frekwensi Transaksi Debet:' + isnull(b.FrekuensiDebet,''))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Frekwensi Transaksi Kredit:' + isnull(b.FrekuensiKredit,'')), 'Frekwensi Transaksi Kredit:' + isnull(b.FrekuensiKredit,''))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Saldo Terendah :' + Right(Replicate(' ', 26) + CONVERT(varchar, CAST(isnull(b.SaldoTerendah,0) AS money), 1), 26)), 'Saldo Terendah :' + Right(Replicate(' ', 26) + CONVERT(varchar, CAST(isnull(b.SaldoTerendah,0) AS money), 1), 26))) + char(13) +
	rtrim(STUFF(@AllLine, 5 , len('Saldo Tertinggi :' + Right(Replicate(' ', 25) + CONVERT(varchar, CAST(isnull(b.SaldoTertinggi,0) AS money), 1), 25)), 'Saldo Tertinggi :' + Right(Replicate(' ', 25) + CONVERT(varchar, CAST(isnull(b.SaldoTertinggi,0) AS money), 1), 25))) + char(13) + char(13) +
	rtrim(STUFF(@AllLine, 21 , len('SEHUBUNGAN PERGANTIAN CORE BANKING DENGAN INI DIINFORMASIKAN BAHWA NOMOR REKENING GIRO ANDA SECARA'), 'SEHUBUNGAN PERGANTIAN CORE BANKING DENGAN INI DIINFORMASIKAN BAHWA NOMOR REKENING GIRO ANDA SECARA')) + char(13) +
	rtrim(STUFF(@AllLine, 21 , len('OTOMATIS BERUBAH MENJADI NOMOR REKENING BARU SEBAGAIMANA TERCANTUM DALAM STATEMENT R/K INI, NAMUN'), 'OTOMATIS BERUBAH MENJADI NOMOR REKENING BARU SEBAGAIMANA TERCANTUM DALAM STATEMENT R/K INI, NAMUN')) + char(13) +
	rtrim(STUFF(@AllLine, 21 , len('UNTUK KENYAMANAN TRANSAKSI ANDA NOMOR REKENING LAMA MASIH DAPAT DIPERGUNAKAN.'), 'UNTUK KENYAMANAN TRANSAKSI ANDA NOMOR REKENING LAMA MASIH DAPAT DIPERGUNAKAN.')) + 
	REPLICATE(char(13),8) +'*' as FooterText
from 
	SQL_Statement.dbo.HeaderTextFile a
	join SQL_Statement.dbo.DetailFooter b
		on a.ID = b.IDHeader
	join #EXCEL_IMPORT x on x.AccountNo = a.AccountNo collate latin1_general_ci_as
where
	char(32)+a.Periode = dbo.fn_indonesian_date(DATEADD(day,1,@pPeriode))
order by a.ID

---------------- INSERT BODY ----------------
;WITH x as 
(
	select 
		b.IDHeader,
		Pet = CONVERT(NVARCHAR(MAX), rtrim(STUFF(STUFF(STUFF(STUFF(STUFF(STUFF(STUFF(@AllLine, 5 , len(Tanggal), isnull(Tanggal,'')), 14 , len(Valuta), isnull(Valuta,'')), 25 , len(Detail), isnull(Detail,'')), 53 , len(NoRef), isnull(NoRef,'')), 68 , 
			len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Debet,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Debet,0) AS money), 1), 20)), 89 , 
			len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Kredit,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Kredit,0) AS money), 1), 20)), 111 , 
			len(Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Saldo,0) AS money), 1), 20)), Right(Replicate(' ', 20) + CONVERT(varchar, CAST(isnull(Saldo,0) AS money), 1), 20) )) + char(13) +
		case when Narative is null then '' else rtrim(STUFF(@AllLine, 25 , len(isnull(Narative,'')), isnull(Narative,''))) + char(13) end),
		r1 = ROW_NUMBER() OVER (PARTITION BY b.IDHeader ORDER BY a.ID)
	from
		SQL_Statement.dbo.DetailBody a
		join Temp b
			on a.IDHeader = b.IDHeader
		where
			b.[guid] = @Guid
),
a AS 
(
  SELECT IDHeader, Pet, r1 FROM x WHERE r1 = 1
),
r AS
(
  SELECT IDHeader, Pet, r1 FROM a WHERE r1 = 1
  UNION ALL
  SELECT x.IDHeader, r.Pet + x.Pet, x.r1
    FROM x INNER JOIN r
	ON r.IDHeader = x.IDHeader
	AND x.r1 = r.r1 + 1
)
SELECT IDHeader, Pets = MAX(Pet)
	into #RecursiceResult
  FROM r
  GROUP BY IDHeader 
  ORDER BY IDHeader
  OPTION (MAXRECURSION 0);

	
update a set
	DetailText = b.Pets
from 
	Temp a
	join #RecursiceResult b
		on a.IDHeader = b.IDHeader
where
	a.[guid] = @Guid


select top 1 
	@MinIDHeader = IDHeader
from Temp
where [guid] = @Guid
order by IDHeader asc

update Temp set 
	HeaderText = char(12) + HeaderText
where IDHeader = @MinIDHeader
and [guid] = @Guid

DECLARE @bcpCommand varchar(2000)
																																																													  
SET @bcpCommand = 'bcp "select HeaderText + DetailText + REPLICATE(char(13),24 - (len(DetailText) - len(replace(DetailText,char(13),'''')))) + FooterText from SQL_Statement.dbo.Temp where [guid] = '''+ convert(varchar(64), @Guid) +'''" queryout "\\10.10.2.74\Project\MyFunding-Gabung\MyFunding\trunk\MayoraWeb\Files\EStatementByRequest\Temp\Statement_'+ convert(varchar, getdate(), 112) +'_' + replace(convert(varchar, getdate(), 108),':','') +'.txt" -c -U sa -P Mayora1234 -S '+ convert(varchar,@@ServerName)
select @pTest = 'Statement_'+convert(varchar,GETDATE(),112)+'_'+replace(convert(varchar, getdate(), 108),':','')+'.txt'

--print @bcpCommand
EXEC xp_cmdshell @bcpCommand, no_output

delete from Temp where [guid] = @Guid

select @pTest as OutputMessage

IF OBJECT_ID('tempdb..#EXCEL_IMPORT') IS NOT NULL DROP TABLE #EXCEL_IMPORT
IF OBJECT_ID('tempdb..#RecursiceResult') IS NOT NULL DROP TABLE #RecursiceResult

	if @pErrMsg is not null
		begin
			goto ERROR
		end

	ERROR:
		if @pErrMsg is not null
		begin		
			raiserror 77777 @pErrMsg
			return 1
		end
		return 0
GO
/****** Object:  StoredProcedure [dbo].[XXX_Get_Distinct_HeaderTextFile_By_AccountNo_OldProduct]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <>
-- Description:	<>
-- EXEC  [dbo].[Get_Distinct_HeaderTextFile_By_AccountNo_OldProduct] 
-- =============================================
CREATE PROCEDURE [dbo].[XXX_Get_Distinct_HeaderTextFile_By_AccountNo_OldProduct] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT 
		distinct(a.AccountNo)
		,AccountName
		,replace(convert(varchar,b.BirthDate,103),'/','') as Birthdate
		,b.StatementPeriod
		,upper(a.Periode) AS Periode
		,Cabang
		,(SELECT top 1 content from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as Content
		,(SELECT top 1 name from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as Product
		,(SELECT top 1 c.[Description] from MasterEmailTemplate c join MasterProduct d ON c.ProductCode=d.Code WHERE d.[Id]=b.ProductCategory) as [Subject]
	FROM HeaderTextFile a 
	JOIN RegisteredAccount b ON a.AccountNo=b.AccountNo AND upper(a.Periode) = upper((SELECT dbo.ConvertMonth(b.StatementPeriod))) 
	JOIN MasterProduct d ON b.ProductCategory=d.Id
	WHERE upper(a.Periode) = upper((SELECT dbo.ConvertMonth(SUBSTRING(CONVERT(VARCHAR,dateadd(mm, datediff(mm, 0, dateadd(MM, -1, getdate())), 0),112),1,6)))) 
	AND BirthDate is not null
	--AND d.code not in('6001','6002','6003','6004','6005','6006','6007','6008','6011') 
	AND left(d.Code,2) <> 60
	AND d.IsDelete=0

END

GO
/****** Object:  StoredProcedure [dbo].[XXX_Job_InsertTablePDF]    Script Date: 2020-11-26 09:32:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <>
-- Description:	<>
-- EXEC [dbo].[Job_InsertTablePDF]
-- =============================================
CREATE PROCEDURE [dbo].[XXX_Job_InsertTablePDF]


AS
BEGIN


SET NOCOUNT ON;

DECLARE @tanggal varchar(6), @tgl1 Date, @tgl2 Date

SET @tgl1='2020-07-01'
SET @tgl2='2020-07-31'

CREATE TABLE #TEMP_ACCOUNTSTATEMENT(
	[PK] bigint,
	[ID_STMT_ENTRY] varchar(50) NULL,
	[batch_date] date NULL,
	[date_time] varchar(50) NULL,
	[customer_no] varchar(50) NULL,
	[account_number] varchar(50) NULL,
	[account_name] varchar(900) NULL,
	[start_bal] decimal(38, 2) NULL,
	[debit] decimal(38, 2) NULL,
	[credit] decimal(38, 2) NULL,
	[saldo] decimal(38, 2) NULL,
	[currency] varchar(50) NULL,
	[transaction_code] varchar(50) NULL,
	[transaction_desc] varchar(900) NULL,
	[narrative] varchar(900) NULL,
	[system_id] varchar(50) NULL,
	[our_reference] varchar(50) NULL,
	[term_type] varchar(50) NULL,
	[term_id] varchar(50) NULL,
	[card_no] varchar(50) NULL,
	[recipt_no] varchar(50) NULL,
	[transaction_date] date NULL,
	[transaction_time] varchar(50) NULL,
	[terminal_id] varchar(50) NULL,
	[dealer_name] varchar(100) NULL,
	[feature_name] varchar(100) NULL,
	[product_ref] varchar(50) NULL,
	[customer_number] varchar(50) NULL,
	[retrieval_ref_number] varchar(50) NULL,
	[id_reference] varchar(50) NULL,
	[amount_lcy] decimal(38, 2) NULL,
	[debit_acct_no] varchar(50) NULL,
	[credit_acct_no] varchar(50) NULL,
	[debit_amount] decimal(38, 2) NULL,
	[credit_amount] decimal(38, 2) NULL,
	[dr_narrative] varchar(900) NULL,
	[cr_narrative] varchar(900) NULL,
	[transaction_type] varchar(50) NULL,
	[trans_reff] varchar(50) NULL,
	[core_ref] varchar(50) NULL,
	[feature_code] varchar(50) NULL,
	[selling_price] decimal(18, 2) NULL,
	[card_number] varchar(100) NULL,
	[product_code] varchar(100) NULL,
	[dealer_code] varchar(50) NULL,
	[product_category] varchar(50) NULL,
	[product_name] varchar(900) NULL,
	[keterangan] varchar(900) NULL,
	[cek_giro] varchar(3) NULL,
	[cek_giro_account_no] varchar(50) NULL,
	[cek_giro_no] bigint NULL

)

CREATE TABLE #ACCNUM(
Acc_No varchar (50)
)

CREATE TABLE #ACCNUMDETAIL(
id INT IDENTITY(1,1),
JumlahTransaksi int,
Acc_No varchar (50),
JumlahHalaman int,
periode varchar (50),
CIF varchar (100),
AccountName varchar (900),
kurs varchar(50),
Alamat1 varchar(250),
Alamat2 varchar(250),
Alamat3 varchar(250),
NPWP varchar(50),
OldAcctNo varchar(30),
cabang varchar(30),
TypeAccount varchar(50)
)

CREATE TABLE #DETAILBODYTEMP(
id INT IDENTITY(1,1),
Acc_No varchar (50),
account_name varchar (100)
      ,Tanggal varchar(10)
      ,Valuta varchar(10)
      ,[SaldoAwal]  decimal(38, 2)
      ,[SaldoAkhir] decimal(38, 2)
      ,[Debet] decimal(38, 2)
      ,[Kredit] decimal(38, 2)
      ,Detail varchar(150)
      ,Narative varchar(250)
      ,NoRef varchar(30)
)







INSERT INTO #TEMP_ACCOUNTSTATEMENT
SELECT * FROM [SQL_TEMENOS].[dbo].[ACCOUNT_STATEMENT] 
WHERE batch_date Between @tgl1 and @tgl2 and [product_category] in ('6001','6002','6003','6004','6005','6006','6007','6008','6011')


INSERT INTO #ACCNUM
SELECT b.account_no FROM SQL_TEMENOS.dbo.ACCOUNT b JOIN SQL_TEMENOS.dbo.CUSTOMER c ON b.customer_no =c.[@ID]
left join SQL_TEMENOS.dbo.account_closed e on b.account_no = e.[@ID]
WHERE  b.ac_sta_status in ('Email', 'post') 
       and e.[@ID] is null 
	   and b.category in ('6001','6002','6003','6004','6005','6006','6007','6008','6011') 


INSERT INTO #ACCNUMDETAIL		
SELECT COUNT(a.[account_number])AS JumlahTransaksi, a.[account_number],
       CASE WHEN COUNT(a.[account_number])%11=0 
       THEN COUNT(a.[account_number])/11 
       ELSE COUNT(a.[account_number])/11+1 END AS JumlahHalaman,
       LTRIM(CONVERT (VARCHAR,[dbo].[fn_indonesian_date] (@tgl1)))AS PERIODE,
       a.customer_no,a.[account_name],a.[currency],[address],[street],[deskripsi],[cus_npwp],[alt_acct_id],
       company_name,[description]
       
FROM #ACCNUM b
JOIN #TEMP_ACCOUNTSTATEMENT a ON a.[account_number] = b.Acc_No
JOIN [SQL_TEMENOS].[dbo].[ACCOUNT] d ON d.account_no = b.Acc_No
JOIN [SQL_TEMENOS].[dbo].[CUSTOMER] c ON a.[customer_no] = c.[customer_no]
JOIN [SQL_TEMENOS].[dbo].[COMPANY] e ON e.[@ID] = c.[company_book]
JOIN [SQL_TEMENOS].[dbo].[CATEGORY] f ON f.[@ID] = a.product_category
JOIN [SQL_TEMENOS].[dbo].[MAP_CITY] g ON g.[kode] = c.[town_country]

GROUP BY a.[account_number],
         a.customer_no,
         a.[account_name],
         a.[currency],
         [address],
         [street],
         [cus_npwp],
         [alt_acct_id],
         company_name,
         [description],
         [deskripsi]
ORDER BY COUNT(a.[account_number]) DESC;




	
DECLARE @norek varchar(100),@count int=1,@countMAX int, @jmlhhal int, @countHal int
	
SELECT @countMAX=max(id) FROM #ACCNUMDETAIL	


WHILE ( @count < @countMAX+1)

BEGIN
SELECT @jmlhhal=JumlahHalaman, @norek=Acc_No FROM #ACCNUMDETAIL where id=@count


DECLARE @counter int=1, @idHEAD bigint, @a int=1, @z int=11, @saldoawal varchar(100), @saldoakhir varchar(100),
@totaldebet varchar(100),@totalkredit varchar(100),@FreqDebet varchar(100),@FreqKredit varchar(100),
@saldoMin varchar(100), @saldoMax varchar(100), @maxID bigint



INSERT INTO #DETAILBODYTEMP
SELECT account_number,account_name
      ,CONVERT(VARCHAR,batch_date,112) AS tanggal
      ,CONVERT(VARCHAR,CONVERT(DATE,CONVERT(VARCHAR,'20'+substring([date_time],0,7)))) AS Valuta
      ,start_bal
      ,saldo
      ,debit
      ,credit
      ,transaction_desc
      ,substring(replace(narrative,'Transaksi : ' + transaction_desc + ' - ',''),0,
       CHARINDEX(' - ',replace(narrative,'Transaksi : ' + transaction_desc + ' - ',''))) as narrative
      ,CASE WHEN our_reference IS NULL THEN substring(narrative,CHARINDEX('ref : ',narrative)+6,100)
       ELSE our_reference end AS NoRef  
 FROM #TEMP_ACCOUNTSTATEMENT
where [account_number] = @norek	
order by PK



WHILE (@counter<@jmlhhal+1)
BEGIN

INSERT INTO [SQL_Statement].[dbo].[HeaderTextFile]
SELECT periode,
       CIF,
       Acc_No,
       AccountName,
       kurs,
       Alamat1,
       Alamat2,
       Alamat3,
       NPWP,
       OldAcctNo, 
       cabang,
       TypeAccount,
       'System',
       GETDATE(),
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       0,
       0
       FROM #ACCNUMDETAIL where id=@count	

SELECT @idHEAD = @@IDENTITY 

if(@counter=1)

begin
SELECT @saldoawal= [SaldoAwal] FROM #DETAILBODYTEMP where id=1
end

else

begin
SELECT @saldoawal= [SaldoAkhir] FROM #DETAILBODYTEMP where id=@z-11
end

SELECT @maxID=max(id) FROM #DETAILBODYTEMP where id between @a AND @z 

SELECT @saldoakhir=[SaldoAkhir] FROM #DETAILBODYTEMP where id=@maxID

SELECT @totaldebet=sum(Debet),@FreqDebet=count(Debet) FROM #DETAILBODYTEMP where Debet<>'0.00' AND id between @a AND @z 

SELECT @totalkredit=sum(Kredit),@FreqKredit=count(Kredit) FROM #DETAILBODYTEMP where Kredit<>'0.00' AND id between @a AND @z 

SELECT @saldoMin=min([SaldoAkhir]),@saldoMax=max([SaldoAkhir]) FROM #DETAILBODYTEMP where id between @a AND @z 


INSERT INTO [SQL_Statement].[dbo].[DetailFooter]
SELECT @idHEAD
      ,@counter
      ,@saldoawal
      ,@saldoakhir
      ,ISNULL(@totaldebet,'0.00')
      ,ISNULL(@totalkredit,'0.00')
      ,@FreqDebet
      ,@FreqKredit
      ,@saldoMin
      ,@saldoMax,
       'System',
       GETDATE(),
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       0,
       0


INSERT INTO [SQL_Statement].[dbo].[DetailBody]
SELECT @idHEAD
        ,Detail 
        ,Tanggal 
        ,Valuta
        ,[Narative]
        ,[NoRef]
        ,Debet
        ,Kredit
        ,[SaldoAkhir]
        ,'System'
        ,GETDATE()
        ,NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        0,
        0
         FROM #DETAILBODYTEMP
WHERE id between @a AND @z


SET @counter  = @counter  + 1
SET @a=@a+11
SET @z=@z+11  

END


truncate table #DETAILBODYTEMP
    SET @count  = @count  + 1
END

DROP TABLE #ACCNUMDETAIL
DROP TABLE #ACCNUM
DROP TABLE #DETAILBODYTEMP
DROP TABLE #TEMP_ACCOUNTSTATEMENT
  
END


GO
