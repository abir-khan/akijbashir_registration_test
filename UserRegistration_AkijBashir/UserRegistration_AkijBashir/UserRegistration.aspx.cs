using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserRegistration_AkijBashir
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e) {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            bool userIsTrue = false;
            bool passIsTure = false;
            if(username.Length >= 6)
            {
                userIsTrue = true;
            }
            else
            {
                System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                sb2.Append(@"<script language='javascript'>");
                sb2.Append(@"swal('The username is at least 6 characters long', '', 'warning');");
                sb2.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb2.ToString(), false);
            }
            if (password.Length >= 8)
            {
                passIsTure = true;
            }
            else
            {
                System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                sb2.Append(@"<script language='javascript'>");
                sb2.Append(@"swal('The password is at least 8 characters long', '', 'warning');");
                sb2.Append(@"</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb2.ToString(), false);
            }
            if(userIsTrue == true && passIsTure == true)
            {
                SqlConnection con = new SqlConnection("Data Source=ITDEV23;Initial Catalog = HRNITOL06;;User ID=sa;Password=123;Trusted_Connection=true;");
                SqlCommand cmd = new SqlCommand("select * from tblUserRegistration_t where Username=@username", con);
                cmd.Parameters.AddWithValue("@username", username);                
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                
                try
                {
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {

                }
                
                

                if (dt.Rows.Count > 0)
                {
                    System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                    sb2.Append(@"<script language='javascript'>");
                    sb2.Append(@"swal('Username is already available', '', 'warning');");
                    sb2.Append(@"</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb2.ToString(), false);
                }
                else
                {                    
                    var md5 = new MD5CryptoServiceProvider();
                    MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
                    UTF8Encoding encoder = new UTF8Encoding();
                    Byte[] hashedBytes;
                    hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(txtPassword.Text));
                    string password_ = BitConverter.ToString(hashedBytes);

                    SqlConnection conn = new SqlConnection("Data Source=ITDEV23;Initial Catalog = HRNITOL06;;User ID=sa;Password=123;Trusted_Connection=true;");
                    SqlCommand cmdSave = new SqlCommand("SpUserRegistration_ak", con);
                    cmdSave.CommandType = CommandType.StoredProcedure;
                    cmdSave.Parameters.AddWithValue("@username", username);
                    cmdSave.Parameters.AddWithValue("@password_", password_);                    
                   
                    try
                    {
                        con.Open();
                        int k = cmdSave.ExecuteNonQuery();
                        con.Close();

	                    System.Text.StringBuilder sb2 = new System.Text.StringBuilder();
                    sb2.Append(@"<script language='javascript'>");
                    sb2.Append(@"swal('Success', '', 'success');");
                    sb2.Append(@"</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb2.ToString(), false);
			Response.Redirect("SuccessFullPage.aspx",true);
                    }
                    catch(Exception ex)
                    {

                    }
                    
                   

                }
            }
        }

        public DataTable GetDataTableByCommand(string strSQL, SqlConnection Conn)
        {
            try
            {

                SqlCommand cmd = new System.Data.SqlClient.SqlCommand(strSQL, Conn);
                cmd.CommandTimeout = 300; // 5 mins 
                cmd.CommandType = System.Data.CommandType.Text;

                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

        }
    }
}