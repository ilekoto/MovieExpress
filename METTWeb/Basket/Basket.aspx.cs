using Singular.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MELib.Carts;
using MELib.Accounts;
using System.ComponentModel.DataAnnotations;
using Singular;

namespace MEWeb.Basket
{
    public partial class Basket : MEPageBase<BasketVM>
    {
       /* protected void Page_Load(object sender, EventArgs e)
        {

        }*/
    }

    public class BasketVM : MEStatelessViewModel<BasketVM>
    {
        public MELib.Products.ProductList ProductList { get; set; }
		public MELib.Products.Product Product { get;set; }
        public MELib.Carts.CartList CartList { get; set; }
		//public MELib.Carts.CartList DeleteProd { get; set; }
	   Cart Cart { get; set; }
		public MELib.Accounts.AccountList AccountList { get; set; }
		public TransactionList TransactionsList { get; set; }
		public Transaction Transaction { get; set; }
		public MELib.Accounts.Account Account { get; set; }
		public MELib.Carts.CheckOutList CheckOutList { get; set; }
		public CheckOut CheckOut { get; set; }
        public int UserID { get; set; }
		public int ProductID { get; set; }
		public decimal TotalPrices { get; set; }
        public decimal TotalRefresh { get; set; }

		

        public BasketVM()
        {

        }
		[Singular.DataAnnotations.DropDownWeb(typeof(MELib.Products.DeliveryTypeList), UnselectedText = "Select", ValueMember = "DeliveryTypeID", DisplayMember = "DeliiveryType")]
		[Display(Name = "Delivery")]
		public int? DeliveryTypeID { get; set; }
		/*[Singular.DataAnnotations(typeof(MELib.Products.ProductList), ValueMember = "ProductID", DisplayMember = "ProductName")]
		[Display(Name = "Products Name")]*/

