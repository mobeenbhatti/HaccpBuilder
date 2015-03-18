using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
using SchoolHaccp.Operational;
namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class FreezerLogNew : System.Web.UI.Page
    {
        public string mode = "new";
        protected DateTime currentTime = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
                CV_cldEntryDate.ValueToCompare = DateTime.Now.ToShortDateString();
                CV_cldVerifiedDate.ValueToCompare = DateTime.Now.ToShortDateString();
                chkClear.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction1.ClientID + "')");
                chkClear2.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction2.ClientID + "')");
                chkClear3.Attributes.Add("onClick", "ClearCorrectiveActions('" + rdlCorrectiveAction3.ClientID + "')");
                currentTime = Utilities.GetTimeByZone(KitchenId);

                GetInitialData();
                if (Request.QueryString["Id"] != null || Request.QueryString["date"] != null)
                {
                    // ItemId = int.Parse(Request.QueryString["Id"]);
                    mode = "edit";
                    SetPage();
                    GetData();
                }
                else
                {
                    SetPage();
                }
            }
            else
            {
                if (rdbIngredient.Checked == true)
                {
                    ddlIngredient.Enabled = true;
                    ddlMenuItem.Enabled = false;
                    rfvIngredient.Enabled = true;
                    rfvMenuItem.Enabled = false;
                }
                if (rdbMenuItem.Checked == true)
                {
                    ddlMenuItem.Enabled = true;
                    ddlIngredient.Enabled = false;
                    rfvIngredient.Enabled = false;
                    rfvMenuItem.Enabled = true;
                }
            }


        }
        private bool CheckPage(int nMode)
        {
            bool result = true;

            if (rdbIngredient.Checked == true && ddlIngredient.SelectedItem.Text == "Select Input")
            {
                LogError.Text += "<br />Please Select Input";
                LogError.Visible = true;
                result = false;
            }

            if (rdbMenuItem.Checked == true && ddlMenuItem.SelectedItem.Text == "Select Output")
            {
                LogError.Text += "<br />Please Select Output";
                LogError.Visible = true;
                result = false;
            }
            if (tpHour1.Text != "")
            {
                if (cldEntryDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
                {
                    if (DateTime.Parse(GetTime(1)) > currentTime)
                    {
                        LogError.Text += " <br />Please enter correct time in ‘Temp 1 time’ field";
                        LogError.Visible = true;
                        result = false;

                    }
                }
            }

            if (tpHour2.Text != "")
            {
                if (cldEntryDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
                {
                    if (DateTime.Parse(GetTime(2)) > currentTime)
                    {
                        LogError.Text += " <br />Please enter correct time in ‘Temp 2 time’ field";
                        LogError.Visible = true;
                        result = false;

                    }
                }
            }
            if (tpHour3.Text != "")
            {
                if (cldEntryDate.SelectedDate.ToShortDateString() == DateTime.Now.ToShortDateString())
                {
                    if (DateTime.Parse(GetTime(3)) > currentTime)
                    {
                        LogError.Text += " <br />Please enter correct time in ‘Temp 3 time’ field";
                        LogError.Visible = true;
                        result = false;

                    }
                }
            }
            if (result == false)
            {
                return result;
            }

            if (Page.IsValid)
            {

                result = EnableDisableTemp_Add(nMode);

            }
            else
            {
                result = false;
            }

            return result;
        }

        private bool EnableDisableTemp_Add(int mode)
        {
            bool result = true; ;
            if (rdbIngredient.Checked == false && rdbMenuItem.Checked == false)
            {

                result = true;
            }
            else if (rdbIngredient.Checked == true || rdbMenuItem.Checked == true)
            {


                if (mode == 1)
                {
                    if (txtTemp1.Text == "")
                    {
                        LogError.Text += " <br />Please fill Internal Temp 1 field";
                        LogError.Visible = true;
                        result = false;
                    }
                    if (tpHour1.Text == "")
                    {
                        LogError.Text += " <br />Please fill Time/Temp 1 field";
                        LogError.Visible = true;
                        result = false;
                    }
                    if (txtTemp2.Text != "")
                    {
                        if (txtTemp1.Text == "")
                        {
                            LogError.Text += " <br />Please fill Internal Temp 1 field";
                            LogError.Visible = true;
                            result = false;
                        }
                        if (tpHour1.Text == "")
                        {
                            LogError.Text += " <br />Please fill Time/Temp 1 field";
                            LogError.Visible = true;
                            result = false;
                        }
                        if (tpHour2.Text == "")
                        {
                            LogError.Text += " <br />Please fill Time/Temp 2 field";
                            LogError.Visible = true;
                            result = false;
                        }

                    }
                    if (txtTemp3.Text != "")
                    {
                        if (txtTemp2.Text == "")
                        {
                            LogError.Text += " <br />Please fill Internal Temp 2 field";
                            LogError.Visible = true;
                            result = false;
                        }
                        if (tpHour2.Text == "")
                        {
                            LogError.Text += " <br />Please fill Time/Temp 2 field";
                            LogError.Visible = true;
                            result = false;
                        }
                        if (tpHour3.Text == "")
                        {
                            LogError.Text += " <br />Please fill Time/Temp 3 field";
                            LogError.Visible = true;
                            result = false;
                        }

                    }
                }
                else if (mode == 2)
                {
                    //if (float.Parse(txtTemp1.Text) == float.Parse(this.ViewState["Temp1"].ToString()))
                    if (txtTemp1.Text == this.ViewState["Temp1"].ToString())
                    {
                        if (txtTemp1.Text == "")
                        {
                            LogError.Text += "<br />Please fill Internal Temp 1 field ";
                            LogError.Visible = true;
                            result = false;
                        }
                        if (tpHour1.Text == "")
                        {
                            LogError.Text += " <br />Please fill Time/Temp 1 field";
                            LogError.Visible = true;
                            result = false;
                        }

                        if (txtTemp2.Text == "")
                        {
                            LogError.Text += "<br />Please fill Internal Temp 2 field. </ br>";
                            LogError.Visible = true;
                            result = false;
                        }
                        if (tpHour2.Text == "")
                        {
                            LogError.Text += "<br />Please fill Time/Temp 2 field. </ br>";
                            LogError.Visible = true;
                            result = false;
                        }




                    }
                    // else if (float.Parse(txtTemp1.Text) != float.Parse(this.ViewState["Temp1"].ToString()))
                    else if (txtTemp1.Text != this.ViewState["Temp1"].ToString())
                    {
                        if (txtTemp1.Text == "")
                        {
                            LogError.Text += "<br />Please fill Internal Temp 1 field </ br>";
                            LogError.Visible = true;
                            result = false;
                        }
                        if (tpHour1.Text == "")
                        {
                            LogError.Text += "<br />Please fill Time/Temp 1 field </ br>";
                            LogError.Visible = true;
                            result = false;
                        }

                        if (txtTemp2.Text != "")
                        {
                            if (txtTemp1.Text == "")
                            {
                                LogError.Text += " <br />Please fill Internal Temp 1 field";
                                LogError.Visible = true;
                                result = false;
                            }
                            if (tpHour1.Text == "")
                            {
                                LogError.Text += " <br />Please fill Time/Temp 1 field";
                                LogError.Visible = true;
                                result = false;
                            }
                            if (tpHour2.Text == "")
                            {
                                LogError.Text += " <br />Please fill Time/Temp 2 field";
                                LogError.Visible = true;
                                result = false;
                            }

                        }
                        if (txtTemp3.Text != "")
                        {
                            if (txtTemp2.Text == "")
                            {
                                LogError.Text += " <br />Please fill Internal Temp 2 field";
                                LogError.Visible = true;
                                result = false;
                            }
                            if (tpHour2.Text == "")
                            {
                                LogError.Text += " <br />Please fill Time/Temp 2 field";
                                LogError.Visible = true;
                                result = false;
                            }
                            if (tpHour3.Text == "")
                            {
                                LogError.Text += " <br />Please fill Time/Temp 3 field";
                                LogError.Visible = true;
                                result = false;
                            }

                        }

                    }

                }
            }
            return result;

        }

        protected void cmdBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }
        private void GetInitialData()
        {
            string Info1 = "<b>No Record Found.</b>";
            string Info2 = "<b>No Record Found.</b>";
            string Info3 = "<b>No Record Found.</b>";
            SetTime(4, currentTime);
           
            cldVerifiedDate.SelectedDate = currentTime.Date;
            txtEntryDate.Text = currentTime.ToString();
            if ((int)Session["TypeId"] != 1)
            {
                ProcessGetKitchen getKitchen = new ProcessGetKitchen();
                ProcessGetCriticalLimits getLimits = new ProcessGetCriticalLimits();
                // DataSet dsTemperature = getKitchen.GetKitchenTemperatureRangeByKitchenId(KitchenId, 2);
                DataSet dsTemperature = getLimits.GetCriticalLimitsByKitchenId(KitchenId, 2);
                if (dsTemperature.Tables[0].Rows.Count > 0)
                {
                    hfTempHigh.Value = dsTemperature.Tables[0].Rows[0]["QCLTempHigh"].ToString();
                    hfTempLow.Value = dsTemperature.Tables[0].Rows[0]["QCLTempLow"].ToString();
                    hfTempHigh1.Value = dsTemperature.Tables[0].Rows[0]["QCLTempHigh2"].ToString();
                    hfTempLow1.Value = dsTemperature.Tables[0].Rows[0]["QCLTempLow2"].ToString();
                    hfTempHigh2.Value = dsTemperature.Tables[0].Rows[0]["QCLTempHigh3"].ToString();
                    hfTempLow2.Value = dsTemperature.Tables[0].Rows[0]["QCLTempLow3"].ToString();
                    hfTime1.Value = dsTemperature.Tables[0].Rows[0]["QCLTime2"].ToString();
                    hfTime2.Value = dsTemperature.Tables[0].Rows[0]["QCLTime1"].ToString();


                    //Lbl_QCLMaxtempValue.Text = dsTemperature.Tables[0].Rows[0]["QCLTempHigh"].ToString();
                    //Lbl_QCLMintempValue.Text = dsTemperature.Tables[0].Rows[0]["QCLTempLow"].ToString();

                    Info1 = "<b>FIRST COOLING TEMPERATURE REQUIREMENT:</b><br /> ";
                    Info1 += "Quality Critical Limit (QCL):<br />";
                    //Info1 += "QCL heigh Temperature  = " + "<b>" + hfTempHigh.Value + "</b><br />";
                    Info1 += "QCL Temperature should be greater then or equal to " + "<b>" + hfTempLow.Value + "</b><br />";
                    Img_helpcoolingTemp1.Attributes.Add("onmouseover", "return overlib('" + Info1 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
                    Img_helpcoolingTemp1.Attributes.Add("onmouseout", "return nd();");

                    Info2 = "<b>SECOND COOLING TEMPERATURE REQUIREMENT:</b><br /> ";
                    Info2 += "Quality Critical Limit (QCL):<br />";
                    //Info2 += "QCL heigh Temperature  = " + "<b>" + hfTempHigh1.Value + "</b><br />";
                    Info2 += "QCL Temperature should be less than or equal to " + "<b>" + hfTempLow1.Value + "</b><br />";
                    Img_helpcoolingTemp2.Attributes.Add("onmouseover", "return overlib('" + Info2 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
                    Img_helpcoolingTemp2.Attributes.Add("onmouseout", "return nd();");

                    Info3 = "<b>THIRD COOLING TEMPERATURE REQUIREMENT:</b><br /> ";
                    Info3 += "Quality Critical Limit (QCL):<br />";
                    //Info3 += "QCL heigh Temperature  = " + "<b>" + hfTempHigh2.Value + "</b><br />";
                    Info3 += "QCL Temperature should be less than or equal to " + "<b>" + hfTempLow2.Value + "</b><br />";

                    Img_helpcoolingTemp3.Attributes.Add("onmouseover", "return overlib('" + Info3 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
                    Img_helpcoolingTemp3.Attributes.Add("onmouseout", "return nd();");

                }
                else
                {

                    Img_helpcoolingTemp1.Attributes.Add("onmouseover", "return overlib('" + Info1 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
                    Img_helpcoolingTemp1.Attributes.Add("onmouseout", "return nd();");
                    Img_helpcoolingTemp2.Attributes.Add("onmouseover", "return overlib('" + Info2 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
                    Img_helpcoolingTemp2.Attributes.Add("onmouseout", "return nd();");
                    Img_helpcoolingTemp3.Attributes.Add("onmouseover", "return overlib('" + Info3 + "', WRAP,BASE,2,LEFT,OFFSETX,-16,OFFSETY,20,TEXTFONTCLASS,'popUpBox');");
                    Img_helpcoolingTemp3.Attributes.Add("onmouseout", "return nd();");
                }

            }
            else
            {
                hfTempHigh.Value = "NA";
                hfTempLow.Value = "NA";
                hfTempHigh1.Value = "NA";
                hfTempLow1.Value = "NA";
                hfTempHigh2.Value = "NA";
                hfTempLow2.Value = "NA";
                hfTime1.Value = "NA";
                hfTime2.Value = "NA";
                //Lbl_QCLMaxtempValue.Text = "NA";
                //Lbl_QCLMintempValue.Text = "NA";

            }



            // ---------- MAP Meal DATE WITH MEAL SERVING CALENDAR ---------------

            //cldMealDate.SelectedDate = DateTime.Today;
            //ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
            //DataSet dsFoodItem = menuItems.GetMenuItemsDataSet(KitchenId);
            //ddlFoodItem.Items.Add("Select Value");
            //foreach (DataRow drFoodItem in dsFoodItem.Tables[0].Rows)
            //{
            //    // For new table design
            //    ListItem foodItem = new ListItem();
            //    foodItem.Text = drFoodItem["ItemId"].ToString() + " " + drFoodItem["MenuItem"].ToString();
            //    foodItem.Value = drFoodItem["Id"].ToString();            
            //    ddlFoodItem.Items.Add(foodItem);

            //    //foodItem.Text = drFoodItem["ItemId"].ToString() + " " + drFoodItem["MenuItem"].ToString();
            //    //foodItem.Value = drFoodItem["CustomItem"] + "-" + drFoodItem["Id"].ToString();   
            //}
            //ProcessGetMenuItems menuItems = new ProcessGetMenuItems();
            //DataSet dsFoodItem = menuItems.GetMealServingDates(KitchenId);
            //ddlMealDate.Items.Add("Select Date");
            //foreach (DataRow drFoodItem in dsFoodItem.Tables[0].Rows)
            //{
            //    ListItem dateSelected = new ListItem();
            //    dateSelected.Text = DateTime.Parse(drFoodItem["Date"].ToString()).ToShortDateString();
            //    dateSelected.Value = DateTime.Parse(drFoodItem["Date"].ToString()).ToShortDateString();
            //    ddlMealDate.Items.Add(dateSelected);

            //}

        }
        private string RemoveAMorPM(string time)
        {
            string t = string.Empty;
            if (time.EndsWith("AM"))
            {
                t = time.Replace("AM", "");

            }
            else if (time.EndsWith("am"))
            {
                t = time.Replace("am", "");
            }
            else if (time.EndsWith("pm"))
            {
                t = time.Replace("pm", "");
            }
            else if (time.EndsWith("PM"))
            {
                t = time.Replace("PM", "");
            }

            return t;
        }
        protected void ValidateTime3(object source, ServerValidateEventArgs args)
        {

            if (txtTemp2.Text != "" && txtTemp3.Text != "")
            {
                if (GetTime(2) != "" && GetTime(3) != "")
                {

                    if (DateTime.Parse(GetTime(3)) < DateTime.Parse(GetTime(2)))
                    {
                        args.IsValid = false;
                    }
                }
            }
        }
        protected void ValidateTime2(object source, ServerValidateEventArgs args)
        {

            if (txtTemp2.Text != "" && txtTemp1.Text != "")
            {
                if (tpHour2.Text != "" && tpHour1.Text != "")
                {

                    if (DateTime.Parse(GetTime(2)) < DateTime.Parse(GetTime(1)))
                    {
                        args.IsValid = false;
                    }
                }
            }
        }
        protected void ValidateTemp1(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;
            if (hfTempLow.Value != "NA" && hfTempLow.Value != "")
            {
                if (txtTemp1.Text != "")
                {

                    if (float.Parse(txtTemp1.Text) < float.Parse(hfTempLow.Value))
                    {
                        for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction1.Items[i].Selected == true)
                            {
                                nResult = 1;
                                break;
                            }
                        }
                        if (nResult == 0)
                        {
                            args.IsValid = false;
                        }
                    }
                }
            }
        }
        protected void ValidateTemp2(object source, ServerValidateEventArgs args)
        {
            int nResult = 0;
            if (hfTempLow1.Value != "NA" && hfTempLow1.Value != "")
            {
                if (txtTemp2.Text != "")
                {

                    if (float.Parse(txtTemp2.Text) > float.Parse(hfTempLow1.Value))
                    {
                        for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction2.Items[i].Selected == true)
                            {
                                nResult = 1;
                                break;
                            }
                        }
                        if (nResult == 0)
                        {
                            args.IsValid = false;
                        }
                    }
                }
            }
            if (hfTime1.Value != "NA" && hfTime1.Value != "")
            {
                nResult = 0;
                if (tpHour2.Text != "" && tpHour1.Text != "")
                {
                    string time2, time1;
                    string[] t2, t1;
                    TimeSpan timespan2, timespan1;

                    //if (tpTime2.Text.Contains("AM") || tpTime2.Text.Contains("PM") || tpTime2.Text.Contains("am") || tpTime2.Text.Contains("pm"))
                    if (GetTime(2).Contains("AM") || GetTime(2).Contains("PM") || GetTime(2).Contains("am") || GetTime(2).Contains("pm"))
                    {
                        time2 = RemoveAMorPM(GetTime(2));
                    }
                    else
                    {
                        time2 = GetTime(2);
                    }

                    if (GetTime(2).Contains(":"))
                    {
                        t2 = time2.Split(':');
                        timespan2 = new TimeSpan(int.Parse(t2[0]), int.Parse(t2[1]), 0);
                    }
                    else
                    {
                        timespan2 = new TimeSpan(int.Parse(time2));
                    }


                    if (GetTime(1).Contains("AM") || GetTime(1).Contains("PM") || GetTime(1).Contains("am") || GetTime(1).Contains("pm"))
                    {
                        time1 = RemoveAMorPM(GetTime(1));
                    }
                    else
                    {
                        time1 = tpTime1.Text;
                    }

                    if (GetTime(1).Contains(":"))
                    {
                        t1 = time1.Split(':');
                        timespan1 = new TimeSpan(int.Parse(t1[0]), int.Parse(t1[1]), 0);
                    }
                    else
                    {
                        timespan1 = new TimeSpan(int.Parse(time1));
                    }
                    if ((timespan2.Subtract(timespan1).Hours * 60) + (timespan2.Subtract(timespan1).Minutes) > int.Parse(hfTime1.Value.ToString()))
                    {
                        for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction2.Items[i].Selected == true)
                            {
                                nResult = 1;
                                break;
                            }
                        }
                        if (nResult == 0)
                        {
                            args.IsValid = false;
                        }
                    }
                }
            }
        }
        protected void ValidateTemp3(object source, ServerValidateEventArgs args)
        {

            int nResult = 0;
            if (hfTempLow2.Value != "NA" && hfTempLow2.Value != "")
            {
                if (txtTemp3.Text != "")
                {
                    if (float.Parse(txtTemp3.Text) > float.Parse(hfTempLow2.Value))
                    {
                        for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction3.Items[i].Selected == true)
                            {
                                nResult = 1;
                                break;
                            }
                        }
                        if (nResult == 0)
                        {
                            args.IsValid = false;
                        }
                    }
                }
            }
            if (hfTime1.Value != "NA" && hfTime1.Value != "")
            {
                nResult = 0;
                if (tpHour3.Text != "" && tpHour2.Text != "")
                {
                    string time3, time2, time1;
                    string[] t3, t2, t1;
                    TimeSpan timespan3, timespan2, timespan1;

                    //if (tpTime2.Text.Contains("AM") || tpTime2.Text.Contains("PM") || tpTime2.Text.Contains("am") || tpTime2.Text.Contains("pm"))
                    //if (GetTime(2).Contains("AM") || GetTime(2).Contains("PM") || GetTime(2).Contains("am") || GetTime(2).Contains("pm"))
                    //{
                    //    time2 = RemoveAMorPM(GetTime(2));
                    //}
                    //else
                    //{
                    //    //time2 = tpTime2.Text;
                    //    time2 = tpHour2.Text + ":" + tpMinute2.Text;
                    //}

                    //if (GetTime(2).Contains(":"))
                    //{
                    //    t2 = time2.Split(':');
                    //    timespan2 = new TimeSpan(int.Parse(t2[0]), int.Parse(t2[1]), 0);
                    //}
                    //else
                    //{
                    //    timespan2 = new TimeSpan(int.Parse(time2));
                    //}
                    if (GetTime(1).Contains("AM") || GetTime(1).Contains("PM") || GetTime(1).Contains("am") || GetTime(1).Contains("pm"))
                    {
                        time1 = RemoveAMorPM(GetTime(1));
                    }
                    else
                    {
                        time1 = tpTime1.Text;
                    }

                    if (GetTime(1).Contains(":"))
                    {
                        t1 = time1.Split(':');
                        timespan1 = new TimeSpan(int.Parse(t1[0]), int.Parse(t1[1]), 0);
                    }
                    else
                    {
                        timespan1 = new TimeSpan(int.Parse(time1));
                    }


                    if (GetTime(3).Contains("AM") || GetTime(3).Contains("PM") || GetTime(3).Contains("am") || GetTime(3).Contains("pm"))
                    {
                        time3 = RemoveAMorPM(GetTime(3));
                    }
                    else
                    {
                        //time3 = tpTime3.Text;
                        time3 = tpHour3.Text + ":" + tpMinute3.Text;
                    }

                    if (GetTime(3).Contains(":"))
                    {
                        t3 = time3.Split(':');
                        timespan3 = new TimeSpan(int.Parse(t3[0]), int.Parse(t3[1]), 0);
                    }
                    else
                    {
                        timespan3 = new TimeSpan(int.Parse(time3));
                    }
                    //if ((timespan3.Subtract(timespan2).Hours * 60) + (timespan3.Subtract(timespan2).Minutes) > int.Parse(hfTime2.Value.ToString()))
                    if ((timespan3.Subtract(timespan1).Hours * 60) + (timespan3.Subtract(timespan1).Minutes) > int.Parse(hfTime2.Value.ToString()))
                    {
                        for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction2.Items[i].Selected == true)
                            {
                                nResult = 1;
                                break;
                            }
                        }
                        if (nResult == 0)
                        {
                            args.IsValid = false;
                        }
                    }
                }
            }
        }

        
        private void GetData()
        {
            //string strCustom;
            string strDate, strTime1, strTime2, strTime3;
            if (Request.QueryString["Id"] != null)
            {
                FreezerLog FreezerLog = new FreezerLog();
                FreezerLog.FreezerLogId = int.Parse(Request.QueryString["Id"]);
                ProcessGetFreezerLog getFreezerLog = new ProcessGetFreezerLog();
                getFreezerLog.FreezerLog = FreezerLog;
                getFreezerLog.Invoke();

                IDataReader logReader = getFreezerLog.ResultSet;
                if (logReader.Read())
                {
                    // cldMealDate.SelectedDate = DateTime.Parse(logReader["MealDate"].ToString());
                    strDate = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();                    
                    cldEntryDate.SelectedDate = DateTime.Parse(strDate);
                    if (logReader["FoodItem"].ToString() == "1")
                    {                       
                        rdbIngredient.Checked = true;
                        rdbMenuItem.Checked = false;
                        ddlIngredient.Enabled = true;                        
                        ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                        ddlMenuItem.Enabled = false;
                    }
                    if (logReader["FoodItem"].ToString() == "2")
                    {
                       
                        rdbMenuItem.Checked = true;
                        ddlMenuItem.Enabled = true;
                        rdbIngredient.Checked = false;                      
                        ddlIngredient.Enabled = false;
                        ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                    }
                    if (logReader["FoodItem"].ToString() == "3")
                    {
                        
                    }
                    if (logReader["Temp1"].ToString() != "99999.00")
                    {
                        txtTemp1.Text = logReader["Temp1"].ToString();
                        this.ViewState["Temp1"] = logReader["Temp1"].ToString();

                    }
                    else
                    {
                        txtTemp1.Text = "";
                        this.ViewState["Temp1"] = "";

                    }
                    
                    strTime1 = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                    SetTime(1, DateTime.Parse(strTime1));
                    if (logReader["Temp2"].ToString() != "99999.00")
                    {
                        txtTemp2.Text = logReader["Temp2"].ToString();

                    }
                    else
                    {
                        txtTemp2.Text = "";

                    }
                   
                    strTime2 = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                    SetTime(2, DateTime.Parse(strTime2));

                    if (logReader["Temp3"].ToString() != "99999.00")
                    {
                        txtTemp3.Text = logReader["Temp3"].ToString();

                    }
                    else
                    {
                        txtTemp3.Text = "";
                    }                   
                    strTime3 = DateTime.Parse(logReader["Temp3Time"].ToString()).ToShortTimeString();
                    SetTime(3, DateTime.Parse(strTime3));                    
                    txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                    cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                    txtEntryDate.Text = logReader["EntryDate"].ToString();
                    if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                    {
                        SetPageInEditMode("edit");
                        Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                        Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                        Lbl_CorrectiveAction3.Text = logReader["CorrectiveActionName3"].ToString();
                        rdlCorrectiveAction1.Visible = false;
                        rdlCorrectiveAction2.Visible = false;
                        rdlCorrectiveAction3.Visible = false;
                        Lbl_CorrectiveAction1.Visible = true;
                        Lbl_CorrectiveAction2.Visible = true;
                        Lbl_CorrectiveAction3.Visible = true;

                    }
                    else
                    {
                        SetPageInEditMode("new");
                        rdlCorrectiveAction1.DataBind();
                        rdlCorrectiveAction2.DataBind();
                        rdlCorrectiveAction3.DataBind();
                        for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction1"].ToString())
                            {
                                rdlCorrectiveAction1.Items[i].Selected = true;
                                break;
                            }
                        }
                        for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveAction2"].ToString())
                            {
                                rdlCorrectiveAction2.Items[i].Selected = true;
                                break;
                            }
                        }
                        for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                        {
                            if (rdlCorrectiveAction3.Items[i].Value == logReader["CorrectiveAction3"].ToString())
                            {
                                rdlCorrectiveAction3.Items[i].Selected = true;
                                break;
                            }
                        }
                    }
                    hfMobileId.Value = logReader["MobileId"].ToString() != "" ? logReader["MobileId"].ToString() : "0";

                    logReader.Close();
                }
                if (logReader.IsClosed == false)
                {
                    logReader.Close();
                }
            }
            else
            {
                if (Request.QueryString["date"] != null)
                {
                    ProcessGetFreezerLog getFreezerLog = new ProcessGetFreezerLog();
                    IDataReader logReader = getFreezerLog.GetFreezerLogByEntryDate(DateTime.Parse(Request.QueryString["date"].ToString()), KitchenId);

                    if (logReader.Read())
                    {
                        Session["FreezerLogId"] = int.Parse(logReader["Id"].ToString());
                        strDate = DateTime.Parse(logReader["MealDate"].ToString()).ToShortDateString();                       
                        cldEntryDate.SelectedDate = DateTime.Parse(strDate);
                        if (logReader["FoodItem"].ToString() == "1")
                        {
                           
                            rdbIngredient.Checked = true;
                            rdbMenuItem.Checked = false;
                            ddlIngredient.Enabled = true;                          
                            ddlIngredient.SelectedValue = logReader["IngredientID"].ToString();
                            ddlMenuItem.Enabled = false;
                        }
                        if (logReader["FoodItem"].ToString() == "2")
                        {                            
                            rdbMenuItem.Checked = true;
                            ddlMenuItem.Enabled = true;
                            rdbIngredient.Checked = false;                          
                            ddlIngredient.Enabled = false;
                            ddlMenuItem.SelectedValue = logReader["MenuItemID"].ToString();
                        }
                        if (logReader["FoodItem"].ToString() == "3")
                        {
                            rdbMenuItem.Checked = false; ;
                            ddlMenuItem.Enabled = false;                          
                            ddlIngredient.Enabled = false;                          
                        }
                        if (logReader["Temp1"].ToString() != "99999.00")
                        {
                            txtTemp1.Text = logReader["Temp1"].ToString();
                            this.ViewState["Temp1"] = logReader["Temp1"].ToString();

                        }
                        else
                        {
                            txtTemp1.Text = "";
                            this.ViewState["Temp1"] = "";
                        }                        
                        strTime1 = DateTime.Parse(logReader["Temp1Time"].ToString()).ToShortTimeString();
                        SetTime(1, DateTime.Parse(strTime1));
                        if (logReader["Temp2"].ToString() != "99999.00")
                        {
                            txtTemp2.Text = logReader["Temp2"].ToString();

                        }
                        else
                        {
                            txtTemp1.Text = "";
                            this.ViewState["Temp2"] = "";
                        }                                                
                        strTime2 = DateTime.Parse(logReader["Temp2Time"].ToString()).ToShortTimeString();
                        SetTime(2, DateTime.Parse(strTime2));


                        if (logReader["Temp3"].ToString() != "99999.00")
                        {
                            txtTemp3.Text = logReader["Temp3"].ToString();

                        }
                        else
                        {
                            txtTemp1.Text = "";
                            this.ViewState["Temp3"] = "";
                        }                      
                        strTime3 = DateTime.Parse(logReader["Temp3Time"].ToString()).ToShortTimeString();
                        SetTime(3, DateTime.Parse(strTime3));                       
                        txtVerifiedBy.Text = logReader["VerifiedBy"].ToString();
                        cldVerifiedDate.SelectedDate = DateTime.Parse(logReader["VerifiedDate"].ToString());
                        txtEntryDate.Text = logReader["EntryDate"].ToString();
                        if (Utilities.CalculateLogsEntryTime(DateTime.Now.Subtract(DateTime.Parse(logReader["EntryDate"].ToString()))) == false)
                        {
                            SetPageInEditMode("edit");
                            Lbl_CorrectiveAction1.Text = logReader["CorrectiveActionName1"].ToString();
                            Lbl_CorrectiveAction2.Text = logReader["CorrectiveActionName2"].ToString();
                            Lbl_CorrectiveAction3.Text = logReader["CorrectiveActionName3"].ToString();
                            rdlCorrectiveAction1.Visible = false;
                            rdlCorrectiveAction2.Visible = false;
                            rdlCorrectiveAction3.Visible = false;
                            Lbl_CorrectiveAction1.Visible = true;
                            Lbl_CorrectiveAction2.Visible = true;
                            Lbl_CorrectiveAction3.Visible = true;
                        }
                        else
                        {
                            SetPageInEditMode("new");
                            rdlCorrectiveAction1.DataBind();
                            rdlCorrectiveAction2.DataBind();
                            rdlCorrectiveAction3.DataBind();
                            for (int i = 0; i < rdlCorrectiveAction1.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction1.Items[i].Value == logReader["CorrectiveAction1"].ToString())
                                {
                                    rdlCorrectiveAction1.Items[i].Selected = true;
                                    break;
                                }
                            }
                            for (int i = 0; i < rdlCorrectiveAction2.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction2.Items[i].Value == logReader["CorrectiveAction2"].ToString())
                                {
                                    rdlCorrectiveAction2.Items[i].Selected = true;
                                    break;
                                }
                            }
                            for (int i = 0; i < rdlCorrectiveAction3.Items.Count; i++)
                            {
                                if (rdlCorrectiveAction3.Items[i].Value == logReader["CorrectiveAction3"].ToString())
                                {
                                    rdlCorrectiveAction3.Items[i].Selected = true;
                                    break;
                                }
                            }
                        }
                        hfMobileId.Value = logReader["MobileId"].ToString() != "" ? logReader["MobileId"].ToString() : "0";
                        logReader.Close();

                    }
                    else
                    {
                        if (logReader.IsClosed == false)
                        {
                            logReader.Close();
                        }
                        mode = "new";
                        SetPage();
                    }

                }
            }
        }        

        private void SetPage()
        {
            if (mode == "new")
            {
                SetPageInEditMode("new");
               
                txtTemp1.Text = "";
                txtTemp2.Text = "";
                txtTemp3.Text = "";               
                SetTime(4, currentTime);              
                txtVerifiedBy.Text = "";
                cldVerifiedDate.SelectedDate = currentTime.Date;
                cldEntryDate.SelectedDate = currentTime.Date;
                rdbMenuItem.Checked = false;
                trClearCorrectiveActions.Style.Add("display", "''");
                trClearCorrectiveActions2.Style.Add("display", "''");
                trClearCorrectiveActions3.Style.Add("display", "''");
                LogError.Text = "";
                LogError.Visible = false;
                rdbIngredient.Checked = true;
                ddlIngredient.Enabled = true;
                rfvIngredient.Enabled = true;
                //rdbNoItem.Checked = true;
                ddlMenuItem.Enabled = false;
                ddlIngredient.SelectedIndex = 0;
                GetInitialData();

                //rfvIngredient.Enabled = false;
                rfvMenuItem.Enabled = false;
                cmdAdd.Visible = true;
                cmdCancel.Visible = true;
                cmdDelete.Visible = false;
                cmdSubmit.Visible = false;              

                if (Request.QueryString["date"] != null)
                {                    
                }
                else
                {
                    //cldMealDate.SelectedDate = DateTime.Today;
                }
                rdlCorrectiveAction1.DataBind();
                rdlCorrectiveAction2.DataBind();
                rdlCorrectiveAction3.DataBind();
                rdlCorrectiveAction1.Visible = true;
                rdlCorrectiveAction2.Visible = true;
                rdlCorrectiveAction3.Visible = true;
                Lbl_CorrectiveAction1.Visible = false;
                Lbl_CorrectiveAction2.Visible = false;
                Lbl_CorrectiveAction3.Visible = false;
            }
            if (mode == "edit")
            {
                SetPageInEditMode("edit");

            }
            grdHotHolding.DataBind();
            ddlIngredient.DataBind();
            ddlIngredient.Items.Insert(0, "Select Input");
            ddlIngredient.SelectedIndex = 0;
            ddlMenuItem.DataBind();
            ddlMenuItem.Items.Insert(0, "Select Output");
            ddlMenuItem.SelectedIndex = 0;

        }
        private void SetPageInEditMode(string type)
        {
            if (type == "new")
            {
                txtTemp1.Enabled = true;
                tpTime1.Enabled = true;
                tpTime2.Enabled = true;
                txtTemp2.Enabled = true;
                txtTemp3.Enabled = true;
                tpTime3.Enabled = true;
                txtVerifiedBy.Enabled = true;
                cldVerifiedDate.Enabled = true;
                cldEntryDate.Enabled = true;
                trClearCorrectiveActions.Style.Add("display", "''");
                trClearCorrectiveActions2.Style.Add("display", "''");
                trClearCorrectiveActions3.Style.Add("display", "''");
                LogError.Text = "";
                LogError.Visible = false;
                rdbMenuItem.Enabled = true;
                rdbIngredient.Enabled = true;
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = true;
            }
            else if (type == "edit")
            {
                txtTemp1.Enabled = false;
                tpTime1.Enabled = false;
                tpTime2.Enabled = false;
                txtTemp2.Enabled = false;
                txtTemp3.Enabled = false;
                tpTime3.Enabled = false;
                LogError.Text = "";
                txtVerifiedBy.Enabled = false;
                cldVerifiedDate.Enabled = false;
                cldEntryDate.Enabled = false;
                rdbMenuItem.Enabled = false;
                rdbIngredient.Enabled = false;
                trClearCorrectiveActions.Style.Add("display", "none");
                trClearCorrectiveActions2.Style.Add("display", "none");
                trClearCorrectiveActions3.Style.Add("display", "none");
                ddlMenuItem.Enabled = false;
                ddlIngredient.Enabled = false;
                cmdAdd.Visible = false;
                cmdCancel.Visible = true;
                cmdDelete.Visible = true;
                cmdSubmit.Visible = false;
            }
        }
        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            LogError.Text = "";
            if (this.IsValid == true)
            {
                if (CheckPage(1))
                {
                    mode = "new";
                    InsertData();
                    SetPage();
                }
                else
                {
                }
            }
        }
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            LogError.Text = "";
            if (this.IsValid == true)
            {
                if (CheckPage(2))
                {
                    mode = "new";
                    SubmitData();
                    SetPage();
                }
            }
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            mode = "new";
            RemoveData();
            SetPage();
        }
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            mode = "new";
            SetPage();

        }
        protected void cmdAddNew_Click(object sender, EventArgs e)
        {
            mode = "new";
            //ddlIngredient.DataBind();
            SetPage();
        }
        private void InsertData()
        {
            FreezerLog freezerLog = new FreezerLog();           
            freezerLog.MealDate = cldEntryDate.SelectedDate;
            if (rdbIngredient.Checked == true)
            {
                freezerLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                freezerLog.MenuItemId = 0;
                freezerLog.FoodItem = 1;
            }
            if (rdbMenuItem.Checked == true)
            {
                freezerLog.IngredientId = 0;
                freezerLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
                freezerLog.FoodItem = 2;
            }           
            if (txtTemp1.Text != "")
            {
                freezerLog.Temp1 = float.Parse(txtTemp1.Text);
            }
            if (tpHour1.Text != "")
            {
                freezerLog.Temp1Time = DateTime.Parse(GetTime(1));
            }
            else
            {
                freezerLog.Temp1Time = DateTime.Now;

            }
            if (txtTemp2.Text != "")
            {
                freezerLog.Temp2 = float.Parse(txtTemp2.Text);
            }
            if (tpHour2.Text != "")
            {
                freezerLog.Temp2Time = DateTime.Parse(GetTime(2));
            }
            else
            {
                freezerLog.Temp2Time = DateTime.Now;

            }
            if (txtTemp3.Text != "")
            {
                freezerLog.Temp3 = float.Parse(txtTemp3.Text);
            }
            if (tpHour3.Text != "")
            {
                freezerLog.Temp3Time = DateTime.Parse(GetTime(3));
            }
            else
            {


                freezerLog.Temp3Time = DateTime.Now;


            }           
            freezerLog.VerifiedBy = txtVerifiedBy.Text;
            freezerLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            freezerLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                freezerLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                freezerLog.UserName = (string)Session["UserName"];
            }
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                freezerLog.CorrectiveAction1 = 0;
            }
            else
            {
                freezerLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            if (rdlCorrectiveAction2.SelectedIndex == -1)
            {
                freezerLog.CorrectiveAction2 = 0;
            }
            else
            {
                freezerLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
            }
            if (rdlCorrectiveAction3.SelectedIndex == -1)
            {
                freezerLog.CorrectiveAction3 = 0;
            }
            else
            {
                freezerLog.CorrectiveAction3 = int.Parse(rdlCorrectiveAction3.SelectedValue);
            }
            ProcessCreateFreezerLog createFreezerLog = new ProcessCreateFreezerLog();
            createFreezerLog.FreezerLog = freezerLog;
            createFreezerLog.Invoke();

        }
        private void SubmitData()
        {
            FreezerLog freezerLog = new FreezerLog();
            if (Request.QueryString["Id"] != null)
            {
                freezerLog.FreezerLogId = int.Parse(Request.QueryString["Id"].ToString());
            }
            else
            {
                if (Session["FreezerLogId"] != null)
                {
                    freezerLog.FreezerLogId = (int)Session["FreezerLogId"];
                }
            }
           
            freezerLog.MealDate = cldEntryDate.SelectedDate;
            if (rdbIngredient.Checked == true)
            {
                freezerLog.IngredientId = int.Parse(ddlIngredient.SelectedValue);
                freezerLog.MenuItemId = 0;
                freezerLog.FoodItem = 1;
            }
            if (rdbMenuItem.Checked == true)
            {
                freezerLog.IngredientId = 0;
                freezerLog.MenuItemId = int.Parse(ddlMenuItem.SelectedValue);
                freezerLog.FoodItem = 2;
            }           
            if (txtTemp1.Text != "")
            {
                freezerLog.Temp1 = float.Parse(txtTemp1.Text);
            }
            if (tpHour1.Text != "")
            {
                freezerLog.Temp1Time = DateTime.Parse(GetTime(1));
            }
            else
            {
                freezerLog.Temp1Time = DateTime.Now;
            }
            if (txtTemp2.Text != "")
            {
                freezerLog.Temp2 = float.Parse(txtTemp2.Text);
            }
            if (tpHour2.Text != "")
            {
                freezerLog.Temp2Time = DateTime.Parse(GetTime(2));
            }
            else
            {


                freezerLog.Temp2Time = DateTime.Now;


            }
            if (txtTemp3.Text != "")
            {
                freezerLog.Temp3 = float.Parse(txtTemp3.Text);
            }
            if (tpHour3.Text != "")
            {
                freezerLog.Temp3Time = DateTime.Parse(GetTime(3));
            }
            else
            {


                freezerLog.Temp3Time = DateTime.Now;


            }
          
            if (rdlCorrectiveAction1.SelectedIndex == -1)
            {
                freezerLog.CorrectiveAction1 = 0;
            }
            else
            {
                freezerLog.CorrectiveAction1 = int.Parse(rdlCorrectiveAction1.SelectedValue);
            }
            if (rdlCorrectiveAction2.SelectedIndex == -1)
            {
                freezerLog.CorrectiveAction2 = 0;
            }
            else
            {
                freezerLog.CorrectiveAction2 = int.Parse(rdlCorrectiveAction2.SelectedValue);
            }
            if (rdlCorrectiveAction3.SelectedIndex == -1)
            {
                freezerLog.CorrectiveAction3 = 0;
            }
            else
            {
                freezerLog.CorrectiveAction3 = int.Parse(rdlCorrectiveAction3.SelectedValue);
            }
            freezerLog.VerifiedBy = txtVerifiedBy.Text;
            freezerLog.VerifiedDate = cldVerifiedDate.SelectedDate;
            freezerLog.EntryDate = DateTime.Parse(txtEntryDate.Text);
            if (Session["KitchenId"] != null)
            {
                freezerLog.KitchenId = KitchenId;
            }
            if (Session["UserName"] != null)
            {
                freezerLog.UserName = (string)Session["UserName"];
            }
            freezerLog.MobileId = int.Parse(hfMobileId.Value);
            ProcessSetFreezerLog setFreezerLog = new ProcessSetFreezerLog();
            setFreezerLog.FreezerLog = freezerLog;
            setFreezerLog.Invoke();


        }
        private void RemoveData()
        {
            FreezerLog FreezerLog = new FreezerLog();
            FreezerLog.FreezerLogId = int.Parse(Request.QueryString["Id"].ToString());
            ProcessDeleteFreezerLog removeFreezerLog = new ProcessDeleteFreezerLog();
            removeFreezerLog.FreezerLog = FreezerLog;
            removeFreezerLog.Invoke();

        }
        private string GetTime(int nPeriod)
        {
            if (nPeriod == 1)
            {
                return tpHour1.Text + ":" + tpMinute1.Text + tpTime1.SelectedValue;
            }
            else if (nPeriod == 2)
            {
                return tpHour2.Text + ":" + tpMinute2.Text + tpTime2.SelectedValue;
            }
            else
            {
                return tpHour3.Text + ":" + tpMinute3.Text + tpTime3.SelectedValue;
            }

        }
        private void SetTime(int nPeriod, DateTime dtTime)
        {
            if (nPeriod == 1)
            {
                tpHour1.Text = dtTime.ToString("hh"); ;
                tpMinute1.Text = dtTime.ToString("mm");
                tpTime1.Text = dtTime.ToString("tt");
            }
            else if (nPeriod == 2)
            {
                tpHour2.Text = dtTime.ToString("hh"); ;
                tpMinute2.Text = dtTime.ToString("mm");
                tpTime2.Text = dtTime.ToString("tt");
            }
            else if (nPeriod == 3)
            {
                tpHour3.Text = dtTime.ToString("hh"); ;
                tpMinute3.Text = dtTime.ToString("mm");
                tpTime3.Text = dtTime.ToString("tt");
            }
            else
            {
                tpHour1.Text = dtTime.ToString("hh"); ;
                tpMinute1.Text = dtTime.ToString("mm");
                tpTime1.Text = dtTime.ToString("tt");
                tpHour2.Text = dtTime.ToString("hh");
                tpMinute2.Text = dtTime.ToString("mm");
                tpTime2.Text = dtTime.ToString("tt");
                tpHour3.Text = dtTime.ToString("hh");
                tpMinute3.Text = dtTime.ToString("mm");
                tpTime3.Text = dtTime.ToString("tt");
            }

        }
        
        public int KitchenId
        {
            get
            {
                if (Session["KitchenId"] != null)
                    return (int)Session["KitchenId"];
                else
                {
                    Response.Redirect("~/ControlPanel/LogOut.aspx");
                    return 0;
                }

            }
        }
    }
}