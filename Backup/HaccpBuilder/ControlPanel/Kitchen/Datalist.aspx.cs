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
using System.Globalization;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;
public partial class ControlPanel_Kitchen_Datalist : System.Web.UI.Page
{
    public static string mode = "NEW";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            int week=1;
            int KitchenId=1;
          

            if (Request.QueryString["week"] != null)
            {
                week = int.Parse(Request.QueryString["week"]);
                KitchenId = (int)Session["KitchenId"];
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            //Check that list has been entered in this week or not         
            ProcessGetResponseHistory getHistory = new ProcessGetResponseHistory();
            IDataReader dr = getHistory.GetHistoryByWeek(KitchenId,week);
           if (dr.Read())
            {                
                Session["HistoryId"] = int.Parse(dr["HistoryId"].ToString());
                txtObserver.Text = dr["Observer"].ToString();
                dr.Close();
                mode = "EDIT";
                getData();
            }
            else
            {
                if (dr.IsClosed == false)
                {
                    dr.Close();
                }

                if (int.Parse(lblIteration.Text) <= 2)
                {
                    ResponseHistory responseHistory = new ResponseHistory();
                   // responseHistory.HistoryId = (int)Session["HistoryId"];
                    responseHistory.KitchenId = (int)Session["KitchenId"];
                    responseHistory.Observer = txtObserver.Text;
                    if (Request.QueryString["week"] != null)
                    {
                        responseHistory.ResponseWeek = int.Parse(Request.QueryString["week"].ToString());
                    }

                    ProcessCreateResponseHistory createResponse = new ProcessCreateResponseHistory();
                    createResponse.ResponseHistory = responseHistory;
                    createResponse.Invoke();

                }
                Session["HistoryId"] = getHistory.GetHistoryId();
                DataList1.DataSource = ObjectDataSource1;
                DataList1.DataBind();
                mode = "NEW";
                setCategory();
            }
           
        }      

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        RadioButton rdbAnswerNo = (RadioButton)e.Item.FindControl("rdbAnswerNo");
        RadioButton rdbAnswerYes = (RadioButton)e.Item.FindControl("rdbAnswerYes");
        TextBox txt = (TextBox)e.Item.FindControl("txtCorrectiveAction");
      
        RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Item.FindControl("vldAnswerValidate");
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
        mode = "EDIT";
        getData();
    }
    private void saveResponses()
    {
       int i, totalItems;
      
      totalItems = DataList1.Items.Count;
        

       for (i = 0; i < totalItems; i++)
       {
           RadioButton rdbAnswerYes = (RadioButton)DataList1.Items[i].FindControl("rdbAnswerYes");
           Label lblQuestionId = (Label)DataList1.Items[i].FindControl("lblQuestionId");
           TextBox txtCorrectiveAction = (TextBox)DataList1.Items[i].FindControl("txtCorrectiveAction");
          
           FoodSafetyResponse userResponse = new FoodSafetyResponse();
           userResponse.KitchenId = (int)Session["KitchenId"];
           userResponse.QuestionId = int.Parse(lblQuestionId.Text);
           userResponse.CorrectiveAction = txtCorrectiveAction.Text;
           userResponse.HistoryId = (int)Session["HistoryId"];
           if (rdbAnswerYes.Checked)
               userResponse.Answer = 1;
           else
               userResponse.Answer = 0;
           if (mode == "NEW")
           {
               if (int.Parse(lblIteration.Text) <= 2)
               {
                   //Update Response History table for Observer  
                   if (int.Parse(lblIteration.Text) <= 2)
                   {
                       ResponseHistory responseHistory = new ResponseHistory();
                       responseHistory.HistoryId = (int)Session["HistoryId"];
                       responseHistory.KitchenId = (int)Session["KitchenId"];
                       responseHistory.Observer = txtObserver.Text;
                       if (Request.QueryString["week"] != null)
                       {
                           responseHistory.ResponseWeek = int.Parse(Request.QueryString["week"].ToString());
                       }                       
                       ProcessSetResponseHistory updateReponseHistory = new ProcessSetResponseHistory();
                       updateReponseHistory.ResponseHistory = responseHistory;
                       updateReponseHistory.Invoke();

                   }
               }
               // Insert in Response table
               ProcessCreateFoodSafetyResponse createReponse = new ProcessCreateFoodSafetyResponse();
               createReponse.FoodSafetyResponse = userResponse;
               createReponse.Invoke();                            
           }
           else
           {
               // Update Reponse table
               ProcessSetFoodSafetyResponse updateResponse = new ProcessSetFoodSafetyResponse();
               updateResponse.FoodSafetyResponse = userResponse;
               updateResponse.Invoke();               
           }
       }
        //Set value of label for next page
       lblIteration.Text = (int.Parse(lblIteration.Text) + 1).ToString();

       if (int.Parse(lblIteration.Text) > 1)
       {
           pnlObserver.Visible = false;

       }       
        //Check whether to open next page in New mode or Edit mode
       ProcessGetFoodSafetyReponse response = new ProcessGetFoodSafetyReponse();
       if (response.IsPageSubmitted((int)Session["KitchenId"], (int)Session["HistoryId"], int.Parse(lblIteration.Text)))
           mode = "EDIT";
       else
           mode = "NEW";

       if (mode == "NEW")
       {           
           DataList1.DataSource = ObjectDataSource1;
           DataList1.DataBind();
           //If all questions completed
           if (DataList1.Items.Count == 0)
           {
               Response.Redirect("Default.aspx");
           }
           setCategory();
       }
       else
       {
           getData();
       }            
          
    }
    private void getData()
    {

        DataList1.DataSource = ObjectDataSource2;
        DataList1.DataBind();
       
        int nHistoryId = (int)Session["HistoryId"];
        int nKitchenId = (int)Session["KitchenId"];

        ProcessGetFoodSafetyReponse response = new ProcessGetFoodSafetyReponse();
        DataSet ds = response.GetResponsesDataSet(nKitchenId,nHistoryId, int.Parse(lblIteration.Text));
        // Implement null check
      //  DataSet ds = response.GetResponsesDataSet( nHistoryId, int.Parse(lblIteration.Text));
        int i = 0;
        
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                RadioButton rdbAnswerYes = (RadioButton)DataList1.Items[i].FindControl("rdbAnswerYes");
                RadioButton rdbAnswerNo = (RadioButton)DataList1.Items[i].FindControl("rdbAnswerNo");
                //Label lblQuestionId = (Label)DataList1.Items[i].FindControl("lblQuestionId");
                TextBox txtCorrectiveAction = (TextBox)DataList1.Items[i].FindControl("txtCorrectiveAction");

                if (int.Parse(row["Answer"].ToString()) == 1)
                { rdbAnswerYes.Checked = true; }
                else
                {
                  rdbAnswerNo.Checked = true;
                    txtCorrectiveAction.Text = row["CorrectiveAction"].ToString();
                }
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

    


   
}
/* Copy Code from corrupted project*/
//public partial class ControlPanel_Kitchen_Datalist : System.Web.UI.Page
//{
//    public static string mode = "NEW";
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        if (!this.IsPostBack)
//        {
//            int nHistoryId = 0;
//            int week = GetWeekNumber(DateTime.Now);
           
//            ProcessGetResponseHistory responseHistory = new ProcessGetResponseHistory();
//            IDataReader dr = responseHistory.GetHistoryByWeek(week);
//            while (dr.Read())
//            {
//                nHistoryId = int.Parse(dr["HistoryId"].ToString());
//            }
//            if (nHistoryId == 0)
//            {
//                Session["HistoryId"] = responseHistory.GetHistoryId();
//                DataList1.DataSource = ObjectDataSource1;
//                DataList1.DataBind();
//                mode = "NEW";
//            }
//            else
//            {
//                mode = "EDIT";
//                Session["HistoryId"] = nHistoryId;
//                getData();
//            }
            
//        }

//      //  DateTime dt = GetFirstDayInWeek(DateTime.Today.Year, week);
//       // week = WeekNumber_Entire4DayWeekRule(DateTime.Now);



