using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Jquery_Practice_Work
{
    public class TrackingData
    {
        public int TrackingId { get; set; }
        public string UserType { get; set; }
        public string UserName { get; set; }
        public string ActivityAction { get; set; }
        public string ActionDescription { get; set; }
        public string ActivityDate { get; set; }
        public string KeyName { get; set; }
        public string KeyValue { get; set; }
        public int UserId { get; set; }
        public string ActivityTime { get; set; }
        public string AuditString { get; set; }

        public void Data(int id)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("sp_CreateStudentAuditString"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
        }
    }
}