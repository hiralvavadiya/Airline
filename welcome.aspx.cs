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
    public partial class welcome : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static string logged = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectdb();
            if (Session["loginadmin"] != null)
            {
                logged = Session["loginadmin"].ToString();
            }
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
        protected void btnairline_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminside/airline.aspx");
        }

        protected void btnaircraft_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminside/aircraft.aspx");
        }

        protected void btnairport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminside/airport.aspx");
        }

        protected void btnflight_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminside/flightform.aspx");
        }

        protected void btnbooking_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/adminside/booking.aspx");
        }
    }
}