using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class FoodSafetyChecklistNew : System.Web.UI.Page
    {
        public static string mode = "NEW";
        public static int nWeek, nYear;
        public static DateTime dtDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                /*
                 * ***************************************************
                 * CHANGE FCL FROM WEEK BASIS TO DAILY BASIS 02-10-09
                 *****************************************************

                int week = 1, year = DateTime.Now.Year;
                DateTime dtWeekStartDate;
                int KitchenId = 1;
                if (Request.QueryString["week"] != null)
                {
                    //week = int.Parse(Request.QueryString["week"]);
                    nWeek = int.Parse(Request.QueryString["week"]);
                    KitchenId = (int)Session["KitchenId"];
                    if (Request.QueryString["year"] != null)
                    { //year = int.Parse(Request.QueryString["year"]);
                        nYear = int.Parse(Request.QueryString["year"]);
                    }
                    else
                    {
                        nYear = DateTime.Now.Year;
                    }
                    dtWeekStartDate = GetFirstDayOfWeek(nWeek, nYear);
                    lblEntryDate.Text = dtWeekStartDate.ToLongDateString();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
                // Make Changes for Review Page
                // 12-03-08
                if (Request.QueryString["Section"] != null)
                {
                    lblIteration.Text = Request.QueryString["Section"];
                }
                 * 
                 */
                int KitchenId = 1;
                int nIsComplete = 0;
                if (Request.QueryString["Date"] != null)
                {
                    //week = int.Parse(Request.QueryString["week"]);
                    dtDate = DateTime.Parse(Request.QueryString["Date"]);
                    // nWeek = int.Parse(Request.QueryString["week"]);
                    KitchenId = (int)Session["KitchenId"];
                    lblEntryDate.Text = dtDate.ToLongDateString();
                    // MBS-(03-19-10)
                    // BUG ID - 1877
                    if (Request.QueryString["Section"] != null)
                    {
                        lblIteration.Text = Request.QueryString["Section"].ToString();
                    }

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
                //Check that list has been entered in this week or not         
                ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
                //IDataReader dr = getHistory.GetHistoryByWeek(KitchenId, week);
                IDataReader dr = getHistory.GetHistoryByDate(KitchenId, dtDate);
                // IDataReader dr = getHistory.GetHistoryByWeek(KitchenId, nWeek, nYear);
                if (dr.Read())
                {
                    Session["HistoryId"] = int.Parse(dr["HistoryId"].ToString());
                    txtObserver.Text = dr["Observer"].ToString();
                    nIsComplete = int.Parse(dr["IsComplete"].ToString());
                    dr.Close();
                    mode = "EDIT";
                    if (nIsComplete == 0)
                    {
                        getData();
                    }
                    else
                    {
                        if (int.Parse(lblIteration.Text) <= 2)
                        {
                            // 09-14-10
                            // New Enhancment in FSCL. Make FSCL multiple entry a day
                            //It means data for this date has been entered earlier and now user is going to make another entry in same date.
                            //So insert null data into Response table for related ResponseHistory and Question No.
                            CreateInitialResponse();

                        }

                        setCategory();
                    }
                }
                else
                {
                    if (dr.IsClosed == false)
                    {
                        dr.Close();
                    }
                    if (int.Parse(lblIteration.Text) <= 2)
                    {
                        //It means data for this week is not entered. So insert null data into Response table for related 
                        // ResponseHistory and Question No.
                        CreateInitialResponse();

                    }
                    //mode = "NEW";
                    setCategory();
                }

            }

        }
        protected void grdSafetyChecklist_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            RadioButton rdbAnswerNo = (RadioButton)e.Item.FindControl("rdbAnswerNo");
            RadioButton rdbAnswerYes = (RadioButton)e.Item.FindControl("rdbAnswerYes");
            TextBox txt = (TextBox)e.Item.FindControl("txtCorrectiveAction");

            RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Item.FindControl("vldAnswerValidate");

            // Change at 12-11-08
            if (vldAnswerValidate != null)
            {
                if (mode == "EDIT")
                {
                    vldAnswerValidate.Enabled = false;

                }
                else
                {
                    vldAnswerValidate.Enabled = true;
                }
            }

            if (rdbAnswerNo != null)
            {
                rdbAnswerNo.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ",true)");
            }
            if (rdbAnswerYes != null)
            {
                rdbAnswerYes.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
            }



        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            saveResponses();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            lblIteration.Text = (int.Parse(lblIteration.Text) - 1).ToString();
            if (int.Parse(lblIteration.Text) <= 0)
            {
                Response.Redirect("FacilityTest.aspx");
            }
            else
            {
                mode = "EDIT";
                getData();
            }
        }
        private void saveResponses()
        {
            int i, totalItems;

            totalItems = grdSafetyChecklist.Rows.Count;

            if (int.Parse(lblIteration.Text) < 2)
            {
                ResponseHistory responseHistory = new ResponseHistory();
                responseHistory.HistoryId = (int)Session["HistoryId"];
                responseHistory.KitchenId = (int)Session["KitchenId"];
                responseHistory.Observer = txtObserver.Text;
                if (Request.QueryString["week"] != null)
                {
                    responseHistory.ResponseWeek = int.Parse(Request.QueryString["week"].ToString());
                }
                if (Request.QueryString["year"] != null)
                {
                    responseHistory.Year = int.Parse(Request.QueryString["year"].ToString());
                }
                else
                {
                    responseHistory.Year = DateTime.Now.Year;
                }
                if (Request.QueryString["Date"] != null)
                {
                    responseHistory.EntryDate = DateTime.Parse(Request.QueryString["Date"]);
                }
                else
                {
                    responseHistory.EntryDate = DateTime.Today;
                }


                ProcessSetResponseHistory updateReponseHistory = new ProcessSetResponseHistory();
                updateReponseHistory.ResponseHistory = responseHistory;
                updateReponseHistory.Invoke();

            }
            for (i = 0; i < totalItems; i++)
            {
                RadioButton rdbAnswerYes = (RadioButton)grdSafetyChecklist.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)grdSafetyChecklist.Rows[i].FindControl("rdbAnswerNA");
                HiddenField hfQuestionId = (HiddenField)grdSafetyChecklist.Rows[i].FindControl("hfQuestionId");
                //Label lblQuestionId = (Label)grdSafetyChecklist.Rows[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)grdSafetyChecklist.Rows[i].FindControl("txtCorrectiveAction");

                FoodSafetyResponse userResponse = new FoodSafetyResponse();
                userResponse.KitchenId = (int)Session["KitchenId"];
                userResponse.QuestionId = int.Parse(hfQuestionId.Value);
                userResponse.CorrectiveAction = txtCorrectiveAction.Text;
                userResponse.HistoryId = (int)Session["HistoryId"];
                /// 02-18-11
                //if (rdbAnswerYes.Checked)
                //    userResponse.Answer = 1;
                //else
                //    userResponse.Answer = 0;
                if (rdbAnswerYes.Checked == true)
                {
                    userResponse.Answer = 1;
                }
                else if (rdbAnswerNA.Checked == true)
                {
                    userResponse.Answer = 2;
                }
                else
                {
                    userResponse.Answer = 0;
                }
                //if (mode == "NEW")
                //{
                //    if (int.Parse(lblIteration.Text) <= 2)
                //    {
                //        //Update Response History table for Observer  
                //        if (int.Parse(lblIteration.Text) <= 2)
                //        {
                //            ResponseHistory responseHistory = new ResponseHistory();
                //            responseHistory.HistoryId = (int)Session["HistoryId"];
                //            responseHistory.KitchenId = (int)Session["KitchenId"];
                //            responseHistory.Observer = txtObserver.Text;
                //            if (Request.QueryString["week"] != null)
                //            {
                //                responseHistory.ResponseWeek = int.Parse(Request.QueryString["week"].ToString());
                //            }
                //            ProcessSetResponseHistory updateReponseHistory = new ProcessSetResponseHistory();
                //            updateReponseHistory.ResponseHistory = responseHistory;
                //            updateReponseHistory.Invoke();

                //        }
                //    }
                //    // Insert in Response table
                //    ProcessCreateFoodSafetyResponse createReponse = new ProcessCreateFoodSafetyResponse();
                //    createReponse.FoodSafetyResponse = userResponse;
                //    createReponse.Invoke();
                //}
                //else
                //{
                // Update Reponse table
                
                ProcessSetFoodSafetyResponse updateResponse = new ProcessSetFoodSafetyResponse();
                updateResponse.FoodSafetyResponse = userResponse;
                updateResponse.Invoke();

                //}
            }
            //Set value of label for next page
            lblIteration.Text = (int.Parse(lblIteration.Text) + 1).ToString();

            if (int.Parse(lblIteration.Text) > 1)
            {
                pnlObserver.Visible = false;

            }

            if (int.Parse(lblIteration.Text) > 11)
            {
                Response.Redirect("~/ControlPanel/Kitchen/FoodSafetyChecklistReview.aspx?week=" + nWeek + "&year=" + nYear + "&Date=" + dtDate.ToShortDateString());
                //Response.Redirect("~/ControlPanel/Kitchen/FoodSafetyChecklisReview.aspx?week=" + Request.QueryString["week"] + "&year=" + Request.QueryString["year"]);
            }
            if (int.Parse(lblIteration.Text) <= 11)
            {
                getData();
            }
            else
            {
                Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
            }
            //Check whether to open next page in New mode or Edit mode
            //ProcessGetFoodSafetyReponse response = new ProcessGetFoodSafetyReponse();
            //if (response.IsPageSubmitted((int)Session["KitchenId"], (int)Session["HistoryId"], int.Parse(lblIteration.Text)))
            //    mode = "EDIT";
            //else
            //    mode = "NEW";

            //if (mode == "NEW")
            //{
            //    grdSafetyChecklist.DataSource = ObjectDataSource1;
            //    grdSafetyChecklist.DataBind();
            //    //If all questions completed
            //    if (grdSafetyChecklist.Rows.Count == 0)
            //    {
            //        Response.Redirect("Default.aspx");
            //    }
            //    setCategory();
            //}
            //else
            //{
            //    getData();
            //}

        }
        private void getData()
        {
            // Change on 13-11-08
            grdSafetyChecklist.DataSource = ObjectDataSource2;
            grdSafetyChecklist.DataBind();

            int nHistoryId = (int)Session["HistoryId"];
            int nKitchenId = (int)Session["KitchenId"];

            ProcessGetFoodSafetyReponse response = new ProcessGetFoodSafetyReponse();
            DataSet ds = response.GetResponsesDataSet(nKitchenId, nHistoryId, int.Parse(lblIteration.Text));
            // Implement null check
            //  DataSet ds = response.GetResponsesDataSet( nHistoryId, int.Parse(lblIteration.Text));
            int i = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                RadioButton rdbAnswerYes = (RadioButton)grdSafetyChecklist.Rows[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)grdSafetyChecklist.Rows[i].FindControl("rdbAnswerNA");
                RadioButton rdbAnswerNo = (RadioButton)grdSafetyChecklist.Rows[i].FindControl("rdbAnswerNo");
                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)grdSafetyChecklist.Rows[i].FindControl("vldAnswerValidate");
                //Label lblQuestionId = (Label)grdSafetyChecklist.Items[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)grdSafetyChecklist.Rows[i].FindControl("txtCorrectiveAction");

                if (int.Parse(row["Answer"].ToString()) == 1)
                {
                    rdbAnswerYes.Checked = true;
                    vldAnswerValidate.Enabled = false;
                }
                if (int.Parse(row["Answer"].ToString()) == 2)
                {
                    rdbAnswerNA.Checked = true;
                    vldAnswerValidate.Enabled = false;
                }
                if (int.Parse(row["Answer"].ToString()) == 0)
                {
                    rdbAnswerNo.Checked = true;
                    txtCorrectiveAction.Text = row["CorrectiveAction"].ToString();
                    vldAnswerValidate.Enabled = true;
                    txtCorrectiveAction.Enabled = true;
                }
                // Change on 13-11-08
                //02-18-11 Optimized the code
                //if (rdbAnswerYes.Checked == true)
                //{
                //    vldAnswerValidate.Enabled = false;

                //}
                //if (rdbAnswerNo.Checked == true && txtCorrectiveAction.Text == "")
                //{
                //    vldAnswerValidate.Enabled = true;
                //    txtCorrectiveAction.Enabled = true;
                //}
                i++;
            }

            setCategory();
        }
        public DateTime GetFirstDayInWeek(int Year, int Weeks)
        {

            // Get a local calendar. Adjust for your locale. 

            GregorianCalendar cal = new GregorianCalendar(GregorianCalendarTypes.USEnglish);

            // Get a DateTime value representing the first day of the year. 

            DateTime FirstDay = new DateTime(Year, 1, 1);



            // Add the number of weeks to the first day. 

            DateTime CurrentDay = cal.AddWeeks(FirstDay, Weeks);



            // Subtract the weekday value to get back 

            // to the first day of the week. Add one 

            // or not, depending on what you consider 

            // the first day of the week. Is it the 

            // 0th or the 1st day? 

            // cal.AddDays(CurrentDay, cal.GetDayOfWeek(CurrentDay) + 1);
            return cal.AddDays(CurrentDay, (cal.GetDayOfMonth(CurrentDay) - 1));

        }
        public void setCategory()
        {
            int categoryId = int.Parse(lblIteration.Text);

            switch (categoryId)
            {
                case 1:
                    lblSection.Text = "Personal Hygiene";
                    /// 02-18-11
                    /// To make Observer field visible at First page
                    pnlObserver.Visible = true;
                    break;
                case 2:
                    lblSection.Text = "Food Preparation";
                    break;
                case 3:
                    lblSection.Text = "Hot Holding";
                    break;
                case 4:
                    lblSection.Text = "Cold Holding";
                    break;
                case 5:
                    lblSection.Text = "Refrigerator, Freezer, And Milk Cooler";
                    break;
                case 6:
                    lblSection.Text = "Food Storage and Dry Storage";
                    break;
                case 7:
                    lblSection.Text = "Cleaning and Sanitizing";
                    break;
                case 8:
                    lblSection.Text = "Utensils and Equipment";
                    break;
                case 9:
                    lblSection.Text = "Large Equipment";
                    break;
                case 10:
                    lblSection.Text = "Garbage Storage and Disposal";
                    break;
                case 11:
                    lblSection.Text = "Pest Control";
                    break;


            }

        }
        public int GetWeekNumber(DateTime dtPassed)
        {
            CultureInfo ciCurr = CultureInfo.CurrentCulture;
            int weekNum = ciCurr.Calendar.GetWeekOfYear(dtPassed, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
            return weekNum;
        }
        public DateTime GetFirstDayOfWeek(int nWeek, int nYear)
        {
            // set date to the first day of the year
            DateTime dt = new DateTime(nYear, 1, 1);
            int weekNumber = nWeek;
            // mult by 7 to get the day number of the year
            int days = (weekNumber - 1) * 7;
            // get the date of that day
            DateTime dt1 = dt.AddDays(days);
            // check what day of week it is
            DayOfWeek dow = dt1.DayOfWeek;
            // to get the first day of that week - subtract the value of the DayOfWeek enum from the date
            //DateTime startDateOfWeek = dt1.AddDays(-(int)dow);
            DateTime startDateOfWeek = dt1.AddDays(5);
            //lblEntryDate.Text = dow.ToString();
            return startDateOfWeek;
        }
        private int WeekNumber_Entire4DayWeekRule(DateTime date)
        {

            const int JAN = 1;
            const int DEC = 12;
            const int LASTDAYOFDEC = 31;
            const int FIRSTDAYOFJAN = 1;
            const int THURSDAY = 4;
            bool ThursdayFlag = false;

            int DayOfYear = date.DayOfYear;

            int StartWeekDayOfYear =
            (int)(new DateTime(date.Year, JAN, FIRSTDAYOFJAN)).DayOfWeek;
            int EndWeekDayOfYear =
            (int)(new DateTime(date.Year, DEC, LASTDAYOFDEC)).DayOfWeek;

            //StartWeekDayOfYear = StartWeekDayOfYear;
            //EndWeekDayOfYear = EndWeekDayOfYear;
            if (StartWeekDayOfYear == 0)
                StartWeekDayOfYear = 7;
            if (EndWeekDayOfYear == 0)
                EndWeekDayOfYear = 7;

            int DaysInFirstWeek = 8 - (StartWeekDayOfYear);
            int DaysInLastWeek = 8 - (EndWeekDayOfYear);

            if (StartWeekDayOfYear == THURSDAY || EndWeekDayOfYear == THURSDAY)
                ThursdayFlag = true;

            int FullWeeks = (int)Math.Ceiling((DayOfYear - (DaysInFirstWeek)) / 7.0);

            int WeekNumber = FullWeeks;

            if (DaysInFirstWeek >= THURSDAY)
                WeekNumber = WeekNumber + 1;

            if (WeekNumber > 52 && !ThursdayFlag)
                WeekNumber = 1;

            if (WeekNumber == 0)
                WeekNumber = WeekNumber_Entire4DayWeekRule(
                new DateTime(date.Year - 1, DEC, LASTDAYOFDEC));
            return WeekNumber;
        }
        protected void grdSafetyChecklist_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButton rdbAnswerNo = (RadioButton)e.Row.FindControl("rdbAnswerNo");
                RadioButton rdbAnswerYes = (RadioButton)e.Row.FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNA = (RadioButton)e.Row.FindControl("rdbAnswerNA");
                TextBox txt = (TextBox)e.Row.FindControl("txtCorrectiveAction");

                RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Row.FindControl("vldAnswerValidate");
                // Change on 12-11-08
                if (vldAnswerValidate != null)
                {
                    // Change on 13-11-08
                    //if (mode == "EDIT")
                    //{
                    //    vldAnswerValidate.Enabled = true;

                    //}
                    //else
                    //{
                    //    vldAnswerValidate.Enabled = false;
                    //}
                }

                if (rdbAnswerNo != null)
                {
                    rdbAnswerNo.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ",true)");
                }
                if (rdbAnswerYes != null)
                {
                    rdbAnswerYes.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
                }
                if (rdbAnswerNA != null)
                {
                    rdbAnswerNA.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
                }

            }
        }
        private void CreateInitialResponse()
        {
            // This function will insert new entry in Response History table
            // Then on base of HistoryId and Question No. enter null data in Reponse table to populate Grid
            ResponseHistory responseHistory = new ResponseHistory();
            responseHistory.KitchenId = (int)Session["KitchenId"];
            responseHistory.Observer = txtObserver.Text;
            responseHistory.Year = DateTime.Now.Year;
            if (Request.QueryString["week"] != null)
            {
                responseHistory.ResponseWeek = int.Parse(Request.QueryString["week"].ToString());
            }
            if (Request.QueryString["year"] != null)
            {
                responseHistory.Year = int.Parse(Request.QueryString["year"].ToString());
            }
            else
            {
                responseHistory.Year = DateTime.Now.Year;
            }
            if (Request.QueryString["Date"] != null)
            {
                responseHistory.EntryDate = DateTime.Parse(Request.QueryString["Date"]);
            }
            else
            {
                responseHistory.EntryDate = DateTime.Today;
            }
            responseHistory.MobileId = 0;
            ProcessCreateResponseHistory createResponse = new ProcessCreateResponseHistory();
            createResponse.ResponseHistory = responseHistory;
            createResponse.Invoke();
            ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
            Session["HistoryId"] = getHistory.GetHistoryId();
            //ProcessFoodSafetyQuestions questions = new ProcessFoodSafetyQuestions();
            ProcessGetFoodSafetyQuestions questions = new ProcessGetFoodSafetyQuestions();

            IDataReader dr = questions.GetQuestions((int)Session["KitchenId"]);
            while (dr.Read())
            {
                //Insert null data in Response Table
                FoodSafetyResponse userResponse = new FoodSafetyResponse();
                userResponse.KitchenId = (int)Session["KitchenId"];
                userResponse.QuestionId = int.Parse(dr["QuestionId"].ToString());

                userResponse.HistoryId = (int)Session["HistoryId"];
                ProcessCreateFoodSafetyResponse createReponse = new ProcessCreateFoodSafetyResponse();
                createReponse.FoodSafetyResponse = userResponse;
                createReponse.Invoke();
            }

            grdSafetyChecklist.DataSource = ObjectDataSource2;
            grdSafetyChecklist.DataBind();
            mode = "edit";
            if (dr.IsClosed == false)
            {
                dr.Close();
            }
        }
    }
}