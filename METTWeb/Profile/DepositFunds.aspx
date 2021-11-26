<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepositFunds.aspx.cs" Inherits="MEWeb.Profile.DepositFunds" %>

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
                          var ContainerTab = PageTab.AddTab("Deposit Fund");
                          {
                              var RowContentDiv = ContainerTab.Helpers.DivC("row");
                              {

                                  #region Left Column / Data
                                  var LeftColRight = RowContentDiv.Helpers.DivC("col-md-12");
                                  {
                                      var AnotherCardDiv = LeftColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                      {
                                          var TransactionTittle = AnotherCardDiv.Helpers.DivC("ibox-title");
                                          {
                                              TransactionTittle.Helpers.HTML("<i class='ffa-lg fa-fw pull-center'></i>");
                                              TransactionTittle.Helpers.HTML().Heading2("Deposit Funds");
                                              TransactionTittle.Helpers.HTMLTag("hr");
                                              TransactionTittle.Helpers.HTMLTag("br/");
                                          }
                                          var ContentDiv = TransactionTittle.Helpers.DivC("inbox-content");
                                          {
                                              var RowContent_Div = ContentDiv.Helpers.DivC("row");
                                              {
                                                  var ContentDivC = RowContent_Div.Helpers.DivC("col-md-12 pull-center");
                                                  {
                                                      var AccountList = ContentDivC.Helpers.TableFor<MELib.Accounts.Account>(c => c.AccountList, false, false);
                                                      {
                                                          var AccountListContent = RowContent_Div.Helpers.DivC("col-md-12 pull-center");
                                                          {

                                                              var Balance = ContentDivC.Helpers.With<MELib.Accounts.Account>(b => b.Account);
                                                              Balance.Helpers.Span(b => "Current Balance R" + b.Balance).Style.FontSize = "20px";
                                                              // Balance.Helpers.AddClass("form-control");
                                                              Balance.Helpers.HTMLTag("br/");


                                                              var btn = AccountListContent.Helpers.Button("Deposit Cash", Singular.Web.ButtonMainStyle.Warning, Singular.Web.ButtonSize.Large, Singular.Web.FontAwesomeIcon.send);
                                                              {
                                                                  btn.AddBinding(Singular.Web.KnockoutBindingString.click, "SaveBalance($data)");
                                                                  btn.AddClass("btn btn-warning btn-warning  ");
                                                                  btn.Helpers.HTMLTag("br/");
                                                              }
                                                              AccountListContent.Helpers.HTMLTag("br/");
                                                              var AccountContentDiv = ContentDivC.Helpers.DivC("col-md-12");
                                                              {
                                                                  var bal = AccountList.FirstRow.AddColumn(c => c.Balance).AddClass("form-control pull-center");

                                                              }
                                                             
                                                          }


                                                        

                                                      }
                                                  }
                                              }
                                          }

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

  %>
  <script type="text/javascript">
    // Place page specific JavaScript here or in a JS file and include in the HeadContent section
    Singular.OnPageLoad(function () {
      $("#menuItem1").addClass('active');
      $("#menuItem1 > ul").addClass('in');
    });

      function SaveBalance(data) {
          ViewModel.CallServerMethod('SaveBalance', { Account: ViewModel.AccountList.Serialise() }, function (result) {


              if (result.Success) {
                  alert('Cashe deposited');

                  Singular.AddMessage(3, 'Save', 'Save SuccessFully').Fade(2000);
                  location.reload();
              }
              else {
                  Singular.AddMessage(1, 'Nope!!!!!!', result.ErrorText).Fade(2000);
              }


          });
      }
          

      

  </script>
</asp:Content>
