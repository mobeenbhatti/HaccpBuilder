using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
  public  class KitchenCorrectiveAction
    {
      private int   m_CorrectiveActionID;
      private string m_Name;
      private int m_LogTypeID;
      private int m_Status;
      private int m_KitchenId;
      private int m_IsInclude;
      private DateTime m_EntryDate;
      private DateTime m_ModifiedDate;

      public int CorrectiveActionID
      {
          get { return m_CorrectiveActionID; }
          set { m_CorrectiveActionID = value; }
      }
      public string Name
      {
          get { return m_Name; }
          set { m_Name = value; }
      }
      public int Status
      {
          get { return m_Status; }
          set { m_Status = value; }
      }

      public int KitchenId
      {
          get { return m_KitchenId; }
          set { m_KitchenId = value; }
      }
      public int LogTypeID
      {
          get { return m_LogTypeID; }
          set { m_LogTypeID = value; }
      }
      public int IsInclude
      {
          get { return m_IsInclude; }
          set { m_IsInclude = value; }
      }
      public DateTime EntryDate
      {
          get { return m_EntryDate; }
          set { m_EntryDate = value; }
      }
      public DateTime ModifiedDate
      {
          get { return m_ModifiedDate; }
          set { m_ModifiedDate = value; }
      }
    }
}
