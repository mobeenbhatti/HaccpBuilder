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

public partial class ControlPanel_Kitchen_CustomInventory : System.Web.UI.Page
{
    public string mode = "new";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            //cmdBack.Attributes.Add("onclick", "MoveBack( )");
            GetInventoryTypes();
            if (Request.QueryString["Id"] != null)
            {
                // ItemId = int.Parse(Request.QueryString["Id"]);
                mode = "edit";
                SetPage();
                GetData();
            }
        }
      
    }

    private void GetInventoryTypes()
    {
        ProcessGetCustomInventory getInventoryTypes = new ProcessGetCustomInventory();

        DataSet ds = getInventoryTypes.GetCustomTypes((int)Session["KitchenId"]);
        if (ds.Tables[0].Rows.Count > 0)
        {           
            this.rdlType.DataSource = ds;
            this.rdlType.DataBind();
            ListItem item = new ListItem();
            item.Text = "Other: (please describe)";
            item.Value = "999";
            item.Attributes.Add("onclick", "javascript:SetTextBox('" + item.Value + "')");
            rdlType.Items.Add(item);
            //new ListItem("Other: (please describe)", "999");
            //rdlType.Items.Add(item);
        
       } 
    }
    private bool CheckData()
    {
        
        bool RecordExist = true;
        int index;
        if (txtType.Text.Trim() != "" && txtType.Enabled==true)
        {

            for (index = 1; index < rdlType.Items.Count; index++)
            {
               
                if (rdlType.Items[index].Text == txtType.Text.Trim())
                {
                    lblError.Text = "ItemType already exists.Please select from available ItemTypes.";
                    lblError.Visible = true;
                    RecordExist = false;
                    break;
                }
                else
                {
                    RecordExist = true;
                }
              
            }
        }

        for (index = 1; index < rdlType.Items.Count; index++)
        {
            if (rdlType.Items[index].Selected == true)
            {
                ViewState["SelectedItem"] = rdlType.SelectedIndex.ToString();
            }
        }
        return RecordExist;
    }
    private void GetData()
    {
        KitchenInventoryCustom customInventory = new KitchenInventoryCustom();
        customInventory.KitchenInventoryCustomId = int.Parse(Request.QueryString["Id"]);
        ProcessGetKitchenInventoryCustom getCustomInventory = new ProcessGetKitchenInventoryCustom();
        getCustomInventory.KitchenInventoryCustom = customInventory;
        getCustomInventory.Invoke();
        IDataReader invnetoryReader = getCustomInventory.ResultSet;
        if (invnetoryReader.Read())
        {
            txtName.Text = invnetoryReader["Name"].ToString();
            txtQuantity.Text = invnetoryReader["Quantity"].ToString();
            for (int i = 0; i < rdlType.Items.Count; i++)
            {
                if (rdlType.Items[i].Value == invnetoryReader["TypeId"].ToString())
                {
                    rdlType.Items[i].Selected = true;
                    break;
                }
            }
            if (invnetoryReader["TypeId"].ToString() == "9")
            {
                txtType.Enabled = true;
                txtType.Text = invnetoryReader["InventoryTypeDesc"].ToString(); 
            }
            invnetoryReader.Close();       
        }


    }
    private void SetPage()
    {
        if (mode == "new")
        {
            txtType.Enabled = false;
            txtName.Text = "";
            //txtQuantity.Text = "";
            txtType.Text = "";
            rdlType.SelectedIndex = -1;
            lblError.Text = "";
            cmdAdd.Visible=true;
            cmdDelete.Visible = false;
            cmdSubmit.Visible = false;
                       
        }
        if (mode == "edit")
        {
          
            cmdAdd.Visible = false;
            cmdDelete.Visible = true;
            lblError.Text = "";
            cmdSubmit.Visible = true;           
        }
        grdCustomInventory.DataBind();
        GetInventoryTypes();
    }
   
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
       bool status = false;
        lblError.Text = "";
        if (CheckData() == true)
        {
          
            mode = "new";
            InsertData();
            SetPage();
            status = true;
        }
        if (status==false)
        {
            GetInventoryTypes();
            if (ViewState["SelectedItem"] != null)
            {
                if (int.Parse(ViewState["SelectedItem"].ToString()) == 7)
                {
                    rdlType.SelectedIndex = 7;
                    txtType.Enabled = true;
                }
                else
                {
                    rdlType.SelectedIndex = int.Parse(ViewState["SelectedItem"].ToString());
                    txtType.Enabled = false;

                }
            }
        }
    }
    protected void cmdSubmit_Click(object sender, EventArgs e)
    {
        bool status = false;
        lblError.Text = "";

        if (CheckData() == true)
        {
            mode = "new";
            SubmitData();
            SetPage();
            status = true;
        }
        if (status == false)
        {
            GetInventoryTypes();
            if (ViewState["SelectedItem"] != null)
            {
                if (int.Parse(ViewState["SelectedItem"].ToString()) == 7)
                {
                    rdlType.SelectedIndex = 7;
                    txtType.Enabled = true;
                }
                else
                {
                    rdlType.SelectedIndex = int.Parse(ViewState["SelectedItem"].ToString());
                    txtType.Enabled = false;

                }
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
        SetPage();
    }
    private void InsertData()
    {
        KitchenInventoryCustom customInventory = new KitchenInventoryCustom();
        customInventory.Name = txtName.Text;
        customInventory.Quantity = int.Parse(txtQuantity.Text);
        customInventory.Selected = 1;
        customInventory.KitchenId= (int)Session["KitchenId"];
        customInventory.CustomInventoryType = int.Parse(rdlType.SelectedItem.Value);
        if (rdlType.SelectedValue == "999")
        {
            customInventory.CustomInventoryDesc = txtType.Text.Trim();
        }
        else
        {
            customInventory.CustomInventoryDesc = rdlType.SelectedItem.Text;
        }

        ProcessCreateKitchenInventoryCustom createCustomInventory = new ProcessCreateKitchenInventoryCustom();
        createCustomInventory.KitchenInventoryCustom = customInventory;
        createCustomInventory.Invoke();        

    }
    private void SubmitData()
    {
        KitchenInventoryCustom customInventory = new KitchenInventoryCustom();
        customInventory.KitchenInventoryCustomId = int.Parse(Request.QueryString["Id"].ToString());
        customInventory.Name = txtName.Text;
        customInventory.Quantity = int.Parse(txtQuantity.Text);
        customInventory.Selected = 1;
        customInventory.KitchenId = (int)Session["KitchenId"];
        customInventory.CustomInventoryType = int.Parse(rdlType.SelectedItem.Value);
        customInventory.CustomInventoryDesc = rdlType.SelectedItem.Text;
        if (rdlType.SelectedValue == "999")
        {
            customInventory.CustomInventoryDesc = txtType.Text.Trim();
        }
        ProcessSetKitchenInventoryCustom setCustomInventory = new ProcessSetKitchenInventoryCustom();
        setCustomInventory.KitchenInventoryCustom = customInventory;
        setCustomInventory.Invoke();        

    }
    private void RemoveData()
    {
        KitchenInventoryCustom customInventory = new KitchenInventoryCustom();
        customInventory.KitchenInventoryCustomId = int.Parse(Request.QueryString["Id"].ToString());
        ProcessDeleteKitchenInventoryCustom removeCustomInventory = new ProcessDeleteKitchenInventoryCustom();
        removeCustomInventory.KitchenInventoryCustom = customInventory;
        removeCustomInventory.Invoke();
    }
    protected void rdlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtType.Text = "Changed";
        
    }

    protected void txtType_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void cmdBack_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    protected void rdlType_DataBound(object sender, EventArgs e)
    {
        RadioButtonList rbl = (RadioButtonList)sender;
        foreach (ListItem li in rbl.Items)
        {
            //li.Attributes.Add("onclick", "javascript:SetTExtBox('" + li.Value + "')");
            li.Attributes.Add("onclick", "javascript:SetTextBox('" + li.Value + "')");
        }
        //.Attributes.Add("onclick", "checkDefault(" + chkDefault.ClientID + "," + chkCustom.ClientID + "," + chkRemove.ClientID + ")");
    }
}
