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
    public partial class FundUser : MEPageBase<FundUserVM>
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}
    }
    public class FundUserVM : MEStatelessViewModel<FundUserVM>
    {
        public FundUserVM()
        {

        }
        [Singular.DataAnnotations.DropDownWeb(typeof(MELib.RO.ROUserList), UnselectedText = "Select", ValueMember = "UserID", DisplayMember = "UserName")]
        [Display(Name = "Users")]
        public int? UserID { get; set; }
        public MELib.Accounts.AccountList AccountList { get; set; }
        public MELib.Accounts.Account Account { get; set; }

        protected override void Setup()
        {
            base.Setup();
            AccountList = MELib.Accounts.AccountList.GetAccountList();
            Account = AccountList.FirstOrDefault();
        }

        [WebCallable]
        public static Result SaveBalance(int UserID, MELib.Accounts.AccountList Account)
        {
            var newBalance = MELib.Accounts.AccountList.GetAccountList(UserID).FirstOrDefault();
            newBalance.UserID = UserID;

            String AmountAsString = Account.FirstOrDefault().Balance.ToString();
            if (AmountAsString.All(char.IsDigit))
            {
                newBalance.Balance += Account.FirstOrDefault().Balance;
                newBalance.TrySave(typeof(MELib.Accounts.AccountList));



                return new Singular.Web.Result() { Success = true };
            }
            else
            {
                return new Singular.Web.Result() { ErrorText = "The letters are not allowed", Success = false };
            }



        }
    }
}