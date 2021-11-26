﻿<%@ Page Title="Popcorn" Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" MasterPageFile="~/Site.Master" Inherits="MEWeb.Account.Home" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
  <!-- Add your page specific styles and JavaScript classes below -->
  <link href="../Theme/Singular/Custom/home.css" rel="stylesheet" />
  <link href="../Theme/Singular/Custom/customstyles.css" rel="stylesheet" />
  <style>
    .movie-border {
      border-radius: 5px;
      border: 2px solid #DEDEDE;
      padding: 15px;
      margin: 5px;
      height: 800px;
      width: 650px;
    }

    div.movie-item {
      vertical-align: top;
      display: inline-block;
      text-align: center;
    }

    .caption {
      display: block;
    }

    .margin-top-10 {
      margin-top: 10px;
    }
    /* Pagination*/
  </style>
</asp:Content>
<asp:Content ID="PageTitleContent" runat="server" ContentPlaceHolderID="PageTitleContent">
  <%
    using (var h = this.Helpers)
    {
      // Not used in this example
    }
  %>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  <%
      using (var h = this.Helpers)
      {
          var MainHDiv = h.DivC("row pad-top-10");
          {
              var PanelContainer = MainHDiv.Helpers.DivC("col-md-12 p-n-lr");
              {
                  var HomeContainer = PanelContainer.Helpers.DivC("tabs-container");
                  var HomeContainer1 = PanelContainer.Helpers.DivC("tabs-container");
                  {
                      var AssessmentsTab = HomeContainer.Helpers.TabControl();
                      {
                          AssessmentsTab.Style.ClearBoth();
                          AssessmentsTab.AddClass("nav nav-tabs");
                          var HomeContainerTab = AssessmentsTab.AddTab("Home");
                          {
                              //var ContainerTab = AssessmentsTab.AddTab("Fruits Available");
                              var Row = HomeContainerTab.Helpers.DivC("row margin0");
                              {
                                  var RowColMain = Row.Helpers.DivC("col-md-12");
                                  {
                                      RowColMain.Helpers.HTML().Heading2("Welcome to Movie Express");
                                      //RowColMain.Helpers.HTMLTag("p").HTML = "On your dashboard below you will see the most recent activities performed on your account.";
                                  }
                                  var RowColLeft = Row.Helpers.DivC("col-md-9");
                                  {
                                      var AnotherCardDiv = RowColLeft.Helpers.DivC("ibox float-e-margins paddingBottom");
                                      {
                                          var CardTitleDiv = AnotherCardDiv.Helpers.DivC("ibox-title");
                                          {
                                              CardTitleDiv.Helpers.HTML("<i class='ffa-lg fa-fw pull-left'></i>");
                                              CardTitleDiv.Helpers.HTML().Heading5("Watched Recently");
                                          }
                                          //filter for hiding
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
                                              var RowContentDiv = ContentDiv.Helpers.DivC("row");
                                              {

                                                  // Show If No Movies Watched
                                                  var ColContentDiv = RowContentDiv.Helpers.DivC("col-md-12");
                                                  {
                                                      ColContentDiv.AddBinding(Singular.Web.KnockoutBindingString.visible, c => ViewModel.FoundUserMoviesInd == false);
                                                      // Place Content Here
                                                      ColContentDiv.Helpers.HTML("<p>[ You have not watched any movies, follow the link below to browse available movies. ]</p>");

                                                      // Browse Movies Button
                                                      var BroweseBtn = ColContentDiv.Helpers.Button("Browse Movies", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                      {
                                                          BroweseBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "BrowseMovies()");
                                                          BroweseBtn.AddClass("btn btn-primary btn-outline");
                                                      }
                                                  }

                                                  // Show if Movies Watched USe Knockout Binding and Property on ViewModel
                                                  var MovieColContentDiv = RowContentDiv.Helpers.DivC("col-md-12");
                                                  {
                                                      MovieColContentDiv.AddBinding(Singular.Web.KnockoutBindingString.visible, c => ViewModel.FoundUserMoviesInd == true);

                                                      var MovieColContainer = MovieColContentDiv.Helpers.DivC("movies-container");
                                                      {
                                                          var MoviesWatchedDiv = MovieColContainer.Helpers.ForEach<MELib.Movies.UserMovie>(c => c.UserMovieList);
                                                          {

                                                              // Using Knockout Binding
                                                              // <img width="16px" height="16px" data-bind="attr:{src: imagePath}" />
                                                              MoviesWatchedDiv.Helpers.HTML("<div class='movie-item'>");
                                                              MoviesWatchedDiv.Helpers.HTML("<img data-bind=\"attr:{src: $data.MovieImageURL()} \" class='movie-border'/>");
                                                              MoviesWatchedDiv.Helpers.HTML("<b><span data-bind=\"text: $data.MovieTitle() \"  class='caption'></span></b>");
                                                              // MoviesWatchedDiv.Helpers.HTML("<span data-bind=\"text: $data.MovieGenreID() \"  class='caption'></span>");

                                                          }
                                                          var WatchBtn = MoviesWatchedDiv.Helpers.Button("Watch Now", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                          {
                                                              WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.text, c => "Watch Again");
                                                              WatchBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "RentMovie($data)");
                                                              WatchBtn.AddClass("btn btn-primary btn-outline margin-top-10");
                                                          }
                                                          MoviesWatchedDiv.Helpers.HTML("</div>");
                                                      }
                                                      var MoviPaginationColContainer = MovieColContentDiv.Helpers.DivC("pagination-container");
                                                      {
                                                      }
                                                  }
                                              }

                                          }
                                      }
                                  }
                                  var RowCol = Row.Helpers.DivC("col-md-3");
                                  {

                                      var CardDiv = RowCol.Helpers.DivC("ibox float-e-margins paddingBottom");
                                      {
                                          var CardTitleDiv = CardDiv.Helpers.DivC("ibox-title");
                                          {
                                              CardTitleDiv.Helpers.HTML("<i class='fa-lg fa-fw pull-left'></i>");
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
                                          var ContentDiv = CardDiv.Helpers.DivC("ibox-content");
                                          {
                                              var RowContentDiv = ContentDiv.Helpers.DivC("row");
                                              {
                                                  var LeftColContentDiv = RowContentDiv.Helpers.DivC("col-md-12 text-center");
                                                  {
                                                      var Profile = LeftColContentDiv.Helpers.HTML("<div class='circlecenter'><div class='circlecontaineruser circlecenter'><span class='fa fa-user fa-lg fa-fw' style='font-size:64px;'></span></div></div>");
                                                      {

                                                      }
                                                      //   var UserDetails = LeftColContentDiv.Helpers.With<MELib.RO.ROUserList>(x => x.);
                                                      var ProfileTypeDiv = LeftColContentDiv.Helpers.With<MELib.AccountType.AccountType>(b => b.AccountType);
                                                      LeftColContentDiv.Helpers.DivC("row");
                                                      var Profilee = LeftColContentDiv.Helpers.With<MELib.RO.ROUser>(a => a.Users);
                                                      LeftColContentDiv.Helpers.DivC("row");

                                                      var ProfileDiv = LeftColContentDiv.Helpers.With<MELib.Accounts.Account>(c => c.Account);
                                                      {
                                                          // ProfileDiv.Helpers.EditorFor(c => c.Balance);
                                                          // var ProfileText = ProfileDiv.Helpers.HTML("<div></div>");
                                                          //ProfileText.AddBinding(Singular.Web.KnockoutBindingString.disable, c => ViewModel.PageAssessorControlsDisabledInd != true);

                                                          // UserDetails.Helpers.Span(x => x.);
                                                          // Place Content Here
                                                          Profilee.Helpers.Span(a => "Full Names: " + a.FirstName).Style.FontSize="25px";
                                                          Profilee.Helpers.Span(a => a.LastName).Style.FontSize="25px";
                                                          // LeftColContentDiv.Helpers.HTML("<h1></h1>");
                                                          //LeftColContentDiv.Helpers.HTML("<h2>{ Full Name }</h2>");
                                                          //LeftColContentDiv.Helpers.HTML("<p>{ Account Type }</p>");
                                                          ProfileDiv.Helpers.Span(b => "R"+b.Balance).Style.FontSize = "25px";
                                                          //LeftColContentDiv.Helpers.DivC("br");
                                                          //LeftColContentDiv.Helpers.DivC("row");
                                                          ProfileTypeDiv.Helpers.Span(b =>"Account Type: " + b.AccountTypeName).Style.FontSize="25px";
                                                          //ProfileDiv.Helpers.Span(c => c.AccountType);
                                                          //LeftColContentDiv.Helpers.DivC("row");
                                                      }
                                                      /*var ProfileTypeDiv = LeftColContentDiv.Helpers.With<MELib.AccountType.ROAccountType>(c => c.UserAccountType);
                                                      {
                                                          ProfileTypeDiv.Helpers.Span(c => c.AccountType);
                                                      }*/
                                                  }
                                                  var RightColContentDiv = RowContentDiv.Helpers.DivC("col-md-12 text-center");
                                                  {
                                                      // Fund Account Button
                                                      var FundAccountBtn = RightColContentDiv.Helpers.Button("Deposit Funds", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                      {
                                                          FundAccountBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "DepositFunds($data)");
                                                          FundAccountBtn.AddClass("btn btn-primary btn-outline");
                                                      }
                                                      // Edit Profile
                                                      var EditProfileBtn = RightColContentDiv.Helpers.Button("Edit Profile", Singular.Web.ButtonMainStyle.NoStyle, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                                      {
                                                          EditProfileBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "EditProfile()");
                                                          EditProfileBtn.AddClass("btn btn-primary btn-outline");
                                                      }
                                                  }
                                              }
                                          }
                                      }
                                  }
                              }
                          }
                          //var ContainerTab = AssessmentsTab.AddTab("Fruits Available");
                          //{
                          //    var RowContentDiv1 = ContainerTab.Helpers.DivC("row");
                          //    {
                          //        var ColContentDiv = RowContentDiv1.Helpers.DivC("col-md-9");
                          //        {
                          //            var FruitsCategoriesDiv = ColContentDiv.Helpers.BootstrapTableFor<MELib.Categories.Category>((c) => c.UserCategoryList,false,false, "");
                          //            {
                          //                var First = FruitsCategoriesDiv.FirstRow;
                          //                {
                          //                    var FruitsTittle = First.AddColumn("Products Categories");
                          //                    {
                          //                        FruitsTittle.Helpers.Span(c => c.CategoryName);
                          //                    }
                          //                }
                          //            }
                          //        }

                          //        var RowColRight = RowContentDiv1.Helpers.DivC("col-md-3");
                          //        {
                          //            var CardDiv = RowColRight.Helpers.DivC("ibox float-e-margins paddingBottom");
                          //            {
                          //                var CardTittleDv = CardDiv.Helpers.DivC("ibox-tittle");
                          //                {
                          //                    CardDiv.Helpers.HTML("<i class ='ffa-lg fa-fw pull-left'></i>");
                          //                    CardDiv.Helpers.HTML().Heading5("Search Products");
                          //                }
                          //                var CardTittleTool = CardTittleDv.Helpers.DivC("ibox-tools");
                          //                {
                          //                    var aToolsTag = CardTittleTool.Helpers.HTMLTag("a");
                          //                    aToolsTag.AddClass("collapse-link");
                          //                    {
                          //                        var iToolsTag = aToolsTag.Helpers.HTMLTag("i");
                          //                        iToolsTag.AddClass("fa fa-chevron-up");
                          //                    }
                          //                }
                          //                var ContentDiv = CardDiv.Helpers.DivC("obox-content");
                          //                {
                          //                    var RightRowContentDiv = ContentDiv.Helpers.DivC("row");
                          //                    {
                          //                        var RightColContentDiv = RightRowContentDiv.Helpers.DivC("col-md-12");
                          //                        {
                          //                            RightRowContentDiv.Helpers.LabelFor(c => ViewModel.UserCategoryList);

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
  <!-- Place your JavaScript in a file e.g. '../Scripts/home.js' and include it in the header section of each page  -->
  <script type="text/javascript">
      // On page load
      Singular.OnPageLoad(function () {
          $("#menuItem0").addClass("active");
      });

      var RentMovie = function () {
          window.location = '../Movies/Movies.aspx';
      }

      var DepositFunds = function () {
          window.location = '../Profile/DepositFunds.aspx';
      }

  </script>
</asp:Content>


