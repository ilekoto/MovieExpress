<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FundUser.aspx.cs" Inherits="MEWeb.Maintenance.FundUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   <%--  <%
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
                             var ContainerTab = PageTab.AddTab("Fund a User");
                             {
                                 var RowContentDiv = ContainerTab.Helpers.DivC("row");
                                 {
                                     var ColContentDiv = RowContentDiv.Helpers.DivC("col-md-8");
                                     {
                                         // var ProductDiv1 = ColContentDiv.Helpers.TableFor<MELib.Products.Product>((b) => b.ProductList, false, false);
                                         //var ProductDiv = ColContentDiv.Helpers.EditorFor(c => ViewModel.UserID);

                                         var Account = ColContentDiv.Helpers.BootstrapTableFor<MELib.Accounts.Account>(c => c.AccountList, false, false, "");
                                         {
                                             var FirstRow = Account.FirstRow;
                                             {
                                                 var Amount = FirstRow.AddColumn("Amount You want to fund the User");
                                                 {
                                                     Amount.Helpers.EditorFor(c => c.Balance);
                                                 }
                                                 var User = FirstRow.AddColumn("Select User");
                                                 {
                                                     User.Helpers.EditorFor(c => ViewModel.UserID);
                                                 }

                                                 var BtnAdd = FirstRow.AddColumn();
                                                 {
                                                     var ProductBtn = BtnAdd.Helpers.Button("Fund the User", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                     {
                                                         ProductBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FundUser($data)");
                                                         ProductBtn.AddClass("btn btn-primary btn-outline");
                                                     }
                                                 }


                                             }
                                         }
                                         //var FirstRow = ProductDiv.FirstRow;
                                         ////  var FirstRow1 -ProductDiv1.FirstRow;
                                         //{
                                         //    /*var MovieTitle = FirstRow.AddColumn("Products ID");
                                         //    {
                                         //        var MovieTitleText = MovieTitle.Helpers.Span(c => c.ProductID);
                                         //        MovieTitle.Style.Width = "250px";
                                         //    }*/
                                         //    var ProductName = FirstRow.AddColumn("Product Name");
                                         //    {
                                         //        /*var MovieDescriptionText =*/
                                         //        ProductName.Helpers.Span(c => c.ProductName);
                                         //    }
                                         //    var ProductImage = FirstRow.AddColumn("Product");
                                         //    {
                                         //        /* var Image = */
                                         //        ProductImage.Helpers.HTML("<img data-bind=\"attr:{src: $data.ProductImageURL()} \" class='movie-border'/>");

                                         //    }
                                         //    var rower = FirstRow.AddColumn("Quantity");
                                         //    {
                                         //        rower.Helpers.EditorFor(c => c.Quantity);
                                         //    }
                                         //    var ProductPrice = FirstRow.AddColumn("Product Price");
                                         //    {
                                         //        ProductPrice.Helpers.Span(c => "R " + c.Price);
                                         //        // Watch Movie
                                         //        /*var WatchBtn = MovieAction.Helpers.Button("Rent Now", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                         //        {
                                         //            WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.text, c => "Add to Basket @ R " + c.Price);
                                         //            WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "RentMovie($data)");
                                         //            WatchBtn.AddClass("btn btn-primary btn-outline");
                                         //        }*/
                                         //    }
                                         //    /*var ProductQuantity = FirstRow.AddColumn( c => c.Quantity);
                                         //     {
                                         //        // ProductQuantity.Helpers.HTML();
                                         //         ProductPrice.Style.Width = "50px";
                                         //     }*/
                                         //    var BtnAdd = FirstRow.AddColumn();
                                         //    {
                                         //        var ProductBtn = BtnAdd.Helpers.Button("Add to Backet", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                         //        {
                                         //            ProductBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "AddBasket($data)");
                                         //            ProductBtn.AddClass("btn btn-primary btn-outline");
                                         //        }
                                         //    }
                                         //}


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

        function FundUser = (obj) {
            ViewModel.CallServerMethod('FundUser', { UserID: obj.UserID(), Account: ViewModel.AccountList.Serialise() }, function (result) {


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

</asp:Content>--%>
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
                                                 TransactionTittle.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                                 TransactionTittle.Helpers.HTML().Heading2("Deposit Funds For User");
                                                 TransactionTittle.Helpers.HTMLTag("hr");
                                                 TransactionTittle.Helpers.HTMLTag("br/");
                                             }
                                             var ContentDiv = TransactionTittle.Helpers.DivC("inbox-content");
                                             {
                                                 var RowContent_Div = ContentDiv.Helpers.DivC("row");
                                                 {
                                                     var ContentDivC = RowContent_Div.Helpers.DivC("col-md-12");
                                                     {
                                                         ContentDivC.Helpers.HTML("Select User");
                                                         ContentDivC.Helpers.DivC("row");
                                                         var User = ContentDivC.Helpers.EditorFor(c => ViewModel.UserID);
                                                         var AccountList = ContentDivC.Helpers.TableFor<MELib.Accounts.Account>(c => c.AccountList, false, false);
                                                         {

                                                             var AccountListContent = RowContent_Div.Helpers.DivC("col-md-12 pull-center");
                                                             {
                                                                 var bal = AccountList.FirstRow.AddColumn(c => c.Balance).AddClass("form-control");
                                                                 var Balance = ContentDivC.Helpers.With<MELib.Accounts.Account>(b => b.Account);
                                                                 Balance.Helpers.Span(b => "Current Balance R" + b.Balance).Style.FontSize ="20px";
                                                                 // Balance.Helpers.AddClass("form-control");
                                                                 Balance.Helpers.HTMLTag("br/");


                                                                 var btn = AccountListContent.Helpers.Button("Deposit Cash", Singular.Web.ButtonMainStyle.Warning, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.send);
                                                                 {
                                                                     btn.AddBinding(Singular.Web.KnockoutBindingString.click, "SaveBalance($data)");
                                                                     btn.AddClass("btn btn-warning btn-warning form-control ");
                                                                     btn.Helpers.HTMLTag("br/");
                                                                 }
                                                                 AccountListContent.Helpers.HTMLTag("br/");
                                                                 

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
          ViewModel.CallServerMethod('SaveBalance', { UserID: data.UserID.Serialise(), Account: ViewModel.AccountList.Serialise() }, function (result) {


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

