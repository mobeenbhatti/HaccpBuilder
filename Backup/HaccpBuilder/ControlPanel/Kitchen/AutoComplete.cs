using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Web.Script.Services;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

using SchoolHaccp.BusinessLogic;

/// <summary>
/// Summary description for AutoComplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class AutoComplete : System.Web.Services.WebService
{

    public AutoComplete()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    [ScriptMethod]
    public string[] GetCompletionList(string prefixText, int count)
    {
        count = 10;
        List<string> items = new List<string>(count);
        DataSet ds2 = new DataSet();
        string connectionString = "Data Source=NX-AREHMAN\\SQLEXPRESS;Initial Catalog=HACCPBuilder;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string sql2 = "SELECT DISTINCT Name FROM Ingredients WHERE Name LIKE '" + prefixText + "%'";
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(sql2, connection);
            adapter.Fill(ds2);
        }

        foreach (DataRow dr in ds2.Tables[0].Rows)
        {
            items.Add(dr["Name"].ToString());
        }
        return items.ToArray();
        //ProcessGetMenuItemNew getMenuItems = new ProcessGetMenuItemNew();
        //return new string[10];
        // return getMenuItems.GetMenuItemNewByName(prefixText, (int)Session["KitchenId"]);
    }

}

