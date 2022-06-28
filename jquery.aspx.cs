using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;

namespace Jquery_Practice_Work
{  
    public partial class Jquery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("select*from StudentInfo", con);
            da.SelectCommand.Connection = con;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void exportexcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AppendHeader("content-disposition", "attachment;filename=Students.xls");
            Response.ContentType = "application/excel";
            StringWriter stringwriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringwriter);
            GridView1.RenderControl(htmlTextWriter);
            Response.Write(stringwriter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }
    }
}