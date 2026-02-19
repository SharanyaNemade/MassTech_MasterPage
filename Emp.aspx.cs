using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageProject
{
    public partial class Emp : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                ApplyRoleRules();
                LoadGrid();
            }
        }

        //  Save Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string email = TextBox2.Text;
            string contact = TextBox3.Text;
            string address = TextBox4.Text;
            string role = DropDownList3.SelectedValue;
            string status = DropDownList4.SelectedValue;

            string department = null;
            string designation = null;
            string manager = null;


            // Main Business Logic
            if (role == "Employee")
            {
                department = DropDownList1.SelectedValue;
                designation = DropDownList2.SelectedValue;
                manager = DropDownList5.SelectedValue;
            }
            else if (role == "Manager")
            {
                department = DropDownList1.SelectedValue;
            }

            string photoPath = "";




            // File Upload
            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/Images/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Guid.NewGuid().ToString() +
                                  Path.GetExtension(FileUpload1.FileName);

                string fullPath = Path.Combine(folderPath, fileName);

                FileUpload1.SaveAs(fullPath);

                photoPath = "Images/" + fileName;


            }

            // Stored Procedure
            SqlCommand cmd = new SqlCommand("sp_InsertEmployee", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Contact", contact);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Department", (object)department ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@Designation", (object)designation ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@Manager", (object)manager ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@Role", role);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@ProfilePhoto", photoPath);

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Employee Saved Successfully')</script>");

            LoadGrid();
        }

        // Role Change Event

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            HandleRoleLogic();
        }

        // Applying Role Rules

        public void ApplyRoleRules()
        {
            HandleRoleLogic();
        }

        private void HandleRoleLogic()
        {
            string role = DropDownList3.SelectedValue;

            // Reset first
            DropDownList1.Enabled = true;
            DropDownList2.Enabled = true;
            DropDownList5.Enabled = true;

            if (role == "Admin")
            {
                DropDownList1.Enabled = false;
                DropDownList2.Enabled = false;
                DropDownList5.Enabled = false;
            }
            else if (role == "Manager")
            {
                DropDownList2.Enabled = false;
                DropDownList5.Enabled = false;
            }
        }

        // To Load Grid below

        private void LoadGrid()
        {
            SqlCommand cmd = new SqlCommand("sp_GetAllEmployee", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

       
    }
}