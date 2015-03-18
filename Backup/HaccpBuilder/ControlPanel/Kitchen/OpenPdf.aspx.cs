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

public partial class ControlPanel_Kitchen_OpenPdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Net.WebClient client = new System.Net.WebClient();
        string strFileName="";
        if(Request.QueryString["file"] != null)
        {
            strFileName = Request.QueryString["file"].ToString();
        }


        string path = "F:/SchoolHaccp/Web/StaticContent/Files/" + strFileName;
        Byte[] buffer = client.DownloadData(path);


        if (buffer != null)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", buffer.Length.ToString());
            Response.BinaryWrite(buffer);
        }
    }
}
