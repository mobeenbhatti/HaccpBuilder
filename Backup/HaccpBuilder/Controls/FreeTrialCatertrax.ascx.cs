using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


using SchoolHaccp.Operational;
using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;

public partial class Controls_FreeTrialCatertrax : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.txtKitchenName.Focus();
            this.ddlCountryRegion.SelectedValue = "US";
        }
    }
    protected void commandSubmit_Click(object sender, EventArgs e)
    {
        SaveData();
        SendMessage();
    }

    protected void ddlCountryRegion_DataBound(object sender, EventArgs e)
    {
        this.ddlCountryRegion.SelectedValue = "US";
    }

    private void SaveData()
    {
        string controlName = this.ID;
        if (controlName == "CatertraxFreeTrial")
        {
            // save the data
            FreeTrialRequest freeTrialRequest = new FreeTrialRequest();
            freeTrialRequest.DistrictName = this.txtKitchenName.Text;
            freeTrialRequest.FirstName = this.txtContactFirstName.Text;
            freeTrialRequest.LastName = this.txtContactLastName.Text;
            freeTrialRequest.Title = this.txtTitle.Text;
            int numberOfKitchens = 0;
            //int.TryParse(this.txtNumberOfKitchens.Text, out numberOfKitchens);
            //freeTrialRequest.NumberOfKitchens = numberOfKitchens;
            freeTrialRequest.NumberOfKitchens = 0;
            freeTrialRequest.EmailAddress = this.txtEmail.Text;
            freeTrialRequest.PhoneNumber = this.txtPhone.Text;
            freeTrialRequest.City = this.txtCity.Text;
            if (hfState.Value != "")
            {
                freeTrialRequest.State = txtState.Text;
            }
            else
            {
                freeTrialRequest.State = this.ddlStateProvince.SelectedItem.Text;
            }
            freeTrialRequest.ZipCode = this.txtZipCode.Text;
            freeTrialRequest.Comments = this.txtComment.Text;
            freeTrialRequest.SponsorId = 2;
            freeTrialRequest.Country = this.ddlCountryRegion.SelectedValue;
            freeTrialRequest.TypeId = int.Parse(ddlType.SelectedValue);
            ProcessCreateFreeTrialRequest createFreeTrialRequest = new ProcessCreateFreeTrialRequest();
            createFreeTrialRequest.FreeTrialRequest = freeTrialRequest;
            createFreeTrialRequest.Invoke();

        }
    }

    private void SendMessage()
    {
        if (this.Page.IsValid)
        {
            EmailContents contents = new EmailContents();
            contents.Body = this.txtComment.Text;
            contents.Subject = EmailManager.GetSubject(Path.GetFileName(Request.Url.AbsolutePath));

            ContactInformation contactInformation = new ContactInformation();
            contactInformation.DistrictName = this.txtKitchenName.Text;
            contactInformation.FirstName = this.txtContactFirstName.Text;
            contactInformation.LastName = this.txtContactLastName.Text;
            contactInformation.Title = this.txtTitle.Text;
            int numberOfKitchens = 0;
           // int.TryParse(this.txtNumberOfKitchens.Text, out numberOfKitchens);
            //contactInformation.NumberOfKitchens = numberOfKitchens;
            contactInformation.NumberOfKitchens = 0;
            contactInformation.EmailAddress = this.txtEmail.Text;
            contactInformation.PhoneNumber = this.txtPhone.Text;
            contactInformation.City = this.txtCity.Text;
            if (hfState.Value != "")
            {
                contactInformation.State = txtState.Text;
            }
            else
            {
                contactInformation.State = this.ddlStateProvince.SelectedValue;
            }
            contactInformation.ZipCode = this.txtZipCode.Text;

            contents.ContactInfo = contactInformation;
            contents.ContactInfo.Type = ddlType.SelectedItem.Text;
            EmailManager emailManager = new EmailManager();
            emailManager.ToAddress = "c.penner@haccpbuilder.com";
           // emailManager.ToAddress = "rehman.gull@nxvt.com";
            try
            {
                emailManager.SendCaterTrax(contents);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (emailManager.IsSent)
            {
               
            }
            Response.Redirect("Thanks.aspx");
            
        }
    }

    protected void commandReset_Click(object sender, EventArgs e)
    {
        this.txtKitchenName.Text = "";
        this.txtEmail.Text = "";
        this.txtComment.Text = "";
        this.txtKitchenName.Focus();
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlStateProvince.Items.Clear();
        ddlStateProvince.DataBind();
        if (ddlCountryRegion.SelectedValue != "US" && ddlCountryRegion.SelectedValue != "CA")
        {
            ddlStateProvince.Visible = false;
            txtState.Visible = true;
            rfvState.Enabled = false;
            rfvState2.Enabled = true;
            hfState.Value = "1";
        }
        else
        {
            ddlStateProvince.Visible = true;
            txtState.Visible = false;
            rfvState.Enabled = true;
            rfvState2.Enabled = false;
            hfState.Value = "";
        }
    }
}
