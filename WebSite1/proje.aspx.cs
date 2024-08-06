using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class proje : System.Web.UI.Page
{
    string connectionString = "Data Source=DCC;Initial Catalog=ReaDorm2;Integrated Security=True;";



    protected void Page_Load(object sender, EventArgs e)
    {

    }
     
   

   protected void button_Click(object sender, EventArgs e)
{

        // Kullanıcı adı ve telefon numarası alınır
        string username = txtUserName.Text;
        string member_password = txtPassword.Text; // Parola alanını telefon numarası olarak kullanıyoruz

        // Kullanıcı adı ve telefon numarası kontrolü yapılır
        if (ValidateUser(username, member_password))
        {
            // Get the member_id of the logged-in user
            int memberId = GetMemberId(username);

            // Store the member_id in a session variable
            Session["LoggedInUserId"] = memberId;

            // Redirect to proje1.aspx
            Response.Redirect("proje1.aspx");
        }
        else
        {
            // Kullanıcı doğrulanamadıysa hata mesajı gösterilebilir veya aynı sayfada kalınabilir
            // Örneğin:

        }
 }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // Temporarily remove any conditions and directly redirect
        Response.Redirect("newUser.aspx");
    }



    private bool ValidateUser(string username, string member_password)
    {
        // SQL Server bağlantı dizesi ve sorgusu

        string query = "SELECT COUNT(*) FROM Member WHERE email = @Username AND member_password = @password";

        // SQL bağlantısı ve komut oluşturulur
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Parametreler eklenir
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@password", member_password);

                // Bağlantı açılır
                connection.Open();

                // Kullanıcı varsa 1, yoksa 0 döner
                int count = (int)command.ExecuteScalar();

                // Bağlantı kapatılır
                connection.Close();

                // Kullanıcı doğrulama kontrolü yapılır
                return count > 0;
            }
        }
    }
    private int GetMemberId(string username)
    {
        string query = "SELECT member_id FROM Member WHERE email = @Username";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Username", username);

                connection.Open();

                // ExecuteScalar returns the first column of the first row
                object result = command.ExecuteScalar();

                connection.Close();

                // Convert the result to an integer (member_id)
                return result != null ? Convert.ToInt32(result) : -1;
            }
        }
    }

}
