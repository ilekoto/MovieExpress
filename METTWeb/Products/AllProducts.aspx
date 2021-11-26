<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AllProducts.aspx.cs" Inherits="MEWeb.Products.AllProducts" %>
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
      height: 260px;
      width: 400px;
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
                            var ContainerTab = PageTab.AddTab("Available Movies");
                            {
                                var RowContentDiv = ContainerTab.Helpers.DivC("row");
                                {
                                    var ColContentDiv = RowContentDiv.Helpers.DivC("col-md-9");
                                    {
                                        // var ProductDiv1 = ColContentDiv.Helpers.TableFor<MELib.Products.Product>((b) => b.ProductList, false, false);
                                        var ProductDiv = ColContentDiv.Helpers.BootstrapTableFor<MELib.Products.Product>((c) => c.ProductList, false, false, "");
                                        {
                                            var FirstRow = ProductDiv.FirstRow;
                                            //  var FirstRow1 -ProductDiv1.FirstRow;
                                            {
                                                /*var MovieTitle = FirstRow.AddColumn("Products ID");
                                                {
                                                    var MovieTitleText = MovieTitle.Helpers.Span(c => c.ProductID);
                                                    MovieTitle.Style.Width = "250px";
                                                }*/
                                                var ProductName = FirstRow.AddColumn("Product Name");
                                                {
                                                    /*var MovieDescriptionText =*/
                                                    ProductName.Helpers.Span(c => c.ProductName);
                                                }
                                                var ProductImage = FirstRow.AddColumn("Product");
                                                {
                                                    /* var Image = */
                                                    ProductImage.Helpers.HTML("<img data-bind=\"attr:{src: $data.ProductImageURL()} \" class='movie-border'/>");

                                                }
                                                var rower = FirstRow.Helpers.EditorRowFor(c => c.Quantity);
                                                {
                                                    rower.Helpers.HTML("0");
                                                }
                                                var ProductPrice = FirstRow.AddColumn("Product Price");
                                                {
                                                    ProductPrice.Helpers.Span(c => "R " + c.Price.ToString("0.##"));
                                                    // Watch Movie
                                                    /*var WatchBtn = MovieAction.Helpers.Button("Rent Now", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                    {
                                                        WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.text, c => "Add to Basket @ R " + c.Price);
                                                        WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "RentMovie($data)");
                                                        WatchBtn.AddClass("btn btn-primary btn-outline");
                                                    }*/
                                                }
                                                /*var ProductQuantity = FirstRow.AddColumn( c => c.Quantity);
                                                 {
                                                    // ProductQuantity.Helpers.HTML();
                                                     ProductPrice.Style.Width = "50px";
                                                 }*/
                                                var BtnAdd = FirstRow.AddColumn();
                                                {
                                                    var ProductBtn = BtnAdd.Helpers.Button("Add to Basket", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.shopping_cart);
                                                    {
                                                        ProductBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "AddBasket($data)");
                                                        ProductBtn.AddClass("btn btn-primary btn-outline");
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


                                    }
                                    var CheckOutList = RowColRight.Helpers.DivC("col-md-12 text-left");
                                        {
                                            var CheckOutBtn = CheckOutList.Helpers.Button("GO TO YOUR BASKET", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.shoppingBasket);
                                            {
                                                CheckOutBtn.AddClass("btn-primary btn btn btn-primary");
                                                CheckOutBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "Basket($data)");
                                            }
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



        Singular.OnPageLoad(function () {
            $("#menuItem1").addClass('active');
            $("#menuItem1 > ul").addClass('in');
        });

        var AddBasket = function (obj) {
            ViewModel.CallServerMethod('AddBasket', { Product: obj.Serialise(), ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    MEHelpers.Notification("Products added to cart ", 'center', 'info', 1000);
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
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

        var WatchMovie = function (obj) {

            MEHelpers.QuestionDialogYesNo("Are you sure you would like to watch this movie?", 'center',
                function () { // Yes
                    ViewModel.CallServerMethod('WatchMovie', { MovieID: obj.MovieID(), ShowLoadingBar: true }, function (result) {
                        if (result.Success) {
                            MEHelpers.Notification("Item deleted successfully.", 'center', 'success', 5000);
                        }
                        else {
                            MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                        }
                    })
                },
                function () { // No
                })
        };


        /*var RentMovie = function (obj) {
            ViewModel.CallServerMethod('RentMovie', { MovieID: obj.MovieID(), ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    window.location = result.Data;
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
        }*/

        var FilterProducts = function (obj) {
            ViewModel.CallServerMethod('FilterProducts', { SubCategoryID: obj.SubCategoryID(), ResetInd: 0, ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    MEHelpers.Notification("Products filtered successfully.", 'center', 'info', 1000);
                    ViewModel.ProductList.Set(result.Data);
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
        };

        /* var FilterReset = function (obj) {
             ViewModel.CallServerMethod('FilterProducts', { SubCategoryID: obj.SubCategoryID(), ResetInd: 1, ShowLoadingBar: true }, function (result) {
                 if (result.Success) {
                     MEHelpers.Notification("Movies reset successfully.", 'center', 'info', 1000);
                     ViewModel.ProductLis.Set(result.Data);
                     // Set Drop Down to 'Select'
                 }
                 else {
                     MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                 }
             })
         };*/

        var FilterMovies = function (obj) {
            // alert('Movie Genre ID ' + obj.MovieGenreID());

            ViewModel.CallServerMethod('FilterMovies', { MovieGenreID: obj.MovieGenreID(), ShowLoadingBar: true }, function (result) {
                if (result.Success) {
                    MEHelpers.Notification("Movies filtered successfully.", 'center', 'info', 1000);
                    ViewModel.MovieList.Set(result.Data);
                }
                else {
                    MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
                }
            })
        };

    </script>
</asp:Content>
