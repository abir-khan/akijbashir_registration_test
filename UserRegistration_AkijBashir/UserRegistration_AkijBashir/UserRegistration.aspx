<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs"
    Inherits="UserRegistration_AkijBashir.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <title></title>
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/pages.css" rel="stylesheet" />
    <link href="assets/css/icons.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" type="text/css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous" />
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-password-toggler.js"></script>
    <%--<script type="text/javascript">    
    
        function userValid() {    
           var UName= document.getElementById("txtUsername").value;    
           var Pwd= document.getElementById("txtPassword").value;    
    
           if (UName == '')    
           {    
               alert("Please enter User Name");
               
            return false;    
           }    
    
           if (Pwd == '')    
           {    
           alert("Please enter Password");    
           return false;    
           }    
        }    
     </script> --%>
    <script type="text/javascript">
        $(document).keydown(function (e) {
            var keycode1 = (e.keyCode ? e.keyCode : e.which);
            if (keycode1 == 0 || keycode1 == 9) {
                e.preventDefault();
                e.stopPropagation();
            }
        });

        $(document).ready(function () {
            $("#btnLogin").on('click', function () {
                var regex = "^[a-zA-Z0-9]+$";

                debugger;
                if ($("#txtUsername").val() == '') {
                    document.getElementById("txtUsername-error").innerHTML = "Please enter Username";
                    $("#bar").addClass('color');
                    $("#txtUsername").focus();
                    $('#txtUsername-lbl').addClass('lbl-color');
                    $('#txtUsername').addClass('inp-color');
                    return;
                }
                else if (!$("#txtUsername").val().match(regex)) {
                    debugger
                    document.getElementById("txtUsername-error").innerHTML = "The username contains only letters and numbers";
                    $("#bar").addClass('color');
                    $("#txtUsername").focus();
                    $('#txtUsername-lbl').addClass('lbl-color');
                    $('#txtUsername').addClass('inp-color');
                    return false;
                }
                else {
                    document.getElementById("txtUsername-error").innerHTML = "";
                    $('#txtUsername-lbl').removeClass('lbl-color');
                    $('#txtUsername').removeClass('inp-color');
                    return;
                }

                //if ($("#txtPassword").val() == '') {
                //    document.getElementById("password-error").innerHTML = "Please enter your password";
                //    $('#txtPassword-lbl').addClass('lbl-color');
                //    $("#bar2").addClass('color');
                //    $('#txtPassword').addClass('inp-color');
                //    $("#txtPassword").focus();
                //    return;
                //}
            });
        });
    </script>
</head>
<body>
    <div style="background-image: url('assets/images/akijbashir.jpg'); position: fixed; left: 0; top: 0; width: 100%; height: 100%; background-size: cover; filter: blur(5px);"></div>
    <form>
        <div style="height: 100%; margin-top: 8%">
            <div class="wrapper-page">
                <div class="panel panel-color panel-primary panel-pages">
                    <div>
                        <div class="d-flex justify-content-center h-100">
                            <div class="user_card">
                                <div class="d-flex justify-content-center">

                                    <div class="brand_logo_container">
                                        <img src="assets/images/logo-group.jpg" class="brand_logo" alt="Logo" />
                                    </div>
                                </div>

                                <div class="form-blk" style="margin-top:115px">

                                    <form name="Form1" id="Form1" action="UserRegistration.aspx" runat="server">



                                        <div class="input-group-append">
                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            <asp:TextBox ID="txtUsername"
                                                MaxLength="150" type="text"
                                                placeholder="Username" runat="server"
                                                CssClass="form-control input-lg" TabIndex="1"
                                                required=""></asp:TextBox>
                                        </div>
                                        <span class="highlight"></span>
                                        <p class="help-block" id="txtUsername-error"></p>
                                        <div class="input-group-append">
                                            <asp:TextBox ID="txtPassword" class="second" placeholder="Password" type="current-password"
                                                MaxLength="150" Text="" runat="server"
                                                CssClass="form-control input-lg" TabIndex="2"
                                                data-toggle="password" required=""></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group text-center m-t-40">
                                            <div class="group-last clearfix">
                                                <asp:Button ID="btnLogin" runat="server" type="button" Text="Submit" value="Next"
                                                    CssClass="button buttonBlue" TabIndex="3"
                                                    Style="width: 100%; z-index: 999" OnClick="btnLogin_Click" />
                                            </div>
                                            <br />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>


</body>
</html>
