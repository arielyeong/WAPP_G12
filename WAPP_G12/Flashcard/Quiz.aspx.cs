using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_G12.Flashcard
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerateFlashcard_Click(object sender, EventArgs e)
        {
            int quizId = 6;
            Response.Redirect($"~/Flashcard.aspx?quiz_id={quizId}");
        }
    }
}