using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class CostBenefitAnalysis : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			CalculateAnalysis();
		}
	}

	protected void ddlPlan_SelectedIndexChanged(object sender, EventArgs e)
	{
		string selectedProgram = this.ddlPlan.SelectedValue;
		if (selectedProgram == "platinum")
			this.lblProgram.Text = "HACCP Builder Platinum Service: Including automated temperature equipment, planner, reporting and alerts";
		else if (selectedProgram == "gold")
			this.lblProgram.Text = "HACCP Builder Gold Service: Data entry reporting with automated notifications";

		CalculateAnalysis();
	}

	protected void btnCalculate_Click(object sender, EventArgs e)
	{
		CalculateAnalysis();
	}

	private void CalculateAnalysis()
	{
		decimal avgHourlyAdminCost = 12.00m;
		int workWeeksPerSchoolYear = 40;

		// default to platinum values
		int weeklyHoursSaved = 8;
		decimal perKitchenSetupFee = 999.00m;
		decimal monthlyKitchenFee = 35.00m;

		int numberOfKitchens = 0;

		bool parsedNumberOfKitchens = false;
		parsedNumberOfKitchens = int.TryParse(this.txtNumberOfKitchens.Text, out numberOfKitchens);
		decimal licenseFee = GetLicenseFee(numberOfKitchens);

		if (this.ddlPlan.SelectedValue == "gold")
		{
			weeklyHoursSaved = 3;
			perKitchenSetupFee = 0.00m;
			monthlyKitchenFee = 20.00m;
		}

		decimal licenseFeePlusSetup = (numberOfKitchens * perKitchenSetupFee) + licenseFee;

		if (!parsedNumberOfKitchens || numberOfKitchens < 1)
		{
			this.lblError.Visible = true;
			this.lblLicenseFee.Text = String.Format("{0:c}", 0);
			return;
		}
		else
		{
			decimal adminHours = numberOfKitchens * weeklyHoursSaved;
			decimal adminCost = adminHours * avgHourlyAdminCost * workWeeksPerSchoolYear;
			decimal firstYearCost = (numberOfKitchens * (monthlyKitchenFee * 12)) + licenseFeePlusSetup;
			decimal secondYearCost = numberOfKitchens * monthlyKitchenFee * 12;
			decimal firstYearROI = 0.00m;
			if (firstYearCost > 0)
				firstYearROI = -(firstYearCost - adminCost) / firstYearCost;
			decimal secondYearROI = 0.00m;
			if (secondYearCost > 0)
				secondYearROI = -(secondYearCost - adminCost) / secondYearCost;
			this.lblLicenseFee.Text = String.Format("{0:c}", licenseFeePlusSetup);
			this.lblMonthlyKitchenFee.Text = String.Format("{0:c}", monthlyKitchenFee);
			this.lblFirstYearCost.Text = String.Format("{0:c}", firstYearCost);
			this.lblSecondYearCost.Text = String.Format("{0:c}", secondYearCost);
			this.lblAdminHours.Text = String.Format("{0}", adminHours);
			this.lblAnnualAdminCost.Text = String.Format("{0:c}", adminCost);
			if (firstYearCost - adminCost < 0) this.lblFirstYearSavings.ForeColor = System.Drawing.Color.Red;
			this.lblFirstYearSavings.Text = String.Format("{0:c}", firstYearCost - adminCost);
			if (secondYearCost - adminCost < 0) this.lblSecondYearSavings.ForeColor = System.Drawing.Color.Red;
			this.lblSecondYearSavings.Text = String.Format("{0:c}", secondYearCost - adminCost);
			this.lblFirstYearROI.Text = String.Format("{0:0.0%}", firstYearROI);
			this.lblSecondYearROI.Text = String.Format("{0:0.0%}", secondYearROI);
		}
	}

	private decimal GetLicenseFee(int numberOfKitchens)
	{
		decimal result = 3000.00m;
		if (numberOfKitchens < 0) return 0.00m;

		if (numberOfKitchens < 6)
		{
			result = 1000.00m;
		}
		else if (numberOfKitchens < 11)
		{
			result = 1500.00m;
		}
		else if (numberOfKitchens < 16)
		{
			result = 2000.00m;
		}
		else if (numberOfKitchens < 21)
		{
			result = 2500.00m;
		}
		return result;
	}
}
