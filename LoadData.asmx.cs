using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Linq;

namespace Jquery_Practice_Work
{
    /// <summary>
    /// Summary description for LoadData
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LoadData : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetData()
        {
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
                                    Checkbox = "<input id='cbbox' type='checkbox' class='checkall' name='checkbox' value='' style='margin-left:10px;' />",
                                    Id = int.Parse(row[0].ToString()),
                                    FirstName = row[1].ToString(),
                                    FatherName = row[2].ToString(),
                                    DOB = Convert.ToDateTime(row[3].ToString()),
                                    Address = row[4].ToString(),
                                    CellNo = row[5].ToString(),
                                    Program = row[6].ToString(),
                                    Country = row[7].ToString(),
                                    Gender = row[8].ToString(),
                                    Edit = "<div class='form-inline'><div class='form-group'><a class='btn btn-success btnEdit dark-stripe' id='" + int.Parse(row[0].ToString()) + "' style='margin-left:7px;'>Edit</a><a class='btn btn-primary hiddenbtn btnUpdate dark-stripe' id='" + int.Parse(row[0].ToString()) + "' style='margin-left:3px;'>Update</a><a class='btn btn-warning hiddenbtn btnCancel dark-stripe' id='" + int.Parse(row[0].ToString()) + "' style='margin-right:60px;'>Cancel</a></div></div>",
                                    ViewPDF = "<a class='btn btn-info ViewHistory dark-stripe' id='" + int.Parse(row[0].ToString()) + "' style='margin-left:5px;'>ViewHistory</a>",
                                    Delete = "<a class='btn btn-danger btnDelete dark-stripe' id='"+ int.Parse(row[0].ToString()) + "' style='margin-left:7px;'>Delete</a>"
                                };
                                lst.Add(std);
                            }

                            JavaScriptSerializer js = new JavaScriptSerializer();
                            json = js.Serialize(lst);
                            HttpContext.Current.Response.Write(json);
                            HttpContext.Current.Response.Flush();
                            HttpContext.Current.Response.End();
                        }

                    }

                }
            }

        }
        [WebMethod(EnableSession = true)]
        public void AddData(Employee emp)
        {
            //string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    using (SqlCommand cmd = new SqlCommand("INSERT INTO StudentInfo VALUES(@StudentName,@FatherName,@DOB,@Address,@CellNo,@Program,@Country,@Gender)"))
            //    {
            //        cmd.CommandType = CommandType.Text;
            //        cmd.Parameters.AddWithValue("@StudentName", emp.FirstName);
            //        cmd.Parameters.AddWithValue("@FatherName", emp.FatherName);
            //        cmd.Parameters.AddWithValue("@DOB", emp.DOB);
            //        cmd.Parameters.AddWithValue("@Address", emp.Address);
            //        cmd.Parameters.AddWithValue("@CellNo", emp.CellNo);
            //        cmd.Parameters.AddWithValue("@Program", emp.Program);
            //        cmd.Parameters.AddWithValue("@Country", emp.Country);
            //        cmd.Parameters.AddWithValue("@Gender", emp.Gender);
            //        cmd.Connection = con;
            //        con.Open();
            //        cmd.ExecuteNonQuery();
            //        con.Close();
            //    }
            //}
            using (TableTrackingDataContext db = new TableTrackingDataContext())
            {
                StudentInfo std = new StudentInfo
                {
                   StudentName = emp.FirstName,
                   FatherName = emp.FatherName,
                   DOB = emp.DOB,
                   Address = emp.Address,
                   Cellno = emp.CellNo,
                   Program = emp.Program,
                   Country = emp.Country,
                   Gender = emp.Gender,                  
                };
                db.StudentInfos.InsertOnSubmit(std);
                db.SubmitChanges();
            }
        }
        [WebMethod(EnableSession = true)]
        public bool DeleteData(int id)
        {
            //string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    using (SqlCommand cmd = new SqlCommand("delete from StudentInfo where @Id = id ",con))
            //    {
            //        con.Open();
            //        cmd.Parameters.AddWithValue("@Id",id);
            //        cmd.ExecuteNonQuery();
            //        con.Close();
            //    }
            //}
            using(TableTrackingDataContext db = new TableTrackingDataContext())
            {
                StudentInfo std = (from c in db.StudentInfos where c.Id == id select c).FirstOrDefault(x => x.Id == id);
                if (std != null)
                {
                    db.StudentInfos.DeleteOnSubmit(std);
                    db.SubmitChanges();
                }
                return true;
            }
        }
        [WebMethod(EnableSession = true)]
        public void UpdateData(Employee emp)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("update StudentInfo set StudentName = @StudentName, FatherName = @FatherName, DOB = @DOB, Address = @Address, CellNo = @CellNo, Program = @Program, Country = @Country, Gender = @Gender where Id = @Id", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@Id", emp.Id);
                    cmd.Parameters.AddWithValue("@StudentName", emp.FirstName);
                    cmd.Parameters.AddWithValue("@FatherName", emp.FatherName);
                    cmd.Parameters.AddWithValue("@DOB", emp.DOB);
                    cmd.Parameters.AddWithValue("@Address", emp.Address);
                    cmd.Parameters.AddWithValue("@CellNo", emp.CellNo);
                    cmd.Parameters.AddWithValue("@Program", emp.Program);
                    cmd.Parameters.AddWithValue("@Country", emp.Country);
                    cmd.Parameters.AddWithValue("@Gender", emp.Gender);
                    cmd.ExecuteNonQuery();
                    TrackingData trackingData = new TrackingData();
                    trackingData.Data(emp.Id);
                    con.Close();
                }
            }
        }
    }

}
