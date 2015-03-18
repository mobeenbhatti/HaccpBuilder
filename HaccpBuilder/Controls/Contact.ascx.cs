using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using SchoolHaccp.Operational;
using SchoolHaccp.Common;
using SchoolHaccp.BusinessLogic;
public partial class Controls_Contact : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			this.txtDistrictName.Focus();
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
        if (controlName == "FreeTrialContact")
        {
			// save the data
            FreeTrialRequest freeTrialRequest = new FreeTrialRequest();
            freeTrialRequest.DistrictName = this.txtDistrictName.Text;
            freeTrialRequest.FirstName = this.txtContactFirstName.Text;
            freeTrialRequest.LastName = this.txtContactLastName.Text;
            freeTrialRequest.Title = this.txtTitle.Text;
            int numberOfKitchens = 0;
            int.TryParse(this.txtNumberOfKitchens.Text, out numberOfKitchens);
            freeTrialRequest.NumberOfKitchens = numberOfKitchens;
            freeTrialRequest.EmailAddress = this.txtEmail.Text;
            freeTrialRequest.PhoneNumber = this.txtPhone.Text;
            freeTrialRequest.City = this.txtCity.Text;
            freeTrialRequest.State = this.ddlStateProvince.SelectedValue;
            freeTrialRequest.ZipCode = this.txtZipCode.Text;
            freeTrialRequest.Comments = this.txtComment.Text;

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
			contactInformation.DistrictName = this.txtDistrictName.Text;
			contactInformation.FirstName = this.txtContactFirstName.Text;
			contactInformation.LastName = this.txtContactLastName.Text;
			contactInformation.Title = this.txtTitle.Text;
			int numberOfKitchens = 0;
			int.TryParse(this.txtNumberOfKitchens.Text, out numberOfKitchens);
			contactInformation.NumberOfKitchens = numberOfKitchens;
			contactInformation.EmailAddress = this.txtEmail.Text;
			contactInformation.PhoneNumber = this.txtPhone.Text;
			contactInformation.City = this.txtCity.Text;
			contactInformation.State = this.ddlStateProvince.SelectedValue;
			contactInformation.ZipCode = this.txtZipCode.Text;

			contents.ContactInfo = contactInformation;

			EmailManager emailManager = new EmailManager();
           // emailManager.ToAddress = "s.schany@schoolhaccp.com";
            emailManager.ToAddress = "rehman.gull@nxvt.com";
			try
			{                
                emailManager.Send(contents);                
			}
			catch (Exception ex)
			{
				throw ex;
			}
			if (emailManager.IsSent)
			{
				Response.Redirect("ContactConfirm.aspx");
			}
		}
	}

	protected void commandReset_Click(object sender, EventArgs e)
	{
		this.txtDistrictName.Text = "";
		this.txtEmail.Text = "";
		this.txtComment.Text = "";
		this.txtDistrictName.Focus();
	}
}
