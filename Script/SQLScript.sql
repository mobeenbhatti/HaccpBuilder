

/****** Object:  StoredProcedure [dbo].[uspAdm_GetKitchenByKitchenId]    Script Date: 04/24/2015 10:45:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspAdm_GetKitchenByKitchenId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspAdm_GetKitchenByKitchenId]
GO

USE [HACCPBuilder]
GO

/****** Object:  StoredProcedure [dbo].[uspAdm_GetKitchenByKitchenId]    Script Date: 04/24/2015 10:45:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[uspAdm_GetKitchenByKitchenId]  
 @vchKitchenId int 

AS  

BEGIN      SET NOCOUNT ON;   
SELECT [Kitchen].[KitchenId] AS KitchenId  
      ,[DistrictId]  
      ,[AccountNumber]  
      ,[Kitchen].[Name] AS KitchenName  
      ,[Kitchen].[CreatedDate]  
      ,[Kitchen].[ModifiedDate]  
      ,[TemperatureLog]  
      ,[HotHoldingLog]  
      ,[ColdHoldingLog]  
      ,[ReceivingLog]  
      ,[FreezerLog]  
      ,[FreezerNewLog]  
      ,[RefrigerationLog]  
      ,[FoodSafetyChecklist]  
      ,[Thermometer]  
   ,Address.[AddressId]  
      ,Address.[Name]  
      ,[AddressLine1]  
      ,[AddressLine2]  
      ,[City]  
      ,[County]  
      ,Address.[StateProvinceId]  
      ,[PostalCode]  
      ,[IsDefault]  
  ,Contact.[ContactId]  
      ,Contact.[Name] AS Manager  
   ,[UserId]  
      ,[Password]  
      ,[EmailAddress]  
      ,[EmailAlerts]  
      ,[PrimaryPhone]  
      ,[SecondaryPhone]  
      ,[Fax]  
   ,[Kitchen].[TypeId]  
   ,Kitchen.[Active]  
  FROM [HACCPBuilder].[dbo].[Kitchen]  
INNER JOIN KitchenContact ON KitchenContact.KitchenId = Kitchen.KitchenId  
INNER JOIN Contact ON Contact.ContactId = KitchenContact.ContactId  
INNER JOIN KitchenAddress ON KitchenAddress.KitchenId = Kitchen.KitchenId  
INNER JOIN Address ON Address.AddressId = KitchenAddress.AddressId INNER JOIN ContactRole ON Contact.ContactId = ContactRole.ContactId INNER JOIN Roles ON ContactRole.RoleId = Roles.RoleId 
WHERE [Kitchen].[KitchenId] = @vchKitchenId  
ORDER BY KitchenName    
  
END  
--------------------  
  
GO


/****** Object:  StoredProcedure [dbo].[uspAdm_UpdateDistrictById]    Script Date: 04/29/2015 12:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[uspAdm_UpdateDistrictById]
	-- Add the parameters for the stored procedure here
	-------------------------
	-- District Table Parameters
	--------------------------	
	@vchName VARCHAR(100)
	,@nDistrictPrinting INT
    ,@chDistrictType CHAR(50)
    ,@nNumberOfKitchens INT
	,@nActive INT
	---------------------------
	-- ADDRES Table Parameters
	---------------------------
	,@chCity CHAR(50)
    ,@chState VARCHAR(50)
    ,@nZipCode VARCHAR(15)
	--------------------------
	-- Contact TABLE PARAMETERS
	--------------------------	
	,@vchEmail VARCHAR(100)
    ,@vchManagerName VARCHAR(200)
    ,@vchPassword VARCHAR(150)
    ,@vchUserId VARCHAR(50)
	--------------------------
	,@nDistrictId INT		
	,@nAddressId INT
	,@nContactId INT
	--------------------------
	,@nReports INT
	,@nTypeId INT
	,@vchTimeZone nvarchar(255)
	,@chCountry nvarchar(100)
	,@PasswordSalt nvarchar(128)
    ,@IsUpdated bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @nStateProvinceId INT;
	DECLARE @ModifiedDate DATETIME;
	SET @ModifiedDate = GETDATE();
   ---------------------------------
	-- UPDATE District TABLE
	--------------------------------
	EXEC [dbo].[uspAdm_UpdateDistrict] @nDistrictId 
		,@vchName 
		,@nDistrictPrinting 
		,@chDistrictType 
		,@nNumberOfKitchens   
		,@nActive      
        ,@ModifiedDate
		,@nReports
		,@nTypeId   

	---------------------------------
	-- UPDATE CONTACT TABLE
	---------------------------------
	EXEC [dbo].[uspAdm_UpdateContact]  @nContactId, 
        @vchManagerName,
        @vchEmail,
        0,
        null,
        null,
        null,
		@vchUserId,
		@vchPassword,
		1,
		NULL
		,@PasswordSalt
    ,@IsUpdated
--	UPDATE [dbo].[Contact] SET
--        [UserId] = @vchUserId, 
--        [Password] = @vchPassword        
--    WHERE [ContactId] = @nContactId
    --------------------------------------------
	-- GET STATE PROVINCE ID
	--------------------------------------------
	--SELECT @nStateProvinceId = StateProvinceId FROM StateProvince WHERE Name = @chState
	IF @chCountry != 'US' AND @chCountry != 'CA'		
		BEGIN		
		--PRINT @chState;
		Select @nStateProvinceId = StateProvinceId FROM StateProvince WHERE Name = LTRIM(RTRIM(@chState))
		--PRINT @nStateProvinceId;
		IF @nStateProvinceId IS NULL
		BEGIN
			Select @nStateProvinceId = MAX(StateProvinceId) from StateProvince 
			Set @nStateProvinceId = @nStateProvinceId + 1;
			INSERT INTO [StateProvince]
           ([StateProvinceId]
           ,[Name]          
           ,[CountryRegionCode]
           ,[StateProvinceCode] 
           ,[IsOnlyStateProvinceFlag])
		VALUES
           (@nStateProvinceId
           ,@chState         
           ,@chCountry
           ,@chState
           ,'false');
           Select @nStateProvinceId = MAX(StateProvinceId) from StateProvince;
		END	
		
		END
	ELSE
	BEGIN
		SET @nStateProvinceId = @chState;
	END
	---------------------------------
	-- UPDATE ADDRESS TABLE
	---------------------------------
	EXEC [dbo].[uspAdm_UpdateAddress] @nAddressId, 
        @chState , 
        null , 
       null , 
        @chCity , 
        NULL , 
		@nStateProvinceId,
        @nZipCode, 
        1,
        @vchTimeZone,
        @chCountry
        
END

GO

USE [HACCPBuilder]
GO
/****** Object:  StoredProcedure [dbo].[uspAdm_CreateDistrict]    Script Date: 04/29/2015 12:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[uspAdm_CreateDistrict]
	-- Add the parameters for the stored procedure here
	------------------------
	-- District Table Parameters
	------------------------
	@vchName VARCHAR(100)
	,@nDistrictPrinting INT
    ,@chDistrictType CHAR(50)
    ,@nNumberOfKitchens INT
	,@nActive INT
	------------------------
	-- Address Table Parameters
	------------------------
    ,@chCity CHAR(50)
    ,@chState VARCHAR(50)
    ,@nZipCode VARCHAR(15)
	------------------------
	-- Contact Table Parameters
	------------------------
    ,@vchEmail VARCHAR(100)
    ,@vchManagerName VARCHAR(200)
    ,@vchPassword VARCHAR(150)
    ,@vchUserId VARCHAR(50)
	-------------------------	
	-- NEW FIELDS
	-------------------------
	,@nReports INT
	,@nTypeId INT
	,@vchTimeZone nvarchar(255)
	,@chCountry nvarchar(100)
	
 ,@PasswordSalt nvarchar(128)
    ,@IsUpdated bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @nDistrictId INT,@nContactId INT,@nAddressId INT,@nRoleId INT,@nStateProvinceId INT,@nKitchenGroupId INT,@nChecklistGroupId INT;
	DECLARE @chAddressName CHAR(100);
	DECLARE  @CreatedDate DATETIME, @ModifiedDate DATETIME;
	SET	@ModifiedDate = GETDATE();
	SET @CreatedDate = GETDATE();

	BEGIN TRANSACTION
			BEGIN TRY 	
	-------------------------------------
	-- INSERT INTO DISTRICT TABLE
	------------------------------------
	
    EXEC uspAdm_InsertDistrict  @vchName 
		,@nDistrictPrinting 
		,@chDistrictType 
		,@nNumberOfKitchens 
		,@nActive
		,@CreatedDate 
        ,@ModifiedDate 
		,@nReports
		,@nTypeId
	
	-------------------------------------------
	-- GET District ID
	-------------------------------------------
	SELECT @nDistrictId = MAX(DistrictID) FROM District

	------------------------------------------
	-- INSERT CONTACT
	------------------------------------------

	EXEC uspAdm_InsertContact @vchManagerName , 
        @vchEmail , 
		@vchPassword,
       0, 
        null , 
        null , 
        null,
		@vchUserId,
		null
		,@PasswordSalt
		,@IsUpdated 
			
		
	
	-------------------------------------------
	-- GET CONTACT ID
	-------------------------------------------
	SELECT @nContactId = MAX(ContactId) FROM Contact

	--------------------------------------------
	-- GET STATE PROVINCE ID
	--------------------------------------------
	--SELECT @nStateProvinceId = StateProvinceId FROM StateProvince WHERE Name = @chState
	IF @chCountry != 'US' AND @chCountry != 'CA'		
		BEGIN		
		--PRINT @chState;
		Select @nStateProvinceId = StateProvinceId FROM StateProvince WHERE Name = LTRIM(RTRIM(@chState))
		--PRINT @nStateProvinceId;
		IF @nStateProvinceId IS NULL
		BEGIN
			Select @nStateProvinceId = MAX(StateProvinceId) from StateProvince 
			Set @nStateProvinceId = @nStateProvinceId + 1;
			INSERT INTO [StateProvince]
           ([StateProvinceId]
           ,[Name]          
           ,[CountryRegionCode]
           ,[StateProvinceCode] 
           ,[IsOnlyStateProvinceFlag])
		VALUES
           (@nStateProvinceId
           ,@chState         
           ,@chCountry
           ,@chState
           ,'false');
           Select @nStateProvinceId = MAX(StateProvinceId) from StateProvince;
		END	
		
		END
	ELSE
	BEGIN
		SET @nStateProvinceId = @chState;
	END

	--------------------------------------------
	-- INSERT ADDRESS
	--------------------------------------------
	
	EXEC uspAdm_InsertAddress @chState , 
        null , 
       null , 
        @chCity , 
        NULL , 
		@nStateProvinceId,
        @nZipCode, 
        1,
        @vchTimeZone,
        @chCountry
	---------------------------------------------

	---------------------------------------------
	-- GET ADDRESS ID
	---------------------------------------------
	SELECT @nAddressId = MAX(AddressId) FROM Address

--	----------------------------------------------
--	-- INSERT INVENTORY ITEMS
--	----------------------------------------------
--	EXEC uspAdm_InsertDistrictInventory @nDistrictId
--
--	----------------------------------------------
--	-- INSERT INVENTORY TYPES
--	----------------------------------------------
--	EXEC uspAdm_InsertCustomInventoryTypes @nDistrictId

	----------------------------------------------
	-- UPDATE District ADDRESS TABLE
	----------------------------------------------
	
	
	INSERT INTO [dbo].[DistrictAddress] 
    (
        [DistrictId], 
        [AddressId] 
        
    )
    VALUES
    (
        @nDistrictId, 
        @nAddressId 
        
    )
	
	---------------------------------------------
	-- UPDATE District CONTACT TABLE
	---------------------------------------------
	

	 INSERT INTO [dbo].[DistrictContact] 
    (
        [DistrictId], 
        [ContactId] 
        
    )
    VALUES
    (
        @nDistrictId, 
        @nContactId         
    )
	
			
			
	----------------------------------------------
	-- UPDATE CONTACT ROLES TABLE
	----------------------------------------------
	
       SELECT @nRoleId = RoleId FROM Roles WHERE RoleName = 'DistrictAdmin'
	 INSERT INTO [dbo].[ContactRole] 
    (
        [RoleId], 
        [ContactId] 
        
    )
    VALUES
    (
        @nRoleId, 
        @nContactId         
    )
	
	----------------------------------------------
	-- INSERT DistrictGROUPS DistrictS FOR SOP
	----------------------------------------------
	EXEC uspAdm_InsertSOPGroup @nDistrictId,'USDA DEFAULT SOP'

--	----------------------------------------------
--	-- GET DEFAULT District GROUP ID FOR SOP
--	----------------------------------------------
--	
--	SELECT @nKitchenGroupId = KitchenGroupId FROM KitchenGroups WHERE DistrictId = @nDistrictId AND GroupName = 'Global SOP'
--	----------------------------------------------
--	-- INSERT INTO SOP TABLE WITH DEFAULT GROUPID FOR NEW DISTRICT
--	----------------------------------------------
--	EXEC uspAdm_InsertSOPsByGroupId @nKitchenGroupId

	----------------------------------------------
	-- INSERT NEW District IN CHECKLIST GROUP
	----------------------------------------------
	EXEC uspAdm_InsertCheckListGroup @nDistrictId,'USDA DEFAULT QUESTIONS'
	----------------------------------------------
	-- INSERT NEW District IN VALIDATION GROUP
	----------------------------------------------
	EXEC uspAdm_InsertValidationGroup @nDistrictId,'USDA DEFAULT QUESTIONS'
	----------------------------------------------
	-- INSERT NEW District IN CCP GROUP
	----------------------------------------------
	EXEC uspAdm_InsertCCPGroup @nDistrictId,'USDA DEFAULT CCP'
	----------------------------------------------
	-- INSERT NEW District IN Food Category GROUP
	----------------------------------------------
	EXEC uspAdm_InsertFoodCategoryGroup @nDistrictId,'USDA DEFAULT FOOD CATEGORY'
	----------------------------------------------
	-- INSERT NEW District IN Process GROUP
	----------------------------------------------
	EXEC uspAdm_InsertProcessGroup @nDistrictId,'USDA DEFAULT PROCESS'
	----------------------------------------------
	-- INSERT CT-PAT GROUP
	----------------------------------------------
	EXEC uspAdm_InsertCtpatGroup @nDistrictId,'DEFAULT C-TPAT'
	----------------------------------------------
	-- INSERT DEFAULT CHECKLIST ADD-ON GROUP AND SECTIONS
	----------------------------------------------
	IF @nTypeId = 5 OR @nTypeId = 4
	BEGIN
	EXEC [uspAdm_InsertCheckListAddOnGroup] @nDistrictId,'C-TPAT'
	END
--	----------------------------------------------
--	-- GET DEFAULT GROUP ID FOR CHECKLIST
--	----------------------------------------------
--	SELECT @nChecklistGroupId = CheckListGroupId FROM CheckListGroup WHERE DistrictId = @nDistrictId AND GroupName = 'USDA Default'
--	----------------------------------------------
--	-- INSERT INTO Questions TABLE WITH DEFAULT GROUPID FOR NEW DISTRICT
--	----------------------------------------------
--	EXEC [dbo].[uspAdm_InsertQuestionsByGroupId] @nChecklistGroupId
	
	END TRY			
			BEGIN CATCH
					GOTO ReturnWithError;
			END CATCH;		
	COMMIT TRANSACTION;
	RETURN;

	ReturnWithError:
    -- Rollback any active or uncommittable transactions before
    -- inserting information in the ErrorLog
    IF @@TRANCOUNT > 0
    BEGIN
        ROLLBACK TRANSACTION;
    END

    EXECUTE [dbo].[uspLogError];
	DECLARE @error NVARCHAR(4000);
	SET @error = ERROR_MESSAGE();
	RAISERROR (@error, 16, 1);
	RETURN;
         
END

GO


