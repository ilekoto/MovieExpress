<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Basket.aspx.cs" Inherits="MEWeb.Basket.Basket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript" src="../Scripts/JSLINQ.js"></script>
    <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
    <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <%

        using (var h = this.Helpers)
        {
            var MainHDiv = h.DivC("Row pad-top-10");
            {
                var PanelContainer = MainHDiv.Helpers.DivC("col-md-12 p-n-lr");
                {
                    var BasketContainer = PanelContainer.Helpers.DivC("tab-container");
                    {
                        var AssessmentsTab = BasketContainer.Helpers.TabControl();
                        {
                            AssessmentsTab.Style.ClearBoth();
                            AssessmentsTab.AddClass("nav nav-tabs");
                            var BasketContainerTab = AssessmentsTab.AddTab("Basket");
                            {
                                var Row = BasketContainerTab.Helpers.DivC("row margin0");
                                {
                                    var RowCol = Row.Helpers.DivC("col-md-12");
                                    {
                                        //var Account = RowCol.Helpers.boo
                                        //var ProductList = RowCol.Helpers.TableFor<MELib.Products.Product>((b) => b.ProductList, false, false);
                                        var ProductList = RowCol.Helpers.TableFor<MELib.Carts.Cart>((c) => c.CartList, false, true);
                                        {
                                            ProductList.AddClass("table table-striped table-bordered table-hover");
                                            //var ProductListRow = ProductList1.FirstRow;
                                            var ProductListRow = ProductList.FirstRow;
                                            {

                                                var ProductNumber = ProductListRow.AddColumn("Product Name");
                                                {
                                                    ProductNumber.Helpers.Span(c => c.ProductName);
                                                }
                                                var Quantity = ProductListRow.AddColumn("Quantity");
                                                {
                                                    Quantity.Helpers.EditorFor(c => c.Quantity);
                                                }
                                                var Price = ProductListRow.AddColumn("Price");
                                                {
                                                    Price.Helpers.Span(c => "R" + c.Price.ToString("0.##"));
                                                }

                                                var ProductPrice = ProductListRow.AddColumn("SubTotal");
                                                {
                                                    ProductPrice.Helpers.Span(c => "R" + c.TotalPrice.ToString("0.##"));
                                                }                                          
                                                


                                                // var Total = ProductListRow.Helpers.HTML("Total Price: " + ViewModel.TotalPrices);

                                            }
                                            RowCol.Helpers.LabelFor(c => ViewModel.DeliveryTypeID);
                                                {
                                                    var Delivery = RowCol.Helpers.EditorFor(c => ViewModel.DeliveryTypeID);
                                                    Delivery.AddClass("form-control marginBottom5 col-md-2");
                                                }
                                            var Total = RowCol.Helpers.HTML("Total Price: R " + Math.Round(ViewModel.TotalPrices, 2));
                                            {
                                                RowCol.Style.FontSize = "20px";
                                            }
                                            //var BackToList = RowCol.Helpers.DivC("col-md-12 text-left");

                                            var SaveList = RowCol.Helpers.DivC("col-md-12 text-right");
                                            {
                                                var SaveBtn = SaveList.Helpers.Button("Save", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                {
                                                    SaveBtn.AddClass("btn-primary btn btn btn-primary");
                                                    SaveBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "SaveCartList($data)");
                                                }
                                                var BackBtn = SaveList.Helpers.Button("BackToProduct", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                {
                                                    BackBtn.AddClass("btn-primary btn btn btn-primary");
                                                    BackBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "BackToProducts($data)");
                                                }
                                            }
                                            /* var BackToList = RowCol.Helpers.DivC("col-md-12 text-left");
                                             {

                                             }*/

                                        }

                                        var CheckOutList = RowCol.Helpers.DivC("col-md-12 text-left");
                                        {
                                            var CheckOutBtn = CheckOutList.Helpers.Button("CHECKOUT", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                            {
                                                CheckOutBtn.AddClass("btn-primary btn btn btn-primary");
                                                CheckOutBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "CheckOutProducts($data)");
                                            }
                                        }
                                    }
                                }

                                //var dialog = h.Dialog(c => c.);
                            }
                        }



                    }
                }
            }
        }



    %>
    <script type="text/javascript">
        Singular.OnPageLoad(function () {
            $("#menuItem5").addClass("active");
            $("#menuItem5 > ul").addClass("in");
        });

        var SaveCartList = function (obj) {
            console.log(obj);
            ViewModel.CallServerMethod('SaveCartList', { CartList: ViewModel.CartList.Serialise(), ShowLoadingBar: true }, function (result) {
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
        var BackToProducts = function () {
            window.location = '../Products/AllProducts.aspx';
        }

        var CheckOutProducts = function (obj) {
            ViewModel.CallServerMethod('CheckOutProductsList', { TotalPrices: obj.TotalPrices(), DeliveryTypeID: obj.DeliveryTypeID(), CartList: ViewModel.CartList.Serialise(), ShowLoadingBar: true }, function (result) {
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
