<%@ Page Title="Log In" Language="C#" MasterPageFile="~/SiteLoggedOut.Master" AutoEventWireup="false" CodeBehind="Login.aspx.cs" Inherits="MEWeb.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent1">
  <link href="../Theme/Singular/Custom/loggedout.css" rel="stylesheet" />
  <link href="../Theme/Singular/css/loginandlockscreen.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent1">
  <%
      using (var h = this.Helpers)
      {
          var toolbar = h.Toolbar();
          {
              toolbar.Helpers.HTML().Heading2("Log In");

              toolbar.AddBinding(Singular.Web.KnockoutBindingString.visible, c => !c.ShowForgotPasswordInd);
              //toolbar.AddBinding(Singular.Web.KnockoutBindingString.visible, c => !c.ShowForgotPasswordInd1);
          }
          h.MessageHolder();
          var LoginDiv = h.Div();
          {
              LoginDiv.AddBinding(Singular.Web.KnockoutBindingString.visible, c => !c.ShowForgotPasswordInd);

              var fieldSet = LoginDiv.Helpers.FieldSetFor<Singular.Web.Security.LoginDetails>("Account Information", c => c.LoginDetails);
              {
                  fieldSet.AddClass("StackedEditors SUI-RuleBorder");
                  fieldSet.Style["max-width"] = "420px";
                  var EmailAddressrow = fieldSet.Helpers.DivC("row");
                  {
                      var EmailLabel = EmailAddressrow.Helpers.HTMLTag("label", "Email Address");
                      EmailAddressrow.Helpers.EditorFor(c => c.UserName);
                  }
                  fieldSet.Helpers.EditorRowFor(c => c.Password);
                  var row = fieldSet.Helpers.DivC("row");
                  {
                  }
              }
              var Loginbutton = LoginDiv.Helpers.Button("Login", "Log In");
              {
                  Loginbutton.AddBinding(Singular.Web.KnockoutBindingString.click, "Login()");
                  Loginbutton.ClickOnEnterKey = true;
              }
              var ForgotPasswordBtn = LoginDiv.Helpers.Button("", "Forgot Password");
              {
                  ForgotPasswordBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "ShowFP()");
              }
              //var RegistrationBtn = LoginDiv.Helpers.Button("", "Register");
              //{
              //    RegistrationBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "ShowRG()");
              //}
          }

          var ForgotPasswordDiv = h.Div();
          {
              ForgotPasswordDiv.AddBinding(Singular.Web.KnockoutBindingString.visible, c => c.ShowForgotPasswordInd);
              var FPtoolbar = ForgotPasswordDiv.Helpers.Toolbar();
              {
                  FPtoolbar.Helpers.HTML().Heading2("Forgot Password");
              }
              var FPDetailsDiv = ForgotPasswordDiv.Helpers.DivC("m-t-md");
              FPDetailsDiv.Helpers.BootstrapEditorRowFor(c => c.ForgotEmail);
              var FPButtons = ForgotPasswordDiv.Helpers.DivC("m-t-md");
              {
                  var FPback = FPButtons.Helpers.Button("Back", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                  {
                      FPback.AddBinding(Singular.Web.KnockoutBindingString.click, "ShowFP()");
                      FPback.AddClass("MarginRight1");
                  }
                  var FPReset = FPButtons.Helpers.Button("Reset Password", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                  {
                      FPReset.AddBinding(Singular.Web.KnockoutBindingString.click, "FPReset()");
                  }
              }
          }
          //var RegistrationDIv = h.Div();
          //{

          //    var FPtoolbar = RegistrationDIv.Helpers.Toolbar();
          //    {
          //        FPtoolbar.Helpers.HTML().Heading2("Registration");
          //    }
          //    var fieldSet =  RegistrationDIv.Helpers.FieldSetFor<MELib.User.User>("", c => c.UserList);
          //    {
          //        fieldSet.AddClass("StackedEditors SUI-RuleBorder");
          //        fieldSet.Style["max-width"] = "420px";
          //        //var FPDetailsDiv = RegistrationDIv.Helpers.DivC("m-t-md");
          //        var UserName = fieldSet.Helpers.DivC("row");
          //        {
          //            var UserNameLabel = UserName.Helpers.HTMLTag("label", "UserName");
          //            UserName.Helpers.EditorFor(c => c.UserName);
          //        }
          //        var FirstName = fieldSet.Helpers.DivC("row");
          //        {
          //            //var FirstNameLabel = FirstName.Helpers.HTMLTag("label", "FirstName");
          //            UserName.Helpers.EditorRowFor(c => c.FirstName);
          //            UserName.Helpers.EditorRowFor(c => c.LastName);
          //            UserName.Helpers.EditorRowFor(c => c.Password);
          //            UserName.Helpers.EditorRowFor(c => c.EmailAddress);
          //            UserName.Helpers.EditorRowFor(c => c.ContactNumber);
          //        }
          //    }
          //    var Registerbutton = RegistrationDIv.Helpers.Button("Register", "Registration");
          //    {
          //        Registerbutton.AddBinding(Singular.Web.KnockoutBindingString.click, "Register($data)");
          //        Registerbutton.ClickOnEnterKey = true;
          //    }
          //    var Backbtn = RegistrationDIv.Helpers.Button("", "Back");
          //    {
          //        Registerbutton.AddBinding(Singular.Web.KnockoutBindingString.click, "Back()");
          //        Registerbutton.ClickOnEnterKey = true;
          //    }

          //}

          //var RegistrationDIv = h.Div();
          //{
          //    RegistrationDIv.AddBinding(Singular.Web.KnockoutBindingString.visible,c => c.ShowForgotPasswordInd1);
          //     var FPtoolbar = RegistrationDIv.Helpers.Toolbar();
          //    {
          //        FPtoolbar.Helpers.HTML().Heading2("");
          //    }
          //    var fieldSet =  RegistrationDIv.Helpers.FieldSetFor<MELib.User.User>("Registration", c => c.UserList);
          //    {
          //        fieldSet.AddClass("StackedEditors SUI-RuleBorder");
          //        fieldSet.Style["max-width"] = "420px";
          //        //var FPDetailsDiv = RegistrationDIv.Helpers.DivC("m-t-md");
          //        var UserName = fieldSet.Helpers.DivC("row");
          //        {
          //            var UserNameLabel = UserName.Helpers.HTMLTag("label", "UserName");
          //            UserName.Helpers.EditorFor(c => c.UserName);
          //        }
          //        var FirstName = fieldSet.Helpers.DivC("row");
          //        {
          //            //var FirstNameLabel = FirstName.Helpers.HTMLTag("label", "FirstName");
          //            UserName.Helpers.EditorRowFor(c => c.FirstName);
          //            UserName.Helpers.EditorRowFor(c => c.LastName);
          //            UserName.Helpers.EditorRowFor(c => c.Password);
          //            UserName.Helpers.EditorRowFor(c => c.EmailAddress);
          //            UserName.Helpers.EditorRowFor(c => c.ContactNumber);
          //        }
          //    }
          //     var Registerbutton = RegistrationDIv.Helpers.Button("Register", "Registration");
          //    {
          //        Registerbutton.AddBinding(Singular.Web.KnockoutBindingString.click, "Register($data)");
          //        Registerbutton.ClickOnEnterKey = true;
          //    }

          //}
      }
  %>

  <script type="text/javascript">
/*const { viewport } = require("@popperjs/core");*/

      function Login() {
          Singular.Validation.IfValid(ViewModel, function () {
              Singular.ShowLoadingBar();
              ViewModel.CallServerMethod('Login', { LoginDetails: ViewModel.LoginDetails.Serialise() }, function (result) {
                  if (result.Success) {
                      window.location = result.Data ? result.Data : ViewModel.RedirectLocation();
                      Singular.HideLoadingBar();
                  } else {
                      ViewModel.LoginDetails().Password('');
                      Singular.AddMessage(1, 'Login', result.ErrorText).Fade(2000);
                      Singular.HideLoadingBar();
                  }
              });
          });
      }
      var Register = function (obj) {
          ViewModel.CallServerMethod('Register', { UserList: ViewModel.UserList.Serialise(), ShowLoadingBar: true }, function (result) {
              if (result.Success) {
                  MEHelpers.Notification("User added to cart ", 'center', 'info', 1000);
              }
              else {
                  MEHelpers.Notification(result.ErrorText, 'center', 'info', 5000);
              }
          })

      }
          
      

      var ShowFP = function () {
          ViewModel.ShowForgotPasswordInd(!ViewModel.ShowForgotPasswordInd());
      };

      var ShowRG = function () {
          ViewModel.ShowForgotPasswordInd1(!ViewModel.ShowForgotPasswordInd1());
      };
      //var Register = function (obj) {
      //    ViewModel.CallServerMethod('Register', { User: obj.Serialise(), ShowLoadingBar: true }, function (result) {
      //        if (result.Success) {
      //            MEHelpers.Notification("Products added to cart ", 'center', 'info', 1000);
      //        }
      //        else {
      //            MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
      //        }
      //    })
      //}

      var FPReset = function () {
          METTHelpers.QuestionDialogYesNo(("Are you sure you would like to reset your password?"), 'center',
              function () {
                  Singular.ShowLoadingBar();
                  ViewModel.CallServerMethod('ResetPassword', { Email: ViewModel.ForgotEmail() }, function (result) {
                      Singular.HideLoadingBar();
                      if (result.Success) {
                          METTHelpers.Notification('Please check your email for reset instructions', 'center', 'success', 5000);
                          ViewModel.ShowForgotPasswordInd(false);
                          ViewModel.ForgotEmail("");
                      } else {
                          ViewModel.ShowForgotPasswordInd(false);
                          ViewModel.ForgotEmail("");
                      }
                  })
              },
              function () {
                  ViewModel.ShowForgotPasswordInd(false);
                  ViewModel.ForgotEmail("");
              });
      };
  </script>
</asp:Content>
