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
    /// Summary description for History_Tracking
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class History_Tracking : WebService
    {
        [WebMethod(EnableSession = true)]
        public void AddActions_Activity_Log(string ActivityAction, int UserId, string UserName)
        {
            TableTrackingDataContext db = new TableTrackingDataContext();
            //var id = (from c in db.StudentInfos where c.Id == c.Id select c.Id).FirstOrDefault();
            var activitydate = DateTime.Now;
            var objTracking = new tbl_Activity_Tracking();
            objTracking.ActivityAction = ActivityAction;
            objTracking.UserId = UserId;
            objTracking.UserName = UserName;
            objTracking.ActivityDate = Convert.ToDateTime(activitydate).ToString("MM-dd-yyyy");
            objTracking.ActivityTime = Convert.ToDateTime(activitydate).ToString("hh:mm:tt");
            db.tbl_Activity_Trackings.InsertOnSubmit(objTracking);
            db.SubmitChanges();
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetTrackingData()
        {
            string json = "";
            List<TrackingData> lst = new List<TrackingData>();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM tbl_Activity_Tracking", con))
                    {
                        sda.SelectCommand.Connection = con;
                        using (DataTable dt = new DataTable())
                        {
                            dt.TableName = "tbl_Activity_Tracking";
                            sda.Fill(dt);
                            foreach (DataRow row in dt.Rows)
                            {
                                var tracking = new TrackingData
                                {
                                    TrackingId = int.Parse(row[0].ToString()),
                                    UserName = row[2].ToString(),
                                    ActivityAction = row[3].ToString(),
                                    ActivityDate = row[5].ToString(),
                                    ActivityTime = row[9].ToString(),
                                };
                                lst.Add(tracking);
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
        public void TrackingHistory(int id)
        {
            string json = "";
            List<TrackingData> lst = new List<TrackingData>();
            TableTrackingDataContext db = new TableTrackingDataContext();
            var auditstring = db.view_getAllStudentHistories.Where(x => x.Id == id).ToList();

            auditstring.ForEach(x =>
            {
                var tracking = new TrackingData
                {
                    UserId = x.Id,
                    AuditString = x.AuditString,
                };
                lst.Add(tracking);
            });
            JavaScriptSerializer js = new JavaScriptSerializer();
            json = js.Serialize(lst);
            HttpContext.Current.Response.Write(json);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
            //TableTrackingDataContext db = new TableTrackingDataContext();
            //var auditstring = (from c in db.view_getAllStudentHistories where c.AuditString == c.AuditString select c.AuditString).FirstOrDefault();
            //var Id = (from c in db.view_getAllStudentHistories where c.Id == c.Id select c.Id).FirstOrDefault();
            //string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    using (SqlCommand cmd = new SqlCommand())
            //    {
            //        using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM view_getAllStudentHistory", con))
            //        {
            //            sda.SelectCommand.Connection = con;
            //            using (DataTable dt = new DataTable())
            //            {
            //                dt.TableName = "view_getAllStudentHistory";
            //                sda.Fill(dt);
            //                foreach (DataRow row in dt.Rows)
            //                {
            //                    var tracking = new TrackingData
            //                    {
            //                        UserId = int.Parse(row[0].ToString()),
            //                        AuditString = row[1].ToString(),                                    
            //                    };
            //                    lst.Add(tracking);
            //                }

            //                JavaScriptSerializer js = new JavaScriptSerializer();
            //                json = js.Serialize(lst);
            //                HttpContext.Current.Response.Write(json);
            //                HttpContext.Current.Response.Flush();
            //                HttpContext.Current.Response.End();
            //            }

            //        }

            //    }
            //}
        }
    }
}
