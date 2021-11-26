<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderForUser.aspx.cs" Inherits="MEWeb.Maintenance.OrderForUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
       <!-- Add page specific styles and JavaScript classes below -->
  <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />

<style type="text/css">
    .movie-border {
      border-radius: 5px;
      border: 2px solid #DEDEDE;
      padding: 15px;
      margin: 5px;
      height: 100px;
      width: 200px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
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
                            var ContainerTab = PageTab.AddTab("Available Products");
                            {
                                var RowContentDiv = ContainerTab.Helpers.DivC("row");
                                {
                                    var ColContentDiv = RowContentDiv.Helpers.DivC("col-md-8");
                                    {

                                        var ProductDiv = ColContentDiv.Helpers.BootstrapTableFor<MELib.Products.Product>((c) => c.ProductList, false, false, "");
                                        {
                                            var FirstRow = ProductDiv.FirstRow;

                                            {

                                                var ProductName = FirstRow.AddColumn("Product Name");
                                                {

                                                    ProductName.Helpers.Span(c => c.ProductName);
                                                }
                                                var ProductImage = FirstRow.AddColumn("Product");
                                                {

                                                    ProductImage.Helpers.HTML("<img data-bind=\"attr:{src: $data.ProductImageURL()} \" class='movie-border'/>");

                                                }
                                                var rower = FirstRow.AddColumn("Quantity");
                                                {
                                                    rower.Helpers.EditorFor(c => c.Quantity);
                                                }
                                                var ProductPrice = FirstRow.AddColumn("Product Price");
                                                {
                                                    ProductPrice.Helpers.Span(c => "R " + c.Price.ToString("0.##"));

                                                }

                                                var BtnAdd = FirstRow.AddColumn();
                                                {
                                                    var ProductBtn = BtnAdd.Helpers.Button("Add to Backet", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                    {
                                                        ProductBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "AddBasket($data)");
                                                        ProductBtn.AddClass("btn btn-primary btn-outline");
                                                    }
                                                }
                                            }


                                        }
                                        var Total = RowContentDiv.Helpers.HTML("   Total Price: R " + Math.Round(ViewModel.TotalPrices, 2));
                                        {
                                            RowContentDiv.Style.FontSize = "20px";
                                        }
                                    }
                                    var RowColRight = RowContentDiv.Helpers.DivC("col-md-4");
                                    {
                                        var AnotherCardDiv = RowColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                        {
                                            var ContentDiv = AnotherCardDiv.Helpers.DivC("ibox-content");
                                            {
                                                var RightRowContentDiv = ContentDiv.Helpers.DivC("row");
                                                {
                                                    var RightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                                                    {
                                                        RightColContentDiv.Helpers.LabelFor(c => ViewModel.SubCategoryID);
                                                        var ReleaseFromDateEditor = RightColContentDiv.Helpers.EditorFor(c => ViewModel.SubCategoryID);
                                                        ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");
                                                        var FilterBtn = RightColContentDiv.Helpers.Button("Apply Filter", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                        {
                                                            FilterBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "FilterProducts($data)");
                                                            FilterBtn.AddClass("btn btn-primary btn-outline");
                                                        }

                                                    }
                                                }
                                            }


                                        }

                                        var AnotherCardDiv1 = RowColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                                        {

                                            var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                            {
                                                CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                                CardTitleDiv.Helpers.HTML().Heading5("Select User");
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
                                                    var RightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                                                    {
                                                        RightColContentDiv.Helpers.LabelFor(c => ViewModel.UserID);
                                                        var ReleaseFromDateEditor = RightColContentDiv.Helpers.EditorFor(c => ViewModel.UserID);
                                                        ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");


                                                    }
                                                    var FarRightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                                                    {
                                                        //var UserBtn = RightColContentDiv.Helpers.Button("User Info", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                        //{
                                                        //    UserBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "UserInfo($data)");
                                                        //    UserBtn.AddClass("btn btn-primary btn-outline");
                                                        //}
                                                    }
                                                }
                                            }

                                            var ContentDiv1 = AnotherCardDiv.Helpers.DivC("ibox-content");
                                            {
                                                var RightRowContentDiv = ContentDiv1.Helpers.DivC("row");
                                                {
                                                    var RightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                                                    {
                                                        RightColContentDiv.Helpers.LabelFor(c => ViewModel.DeliveryTypeID);
                                                        var ReleaseFromDateEditor = RightColContentDiv.Helpers.EditorFor(c => ViewModel.DeliveryTypeID);
                                                        ReleaseFromDateEditor.AddClass("form-control marginBottom20 ");

                                                    }
                                                }
                                            }


                                        }


                                    }

                                    var RowColRight3 = RowContentDiv.Helpers.DivC("col-md-4");
                                    {



                                        RowColRight3.Helpers.HTML().Heading2("Basket");


                                        var RightRowContentDiv = RowColRight3.Helpers.DivC("row");
                                        {

                                            var CheckOutList = RowColRight.Helpers.DivC("col-md-12 text-left");
                                            {
                                                CheckOutList.Helpers.HTMLTag("br");
                                                //CheckOutList.Helpers.HTMLTag("br");

                                                var CheckOutBtn = CheckOutList.Helpers.Button("CHECKOUT", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                {
                                                    CheckOutBtn.AddClass("btn-primary btn btn btn-primary");
                                                    CheckOutBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "CheckOutProducts($data)");
                                                }

                                                var SaveBtn = CheckOutList.Helpers.Button("Save", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                {
                                                    SaveBtn.AddClass("btn-primary btn btn btn-primary");
                                                    SaveBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "SaveCartList($data)");
                                                }
                                            }

                                            var RightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                                            {

                                                var ProductList = RightColContentDiv.Helpers.TableFor<MELib.Carts.Cart>((c) => c.CartList, false, true);
                                                {
                                                    ProductList.Helpers.HTMLTag("br/");
                                                    ProductList.AddClass("form-control ");



                                                    var ProductListRow = ProductList.FirstRow;
                                                    {
                                                        var ProductNumber = ProductListRow.AddColumn("Product");
                                                        {
                                                            ProductNumber.Helpers.Span(c => c.ProductName);
                                                            ProductNumber.Style.Width = "100px";
                                                        }

                                                        var Quantity = ProductListRow.AddColumn("Quantity");
                                                        {
                                                            Quantity.Helpers.Span(c => c.Quantity);
                                                            Quantity.Style.Width = "100px";
                                                        }

                                                        var Price = ProductListRow.AddColumn("Price");
                                                        {
                                                            Price.Helpers.Span(c => "R" + c.Price.ToString("0.##"));
                                                            Price.Style.Width = "100px";
                                                        }

                                                        var ProductPrice = ProductListRow.AddColumn("SubTotal");
                                                        {
                                                            ProductPrice.Helpers.Span(c => "R" + (c.TotalPrice.ToString("0.##")));
                                                            ProductPrice.Style.Width = "100px";
                                                        }

                                                    }

                                                }
                                            }




                                            




                                        }
                                    }


                                }









                            }

                            //var ContainerTab1 = PageTab.AddTab("Delivery Or Collection");
                            //{
                            //    var RowContentDiv1 = ContainerTab1.Helpers.DivC("row");
                            //    {
                            //        var LeftColRight1 = RowContentDiv1.Helpers.DivC("col-md-9");
                            //        {
                            //            var AnotherCardDiv1 = LeftColRight1.Helpers.DivC("ibox float-e-margins paddingBottom");
                            //            {
                            //                var CardTitleDiv1 = AnotherCardDiv1.Helpers.DivC("ibox-title");
                            //                {
                            //                    CardTitleDiv1.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                            //                    CardTitleDiv1.Helpers.HTML().Heading5("Delivery/Collection");
                            //                }
                            //                var CardTitleToolsDiv1 = CardTitleDiv1.Helpers.DivC("ibox-tools");
                            //                {
                            //                    var aToolsTag = CardTitleToolsDiv1.Helpers.HTMLTag("a");
                            //                    aToolsTag.AddClass("collapse-link");
                            //                    {
                            //                        var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                            //                        iToolsTag.AddClass("fa fa-chevron-up");
                            //                    }
                            //                }
                            //                var ContentDiv = CardTitleDiv1.Helpers.DivC("inbox-content");
                            //                {
                            //                    var RowContent_Div = ContentDiv.Helpers.DivC("row");
                            //                    {
                            //                        var ColContentDiv = RowContent_Div.Helpers.DivC("col-md-12");
                            //                        {

                            //                        }
                            //                    }
                            //                }
                            //            }
                            //        }
                            //    }
                            //}
                        }
                    }
                }
            }
        }
  %>








    <script type="text/javascript">

        Singular.OnPageLoad(function () {
            $("#menuItem1").addClass('active');
            $("#menuItem1 > ul").addClass('in');
        });
        var UserInfo = function (obj) {
            ViewModel.CallServerMethod('UserInfo', { UserID: ViewModel.UserID(), ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    MEHelpers.Notification("User Info Refreshed.", 'center', 'info', 1000);
                    ViewModel.myBasket.Set(result.Data);
                    // ViewModel.ProductList.Set(result.Data);
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
        };
        var AddBasket = function (obj) {
            ViewModel.CallServerMethod('AddBasket', { UserID: ViewModel.UserID(), Product: obj.Serialise(),  ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    MEHelpers.Notification("Products added to cart ", 'center', 'info', 1000);
                    location.reload();
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
        }

        var SaveCartList = function (obj) {
            console.log(obj);
            ViewModel.CallServerMethod('SaveCartList', { UserID: obj.UserID(), CartList: ViewModel.CartList.Serialise(), ShowLoadingBar: true }, function (result) {
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

        var Basket = function () {
            window.location = '../Basket/Basket.aspx';
        }

        var RentMovie = function (obj) {
            ViewModel.CallServerMethod('RentMovie', { MovieID: obj.MovieID(), ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    window.location = result.Data;
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
        }


        var FilterProducts = function (obj) {
            ViewModel.CallServerMethod('FilterProducts', { SubCategoryID: obj.SubCategoryID(), ResetInd: 0, ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    MEHelpers.Notification("Product filtered successfully.", 'center', 'info', 1000);
                    ViewModel.ProductList.Set(result.Data);
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
        };


        var CheckOutProducts = function (obj) {
            ViewModel.CallServerMethod('CheckOutProductsList', { TotalPrices: obj.TotalPrices(), DeliveryTypeID: obj.DeliveryTypeID(), UserID: obj.UserID(), CartList: ViewModel.CartList.Serialise(), ShowLoadingBar: true }, function (result) {
                if (result.Success) {


                    MEHelpers.Notification("Successfully Saved", 'center', 'success', 3000);
                    window.location = '../Products/AllProducts.aspx';
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            });
        }

    </script>
</asp:Content>