		protected override void Setup()
        {
            base.Setup();
            UserID = Singular.Security.Security.CurrentIdentity.UserID;

			ProductList = MELib.Products.ProductList.GetProductList();
			Product = ProductList.FirstOrDefault();
			CheckOutList = CheckOutList.GetCheckOutList();
			CheckOut = CheckOutList.FirstOrDefault();
           // CartList = MELib.Carts.CartList.GetCartList(UserID);
			//CartList = MELib.Carts.CartList.GetCartList(ProductID);
			CartList = CartList.GetCartList(UserID);
			Cart = CartList.FirstOrDefault();

			
			AccountList = MELib.Accounts.AccountList.GetAccountList();
			Account = AccountList.FirstOrDefault();

			foreach (var items in CartList)
			{
				TotalPrices += items.TotalPrice;
			}



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
						if(item.ProductID == items.ProductID)
                        {
							if (item.Quantity < items.Quantity)
                            {
								item.TotalPrice = item.Price * item.Quantity;
								sr.Success = true;
							}
							else
                            {
								//sr.ErrorText = "There's no enough stock for " + items.ProductName;
								return new Singular.Web.Result() { ErrorText = "There's no enough stock for " + items.ProductName , Success = false};

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

		public decimal RefreshTotal(CartList CartList)
        {
            foreach (var item in CartList)
            {
				TotalRefresh = item.TotalPrice;
			}
			

			return TotalRefresh;
        }

		[WebCallable]
		public Result CheckOutProductsList(decimal TotalPrices, int DeliveryTypeID, CartList CartList)
        {
			Result sr = new Result();
			try
            {

				var ProductList = MELib.Products.ProductList.GetProductList();
				var Product = ProductList.FirstOrDefault();
				var Account = MELib.Accounts.AccountList.GetAccountList(Singular.Security.Security.CurrentIdentity.UserID).FirstOrDefault();
				//var DeleteProd = MELib.Carts.CartList.GetCartList().;
				//var Account = AccountList.FirstOrDefault();
				//var Transaction = MELib.Accounts.TransactionList.GetTransactionList();
				//MELib.Accounts.Transaction Transaction = new Transaction();
				//TransactionList temps = new TransactionList();
				//MELib.Accounts.Account Accounts = new MELib.Accounts.Account();;



				MELib.Accounts.AccountList temp1 = new MELib.Accounts.AccountList();
				CartList CartLists = new CartList();
					//CheckOut CheckOut = new CheckOut();
				var CheckOut = MELib.Carts.CheckOut.NewCheckOut();
				var Delivery = MELib.Products.Delivery.NewDelivery();
				//var DeliveryType = MELib.Products.DeliveryTypeList.GetDeliveryTypeList(Singular.Security.Security.CurrentIdentity.UserID);
				//var Acccount = MELib.Accounts.AccountList.GetAccountList();
				var Transaction = MELib.Accounts.Transaction.NewTransaction();
			
				CheckOutList temp = new CheckOutList();
                Cart Cart = new Cart();
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
								if(item.Quantity < items.Quantity)
                                {
									items.Quantity = items.Quantity - item.Quantity;
									
									if (item.UserID == Account.UserID)
                                    {
										if(TotalPrices < Account.Balance)
                                        {
											Account.Balance = Account.Balance - TotalPrices;
											Delivery.DeliveryTypeID = DeliveryTypeID;
											Delivery.ProductID = (int)item.ProductID;
											Delivery.UserID = Settings.CurrentUser.UserID;
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

                            }
							
						}

						

					}
                    else
                    {
						sr.ErrorText = "Unable ";
						sr.Success = false;
					}


				}


				CheckOut.UserID = Settings.CurrentUser.UserID;
				CheckOut.TotalPrice = TotalPrices;
				CheckOut.CheckoutDate = DateTime.Now;
				CheckOut.TrySave(typeof(MELib.Carts.CheckOutList));

				Transaction.TransactionTypeID = 1;
				Transaction.UserID = Settings.CurrentUser.UserID;
				Transaction.Amount = TotalPrices;
				Transaction.IsActiveInd = true;
				Transaction.TrySave(typeof(MELib.Accounts.TransactionList));

				Account.UserID = Settings.CurrentUser.UserID;
				Account.Balance = Account.Balance;
				Account.TrySave(typeof(MELib.Accounts.AccountList));

                foreach (var item in CartList)
                {
					if(item.UserID == Settings.CurrentUser.UserID)
                    {
						Singular.CommandProc cmd = new Singular.CommandProc("[DelProcs].[delCart]", new string[] { "@CartsID" }, new object[] { item.CartsID });
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.FetchType = Singular.CommandProc.FetchTypes.DataSet;
                        cmd = cmd.Execute();

                    }
				}
				//if(Cart.UserID == Settings.CurrentUser.UserID)
    //            {
				//	Singular.CommandProc cmd = new Singular.CommandProc("[DelProcs].[delCart]", new string[] { "@CartsID" }, new object[] { Cart.CartsID });
				//	cmd.CommandType = System.Data.CommandType.StoredProcedure;
				//	cmd.FetchType = Singular.CommandProc.FetchTypes.DataSet;
				//	cmd = cmd.Execute();
				//}
                
                var CartListss = MELib.Carts.CartList.GetCartList();

                return sr;

			}
			catch (Exception e)
            {

            }
			//Cart Cart = new Cart();

			//CartList.GetDeletedList(Settings);

			//Cart.TrySave(typeof(MELib.Carts.CartList));


			return sr;
        }
		/*[WebCallable]
		public Result CheckOutProductsList(CheckOutList CheckOutList, AccountList AccountList, TransactionList TransactionList )
        {
			Result sr = new Result();

            try
            {
				var CurrentUser = Singular.Security.Security.CurrentIdentity.UserID;
				MELib.Carts.CartList UserID = MELib.Carts.CartList.GetCartList(CurrentUser);
				CheckOut CheckOut = new CheckOut();
				CheckOutList temp = new CheckOutList();

	

				if (UserID != null)
                {
					if()
                }
			}

			

        }*/


	}
}