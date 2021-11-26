using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;

namespace MEWeb.Profile
{
  public partial class Transactions : MEPageBase<TransactionsVM>
  {
  }
  public class TransactionsVM : MEStatelessViewModel<TransactionsVM>
  {

        public MELib.Accounts.TransactionList TransactionsList { get; set; }

        public MELib.Accounts.Transaction Transaction { get; set; }
        public MELib.Products.DeliveryList DeliveryList { get; set; }
        public MELib.Products.Delivery Delivery { get; set; }
        public int UserID { get; set; }
        //public int DeliveryTypeID { get; set; }
        public TransactionsVM()
        {

        }
        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.Accounts.TransactionTypeList), UnselectedText = "Select", ValueMember = "TransactionTypeID", DisplayMember = "TransactionTypeName")]
        [Display(Name = "TransactionsType")]
        public int? TransactionTypeID { get; set; }
        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.Products.DeliveryTypeList), UnselectedText = "Select", ValueMember = "DeliveryTypeID", DisplayMember = "DeliiveryType")]
        [Display(Name = "DeliveryType")]
        public int? DeliveryTypeID { get; set; }
        protected override void Setup()
        {
            base.Setup();
            UserID = Singular.Security.Security.CurrentIdentity.UserID;
            TransactionsList = MELib.Accounts.TransactionList.GetTransactionList(Singular.Security.Security.CurrentIdentity.UserID);
            Transaction = TransactionsList.FirstOrDefault();
            DeliveryList = MELib.Products.DeliveryList.GetDeliveryList();
            Delivery = DeliveryList.GetItem(UserID);

        }
        [WebCallable]
        public Result FilterTransaction(int TransactionTypeID, int RestInd)
        {
            Result sr = new Result();
            try
            {
                if (RestInd == 0)
                {
                    MELib.Accounts.TransactionList TransactionList = MELib.Accounts.TransactionList.GetTransactionList1(TransactionTypeID);//MELib.Products.ProductList.GetProductList(SubCategoryID);
                    sr.Data = TransactionList;

                }
                else
                {
                    MELib.Accounts.TransactionList TransactionList = MELib.Accounts.TransactionList.GetTransactionList();
                    sr.Data = TransactionList;
                }
                sr.Success = true;
            }
            catch (Exception e)
            {
                WebError.LogError(e, "Page: Transactions.aspx | Method: FilterTransaction", $"(int TransactionTypeID, ({TransactionTypeID})");
                sr.Data = e.InnerException;
                sr.ErrorText = "Could not filter transaction by category.";
                sr.Success = false;
            }

            return sr;
        } 
        
        [WebCallable]
        public Result FilterDelivery(int DeliveryTypeID, int RestInd)
        {
            Result sr = new Result();
            try
            {
                if (RestInd == 0)
                {
                    MELib.Products.DeliveryList DeliveryList = MELib.Products.DeliveryList.GetDeliveryList1(DeliveryTypeID);//MELib.Products.ProductList.GetProductList(SubCategoryID);
                    sr.Data = DeliveryList;

                }
                else
                {
                    MELib.Products.DeliveryList DeliveryList = MELib.Products.DeliveryList.GetDeliveryList();
                    sr.Data = DeliveryList;
                }
                sr.Success = true;
            }
            catch (Exception e)
            {
                WebError.LogError(e, "Page: Transactions.aspx | Method: FilterTransaction", $"(int TransactionTypeID, ({TransactionTypeID})");
                sr.Data = e.InnerException;
                sr.ErrorText = "Could not filter transaction by category.";
                sr.Success = false;
            }

            return sr;
        }
    }
}

