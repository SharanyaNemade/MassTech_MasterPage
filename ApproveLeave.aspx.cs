using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageProject
{
    public partial class ApproveLeave : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                LoadNames();
            }
        }

        private void LoadNames()
        {
            string q = "exec sp_GetEmployeesWithPendingLeave";
            SqlDataAdapter da = new SqlDataAdapter(q, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlNames.DataSource = dt;
            ddlNames.DataTextField = "EmpName";
            ddlNames.DataValueField = "EmpId";
            ddlNames.DataBind();

            ddlNames.Items.Insert(0, "-- Select Name --");
        }

        protected void ddlNames_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlNames.SelectedIndex > 0)
            {
                LoadLeaveDetails();
            }
        }

        private void LoadLeaveDetails()
        {
            string EmpId = ddlNames.SelectedValue;

            string q = $"exec sp_GetPendingLeaveByEmp '{EmpId}'";
            SqlCommand cmd = new SqlCommand(q, conn);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                ViewState["LeaveId"] = dr["LeaveId"].ToString();

                txtLeaveType.Text = dr["LeaveType"].ToString();
                txtFrom.Text = Convert.ToDateTime(dr["FromDate"]).ToString("yyyy-MM-dd");
                txtTo.Text = Convert.ToDateTime(dr["ToDate"]).ToString("yyyy-MM-dd");
                txtReason.Text = dr["Reason"].ToString();
            }

            dr.Close();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            UpdateStatus("Approved");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            UpdateStatus("Rejected");
        }

        private void UpdateStatus(string status)
        {
            if (ViewState["LeaveId"] == null)
                return;

            string LeaveId = ViewState["LeaveId"].ToString();

            string q = $"exec sp_UpdateLeaveStatus '{LeaveId}','{status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Leave " + status + " Successfully')</script>");

            LoadNames();

            txtLeaveType.Text = "";
            txtFrom.Text = "";
            txtTo.Text = "";
            txtReason.Text = "";
        }
    }
}