using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class blog : System.Web.UI.Page
{
    string connectionString = "Data Source=DCC;Initial Catalog=ReaDorm2;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if the user is logged in
            int memberId = GetMemberId();

            if (memberId != -1)
            {
                // User is logged in, retrieve details and populate the form
                BindUserData();
                BindBookshelf();
            }


        }

    }
    private void BindUserData()
    {
        int memberId = GetMemberId();

        if (memberId != -1)
        {
            string query = "SELECT memberf_name, memberm_name, memberl_name, email FROM Member WHERE member_id = @MemberId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MemberId", memberId);

                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    rptMemberData.DataSource = reader;
                    rptMemberData.DataBind();

                    connection.Close();
                }
            }
        }
    }


    private void BindBookshelf()
    {
        int memberId = GetMemberId();

        if (memberId != -1)
        {
            string query = "SELECT B.book_name, B.author_name FROM Reads R INNER JOIN Book B ON R.Book_Id = B.book_id WHERE R.Member_Id = @MemberId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MemberId", memberId);

                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    rptBooks.DataSource = reader;
                    rptBooks.DataBind();

                    connection.Close();
                }
            }
        }
    }
    protected int GetMemberId()
    {
        // Replace this with the logic to retrieve the Member_Id based on the session variable.
        if (Session["LoggedInUserId"] != null && int.TryParse(Session["LoggedInUserId"].ToString(), out int memberId))
        {
            return memberId;
        }
        else
        {
            // Handle the case where the user is not logged in or Member_Id is not available.
            // You might redirect the user to the login page or handle it as appropriate for your application.
            // For simplicity, I'm returning -1 as an indication of an error.
            return -1;
        }
    }



}