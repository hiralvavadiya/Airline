<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newaccount.aspx.cs" Inherits="airindia.newaccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Account</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <style type="text/css">
         .bg{
            background-image: linear-gradient(90deg,#4286f4,#373B44);
        }
         h1{
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
         .btn-signup, .btn-reset{
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
                    <td ><h1>Sign Up Now!</h1></td>
                </tr>
                <tr>
                    <td >
                        <asp:TextBox ID="txtfullname" runat="server" Placeholder="Full Name" style="text-align: center;" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:TextBox ID="txtemail" runat="server" Placeholder="Email" style="text-align: center;" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server" Placeholder="Password" TextMode="Password" style="text-align: center;" CssClass="form-control w-50 my-2" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtphoneno" runat="server" Placeholder="Phone Number" style="text-align: center;" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtdob" runat="server" TextMode="Date" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtage" runat="server" Placeholder="Age" style="text-align: center;" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                        <asp:RadioButtonList ID="rblgender" runat="server" RepeatDirection="Horizontal" CssClass="form-control w-50 my-2">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" Placeholder="Address" TextMode="MultiLine" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtcity" runat="server" Placeholder="City" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtstate" runat="server" Placeholder="State" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtcountry" runat="server" Placeholder="Country" CssClass="form-control w-50 my-2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnsignup" CssClass="btn-signup mx-2 my-5" runat="server" Text="SignUp" OnClick="btnsignup_Click" />
                        <asp:Button ID="btnreset" CssClass="btn-reset mx-2 my-5" runat="server" Text="Reset" OnClick="btnreset_Click" />
                    </td>
                </tr>
            </table>
            
            
        </div>
    </form>

    <script></script>
</body>
</html>

