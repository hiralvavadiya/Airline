<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientlogin.aspx.cs" Inherits="airindia.clientlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Side</title>
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
         #txtpassword, #txtusername{
              margin:20px 100px 20px 140px;
         }
         #gvdairline {
             margin-left:auto;
             margin-right:auto;
         }
         .btn-login{
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
                    <td colspan="2"><h1>Login</h1></td>
                </tr>
                <tr>
                    <%--<td><h4>Email :</h4></td>--%>
                    <td>
                        <asp:TextBox ID="txtusername" CssClass="form-control  w-50"  placeholder="Enter email" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <%--<td><h4>Password :</h4></td>--%>
                    <td>
                        <asp:TextBox ID="txtpassword" CssClass="form-control w-50" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnlogin" runat="server"  CssClass="btn-login mx-2 my-5" Text="Login" OnClick="btnlogin_Click"/>
                        <br />
                        <asp:LinkButton ID="linkbtnnewacc" CssClass="link-success" runat="server" Text="Create new account?" OnClick="linkbtnnewacc_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

