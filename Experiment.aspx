<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Experiment.aspx.cs" Inherits="airline_management_system.Experiment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        .bg{
              display: flex;
              height: 100vh;
              justify-content: center;
              align-items: center;
              text-align: center;
              background-image: linear-gradient(90deg,#12c2e9,#c471ed,#f64f59);
        }
       
ul {
  display: flex;
  flex-direction: column;
  align-items: start;
  list-style-type: none;

  li {
    padding: 6px 0;

    a {
      position: relative;
      --bs-btn-color: #0d6efd;
      display: block;
      padding: 4px 0;
      font: 700 3rem Raleway, sans-serif;
      text-decoration: none;
      text-transform: uppercase;
    }
  }
}
        .btn{
                --bs-btn-font-size: 2rem!important;
                --bs-btn-border-width: 2px !important;
        }
    </style>
</head>
<body class="bg">
    <form id="form1" runat="server">
        <div>
            <ul>
            <li><a><asp:Button ID="btnairline" runat="server" Text="Airline" CssClass="btn btn-outline-primary"/></a></li>
            <li><a><asp:Button ID="btnaircraft" runat="server" Text="Aircraft" CssClass="btn btn-outline-primary" /></a></li>
            <li><a><asp:Button ID="btnairport" runat="server" Text="Airport"  CssClass="btn btn-outline-primary"/></a></li>
            <li><a> <asp:Button ID="btnflight" runat="server" Text="Flight" CssClass="btn btn-outline-primary" /></a></li>
            <li><a><asp:Button ID="btnbooking" runat="server" Text="Booking" CssClass="btn btn-outline-primary" /></a></li>
            </ul>        
        </div>
    </form>
</body>
</html>