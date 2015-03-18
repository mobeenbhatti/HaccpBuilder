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

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_SetupMenuItemHaccp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToShortDateString();     
   
        // Load the grid for the current kitchen and First FoodGroup           
        if (!IsPostBack)
        {
            if (Session["KitchenId"] != null)
            {
                GetData();
            }
            Session["FoodGroup"] = 1;
        }
        
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }   
    protected void grdKitchenMenu_DataBound(object sender, EventArgs e)
    {
       
    }      
    private void GetData()
   {
       // Get Menu Items for the specific page

       int nKitchenId,nFoodGroup;
       DataSet dsMenuItems;

       nKitchenId = (int)Session["KitchenId"];
       if (Request.QueryString["foodgroup"] != null)
       {
           nFoodGroup = int.Parse(Request.QueryString["foodgroup"].ToString());
       }
       else
       {
           nFoodGroup = 1;
       }

       ProcessGetKitchenMenuItems kitchenMenu = new ProcessGetKitchenMenuItems();
       dsMenuItems = kitchenMenu.GetMenuItemsDataSet(nKitchenId, nFoodGroup);
       if (dsMenuItems.Tables[0].Rows[0] != null)
       {
           DataRow drFoodGroup = dsMenuItems.Tables[0].Rows[0];
           lblFoodGroup.Text = drFoodGroup["FoodGroup"].ToString();

           //if (Request.QueryString["foodgroup"] != null)
           //{
           //    if (int.Parse(Request.QueryString["foodgroup"].ToString()) > 9)
           //    {
           //        grdKitchenMenu.Columns.RemoveAt(2);
           //        grdKitchenMenu.Columns.RemoveAt(3);
           //        grdKitchenMenu.Columns.RemoveAt(3);
           //    }
           //}
           grdKitchenMenu.DataSource = dsMenuItems;
           grdKitchenMenu.DataBind();
          
       }
   }    
    protected void cmdBack_Click(object sender, EventArgs e)
   {
       ChangePage("Back");       
       
   }
    private void ChangePage(string strDirection)
   {
       if (Request.QueryString["MenuManager"] == null)
       {
           switch (strDirection)
           {
               case "Forward":
                   if (Request.QueryString["foodgroup"] == null)
                   {
                       Session["FoodGroup"] = 2;
                       Response.Redirect("~/ControlPanel/Kitchen/SetupMenuItemHaccp.aspx?foodgroup=" + (int)Session["FoodGroup"]);
                   }
                   else
                   {
                       if (int.Parse(Request.QueryString["foodgroup"].ToString()) < 17)
                       {
                           Session["FoodGroup"] = int.Parse(Request.QueryString["foodgroup"].ToString()) + 1;
                           Response.Redirect("~/ControlPanel/Kitchen/SetupMenuItemHaccp.aspx?foodgroup=" + (int)Session["FoodGroup"]);
                       }
                       else
                       {
                           Response.Redirect("~/ControlPanel/Kitchen/MenuItemsReview.aspx");
                       }
                   }
                   break;
               case "Back":
                   if (Request.QueryString["foodgroup"] == null)
                   {
                       Response.Redirect("~/ControlPanel/Kitchen/InventoryReview.aspx");
                   }
                   else
                   {
                       if (int.Parse(Request.QueryString["foodgroup"].ToString()) > 1)
                       {
                           Session["FoodGroup"] = int.Parse(Request.QueryString["foodgroup"].ToString()) - 1;
                           Response.Redirect("~/ControlPanel/Kitchen/SetupMenuItemHaccp.aspx?foodgroup=" + (int)Session["FoodGroup"]);
                       }
                       else
                       {
                           Response.Redirect("~/ControlPanel/Kitchen/InventoryReview.aspx");
                       }
                   }
                   break;
           }
       }
       else
       {
           Response.Redirect("~/ControlPanel/Kitchen/MenuItemManager.aspx");
       }

   }
    private void SaveMenuItems()
   {
       int i, totalItems,nFoodGroup;
       totalItems = grdKitchenMenu.Rows.Count;
       for (i = 0; i < totalItems; i++)
       {
           RadioButton rdbVendorSupplied = (RadioButton)grdKitchenMenu.Rows[i].FindControl("rdbVendorSupplied");
           RadioButton rdbOnSite = (RadioButton)grdKitchenMenu.Rows[i].FindControl("rdbOnSite");
           CheckBox chkSelectMenuItem = (CheckBox)grdKitchenMenu.Rows[i].FindControl("chkSelect");
           if (chkSelectMenuItem != null || rdbVendorSupplied != null || rdbOnSite != null)
           {
               //////////////////////////////
               ///Save Menu Item/////////////
               /// RGK - 12-26-08
               /// ADD CHECK FOR ITEMS NOT HAVING PROCESS TYPE
               if (Session["FoodGroup"] != null)
               {
                   nFoodGroup = (int)Session["FoodGroup"];
               }
               else
               {
                   nFoodGroup = 0;
               }
                   
               KitchenMenuItem menuItem = new KitchenMenuItem();
               menuItem.MenuItemId = (int)grdKitchenMenu.DataKeys[grdKitchenMenu.Rows[i].RowIndex].Value;
               if (chkSelectMenuItem.Checked == true)
               {
                   menuItem.Selected = 1;
               }
               else
               {
                   menuItem.Selected = 0;
               }
               //if (nFoodGroup > 9)
               //{
               //    menuItem.PreparationType = 3;
               //}
               //else
               //{

                   if (rdbVendorSupplied.Checked == true)
                   {
                       menuItem.PreparationType = 1;
                   }                  
                   if (rdbOnSite.Checked == true)
                   {
                       menuItem.PreparationType = 2;
                   }
               //}
               menuItem.KitchenId = (int)Session["KitchenId"];              

               ProcessSetKitchenMenu setKitchenMenu = new ProcessSetKitchenMenu();
               setKitchenMenu.KitchenMenu = menuItem;
               setKitchenMenu.Invoke();

           }
       }

       }
    protected void btnAddItem_Click(object sender, ImageClickEventArgs e)
        {
      // Response.Redirect("~/ControlPanel/Kitchen/CustomMenuItems.aspx?FoodGroup=" + (int)Session["FoodGroup"]);
       Response.Redirect("~/ControlPanel/Kitchen/CustomMenuItems.aspx?foodgroup=" + (int)Session["FoodGroup"]);
        }

    protected void grdKitchenMenu_RowDataBound(object sender, GridViewRowEventArgs e)
   {
       if (Request.QueryString["foodgroup"] != null)
       {
           if (int.Parse(Request.QueryString["foodgroup"].ToString()) > 9)
           {
               e.Row.Cells[2].Visible = false;
               e.Row.Cells[4].Visible = false;
               e.Row.Cells[5].Visible = false;
           }
           else
           {
               e.Row.Cells[2].Visible = true;
               e.Row.Cells[4].Visible = true;
               e.Row.Cells[5].Visible = true;
           }
       }
   }
    protected void cmdContinue_Click(object sender, ImageClickEventArgs e)
   {
       if (CheckValidation() == true)
       {
           SaveMenuItems();
           ChangePage("Forward");
       }
   }
    private bool CheckValidation()
    {
        bool lIsValid = true;
        if(Request.QueryString["foodgroup"] != null)
            if (int.Parse(Request.QueryString["foodgroup"].ToString()) <= 9)
            {
                int i, totalItems;
                totalItems = grdKitchenMenu.Rows.Count;
                for (i = 0; i < totalItems; i++)
                {
                    CheckBox chkSelect = (CheckBox)grdKitchenMenu.Rows[i].FindControl("chkSelect");
                    RadioButton rdbVendorSupplied = (RadioButton)grdKitchenMenu.Rows[i].FindControl("rdbVendorSupplied");
                    RadioButton rdbOnSite = (RadioButton)grdKitchenMenu.Rows[i].FindControl("rdbOnSite");
                    Label lblValidateProcess = (Label)grdKitchenMenu.Rows[i].FindControl("lblValidateProcess");

                    if (chkSelect.Checked == true && (rdbOnSite.Checked == false && rdbVendorSupplied.Checked == false))
                    {
                        lblValidateProcess.Text = "Preperation Type is Required.";
                        lIsValid = false;
                    }
                    if (chkSelect.Checked == false && (rdbOnSite.Checked == true || rdbVendorSupplied.Checked == true))
                    {
                        lblValidateProcess.Text = "Please Select the Menu Item";
                        lIsValid = false;
                    }

                    //if (chkSelect.Checked == true && (rdbOnSite.Checked == true || rdbVendorSupplied.Checked == true))
                    //{
                    //    lblValidateProcess.Text = "";
                    //}
                    //else
                    //    if (chkSelect.Checked == false && (rdbOnSite.Checked == false && rdbVendorSupplied.Checked == false))
                    //    {
                    //        lblValidateProcess.Text = "";
                    //    }
                    //    else
                    //        if (chkSelect.Checked == true && (rdbOnSite.Checked == false && rdbVendorSupplied.Checked == false))
                    //        {
                    //            lblValidateProcess.Text = "Preperation Type is Required.";
                    //            lIsValid = false;
                    //        }
                    //        else
                    //            if (chkSelect.Checked == false && (rdbOnSite.Checked == true || rdbVendorSupplied.Checked == true))
                    //            {
                    //                lblValidateProcess.Text = "Please Select the Menu Item";
                    //                lIsValid = false;
                    //            }
                }
                if (lIsValid == false)
                {
                    lblError.Text = "There was an error.  Please see below.";
                }
                //lblError.Text = "There was an error.  Please see below.";            
            }
            //else
            //{
            //    int i, totalItems;
            //    totalItems = grdKitchenMenu.Rows.Count;
            //    for (i = 0; i < totalItems; i++)
            //    {
            //        CheckBox chkSelect = (CheckBox)grdKitchenMenu.Rows[i].FindControl("chkSelect");
            //        RadioButton rdbVendorSupplied = (RadioButton)grdKitchenMenu.Rows[i].FindControl("rdbVendorSupplied");
            //        RadioButton rdbOnSite = (RadioButton)grdKitchenMenu.Rows[i].FindControl("rdbOnSite");
            //        Label lblValidateProcess = (Label)grdKitchenMenu.Rows[i].FindControl("lblValidateProcess");

            //        if (chkSelect.Checked == true && (rdbOnSite.Checked == false && rdbVendorSupplied.Checked == false))
            //        {
            //            lblValidateProcess.Text = "Preperation Type is Required.";
            //            lIsValid = false;
            //        }
            //        if (chkSelect.Checked == false && (rdbOnSite.Checked == true || rdbVendorSupplied.Checked == true))
            //        {
            //            lblValidateProcess.Text = "Please Select the Menu Item";
            //            lIsValid = false;
            //        }
            //    }
            //    if (lIsValid == false)
            //    {
            //        lblError.Text = "There was an error.  Please see below.";
            //    }
            //}
        return lIsValid;
    }
}


