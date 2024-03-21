<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientwelcome.aspx.cs" Inherits="airindia.clientwelcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <style type="text/css">
      .bg{
            background-image: linear-gradient(90deg,#4286f4,#373B44);
        }
         h1{
         /* text-decoration:underline 1px;*/
             padding:40px 0px 30px 0px;
         }
         .table-bg {
             background-color: white;
             text-align: center;
             border-radius: 16px;
             margin: 120px auto;
             width:500px;
         }
         tr {
             padding:200px;
         }
         .btn-profile, .btn-logout{
            border: 1px solid #001b94;
            background: #001b94;
            border-radius: 4px;
            color:white;
            letter-spacing: .02875rem;
            font-weight: 400;
            padding: 0.75rem;
         }
    </style>
</head>
<body class="bg">
    <form id="form1" runat="server">
        <div>
            <table class="table-bg">
                <tr>
                    <td class="auto-style2"><h1>Welcome!</h1>
                        <br />
&nbsp;&nbsp; <asp:Label ID="lbluser" runat="server" Text="Label" CssClass="form-control w-50 my-2"></asp:Label>
                        &nbsp;&nbsp;
                        <br />
                        <asp:Button ID="btnlogout" runat="server" CssClass="btn-logout mx-2 my-5" Text="Logout" OnClick="btnlogout_Click" />
                    &nbsp;&nbsp;
                    </td>
                </tr>
            </table>
            <table class="table-bg">
                <tr>
                    <td><h1>Home</h1><br />
                        <br />
                        <%--<asp:Button ID="btnmngbooking" runat="server" Text="Manage Booking" />--%>
                        <br />
                        <br />
                        <%--<asp:Button ID="btnbookticket" runat="server" Text="Book Ticket" OnClick="btnbookticket_Click" />--%>
                        <br />
                        <br />
                        <asp:Button ID="btnprofile" runat="server" CssClass="btn-profile mx-2 my-5" Text="Profile" OnClick="btnprofile_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

