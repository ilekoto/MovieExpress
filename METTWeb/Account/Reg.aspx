<%@ Page Title="" Language="C#" MasterPageFile="~/SiteLoggedOut.Master" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="MEWeb.Account.Reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent1" runat="server">
<link href="../Theme/Singular/Custom/loggedout.css" rel="stylesheet" />
  <link href="../Theme/Singular/css/loginandlockscreen.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="server">
    <%
        using(var h = this.Helpers)
        {
            var toolbar = h.Toolbar();
            {
                toolbar.Helpers.HTML().Heading2("Register");

            }
            h.MessageHolder();
            var RegistrationDIv = h.Div();
            {

                ////var FPtoolbar = RegistrationDIv.Helpers.Toolbar();
                //{
                //    FPtoolbar.Helpers.HTML().Heading2("");
                //}
                var fieldSet =  RegistrationDIv.Helpers.FieldSetFor<MELib.User.User>("Registration", c => c.UserList);
                {
                    fieldSet.AddClass("StackedEditors SUI-RuleBorder");
                    fieldSet.Style["max-width"] = "420px";
                    //var FPDetailsDiv = RegistrationDIv.Helpers.DivC("m-t-md");
                    var UserName = fieldSet.Helpers.DivC("row");
                    {
                        var UserNameLabel = UserName.Helpers.HTMLTag("label", "UserName");
                        UserName.Helpers.EditorFor(c => c.UserName);
                    }
                    var FirstName = fieldSet.Helpers.DivC("row");
                    {
                        //var FirstNameLabel = FirstName.Helpers.HTMLTag("label", "FirstName");
                        UserName.Helpers.EditorRowFor(c => c.FirstName);
                        UserName.Helpers.EditorRowFor(c => c.LastName);
                        UserName.Helpers.EditorRowFor(c => c.Password);
                        UserName.Helpers.EditorRowFor(c => c.EmailAddress);
                        UserName.Helpers.EditorRowFor(c => c.ContactNumber);
                    }
                    var Registerbutton = UserName.Helpers.Button("Register", "Registration");
                    {
                        Registerbutton.AddBinding(Singular.Web.KnockoutBindingString.click, "Register($data)");
                        Registerbutton.ClickOnEnterKey = true;
                    }

                }

                //var Backbtn = RegistrationDIv.Helpers.Button("", "Back");
                //{
                //    Registerbutton.AddBinding(Singular.Web.KnockoutBindingString.click, "Back()");
                //    Registerbutton.ClickOnEnterKey = true;
                //}

            }

        }
        %>
 <script type="text/javascript">
     //var Register = function (obj) {
     //     Singular.Validation.IfValid(ViewModel, function () {
     //         Singular.ShowLoadingBar();
     //         ViewModel.CallServerMethod('Register', { LoginDetails: ViewModel.LoginDetails.Serialise() }, function (result) {
     //             if (result.Success) {
     //                 window.location = result.Data ? result.Data : ViewModel.RedirectLocation();
     //                 Singular.HideLoadingBar();
     //             } else {
     //                 ViewModel.LoginDetails().Password('');
     //                 Singular.AddMessage(1, 'Register', result.ErrorText).Fade(2000);
     //                 Singular.HideLoadingBar();
     //             }
     //         });
     //     });
     //}
     var Register = function (obj) {
         //console.log(obj);
         ViewModel.CallServerMethod('Register', { UserName: obj.UserName(), FirstName: obj.FirstName(), LastName: obj.LastName(), Password: obj.Password(), EmailAddress: obj.EmailAddress(), ContactNumber: obj.ContactNumber() , ShowLoadingBar: true }, function (result) {
             if (result.Success) {
                 console.log(result.Data);
                 ViewModel.CartList.Set(result.Data);

                 MEHelpers.Notification("Successfully Saved", 'center', 'success', 3000);
                 location.reload();
             }
             else {
                 MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
             }
         });
     }

     var Back = function () {
         window.location = '../Account/Home.aspx';
     }
 </script>
</asp:Content>
