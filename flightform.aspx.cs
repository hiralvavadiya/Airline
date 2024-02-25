using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace airline
{
    public partial class flightform : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fnbindaircraft();
                fnbindarrivalairport();
                fnbinddepartureairport();
            }
            fnbindgrid();
        }

        protected void fnConnectDB()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                conn = new SqlConnection(constr);
                if(conn.State != ConnectionState.Open)
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
            try
            {
                fnConnectDB();
                string qry = "SELECT f.flight_no, f.departure_time, f.arrival_time, d.airport_name AS departure_airport_name, a.airport_name AS arrival_airport_name, c.model AS aircraft_model FROM tblflight f JOIN tblairport d ON f.departure_airport_code = d.airport_code JOIN tblairport a ON f.arrival_airport_code = a.airport_code JOIN tblaircraft c ON f.aircraft_id = c.aircraft_id";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet d = new DataSet();
                sda.Fill(d);
                gdvflight.DataSource = d;
                gdvflight.DataBind();
                conn.Close();
            } catch (Exception e)
            {
                Response.Write(e.ToString());
            }
        }

        public void fnbindaircraft()
        {
            try
            {
                fnConnectDB();
                string qry = "SELECT * FROM tblaircraft";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                sda.Fill(ds2);
                ddlaircraftid.DataSource = ds2;
                ddlaircraftid.DataTextField = ds2.Tables[0].Columns["model"].ToString();
                ddlaircraftid.DataValueField = "aircraft_id";
                ddlaircraftid.DataBind();
                conn.Close();
                ddlaircraftid.Items.Insert(0, new ListItem("Select Aircraft"));
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void fnbindarrivalairport()
        {
            try
            {
                fnConnectDB();
                string qry = "SELECT * FROM tblairport";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds2 = new DataSet();
                sda.Fill(ds2);
                ddlarrivalairport.DataSource = ds2;
                ddlarrivalairport.DataTextField = ds2.Tables[0].Columns["airport_name"].ToString();
                // text field name of table dispalyed in dropdown
                ddlarrivalairport.DataValueField = "airport_code";
                ddlarrivalairport.DataBind();
                conn.Close();
                ddlarrivalairport.Items.Insert(0, new ListItem("Select Arrival Airport"));
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void fnbinddepartureairport()
        {
            try
            {
               fnConnectDB();
               string qry = "SELECT * FROM tblairport";
               cmd = new SqlCommand(qry, conn);
               sda = new SqlDataAdapter(cmd);
               DataSet ds2 = new DataSet();
               sda.Fill(ds2);
               ddldepartureairport.DataSource = ds2;
               ddldepartureairport.DataTextField = ds2.Tables[0].Columns["airport_name"].ToString();
               ddldepartureairport.DataValueField = "airport_code";
               ddldepartureairport.DataBind();
               conn.Close();
               ddldepartureairport.Items.Insert(0, new ListItem("Select Departure Airport"));
            }
            catch (Exception ex)
            {
               Response.Write(ex.ToString());
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                fnConnectDB();
                string qry = "INSERT INTO tblflight(flight_no, departure_airport_code, arrival_airport_code, departure_time, arrival_time, aircraft_id) VALUES(@flightno, @departairport, @arriairport, @departime, @arritime, @airid)";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("flightno", txtflightno.Text);
                cmd.Parameters.AddWithValue("departairport", ddldepartureairport.SelectedValue);
                cmd.Parameters.AddWithValue("arriairport", ddlarrivalairport.SelectedValue);
                cmd.Parameters.AddWithValue("departime", txtdeparturetime.Text);
                cmd.Parameters.AddWithValue("arritime", txtarrivaltime.Text);
                cmd.Parameters.AddWithValue("airid", ddlaircraftid.SelectedValue);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    Response.Write("Inserted Successfully!");
                } else
                {
                    Response.Write("Fail to insert");
                }
                conn.Close();
                fnbindgrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            txtflightno.Text = string.Empty;
            ddldepartureairport.ClearSelection();
            txtdeparturetime.Text = string.Empty;
            ddlarrivalairport.ClearSelection();
            txtarrivaltime.Text = string.Empty;
            ddlaircraftid.ClearSelection();
        }

        protected void gdvflight_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow rw = gdvflight.SelectedRow;
            txtflightno.Text = rw.Cells[1].Text;
            txtdeparturetime.Text = rw.Cells[3].Text;
            txtarrivaltime.Text = rw.Cells[5].Text;
            //departure airport code
            for (int i = 0; i < ddldepartureairport.Items.Count; i++)
            {
                if (ddldepartureairport.Items[i].Text == rw.Cells[2].Text)
                {
                    ddldepartureairport.SelectedIndex = i;
                }
            }
            //arrival airport code
            for (int i = 0; i < ddlarrivalairport.Items.Count; i++)
            {
                if (ddlarrivalairport.Items[i].Text == rw.Cells[4].Text)
                {
                    ddlarrivalairport.SelectedIndex = i;
                }
            }
            //aircraft id
            for(int i = 0; i < ddlaircraftid.Items.Count; i++)
            {
                if (ddlaircraftid.Items[i].Text == rw.Cells[6].Text)
                {
                    ddlaircraftid.SelectedIndex = i;
                }
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                fnConnectDB();
                string qry = "UPDATE tblflight SET departure_airport_code = @depaircode, arrival_airport_code = @arraircode, departure_time = @departime, arrival_time = @arritime WHERE flight_no = @flino";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("depaircode", ddldepartureairport.SelectedValue);
                cmd.Parameters.AddWithValue("arraircode", ddlarrivalairport.SelectedValue);
                cmd.Parameters.AddWithValue("departime", txtdeparturetime.Text);
                cmd.Parameters.AddWithValue("arritime", txtarrivaltime.Text);
                cmd.Parameters.AddWithValue("flino", txtflightno.Text);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    Response.Write("Updated Successfully");
                }
                else
                {
                    Response.Write("Failed");
                }
                fnbindgrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void gdvflight_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                fnConnectDB();
                string qry = "DELETE FROM tblflight WHERE flight_no = @flightno";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("flightno", txtflightno.Text);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    Response.Write("Delete Successfully");
                }
                else
                {
                    Response.Write("Failed");
                }
                fnbindgrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}