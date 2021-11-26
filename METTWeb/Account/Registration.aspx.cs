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
    public partial class Registration : MEPageBase<RegistrationVM>
    {
        /*protected void Page_Load(object sender, EventArgs e)
        {

        }*/
    }
    public class RegistrationVM : MEStatelessViewModel<RegistrationVM>
    {
        public MELib.User.User User { get; set; }
        public MELib.User.UserList UserList { get; set; }

        protected override void Setup()
        {
            base.Setup();

            UserList = MELib.User.UserList.GetUserList();
            User = UserList.FirstOrDefault();
        }
    }

}