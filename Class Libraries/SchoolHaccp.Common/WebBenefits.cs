using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
	public class WebBenefits
	{
		private int m_WebBenefitsId;
		private string m_Name;
		private string m_ContentKey;
		private WebContent m_Content;
		private string m_CultureId;
		private bool m_Active;
		private DateTime m_CreatedDate;
		private DateTime m_ModifiedDate;

		public WebBenefits()
		{
			this.m_Content = new WebContent();
		}

		public int WebBenefitsId
		{
			get { return m_WebBenefitsId; }
			set { m_WebBenefitsId = value; }
		}

		public string Name
		{
			get { return m_Name; }
			set { m_Name = value; }
		}

		public string ContentKey
		{
			get { return m_ContentKey; }
			set
			{
				m_ContentKey = value;
				this.m_Content.ContentKey = this.m_ContentKey;
			}
		}

		public WebContent Content
		{
			get { return m_Content; }
			set { m_Content = value; }
		}

		public string CultureId
		{
			get { return m_CultureId; }
			set
			{
				m_CultureId = value;
				this.m_Content.CultureId = this.m_CultureId;
			}
		}

		public bool Active
		{
			get { return m_Active; }
			set { m_Active = value; }
		}

		public DateTime CreatedDate
		{
			get { return m_CreatedDate; }
			set { m_CreatedDate = value; }
		}

		public DateTime ModifiedDate
		{
			get { return m_ModifiedDate; }
			set { m_ModifiedDate = value; }
		}
	}
}
