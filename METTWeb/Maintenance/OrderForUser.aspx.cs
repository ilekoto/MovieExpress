using Singular;
using Singular.Web;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MEWeb.Maintenance
{
    public partial class OrderForUser : MEPageBase<OrderForUserVM>
    {

    }

    public class OrderForUserVM : MEStatelessViewModel<OrderForUserVM>
    {
        public MELib.Products.ProductList ProductList { get; set; }
        public MELib.Products.Product Product { get; set; }
        public decimal TotalPrices { get; set; }
        public decimal TotalRefresh { get; set; }
        //public MELib.RO.ROUserList ROUserList { get; set; }
        //public MELib.RO.ROUser ROUser { get; set; }
        //public MELib.Products.DeliveryList DeliveryList { get; set; }
        //public MELib.Products.Delivery Delivery { get; set; }



        public MELib.Carts.CartList CartList { get; set; }
        public string Quantity { get; set; }

        public int UserId;
        public OrderForUserVM()
        {

        }
        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.RO.ROSubCategoryList), UnselectedText = "Select", ValueMember = "SubCategoryID", DisplayMember = "SubCategoryName")]
        [Display(Name = "Products")]
        public int? SubCategoryID { get; set; }
        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.RO.ROUserList), UnselectedText = "Select", ValueMember = "UserID", DisplayMember = "UserName")]
        [Display(Name = "Users")]
        public int? UserID { get; set; }
        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.Products.DeliveryTypeList), UnselectedText = "Select", ValueMember = "DeliveryTypeID", DisplayMember = "DeliiveryType")]
        [Display(Name = "Delivery")]
        public int? DeliveryTypeID { get; set; }
        protected override void Setup()
        {
            base.Setup();
            //ROUserList = MELib.RO.ROUserList.GetROUserList();
            //ROUser = ROUserList.FirstOrDefault();
            ProductList = MELib.Products.ProductList.GetProductList(null, true);
            CartList = MELib.Carts.CartList.GetCartList();

            foreach (var items in CartList)
            {
                TotalPrices += items.TotalPrice;
            }
        }
        [WebCallable]
        public Result FilterProducts(int SubCategoryID, int RestInd)
        {
            Result sr = new Result();
            try
            {
                if (RestInd == 0)
                {
                    MELib.Products.ProductList ProductList = MELib.Products.ProductList.GetProductList(SubCategoryID);
                    sr.Data = ProductList;

                }
                else
                {
                    MELib.Products.ProductList ProductList = MELib.Products.ProductList.GetProductList();
                    sr.Data = ProductList;
                }
                sr.Success = true;
            }
            catch (Exception e)
            {
                WebError.LogError(e, "Page: Product.aspx | Method: FilterProducts", $"(int ROSubCategoryID, ({SubCategoryID})");
                sr.Data = e.InnerException;
                sr.ErrorText = "Could not filter movies by category.";
                sr.Success = false;
            }

            return sr;
        }


        //[WebCallable(LoggedInOnly = true)]
        //public Result UserInfo(int UserID)
        //{



        //    Result sr = new Result();
        //    if (UserId > 0)
        //    {
        //        try
        //        {
        //            MELib.UserBasket.CartList myBasket = MELib.UserBasket.CartList.GetCartList(UserID);



        //            if (myBasket != null)
        //            {
        //                sr.Data = myBasket;
        //                // Total = Math.Round(MELib.Basket.BasketList.GetBasketList(UserId).Sum(x => x.TotalPrice), 2);
        //                sr.Success = true;
        //            }
        //            else
        //            {
        //                sr.ErrorText = "Please Add Items To Your Cart.";
        //                sr.Success = false;
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            ex.ToString();
        //        }
        //    }
        //    else
        //    {
        //        sr.ErrorText = "Please Select The User";
        //        sr.Success = false;
        //    }
        //    return sr;
        //}


        [WebCallable]

        public Result AddBasket(int ProductID, int UserID,  MELib.Products.Product Product)
        {
            Result sr = new Result();
            if (UserID > 0)
            {
                //MELib.Products.Product Product = ProductList.GetItem(ProductID);
                if (Product.ProductID != null)
                {

                    

                    MELib.Carts.CartList temp = new MELib.Carts.CartList();
                    MELib.Carts.Cart Cart =new MELib.Carts.Cart();


                    var CartList = MELib.Carts.CartList.GetCartList();
                    foreach (var item in CartList)
                    {
                        if (Product.ProductID == item.ProductID)
                        {
                            return new Singular.Web.Result() { ErrorText = "Item already exists in the Basket", Success = false };
                        }
                    }



                    // Product.Quantity
                    Cart.ProductID = Product.ProductID;
                    Cart.UserID = Settings.CurrentUser.UserID;

                    Cart.Quantity = Product.Quantity;
                    Cart.Price = Product.Price ;
                    Cart.TotalPrice = Cart.Quantity * Cart.Price;
                  
                    
                    temp.Add(Cart);


                    if (temp.IsValid)
                    {
                        var SaveResult = temp.TrySave();
                        if (SaveResult.Success)
                        {
                            sr.Data = SaveResult.SavedObject;
                            sr.Success = true;
                        }
                        else
                        {
                            sr.ErrorText = SaveResult.ErrorText;
                            sr.Success = false;
                        }
                    }
                }
                else
                {
                    sr.ErrorText = "Please, Try Again";
                    sr.Success = false;
                }
            }
            else
            {
                sr.ErrorText = "Please Select User.";
                sr.Success = false;
            }

            return sr;

        }

        [WebCallable]
        public Result SaveCartList(MELib.Carts.CartList CartList)
        {

            Result sr = new Result();
            var Products = MELib.Products.ProductList.GetProductList();
            if (CartList.IsValid)
            {
                foreach (var item in CartList)
                {

                    foreach (var items in Products)
                    {
                        if (item.ProductID == items.ProductID)
                        {
                            if (item.Quantity < items.Quantity)
                            {
                                item.TotalPrice = item.Price * item.Quantity;
                                sr.Success = true;
                            }
                            else
                            {
                                //sr.ErrorText = "There's no enough stock for " + items.ProductName;
                                return new Singular.Web.Result() { ErrorText = "There's no enough stock for " + items.ProductName, Success = false };

                            }
                        }
                    }
                }



                //foreach (var items in CartList)
                //{
                //	TotalPrices += items.TotalPrice;
                //}

                var SaveResult = CartList.TrySave();
                TotalRefresh = RefreshTotal(CartList);

                if (SaveResult.Success)
                {

                    sr.Data = CartList;
                    sr.Success = true;
                }
                else
                {
                    sr.ErrorText = SaveResult.ErrorText;
                    sr.Success = false;
                }
                return sr;
            }
            else
            {
                sr.ErrorText = CartList.GetErrorsAsHTMLString();
                return sr;
            }
            return sr;
        }

        public decimal RefreshTotal(MELib.Carts.CartList CartList)
        {
            foreach (var item in CartList)
            {
                TotalRefresh = item.TotalPrice;
            }


            return TotalRefresh;

        }

        [WebCallable]
        public Result CheckOutProductsList(decimal TotalPrices, int DeliveryTypeID, int UserID, MELib.Carts.CartList CartList)
        {
            Result sr = new Result();

            if (UserID > 0)
            {

                if (DeliveryTypeID > 0)
                {
                    try
                    {

                        var ProductList = MELib.Products.ProductList.GetProductList();
                 
                        var Account = MELib.Accounts.AccountList.GetAccountList(UserID).FirstOrDefault();
                       



                        MELib.Accounts.AccountList temp1 = MELib.Accounts.AccountList.GetAccountList(UserID);
                        MELib.UserBasket.CartList CartLists = MELib.UserBasket.CartList.GetCartList(UserID);
                        MELib.UserBasket.Cart myCart = CartLists.GetItem(UserID);

                      
                        var CheckOut = MELib.Carts.CheckOut.NewCheckOut();
                        var Delivery = MELib.Products.Delivery.NewDelivery();
                   
                        var Transaction = MELib.Accounts.Transaction.NewTransaction();

                        //CheckOutList temp = new CheckOutList();
                        MELib.Carts.Cart Cart = new MELib.Carts.Cart();
                        //CartList CartList = new CartList();
                        CheckOut.TempBalance = Account.Balance;

                        foreach (var item in CartList)
                        {
                            if (item.Quantity != null)
                            {
                                foreach (var items in ProductList)
                                {
                                    if (item.ProductID == items.ProductID)
                                    {
                                        if (item.Quantity < items.Quantity)
                                        {
                                            items.Quantity = items.Quantity - item.Quantity;

                                            if (item.UserID == Account.UserID)
                                            {
                                                if (TotalPrices < Account.Balance)
                                                {
                                                    Account.Balance = Account.Balance - TotalPrices;
                                                    Delivery.DeliveryTypeID = DeliveryTypeID;
                                                    Delivery.ProductID = (int)item.ProductID;
                                                    Delivery.UserID = UserID;
                                                    Delivery.TrySave(typeof(MELib.Products.DeliveryList));
                                                    sr.Success = true;
                                                }
                                                else
                                                {
                                                    sr.ErrorText = "You have insuficient fund";
                                                    sr.Success = false;
                                                }
                                                sr.Success = true;

                                            }

                                            items.TrySave(typeof(MELib.Products.ProductList));

                                            sr.Success = true;
                                        }
                                        else
                                        {
                                            sr.ErrorText = "There's no enough stock";
                                            sr.Success = false;
                                        }
                                        sr.Success = true;

                                    }
                                    else
                                    {
                                        //sr.ErrorText = "There's no enough stock";
                                        sr.Success = false;
                                    }

                                }



                            }
                            else
                            {
                                sr.ErrorText = "Unable ";
                                sr.Success = false;
                            }


                        }
                        CheckOut.UserID = UserID;
                        CheckOut.TotalPrice = TotalPrices;
                        CheckOut.CheckoutDate = DateTime.Now;
                        CheckOut.TrySave(typeof(MELib.Carts.CheckOutList));

                        Transaction.TransactionTypeID = 1;
                        Transaction.UserID = UserID;
                        Transaction.Amount = TotalPrices;
                        Transaction.IsActiveInd = true;
                        Transaction.TrySave(typeof(MELib.Accounts.TransactionList));

                        Account.UserID = Settings.CurrentUser.UserID;
                        Account.Balance = Account.Balance;
                        Account.TrySave(typeof(MELib.Accounts.AccountList));


                        return sr;

                    }
                    catch (Exception e)
                    {

                    }
                }
                else
                {
                    sr.ErrorText = "Please Select Delivery Option.";
                    sr.Success = false;
                }
                
                }
            else
            {
                sr.ErrorText = "Please Select User.";
                sr.Success = false;
            }
            return sr;
        }



    }
}