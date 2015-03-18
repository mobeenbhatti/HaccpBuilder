using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Data;

/// <summary>
/// Summary description for AutoCompleteData
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class AutoCompleteData : System.Web.Services.WebService
{

    public AutoCompleteData()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetMenuItems(string PrefixText)
    {
        ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();
        DataSet dsMenuItem =   getMenuItem.GetMenuItemNewByName(PrefixText,(int)Session["KitchenId"]);
        int count = 10;
         //string sql = "Select * from Country Where Country_Name like @prefixText";
         //SqlDataAdapter da = new SqlDataAdapter(sql,”Your Connection String Comes Here”));
         //da.SelectCommand.Parameters.Add("@prefixText", SqlDbType.VarChar, 50).Value = prefixText+ "%";
         //DataTable dt = new DataTable();
         //da.Fill(dt);
        DataTable dt = dsMenuItem.Tables[0];
         string[] items = new string[dt.Rows.Count];
         int i = 0;
         foreach (DataRow dr in dt.Rows)
         {
             items.SetValue(dr["Name"].ToString(), i);
          i++;
         }
         return items; 
    }

}

