using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class book8 : System.Web.UI.Page
{
    string connectionString = "Data Source=DCC;Initial Catalog=ReaDorm2;Integrated Security=True;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) // Check if it is the first time the page is loaded
        {
            if (!User.Identity.IsAuthenticated)
            {
                int memberId = GetMemberId();

                if (memberId != -1)
                {
                    // user not logged in 
                }
            }
            LoadComments(7);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // Assuming you have a connection string in your web.config file
        string connectionString = "Data Source=DCC;Initial Catalog=ReaDorm2;Integrated Security=True;";

        // Get values from the form
        string starRating = starRating1.Value;
        string commentMessage = commentMessage1.Value;

        // Assuming you have methods to get the member ID and generate comment ID
        int memberId = GetMemberId();
        int commentId = GenerateContactId();

        // Assuming you have a BOOK_ID value (you need to set this appropriately)
        int bookId = 7; // Replace with your actual BOOK_ID value

        // Check if the member exists
        if (MemberExists(memberId, connectionString))
        {
            // Insert into the Comment table
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "INSERT INTO Comment (comment_id, star_rating, comment_message, BOOK_ID, MEMBER_ID) " +
                               "VALUES (@commentId, @starRating, @commentMessage, @bookId, @memberId)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@commentId", commentId);
                    command.Parameters.AddWithValue("@starRating", starRating);
                    command.Parameters.AddWithValue("@commentMessage", commentMessage);
                    command.Parameters.AddWithValue("@bookId", bookId);
                    command.Parameters.AddWithValue("@memberId", memberId);

                    command.ExecuteNonQuery();
                }
            }

            // Additional logic if needed after inserting into the database

            // Refresh or redirect to a new page if necessary
            // Response.Redirect("YourPage.aspx");
        }
        else
        {
            // Handle case where the member does not exist
            // You can show an error message or take appropriate action
        }


    }
    private bool MemberExists(int memberId, string connectionString)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT COUNT(*) FROM Member WHERE member_id = @memberId";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@memberId", memberId);

                int count = (int)command.ExecuteScalar();

                return count > 0;
            }
        }
    }

    private void LoadComments(int bookId)
    {
        // Use ADO.NET to fetch comments and member information from the database based on the book ID
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Assuming Comment table has fields comment_id, comment_message, star_rating, and MEMBER_ID
            // Also assuming Member table has fields member_id, memberf_name, memberm_name, memberl_name
            string query = "SELECT c.comment_message, c.star_rating, m.memberf_name, m.memberm_name, m.memberl_name " +
                           "FROM Comment c " +
                           "JOIN Member m ON c.MEMBER_ID = m.member_id " +
                           "WHERE c.BOOK_ID = @BookId";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@BookId", bookId);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Extract data from the reader
                        string commentMessage = reader["comment_message"].ToString();
                        string starRating = reader["star_rating"].ToString();
                        string memberFirstName = reader["memberf_name"].ToString();
                        string memberMiddleName = reader["memberm_name"].ToString();
                        string memberLastName = reader["memberl_name"].ToString();

                        // Concatenate member name
                        string memberFullName = $"{memberFirstName} {memberMiddleName} {memberLastName}".Trim();

                        // Create comment blocks and add them to the page
                        string commentBlockHtml = $"<div class='comment' style='background-color: #f0f0f0; padding: 10px; margin-bottom: 10px;'>" +
                            $"<strong>Member:</strong> {memberFullName} <br>" +
                            $"<strong>Message:</strong> {commentMessage} <br>" +
                            $"<strong>Rating:</strong> {GenerateStarHtml(starRating)}" +
                            $"</div>";

                        // You can create HTML elements dynamically or update existing elements
                        // For simplicity, let's assume there's a <div> with the id "commentsBlock" on your page
                        commentsBlock.InnerHtml += commentBlockHtml;
                    }
                }
            }
        }
    }
    string GenerateStarHtml(string starRating)
    {
        int ratingValue;
        if (int.TryParse(starRating, out ratingValue))
        {
            // Assuming you have star images named "star.png"
            string starHtml = string.Concat(Enumerable.Repeat("<img src='star.png' alt='star' style='width: 20px;'>", ratingValue));
            return starHtml;
        }
        else
        {
            return "Invalid Rating";
        }
    }




    private int GetMemberId()
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
    private void InsertComment(int commentId, int starRating, string commentMessage, int bookId, int memberId)
    {
        // Assuming you have a method or use an ORM to handle database operations
        // Replace the following line with your actual database insertion logic
        // Make sure to use parameterized queries to prevent SQL injection
        string insertQuery = "INSERT INTO Comment(comment_id, star_rating, comment_message, BOOK_ID, MEMBER_ID) " +
                             "VALUES (@commentId, @starRating, @commentMessage, @bookId, @memberId)";

        // Execute the insertion query using your database connection
        // Make sure to handle exceptions and provide proper error handling
        // This is a simplified example, and you should adapt it to your specific database access mechanism
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            using (SqlCommand command = new SqlCommand(insertQuery, connection))
            {
                command.Parameters.AddWithValue("@commentId", commentId);
                command.Parameters.AddWithValue("@starRating", starRating);
                command.Parameters.AddWithValue("@commentMessage", commentMessage);
                command.Parameters.AddWithValue("@bookId", bookId);
                command.Parameters.AddWithValue("@memberId", memberId);

                command.ExecuteNonQuery();
            }
        }
    }


    private int GenerateContactId()
    {
        // Replace this with your logic to generate a unique contact_id.
        // Here, I'm using a simple example of generating a random number.
        Random random = new Random();
        return random.Next(100000, 999999);  // You may need to adjust the range based on your requirements.
    }
}