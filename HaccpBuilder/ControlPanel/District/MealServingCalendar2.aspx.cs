﻿using System;
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

public partial class ControlPanel_MealServingCalendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
    }
    protected void btnEditPlan_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/SetupInventoryHaccp.aspx");
    }
    protected void btnAcceptPlan_Click(object sender, EventArgs e)
    {
        //if (SaveData() > 0)
        //{
        saveData();
        Response.Redirect("~/ControlPanel/Kitchen/MealCalendarReview.aspx");
        //}
    }
    //protected void rptMealCalendar_OnItemCommand(object source, RepeaterCommandEventArgs e)
    //{
    //    //DataGrid grdBreakFast, grdLunch;
    //    int nMealCalendarId;
    //    if (((CheckBox)e.Item.FindControl("chkBreakFast")).Checked)
    //    {
    //       if (e.CommandName == "BreakFast")
    //        {
    //            Label lblBreakFast = (Label)e.Item.FindControl("lblBreakFast");
    //            nMealCalendarId = int.Parse(((HiddenField)e.Item.FindControl("hfMealId")).Value);
    //            string strPath = "~/../../Kitchen/MealServingByDate.aspx?EventId=1&MealCalendarId=" + nMealCalendarId.ToString();
    //           //Response.Redirect("<script language=javascript>var strReturn;strReturn = window.showModalDialog(" + strPath + ",'School HACCP | Meal Serving Selection','toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,resizable=1,width=800,height=600');</script>");
    //           // Response.Write("<script language=javascript>GetData(" + strPath + "," + lblBreakFast.ClientID + ");</script>");
    //           // Response.Write("<script language=javascript>window.showModalDialog('~/../../Kitchen/MealServingByDate.aspx?EventId=1&MealCalendarId=" + nMealCalendarId.ToString() + "','School HACCP | Meal Serving Selection','toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,resizable=1,width=800,height=600');</script>");
    //            Response.Write("<script language=javascript> window.open('~/../../Kitchen/MealServingByDate1.aspx?EventId=1&MealCalendarId=" + nMealCalendarId.ToString() + "','','toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,resizable=1,width=800,height=600');</script>");
    //            //Response.Write("<script language=javascript> window.open('~/../../Kitchen/MealServingByDate1.aspx?EventId=1&MealCalendarId=2031','','toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=800,height=600');</script>");
    //            lblBreakFast.Text = "Menu Item Picked";
    //           //LinkButton b = (LinkButton)e.CommandSource;
    //            //if (b.Text == "Update")
    //            //{
    //            //    b.Text = "Select";
    //            //    ////////////////////////////////////////////////////////////
    //            //    // Delete all enteries, entered earlier and then insert new data for each date
    //            //    ///////////////////////////////////////////////////////////

    //            //    grdBreakFast = (DataGrid)e.Item.FindControl("grdBreakFast");
    //            //    Label lblBreakFast = (Label)e.Item.FindControl("lblBreakFast");
    //            //    int i, totalItems;
    //            //    //totalItems = grdBreakFast.Items.Count;
    //            //    //for (i = 0; i < totalItems; i++)
    //            //    //{
    //            //        DailyMeal dailyMeal = new DailyMeal();
    //            //        dailyMeal.MealCalendarId = int.Parse(((HiddenField)e.Item.FindControl("hfMealId")).Value);
    //            //        dailyMeal.EventId = 1;
    //            //        ProcessDeleteDailyMeal deleteDailyMeal = new ProcessDeleteDailyMeal();
    //            //        deleteDailyMeal.DailyMeal = dailyMeal;
    //            //        deleteDailyMeal.Invoke();

    //            //    //}
    //            //    // Insertion Routine
    //            //    totalItems = grdBreakFast.Items.Count;
    //            //    for (i = 0; i < totalItems; i++)
    //            //    {
    //            //        CheckBox chkItem = (CheckBox)grdBreakFast.Items[i].FindControl("chkBreakfast");                        
    //            //        if (chkItem != null)
    //            //        {
    //            //            if (chkItem.Checked)
    //            //            {
    //            //                DailyMeal dailyMealNew = new DailyMeal();
    //            //                dailyMealNew.EventId = 1;
    //            //                dailyMealNew.MealCalendarId = int.Parse(((HiddenField)e.Item.FindControl("hfMealId")).Value);
    //            //                dailyMealNew.MenuItemId = int.Parse(((HiddenField)grdBreakFast.Items[i].FindControl("hfMenuItemId")).Value);
    //            //                ProcessCreateDailyMeal createDailyMeal = new ProcessCreateDailyMeal();
    //            //                createDailyMeal.DailyMeal = dailyMealNew;
    //            //                createDailyMeal.Invoke();
    //            //                lblBreakFast.Text = "Menu Item Picked";
    //            //            }
    //            //        } // End If             

    //            //    } // End Loop
    //            //} // End Outer If

    //            //else

    //            //    b.Text = "Update";
                
    //            //((DataGrid)e.Item.FindControl("grdBreakFast")).Visible = (b.Text == "Update");


    //        }
    //    }// End Checkbox condition

    //    if (((CheckBox)e.Item.FindControl("chkLunch")).Checked)
    //    {
    //        if (e.CommandName == "Lunch")
    //        {
    //            Label lblLunch = (Label)e.Item.FindControl("lblLunch");
    //            nMealCalendarId = int.Parse(((HiddenField)e.Item.FindControl("hfMealId")).Value);
    //            Response.Write("<script language=javascript> window.open('~/../../Kitchen/MealServingByDate1.aspx?EventId=2&MealCalendarId=" + nMealCalendarId.ToString() + "','','toolbar=0,location=0,directories=0,status=1, menubar=1,scrollbars=1,resizable=1,width=800,height=600');</script>");
    //            lblLunch.Text = "Menu Item Picked";
    //            //LinkButton b = (LinkButton)e.CommandSource;

    //            //if (b.Text == "Update")
    //            //{

    //            //    b.Text = "Select";
    //            //    //grdLunch = (DataGrid)e.Item.FindControl("grdLunch");
    //            //    int i, totalItems;
    //            //    //totalItems = grdLunch.Items.Count;
    //            //    //for (i = 0; i < totalItems; i++)
    //            //    //{
    //            //        DailyMeal dailyMeal = new DailyMeal();
    //            //        dailyMeal.MealCalendarId = int.Parse(((HiddenField)e.Item.FindControl("hfMealId")).Value);
    //            //        dailyMeal.EventId = 2;
    //            //        ProcessDeleteDailyMeal deleteDailyMeal = new ProcessDeleteDailyMeal();
    //            //        deleteDailyMeal.DailyMeal = dailyMeal;
    //            //        deleteDailyMeal.Invoke();

    //            //    //}
    //            //    // Insertion routine
    //            //    grdLunch = (DataGrid)e.Item.FindControl("grdLunch");
    //            //    Label lblLunch = (Label)e.Item.FindControl("lblLunch");
    //            //    totalItems = grdLunch.Items.Count;
    //            //    for (i = 0; i < totalItems; i++)
    //            //    {
    //            //        CheckBox chkItem = (CheckBox)grdLunch.Items[i].FindControl("chkLunch");
    //            //        if (chkItem != null)
    //            //        {
    //            //            if (chkItem.Checked)
    //            //            {
    //            //                DailyMeal dailyMealNew = new DailyMeal();
    //            //                dailyMealNew.EventId = 2;
    //            //                dailyMealNew.MealCalendarId = int.Parse(((HiddenField)e.Item.FindControl("hfMealId")).Value);
    //            //                dailyMealNew.MenuItemId = int.Parse(((HiddenField)grdLunch.Items[i].FindControl("hfMenuItemId")).Value);
    //            //                ProcessCreateDailyMeal createDailyMeal = new ProcessCreateDailyMeal();
    //            //                createDailyMeal.DailyMeal = dailyMealNew;
    //            //                createDailyMeal.Invoke();
    //            //                lblLunch.Text = "Menu Item Picked";
    //            //            }
    //            //        } // End If             

    //            //    } // End Loop
    //            //}

    //            //else

    //            //    b.Text = "Update";

    //            //((DataGrid)e.Item.FindControl("grdLunch")).Visible = (b.Text == "Update");
    //        }
    //    }// End Checkbox condition

    //}
    //protected void rptMealCalendar_ItemCommand(object source, DataGridCommandEventArgs e)
    //{
    //    if (e.CommandName == "BreakFast")
    //    {

    //        LinkButton b = (LinkButton)e.CommandSource;

    //        if (b.Text == "Update")

    //            b.Text = "Select";

    //        else

    //            b.Text = "Update";

    //        ((DataGrid)e.Item.FindControl("grdBreakFast")).Visible = (b.Text == "Update");

    //    }

    //    if (e.CommandName == "Lunch")
    //    {

    //        LinkButton b = (LinkButton)e.CommandSource;

    //        if (b.Text == "Update")

    //            b.Text = "Select";

    //        else

    //            b.Text = "Update";

    //        ((DataGrid)e.Item.FindControl("grdLunch")).Visible = (b.Text == "Update");

    //    }

    //}

    //protected void rptMealCalendar_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    CheckBox chkBreakFastTemp, chkLunchTemp;
    //    Label lblBreakFast, lblLunch;
    //    DataGrid grdBreakFast, grdLunch;
    //    HiddenField hfId;
    //    //LinkButton lkbBreakFastTemp, lkbLunchTemp;
    //    //lkbBreakFastTemp = (LinkButton)e.Item.FindControl("lkbBreakFast");
    //    //lkbLunchTemp = (LinkButton)e.Item.FindControl("lkbLunch");
    //    //if (chkBreakFastTemp != null)
    //    //{
    //    //    chkBreakFastTemp.Attributes.Add("onclick", "check(" + lkbBreakFastTemp.ClientID + "," + chkBreakFastTemp.ClientID + ")");
    //    //}

    //    //if (chkLunchTemp != null)
    //    //{
    //    //    chkLunchTemp.Attributes.Add("onclick", "check(" + lkbLunchTemp.ClientID + "," + chkLunchTemp.ClientID + ")");
    //    //}
       
    //    //if (e.Item.ItemType == ListItemType.Item)
    //    //{
    //    chkBreakFastTemp = (CheckBox)e.Item.FindControl("chkBreakFast");
    //    chkLunchTemp = (CheckBox)e.Item.FindControl("chkLunch");
    //    lblBreakFast = (Label)e.Item.FindControl("lblBreakFast");
    //    lblLunch = (Label)e.Item.FindControl("lblLunch");
    //    grdBreakFast = (DataGrid)e.Item.FindControl("grdBreakFast");
    //    grdLunch = (DataGrid)e.Item.FindControl("grdLunch");
    //    hfId = (HiddenField) e.Item.FindControl("hfMealId");

    //    if (chkBreakFastTemp != null)
    //    {
    //        if (chkBreakFastTemp.Checked == true)
    //            lblBreakFast.Text = "Menu Item Picked";
    //    }
    //    if (chkLunchTemp != null)
    //    {
    //        if (chkLunchTemp.Checked == true)
    //            lblLunch.Text = "Menu Item Picked";
    //    }

    //    //rdbAnswerNo.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ",true)");

    //    ///////////////////////////////
    //    //if (grdBreakFast != null)
    //    //{
    //    //    ProcessGetDailyMeal dailyBreakFast = new ProcessGetDailyMeal();
    //    //    grdBreakFast.DataSource = dailyBreakFast.GetDailyMealByKitchenId(int.Parse(hfId.Value), 1, (int)Session["KitchenId"]);
    //    //    grdBreakFast.DataBind();
    //    //}
    //    //if (grdLunch != null)
    //    //{
    //    //    ProcessGetDailyMeal dailyLunch = new ProcessGetDailyMeal();
    //    //    grdLunch.DataSource = dailyLunch.GetDailyMealByKitchenId(int.Parse(hfId.Value), 2, (int)Session["KitchenId"]);
    //    //    grdLunch.DataBind();
    //    //}
    //    //}
    //}
    //private int SaveData()
    //{
    //    int i, totalItems,nValidData = 1;
    //    string strError="";
    //    DataGrid grdBreakFast, grdLunch;
    //   totalItems = rptMealCalendar.Items.Count;
    //   for (i = 0; i < totalItems; i++)
    //   {
    //       CheckBox chkBreakFastNew = (CheckBox)rptMealCalendar.Items[i].FindControl("chkBreakFast");
    //       CheckBox chkLunchNew = (CheckBox)rptMealCalendar.Items[i].FindControl("chkLunch");
    //       HiddenField hfId = (HiddenField)rptMealCalendar.Items[i].FindControl("hfMealId");
    //       Label lblDate =(Label)rptMealCalendar.Items[i].FindControl("lblDate");
    //       if (chkBreakFastNew != null && chkLunchNew != null && hfId != null && lblDate != null)
    //       {
    //           MealServingCalendar mealCalendar = new MealServingCalendar();
    //           mealCalendar.MealCalendarId = int.Parse(hfId.Value);
    //           if (chkBreakFastNew.Checked)
    //           {
    //               /////////////////////////////////////
    //               /// Check that User has selected menu item for this date
    //               /////////////////////////////////////
    //               ProcessGetDailyMeal checkMeal = new ProcessGetDailyMeal();
    //               DataSet dsMenu = checkMeal.GetDailySelectedMeal(int.Parse(hfId.Value), 1, (int)Session["KitchenId"]);
    //               if (dsMenu.Tables[0].Rows.Count < 1)
    //               {
    //                   strError += "<br>Please select Brekfast Menu for date: " + lblDate.Text + " Or Unchecked the Checkbox";
    //                   nValidData = 0;                   
    //               }
    //               mealCalendar.BreakFast = 1;
    //           }
    //           else
    //           {
    //               mealCalendar.BreakFast = 0;
    //               ///////////////////////////
    //               // Delete All Entries in DailyMeal against the specific MealCalendarId
    //               ///////////////////////////

    //               grdBreakFast = (DataGrid)rptMealCalendar.Items[i].FindControl("grdBreakFast");
    //               //int j, totalRows;
    //               //totalRows = grdBreakFast.Items.Count;
    //               //for (j = 0; j < totalRows; j++)
    //               //{
    //                   DailyMeal dailyMeal = new DailyMeal();
    //                   dailyMeal.MealCalendarId = int.Parse(hfId.Value);
    //                   dailyMeal.EventId = 1;
    //                   ProcessDeleteDailyMeal deleteDailyMeal = new ProcessDeleteDailyMeal();
    //                   deleteDailyMeal.DailyMeal = dailyMeal;
    //                   deleteDailyMeal.Invoke();

    //               //}
    //           } // End Else Portion for Checking Breakfast Checkbox

    //           if (chkLunchNew.Checked)
    //           {
    //               /////////////////////////////////////
    //               /// Check that User has selected menu item for this date
    //               /////////////////////////////////////
    //               ProcessGetDailyMeal checkMeal = new ProcessGetDailyMeal();
    //               DataSet dsMenu = checkMeal.GetDailySelectedMeal(int.Parse(hfId.Value), 2, (int)Session["KitchenId"]);
    //               if (dsMenu.Tables[0].Rows.Count < 1)
    //               {
    //                   strError += "<br>Please select Lunch Menu for date: " + lblDate.Text + " Or Unchecked the Checkbox";
    //                   nValidData = 0;  
    //               }
    //               mealCalendar.Lunch = 1;
    //           }
    //           else
    //           {
    //               mealCalendar.Lunch = 0;
    //               ///////////////////////////
    //               // Delete All Entries in DailyMeal against the specific MealCalendarId
    //               ///////////////////////////

    //               grdLunch = (DataGrid)rptMealCalendar.Items[i].FindControl("grdLunch");
    //               //int j, totalRows;
    //               //totalRows = grdLunch.Items.Count;
    //               //for (j = 0; j < totalRows; j++)
    //               //{
    //                   DailyMeal dailyMeal = new DailyMeal();
    //                   dailyMeal.MealCalendarId = int.Parse(hfId.Value);
    //                   dailyMeal.EventId = 2;
    //                   ProcessDeleteDailyMeal deleteDailyMeal = new ProcessDeleteDailyMeal();
    //                   deleteDailyMeal.DailyMeal = dailyMeal;
    //                   deleteDailyMeal.Invoke();

    //               //}
    //           }
    //           mealCalendar.KitchenId = (int)Session["KitchenId"];
    //           ProcessSetMealServingCalendar setMealCalendar = new ProcessSetMealServingCalendar();
    //           setMealCalendar.MealServingCalendar = mealCalendar;
    //           setMealCalendar.Invoke();
    //       } // End If
    //   }// End For
    //   lblError.Text = strError;
    //   return nValidData;

          
    //}
    private void saveData()
    {
        HiddenField hfMealId;
        CheckBox chkBreakFast, chkLunch;
        foreach (GridViewRow row in grdMealCalendar.Rows)
        {
            chkBreakFast = (CheckBox)row.FindControl("chkBreakfast");
            chkLunch = (CheckBox)row.FindControl("chkLunch");
            hfMealId = (HiddenField)row.FindControl("hfMealId");
            if (chkBreakFast != null && hfMealId != null && chkLunch != null)
            {
                MealServingCalendar mealCalendar = new MealServingCalendar();
                mealCalendar.MealCalendarId = int.Parse(hfMealId.Value);
                if (chkBreakFast.Checked == true)
                {
                    mealCalendar.BreakFast = 1;
                }
                else
                {
                    mealCalendar.BreakFast = 0;
                }
                if (chkLunch.Checked == true)
                {
                    mealCalendar.Lunch = 1;
                }
                else
                {
                    mealCalendar.Lunch = 0;
                }
                mealCalendar.KitchenId = (int)Session["KitchenId"];
                ProcessSetMealServingCalendar setMealCalendar = new ProcessSetMealServingCalendar();
                setMealCalendar.MealServingCalendar = mealCalendar;
                setMealCalendar.Invoke();
            }
        }
    }

    protected void chkBreakFast_CheckedChanged(object sender, EventArgs e)
    {
        HiddenField hfMealId;
        CheckBox chkBreakFast;
        int nMealCalendarId;
        chkBreakFast = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkBreakFast.NamingContainer;
        hfMealId = (HiddenField)row.FindControl("hfMealId");
        if (chkBreakFast.Checked == true)
        {            
            nMealCalendarId = int.Parse(hfMealId.Value);
            Response.Redirect("~/ControlPanel/Kitchen/MealServingByDate2.aspx?MealCalendarId=" + hfMealId.Value + "&EventId=1");
        }
        else
        {
            //Delete Meal for this date
            DailyMeal dailyMeal = new DailyMeal();
            dailyMeal.MealCalendarId = int.Parse(hfMealId.Value);
            dailyMeal.EventId = 1;
            ProcessDeleteDailyMeal deleteDailyMeal = new ProcessDeleteDailyMeal();
            deleteDailyMeal.DailyMeal = dailyMeal;
            deleteDailyMeal.Invoke();
            saveData();
        }
    }
    protected void chkLunch_CheckedChanged(object sender, EventArgs e)
    {
        HiddenField hfMealId;
        CheckBox chkLunch;
        int nMealCalendarId;
        chkLunch = (CheckBox)sender;
        GridViewRow row = (GridViewRow)chkLunch.NamingContainer;
        hfMealId = (HiddenField)row.FindControl("hfMealId");
        if (chkLunch.Checked == true)
        {
            nMealCalendarId = int.Parse(hfMealId.Value);
            Response.Redirect("~/ControlPanel/Kitchen/MealServingByDate2.aspx?MealCalendarId=" + hfMealId.Value + "&EventId=2");
        }
        else
        {
            //Delete Meal for this date
            DailyMeal dailyMeal = new DailyMeal();
            dailyMeal.MealCalendarId = int.Parse(hfMealId.Value);
            dailyMeal.EventId = 2;
            ProcessDeleteDailyMeal deleteDailyMeal = new ProcessDeleteDailyMeal();
            deleteDailyMeal.DailyMeal = dailyMeal;
            deleteDailyMeal.Invoke();
            saveData();
        }
    }
}
