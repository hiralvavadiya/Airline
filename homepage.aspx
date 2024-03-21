<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="airindia.homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
    <style>
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
         #txtpassword, #txtusername{
              margin:20px 100px 20px 100px;
         }
         #gvdairline {
             margin-left:auto;
             margin-right:auto;
         }
         .btn-search{
                 background: #001b94;
                 border: 1px solid #001b94;
                 border-radius: 4px;
                 color:white;
                 letter-spacing: .02875rem;
                 font-weight: 400;
                 padding: 0.75rem;
                 margin:30px auto;
         }
         .dr-flex{
              display:flex;
              justify-content:space-evenly;

         }
         .d-flex{
             display:flex;
             justify-content:space-evenly;
         }
    </style>
</head>
<body class="bg">
    <form id="form1" runat="server">
        <div>
        <table class="table-bg">
    <tr>
        <td colspan="2" CssClass="mt-4";>
            <asp:RadioButtonList ID="rblways" runat="server" RepeatDirection="Horizontal" CssClass="form-control dr-flex mx-auto w-50 my-2">
                <asp:ListItem>&nbsp; One Way &nbsp;&nbsp;</asp:ListItem>
                <asp:ListItem>&nbsp; Round way</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="d-flex">
             <h6>From:</h6>
            <asp:DropDownList ID="ddlfromairport" runat="server" CssClass="form-control w-50 my-2">
            </asp:DropDownList>
        </td>
        <br />
        <td class="d-flex">
            <h6>To :</h6>
            <asp:DropDownList ID="ddltoairport" runat="server" CssClass="form-control w-50 my-2">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="d-flex">
            <h6>Departure Date :</h6> <asp:TextBox ID="txtdeparturedate" runat="server" TextMode="Date" CssClass="form-control my-2 w-50"></asp:TextBox>
        </td>
        <td class="d-flex">
            <h6>Return Date : </h6><asp:TextBox ID="txtreturndate" runat="server" TextMode="Date" CssClass="form-control my-2 w-50"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnsearch" runat="server" Text="Search Flight" OnClick="btnsearch_Click" class="btn-search"/>
            &nbsp;</td>
    </tr>
         </table>
        </div>
    </form>
</body>
</html>

