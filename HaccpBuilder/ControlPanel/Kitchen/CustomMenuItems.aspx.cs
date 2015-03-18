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

public partial class ControlPanel_Kitchen_CustomMenuItems : System.Web.UI.Page
{
    public string mode = "new";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Session["FoodGroup"] != null)
            {
                cmdBack.Attributes.Add("onclick", "MoveBack(" + (int)Session["FoodGroup"] + ")");
            }
            else
            {
                cmdBack.Attributes.Add("onclick", "MoveBack(" + 20 + ")");
            }
            GetInitialData();
            if (Request.QueryString["Id"] != null)
            {
                // ItemId = int.Parse(Request.QueryString["Id"]);
                mode = "edit";
                SetPage();
                GetData();
            }
        }
    }

    private void GetInitialData()
    {
        ProcessGetCustomMenuItems getMenuItem = new ProcessGetCustomMenuItems();

        IDataReader drFoodGroup = getMenuItem.GetFoodGroup();
        while (drFoodGroup.Read())
        {
            ListItem foodGroupItem = new ListItem();
            foodGroupItem.Text = drFoodGroup["FoodGroup"].ToString();
            foodGroupItem.Value = drFoodGroup["FoodGroupId"].ToString();
            this.ddlFoodGroup.Items.Add(foodGroupItem);          
        }
        if (drFoodGroup.IsClosed == false)
        {
            drFoodGroup.Close();
        }
        IDataReader drProcess = getMenuItem.GetProcesses();
        while (drProcess.Read())
        {
            ListItem processItem = new ListItem();
            processItem.Text = drProcess["ProcessName"].ToString();
            processItem.Value = drProcess["ProcessId"].ToString();
            this.rdlProcess.Items.Add(processItem);            
        }
        if (drProcess.IsClosed == false)
        {
            drProcess.Close();
        }

        SetControls(int.Parse(ddlFoodGroup.SelectedValue));
        


    }
    private bool CheckData()
    {
        bool lCheck = true, lProcess = false ;
        int i;
        if (rdbOnsite.Enabled == true)
        {
            if (rdbOnsite.Checked != true && rdbPreMade.Checked != true)
            {
                lblError.Text = "Please select preparation type.<br>";
                lCheck = false;
            }

            for (i = 0; i < rdlProcess.Items.Count; i++)
            {
                if (rdlProcess.Items[i].Selected == true)
                {
                    lProcess = true;
                    break;
                }
            }

            if (lProcess == false)
            {
                lblError.Text = "Please select process type.<br>";
                lCheck = false;
            }
        }

        return lCheck;
    }
    private void GetData()
    {
        KitchenMenuCustomItem customMenuItem = new KitchenMenuCustomItem();
        customMenuItem.KitchenMenuCustomId = int.Parse(Request.QueryString["Id"]);
        ProcessGetKitchenMenuCustomItem getCustomMenuItem = new ProcessGetKitchenMenuCustomItem();
        getCustomMenuItem.KitchenMenuCustomItem = customMenuItem;
        getCustomMenuItem.Invoke();
        IDataReader menuItemReader = getCustomMenuItem.ResultSet;
        if (menuItemReader.Read())
        {
            txtName.Text = menuItemReader["Name"].ToString();
            txtRecipeNumber.Text = menuItemReader["RecipeNumber"].ToString();
            ddlFoodGroup.SelectedValue = menuItemReader["FoodGroupId"].ToString();
            if (int.Parse(menuItemReader["PreparationTypeId"].ToString()) == 1)
            {
                rdbPreMade.Checked = true;
            }
            if (int.Parse(menuItemReader["PreparationTypeId"].ToString()) == 2)
            {
                rdbOnsite.Checked = true;
            }
            if (int.Parse(menuItemReader["Ready"].ToString()) == 1)
            {
                rdbYes.Checked = true;
            }
            else
            {
                rdbNo.Checked = true;
            }
            rdlProcess.SelectedValue = menuItemReader["ProcessId"].ToString();
            txtRecipe.Text = menuItemReader["Instructions"].ToString();
            SetControls(int.Parse(ddlFoodGroup.SelectedValue));
            menuItemReader.Close();
        }
        if (menuItemReader.IsClosed == false)
        {
            menuItemReader.Close();
        }

    }
    private void SetControls(int nFoodGroupId)
    {
        if (nFoodGroupId > 9)
        {
            rdbOnsite.Enabled = false;
            rdbPreMade.Enabled = false;
            rdlProcess.Enabled = false;
            reqValidatePreparation.Enabled = false;

            rdbOnsite.Checked = false;
            rdbPreMade.Checked = false;
            for (int i = 0; i < rdlProcess.Items.Count; i++)
            {
                rdlProcess.Items[i].Selected = false;
            }
        }
        else
        {
            rdbOnsite.Enabled = true;
            rdbPreMade.Enabled = true;
            rdlProcess.Enabled = true;
            reqValidatePreparation.Enabled = true;
        }
    }
    private void SetPage()
    {
        if (mode == "new")
        {
            txtName.Text = "";
            txtRecipe.Text = "";
            txtRecipeNumber.Text = "";
            ddlFoodGroup.SelectedIndex = -1;
            rdlProcess.SelectedIndex = -1;
            rdbYes.Checked = false;
            rdbNo.Checked = false;
            rdbOnsite.Checked = false;
            rdbPreMade.Checked = false;           
            cmdAdd.Visible = true;
            cmdDelete.Visible = false;
            cmdSubmit.Visible = false;

        }
        if (mode == "edit")
        {
            cmdAdd.Visible = false;
            cmdDelete.Visible = true;
            cmdSubmit.Visible = true;
        }
        lblError.Text = "";
        grdCustomMenuItem.DataBind();
    }
    protected void cmdBack_Click(object sender, EventArgs e)
    {
        
    }
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
        if (CheckData() == true)
        {
            mode = "new";
            InsertData();
            SetPage();
        }
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        if (CheckData() == true)
        {
            mode = "new";
            SubmitData();
            SetPage();
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
    }
    private void InsertData()
    {
        KitchenMenuCustomItem customMenuItem = new KitchenMenuCustomItem();
        customMenuItem.Name = txtName.Text;
        customMenuItem.FoodGroupId = int.Parse(ddlFoodGroup.SelectedValue);
        customMenuItem.Instructions = txtRecipe.Text;
        if(Session["KitchenId"] != null)
        {
            customMenuItem.KitchenId=(int)Session["KitchenId"];
        }
        if (rdbOnsite.Enabled == false)
        {
            customMenuItem.PreparationTypeId = 3;
            customMenuItem.ProcessId = 0;
        }
        else
        {
        customMenuItem.ProcessId = int.Parse(rdlProcess.SelectedValue);
        if (rdbPreMade.Checked == true)
        {
            customMenuItem.PreparationTypeId = 1;
        }
        else
        
            if (rdbOnsite.Checked == true)
            {
                customMenuItem.PreparationTypeId = 2;
            }
           
        }
        
       
        if(rdbYes.Checked == true)
        {
             customMenuItem.Ready = 1;
        }
        else
        {
            customMenuItem.Ready=0;
        }
        if (txtRecipeNumber.Text != "")
        {
            customMenuItem.RecipeNumber = txtRecipeNumber.Text;
        }
        else
        {
            customMenuItem.RecipeNumber = null;
        }
        customMenuItem.Selected =1;

        ProcessCreateKitchenMenuCustomItem createCustomMenuItem= new ProcessCreateKitchenMenuCustomItem();
        createCustomMenuItem.KitchenMenuCustomItem = customMenuItem;
        createCustomMenuItem.Invoke();        

    }
    private void SubmitData()
    {
        KitchenMenuCustomItem customMenuItem = new KitchenMenuCustomItem();
        customMenuItem.KitchenMenuCustomId = int.Parse(Request.QueryString["Id"].ToString());
        customMenuItem.Name = txtName.Text;
        customMenuItem.FoodGroupId = int.Parse(ddlFoodGroup.SelectedValue);
        customMenuItem.Instructions = txtRecipe.Text;
        if (Session["KitchenId"] != null)
        {
            customMenuItem.KitchenId = (int)Session["KitchenId"];
        }
        if (rdbOnsite.Enabled == false)
        {
            customMenuItem.PreparationTypeId = 3;
            customMenuItem.ProcessId = 0;
        }
        else
        {
            customMenuItem.ProcessId = int.Parse(rdlProcess.SelectedValue);
            if (rdbPreMade.Checked == true)
            {
                customMenuItem.PreparationTypeId = 1;
            }
            else

                if (rdbOnsite.Checked == true)
                {
                    customMenuItem.PreparationTypeId = 2;
                }

        }
       
        if (rdbYes.Checked == true)
        {
            customMenuItem.Ready = 1;
        }
        else
        {
            customMenuItem.Ready = 0;
        }
        if (txtRecipeNumber.Text != "")
        {
            customMenuItem.RecipeNumber = txtRecipeNumber.Text;
        }
        else
        {
            customMenuItem.RecipeNumber = null;
        }
        customMenuItem.Selected = 1;

        ProcessSetKitchenMenuCustomItem setCustomMenuItem = new ProcessSetKitchenMenuCustomItem();
        setCustomMenuItem.KitchenMenuCustomItem = customMenuItem;
        setCustomMenuItem.Invoke();        

    }
    private void RemoveData()
    {
        KitchenMenuCustomItem customMenuItem = new KitchenMenuCustomItem();
        customMenuItem.KitchenMenuCustomId = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeleteKitchenMenuCustomItem removeCustomMenuItem = new ProcessDeleteKitchenMenuCustomItem();
        removeCustomMenuItem.KitchenMenuCustomItem = customMenuItem;
        removeCustomMenuItem.Invoke();
    }
    protected void rdlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (rdlType.SelectedValue == "999")
        //    txtType.Enabled = true;
        //else
        //    txtType.Enabled = false;
    }

    protected void cmdBack_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/ControlPanel/Kitchen/MenuItemsReview.aspx");
        //if (Request.QueryString["FoodGroup"] != null)
        //{
        //    Response.Redirect("~/ControlPanel/Kitchen/SetupMenuItemHaccp.aspx?foodgroup=" + Request.QueryString["FoodGroup"].ToString());
        //}
        //else
        //{
        //    Response.Redirect("~/ControlPanel/Kitchen/SetupMenuItemHaccp.aspx");
        //}
    }
    protected void ddlFoodGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetControls(int.Parse(ddlFoodGroup.SelectedValue));

    }
}
