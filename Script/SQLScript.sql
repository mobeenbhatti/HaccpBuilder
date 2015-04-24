

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

