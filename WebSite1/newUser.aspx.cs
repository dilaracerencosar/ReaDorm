using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class newUser : System.Web.UI.Page
{
    string connectionString = "Data Source=DCC;Initial Catalog=ReaDorm2;Integrated Security=True;";
    int member_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        // No initialization here
    }

    private int GenerateContactID()
    {
        // Replace this with your logic to generate a unique memberId.
        // Here, I'm using a simple example of generating a random number.
        Random random = new Random();
        return random.Next(100000, 999999);  // You may need to adjust the range based on your requirements.
    }

    protected void registerButton_Click(object sender, EventArgs e)
    {
        member_id = GenerateContactID();  // Generate memberId only when a new user registers

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Check if the generated memberId already exists in the database
            while (MemberIdExists(connection, member_id))
            {
                member_id = GenerateContactID();  // If it exists, generate a new one
            }

            // Now, you can use the unique member_id in the insert query
            using (SqlCommand commandRegister = new SqlCommand("INSERT INTO Member (member_id, memberf_name, memberm_name, memberl_name, phone_number, age, email, member_password) VALUES (@MemberId, @fname, @mname, @lname, @phone, @age, @email, @password)", connection))
            {
                commandRegister.Parameters.AddWithValue("@MemberId", member_id);
                commandRegister.Parameters.AddWithValue("@fname", fname.Text);
                commandRegister.Parameters.AddWithValue("@mname", mname.Text);
                commandRegister.Parameters.AddWithValue("@lname", lname.Text);
                commandRegister.Parameters.AddWithValue("@phone", phone.Text);
                commandRegister.Parameters.AddWithValue("@age", age.Text);
                commandRegister.Parameters.AddWithValue("@email", email.Text);
                commandRegister.Parameters.AddWithValue("@password", password.Text);

                commandRegister.ExecuteNonQuery();
            }

            connection.Close();
        }
    }

    private bool MemberIdExists(SqlConnection connection, int memberId)
    {
        using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Member WHERE member_id = @MemberId", connection))
        {
            command.Parameters.AddWithValue("@MemberId", memberId);
            return (int)command.ExecuteScalar() > 0;
        }
    }
}

