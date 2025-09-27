using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_G12
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConPass.Text)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            SqlDataSource1.InsertParameters["dateRegister"].DefaultValue = DateTime.Now.ToString();

            try
            {
                SqlDataSource1.Insert();
                lblMessage.Text = "✅ Registration Successful!";
                Response.Redirect("~/Account/Login.aspx"); // optional auto redirect
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Error: " + ex.Message;
            }
        }
    }
}