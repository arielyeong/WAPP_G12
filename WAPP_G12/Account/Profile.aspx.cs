using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_G12
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    LoadProfile(Session["Username"].ToString());
                }
                else
                {
                    // If not logged in, send back to login page
                    Response.Redirect("~/Account/Login.aspx");
                }
            }
        }

        private void LoadProfile(string username)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM tblRegisteredUsers WHERE Username=@Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblFullname.Text = reader["Fullname"].ToString();
                    lblEmail.Text = reader["EmailAddress"].ToString();
                    lblUsername.Text = reader["Username"].ToString();
                    lblAge.Text = reader["Age"].ToString();
                    lblGender.Text = reader["Gender"].ToString();
                    lblCountry.Text = reader["Country"].ToString();
                    lblDate.Text = Convert.ToDateTime(reader["dateRegister"]).ToString("dd MMM yyyy");

                    if (!string.IsNullOrEmpty(reader["Picture"].ToString()))
                        imgProfile.ImageUrl = reader["Picture"].ToString();
                    else
                        imgProfile.ImageUrl = "~/Images/default-avatar.png"; // fallback
                }

                reader.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/UpdateProfile.aspx");
        }
    }
}