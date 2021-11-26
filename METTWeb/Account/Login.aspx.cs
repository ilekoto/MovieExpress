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
  public partial class Login: MEPageBase<LoginVM>
  {
  }

  public class LoginVM: MEStatelessViewModel<LoginVM>
  {
    /// <summary>
    /// The login details
    /// </summary>
    public LoginDetails LoginDetails { get; set; }
		public MELib.User.UserList UserList { get; set; }
		public MELib.User.User User { get; set; }

    /// <summary>
    /// The location to redirect to after login
    /// </summary>
    public string RedirectLocation { get; set; }
		public string RedirectLocation1 { get; set; }
		public bool ShowForgotPasswordInd { get; set; }
		//public bool ShowForgotPasswordInd1 { get; set; }

		[Display(Name = "Enter your email address", Description = "")]
		public string ForgotEmail { get; set; }
    /// <summary>
    /// Setup the Login ViewModel
    /// </summary>
    protected override void Setup()
    {
      base.Setup();

      this.LoginDetails = new LoginDetails();
	  this.ShowForgotPasswordInd = false;
	  //this.ShowForgotPasswordInd1 = false;
	  this.ValidationMode = ValidationMode.OnSubmit;
      this.ValidationDisplayMode = ValidationDisplayMode.Controls;

      this.RedirectLocation = VirtualPathUtility.ToAbsolute(Security.GetSafeRedirectUrl(Page.Request.QueryString["ReturnUrl"], "~/default.aspx"));
			//this.RedirectLocation1 = VirtualPathUtility.ToAbsolute(Security.GetSafeRedirectUrl(Page.Request.QueryString["ReturnUrl"], "~/Account/Reg.aspx"));

		}

		/// <summary>
		/// Check the login details
		/// </summary>
		/// <param name="loginDetails">Login details</param>
		/// <returns>True if the login details are valid</returns>
		[WebCallable(LoggedInOnly = false)]
		public Result Login(LoginDetails loginDetails)
		{
			Result ret = new Result();

			try
			{
				MEIdentity.Login(loginDetails);
				ret.Success = true;
				if(MEWebSecurity.CurrentIdentity().FirstTimeLogin)
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

		[WebCallable(LoggedInOnly = false)]
		public Result ResetPassword(string Email)
		{
			Result ret = new Result();
			try
			{
				MELib.Security.User.ResetPassword(Email);
				ret.Success = true;
			}
			catch (Exception ex)
			{
				ret.Success = false;
				ret.ErrorText = ex.Message;
			}
			return ret;
		}

		[WebCallable]

		public Result Register(MELib.User.User UserList)
        {
			Result sr = new Result();

			MELib.User.User User = new MELib.User.User();
			MELib.User.UserList temp = new MELib.User.UserList();


			User.UserName = UserList.UserName;
			User.FirstName = UserList.FirstName;
			User.LastName = UserList.LastName;
			User.Password = UserList.Password;
			User.EmailAddress = UserList.EmailAddress;
			User.ContactNumber = UserList.ContactNumber;
			temp.Add(User);
			if (temp.IsValid)
			{
				var SaveResult = temp.TrySave();
				if (SaveResult.Success)
				{
					sr.Data = SaveResult.SavedObject;
					sr.Success = true;
				}
				else
				{
					sr.ErrorText = SaveResult.ErrorText;
					sr.Success = false;
				}
			}

			return sr;
		}

		//[WebCallable]
		// public Result Register(MELib.User.UserList UserList)
  //      {
		//	Result sr = new Result();
  //          try
  //          {
		//		var User = MELib.User.User.NewUser();
  //              //User.FirstName = 
  //              foreach (var item in UserList)
  //              {
		//			User.UserName = item.UserName;
		//			User.FirstName = item.FirstName;
		//			User.LastName = item.LastName;
		//			User.Password = item.Password;
		//			User.EmailAddress = item.EmailAddress;
		//			User.ContactNumber = item.ContactNumber;
		//			User.TrySave(typeof(MELib.User.UserList));

		//			sr.Success = true;
				
  //              }
		//		return sr;
		//	}
		//	catch(Exception e)
  //          {

  //          }
		//	return sr;
	//	}
	}
}
