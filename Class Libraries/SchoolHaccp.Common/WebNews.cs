using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
	public class WebNews
	{
		private int m_WebNewsId;
		private string m_Name;
		private string m_TitleContentKey;
		private WebContent m_TitleContent;
		private string m_BodyContentKey;
		private WebContent m_BodyContent;
		private string m_CultureId;
		private bool m_Active;
		private DateTime m_CreatedDate;
		private DateTime m_ModifiedDate;

		public WebNews()
		{
			this.m_TitleContent = new WebContent();
			this.m_BodyContent = new WebContent();
		}

		public int WebNewsId
		{
			get { return m_WebNewsId; }
			set { m_WebNewsId = value; }
		}

		public string Name
		{
			get { return m_Name; }
			set { m_Name = value; }
		}

		public string TitleContentKey
		{
			get { return m_TitleContentKey; }
			set
			{
				m_TitleContentKey = value;
				this.m_TitleContent.ContentKey = this.m_TitleContentKey;
			}
		}

		public WebContent TitleContent
		{
			get { return m_TitleContent; }
			set { m_TitleContent = value; }
		}

		public string BodyContentKey
		{
			get { return m_BodyContentKey; }
			set
			{
				m_BodyContentKey = value;
				this.m_BodyContent.ContentKey = this.m_BodyContentKey;
			}
		}

		public WebContent BodyContent
		{
			get { return m_BodyContent; }
			set { m_BodyContent = value; }
		}

		public string CultureId
		{
			get { return m_CultureId; }
			set
			{
				m_CultureId = value;
				this.m_TitleContent.CultureId = this.m_CultureId;
				this.m_BodyContent.CultureId = this.m_CultureId;
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
