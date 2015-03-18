using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
	public class WebContent
	{
		private string m_ContentKey;
		private string m_CultureId;
		private String m_ContentValue;

		public WebContent()
		{
		}

		public string ContentKey
		{
			get { return m_ContentKey; }
			set { m_ContentKey = value; }
		}

		public string CultureId
		{
			get { return m_CultureId; }
			set { m_CultureId = value; }
		}

		public String ContentValue
		{
			get { return m_ContentValue; }
			set { m_ContentValue = value; }
		}
	}
}
