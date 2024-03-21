<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientprofile.aspx.cs" Inherits="airindia.clientprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Client Profile</title>
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
         /* #txtpassword, #txtusername{
              margin:20px 100px 20px 100px;
         } */
         .btn-home{
            border: 1px solid #001b94;
            background: #001b94;
            border-radius: 4px;
            color:white;
            letter-spacing: .02875rem;
            font-weight: 400;
            padding: 0.75rem;
            margin-right:-100px;
         }
    </style>
</head>
<body class="bg">
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Image ID="userimg" runat="server" Height="50px" Width="50px"/>
            <table class="table-bg">
                <tr>
                    <td colspan="2"><h1>Personal Info</h1></td>
                </tr>
                <tr>
                    <td><h4>Mobile Number:</h4></td>
                    <td><asp:Label ID="Label1" runat="server" Text="Label" CssClass="form-control w-50 my-2"></asp:Label></td>
                </tr>
                <tr>
                    <td><h4>Email:</h4></td>
                    <td><asp:Label ID="Label2" runat="server" Text="Label" CssClass="form-control w-50 my-2"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnhome" CssClass="btn-home my-5" runat="server" Text="Home" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
