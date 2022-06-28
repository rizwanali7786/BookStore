using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace Jquery_Practice_Work
{
    /// <summary>
    /// Summary description for GridData
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class GridData : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void DataLoad()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            List<Employee> employees = new List<Employee>();
            using(SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select*from StudentInfo", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Employee employee = new Employee
                    {
                        Id = Convert.ToInt32(rdr["Id"]),
                        FirstName = rdr["StudentName"].ToString(),
                        FatherName = rdr["FatherName"].ToString(),
                        DOB = Convert.ToDateTime(rdr["DOB"]),
                        Address = rdr["Address"].ToString(),
                        CellNo = rdr["CellNo"].ToString(),
                        Program = rdr["Program"].ToString(),
                        Country = rdr["Country"].ToString(),
                        Gender = rdr["Gender"].ToString(),
                        Edit = "<div class='form-inline'><div class='form-group'><a class='btn btn-success btnEdit dark-stripe' data-min='' style='margin-left:10px;'>Edit</a><a class='btn btn-primary hiddenbtn btnUpdate dark-stripe' style='margin-left:3px;'>Update</a><a class='btn btn-warning hiddenbtn btnCancel dark-stripe' style='margin-right:60px;'>Cancel</a></div></div>",
                        Delete = "<a class='btn btn-danger btnDelete dark-stripe' style='margin-left:10px;'>Delete</a>"
                    };
                    employees.Add(employee);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employees));
            HttpContext.Current.Response.Write(js);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
    }
}
