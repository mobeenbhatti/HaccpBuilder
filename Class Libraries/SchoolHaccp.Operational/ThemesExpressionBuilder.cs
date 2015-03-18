using System;
using System.Web;
using System.CodeDom;
using System.Web.UI;
using System.ComponentModel;
using System.Web.Compilation;
using System.Web.Configuration;
using System.Configuration;
using System.Text.RegularExpressions;

namespace SchoolHaccp.Operational
{
	/// <summary>
	/// Class that enables the creation of expressions containing the current theme 
	/// or stylesheet theme as set in the <c>pages</c> section of the web.config.
	/// </summary>
	/// <remarks>
	/// <para>The following two types of expressions are supported:
	///	1. <c>&lt;%$ Themes:StylesheetTheme %&gt;</c> or
	/// 2. <c>&lt;%$ Themes:StylesheetTheme(&lt;some format string&gt;) %&gt;</c>, where 
	/// <c>&lt;some format string&gt;</c> can contain one placeholder, such as 
	/// '~/App_Themes/{0}/Images/someimage.gif'.</para>
	/// 
	/// <para>You can query both the <c>StyleSheetTheme</c> and <c>Theme</c> properties. The 
	/// respective expressions are <c>&lt;%$ Themes:StylesheetTheme %&gt;</c> and 
	/// <c>&lt;%$ Themes:Theme %&gt;</c>.</para>
	///</remarks>
	[ExpressionPrefix("Themes")]
	public class ThemesExpressionBuilder : System.Web.Compilation.ExpressionBuilder
	{
		private const string STYLESHEET_THEME = "stylesheettheme";
		private const string THEME = "theme";

		public override System.CodeDom.CodeExpression GetCodeExpression(BoundPropertyEntry entry, object parsedData, ExpressionBuilderContext context)
		{
			CodeExpression[] expressionArray1 = new CodeExpression[1] { new CodePrimitiveExpression(entry.Expression.Trim()) };

			return new CodeMethodInvokeExpression(new CodeTypeReferenceExpression(base.GetType()), "GetEvalData", expressionArray1);
		}

		public override bool SupportsEvaluate
		{
			get { return true; }
		}

		public override object EvaluateExpression(object target, BoundPropertyEntry entry, object parsedData, ExpressionBuilderContext context)
		{
			return GetEvalData(entry.Expression);
		}

		public static object GetEvalData(string expression)
		{
			string result = String.Empty;

			// Get the Web application configuration.
			Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");

			// Get the 'pages' section.
			PagesSection pagesSection = (PagesSection)configuration.GetSection("system.web/pages");

			bool hasArgs = Regex.IsMatch(expression, ".+\\(.+\\)", RegexOptions.IgnorePatternWhitespace | RegexOptions.Compiled | RegexOptions.IgnoreCase);

			//Determine the expression result
			if (expression.ToLowerInvariant().StartsWith(STYLESHEET_THEME))
			{
				if (hasArgs)
				{
					expression = expression.Substring(STYLESHEET_THEME.Length + 1, expression.Length - STYLESHEET_THEME.Length - 2);
					System.Web.UI.Control helper = new Control();
					result = helper.ResolveUrl(String.Format(expression, pagesSection.StyleSheetTheme));
				}
				else
				{
					result = pagesSection.StyleSheetTheme;
				}
			}
			else if (expression.ToLowerInvariant().StartsWith(THEME))
			{
				if (hasArgs)
				{
					expression = expression.Substring(THEME.Length + 1, expression.Length - THEME.Length - 2);
					System.Web.UI.Control helper = new Control();
					result = helper.ResolveUrl(String.Format(expression, pagesSection.Theme));
				}
				else
				{
					result = pagesSection.Theme;
				}
			}

			return result;
		}
	}
}
