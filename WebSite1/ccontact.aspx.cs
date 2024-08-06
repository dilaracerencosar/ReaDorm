using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ccontact : System.Web.UI.Page
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
                PopulateFormForMember(memberId);
            }
        }


    }
    private void PopulateFormForMember(int memberId)
    {
        // Assuming you have a method to retrieve member details based on member_id
        // Adjust the query and connection string as per your database structure
        string query = "SELECT memberf_name, memberm_name, memberl_name, email FROM Member WHERE member_id = @MemberId";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@MemberId", memberId);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // Populate the form textboxes with member details
                        fnamebox.Text = reader["memberf_name"].ToString();
                        mnamebox.Text = reader["memberm_name"].ToString();
                        lnamebox.Text = reader["memberl_name"].ToString();
                        emailbox.Text = reader["email"].ToString();
                    }
                }

                connection.Close();
            }
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        // Get user input from the form
        string fname = fnamebox.Text;
        string mname = mnamebox.Text;
        string lname = lnamebox.Text;
        string email = emailbox.Text;
        string message = message1.Value;

        // Obtain the member_id using the session variable
        int memberId = GetMemberId();

        // Perform the database insertion
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Insert data into the Contact table
            string query = "INSERT INTO Contact (contact_id, message_contact, Member_Id) VALUES (@contactId, @message, @memberId)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {


                if (memberId != -1)
                {

                    {
                        command.Parameters.AddWithValue("@contactId", GenerateContactId());
                        command.Parameters.AddWithValue("@message", message);
                        command.Parameters.AddWithValue("@memberId", memberId);
                        command.ExecuteNonQuery();


                    }

                }
                else
                {
                    string script = "alert('You are not a member. Please log in to submit a message.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", script, true);

                }

            }
        }

        // Perform any additional actions or redirect the user as needed
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

    // This method generates a unique contact_id.
    private int GenerateContactId()
    {
        // Replace this with your logic to generate a unique contact_id.
        // Here, I'm using a simple example of generating a random number.
        Random random = new Random();
        return random.Next(100000, 999999);  // You may need to adjust the range based on your requirements.
    }

}