﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_G12
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Select username + role
                string query = @"SELECT username, role 
                         FROM tblRegisteredUsers 
                         WHERE (username = @username OR emailAddress = @username) 
                         AND password = @password";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string loggedInUser = reader["username"].ToString();
                    string role = reader["role"].ToString();

                    Session["Username"] = loggedInUser;
                    Session["Role"] = role;

                    // Redirect based on role
                    if (role == "Admin")
                    {
                        Response.Redirect("~/Admin/ViewUserList.aspx", false); // 👈 create this page for admins
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx", false); // 👈 normal user homepage
                    }

                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    lblMessage.Text = "❌ Invalid username or password!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}