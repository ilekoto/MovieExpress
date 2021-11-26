using System.Web;
using System.Web.UI;
using Singular.Web;
using Singular.Web.Security;
using MELib.Security;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System;
using System.Linq;

namespace MEWeb.Account
{
    public partial class Reg : MEPageBase<RegVM>
    {
  
    }

    public class RegVM:MEStatelessViewModel<RegVM>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public MELib.User.UserList UserList { get; set; }
        public MELib.User.User User { get; set; }
        //public bool ShowForgotPasswordInd1 { get; set; }

        protected override void Setup()
        {
            base.Setup();
            UserList = MELib.User.UserList.GetUserList();
            User = UserList.FirstOrDefault();
        }

        [WebCallable]
        public Result Register(LoginDetails loginDetails)
        {
            Result ret = new Result();
            //var 

            try
            {
                MEIdentity.Login(loginDetails);
                ret.Success = true;
                if (MEWebSecurity.CurrentIdentity().FirstTimeLogin)
                {
                    ret.Data = "ChangePassword.aspx";
                }
            }
            catch
            {
                ret.ErrorText = "";
                ret.Success = false;
            }

            return ret;
        }

        [WebCallable]
        public Result Register(string Username, Byte[] FirstName, Byte[] LastName, Byte[] Password, string EmailAddress, string ContactNumber )
        {
            Result sr = new Result();
            try
            {
                var NewUser = MELib.User.User.NewUser();


                foreach (var item in UserList)
                {
                    NewUser.FirstName = FirstName;
                    NewUser.LastName = LastName;
                    NewUser.UserName = Username;
                    NewUser.Password = Password;
                    NewUser.EmailAddress = EmailAddress;
                    NewUser.ContactNumber = ContactNumber;
                    NewUser.TrySave(typeof(MELib.User.UserList));
                    sr.Success = true;
                }

            }
            catch(Exception e)
            {

            }
            return sr;

        }
    }
}