using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class CriticalLimit
    {
      private int  m_CriticalLimitID;
     private int m_KitchenID;
      private int m_LogTypeID;
      private float m_SCLTempHigh;
     private float m_SCLTempLow;
     private float m_CCLTempHigh;
     private float m_CCLTempLow;
     private float m_QCLTempHigh;
     private float m_QCLTempLow;
     private float m_SCLTempHigh1;
     private float m_SCLTempLow1;
     private float m_CCLTempHigh1;
     private float m_CCLTempLow1;
     private float m_QCLTempHigh1;
     private float m_QCLTempLow1;
     private float m_SCLTempHigh2;
     private float m_SCLTempLow2;
     private float m_CCLTempHigh2;
     private float m_CCLTempLow2;
     private float m_QCLTempHigh2;
     private float m_QCLTempLow2;

     private int m_SCLTime1;
     private int m_SCLTime2;
     private int m_CCLTime1;
     private int m_CCLTime2;
     private int m_QCLTime1;
     private int m_QCLTime2;
     private DateTime m_EntryDate;
     private DateTime m_ModifiedDate;

     public int CriticalLimitID
     {
         get { return m_CriticalLimitID; }
         set { m_CriticalLimitID = value; }
     }

     public int KitchenId
     {
         get { return m_KitchenID; }
         set { m_KitchenID = value; }
     }
     public int LogTypeID
     {
         get { return m_LogTypeID; }
         set { m_LogTypeID = value; }
     }
     public float SCLTempHigh
     {
         get { return m_SCLTempHigh; }
         set { m_SCLTempHigh = value; }
     }
     public float SCLTempLow
     {
         get { return m_SCLTempLow; }
         set { m_SCLTempLow = value; }
     }
     public float CCLTempHigh
     {
         get { return m_CCLTempHigh; }
         set { m_CCLTempHigh = value; }
     }
     public float CCLTempLow
     {
         get { return m_CCLTempLow; }
         set { m_CCLTempLow = value; }
     }
     public float QCLTempHigh
     {
         get { return m_QCLTempHigh; }
         set { m_QCLTempHigh = value; }
     }
     public float QCLTempLow
     {
         get { return m_QCLTempLow; }
         set { m_QCLTempLow = value; }
     }
     public float SCLTempHigh1
     {
         get { return m_SCLTempHigh1; }
         set { m_SCLTempHigh1 = value; }
     }
     public float SCLTempLow1
     {
         get { return m_SCLTempLow1; }
         set { m_SCLTempLow1 = value; }
     }
     public float CCLTempHigh1
     {
         get { return m_CCLTempHigh1; }
         set { m_CCLTempHigh1 = value; }
     }
     public float CCLTempLow1
     {
         get { return m_CCLTempLow1; }
         set { m_CCLTempLow1 = value; }
     }
     public float QCLTempHigh1
     {
         get { return m_QCLTempHigh1; }
         set { m_QCLTempHigh1 = value; }
     }
     public float QCLTempLow1
     {
         get { return m_QCLTempLow1; }
         set { m_QCLTempLow1 = value; }
     }
     public float SCLTempHigh2
     {
         get { return m_SCLTempHigh2; }
         set { m_SCLTempHigh2 = value; }
     }
     public float SCLTempLow2
     {
         get { return m_SCLTempLow2; }
         set { m_SCLTempLow2 = value; }
     }
     public float CCLTempHigh2
     {
         get { return m_CCLTempHigh2; }
         set { m_CCLTempHigh2 = value; }
     }
     public float CCLTempLow2
     {
         get { return m_CCLTempLow2; }
         set { m_CCLTempLow2 = value; }
     }
     public float QCLTempHigh2
     {
         get { return m_QCLTempHigh2; }
         set { m_QCLTempHigh2 = value; }
     }
     public float QCLTempLow2
     {
         get { return m_QCLTempLow2; }
         set { m_QCLTempLow2 = value; }
     }
     public int SCLTime1
     {
         get { return m_SCLTime1; }
         set { m_SCLTime1 = value; }
     }
     public int SCLTime2
     {
         get { return m_SCLTime2; }
         set { m_SCLTime2 = value; }
     }
     public int CCLTime1
     {
         get { return m_CCLTime1; }
         set { m_CCLTime1 = value; }
     }
     public int CCLTime2
     {
         get { return m_CCLTime2; }
         set { m_CCLTime2 = value; }
     }
     public int QCLTime1
     {
         get { return m_QCLTime1; }
         set { m_QCLTime1 = value; }
     }
     public int QCLTime2
     {
         get { return m_QCLTime2; }
         set { m_QCLTime2 = value; }
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
     public enum DataValue
     {
         NOVALUE = 999

     }
    }
}
