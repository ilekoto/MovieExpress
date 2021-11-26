using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular;
using Singular.Web;
using MELib.Accounts;

namespace MEWeb.Profile
{
    public partial class DepositFunds : MEPageBase<DepositFundsVM>
    {
    }
    public class DepositFundsVM : MEStatelessViewModel<DepositFundsVM>
    {
        public MELib.Accounts.AccountList AccountList { get; set; }
        public MELib.Accounts.Account Account { get; set; }
        public DepositFundsVM()
        {

        }
        protected override void Setup()
        {
            base.Setup();

            AccountList = MELib.Accounts.AccountList.GetAccountList(Singular.Security.Security.CurrentIdentity.UserID);
            Account = AccountList.FirstOrDefault();
        }

        [WebCallable]
        public static Singular.Web.Result SaveBalance(AccountList Account)
        {
            var newBalance = MELib.Accounts.AccountList.GetAccountList(Singular.Security.Security.CurrentIdentity.UserID).FirstOrDefault();
            newBalance.UserID = Singular.Security.Security.CurrentIdentity.UserID;

            String AmountAsString = Account.FirstOrDefault().Balance.ToString();
            if (AmountAsString.All(char.IsDigit))
            {
                newBalance.Balance += Account.FirstOrDefault().Balance;
                newBalance.TrySave(typeof(AccountList));



                return new Singular.Web.Result() { Success = true };
            }
            else
            {
                return new Singular.Web.Result() { ErrorText = "The letters are not allowed", Success = false };
            }



        }
    }
}

