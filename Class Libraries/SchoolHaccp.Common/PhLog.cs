using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
  public class PhLog
    {
        private int phLogId;
      private DateTime entryDate;     
      private string batchNumber;
      private string volume;
      private string phLevel;
      private DateTime phLevelTime;
      private int correctiveActionPhLevel;
      private string waterTemp;
      private DateTime waterTempTime;
      private int correctiveActionWaterTemp;
      private string contactMinutes;
      private DateTime contactTime;
      private int correctiveActionContact;
      private int userId;
      private string verifiedBy;
      private DateTime verifiedDate;
      private int kitchenId;
      private DateTime serviceDate;
      private string correctiveAction;
      private int itemCategory;
      private int itemId;
      private string username;
      private int m_MobileId;

      public int PhLogId { get { return phLogId; } set { phLogId = value; } }
      public DateTime EntryDate { get { return entryDate; } set { entryDate = value; } }
      public int ItemCategory { get { return itemCategory; } set { itemCategory = value; } }
      public int ItemId { get { return itemId; } set { itemId = value; } }     
      public string BatchNumber { get { return batchNumber; } set { batchNumber = value; } }
      public string Volume { get { return volume; } set { volume = value; } }
      public string PhLevel { get { return phLevel; } set { phLevel = value; } }
      public DateTime PhLevelTime { get { return phLevelTime; } set { phLevelTime = value; } }
      public int CorrectiveActionPhLevel { get { return correctiveActionPhLevel; } set { correctiveActionPhLevel = value; } }
      public string WaterTemp { get { return waterTemp; } set { waterTemp = value; } }
      public DateTime WaterTempTime { get { return waterTempTime; } set { waterTempTime = value; } }
      public int CorrectiveActionWaterTemp { get { return correctiveActionWaterTemp; } set { correctiveActionWaterTemp = value; } }
      public string ContactMinutes { get { return contactMinutes; } set { contactMinutes = value; } }
      public DateTime ContactTime { get { return contactTime; } set { contactTime = value; } }
      public int CorrectiveActionContact { get { return correctiveActionContact; } set { correctiveActionContact = value; } }
      public int UserId { get { return userId; } set { userId = value; } }
      public string VerifiedBy { get { return verifiedBy; } set { verifiedBy = value; } }
      public DateTime VerifiedDate { get { return verifiedDate; } set { verifiedDate = value; } }
      public int KitchenId { get { return kitchenId; } set { kitchenId = value; } }
      public DateTime ServiceDate { get { return serviceDate; } set { serviceDate = value; } }
      public string CorrectiveAction { get { return correctiveAction; } set { correctiveAction = value; } }
      public string UserName { get { return username; } set { username = value; } }
      public int MobileId { get{ return m_MobileId;} set { m_MobileId = value; } }
    }
}
