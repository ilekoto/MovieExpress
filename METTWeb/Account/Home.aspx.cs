using System;
using Singular.Web;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Singular.Web.Data;
using MELib.RO;
using MELib.Security;
using Singular.Web;
using Singular;

namespace MEWeb.Account
{
    public partial class Home : MEPageBase<HomeVM>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
    public class HomeVM : MEStatelessViewModel<HomeVM>
    {
        // Declare your page variables/properties here
        public bool FoundUserMoviesInd { get; set; }

        public string LoggedInUserName { get; set; }

        public MELib.Movies.UserMovieList UserMovieList { get; set; }

        public MELib.Accounts.AccountList AccountList { get; set; }
        public MELib.Accounts.Account Account { get; set; }
        public MELib.AccountType.AccountType AccountType { get; set; }
        public MELib.AccountType.AccountTypeList AccountTypeList { get; set; }
        public MELib.Categories.Category UserCategory { get; set; }
        public MELib.Categories.CategoryList UserCategoryList { get; set; }
        public MELib.Security.ROUserPagedList ROUserPagedList { get; set; }
        public MELib.RO.ROUserList UserList { get; set; }
        public MELib.RO.ROUser Users { get; set; }
        //public MELib.Categories.
        public int UserID { get; set; }


        public HomeVM()
        {

        }

        protected override void Setup()
        {
            base.Setup();
            UserID = Singular.Security.Security.CurrentIdentity.UserID;

            // On page load initiate/set your data/variables and or properties here
            // Should pass in criteria for the specific user that is viewing the page, however using current identity
            UserMovieList = MELib.Movies.UserMovieList.GetUserMovieList();
            AccountList = MELib.Accounts.AccountList.GetAccountList();
            Account = AccountList.FirstOrDefault();
            AccountTypeList = MELib.AccountType.AccountTypeList.GetAccountTypeList(UserID);
            AccountType = AccountTypeList.FirstOrDefault();
            UserCategoryList = MELib.Categories.CategoryList.GetCategoryList();
            UserCategory = UserCategoryList.FirstOrDefault();
            UserList = MELib.RO.ROUserList.GetROUserList(UserID);
            Users = UserList.GetItem(UserID);

            //UserSubCategoryList = MELib.Categories.SubCategoryList.FetchList();
            //TypeAccount = MELib.AccountType.AccountTypeList.GetAccountTypeList();
            //UserAccountType = TypeAccount.FirstOrDefault();

            if (UserMovieList.Count() > 0)
            {
                FoundUserMoviesInd = true;
            }
            else
            {
                FoundUserMoviesInd = false;
            }


            LoggedInUserName = Singular.Security.Security.CurrentIdentity.UserName;
        }

        // Place your page's WebCallable methods here

        // Example WebCallable Method called GetSomeData layout/structure

        /// <summary>
        /// This is a very basic example of a WebCallable method
        /// </summary>
        /// <param name="SomeReferenceID"></param>
        /// <returns></returns>
        [Singular.Web.WebCallable(LoggedInOnly = true)]
        public static Singular.Web.Result GetSomeData(int SomeReferenceID)
        {
            Result sr = new Result();
            try
            {
                // Perform some action here and return the result
                // sr.Data = "";
                sr.Success = true;
            }
            catch (Exception e)
            {
                sr.Data = e.InnerException;
                sr.Success = false;
            }
            return sr;
        }
    }
}