//       //IDataReader dr =  responseHistory.GetHistoryDataReader();
//       //while (dr.Read())
//       //{
//       //    ddlHistory.Items.Add(dr[1].ToString());
          
//       //}

    
//    }

   
    
//    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
//    {
//        RadioButton rdbAnswerNo = (RadioButton)e.Item.FindControl("rdbAnswerNo");
//        RadioButton rdbAnswerYes = (RadioButton)e.Item.FindControl("rdbAnswerYes");
//        TextBox txt = (TextBox)e.Item.FindControl("txtCorrectiveAction");
//        //this.lblCategory.Text  += "Bound";
//        RequiredFieldValidator vldAnswerValidate = (RequiredFieldValidator)e.Item.FindControl("vldAnswerValidate");
//        if (vldAnswerValidate != null)
//        {
//            if (mode == "EDIT")
//            {
//                vldAnswerValidate.Enabled = false;

//            }
//            else
//            {
//                vldAnswerValidate.Enabled = true;
//            }
//        }
    
//        if (rdbAnswerNo != null)
//        {
//           rdbAnswerNo.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ",true)");
//        }
//        if (rdbAnswerYes != null)
//        {
//           rdbAnswerYes.Attributes.Add("onclick", "check(" + txt.ClientID + "," + vldAnswerValidate.ClientID + ", false)");
//        }
       


//    }
//    protected void Button1_Click(object sender, EventArgs e)
//    {           
//            saveResponses();        
//    }

//    protected void btnBack_Click(object sender, EventArgs e)
//    {
//        lblIteration.Text = (int.Parse(lblIteration.Text) - 1).ToString();
//        mode = "EDIT";
//        getData();
//    }

//    private void saveResponses()
//    {
//       int i, totalItems;
      
//       totalItems = DataList1.Items.Count;
        

//       for (i = 0; i < totalItems; i++)
//       {
//           RadioButton rdbAnswerYes = (RadioButton)DataList1.Items[i].FindControl("rdbAnswerYes");
//           Label lblQuestionId = (Label)DataList1.Items[i].FindControl("lblQuestionId");
//           TextBox txtCorrectiveAction = (TextBox)DataList1.Items[i].FindControl("txtCorrectiveAction");
          
//           FoodSafetyResponse userResponse = new FoodSafetyResponse();
//           userResponse.KitchenId = "1157910457";
//           userResponse.QuestionId = int.Parse(lblQuestionId.Text);
//           userResponse.CorrectiveAction = txtCorrectiveAction.Text;
//           userResponse.HistoryId = (int)Session["HistoryId"];
//           if (rdbAnswerYes.Checked)
//               userResponse.Answer = 1;
//           else
//               userResponse.Answer = 0;
//           if (mode == "NEW")
//           {
//               ProcessCreateFoodSafetyResponse createReponse = new ProcessCreateFoodSafetyResponse();
//               createReponse.FoodSafetyResponse = userResponse;
//               createReponse.Invoke();              
              
//           }
//           else
//           {
//               ProcessSetFoodSafetyResponse updateResponse = new ProcessSetFoodSafetyResponse();
//               updateResponse.FoodSafetyResponse = userResponse;
//               updateResponse.Invoke();               
//           }

//       }
//       lblIteration.Text = (int.Parse(lblIteration.Text) + 1).ToString();
//       ProcessGetFoodSafetyReponse response = new ProcessGetFoodSafetyReponse();
//       if (response.IsPageSubmitted((int)Session["HistoryId"],int.Parse(lblIteration.Text)))
//           mode = "EDIT";
//       else
//           mode = "NEW";

//       if (mode == "NEW")
//       {
//           DataList1.DataSource = ObjectDataSource1;
//           DataList1.DataBind();
//       }
//       else
//       {
//           getData();
//       }   
                     
             
          
//    }

//    private void getData()
//    {
        
//        DataList1.DataSource = ObjectDataSource2;
//        DataList1.DataBind();
       
//        int nHistoryId = (int)Session["HistoryId"];

//        ProcessGetFoodSafetyReponse response = new ProcessGetFoodSafetyReponse();
//        DataSet ds = response.GetResponsesDataSet(nHistoryId, int.Parse(lblIteration.Text));
//        int i = 0;
        
