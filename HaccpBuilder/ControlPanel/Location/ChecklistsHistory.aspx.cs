using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;

namespace HaccpBuilder.ControlPanel.Location
{
    public partial class ChecklistsHistory : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var Checklisthistory = (from hs in context.ChecklistHistories
                                    join sc in context.ChecklistSections
                                    on hs.ChecklistSectionId equals sc.CheckListSectionId
                                    where hs.AccountId == MobileId && hs.ChecklistSectionId == SectionId
                                    select new { hs.ChecklistHistoryId, hs.Observer, hs.AccountType, sc.Name,hs.EntryDate,hs.ChecklistSectionId }).ToList();
            if (Checklisthistory != null)
            {
                grdCheckList.DataSource = Checklisthistory;
                grdCheckList.DataBind();
            }

        }
        int MobileId
        {
            get
            {                
                if (Session["MobileId"] != null)
                    return (int)Session["MobileId"];
                else
                    return 1;
            }
        }
        int SectionId
        {
            get
            {
                if (Request.QueryString["SectionId"] != null)
                    return int.Parse(Request.QueryString["SectionId"]);
                else
                    return 1;
            }
        }
    }
}