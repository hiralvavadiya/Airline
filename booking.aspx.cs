using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airline.adminside
{
    public partial class booking : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectDB();
            fnbindgrid();
            fnbindpassengername();
            fnbindflightno();
        }

        protected void fnConnectDB()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                conn = new SqlConnection(constr);
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                }
            }
            catch (Exception e)
            {
                Response.Write(e.ToString());
            }
        }

        protected void fnbindgrid()
        {
            fnConnectDB();
            string qry = "SELECT b.booking_id, p.full_name, f.flight_no, b.seat_no, b.boooking_status FROM tblbooking b, tblpassengers p, tblflight f WHERE f.flight_no = b.flight_no AND p.passenger_id = b.passenger_id";
            cmd = new SqlCommand(qry, conn);
            sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            gdvbooking.DataSource = ds;
            gdvbooking.DataBind();
            conn.Close();
        }
        protected void fnbindpassengername()
        {
            try
            {
                fnConnectDB();
                string qry = "SELECT * FROM tblpassengers";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                sda.Fill(ds2);
                ddlpassengerid.DataSource = ds2;
                ddlpassengerid.DataTextField = ds2.Tables[0].Columns["full_name"].ToString();
                ddlpassengerid.DataValueField = "passenger_id";
                ddlpassengerid.DataBind();
                conn.Close();
                ddlpassengerid.Items.Insert(0, new ListItem("Select Name"));
            } catch (Exception e)
            {
                Response.Write(e.ToString());
            }
        }

        protected void fnbindflightno()
        {
            try {
            fnConnectDB();
            string qry = "SELECT * FROM tblflight";
            cmd = new SqlCommand(qry, conn);
            sda = new SqlDataAdapter(cmd);
            DataSet ds2 = new DataSet();
            sda.Fill(ds2);
            ddlflightno.DataSource = ds2;
            ddlflightno.DataTextField = ds2.Tables[0].Columns["flight_no"].ToString();
            ddlflightno.DataValueField = "aircraft_id";
            ddlflightno.DataBind();
            conn.Close();
            ddlflightno.Items.Insert(0, new ListItem("Select Flight No"));
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string qry = "UPDATE tblbooking SET passenger_id = @passid, flight_no = @flightno, seat_no = @seat, boooking_status = @status WHERE ";
            cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("passid", ddlpassengerid.SelectedValue);
            cmd.Parameters.AddWithValue("flightno", ddlflightno.SelectedValue);
            cmd.Parameters.AddWithValue("seat", txtseatno.Text);
            cmd.Parameters.AddWithValue("status", rblbookingstatus.SelectedValue);
            //cmd.Parameters.AddWithValue("bid", );
            int res = cmd.ExecuteNonQuery();
            if(res > 0)
            {
                Response.Write("Updated Successfully");
            } else
            {
                Response.Write("Failedd");
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            ddlpassengerid.SelectedIndex = -1;
            ddlflightno.SelectedIndex = -1;
            txtseatno.Text = string.Empty;
            rblbookingstatus.ClearSelection();
        }

        protected void gdvbooking_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = gdvbooking.SelectedRow;
            //passenger id
            for (int i = 0; i < ddlpassengerid.Items.Count; i++)
            {
                if (ddlpassengerid.Items[i].Text == rw.Cells[2].Text)
                {
                    ddlpassengerid.SelectedIndex = i;
                }
            }
            //flight no
            for (int i = 0; i < ddlflightno.Items.Count; i++)
            {
                if (ddlflightno.Items[i].Text == rw.Cells[3].Text)
                {
                    ddlflightno.SelectedIndex = i;
                }
            }
            txtseatno.Text = rw.Cells[4].Text;
            //aircraft id
            for (int i = 0; i < rblbookingstatus.Items.Count; i++)
            {
                if (rblbookingstatus.Items[i].Text == rw.Cells[5].Text)
                {
                    rblbookingstatus.SelectedIndex = i;
                }
            }
        }
    }
}