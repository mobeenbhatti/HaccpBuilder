using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ControlPanel_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = DateTime.Now.ToString();
            BindSectionsData();
        }
    }
    protected void grdDailyReports_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    private void BindSectionsData()
    {
        DataTable sectionsDataTable = new DataTable("Contact");
        sectionsDataTable.Columns.Add("SectionLetter");
        sectionsDataTable.Columns.Add("SectionName");
        sectionsDataTable.Columns.Add("RunName");
        sectionsDataTable.Columns.Add("Paging");
        sectionsDataTable.Columns.Add("ColorPositions");
        sectionsDataTable.Columns.Add("TotalPages");

        DataRow new1DataRow = sectionsDataTable.NewRow();
        new1DataRow["SectionLetter"] = "A";
        new1DataRow["SectionName"] = "Main News";
        new1DataRow["RunName"] = "First Edition";
        new1DataRow["Paging"] = "32";
        new1DataRow["ColorPositions"] = "1, 7, 8, 15, 17 ";
        new1DataRow["TotalPages"] = "5";
        sectionsDataTable.Rows.Add(new1DataRow);

        DataRow new2DataRow = sectionsDataTable.NewRow();
        new2DataRow["SectionLetter"] = "B";
        new2DataRow["SectionName"] = "Weekend";
        new2DataRow["RunName"] = "Early";
        new2DataRow["Paging"] = "10";
        new2DataRow["ColorPositions"] = "1, 5,10 ";
        new2DataRow["TotalPages"] = "3";
        sectionsDataTable.Rows.Add(new2DataRow);

        DataRow new3DataRow = sectionsDataTable.NewRow();
        new3DataRow["SectionLetter"] = "C";
        new3DataRow["SectionName"] = "Bussiness";
        new3DataRow["RunName"] = "First Edition";
        new3DataRow["Paging"] = "14";
        new3DataRow["ColorPositions"] = "1, 8, 9 ";
        new3DataRow["TotalPages"] = "3";
        sectionsDataTable.Rows.Add(new3DataRow);

        DataRow new4DataRow = sectionsDataTable.NewRow();
        new4DataRow["SectionLetter"] = "D";
        new4DataRow["SectionName"] = "Escapes";
        new4DataRow["RunName"] = "Early";
        new4DataRow["Paging"] = "8";
        new4DataRow["ColorPositions"] = "1, 2, 4, 5, 6 ";
        new4DataRow["TotalPages"] = "5";
        sectionsDataTable.Rows.Add(new4DataRow);

        grdDailyreport.DataSource = sectionsDataTable;
        grdDailyreport.DataBind();

    }
}
