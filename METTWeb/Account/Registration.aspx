<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MEWeb.Account.Registration" %>
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
                          var HomeContainerTab = AssessmentsTab.AddTab("Registration");
                          {
                              var DetailsRow = HomeContainerTab.Helpers.DivC("row");
                              {
                                  var CardColumnOne = DetailsRow.Helpers.DivC("col-md-9");
                                  {
                                      //CardColumnOne.Helpers.HTML().Heading2("User Registration");

                                      h.MessageHolder();

                                      //var PersonalDetails = CardColumnOne.Helpers.DivC("row");

                                      var PersonalDetail = CardColumnOne.Helpers.With<MELib.User.User>((c) => c.UserList);
                                      {


                                          var UserName1 = PersonalDetail.Helpers.DivC("row");
                                          var UserName = PersonalDetail.Helpers.DivC("col-md-4 paddingTop24");
                                          {
                                              //UserName.Helpers.HTMLTag("label","<p>Username<p>");
                                              
                                            
                                          }

                                          //var BtnAdd = FirstRow.AddColumn();
                                          //{
                                          //    var ProductBtn = BtnAdd.Helpers.Button("Add to Backet", Singular.Web.ButtonMainStyle.Primary, Singular.Web.ButtonSize.Normal, Singular.Web.FontAwesomeIcon.None);
                                          //    {
                                          //        ProductBtn.AddBinding(Singular.Web.KnockoutBindingString.click, "AddBasket($data)");
                                          //        ProductBtn.AddClass("btn btn-primary btn-outline");
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

      }
      %>  

</asp:Content>
