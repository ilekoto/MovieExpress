<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="MEWeb.Products.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <!-- Add your page specific styles and JavaScript classes below -->
  <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />
  <style type="text/css">
    .movie-border {
      border-radius: 5px;
      border: 2px solid #DEDEDE;
      padding: 15px;
      margin: 5px;
      height: 250px;
      width: 350px;
    }

    div.item {
      vertical-align: top;
      display: inline-block;
      text-align: center;
      padding-bottom: 25px;
    }

    .caption {
      display: block;
      padding-bottom: 5px;
    }

   /*.margin-top-10 {
      margin-top: 10px;
    }
    /* Pagination*/
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageTitleContent" runat="server">
     <%
        using (var h = this.Helpers)
            {

            }
    %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <%
         using (var h = this.Helpers)
         {
             var MainHDiv = h.DivC("row pad-top-10");
             {
                 var PanelContainer = MainHDiv.Helpers.DivC("col-md-12 p-n-lr");
                 {
                     var HomeContainer = PanelContainer.Helpers.DivC("tabs-container");
                     {
                         var AssessmentsTab = HomeContainer.Helpers.TabControl();
                         {
                             AssessmentsTab.Style.ClearBoth();
                             AssessmentsTab.AddClass("nav nav-tabs");
                             var HomeContainerTab = AssessmentsTab.AddTab("Food Products");
                             {
                                 var Row = HomeContainerTab.Helpers.DivC("row ");
                                 {
                                     var RowColLeft = Row.Helpers.DivC("col-md-9");
                                     {
                                         var AnotherCardDiv = RowColLeft.Helpers.DivC("ibox float-e-margins paddingBottom");
                                         {
                                             var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                             {
                                                 CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                                 CardTitleDiv.Helpers.HTML().Heading5("All Products");
                                             }
                                             var CardTitleToolsDiv = CardTitleDiv.Helpers.DivC("ibox-tools");

                                             var aToolsTag = CardTitleToolsDiv.Helpers.HTMLTag("a");
                                             aToolsTag.AddClass("collapse-link");
                                             {
                                                 var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                                                 iToolsTag.AddClass("fa fa-chevron-up");
                                             }

                                             var ContentDiv = AnotherCardDiv.Helpers.DivC("ibox-content");
                                             {
                                                 var RowContentDiv = ContentDiv.Helpers.DivC("row");
                                                 {
                                                     var ColNoContentDiv = RowContentDiv.Helpers.DivC("col-md-12 text-center");
                                                     {
                                                         ColNoContentDiv.AddBinding(Singular.Web.KnockoutBindingString.visible, c => ViewModel.ProductList.Count() == 0);
                                                         ColNoContentDiv.Helpers.HTML("<p>Could not find any Product based on your filter criteria.</p>");
                                                     }
                                                     var ColContentDiv = RowContentDiv.Helpers.DivC("col-md-12");
                                                     {
                                                         var MoviesWatchedDiv = ColContentDiv.Helpers.ForEach<MELib.Products.Product>(c => c.ProductList);
                                                         {

                                                             // Using Knockout Binding
                                                             // <img width="16px" height="16px" data-bind="attr:{src: imagePath}" />
                                                             MoviesWatchedDiv.Helpers.HTML("<div class='item'>");
                                                             MoviesWatchedDiv.Helpers.HTML("<img data-bind=\"attr:{src: $data.ProductImageURL()} \" class='movie-border'/>");
                                                             MoviesWatchedDiv.Helpers.HTML("<b><span data-bind=\"text: $data.ProductName() \"  class='caption'></span></b>");
                                                             // MoviesWatchedDiv.Helpers.HTML("<span data-bind=\"text: $data.MovieGenreID() \"  class='caption'></span>");
                                                             // MoviesWatchedDiv.Helpers.HTML("<span data-bind=\"text: $data.ReleaseDate() \"  class='caption'></span>");

                                                         }
                                                         //var WatchBtn = MoviesWatchedDiv.Helpers.Button("Watch Now", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                         //{
                                                         //    WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.text, c => "ADD TO BASKET @ R " + c.Price);
                                                         //    WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "RentMovie($data)");
                                                         //    WatchBtn.AddClass("btn btn-primary btn-outline");
                                                         //}
                                                         MoviesWatchedDiv.Helpers.HTML("</div>");
                                                     }
                                                 }
                                             }
                                         }
                                     }

                                     var RowColRight = Row.Helpers.DivC("col-md-3");
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
                                     var RowColRight1 = Row.Helpers.DivC("col-md-3");
                                     {




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
          ViewModel.CallServerMethod('FilterProducts', {SubCategoryID: obj.SubCategoryID(), ResetInd: 0, ShowLoadingBar: true }, function (result) {
              if (result.Success) {
                  MEHelpers.Notification("Movies filtered successfully.", 'center', 'info', 1000);
                  ViewModel.ProductList.Set(result.Data);
              }
              else {
                  MEHelpers.Notification(result.ErrorText, 'center', 'warning', 5000);
              }
          })
      };

      var FilterReset = function (obj) {
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
      };


      var FilterMovieTitle = function (obj) {
          alert('test');
      };


  </script>

</asp:Content>
