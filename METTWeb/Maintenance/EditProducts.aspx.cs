    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;

namespace MEWeb.Maintenance
{
    public partial class EditProducts : MEPageBase<EditProductsVM>
    {

    }
    public class EditProductsVM : MEStatelessViewModel<EditProductsVM>
    {
       /* protected void Page_Load(object sender, EventArgs e)
        {

        }*/

        public MELib.Products.ProductList ProductList { get; set; }

        public EditProductsVM()
        {

        }

        protected override void Setup()
        {
            base.Setup();
            ProductList = MELib.Products.ProductList.GetProductList();
        }

        [WebCallable]
        public Result SaveProductList(MELib.Products.ProductList ProductList)
        {
            Result sr = new Result();
            if (ProductList.IsValid)
            {
                var SaveResult = ProductList.TrySave();
                if(SaveResult.Success)
                {
                    sr.Data = SaveResult.SavedObject;
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
                sr.ErrorText = ProductList.GetErrorsAsHTMLString();
                return sr;
            }
        }
    }
}