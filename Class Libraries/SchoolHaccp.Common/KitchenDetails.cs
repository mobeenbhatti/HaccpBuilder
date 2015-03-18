using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
   public class KitchenDetails
    {
        private int m_KitchenDetailId;
      private int m_AMServe ;
	private int	m_PMServe ;
	private int	m_Managers ;
	private int	m_Staff ;
	private string	m_CycleMeasuredBy; 
	private int	m_UnitsInCycle ;
	private int	m_IsCycleRepeat ;
	private DateTime	m_StartDate ;
	private DateTime	m_EndDate ;
	private int	m_KitchenId ;

    public int KitchenDetailId
        {
            get { return m_KitchenDetailId; }
            set { m_KitchenDetailId = value; }
        }
    public int AMServe
        {
            get { return m_AMServe; }
            set { m_AMServe = value; }
        }
    public int PMServe
    {
        get { return m_PMServe; }
        set { m_PMServe = value; }
    }
    public int Managers
    {
        get { return m_Managers; }
        set { m_Managers = value; }
    }
    public int Staff
    {
        get { return m_Staff; }
        set { m_Staff = value; }
    }
    public int UnitsInCycle
    {
        get { return m_UnitsInCycle; }
        set { m_UnitsInCycle = value; }
    }
    public int IsCycleRepeat
    {
        get { return m_IsCycleRepeat; }
        set { m_IsCycleRepeat = value; }
    }
    public int KitchenId
    {
        get { return m_KitchenId; }
        set { m_KitchenId = value; }
    }
    public string CycleMeasuredBy
        {
            get { return m_CycleMeasuredBy; }
            set { m_CycleMeasuredBy = value; }
        }
    public DateTime StartDate
        {
            get { return m_StartDate; }
            set { m_StartDate = value; }
        }    
    
   public DateTime EndDate
        {
            get { return m_EndDate; }
            set { m_EndDate = value; }
        }
    }
}