//            foreach (DataRow row in ds.Tables[0].Rows)
//            {
//                RadioButton rdbAnswerYes = (RadioButton)DataList1.Items[i].FindControl("rdbAnswerYes");
//                RadioButton rdbAnswerNo = (RadioButton)DataList1.Items[i].FindControl("rdbAnswerNo");
//                //Label lblQuestionId = (Label)DataList1.Items[i].FindControl("lblQuestionId");
//                TextBox txtCorrectiveAction = (TextBox)DataList1.Items[i].FindControl("txtCorrectiveAction");

//                if (int.Parse(row["Answer"].ToString()) == 1)
//                { rdbAnswerYes.Checked = true; }
//                else
//                {
//                    rdbAnswerNo.Checked = true;
//                    txtCorrectiveAction.Text = row["CorrectiveAction"].ToString();
//                }
//                i++;
//            }                    
//     }
//    public DateTime GetFirstDayInWeek(int Year, int Weeks)
//    {

//        // Get a local calendar. Adjust for your locale. 

//        GregorianCalendar cal = new GregorianCalendar(GregorianCalendarTypes.USEnglish);

//        // Get a DateTime value representing the first day of the year. 

//        DateTime FirstDay = new DateTime(Year, 1, 1);



//        // Add the number of weeks to the first day. 

//        DateTime CurrentDay = cal.AddWeeks(FirstDay, Weeks);



//        // Subtract the weekday value to get back 

//        // to the first day of the week. Add one 

//        // or not, depending on what you consider 

//        // the first day of the week. Is it the 

//        // 0th or the 1st day? 

//        // cal.AddDays(CurrentDay, cal.GetDayOfWeek(CurrentDay) + 1);
//        return cal.AddDays(CurrentDay, (cal.GetDayOfMonth(CurrentDay) - 1));

//    }


//    public int GetWeekNumber(DateTime dtPassed)
//    {
//        CultureInfo ciCurr = CultureInfo.CurrentCulture;
//        int weekNum = ciCurr.Calendar.GetWeekOfYear(dtPassed, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
//        return weekNum;
//    }

//    private int WeekNumber_Entire4DayWeekRule(DateTime date)
//    {

//        const int JAN = 1;
//        const int DEC = 12;
//        const int LASTDAYOFDEC = 31;
//        const int FIRSTDAYOFJAN = 1;
//        const int THURSDAY = 4;
//        bool ThursdayFlag = false;

//        int DayOfYear = date.DayOfYear;

//        int StartWeekDayOfYear =
//        (int)(new DateTime(date.Year, JAN, FIRSTDAYOFJAN)).DayOfWeek;
//        int EndWeekDayOfYear =
//        (int)(new DateTime(date.Year, DEC, LASTDAYOFDEC)).DayOfWeek;

//        StartWeekDayOfYear = StartWeekDayOfYear;
//        EndWeekDayOfYear = EndWeekDayOfYear;
//        if (StartWeekDayOfYear == 0)
//            StartWeekDayOfYear = 7;
//        if (EndWeekDayOfYear == 0)
//            EndWeekDayOfYear = 7;

//        int DaysInFirstWeek = 8 - (StartWeekDayOfYear);
//        int DaysInLastWeek = 8 - (EndWeekDayOfYear);

//        if (StartWeekDayOfYear == THURSDAY || EndWeekDayOfYear == THURSDAY)
//            ThursdayFlag = true;

//        int FullWeeks = (int)Math.Ceiling((DayOfYear - (DaysInFirstWeek)) / 7.0);

//        int WeekNumber = FullWeeks;

//        if (DaysInFirstWeek >= THURSDAY)
//            WeekNumber = WeekNumber + 1;

//        if (WeekNumber > 52 && !ThursdayFlag)
//            WeekNumber = 1;

//        if (WeekNumber == 0)
//            WeekNumber = WeekNumber_Entire4DayWeekRule(
//            new DateTime(date.Year - 1, DEC, LASTDAYOFDEC));
//        return WeekNumber;
//    }

    


   
//}
