using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;
using System.ComponentModel.DataAnnotations;
using MELib.Carts;
using Singular;

namespace MEWeb.Products
{
    public partial class AllProducts : MEPageBase<AllProductsVM>
    {

    }

    public class AllProductsVM : MEStatelessViewModel<AllProductsVM>
    {
        public MELib.Products.ProductList ProductList { get; set; }
        public MELib.Products.Product Product { get; set; }

        public MELib.Carts.CartList CartList { get; set; }
        public string Quantity { get; set; }
        public int UserId;

        public AllProductsVM()
        {

        }
        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.RO.ROSubCategoryList), UnselectedText = "Select", ValueMember = "SubCategoryID", DisplayMember = "SubCategoryName")]
        [Display(Name = "Products")]

        public int? SubCategoryID { get; set; }
        protected override void Setup()
        {
            base.Setup();
            ProductList = MELib.Products.ProductList.GetProductList(null, true);
            CartList = MELib.Carts.CartList.GetCartList();
            //CartList = MELib.Carts.CartList.GetCartList();
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
       

        //AddBasket
        [WebCallable]

        public Result AddBasket(int ProductID, MELib.Products.Product Product)
        {
            Result sr = new Result();

            //MELib.Products.Product Product = ProductList.GetItem(ProductID);
            if (Product.ProductID != null)
            {

                MELib.Carts.Cart Cart = new MELib.Carts.Cart();
                CartList temp = new CartList();

                var CartList = MELib.Carts.CartList.GetCartList();
                foreach (var item in CartList)
                {
                    if(Product.ProductID == item.ProductID)
                    {
                        return new Singular.Web.Result() { ErrorText = "Item already exists in the Basket", Success = false };
                    }
                }

             

                // Product.Quantity
                Cart.ProductID = Product.ProductID;
                Cart.UserID = Settings.CurrentUser.UserID;

                Cart.Quantity = 0;
                Cart.Price = Product.Price;
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
                sr.ErrorText = "Aowa, Try Again";
                sr.Success = false;
            }

            return sr;

        }   
                   
    }
}