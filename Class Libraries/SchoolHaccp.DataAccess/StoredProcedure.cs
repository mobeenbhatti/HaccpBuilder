
namespace SchoolHaccp.DataAccess
{
	public class StoredProcedure
	{
		public enum Name
		{
            uspAdm_DeleteBreakFast,
            uspAdm_CreateKitchen,
            uspAdm_CreateDistrict,
            uspAdm_CreateMobile,
			uspAdm_CultureDropDownListData,
            uspAdm_DeleteCCPByChildId,
            uspAdm_DeleteCtpatById,
            uspAdm_DeleteColdHoldingLog,
            uspAdm_DeleteDailyMeal,
            uspAdm_DeleteDistrictRough,
            uspAdm_DeleteFoodCategoryByChildId,
            uspAdm_DeleteFreezerLog,
            uspAdm_DeleteFreeTrialRequest,
            uspAdm_DeleteHazards,
            uspAdm_DeleteHotHoldingLog,
            uspAdm_DeleteIngredients,
            uspAdm_DeleteKitchenById,
            uspAdm_DeleteKitchenCCPGroup,
            uspAdm_DeleteKitchenCheckListAddOnGroup,
            uspAdm_DeleteKitchenCheckListGroup,
            uspAdm_DeleteKitchenCtpatGroup,
            uspAdm_DeleteKitchenFoodCategoryGroup,
            uspAdm_DeleteKitchenInventoryCustom,
            uspAdm_DeleteKitchenMenuCustomItem,
            uspAdm_DeleteKitchenMenuItem,
            uspAdm_DeleteKitchenPlan,
            uspAdm_DeleteKitchenPlanCategory,
            uspAdm_DeleteKitchenProcessGroup,
            uspAdm_DeleteKitchenSOPGroup,
            uspAdm_DeleteKitchenValidationGroup,
            uspAdm_DeleteLunch,
            uspAdm_DeleteMealServingCalendar,
            uspAdm_DeleteMealServingCalendarByKitchenId,
            uspAdm_DeleteMenuItemsNew,
            uspAdm_DeleteMenuRecipe,
            uspAdm_DeleteMenuRecipeDetails,
            uspAdm_DeleteMobileById,
            uspAdm_DeletePhLog,
            uspAdm_DeleteProcessByChildId,
            uspAdm_DeleteQuestionById,
            uspAdm_DeleteReceivingLog,
            uspAdm_DeleteRefrigerationLog,
            uspAdm_DeleteSOPById,
            uspAdm_DeleteTemperatureLog,
            uspAdm_DeleteThermoCalibrationLog,
            uspAdm_DeleteValidationQuestionById,
            uspAdm_DeleteVendors,
            uspAdm_GetAllCCP,
            uspAdm_GetAllFoodCategories,
            uspAdm_GetAllFoodCategory,
            uspAdm_GetAllProcess,
			uspAdm_GetAllWebBenefits,
			uspAdm_GetAllWebFeatures,
			uspAdm_GetAllWebNews,
			uspAdm_GetAllWebPageContent,
            //RGK - 01/21/2008
            // Added definition for Safety CheckList
            uspAdm_GetAllQuestions,
            //RGK- 12/24/2008
            // Added definition for Validation Questions
            uspAdm_GetAllValidationQuestions,
            uspAdm_GetAllProceduralQuestions,
            uspAdm_GetCCPGroup,
            uspAdm_GetColdHoldingLog,
            uspAdm_GetContactDetailByUserName,
            uspAdm_GetCheckListGroup,
            // Added on 06-18-13
            uspAdm_GetCtpatByGroupId,
            uspAdm_GetCtpatGroup,
            uspAdm_GetCustomInventoryByKitchenID,
            uspAdm_GetCustomMenuItems,
            uspAdm_GetDailyMeal,
            uspAdm_GetDailyReports,
            uspAdm_GetDistrictByUserName,
            uspAdm_GetDistrictByUserId,
            uspAdm_GetFoodCategoryGroup,
            uspAdm_GetFreezerLog,
            uspAdm_GetFreeTrialRequest,
            uspAdm_GetHazards,
            uspAdm_GetHotHoldingLog,
            uspAdm_GetIngredients,
            uspAdm_GetInventoryItemByKitchenID,
            uspAdm_GetKitchenCCPGroup,
            uspAdm_GetKitchenCheckListAddOnGroup,
            uspAdm_GetKitchenCheckListGroup,
            uspAdm_GetKitchenCtpatGroup,
            uspAdm_GetKitchenDetails,
            uspAdm_GetKitchenByUserName,
            uspAdm_GetKitchenFoodCategoryGroup,
            uspAdm_GetKitchenInventoryCustom,
            uspAdm_GetKitchenMenuItems,
            uspAdm_GetKitchenProcessGroup,
            uspAdm_GetMealServingCalendar,
            uspAdm_GetMenuItemsNew,
            uspAdm_GetMenuRecipe,
            uspAdm_GetMenuRecipeDetails,
            uspAdm_GetMobileByUserName,
            uspAdm_GetKitchenSOPGroup,
            uspAdm_GetKitchenValidationGroup,
            uspAdm_GetMenuItemsByKitchenID,
            uspAdm_GetPhLog,
            uspAdm_GetProceduralSavedAnswers,
            uspAdm_GetProcessGroup,
            uspAdm_GetReceivingLog,
            uspAdm_GetRefrigerationLog,
            uspAdm_GetSavedAnswers,
            uspAdm_GetSOPGroup,
            uspAdm_GetSOPById,
            uspAdm_GetSOPByGroupId,
            uspAdm_GetTemperatureLog,
            uspAdm_GetThermoCalibrationLog,
            uspAdm_GetValidationGroup,
            uspAdm_GetValidationHistory,
            uspAdm_GetValidationSavedAnswers,
            uspAdm_GetVendors,
			uspAdm_GetWebBenefitsByID,
			uspAdm_GetWebFeaturesByID,
			uspAdm_GetWebNewsByID,
			uspAdm_GetWebPageContentByID,
            uspAdm_GetWeeklyReports,
            uspAdm_InsertCCPByGroupId,
            uspAdm_InsertCCPGroup,
            uspAdm_InsertContactAgreement,
            uspAdm_InsertCtpat,
            uspAdm_InsertCtpatGroup,
            uspAdm_InsertBreakFast,
            uspAdm_InsertCheckListGroup,
            uspAdm_InsertColdHoldingLog,
            uspAdm_InsertDailyMeal,
            uspAdm_InsertFoodCategoryByGroupId,
            uspAdm_InsertFoodCategoryGroup,
            uspAdm_InsertFreezerLog,
            uspAdm_InsertFreeTrialRequest,
            uspAdm_InsertHazards,
            uspAdm_InsertHotHoldingLog,
            uspAdm_InsertIngredients,
            uspAdm_InsertKitchen,
            uspAdm_InsertKitchenCCPGroup,
            uspAdm_InsertKitchenCheckListAddOnGroup,
            uspAdm_InsertKitchenCheckListGroup,
            uspAdm_InsertKitchenCtpatGroup,
            uspAdm_InsertKitchenCorrectiveAction,
            uspAdm_InsertKitchenCriticalLimitsByKitchenId,
            uspAdm_InsertKitchenDetails,
            uspAdm_InsertKitchenFoodCategoryGroup,
            uspAdm_InsertKitchenInventoryCustom,
            uspAdm_InsertKitchenMenuCustomItem,
            uspAdm_InsertKitchenPlan,
            uspAdm_InsertKitchenPlanCategory,
            uspAdm_InsertKitchenProcessGroup,
            uspAdm_InsertKitchenSOPGroup,
            uspAdm_InsertKitchenValidationGroup,
            uspAdm_InsertLunch,
            uspAdm_InsertMealServingCalendar,
            uspAdm_InsertMenuItemsNew,
            uspAdm_InsertMenuRecipe,
            uspAdm_InsertMenuRecipeDetails,
            uspAdm_InsertMobile,
            uspAdm_InsertPhLog,
            uspAdm_InsertProceduralResponse,
            uspAdm_InsertProcessByGroupId,
            uspAdm_InsertProcessGroup,
            uspAdm_InsertQuestionByGroupId,
            uspAdm_InsertReceivingLog,
            uspAdm_InsertRefrigerationLog,
            uspAdm_InsertSOP,
            uspAdm_InsertSOPGroup,
            uspAdm_InsertSOPByGroupId,
            uspAdm_InsertTemperatureLog,
            uspAdm_InsertThermoCalibrationLog,
            uspAdm_InsertValidationGroup,
            uspAdm_InsertValidationHistory,
            uspAdm_InsertValidationQuestionByGroupId,
            uspAdm_InsertValidationResponse,
            uspAdm_InsertVendors,
			uspAdm_InsertWebBenefits,
			uspAdm_InsertWebFeatures,
			uspAdm_InsertWebNews,
			uspAdm_InsertWebPageContent,
            uspAdm_InsertFoodSafetyResponses,
            uspAdm_InsertResponseHistory,
            uspAdm_GetResponseHistory,
            uspAdm_UpdateCCP,
            uspAdm_UpdateCtpat,
            uspAdm_UpdateColdHoldingLog,
            uspAdm_UpdateDistrictById,
            uspAdm_UpdateFoodCategory,
            uspAdm_UpdateQuestion,
            uspAdm_UpdateFreezerLog,
            uspAdm_UpdateHazards,
            uspAdm_UpdateHotHoldingLog,
            uspAdm_UpdateIngredients,
            uspAdm_UpdateKitchenCriticalLimitsById,
            uspAdm_UpdateKitchenDetails,
            uspAdm_UpdateKitchenById,
            uspAdm_UpdateKitchenCorrectiveActionById,
            uspAdm_UpdateKitchenInventory,
            uspAdm_UpdateKitchenInventoryCustom,
            uspAdm_UpdateKitchenMenu,
            uspAdm_UpdateKitchenMenuCustomItem,
            uspAdm_UpdateKitchenPlan,
            uspAdm_UpdateKitchenPlanCategory,
            uspAdm_UpdateMealServingCalendar,
            uspAdm_UpdateMenuItemsNew,
            uspAdm_UpdateMenuRecipe,
            uspAdm_UpdateMenuRecipeDetails,
            uspAdm_UpdateMobileById,
            uspAdm_UpdatePhLog,
            uspAdm_UpdateProceduralResponses,
            uspAdm_UpdateRefrigerationLog,
            uspAdm_UpdateReceivingLog,
            uspAdm_UpdateSOP,
            uspAdm_UpdateThermoCalibrationLog,
            uspAdm_UpdateUserId,
            uspAdm_UpdateVendors,
			uspAdm_UpdateWebNews,
			uspAdm_UpdateWebPageContent,
            uspAdm_UpdateFoodSafetyResponses,
            uspAdm_UpdateProcess,
            uspAdm_UpdateReponseHistory,
            uspAdm_UpdateTemperatureLog,
            uspAdm_UpdateValidationQuestion,
            uspAdm_UpdateValidationResponses,
            uspAdm_UpdateValidationHistory,
			uspAdm_UpdateWebBenefits,
			uspAdm_UpdateWebFeatures,
			uspGetWebBenefits,
			uspGetWebFeatures,
			uspGetWebNews,
			uspGetWebPageContent,
            uspAdm_InsertFreezerNewLog,
            uspAdm_UpdateFreezerNewLog,
            uspAdm_DeleteFreezerNewLog,
            uspAdm_GetFreezerNewLog,
            uspAdm_DeleteCustomers,
            uspAdm_InsertCustomers,
            uspAdm_GetCustomers,
            uspAdm_UpdateCustomers,
            uspAdm_DeleteShippingLog,
            uspAdm_GetShippingLog,
            uspAdm_InsertShippingLog,
            uspAdm_UpdateShippingLog
		}
	}
}
