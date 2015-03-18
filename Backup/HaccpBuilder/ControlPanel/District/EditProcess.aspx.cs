using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

public partial class ControlPanel_District_EditProcess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            //Get Process from Database
            if (Request.QueryString["GroupId"] != null)
            {
                hlCancel.NavigateUrl += "?GroupId=" + Request.QueryString["GroupId"];
            }
            if (Request.QueryString["ProcessId"] != null && Request.QueryString["GroupId"] != null)
            {
                GetData();
               
            }
            if (Request.QueryString["Mode"] == "2")
            {
                chkHazard.Enabled = false;
            }

        }
    }
    //protected void btnCreateChecklistGroup_Click(object sender, ImageClickEventArgs e)
    //{
    //    switch (Request.QueryString["Mode"])
    //    {
    //        case "1":
    //            SaveProcess(1);
    //            break;
    //        case "2":
    //            SaveProcess(2);
    //            break;
    //        case "3":
    //            UpdateProcess();
    //            break;
    //    }
    //    string strGroupId = Request.QueryString["GroupId"];
    //    Response.Redirect("~/ControlPanel/District/CustomProcess.aspx?GroupId=" + strGroupId);
    //}
    //protected void btnAddKitchens_Click(object sender, ImageClickEventArgs e)
    // {
    //     Response.Redirect("~/ControlPanel/District/CustomProcess.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"]);
    // }
    private void GetData()
    {
        ProcessGetProcess getProcess = new ProcessGetProcess();
        //ProcessGetFoodSafetyProcesses getProcess = new ProcessGetFoodSafetyProcesses();

        IDataReader drProcess = getProcess.GetProcessById(int.Parse(Request.QueryString["ProcessId"]));
        if (drProcess.Read())
        {
            txtProcess.Text = drProcess["ProcessName"].ToString();
            txtShortName.Text = drProcess["ProcessShortName"].ToString();
            if (drProcess["ProcessText"] != null)
                txtProcessText.Value = drProcess["ProcessText"].ToString();
            //if (drProcess["Field1"] != null)
            //{
            //    txtField1.Value = drProcess["Field1"].ToString();
            //}
            //if (drProcess["Field2"] != null)
            //{
            //    txtField2.Value = drProcess["Field2"].ToString();
            //}
            //if (drProcess["Field3"] != null)
            //{
            //    txtField3.Value = drProcess["Field3"].ToString();
            //}
            //if (drProcess["Field4"] != null)
            //{
            //    txtField4.Value = drProcess["Field4"].ToString();
            //}
            //if (drProcess["Field5"] != null)
            //{
            //    txtField5.Value = drProcess["Field5"].ToString();
            //}
            //if (drProcess["Field6"] != null)
            //{
            //    txtField6.Value = drProcess["Field6"].ToString();
            //}
            //if (drProcess["Field7"] != null)
            //{
            //    txtField7.Value = drProcess["Field7"].ToString();
            //}
            //if (drProcess["Field8"] != null)
            //{
            //    txtField8.Value = drProcess["Field8"].ToString();
            //}
            //if (drProcess["Field9"] != null)
            //{
            //    txtField9.Value = drProcess["Field9"].ToString();
            //}
            //if (drProcess["Field10"] != null)
            //{
            //    txtField10.Value = drProcess["Field10"].ToString();
            //}
           
            //rdbSection.SelectedValue = getSectionId(drProcess["Section"].ToString()).ToString();
            hfIsAdditional.Value = drProcess["Additional"].ToString();
            hfIsCustom.Value = drProcess["Custom"].ToString();
            hfIsSelected.Value = drProcess["Active"].ToString();
            hfGroupId.Value = drProcess["ProcessGroupId"].ToString();
            if (drProcess["HazardActive"] != null)
            {
                chkHazard.Checked = drProcess["HazardActive"].ToString() == "1" ? true : false;
            }
            drProcess.Close();           
            lkbHazardAnalysis.Visible = chkHazard.Checked;
            lkbProcessCategory.Visible = chkHazard.Checked;
            
        }
        if (drProcess.IsClosed == false)
        {
            drProcess.Close();
        }
    }
    private bool CheckData(int nmode)
    {
        lblInfo.Text = "";
        bool RecordExist = false;
        if (nmode == 1)
        {
            ProcessGetProcess process = new ProcessGetProcess();
            DataSet dsProcess = process.GetProcessByName(txtProcess.Text.Trim(),int.Parse(Request.QueryString["GroupId"]));
            if (dsProcess.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "Process name already exists.";
                lblInfo.Visible = true;
                RecordExist= false;
            }
            else
            {
                RecordExist= true;
            }
        }

        if (nmode == 2)
        {
            ProcessGetProcess process = new ProcessGetProcess();
            DataSet dsProcess = process.GetProcessByNameAndId(txtProcess.Text, int.Parse(Request.QueryString["ProcessId"]), int.Parse(hfGroupId.Value));
            if (dsProcess.Tables[0].Rows.Count > 0)
            {
                lblInfo.Text = "Process name already exists.";
                lblInfo.Visible = true;
                RecordExist= false;
            }
            else
            {
                RecordExist= true;
            }

        }
        return RecordExist;

       
      
    }
    private int SaveProcess(int nType)
    {
       
        bool status = CheckData(1);
        //if (status == true)
        //{
            Processes newProcess = new Processes();
            //FoodSafetyProcess newProcess = new FoodSafetyProcess();
            newProcess.Active = 1;
            if (nType == 2)
            {
                newProcess.Additional = 1;
            }
            newProcess.ProcessGroupId = int.Parse(Request.QueryString["GroupId"]);
            newProcess.Custom = 1;
            newProcess.ProcessName = txtProcess.Text;
            newProcess.ProcessShortName = txtShortName.Text;
            newProcess.ProcessText = txtProcessText.Value;
            //if (!txtField1.Value.Equals(string.Empty))
            //{ newProcess.Field1 = txtField1.Value; }
            //if (!txtField2.Value.Equals(string.Empty))
            //{ newProcess.Field2 = txtField2.Value; }
            //if (!txtField3.Value.Equals(string.Empty))
            //{ newProcess.Field3 = txtField3.Value; }
            //if (!txtField4.Value.Equals(string.Empty))
            //{ newProcess.Field4 = txtField4.Value; }
            //if (!txtField5.Value.Equals(string.Empty))
            //{ newProcess.Field5 = txtField5.Value; }
            //if (!txtField6.Value.Equals(string.Empty))
            //{ newProcess.Field6 = txtField6.Value; }
            //if (!txtField7.Value.Equals(string.Empty))
            //{ newProcess.Field7 = txtField7.Value; }
            //if (!txtField8.Value.Equals(string.Empty))
            //{ newProcess.Field8 = txtField8.Value; }
            //if (!txtField9.Value.Equals(string.Empty))
            //{ newProcess.Field9 = txtField9.Value; }
            //if (!txtField10.Value.Equals(string.Empty))
            //{ newProcess.Field10 = txtField10.Value; }
            if (Request.QueryString["ProcessId"] != null)
            {
                newProcess.ProcessId = int.Parse(Request.QueryString["ProcessId"]);
            }

            ProcessCreateProcess createProcess = new ProcessCreateProcess();
            //ProcessCreateFoodSafetyProcess createProcess = new ProcessCreateFoodSafetyProcess();
            createProcess.Process = newProcess;
            int nProcesId = createProcess.Insert();

        //}
        //return status;
            return nProcesId;
    }
    private int UpdateProcess()
    {
        bool status = CheckData(2);
        if (status == true)
        {
            Processes newProcess = new Processes();
            //FoodSafetyProcess newProcess = new FoodSafetyProcess();

            newProcess.Active = Convert.ToByte(hfIsSelected.Value);
            newProcess.Additional = int.Parse(hfIsAdditional.Value);
            newProcess.ProcessGroupId = int.Parse(Request.QueryString["GroupId"]);
            newProcess.Custom = int.Parse(hfIsCustom.Value);
            newProcess.ProcessName = txtProcess.Text;
            newProcess.ProcessShortName = txtShortName.Text;
            if (!txtProcessText.Value.Equals(string.Empty))
                newProcess.ProcessText = txtProcessText.Value;
            //if (!txtField1.Value.Equals(string.Empty))
            //{ newProcess.Field1 = txtField1.Value; }
            //if (!txtField2.Value.Equals(string.Empty))
            //{ newProcess.Field2 = txtField2.Value; }
            //if (!txtField3.Value.Equals(string.Empty))
            //{ newProcess.Field3 = txtField3.Value; }
            //if (!txtField4.Value.Equals(string.Empty))
            //{ newProcess.Field4 = txtField4.Value; }
            //if (!txtField5.Value.Equals(string.Empty))
            //{ newProcess.Field5 = txtField5.Value; }
            //if (!txtField6.Value.Equals(string.Empty))
            //{ newProcess.Field6 = txtField6.Value; }
            //if (!txtField7.Value.Equals(string.Empty))
            //{ newProcess.Field7 = txtField7.Value; }
            //if (!txtField8.Value.Equals(string.Empty))
            //{ newProcess.Field8 = txtField8.Value; }
            //if (!txtField9.Value.Equals(string.Empty))
            //{ newProcess.Field9 = txtField9.Value; }
            //if (!txtField10.Value.Equals(string.Empty))
            //{ newProcess.Field10 = txtField10.Value; }
            if (Request.QueryString["ProcessId"] != null)
            {
                newProcess.ProcessId = int.Parse(Request.QueryString["ProcessId"]);
            }

            ProcessSetProcess setProcess = new ProcessSetProcess();
            // ProcessSetFoodSafetyProcess setProcess = new ProcessSetFoodSafetyProcess();
            setProcess.Process = newProcess;
            setProcess.Invoke();
            return 1;
        }
        return 0;
    }
    protected void btnCreateChecklistGroup_Click1(object sender, EventArgs e)
    {
        int result = 1;
        bool status = CheckData(1);
        switch (Request.QueryString["Mode"])
        {
            case "1":
                if(status == true)
                result=SaveProcess(1);
                break;
            case "2":
                if (status == true)
                result=SaveProcess(2);
                break;
            case "3":
               result= UpdateProcess();
                break;
        }
        if (result == 1)
        {
            string strGroupId = Request.QueryString["GroupId"];
            Response.Redirect("~/ControlPanel/District/CustomProcess.aspx?GroupId=" + strGroupId);
        }
    }
    protected void btnAddKitchens_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/ControlPanel/District/CustomProcess.aspx?GroupId=" + Request.QueryString["GroupId"] + "&Section=" + Request.QueryString["Section"]);
    }

    protected void lkbHazardAnalysis_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Mode"] == "1")
        {
          int nProcessId =  SaveProcess(1);
          Response.Redirect("~/ControlPanel/District/ProcessHazardAnalysis.aspx?ProcessId=" + nProcessId.ToString() + "&GroupId=" + Request.QueryString["GroupId"]);

        }
        if (Request.QueryString["Mode"] == "3")
        {
            Response.Redirect("~/ControlPanel/District/ProcessHazardAnalysis.aspx?ProcessId=" + Request.QueryString["ProcessId"] + "&GroupId=" + Request.QueryString["GroupId"]);
        }
    }

    protected void lkbProcessCategory_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Mode"] == "1")
        {
            int nProcessId = SaveProcess(1);
            Response.Redirect("~/ControlPanel/District/ProcessHaccpPlan.aspx?ProcessId=" + nProcessId.ToString() + "&GroupId=" + Request.QueryString["GroupId"]);
        }
        if (Request.QueryString["Mode"] == "3")
        {
            Response.Redirect("~/ControlPanel/District/ProcessHaccpPlan.aspx?ProcessId=" + Request.QueryString["ProcessId"] + "&GroupId=" + Request.QueryString["GroupId"]);
        }
    }

    protected void chkHazard_CheckedChanged(object sender, EventArgs e)
    {
        ProcessSetProcessHazardAnalysis setHAzardAnalysis = new ProcessSetProcessHazardAnalysis();
        ProcessSetProcessHaccpCategory setHaccpCategory = new ProcessSetProcessHaccpCategory();
        int nProcessId = int.Parse(Request.QueryString["ProcessId"]);
        if (chkHazard.Checked == true)
        {
            lkbHazardAnalysis.Visible = true;
            lkbProcessCategory.Visible = true;
            setHAzardAnalysis.SetProcessHazardAnalysisStatus(nProcessId, 1);
            setHaccpCategory.SetProcessHaccpCategoryStatus(nProcessId, 1);
        }
        else
        {
            lkbHazardAnalysis.Visible = false;
            lkbProcessCategory.Visible = false;
            setHAzardAnalysis.SetProcessHazardAnalysisStatus(nProcessId, 0);
            setHaccpCategory.SetProcessHaccpCategoryStatus(nProcessId, 0);
        }
    }
}
