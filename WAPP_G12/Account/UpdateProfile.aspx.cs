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
    public partial class UpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    LoadUserDetails(Session["Username"].ToString());
                }
                else
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
            }
        }

        private void LoadUserDetails(string username)
        {
            string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Fullname, EmailAddress, Username, Age, Gender, Country, Picture FROM tblRegisteredUsers WHERE Username=@Username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtFullname.Text = dr["Fullname"].ToString();
                    txtEmail.Text = dr["EmailAddress"].ToString();
                    txtUsername.Text = dr["Username"].ToString();
                    txtAge.Text = dr["Age"].ToString();
                    string gender = dr["Gender"].ToString().Trim();
                    if (rbGender.Items.FindByValue(gender) != null)
                    {
                        rbGender.SelectedValue = gender;
                    }
                    dlCountry.SelectedValue = dr["Country"].ToString();

                    if (dr["Picture"] != DBNull.Value)
                        imgPreview.ImageUrl = "~/Uploads/" + dr["Picture"].ToString();
                }
                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE tblRegisteredUsers SET Fullname=@Fullname, EmailAddress=@Email, Age=@Age, Gender=@Gender, Country=@Country WHERE Username=@Username";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Fullname", txtFullname.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@Gender", rbGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Country", dlCountry.SelectedValue);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Profile updated successfully!";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Profile.aspx");
        }
    }
}