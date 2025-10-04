using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_G12.Flashcard
{
	public partial class viewFlashcard : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["quiz_id"] != null)
                {
                    int quizId = Convert.ToInt32(Request.QueryString["quiz_id"]);
                    LoadQuiz(quizId);
                    Session["CurrentIndex"] = 0;
                    Session["IsShowingAnswer"] = false;
                    ShowFlashcard(0, false);
                }
            }
        }

        private void LoadQuiz(int quizId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT 
                qz.quiz_id,
                qz.title AS quiz_title,
                qs.question_id,
                qs.question_text,
                qs.question_type,
                op.option_text AS answer
            FROM quiz qz
            JOIN question qs ON qz.quiz_id = qs.quiz_id
            JOIN options op ON qs.question_id = op.question_id
            WHERE qz.quiz_id = @quiz_id AND op.is_correct = 1";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@quiz_id", quizId);
                DataTable dt = new DataTable();
                da.Fill(dt);

                System.Diagnostics.Debug.WriteLine($"Rows returned: {dt.Rows.Count}");
                if (dt.Rows.Count > 0)
                {
                    System.Diagnostics.Debug.WriteLine($"First row quiz_title: {dt.Rows[0]["quiz_title"]}");
                    System.Diagnostics.Debug.WriteLine($"First row question_text: {dt.Rows[0]["question_text"]}");
                    System.Diagnostics.Debug.WriteLine($"First row answer: {dt.Rows[0]["answer"]}");
                }
                Session["Flashcards"] = dt;
                if (dt.Rows.Count > 0)
                {
                    Session["QuizTitle"] = dt.Rows[0]["quiz_title"].ToString();
                }
            }
        }

        private void ShowFlashcard(int index, bool showAnswer)
        {
            DataTable dt = (DataTable)Session["Flashcards"];

            if (dt == null)
            {
                lblQuizName.Text = "ERROR: Flashcards session is null";
                lblQuestion.Text = "DataTable not found in session";
                lblIndex.Text = "Debug: dt = null";
                return;
            }
            if (dt.Rows.Count == 0)
            {
                lblQuizName.Text = "ERROR: No rows in DataTable";
                lblQuestion.Text = "Query returned 0 rows";
                lblIndex.Text = $"Debug: Rows = {dt.Rows.Count}";
                return;
            }

            if (index < 0 || index >= dt.Rows.Count)
            {
                lblQuizName.Text = "ERROR: Invalid index";
                lblQuestion.Text = $"Index {index} out of range";
                lblIndex.Text = $"Debug: Valid range 0-{dt.Rows.Count - 1}";
                return;
            }

            if (index < 0 || index >= dt.Rows.Count) return;

            DataRow row = dt.Rows[index];
            lblQuizName.Text = Session["QuizTitle"]?.ToString() ?? "Quiz";
            lblQuestion.Text = showAnswer ? row["answer"].ToString()
                                          : row["question_text"].ToString();

            lblIndex.Text = $"Card {index + 1} of {dt.Rows.Count}";
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            if (Session["Flashcards"] is DataTable dt)
            {
                Session["CurrentIndex"] = 0;
                Session["IsShowingAnswer"] = false;
                ShowFlashcard(0, false);
            }
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            if (Session["Flashcards"] is DataTable dt)
            {
                int currentIndex = (int)Session["CurrentIndex"];
                currentIndex = (currentIndex - 1 + dt.Rows.Count) % dt.Rows.Count;

                Session["CurrentIndex"] = currentIndex;
                Session["IsShowingAnswer"] = false;  
                ShowFlashcard(currentIndex, false);
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Session["Flashcards"] is DataTable dt)
            {
                int currentIndex = (int)Session["CurrentIndex"];
                currentIndex = (currentIndex + 1) % dt.Rows.Count;

                Session["CurrentIndex"] = currentIndex;
                Session["IsShowingAnswer"] = false; 
                ShowFlashcard(currentIndex, false);
            }
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            if (Session["Flashcards"] is DataTable dt)
            {
                int index = dt.Rows.Count - 1;
                Session["CurrentIndex"] = index;
                Session["IsShowingAnswer"] = false;
                ShowFlashcard(index, false);
            }
        }

        protected void btnShowAns_Click(object sender, EventArgs e)
        {
            if (Session["Flashcards"] is DataTable dt)
            {
                int index = (int)Session["CurrentIndex"];
                bool showAnswer = !(bool)(Session["IsShowingAnswer"] ?? false);
                Session["IsShowingAnswer"] = showAnswer;

                ShowFlashcard(index, showAnswer);
            }
        }
    }
}