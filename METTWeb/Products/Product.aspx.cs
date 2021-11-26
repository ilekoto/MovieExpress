using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MELib;
using Singular.Web;
using System.ComponentModel.DataAnnotations;


namespace MEWeb.Products
{
    public partial class Product : MEPageBase<ProductVM>
    {
    }

    public class ProductVM : MEStatelessViewModel<ProductVM>
    {

        public MELib.Categories.Category UserCategory { get; set; }
        public MELib.Categories.CategoryList UserCategoryList { get; set; }
        //public MELib.Products.ProductList ProductList { get; set; }
      // public MELib.RO.RO SubCategoryList { get; set; }
        public MELib.Products.ProductList ProductList { get; set; }
        public MELib.Products.Product UserProduct { get; set; }
        public MELib.RO.ROSubCategoryList ROSubCategoryList { get; set; }

        //public MELib
       //public MELib.pro
        public ProductVM()
        {

        }
        //[Display(Name = "Category Name", Description = " "),
        //Singular.DataAnnotations.DropDownWeb(typeof(MELib.Categories.CategoryList), Source = Singular.DataAnnotations.DropDownWeb.SourceType.All, UnselectedText = "Select Category", DisplayMember = "CategoryName", ValueMember = "CategoryID")]

        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.RO.ROSubCategoryList), UnselectedText = "Select", ValueMember = "SubCategoryID", DisplayMember = "SubCategoryName")]
        [Display(Name ="Products")]

        public int? SubCategoryID { get; set; }

        // SubCategoryID

        protected override void Setup()
        {
            base.Setup();

           // UserCategoryList = MELib.Categories.CategoryList.GetCategoryList();
            //ROSubCategoryList = MELib.RO.ROSubCategoryList.GetROSubCategoryList();
            // UserCategory = UserCategoryList.FirstOrDefault();
            ProductList = MELib.Products.ProductList.GetProductList(null,true);
            //UserProduct = UserProductList.FirstOrDefault();
          //SubCategoryList = MELib.Categories.SubCategoryList.GetSubCategoryList();
            
        }

       /* [WebCallable]
         public Result FilterProducts(int SubCategoryID, int ResetInd)
        {
            Result sr = new Result();
            try
            {
                if (Result == 0 )
                {

                }
            }
        }*/

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
            catch(Exception e)
            {
                WebError.LogError(e, "Page: Product.aspx | Method: FilterProducts", $"(int ROSubCategoryID, ({SubCategoryID})");
                sr.Data = e.InnerException;
                sr.ErrorText = "Could not filter movies by category.";
                sr.Success = false;
            }

            return sr;
        }
    }
}