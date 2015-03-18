using System.Configuration;
using System.Web.Configuration;
using System.Web.UI.HtmlControls;
using System;
using System.Data;
using System.IO;
using SchoolHaccp;
using SchoolHaccp.DataAccess.Select;
using System.Web.Security;
using DataModel;
using System.Linq;

namespace SchoolHaccp.Operational
{
    public class Utilities
    {
        
        public static string AposInString(string Arg)
        {
            //Check String before sending to Sql Server
            Arg = Arg.Replace("'", "");
            return Arg;
        }

        public static string GetAuthenticationLoginUrl(string configFilePath)
        {
            // Get the Web application configuration
            Configuration configuration = WebConfigurationManager.OpenWebConfiguration(configFilePath);

            // Get the external Authentication section
            AuthenticationSection authenticationSection =
                (AuthenticationSection)configuration.GetSection("system.web/authentication");

            // Get the external Forms section
            FormsAuthenticationConfiguration formsAuthentication = authenticationSection.Forms;

            return formsAuthentication.LoginUrl;
        }

        public static void SetMetaHeader(string metaName, int currentMetaPosition, string appSettingsKey, HtmlHead header)
        {
            HtmlMeta metaTag = new HtmlMeta();
            header.Controls.RemoveAt(currentMetaPosition);
            metaTag.Name = metaName;
            metaTag.Content = ConfigurationManager.AppSettings[appSettingsKey];
            header.Controls.Add(metaTag);
        }
        /// <summary>
        /// Returns true if time difference is less than 24 hours
        /// </summary>
        /// <param name="timespan"></param>
        /// <returns></returns>
        public static bool CalculateLogsEntryTime(TimeSpan timespan)
        {
            bool status = true;
            int totaltime = timespan.Days * 24 + timespan.Hours;

            if (totaltime == 24)
            {
                if (timespan.Minutes > 0)
                {
                    status = false;
                }
                else if (timespan.Seconds > 0)
                {
                    status = false;
                }
                else
                {
                    status = true;
                }
            }
            else if (totaltime > 24)
            {
                status = false;
            }
            else if (totaltime < 24)
            {
                status = true;
            }
            return status;
        }
        public static DataTable csvToDataTable(string file__1, bool isRowOneHeader)
        {

            DataTable csvDataTable = new DataTable();
            String[] csvData = null;

            try
            {
                csvData = System.IO.File.ReadAllLines(file__1);
            }
            catch (Exception ex)
            {
                throw new Exception("Unable to read CSV file.");
            }


            //if no data in file ‘manually’ throw an exception
            if (csvData.Length == 0)
            {
                throw new Exception("CSV File Appears to be Empty.");
            }

            String[] headings = csvData[0].Split(',');
            int index = 0;
            //will be zero or one depending on isRowOneHeader
            if (isRowOneHeader)
            {
                //if first record lists headers
                index = 1;
                //so we won’t take headings as data
                //for each heading
                for (int i = 0; i <= headings.Length - 1; i++)
                {
                    //replace spaces with underscores for column names
                    headings[i] = headings[i].Replace(" ", "_");

                    //add a column for each heading
                    csvDataTable.Columns.Add(headings[i]);
                }
            }
            else
            {
                //if no headers just go for col1, col2 etc.
                for (int i = 0; i <= headings.Length - 1; i++)
                {
                    //create arbitary column names
                    csvDataTable.Columns.Add("col" + (i + 1).ToString());
                }
            }

            //populate the DataTable
            for (int i = index; i <= csvData.Length - 1; i++)
            {
                //create new rows
                DataRow row = csvDataTable.NewRow();

                for (int j = 0; j <= headings.Length - 1; j++)
                {
                    //fill them
                    row[j] = csvData[i].Split(',')[j];
                }

                //add rows to over DataTable
                csvDataTable.Rows.Add(row);
            }

            //return the CSV DataTable

            return csvDataTable;
        }
        public static void CreateCSVFile(DataTable dt, string strFilePath)
        {
            // Create the CSV file to which grid data will be exported.
            StreamWriter sw = new StreamWriter(strFilePath, false);
            // First we will write the headers.
            //DataTable dt = m_dsProducts.Tables[0];
            int iColCount = dt.Columns.Count;
            for (int i = 0; i < iColCount; i++)
            {
                sw.Write(dt.Columns[i]);
                if (i < iColCount - 1)
                {
                    sw.Write(",");
                }
            }
            sw.Write(sw.NewLine);
            // Now write all the rows.
            foreach (DataRow dr in dt.Rows)
            {
                for (int i = 0; i < iColCount; i++)
                {
                    if (!Convert.IsDBNull(dr[i]))
                    {
                        sw.Write(dr[i].ToString());
                    }
                    if (i < iColCount - 1)
                    {
                        sw.Write(",");
                    }
                }
                sw.Write(sw.NewLine);
            }
            sw.Close();
        }
        public static DateTime GetTimeByZone(int nKitchenId)
        {
            GetKitchenByUserName kitchen = new GetKitchenByUserName();
            DataSet dsKitchen = kitchen.GetTimeZoneByKitchenID(nKitchenId);
            DateTime currenttime = DateTime.UtcNow;
            if (dsKitchen.Tables[0].Rows.Count > 0)
            {
                string timeZone = dsKitchen.Tables[0].Rows[0]["TimeZone"].ToString();
                currenttime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(
                DateTime.UtcNow, timeZone);

                //ddlTimeZone.SelectedValue = dsKitchen.Tables[0].Rows[0]["TimeZone"].ToString();

            }
            return currenttime;
        }
        public static string CreatePasswordHash(string password, string passwordSalt)
        {
            string concatSaltAndPassword = string.Concat(password, passwordSalt);
            return FormsAuthentication.HashPasswordForStoringInConfigFile(concatSaltAndPassword, "sha1");
        }
        public static bool IsEmailExist(string email)
        {
            Entities _context = new Entities();
            bool result  = false;
            var rs = (from c in _context.Contacts                     
                     where c.EmailAddress == email
                     select c).FirstOrDefault();
            if(rs != null)
                result = true;
            return result;
        }
        public static bool IsEmailExist(string email, int ContactID)
        {
            Entities _context = new Entities();
            bool result = false;
            var rs = (from c in _context.Contacts
                      where c.EmailAddress == email && c.ContactId != ContactID && c.IsUpdated == true
                      select c).FirstOrDefault();
            if (rs != null)
                result = true;
            return result;
        }
    }
}