<%@ WebService Language="C#" Class="AutoCompleteService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Data;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class AutoCompleteService  : System.Web.Services.WebService {

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod (EnableSession= true)]
    public string[] GetMenuItems(string prefixText)
    {
        ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();

        //DataSet dsMenuItem = getMenuItem.GetMenuItemNewByName(prefixText, 1157910962);
        DataSet dsMenuItem = getMenuItem.GetDistinctMenuItemNewByName(prefixText, (int)Session["KitchenId"]);
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
    [WebMethod(EnableSession = true)]
    public string[] GetIngredients(string prefixText)
    {        
        ProcessGetIngredient getIngredient = new ProcessGetIngredient();
        DataSet dsMenuItem = getIngredient.GetIngredientByName(prefixText, (int)Session["KitchenId"]);
       
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
    [WebMethod(EnableSession = true)]
    public string[] GetVendors(string prefixText)
    {       
        ProcessGetVendor getVendor = new ProcessGetVendor();        
        
        DataSet dsMenuItem = getVendor.GetVendorsByName(prefixText, (int)Session["KitchenId"]);
        int count = 10;
       
        DataTable dt = dsMenuItem.Tables[0];
        string[] items = new string[dt.Rows.Count];
        int i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            items.SetValue(dr["VendorName"].ToString(), i);
            i++;
        }
        return items;
    }
    [WebMethod(EnableSession = true)]
    public string[] GetCustomers(string prefixText)
    {        
        ProcessGetCustomer getCustomer = new ProcessGetCustomer();              
        DataSet dsMenuItem = getCustomer.GetCustomersByName(prefixText, (int)Session["KitchenId"]);
        int count = 10;       
        DataTable dt = dsMenuItem.Tables[0];
        string[] items = new string[dt.Rows.Count];
        int i = 0;
        foreach (DataRow dr in dt.Rows)
        {
            items.SetValue(dr["CompanyName"].ToString(), i);
            i++;
        }
        return items;
    }
    
}

