using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Jquery_Practice_Work
{
    /// <summary>
    /// Summary description for LoadTable
    /// </summary>
    public class LoadTable : IHttpHandler
    {
        public class DtResponse
        {
            public string Draw { get; set; }
            public int RecordsFiltered { get; set; }
            public int RecordsTotal { get; set; }
            public List<Employee> Data { get; set; }
        }

        public void ProcessRequest(HttpContext context)
        {
            int totalRecords = 0;
            var js = new JavaScriptSerializer();
            //var draw = Convert.ToString(context.Request.Form.GetValues("draw")[0]);
            string json = "";
            List<Employee> lst = new List<Employee>();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM StudentInfo", con))
                    {

                        sda.SelectCommand.Connection = con;
                        using (DataTable dt = new DataTable())
                        {
                            dt.TableName = "StudentInfo";
                            sda.Fill(dt);
                            foreach (DataRow row in dt.Rows)
                            {
                                var std = new Employee
                                {
                                    Id = int.Parse(row[0].ToString()),
                                    FirstName = row[1].ToString(),
                                    FatherName = row[2].ToString(),
                                    DOB = Convert.ToDateTime(row[3].ToString()),
                                    Address = row[4].ToString(),
                                    CellNo = row[5].ToString(),
                                    Program = row[6].ToString(),
                                    Country = row[7].ToString(),
                                    Gender = row[8].ToString(),
                                    Edit = "<div class='form-inline'><div class='form-group'><a class='btn btn-success btnEdit dark-stripe' data-min='' style='margin-left:10px;'>Edit</a><a class='btn btn-primary hiddenbtn btnUpdate dark-stripe' style='margin-left:3px;'>Update</a><a class='btn btn-warning hiddenbtn btnCancel dark-stripe' style='margin-right:60px;'>Cancel</a></div></div>",
                                    Delete = "<a class='btn btn-danger btnDelete dark-stripe' style='margin-left:10px;'>Delete</a>"
                                };
                                lst.Add(std);                               
                            }
                            totalRecords = lst.Count();
                            var res = new DtResponse()
                            {
                                RecordsFiltered = totalRecords,
                                RecordsTotal = totalRecords,
                                Data = lst
                            };
                            json = js.Serialize(res);
                            context.Response.ContentType = "application/json";
                            context.Response.Write(json);
                        }
                    }
                }
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}