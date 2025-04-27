GO
ALTER Procedure [dbo].[usp_GetHotelRoomTypes](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,
	@HotelId bigint = 0,

	@Id BIGINT =NULL
)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
			  FROM [dbo].[tblHotelRoomTypes] t
				Where (@HotelId IS NULL OR t.HotelId=@HotelId)
				  AND (@Id IS NULL OR t.Id=@Id)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (t.RoomTypeCode like @SearchString) 
							OR (t.RoomTypeName like @SearchString) 
							OR (t.RoomTypeDescription like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,M.TotalCount
				  FROM [dbo].[tblHotelRoomTypes] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY RoomTypeName ASC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END


--EXEC usp_GetHotelRoomTypes

GO

ALTER PROCEDURE [dbo].[usp_1GetEntityClass_New](
    @TableName SYSNAME,
    @NameSpace VARCHAR(500) = NULL,
    @ClassName VARCHAR(256) = NULL,
    @BaseClassName VARCHAR(256) = NULL,
    @IsMultiLingual BIT = 0,
    @ResourceNameSpace VARCHAR(256) = NULL
)
AS
SET NOCOUNT ON;
BEGIN
    DECLARE @TableNameSingular NVARCHAR(256) = dbo.PluralToSingular(@TableName)

    DECLARE @ClassObjectName NVARCHAR(256) = CASE WHEN @TableNameSingular LIKE 'tbl%' 
                                                  THEN RIGHT(@TableNameSingular, LEN(@TableNameSingular) - 3) 
                                                  ELSE @TableNameSingular 
                                                  END 

    IF @ClassName IS NULL OR @ClassName = ''
        SET @ClassName = @ClassObjectName

    DECLARE @ClassDefinition NVARCHAR(500) = ''
    DECLARE @DefaultUsings NVARCHAR(500) = ''
    DECLARE @ResourceName NVARCHAR(256) = NULL

    IF (@BaseClassName IS NOT NULL)
        SET @BaseClassName = ' : ' + @BaseClassName
    ELSE
        SET @BaseClassName = ''

    -- Class definition
    SET @ClassDefinition = CHAR(13) + CHAR(10) + '[DataTable("dbo.' + @TableName + '")]' + 
                            CHAR(13) + CHAR(10) + '[StoreProcedure("dbo.usp_Get' + RIGHT(@TableName, LEN(@TableName) - 3) + '")]' + 
                            CHAR(13) + CHAR(10) + 'public class ' + @ClassName + @BaseClassName + CHAR(13) + CHAR(10) + '{' + CHAR(13) + CHAR(10)

    -- Default Usings
    SET @DefaultUsings = CHAR(13) + CHAR(10) + 'using System;' +
                         CHAR(13) + CHAR(10) + 'using System.Data;' + 
                         CHAR(13) + CHAR(10) + 'using IIKI.BaseApp.Utils;'

    IF (@IsMultiLingual = 1)
    BEGIN
        SET @DefaultUsings = @DefaultUsings + CHAR(13) + CHAR(10) + 'using IIKI.BaseApp.Localization.Resources;'
        IF (ISNULL(@ResourceNameSpace, '') != '')
            SET @DefaultUsings = @DefaultUsings + CHAR(13) + CHAR(10) + 'using '+@ResourceNameSpace + ';'
    END

    SET @DefaultUsings = @DefaultUsings + CHAR(13) + CHAR(10) + 'using System.ComponentModel.DataAnnotations;' + CHAR(13) + CHAR(10)

    -- Namespace
    IF (@NameSpace IS NULL OR @NameSpace = '')
        SET @NameSpace = CHAR(13) + CHAR(10) + 'namespace IIKI.BaseApp.Business.Objects' + CHAR(13) + CHAR(10) + '{'
    ELSE
        SET @NameSpace = CHAR(13) + CHAR(10) + 'namespace ' + @NameSpace + CHAR(13) + CHAR(10) + '{'

    -- Resource Name
    IF (@IsMultiLingual = 1)
    BEGIN
        IF (ISNULL(@ResourceNameSpace, '') = '')
            SET @ResourceNameSpace = 'IIKI.BaseApp.Localization.Resources';
        SET @ResourceName = @ResourceNameSpace + '.' + @ClassObjectName + 'Labels'
    END

    -- Print the using statements and namespace
    PRINT @DefaultUsings + @NameSpace + @ClassDefinition

    -- Declare columns cursor
    DECLARE @ColumnName NVARCHAR(256)
    DECLARE @ColumnId INT
    DECLARE @ColumnType NVARCHAR(256)
    DECLARE @NullableSign NVARCHAR(10)
    DECLARE @TypeName NVARCHAR(256)
    DECLARE @is_computed bit
	DECLARE @is_nullable bit
    DECLARE @DataAttributes NVARCHAR(500)

    DECLARE column_cursor CURSOR FOR
    SELECT 
        REPLACE(col.name, ' ', '_') AS ColumnName,
        column_id AS ColumnId,
        [dbo].[GetCSharpDataTypeFromSQLColType](typ.name) AS ColumnType,
        CASE WHEN col.is_nullable = 1 AND typ.name NOT IN ('char', 'nchar', 'ntext', 'text', 'nvarchar', 'varchar') 
            THEN '?' 
            ELSE '' 
        END AS NullableSign,
		col.is_computed,
		col.is_nullable,
		typ.name TypeName,
		-- Additional column-specific attributes
        CASE 
            WHEN col.is_computed = 1
                THEN '[AutoGeneratedField(Type = DbType.' + [dbo].[GetCSharpDBTypeFromSQLColType](typ.name) + ', IsShowOnForm = false, IsShowInGrid = false)]' + CHAR(13) + CHAR(10)
            
            ELSE
                '[DataField(Type = DbType.' + [dbo].[GetCSharpDBTypeFromSQLColType](typ.name) + ', IsShowOnForm = true, FieldOrderOnForm = 1, IsShowInGrid = true, FieldOrderInGrid = 1, RenderMode =  '+ [dbo].[GetInputRenderModeByColType](typ.name,col.name,0) +' )]' + CHAR(13) + CHAR(10)
        END AS DataAttributes
    FROM sys.columns col
    JOIN sys.types typ ON col.user_type_id = typ.user_type_id
    WHERE col.object_id = OBJECT_ID(@TableName)

    -- Iterate over columns and generate public properties
    OPEN column_cursor
    FETCH NEXT FROM column_cursor INTO @ColumnName, @ColumnId, @ColumnType, @NullableSign, @is_computed, @is_nullable, @TypeName, @DataAttributes

    WHILE @@FETCH_STATUS = 0
    BEGIN
		IF(ISNULL(@DataAttributes,'')!='')
		BEGIN
			PRINT @DataAttributes
		END
		DECLARE @DisplayName NVARCHAR(MAX);
		DECLARE @PromptName NVARCHAR(MAX);
		DECLARE @RequiredErrorMessage NVARCHAR(MAX);

		-- Assigning common values for DisplayName, PromptName, and RequiredErrorMessage
		SET @DisplayName = CASE 
								WHEN @ColumnName LIKE '%Description' THEN 'RecordDescription'
								WHEN @ColumnName LIKE '%Name' THEN 'RecordName'
								WHEN @ColumnName LIKE '%Code' THEN 'RecordCode'
								ELSE @ColumnName 
							END;

		SET @PromptName = @DisplayName; -- You can modify this if Prompt differs from Display Name

		SET @RequiredErrorMessage = @DisplayName + ' is Required';

		-- Checking if it's multi-lingual
		IF (@IsMultiLingual = 1)
		BEGIN
			IF (@ColumnName LIKE '%Code' OR @ColumnName LIKE '%Description' OR @ColumnName LIKE '%Name' 
				OR @ColumnName IN ('RecordStatus', 'CreatedBy', 'UpdatedBy', 'CreatedDate', 'UpdatedDate'))
			BEGIN
				-- Display Attribute
				PRINT '[Display(Name = "' + @DisplayName + '", Prompt = "' + @PromptName + '", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels)/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]' + CHAR(13) + CHAR(10);
        
				-- Required Attribute (if not nullable)
				IF (@is_nullable = 0)
				BEGIN
					PRINT '[Required(ErrorMessageResourceName = "' + @DisplayName + 'Required", ErrorMessageResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels)/*, AllowEmptyStrings = false*/)]' + CHAR(13) + CHAR(10);
				END
			END
			ELSE
			BEGIN
				-- Display Attribute with dynamic ResourceName
				PRINT '[Display(Name = "' + @DisplayName + '", Prompt = "' + @PromptName + '", ResourceType = typeof(' + @ResourceName + ')/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]' + CHAR(13) + CHAR(10);
        
				-- Required Attribute (if not nullable)
				IF (@is_nullable = 0)
				BEGIN
					PRINT '[Required(ErrorMessageResourceName = "' + @DisplayName + 'Required", ErrorMessageResourceType = typeof(' + @ResourceName + ')/*, AllowEmptyStrings = false*/)]' + CHAR(13) + CHAR(10);
					--PRINT '[Required(ErrorMessage = "' + @RequiredErrorMessage + '"/*, AllowEmptyStrings = false*/)]' + CHAR(13) + CHAR(10);
				END
			END
		END
		ELSE
		BEGIN
			-- Display Attribute for non-multi-lingual case
			PRINT '[Display(Name = "' + @ColumnName + '", Prompt = "' + @ColumnName + '"/*, Order = 0, GroupName = "", ShortName = "", Description = "", AutoGenerateField = false, AutoGenerateFilter = false*/)]' + CHAR(13) + CHAR(10);
    
			-- Required Attribute (if not nullable)
			IF (@is_nullable = 0)
			BEGIN
				PRINT '[Required(ErrorMessage = "' + @ColumnName + ' is Required"/*, AllowEmptyStrings = false*/)]' + CHAR(13) + CHAR(10);
			END
		END

        PRINT 'public ' + @ColumnType + @NullableSign + ' ' + @ColumnName + ' { get; set; }' + CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)
        FETCH NEXT FROM column_cursor INTO @ColumnName, @ColumnId, @ColumnType, @NullableSign, @is_computed, @is_nullable, @TypeName, @DataAttributes
    END

    CLOSE column_cursor
    DEALLOCATE column_cursor
	
	PRINT CHAR(13) + CHAR(10)+ CHAR(13) + CHAR(10)
	PRINT '////Read Only Fields'
	PRINT CHAR(13) + CHAR(10)
	PRINT '[ReadOnlyField(Type = DbType.Int32, IsShowInGrid = false)]'
	PRINT '[System.ComponentModel.DataAnnotations.Schema.NotMapped]'
	PRINT '[Display(Name = "TotalCount", ResourceType = typeof(IIKI.BaseApp.Localization.Resources.CommonLabels))]'
	PRINT 'public int TotalCount { get; set; }'


    -- Closing the class and namespace
    PRINT CHAR(13) + CHAR(10) + '}'
    PRINT '}'
