using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web;
using MELib;

namespace MEWeb.Profile
{
  public partial class Profile : MEPageBase<ProfileVM>
  {
  }
    public class ProfileVM : MEStatelessViewModel<ProfileVM>
    {
        public MELib.Accounts.AccountList UserAccountList { get; set; }
        public MELib.Accounts.Account UserAccount { get; set; }

        public MELib.AccountType.AccountTypeList UserAccountTypeList { get; set; }
        public MELib.AccountType.AccountType UserAccountType { get; set; }
        public MELib.RO.ROUserList ReadUserList { get; set; }
        public MELib.RO.ROUser ROUser { get; set; }
        public int UserID { get; set; }

        // public MELib.AccountType.ROAccountType UserROAccoutType { get; set; }
        //  public MELib.AccountType.ROAccountTypeList UserROAccoutTypeList { get; set; }
        public MELib.Categories.SubCategoryList SubCategories { get; set; }
        // public MELib.AccountType.AccountType UserAccoutType { get; set; }
        //  public MELib.AccountType.AccountType UserAccoutTypeList { get; set; }
        public ProfileVM()
        {

        }
        protected override void Setup()
        {
            base.Setup();
            UserID = Singular.Security.Security.CurrentIdentity.UserID;

            UserAccountList = MELib.Accounts.AccountList.GetAccountList();
            UserAccount = UserAccountList.FirstOrDefault();
            UserAccountTypeList = MELib.AccountType.AccountTypeList.GetAccountTypeList();
            UserAccountType = UserAccountTypeList.FirstOrDefault();
            ReadUserList = MELib.RO.ROUserList.GetROUserList();
            ROUser = ReadUserList.FirstOrDefault();
           // SubCategories = MELib.Categories.SubCategoryList.GetSubCategoryList();
        }
    }
} 