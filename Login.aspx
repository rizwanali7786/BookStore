<%@ Page Title="Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Store.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <%--    <link type="text/css" href="../style.min.css" rel="stylesheet" />--%>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet2.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .btn-lg {
            border-radius: 50px;
            font-weight: 800;
            font-variant-caps: petite-caps;
            font-family: Arial;
        }

        .input-lg {
            border-radius: 50px;
        }

        .btn-lg:hover {
            color: #ccc91a;
            background-color: #216523;
        }

        h1 {
            font-size: 50px;
            font-weight: 800;
            font-variant-caps: petite-caps;
            text-align: center;
            color: #a10e0e;
            margin-left: 5px;
            margin-top: -10px;
            font-family: 'Times New Roman', Times, serif;
        }

        body {
            background-color: #1d232e;
        }

        .panel {
            margin-left: 500px;
            margin-top: 70px;
            height: 650px;
            width: 700px;
            background-color: #fff;
        }

        .panel-body {
            margin-left: -50px;
        }

        a {
            list-style-type: none;
        }
    </style>
</head>
<body>
    <div class="stars">
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
    </div>
    <form runat="server">
        <section id="main-content">
            <section id="wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <div class="panel-heading">
                                <div class="col-md-6 col-md-offset-3">
                                    <img src="images/bookstore-logo-template-design-logo.jpg" width="360" alt="logo" style="margin-left: -25px;" />
                                    <h1>Admin</h1>
                                </div>
                            </div>
                            <div id="myform">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-3">
                                            <div class="form-group" style="margin-top: 10px;">
                                                <i class="fas fa-user" style="color: blue"></i>
                                                <asp:Label ForeColor="#f7c00e" runat="server" Text="UserName" />
                                                <asp:TextBox ID="txtUserName" BorderStyle="Solid" BorderColor="#3399ff" runat="server" MaxLength="60" CssClass="form-control input-lg" AutoCompleteType="Disabled" Width="400" placeholder="UserName" />
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUserName" ID="RequiredFieldValidator2" ErrorMessage="EnterUserName*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 col-md-offset-3">
                                            <div class="form-group" id="fontsome" style="margin-top: 10px;">
                                                <span class="fas fa-lock" style="color: crimson"></span>
                                                <asp:Label ForeColor="#f7c00e" runat="server" Text="Password" />
                                                <asp:TextBox ID="txtPassword" BorderStyle="Solid" BorderColor="#3399ff" TextMode="Password" runat="server" AutoCompleteType="Disabled" MaxLength="60" CssClass="form-control input-lg" Width="400" placeholder="Password" /><i class="fa fa-eye-slash" id="showpassword"></i>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ID="RequiredFieldValidator1" ErrorMessage="EnterPassword*" Display="Dynamic" ForeColor="#ff0000" Font-Bold="true" SetFocusOnError="True" ValidationGroup="VBGValidate"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-3">
                                            <div>
                                                <asp:CheckBox runat="server" ID="CheckRememberMe" Text="Remember Me!" Font-Bold="true" ForeColor="#41869c" CssClass="checkbox-inline" />
                                            </div>
                                            <asp:Label runat="server" ID="lblMessage" CssClass="text-center" Width="300" Font-Bold="true" ForeColor="Red"> </asp:Label>
                                            <div class="form-group" style="margin-top: 20px;">
                                                <asp:Button runat="server" Font-Size="Larger" Text="Login" ID="btn_login" Width="400" Height="50" OnClick="btn_login_Click" CssClass="btn btn-primary btn-lg" ValidationGroup="VBGValidate" />
                                            </div>
                                            <div style="margin-left: 60px; text-align: center;">
                                                <a href="SignUp.aspx" role="button" class="btn btn-success btn-lg" style="color: #22850a; width: 400px; margin-left: -60px; font-size: 20px; font: 700" title="Click Here To Create New Account!">Signup</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </section>
        <script>
            $(document).ready(function () {
                $('#showpassword').click(function () {
                    var classvalue = $(this).attr('class');
                    if (classvalue == 'fa fa-eye-slash') {
                        $(this).attr('class', 'fa fa-eye');
                        $('#txtPassword').attr('type', 'text');
                    } else {
                        $(this).attr('class', 'fa fa-eye-slash');
                        $('#txtPassword').attr('type', 'password');
                    }
                });
              
                //$('#ckbox').click(function () {
                //    var currentpasswordfield = $('#txtPassword');
                //    var currentpassword = currentpasswordfield.val();
                //    currentpasswordfield.remove();
                //    if ($(this).is(':checked')) {
                //        $(this).before('<input type="text" class="form-control input-lg" style="width:400px; border:2px solid dodgerblue;" id="txtPassword" value="' + currentpassword + '"/>');
                //    }
                //    else {
                //        $(this).before('<input type="password" class="form-control input-lg" style="width:400px; border:2px solid dodgerblue;" id="txtPassword" value="' + currentpassword + '"/>');
                //    }
                //})
            });
        </script>
    </form>
    <style>
        #showpassword {
            position: absolute;
            left: 376px;
            top: 42px;
            font-size: 25px;
            color: #0a460f;
        }
    </style>
</body>
</html>