END

-------
/*************** DROP PROCEDURE IF EXISTS ***************/
IF OBJECT_ID('[dbo].[usp_GetCommonStatusAndTypes]', 'P') IS NOT NULL
    DROP PROCEDURE [dbo].[usp_GetCommonStatusAndTypes];
GO

/****** Object:  StoredProcedure [dbo].[usp_GetCommonStatusAndTypes] Script Date: 2025-02-18 23:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetCommonStatusAndTypes] (
    @OffSet BIGINT = 0, 
    @PageSize BIGINT = 10,
    @SortColumn NVARCHAR(100) = NULL,
    @SortOrder VARCHAR(5) = 'asc',
    @Command NVARCHAR(100) = NULL,
    @SearchString NVARCHAR(500) = NULL,
	@CompanyTypeId BIGINT = NULL,
	@StatusTypeId INT = NULL,
	@ParentStatusId INT = NULL,
	@StatusId INT = NULL,
    @Id BIGINT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Prepare search string for LIKE clause
    IF(ISNULL(@SearchString, '!!!') != '!!!')
    BEGIN
        SET @SearchString = '%' + @SearchString + '%';
    END;

    DECLARE @SortQuery NVARCHAR(MAX) = N''; 

    -- Set default sort column if not provided
    IF (@SortColumn IS NULL)
        SET @SortColumn = (SELECT TOP 1 COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblCommonStatusAndTypes' AND TABLE_SCHEMA = 'dbo' ORDER BY ORDINAL_POSITION);

    SET @SortQuery = @SortColumn;

    ;WITH main AS (
        SELECT  tblC.Id 
        FROM [dbo].[tblCommonStatusAndTypes] tblC 
        WHERE (@Id IS NULL OR tblC.Id = @Id)  
			AND (@CompanyTypeId IS NULL OR tblC.CompanyTypeId = @CompanyTypeId)  
			AND (@StatusTypeId IS NULL OR tblC.StatusTypeId = @StatusTypeId)  
			AND (@StatusId IS NULL OR tblC.StatusId = @StatusId)  
			AND (@ParentStatusId IS NULL OR tblC.ParentStatusId = @ParentStatusId)  
            AND (@SearchString IS NULL
 OR (tblC.[StatusTypeName] LIKE @SearchString
 OR tblC.[StatusName] LIKE @SearchString
 OR tblC.[StatusDescription] LIKE @SearchString
 --OR tblC.[CreatedBy] LIKE @SearchString
 --OR tblC.[UpdatedBy] LIKE @SearchString
))    )

    SELECT tblC.*
	,totalCount.TotalCount
    FROM [dbo].[tblCommonStatusAndTypes] tblC 
	JOIN  main on main.Id= tblC.Id
	CROSS APPLY (SELECT count(*) TotalCount from main) totalCount
    ORDER BY  @SortQuery + ' ' + @SortOrder
    OFFSET @OffSet ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
GO



/*************** DROP PROCEDURE IF EXISTS ***************/
IF OBJECT_ID('[dbo].[usp_GetPromotions]', 'P') IS NOT NULL
    DROP PROCEDURE [dbo].[usp_GetPromotions];
