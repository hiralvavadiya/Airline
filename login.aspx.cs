using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airline
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectdb();
        }

        protected void fnConnectdb() 
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                conn = new SqlConnection(constr);
                if (conn.State != System.Data.ConnectionState.Open)
                {
                    conn.Open();
                    //Response.Write("Connected!!");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                fnConnectdb();
                string qry = "SELECT COUNT(*) FROM tbladminlogin WHERE Username = @user AND Password = @pass";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("user", txtusername.Text);
                cmd.Parameters.AddWithValue("pass", txtpassword.Text);
                int cn = (int) cmd.ExecuteScalar(); 
                if(cn > 0)
                {
                    Session["loginadmin"] = txtusername.Text;
                    Response.Redirect("~/adminside/welcome.aspx");
                } else
                {
                    Response.Redirect("~/adminside/login.aspx");
                    //Response.Write("Incorrect username and password");
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}