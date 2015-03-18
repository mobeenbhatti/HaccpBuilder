using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolHaccp.Operational;

public partial class Controls_Pager : System.Web.UI.UserControl
{
    public event CustomDelegateClass.PageChangedEventHandler PageChanged;

    private int _currentPageNumber;
    public int CurrentPageNumber
    {
        get { return _currentPageNumber; }
        set { _currentPageNumber = value; }
    }

    private int _totalPages;
    public int TotalPages
    {
        get { return _totalPages; }
        set { _totalPages = value; }
    }

    private int _currentPageSize;
    public int CurrentPageSize
    {
        get { return _currentPageSize; }
        set { _currentPageSize = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            for (int count = 1; count <= this.TotalPages; ++count)
                ddlPageNumber.Items.Add(count.ToString());
            if (this.TotalPages > 0)
            {
                ddlPageNumber.Items[0].Selected = true;
            }
            else
            {
                ddlPageNumber.Enabled = false;
            }

            lblShowRecords.Text = string.Format(" {0} ", this.TotalPages.ToString());
        }
    }

    //protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    CustomPageChangeArgs args = new CustomPageChangeArgs();
    //    args.CurrentPageSize = Convert.ToInt32(this.ddlPageSize.SelectedItem.Value);
    //    args.CurrentPageNumber = 1;
    //    args.TotalPages = Convert.ToInt32(this.lblShowRecords.Text);
    //    Pager_PageChanged(this, args);

    //    ddlPageNumber.Items.Clear();
    //    for (int count = 1; count <= this.TotalPages; ++count)
    //        ddlPageNumber.Items.Add(count.ToString());
    //    ddlPageNumber.Items[0].Selected = true;
    //    lblShowRecords.Text = string.Format(" {0} ", this.TotalPages.ToString());
    //}

    void Pager_PageChanged(object sender, CustomPageChangeArgs e)
    {
        PageChanged(this, e);
        //throw new Exception("The method or operation is not implemented.");
    }

    protected void ddlPageNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        CustomPageChangeArgs args = new CustomPageChangeArgs();
        //args.CurrentPageSize = Convert.ToInt32(this.ddlPageSize.SelectedItem.Value);
        args.CurrentPageSize = 20;
        args.CurrentPageNumber = Convert.ToInt32(this.ddlPageNumber.SelectedItem.Text);
        args.TotalPages = Convert.ToInt32(this.lblShowRecords.Text);
        Pager_PageChanged(this, args);

        lblShowRecords.Text = string.Format(" {0} ", args.TotalPages.ToString());
    }
}