GO

/****** Object:  StoredProcedure [dbo].[usp_GetPromotions] Script Date: 2025-02-20 00:35:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetPromotions] (
    @OffSet BIGINT = 0, 
    @PageSize BIGINT = 10,
    @SortColumn NVARCHAR(100) = NULL,
    @SortOrder VARCHAR(5) = 'asc',
    @Command NVARCHAR(100) = NULL,
    @SearchString NVARCHAR(500) = NULL,
    @Id BIGINT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Prepare search string for LIKE clause
    IF(ISNULL(@SearchString, '!!!') != '!!!')
    BEGIN
        SET @SearchString = '%' + @SearchString + '%';
    END;

    DECLARE @SortQuery NVARCHAR(MAX) = N''; 

    -- Set default sort column if not provided
    IF (@SortColumn IS NULL)
        SET @SortColumn = (SELECT TOP 1 COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblPromotions' AND TABLE_SCHEMA = 'dbo' ORDER BY ORDINAL_POSITION);

    SET @SortQuery = @SortColumn;

    ---- Get primary key and foreign key columns
    --DECLARE @PrimaryKeyCols NVARCHAR(MAX) = '';
    --DECLARE @ForeignKeyCols NVARCHAR(MAX) = '';

    ---- Get primary key columns
    --SELECT top 1 @PrimaryKeyCols = STRING_AGG('t.['+ COLUMN_NAME +']', ', ') 
    --FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
    --WHERE TABLE_NAME = 'tblPromotions' AND TABLE_SCHEMA = 'dbo' AND CONSTRAINT_NAME LIKE 'PK%';

    ---- Get foreign key columns
    --SELECT @ForeignKeyCols = STRING_AGG('t.[' + COLUMN_NAME + ']', ', ') 
    --FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
    --WHERE TABLE_NAME = 'tblPromotions' AND TABLE_SCHEMA = 'dbo' AND CONSTRAINT_NAME LIKE 'FK%';

    ;WITH main AS (
        SELECT  tblP.Id ,
			tblC_PromotionType.StatusName PromotionTypeName,
			tblC_DiscountType.StatusName DiscountTypeName
        FROM [dbo].[tblPromotions] tblP 
		LEFT JOIN tblCommonStatusAndTypes tblC_PromotionType ON tblC_PromotionType.StatusId=tblP.PromotionTypeId AND tblC_PromotionType.StatusTypeId=9
		LEFT JOIN tblCommonStatusAndTypes tblC_DiscountType ON tblC_DiscountType.StatusId=tblP.PromotionTypeId AND tblC_DiscountType.StatusTypeId=10
        WHERE (@Id IS NULL OR tblP.Id = @Id)  
            AND (@SearchString IS NULL
 OR (tblP.[PromotionCode] LIKE @SearchString
 OR tblP.[PromotionTitle] LIKE @SearchString
 OR tblP.[PromotionDescription] LIKE @SearchString
 OR tblC_PromotionType.StatusName LIKE @SearchString
 OR tblC_DiscountType.StatusName LIKE @SearchString
 OR tblP.[CreatedBy] LIKE @SearchString
 OR tblP.[UpdatedBy] LIKE @SearchString
))    )

    SELECT tblP.*
	,totalCount.TotalCount
	,main.DiscountTypeName
	,main.PromotionTypeName
    FROM [dbo].[tblPromotions] tblP 
	JOIN  main on main.Id= tblP.Id
	CROSS APPLY (SELECT count(*) TotalCount from main) totalCount
    ORDER BY  @SortQuery + ' ' + @SortOrder
    OFFSET @OffSet ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
GO

---------

--USE [IIKI_GoRoomyDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetHotelReservations]    Script Date: 3/8/2025 2:06:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[usp_GetHotelReservations](
  	@OffSet bigint = 0, 
  	@PageSize bigint = 500,
  	@SortColumn int = 0,
  	@SortOrder varchar(5) = 'asc',
	@SearchString NVARCHAR(500)=NULL,
	@RecordStatus int =NULL,
	@Command nvarchar(100) =NULL,

	@Id BIGINT =NULL,
	@UserId NVARCHAR(256) =NULL,
	@CustomerId BIGINT =NULL,
	@HotelId BIGINT =NULL,
	@RoomId BIGINT =NULL,
	@PaymentMethodId int=null,
	@PromotionId int=null,
	@ReservationStatusId int=null,
	@ReservationMadeByStatusId int=null

)
AS
BEGIN

if(ISNULL(@SearchString,'!!!')!='!!!')
	BEGIN
		SET @SearchString='%'+@SearchString+'%'
	END

	;WITH main AS(
				SELECT Distinct t.[Id] 
				  ,tCO.FirstName AS CustomerFirstName
				  ,tCO.LastName AS CustomerLastName
				  ,tCO.EmailAddress AS CustomerEmailAddress
				  ,tCO.CellNumber AS CustomerCellNumber
				  ,tH.HotelName
				  ,[dbo].[GetEntityAddress]('tblHotels',tH.Id,3)  AS HotelFullAddress
				  ,[dbo].[GetCommonStatusAndTypes](6,null,null,null)  AS ReservationStatusJson
				  ,[dbo].[GetCommonStatusAndTypes](6,null,t.ReservationStatusId,null)  AS ReservationStatusDescription
				  ,[dbo].[GetCommonStatusAndTypes](8,null,null,null)  AS ReservationMadeByJson
				  ,[dbo].[GetCommonStatusAndTypes](8,null,t.ReservationMadeByStatusId,null)  AS ReservationMadeByDescription
				  ,[dbo].[GetCommonStatusAndTypes](7,null,null,null)  AS PaymentMethodJson
				  ,[dbo].[GetCommonStatusAndTypes](8,null,t.PaymentMethodId,null)  AS PaymentMethodDescription
			  FROM [dbo].[tblHotelReservations] t
				JOIN tblCustomers tC ON tC.Id=t.CustomerId
				JOIN tblContacts tCO ON tCO.Id=tc.ContactId
				JOIN tblHotels tH ON tH.Id=t.HotelId
				Where (@Id IS NULL OR t.Id=@Id)
					AND (@CustomerId IS NULL OR t.CustomerId=@CustomerId)
					AND (@HotelId IS NULL OR t.HotelId=@HotelId)
					AND (@UserId IS NULL OR tC.UserId=@UserId)
					AND (@RoomId IS NULL OR t.HotelRoomId=@RoomId)
					AND (@PromotionId IS NULL OR t.PromotionId=@PromotionId)
					AND (@PaymentMethodId IS NULL OR t.PaymentMethodId=@PaymentMethodId)
					AND (@ReservationStatusId IS NULL OR t.ReservationStatusId=@ReservationStatusId)
					AND (@ReservationMadeByStatusId IS NULL OR t.ReservationMadeByStatusId=@ReservationMadeByStatusId)
				  AND ( @RecordStatus IS NULL OR 1=( CASE WHEN @RecordStatus>=0 AND t.RecordStatus=@RecordStatus THEN 1 WHEN @RecordStatus=-1 AND t.RecordStatus!=2 THEN 1 WHEN @RecordStatus=-2 THEN 1 ELSE 0 END))
				  AND  ( @SearchString IS NULL 
							OR (tCO.FirstName like @SearchString) 
							OR (tCO.LastName like @SearchString) 
							OR (tCO.EmailAddress like @SearchString) 
							OR (tCO.CellNumber like @SearchString) 
							OR (tH.HotelName like @SearchString) 
							)

		), page_data AS (
				SELECT t.*
					  ,main.CustomerFirstName
					  ,main.CustomerLastName
					  ,main.CustomerEmailAddress
					  ,main.CustomerCellNumber
					  ,main.HotelName
					  ,main.HotelFullAddress
					  ,main.ReservationStatusDescription
					  ,main.ReservationStatusJson
					  ,main.ReservationMadeByDescription
					  ,main.ReservationMadeByJson
					  ,main.PaymentMethodDescription
					  ,main.PaymentMethodJson
					 -- ,main.CustomerFirstName + ' ' + main.CustomerLastName + ' (' + main.CustomerCellNumber + ') ('+main.CustomerEmailAddress+')' CustomerInfo
					  ,CASE
							WHEN main.CustomerFirstName IS NULL THEN ''  -- Handle NULL FirstName
							ELSE main.CustomerFirstName
						END +
						CASE
							WHEN main.CustomerLastName IS NULL THEN ''    -- Handle NULL LastName
							ELSE ' ' + main.CustomerLastName         -- Add space only if LastName is not NULL
						END +
						CASE
							WHEN main.CustomerCellNumber IS NULL THEN ''  -- Handle NULL CellNumber
							ELSE ' (' + main.CustomerCellNumber + ')'
						END +
						CASE
							WHEN main.CustomerEmailAddress IS NULL THEN '' -- Handle NULL EmailAddress
							ELSE ' (' + main.CustomerEmailAddress + ')'
						END AS CustomerInfo
					  ,M.TotalCount
				  FROM [dbo].[tblHotelReservations] t
				  CROSS APPLY (SELECT count(*) TotalCount from main) M
					JOIN main on t.Id=main.Id
					ORDER BY BookingDateTime DESC
  				OFFSET @OffSet ROWS
  				FETCH NEXT @PageSize ROWS ONLY
		)
	Select * from page_data

END
