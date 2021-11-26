<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MEWeb.Profile.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <!-- Add page specific styles and JavaScript classes below -->
  <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
  <!-- Placeholder not used in this example -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
  <%
      using (var h = this.Helpers)
      {
          {
              var MainContent = h.DivC("row pad-top-10");
              {
                  var MainContainer = MainContent.Helpers.DivC("col-md-12 p-n-lr");
                  {
                      var PageContainer = MainContainer.Helpers.DivC("tabs-container");
                      {
                          var PageTab = PageContainer.Helpers.TabControl();
                          {
                              PageTab.Style.ClearBoth();
                              PageTab.AddClass("nav nav-tabs");
                              var ContainerTab = PageTab.AddTab("Transaction History");
                              {
                                  var RowContentDiv = ContainerTab.Helpers.DivC("row");
                                  {

                                      #region Left Column / Data
                                      var LeftColRight = RowContentDiv.Helpers.DivC("col-md-9");
                                      {

                                          var AnotherCardDiv = LeftColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                          {
                                              var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                              {
                                                  CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                                  CardTitleDiv.Helpers.HTML().Heading5("Profile");
                                              }
                                              var CardTitleToolsDiv = CardTitleDiv.Helpers.DivC("ibox-tools");
                                              {
                                                  var aToolsTag = CardTitleToolsDiv.Helpers.HTMLTag("a");
                                                  aToolsTag.AddClass("collapse-link");
                                                  {
                                                      var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                                                      iToolsTag.AddClass("fa fa-chevron-up");
                                                  }
                                              }
                                              var ContentDiv = AnotherCardDiv.Helpers.DivC("Inbox-contect");
                                              {
                                                  var RowContectDiv = ContentDiv.Helpers.DivC("row");
                                                  {
                                                      var ColNoContentDiv = RowContectDiv.Helpers.DivC("col-md-12 text-center");
                                                      {
                                                          ColNoContentDiv.AddBinding(Singular.Web.KnockoutBindingString.visible, d => ViewModel.ReadUserList.Count() == 0);
                                                          //                           var UserInfoDiv = ColContentDiv.Helpers.With<MELib.RO.ROUser>(a => a.ReadUserList);
                                                          // {
                                                          //       UserInfoDiv.Helpers.HTML("    CURRENT USER : ").Style.FontSize = "250PX";
                                                          //       UserInfoDiv.Helpers.Span(C => C.UserName);

                                                          //      }
                                                          //var UserIDDiv = ColContentDiv.Helpers.BootstrapTableFor<MELib.AccountType.AccountType>((c) => c.UserAccountTypeList, false, false, " ");
                                                          //var AccountDiv = ColContentDiv.Helpers.BootstrapTableFor<MELib.Accounts.Account>((c) => c.UserAccountList, false,false,"");
                                                          //var UserList = ColContentDiv.Helpers.With<MELib.Security.User>(a => a.User);
                                                          //{
                                                          //    UserList.Helpers.Span(a => a.UserID);
                                                          //}

                                                          //ColContentDiv.Helpers.DivC("row");

                                                          //var UserAccount = ColContentDiv.Helpers.With<MELib.Accounts.Account>(c => c.UserAccount);
                                                          //{
                                                          //    UserAccountType.Helpers.Span(b => b.AccountTypeName);
                                                          //    UserAccount.Helpers.Span(c => c.Balance);
                                                          //var FirstRow1 = UserIDDiv.FirstRow;
                                                          //var FirstRow = AccountDiv.FirstRow;
                                                          //{
                                                          //    var AccountType = FirstRow1.AddColumn("Account Type");
                                                          //    {
                                                          //        var AccountTypeText = AccountType.Helpers.Span(b => b.AccountTypeName);
                                                          //        AccountType.Style.Width = "250px";
                                                          //    }
                                                          //    var AccountBalance = FirstRow.AddColumn("Account Balance");
                                                          //    {
                                                          //        var AccountBalanceText = AccountBalance.Helpers.Span(c => c.Balance);
                                                          //    }
                                                          //}
                                                      }
                                                      var ColContentDiv = RowContectDiv.Helpers.DivC("col-md-12");
                                                      {
                                                          var UserInfoDiv = ColContentDiv.Helpers.With<MELib.RO.ROUser>(s => s.ROUser);
                                                          {
                                                              UserInfoDiv.Helpers.Span(s => s.UserName);
                                                          }
                                                      }
                                                  }
                                                  /*var LeftColContentDiv = RowContectDiv.Helpers.DivC("col-md-12 text-center");
                                                  {
                                                      var AccountDiv = LeftColContentDiv.Helpers.With<MELib.Accounts.Account>(c => c.UserAccount);

                                                  }*/
                                              }
                                          }
                                      }

                                      #endregion

                                      #region Right Column / Filters
                                      var RowColRight = RowContentDiv.Helpers.DivC("col-md-3");
                                      {

                                          var AnotherCardDiv = RowColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                          {
                                              var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                              {
                                                  CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                                  CardTitleDiv.Helpers.HTML().Heading5("Account Information");
                                              }
                                              var CardTitleToolsDiv = CardTitleDiv.Helpers.DivC("ibox-tools");
                                              {
                                                  var aToolsTag = CardTitleToolsDiv.Helpers.HTMLTag("a");
                                                  aToolsTag.AddClass("collapse-link");
                                                  {
                                                      var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                                                      iToolsTag.AddClass("fa fa-chevron-up");
                                                  }
                                              }
                                              var ContentDiv = AnotherCardDiv.Helpers.DivC("Inbox-contect");
                                              {
                                                  var RowContectDiv = ContentDiv.Helpers.DivC("row");
                                                  {
                                                      var ColContentDiv = RowContectDiv.Helpers.DivC("col-md-9");
                                                      {

                                                          var UserAcccountType = ColContentDiv.Helpers.With<MELib.AccountType.AccountType>(b => b.UserAccountType);

                                                          ColContentDiv.Helpers.DivC("row");
                                                          //ColContentDiv.Helpers.DivC("row");
                                                          var UserAccount = ColContentDiv.Helpers.With<MELib.Accounts.Account>(c => c.UserAccount);
                                                          {
                                                              UserAcccountType.Helpers.Span(b => "Account Type Name: " + b.AccountTypeName);
                                                              ColContentDiv.Helpers.DivC("row");

                                                              UserAccount.Helpers.Span(c => c.Balance);
                                                          }
                                                          // var UserIDDive = ColContentDiv.Helpers.BootstrapTableFor<MELib.AccountType.AccountType>((c) => c.UserAccountList, false, false, "");
                                                          // var AccountDiv = ColContentDiv.Helpers.BootstrapTableFor<MELib.Accounts.Account>((c) => c.UserAccountList, false,false,"");
                                                          /* var AccountDiv = ColContentDiv.Helpers.BootstrapTableFor<MELib.AccountType.ROAccountType>((b) => b.UserROAccoutTypeList, false, false, "");
                                                           {

                                                               var FirstRow = AccountDiv.FirstRow;
                                                               {
                                                                   var AccountType = FirstRow.AddColumn("Account Type");
                                                                   {
                                                                       AccountDiv.Helpers.Span(b => b.AccountType);
                                                                       // AccountType.Style.Width = "250px";
                                                                   }

                                                               }
                                                           }*/
                                                      }
                                                      /*var LeftColContentDiv = RowContectDiv.Helpers.DivC("col-md-12 text-center");
                                                      {
                                                          var AccountDiv = LeftColContentDiv.Helpers.With<MELib.Accounts.Account>(c => c.UserAccount);

                                                      }*/
                                                  }
                                              }
                                          }
                                      }
                                      #endregion
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }

  %>
  <script type="text/javascript">
    // Place page specific JavaScript here or in a JS file and include in the HeadContent section
    Singular.OnPageLoad(function () {
      $("#menuItem1").addClass('active');
      $("#menuItem1 > ul").addClass('in');
    });


  </script>
</asp:Content>
