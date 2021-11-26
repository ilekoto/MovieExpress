<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="MEWeb.Profile.Transactions" %>

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
                                              CardTitleDiv.Helpers.HTML().Heading5("Transactions");
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
                                          var ContentDiv = CardTitleDiv.Helpers.DivC("inbox-content");
                                          {
                                              var RowContent_Div = ContentDiv.Helpers.DivC("row");
                                              {
                                                  var ColContentDiv = RowContent_Div.Helpers.DivC("col-md-12");
                                                  {
                                                      var Transaction = ColContentDiv.Helpers.TableFor<MELib.Accounts.Transaction>(c => c.TransactionsList, false, false);
                                                      {
                                                          Transaction.AddClass("table table-striped table-bordered table-hover");
                                                          var Trans = Transaction.FirstRow;
                                                          {
                                                              var TransactionType = Trans.AddColumn("TransactionType");
                                                              {
                                                                  TransactionType.Helpers.Span(c => c.TransactionTypeName);
                                                              }
                                                              var Amount = Trans.AddColumn("Amount");
                                                              {
                                                                  Amount.Helpers.Span(c => c.Amount);
                                                              }
                                                              var UserID= Trans.AddColumn("UserID");
                                                              {
                                                                  UserID.Helpers.Span(c => c.UserID);
                                                              }
                                                          }

                                                      }
                                                  }
                                              }
                                          }
                                      }
                                  }
                                  var RowColRight = RowContentDiv.Helpers.DivC("col-md-3");
                                  {

                                      var AnotherCardDiv = RowColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                      {
                                          var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                          {
                                              CardTitleDiv.Helpers.HTML("<i class='fa fa-filter ffa-lg fa-fw pull-left'></i>");
                                              CardTitleDiv.Helpers.HTML().Heading5("Filter Criteria");
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
                                          var ContentDiv = AnotherCardDiv.Helpers.DivC("ibox-content");
                                          {
                                              var RightRowContentDiv = ContentDiv.Helpers.DivC("row");
                                              {
                                                  var RightColContentDiv1 = RightRowContentDiv.Helpers.DivC("col-md-12");
                                                  {
                                                      RightColContentDiv1.Helpers.LabelFor(c => ViewModel.TransactionTypeID);
                                                      var ReleaseFromDateEditor = RightColContentDiv1.Helpers.EditorFor(c => ViewModel.TransactionTypeID);
                                                      ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");

                                                      var TransBtn = RightColContentDiv1.Helpers.Button("Apply Filter", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                      {
                                                          TransBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FilterTransaction($data)");
                                                          TransBtn.AddClass("btn btn-primary btn-outline");
                                                      }
                                                  }
                                              }
                                          }
                                      }
                                  }
                              }



                              #endregion

                              #region Right Column / Filters

                          }
                          var ContainerTab1 = PageTab.AddTab("Delivery Or Collection");
                          {
                              var RowContentDiv1 = ContainerTab1.Helpers.DivC("row");
                              {
                                  var LeftColRight1 = RowContentDiv1.Helpers.DivC("col-md-9");
                                  {
                                      var AnotherCardDiv1 = LeftColRight1.Helpers.DivC("ibox float-e-margins paddingBottom");
                                      {
                                          var CardTitleDiv1 = AnotherCardDiv1.Helpers.DivC("ibox-title");
                                          {
                                              CardTitleDiv1.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                              CardTitleDiv1.Helpers.HTML().Heading5("Delivery/Collection");
                                          }
                                          var CardTitleToolsDiv1 = CardTitleDiv1.Helpers.DivC("ibox-tools");
                                          {
                                              var aToolsTag = CardTitleToolsDiv1.Helpers.HTMLTag("a");
                                              aToolsTag.AddClass("collapse-link");
                                              {
                                                  var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                                                  iToolsTag.AddClass("fa fa-chevron-up");
                                              }
                                          }
                                          var ContentDiv = CardTitleDiv1.Helpers.DivC("inbox-content");
                                          {
                                              var RowContent_Div = ContentDiv.Helpers.DivC("row");
                                              {
                                                  var ColContentDiv = RowContent_Div.Helpers.DivC("col-md-12");
                                                  {
                                                      var Delivery = ColContentDiv.Helpers.TableFor<MELib.Products.Delivery>(c => c.DeliveryList, false, true);
                                                      {
                                                          Delivery.AddClass("table table-striped table-bordered table-hover");
                                                          var Del = Delivery.FirstRow;
                                                          {
                                                              var DelType = Del.AddColumn("Delivery/Collection");
                                                              {
                                                                  DelType.Helpers.Span(c => c.DeliiveryType);
                                                              }
                                                              var Products = Del.AddColumn("Products");
                                                              {
                                                                  Products.Helpers.Span(c => c.ProductName);
                                                              }
                                                              var User = Del.AddColumn("User");
                                                              {
                                                                  User.Helpers.Span(c => c.UserID);
                                                              }
                                                          }
                                                      }
                                                  }
                                              }
                                          }
                                      }
                                  }
                              }
                              var RowColRight = RowContentDiv1.Helpers.DivC("col-md-3");
                              {

                                  var AnotherCardDiv = RowColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                  {
                                      var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                      {
                                          CardTitleDiv.Helpers.HTML("<i class='fa fa-filter ffa-lg fa-fw pull-left'></i>");
                                          CardTitleDiv.Helpers.HTML().Heading5("Filter Criteria");
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
                                      var ContentDiv = AnotherCardDiv.Helpers.DivC("ibox-content");
                                          {
                                              var RightRowContentDiv = ContentDiv.Helpers.DivC("row");
                                              {
                                                  var RightColContentDiv1 = RightRowContentDiv.Helpers.DivC("col-md-12");
                                                  {
                                                      RightColContentDiv1.Helpers.LabelFor(c => ViewModel.DeliveryTypeID);
                                                      var ReleaseFromDateEditor = RightColContentDiv1.Helpers.EditorFor(c => ViewModel.DeliveryTypeID);
                                                      ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");

                                                      var DelBtn = RightColContentDiv1.Helpers.Button("Apply Filter", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                      {
                                                          DelBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FilterDelivery($data)");
                                                          DelBtn.AddClass("btn btn-primary btn-outline");
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

  %>
  <script type="text/javascript">
    // Place page specific JavaScript here or in a JS file and include in the HeadContent section
    Singular.OnPageLoad(function () {
      $("#menuItem1").addClass('active');
      $("#menuItem1 > ul").addClass('in');
    });

      var FilterTransaction = function (obj) {
          ViewModel.CallServerMethod('FilterTransaction', { TransactionTypeID: obj.TransactionTypeID(), ResetInd: 0, ShowLoadingBar: true }, function (result) {
              if (result.Success) {
                  MEHelpers.Notification("Transactions filtered successfully.", 'center', 'info', 1000);
                  ViewModel.TransactionsList.Set(result.Data);
              }
              else {
                  MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
              }
          })
      };
      var FilterDelivery = function (obj) {
          ViewModel.CallServerMethod('FilterDelivery', { DeliveryTypeID: obj.DeliveryTypeID(), ResetInd: 0, ShowLoadingBar: true }, function (result) {
              if (result.Success) {
                  MEHelpers.Notification("Transactions filtered successfully.", 'center', 'info', 1000);
                  ViewModel.DeliveryList.Set(result.Data);
              }
              else {
                  MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
              }
          })
      };

  </script>
</asp:Content>
