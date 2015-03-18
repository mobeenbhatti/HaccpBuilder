using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataModel;

namespace HaccpBuilder.ControlPanel.District
{    
    public partial class ProcessHazardAnalysisNew : System.Web.UI.Page
    {
        private Entities context = new Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ProcessHazardAnalysisHeader> header = (from hd in context.ProcessHazardAnalysisHeaders
                                                        where hd.HazardAnalysisID == 3
                                                        select hd).ToList();
            dtProcessHeader.DataSource = header;
            dtProcessHeader.DataBind();
        }
    }
}