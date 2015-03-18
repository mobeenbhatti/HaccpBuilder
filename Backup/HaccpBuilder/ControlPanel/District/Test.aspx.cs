using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel_District_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cmdDownload_Click(object sender, EventArgs e)
    {
        System.Net.WebRequest req = System.Net.WebRequest.Create("http://applet.realtimeforex.com/ticker/tickerdata.txt");
        //System.Net.WebRequest req = System.Net.WebRequest.Create("http://www.gftraders.com/members/");

        System.Net.WebResponse res = req.GetResponse();
        System.IO.Stream stream = res.GetResponseStream();
        System.IO.StreamReader reader = new System.IO.StreamReader(stream);
        string data = reader.ReadToEnd();
        dvRates.InnerText = data;
    }
}
