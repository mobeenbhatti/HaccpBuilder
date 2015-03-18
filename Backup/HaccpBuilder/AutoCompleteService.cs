using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using System.Data;
using System.ServiceModel.Activation;
using System.Web;

// NOTE: If you change the class name "AutoCompleteService" here, you must also update the reference to "AutoCompleteService" in Web.config.
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class AutoCompleteService : IAutoCompleteService
{

    public string[] GetMenuItems(string prefixText)
    {
        ProcessGetMenuItemNew getMenuItem = new ProcessGetMenuItemNew();

        //DataSet dsMenuItem = getMenuItem.GetMenuItemNewByName(prefixText, 1157910962);
        DataSet dsMenuItem = getMenuItem.GetDistinctMenuItemNewByName(prefixText, (int)HttpContext.Current.Session["KitchenId"]);
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
