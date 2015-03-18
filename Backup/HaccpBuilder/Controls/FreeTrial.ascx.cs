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

public partial class Controls_FreeTrial : System.Web.UI.UserControl
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
		if (this.Page.IsValid)
		{
			EmailContents contents = new EmailContents();
			contents.FromName = this.txtDistrictName.Text;
			contents.FromEmailAddress = txtEmail.Text;
			contents.Body = this.txtComment.Text;
			contents.Subject = EmailManager.GetSubject(Path.GetFileName(Request.Url.AbsolutePath));

			ContactInformation contactInformation = new ContactInformation();
			contactInformation.FirstName = this.txtContactFirstName.Text;
			contactInformation.LastName = this.txtContactLastName.Text;
			contactInformation.Title = this.txtTitle.Text;
			int numberOfKitchens = 0;
			int.TryParse(this.txtNumberOfKitchens.Text, out numberOfKitchens);
			contactInformation.NumberOfKitchens = numberOfKitchens;
			contactInformation.PhoneNumber = this.txtPhone.Text;
			contactInformation.City = this.txtCity.Text;
			contactInformation.State = this.txtState.Text;
			contactInformation.ZipCode = this.txtZipCode.Text;

			contents.ContactInfo = contactInformation;

			EmailManager emailManager = new EmailManager();
			try
			{
				emailManager.Send(contents);
                //emailManager.SendUserInfo(contents);
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
