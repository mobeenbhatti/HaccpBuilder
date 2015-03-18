using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SchoolHaccp.BusinessLogic;
using SchoolHaccp.Common;

namespace HaccpBuilder.ControlPanel.Kitchen
{
    public partial class SetupInventoryHaccpNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToShortDateString();




        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/Default.aspx");
        }



        private void saveInventoryItems()
        {
            int i, totalItems;
            totalItems = grdInventoryDetails.Rows.Count;
            for (i = 0; i < totalItems; i++)
            {
                TextBox txtQuantities = (TextBox)grdInventoryDetails.Rows[i].FindControl("txtQuantity");
                CheckBox chkSelect = (CheckBox)grdInventoryDetails.Rows[i].FindControl("chkSelectInventoryItem");
                //if (grdInventoryDetails.Rows[i].Cells[5].Text == "Yes")
                //{
                //    ///////////////////////////////
                //    /// Save Custom Item///////////

                //    KitchenInventoryCustom customInventory = new KitchenInventoryCustom();
                //    customInventory.KitchenInventoryCustomId = (int)grdInventoryDetails.DataKeys[grdInventoryDetails.Rows[i].RowIndex].Value;
                //    customInventory.Name = grdInventoryDetails.Rows[i].Cells[1].Text;
                //    if (chkSelect.Checked == true)
                //    {
                //        customInventory.Selected = 1;
                //        customInventory.Quantity = int.Parse(txtQuantities.Text);
                //    }
                //    else
                //    {
                //        customInventory.Selected = 0;
                //    }

                //    customInventory.KitchenId = (int)Session["KitchenId"];
                //    ProcessSetKitchenInventoryCustom setCustomInventory = new ProcessSetKitchenInventoryCustom();
                //    setCustomInventory.KitchenInventoryCustom = customInventory;
                //    setCustomInventory.Invoke();
                //}
                //else
                //{
                //////////////////////////////
                ///Save Inventory Item///////

                InventoryItem inventoryItem = new InventoryItem();
                inventoryItem.InventoryItemId = (int)grdInventoryDetails.DataKeys[grdInventoryDetails.Rows[i].RowIndex].Value;
                inventoryItem.ItemName = grdInventoryDetails.Rows[i].Cells[1].Text;
                if (chkSelect.Checked == true)
                {
                    inventoryItem.Selected = 1;
                    inventoryItem.Quantity = int.Parse(txtQuantities.Text);
                }
                else
                {
                    inventoryItem.Selected = 0;
                }



                //inventoryItem.SOP = grdInventoryDetails.Rows[i].Cells[4].Text;
                inventoryItem.KitchenId = (int)Session["KitchenId"];
                ProcessSetKitchenInventory setKitchenInventory = new ProcessSetKitchenInventory();
                setKitchenInventory.KitchenInventory = inventoryItem;
                setKitchenInventory.Invoke();
                //}  


            }
        }

        protected void grdInventoryDetails_DataBound(object sender, EventArgs e)
        {
            if (Session["KitchenId"] != null)
            {
                int nKitchenId = (int)Session["KitchenId"];
                int i = 0;

                ProcessGetInventoryItemsByKitchenId inventoryItems = new ProcessGetInventoryItemsByKitchenId();
                DataSet ds = inventoryItems.GetInventoryItemsDataSet(nKitchenId);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    CheckBox chkSelect = (CheckBox)grdInventoryDetails.Rows[i].FindControl("chkSelectInventoryItem");
                    TextBox txtQuantities = (TextBox)grdInventoryDetails.Rows[i].FindControl("txtQuantity");
                    RequiredFieldValidator vldQuantities = (RequiredFieldValidator)grdInventoryDetails.Rows[i].FindControl("vldQuantity");
                    chkSelect.Attributes.Add("onclick", "check(" + txtQuantities.ClientID + "," + chkSelect.ClientID + ")");
                    if (int.Parse(row["Selected"].ToString()) == 1)
                    {
                        chkSelect.Checked = true;
                        txtQuantities.Enabled = true;
                    }
                    else
                    {
                        chkSelect.Checked = false;
                        txtQuantities.Enabled = false;
                    }
                    i++;
                }
            }


        }
        protected void btnGoTInventory_Click(object sender, EventArgs e)
        {
            if (CheckValidation() != true)
            {
                saveInventoryItems();
                Response.Redirect("~/ControlPanel/Kitchen/InventoryReview.aspx");
            }
        }
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ControlPanel/Kitchen/CustomInventory.aspx");
        }

        private bool CheckValidation()
        {
            bool lIsValid = false;
            int i, totalItems;
            totalItems = grdInventoryDetails.Rows.Count;
            for (i = 0; i < totalItems; i++)
            {
                CheckBox chkSelect = (CheckBox)grdInventoryDetails.Rows[i].FindControl("chkSelectInventoryItem");
                TextBox txtQuantities = (TextBox)grdInventoryDetails.Rows[i].FindControl("txtQuantity");
                Label lblQuantity = (Label)grdInventoryDetails.Rows[i].FindControl("lblValidateQuantity");

                if (chkSelect.Checked == false && txtQuantities.Text == "")
                {
                    lblQuantity.Text = "";
                    // MBS-(03-19-10)
                    // BUG ID - 1877
                    txtQuantities.Enabled = false;
                }
                else
                    if (chkSelect.Checked == true && (txtQuantities.Text == "" || txtQuantities.Text == "0"))
                    {
                        lblQuantity.Text = "Quantity is required.";
                        txtQuantities.Enabled = true;
                        lIsValid = true;
                    }
                    else
                        if (chkSelect.Checked == true && txtQuantities.Text != "" && lblQuantity.Text != "")
                        {
                            lblQuantity.Text = "";
                        }
            }

            lblError.Text = "There was an error.  Please see below.";
            return lIsValid;
        }
    }
}