using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using DataModel;
using Microsoft.Reporting.WebForms;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class HaccpPlanReports : System.Web.UI.Page
    {       
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack != true)
            {
                int ProcessId = 0;
                if (int.TryParse(Request.QueryString["ProcessId"], out ProcessId))
                {
                    var hazard = (from p in context.ProcessHazardAnalysis
                                  where p.ProcessID == ProcessId && p.Active == 1
                                  select p).FirstOrDefault();
                    if (hazard != null)
                    {
                        BindHazardAnalysis(hazard.HazardAnalysisID);
                    }

                    var haccpCategory = (from p in context.ProcessHaccpCategories
                                         where p.ProcessID == ProcessId && p.Active == 1
                                         select p).FirstOrDefault();
                    if (haccpCategory != null)
                    {
                        BindProcessHaccpCategory(haccpCategory.HaccpCategoryID);
                    }
                }
            }

        }
        private void BindHazardAnalysis(int nHazardAnalysisID)
        {          
            List<ProcessHazardAnalysisDetail> details = (from dt in context.ProcessHazardAnalysisDetails
                                                         where dt.HazardAnalysisID == nHazardAnalysisID
                                                         orderby dt.SortOrder
                                                         select dt).ToList();
            foreach (ProcessHazardAnalysisDetail item in details)
            {
                if (item.CategoryID == 1)
                    item.FoodSafetyHazard = "Biological - " + item.FoodSafetyHazard;
                if (item.CategoryID == 2)
                    item.FoodSafetyHazard = "Chemical - " + item.FoodSafetyHazard;
                if (item.CategoryID == 3)
                    item.FoodSafetyHazard = "Physical - " + item.FoodSafetyHazard;

            }
            if (details.Count > 0)
            {
                //grdHazardAnalysis.DataSource = details;
                //grdHazardAnalysis.DataBind();
                rptHazard.Reset();
                ReportDataSource rds = new ReportDataSource("HazardDataSet", details);
                rptHazard.LocalReport.DataSources.Add(rds);
                rptHazard.LocalReport.ReportPath = HttpContext.Current.Server.MapPath("~/RDLC/HazardAnalysisReport.rdlc");
                rptHazard.LocalReport.Refresh();
            }          
        }
        private void BindProcessHaccpCategory(int nHaccpCategoryID)
        {           
            List<ProcessHaccpCategoryDetail> details = (from dt in context.ProcessHaccpCategoryDetails
                                                        where dt.HaccpCategoryID == nHaccpCategoryID
                                                        orderby dt.SortOrder
                                                        select dt).ToList();
            if (details.Count > 0)
            {
                // grdHaccpCategory.DataSource = details;
                // grdHaccpCategory.DataBind();
                rptHaccp.Reset();
                ReportDataSource rds = new ReportDataSource("DataSet4", details);
                rptHaccp.LocalReport.DataSources.Add(rds);
                rptHaccp.LocalReport.ReportPath = HttpContext.Current.Server.MapPath("~/RDLC/HaccpCategory.rdlc");
                rptHaccp.LocalReport.Refresh();

            }          
        }
    }
}